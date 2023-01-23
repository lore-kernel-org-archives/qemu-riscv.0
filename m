Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJsnd-0003O2-I7
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 04:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pJsnc-0003M9-Uo
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 04:07:32 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pJsnb-00043p-AX
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 04:07:32 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so7971184wms.4
 for <qemu-riscv@nongnu.org>; Mon, 23 Jan 2023 01:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/5AWbqkUXSO6IVcYGiFwyLrVtVuqKIPuREad5VJE/Q=;
 b=1ZCPfK+V8GyquhFPn2d7JW/BOFOW03tFdZP9VzGP3cFkiDvX9aM8j52d/4ptR+0d/G
 VFpxwgIoM2Ow11doOSk+Z/LZxhhTzADezs5ElfunjOgHpZ/UXeNSfl9MCzAZ4NyC3j55
 ugYsrf6ZyW26J/5bqpZ+azbHm/Zt1FiW7Oo2uswfiAcBjJSzuQTZW/s9dFBv1NpvsrTf
 7s2Z0m8mjb9THE4rXZjcVtm2RDKH6CYW5rNNw4vdDV611ZYwrUv5s5o5yCdO6Id5+Cbt
 zsLEcUgzqUEq6i9Rh7fuVngZ/vii5iqYMQivE8OSHmHoMpTRsSkNGM5s38QloBVR/zaI
 Bimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/5AWbqkUXSO6IVcYGiFwyLrVtVuqKIPuREad5VJE/Q=;
 b=JjhT/SAB7xxHO+4V+nDIQBEpl9H5tMt4r26jtbg3MkpVOZDm8gYoAxXNqwqsb8ijwj
 cG7K8hwtC9Iww9YSjcf+pDJxaChQm4Tv9VIwMNRqZ+fXetoos/s8w5xPJ0GMgTSA61Z8
 7WJ5AbxJUHPM5v/OR9sFHVGz17WON0Rpc4Q2rDd/0PVpjKdDitNeJs4mWFb/yZuERi4d
 0l3ybBqaEIOVWUUf0VrhBFSbmjDNSJlJB7q3e9zb+XUcHyBULtr90iRNDq5HqKLJ3Vvr
 xR3lKibS4HnXKCsHbmxNTXQU6dO3Ahk4eyI9lJG0J7vZKQmnuUYT1J4aCYgyCyMSzxFr
 pzQQ==
X-Gm-Message-State: AFqh2kq+MJ3bay0eqPzAUs7N7slBVeekajf/xTLvg8pQemshinFZCk64
 pcbvQ1xo1jULFqyV8EnIeoYSdg==
X-Google-Smtp-Source: AMrXdXuLTahU1SlgqVy1Rc+OyJ5cQfNwB+LyNEoM2FnfTFe9RLQuY1xqQXSQNtO+UTnVdkx0gf1c6A==
X-Received: by 2002:a1c:7315:0:b0:3d3:5a4a:9101 with SMTP id
 d21-20020a1c7315000000b003d35a4a9101mr31193406wmb.23.1674464849977; 
 Mon, 23 Jan 2023 01:07:29 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 n35-20020a05600c3ba300b003db12112fcfsm11356682wms.4.2023.01.23.01.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 01:07:29 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v6 4/5] riscv: Correctly set the device-tree entry 'mmu-type'
Date: Mon, 23 Jan 2023 10:03:23 +0100
Message-Id: <20230123090324.732681-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230123090324.732681-1-alexghiti@rivosinc.com>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 Jan 2023 09:07:33 -0000

The 'mmu-type' should reflect what the hardware is capable of so use the
new satp_mode field in RISCVCPUConfig to do that.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 hw/riscv/virt.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 94ff2a1584..48d034a5f7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     int cpu;
     uint32_t cpu_phandle;
     MachineState *mc = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name;
+    uint8_t satp_mode_max;
+    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
         cpu_phandle = (*phandle)++;
@@ -236,14 +237,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(mc->fdt, cpu_name);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_MMU)) {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
-        } else {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    "riscv,none");
-        }
+
+        satp_mode_max = satp_mode_max_from_map(
+                            s->soc[socket].harts[cpu].cfg.satp_mode.map);
+        sv_name = g_strdup_printf("riscv,%s",
+                                  satp_mode_str(satp_mode_max, is_32_bit));
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
+        g_free(sv_name);
+
         name = riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
-- 
2.37.2


