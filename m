Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmBi-00083I-Br
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 08:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBg-00082w-LQ
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:00 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmBe-00020I-NR
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:00 -0400
Received: by mail-oi1-x22c.google.com with SMTP id y184so6207815oiy.8
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 05:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679920976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0ARKpciyvlJkpzF/9XoqQBhluoMcoyy701jOPuzAdA=;
 b=A9gV6LZgc+WbcE1d5XzkR+MEjRNhgRY6MLjXoQqPkW2SRFwhpxeC94Fzx2M88D4/UD
 Ua0psaYwtzWCA30S1qB64VOtJ1vxC9gZbtAPLVpuea2g2BPyUYA+GW8mXYDnup9zby/a
 rkSV/l7pYj26S1OrHfnTbc83chztFYux3WZ0rkpI3FD2Rf13tO4xJOOc6hymGMJi/Ryf
 13YHaUdDqTNV6nGU0w94K56Xdsvlstb4sK0fVMRSRdQxQDGk3hrwUunJrDLBRw4o9ol9
 yTGbQVGPNnhkPgO1dEfG9ox1DN8eZKmkVQGHQaoCT8k8/STMjJFmUphmFvgctJHYZQkk
 skIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679920976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h0ARKpciyvlJkpzF/9XoqQBhluoMcoyy701jOPuzAdA=;
 b=q8deYF6dASXqIozQWz5zihEupTOxHkXykVCYCseFszwmxGmh7agErSqUDz93IRbedf
 q9O0PXjr1UxwmntXCLcE3t0+cHw3ZnCqGsd7MV0JxGAdzQxKBffAgi6NyjokuzU4Kx0F
 Yr/TqlaF51FR+63jqv9NKPDzr1+Cat8yT1VOgRSNVZrvw0Ct4a+vxdHhpnmpUbimP5eS
 XBa9LM8uCkznh46KLuNdkYfuDkuhRqt5S4HsJAAd4OYDVLxNyvjPKMndJ1d431wdN8Hf
 6aYZmiw2X8HIixKXcXUpTdnK/zVYG6l2MHJKR1dkWeT0AHiDb9QBRSUxbecs/qAA+m+h
 G/HA==
X-Gm-Message-State: AO0yUKUwJujpLZrK9km30GA9AR0v3DG1TgkUlj/R0VBTZZuabwjfUGe3
 dSkGUtokVctklhYw2r5vseIjdw==
X-Google-Smtp-Source: AK7set+tZSmMed1wBFf94RQh66jivgypARjn3Zy7yQXtvomK0JohMsHhRIyZkTdgrl0G67SChYGz/w==
X-Received: by 2002:a05:6808:917:b0:386:e8aa:cd20 with SMTP id
 w23-20020a056808091700b00386e8aacd20mr4874416oih.15.1679920976547; 
 Mon, 27 Mar 2023 05:42:56 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:42:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 01/19] target/riscv: sync env->misa_ext* with cpu->cfg in
 realize()
Date: Mon, 27 Mar 2023 09:42:29 -0300
Message-Id: <20230327124247.106595-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Mar 2023 12:43:00 -0000

When riscv_cpu_realize() starts we're guaranteed to have cpu->cfg.ext_N
properties updated. The same can't be said about env->misa_ext*, since
the user might enable/disable MISA extensions in the command line, and
env->misa_ext* won't caught these changes. The current solution is to
sync everything at the end of validate_set_extensions(), checking every
cpu->cfg.ext_N value to do a set_misa() in the end.

The last change we're making in the MISA cfg flags are in the G
extension logic, enabling IMAFG if cpu->cfg_ext.g is enabled. Otherwise
we're not making any changes in MISA bits ever since realize() starts.

There's no reason to postpone misa_ext updates until the end of the
validation. Let's do it earlier, during realize(), in a new helper
called riscv_cpu_sync_misa_cfg(). If cpu->cfg.ext_g is enabled, do it
again by updating env->misa_ext* directly.

This is a pre-requisite to allow riscv_cpu_validate_set_extensions() to
use riscv_has_ext() instead of cpu->cfg.ext_N to validate the MISA
extensions, which is our end goal here.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 94 +++++++++++++++++++++++++++-------------------
 1 file changed, 56 insertions(+), 38 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..2711d80e16 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -804,12 +804,11 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 
 /*
  * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly, doing a set_misa() in the end.
+ * cpu->cfg accordingly.
  */
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
-    uint32_t ext = 0;
 
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
@@ -824,6 +823,9 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
+
+        env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
+        env->misa_ext_mask = env->misa_ext;
     }
 
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
@@ -962,39 +964,8 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksh = true;
     }
 
-    if (cpu->cfg.ext_i) {
-        ext |= RVI;
-    }
-    if (cpu->cfg.ext_e) {
-        ext |= RVE;
-    }
-    if (cpu->cfg.ext_m) {
-        ext |= RVM;
-    }
-    if (cpu->cfg.ext_a) {
-        ext |= RVA;
-    }
-    if (cpu->cfg.ext_f) {
-        ext |= RVF;
-    }
-    if (cpu->cfg.ext_d) {
-        ext |= RVD;
-    }
-    if (cpu->cfg.ext_c) {
-        ext |= RVC;
-    }
-    if (cpu->cfg.ext_s) {
-        ext |= RVS;
-    }
-    if (cpu->cfg.ext_u) {
-        ext |= RVU;
-    }
-    if (cpu->cfg.ext_h) {
-        ext |= RVH;
-    }
     if (cpu->cfg.ext_v) {
         int vext_version = VEXT_VERSION_1_00_0;
-        ext |= RVV;
         if (!is_power_of_2(cpu->cfg.vlen)) {
             error_setg(errp,
                        "Vector extension VLEN must be power of 2");
@@ -1032,11 +1003,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
         set_vext_version(env, vext_version);
     }
-    if (cpu->cfg.ext_j) {
-        ext |= RVJ;
-    }
-
-    set_misa(env, env->misa_mxl, ext);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1121,6 +1087,50 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 #endif
 }
 
+static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
+{
+    uint32_t ext = 0;
+
+    if (riscv_cpu_cfg(env)->ext_i) {
+        ext |= RVI;
+    }
+    if (riscv_cpu_cfg(env)->ext_e) {
+        ext |= RVE;
+    }
+    if (riscv_cpu_cfg(env)->ext_m) {
+        ext |= RVM;
+    }
+    if (riscv_cpu_cfg(env)->ext_a) {
+        ext |= RVA;
+    }
+    if (riscv_cpu_cfg(env)->ext_f) {
+        ext |= RVF;
+    }
+    if (riscv_cpu_cfg(env)->ext_d) {
+        ext |= RVD;
+    }
+    if (riscv_cpu_cfg(env)->ext_c) {
+        ext |= RVC;
+    }
+    if (riscv_cpu_cfg(env)->ext_s) {
+        ext |= RVS;
+    }
+    if (riscv_cpu_cfg(env)->ext_u) {
+        ext |= RVU;
+    }
+    if (riscv_cpu_cfg(env)->ext_h) {
+        ext |= RVH;
+    }
+    if (riscv_cpu_cfg(env)->ext_v) {
+        ext |= RVV;
+    }
+    if (riscv_cpu_cfg(env)->ext_j) {
+        ext |= RVJ;
+    }
+
+    env->misa_ext = env->misa_ext_mask = ext;
+}
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -1156,6 +1166,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
+    /*
+     * We can't be sure of whether we set defaults during cpu_init()
+     * or whether the user enabled/disabled some bits via cpu->cfg
+     * flags. Sync env->misa_ext with cpu->cfg now to allow us to
+     * use just env->misa_ext later.
+     */
+    riscv_cpu_sync_misa_cfg(env);
+
     /* Force disable extensions if priv spec version does not match */
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
-- 
2.39.2


