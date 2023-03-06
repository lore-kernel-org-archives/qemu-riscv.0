Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIwq-0006xM-M9
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwo-0006w1-GI
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:46 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwk-0006si-S0
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:46 -0500
Received: by mail-pl1-x62f.google.com with SMTP id ky4so12105916plb.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140280;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wlc9g6KD2LM0ddX3th0tOXGUo8tsCbK+gfNej91LZN4=;
 b=kZ70qK4zJde8jI/9dOyj4YJ7dNwAPEFNItH19wyCUC2uFNf1qi/GALtPqvm9esWCwe
 3YHbuYvzY6EediOjg9wJ0JzxdN2OQPwLad1sfUrmDpxjkOKAuLJSD9Ca+Um7K7nUdtZi
 eHKRUnLUEwNXeQ3FSJ0pV0+CcZvolJUKmNFQZfCqPGXu/qFoBxASVBrZ/a8uXbw1odlZ
 319iP6ZapOv13781YzSyGxV2D1rIxXWfba1esAMC+GmjO28FmOjcS7DmYVtxh1ooCZKJ
 UVgAI6lzWimlaEGbXYiBaqOETSr09besf92KoLE1w2C/Z28W7OHty0CinUz6byKP4dnr
 ldEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140280;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wlc9g6KD2LM0ddX3th0tOXGUo8tsCbK+gfNej91LZN4=;
 b=oS6I/gGjlqtVrlRvq3dekZPxYDlc3fGP+B4mz77I18UDH6GZ7vcz9f8l1f8kz/5SqR
 a7bBsAeGyQAXo737JjMKWOsgzVgwehlNRd3GYNvMSSMcZaRSdBAsfJa/St4kQvbI9Kfi
 8I+sOEJWIW7bjXqGlaEqeXJn3pPvjEP2PrLdIJTqBd27lH8L/JgKhxHLxwszq2WC9NP8
 lWHyj+vbmQV2LOS9gQ4AFMVze4YuVCdmkXKdb+QrgOjsokgNH5onZoNyMvzyjRE6smDS
 IgyjREeVAUPgm8swIffCRKnXuX2pt39WvkX+uDsIE7zK2EtCOjVG9J2Tn/K4gxspHwpS
 Issw==
X-Gm-Message-State: AO0yUKWuZuje9DkNorP4H9Wumr8pa9VIAYjhsQxnWHf7IruQTkF0Z70B
 NUldL1aofnRk4P8YLQZYrzm/P7COGt+oPwUJrnI=
X-Google-Smtp-Source: AK7set+JLV2xCpawa4aIXDHzdTpzNfS6IXHOKo2etX7cu4lVD+ka8xriYAoIOfEiLXEaDa6kv1ti7A==
X-Received: by 2002:a05:6a20:a111:b0:cc:7967:8a71 with SMTP id
 q17-20020a056a20a11100b000cc79678a71mr13162785pzk.59.1678140280479; 
 Mon, 06 Mar 2023 14:04:40 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 t13-20020aa7938d000000b0058837da69edsm6655813pfe.128.2023.03.06.14.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:40 -0800 (PST)
Subject: [PULL 14/22] riscv: Correctly set the device-tree entry 'mmu-type'
Date: Mon,  6 Mar 2023 14:02:51 -0800
Message-Id: <20230306220259.7748-15-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng@tinylab.org>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Mar 2023 22:04:46 -0000

From: Alexandre Ghiti <alexghiti@rivosinc.com>

The 'mmu-type' should reflect what the hardware is capable of so use the
new satp_mode field in RISCVCPUConfig to do that.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-ID: <20230303131252.892893-6-alexghiti@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/virt.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7f70fa11a1..26eb81d036 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -228,8 +228,9 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     int cpu;
     uint32_t cpu_phandle;
     MachineState *ms = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name;
+    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
     bool is_32_bit = riscv_is_32bit(&s->soc[0]);
+    uint8_t satp_mode_max;
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
         RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
@@ -239,13 +240,15 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(ms->fdt, cpu_name);
-        if (cpu_ptr->cfg.mmu) {
-            qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
-                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
-        } else {
-            qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
-                                    "riscv,none");
-        }
+
+        satp_mode_max = satp_mode_max_from_map(
+            s->soc[socket].harts[cpu].cfg.satp_mode.map);
+        sv_name = g_strdup_printf("riscv,%s",
+                                  satp_mode_str(satp_mode_max, is_32_bit));
+        qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type", sv_name);
+        g_free(sv_name);
+
+
         name = riscv_isa_string(cpu_ptr);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
-- 
2.39.2


