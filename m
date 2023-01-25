Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKbQI-0006kY-Lg
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 03:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKbQC-0006Ks-Ih
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 03:46:22 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKbQA-0008BY-6a
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 03:46:19 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so718902wmc.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 00:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRWvpmPRHrukoIwIrFR+ERY535b3mU7yJB9xTFeVSNc=;
 b=bpklNfsyt9jwLJshAAnAoZ/GHctkWTO28Qwllz1TSEUmsKBGcN2pb1RYJM6MOv+cSa
 CncmPExEEvKiR75sKhOVuTSdI3IxUowLNcWQr9ftcGEcd1BqgBTut0Yy0nkyk8M89hgU
 vCjAXGz+GAbQudECk9/DKbDwJvpYtiDwl7E7lqfUpGtfISdVT0rr+m6sqCUD16HEGa24
 KKmTrsgLLCt/2fyCGPmFDGFZoZmN+C2p0BJwtPfwqvgPKGDtZPyYkc2JVyMgxOCXyGjy
 WC35zA5hkvU0578RO43hyzARzBz0pGptxpg0Jo7686dJYKrD0Bad7fjk6pe/QRWnTyZj
 ByRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRWvpmPRHrukoIwIrFR+ERY535b3mU7yJB9xTFeVSNc=;
 b=Hs92cNtg8x1zplNUwRB4K5wR4ozTkgdZBmZkhHyoUBCip34yFFOdQK8PHXaVDVdfyP
 Krd+t9dWEmEp/qI4FiuI7V0coNh/Q7yDP7xIh2yj6IR5SGmu2GRSOTpBK/tZAVN8BOpN
 T/5/Z+5qMMK/IHyfiU15Z25OkFgnpq9ba/t5/an7IufrA8WTfSJ9X+QkIK/OaZS2mcmy
 YfWAsEODqMq44IIk373iyo8ePbrnUj2DIH1H2ZctqfhUCgkQh7XENKGvZeCMj9sDqLwk
 3m7d5d1Z8bXiNULcTAB0pPMl09Vuc4Yc4A/waw7+/LXxjmAXLaRLjtiniB4/6i4Mq2+7
 SCSA==
X-Gm-Message-State: AFqh2krNf7AUmPkYZx7zAFxWHwAYhOLr9Ez9hgVGLoQs8jLvcuH8f4ta
 LQNIeoTFuVfk/JPTfDtNlA9omg==
X-Google-Smtp-Source: AMrXdXvne5enjH73X+2/5xZIXijlQmkC4gon0WWBwXXANi6Ki2QTTFD2siDqqA2TIe2H1l4DylpQag==
X-Received: by 2002:a05:600c:4191:b0:3d4:5741:af9b with SMTP id
 p17-20020a05600c419100b003d45741af9bmr38612590wmh.0.1674636376790; 
 Wed, 25 Jan 2023 00:46:16 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 m18-20020adfe952000000b00286ad197346sm3850791wrn.70.2023.01.25.00.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 00:46:16 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v7 5/5] riscv: Correctly set the device-tree entry 'mmu-type'
Date: Wed, 25 Jan 2023 09:41:07 +0100
Message-Id: <20230125084107.1580972-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125084107.1580972-1-alexghiti@rivosinc.com>
References: <20230125084107.1580972-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Wed, 25 Jan 2023 08:46:24 -0000

The 'mmu-type' should reflect what the hardware is capable of so use the
new satp_mode field in RISCVCPUConfig to do that.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


