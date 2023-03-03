Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY5J4-0007lO-8x
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 08:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY5J0-0007k9-Ip
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 08:18:39 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY5Iy-0001Ch-0z
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 08:18:38 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so1239653wmq.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 05:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677849514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i04DfVNT3wWKNZazOpk4mHXgOMtB63hku687MDx0WG0=;
 b=sVI+MON0FWq6Gq3kwldHSn2Otdz21k9w8Z1Rrx8ue88L1SSwHkNQbmttlTDJcssdBc
 KMtrNFQIvwEA/fSNZAZGa4EphmObobgtuE4HcGuS9W7ExwLklr5gMEuIe1JP8yHgcjDJ
 s9up5iTe253BUr7AZ2Y/cNv5zvYpzpzDiQ7/7UXowad2ZmFJjJZExwCn3q2JPpWOpL3z
 KwO2ce+PZpBGzJB4dbUpqL/md6NH+NSIMTxMCrUj9xPna+l3zCQlgBS8cMy/HcoJdGJ4
 uOU1hHhy3ndx8XusACQb5w4Udao4oUXjz9OBLKf4JR9gljvjhqygHlsrVUMdVRzTAB+V
 kWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677849514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i04DfVNT3wWKNZazOpk4mHXgOMtB63hku687MDx0WG0=;
 b=pHSNlaUMa4/74u9GQTv1ywt6pLELkYrZqgleviTt7YQPhIBs6S7n8v66KTp4Haxsmd
 uEtnEQaeZtg9u3U/nRYGrxJoZfIuwSvz/M0qVXxRu53qx4yn7CALw+AHY1AknL7OoYYx
 lPppDkPIMJS3NbGJn3VlgzSgkrF3C+GWyX1tOT9EwUlQY1ogIc/p7w0v9hBlS5+h+oh0
 frXWC/X6t/xhS6GYtaQ1fdzdHJMn7hcVrF5PA7H4jVpC3wFcQpfIh1w3QK2WTJ7rzA3f
 xzk/wks7IQeA+OPpyWtw3thG5i5IMBYGsfnHjbz1QnILIR1oULDXFxFXMdodPt7GdzTE
 hrpg==
X-Gm-Message-State: AO0yUKVpRRFXtiLmiZEp9B/aQSRK1N5njDLkOVUhZzwrKL75MWbMmMXj
 FWbN24yb7EvlwFHTbogm5kRvaw==
X-Google-Smtp-Source: AK7set/7eGaDOpkxT9zm4hGt70Efm6Dh8AAq1gjRvTfyIs3YJeqKYioyYakuQvLGXAMHa+P8oxxL5w==
X-Received: by 2002:a1c:2b86:0:b0:3ea:ed4d:38ee with SMTP id
 r128-20020a1c2b86000000b003eaed4d38eemr1701504wmr.4.1677849514315; 
 Fri, 03 Mar 2023 05:18:34 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a1c2b03000000b003e9ae2a8cbfsm2684887wmr.2.2023.03.03.05.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 05:18:34 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v11 5/5] riscv: Correctly set the device-tree entry 'mmu-type'
Date: Fri,  3 Mar 2023 14:12:52 +0100
Message-Id: <20230303131252.892893-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303131252.892893-1-alexghiti@rivosinc.com>
References: <20230303131252.892893-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 13:18:39 -0000

The 'mmu-type' should reflect what the hardware is capable of so use the
new satp_mode field in RISCVCPUConfig to do that.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/virt.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 86c4adc0c9..59922d6965 100644
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
         cpu_phandle = (*phandle)++;
@@ -237,14 +238,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(ms->fdt, cpu_name);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_MMU)) {
-            qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
-                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
-        } else {
-            qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
-                                    "riscv,none");
-        }
+
+        satp_mode_max = satp_mode_max_from_map(
+                            s->soc[socket].harts[cpu].cfg.satp_mode.map);
+        sv_name = g_strdup_printf("riscv,%s",
+                                  satp_mode_str(satp_mode_max, is_32_bit));
+        qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type", sv_name);
+        g_free(sv_name);
+
         name = riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
-- 
2.37.2


