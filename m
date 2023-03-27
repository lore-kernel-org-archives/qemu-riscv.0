Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvf1-0005Ny-7f
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvey-0005NS-UA
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:49:52 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvex-0007Kz-37
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:49:52 -0400
Received: by mail-oi1-x233.google.com with SMTP id f17so7610076oiw.10
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0ARKpciyvlJkpzF/9XoqQBhluoMcoyy701jOPuzAdA=;
 b=FDacxwFeXsCtFKdjs5n3BCVXVBQHYndhhnOYKbSuMa+zQMyc0TAATTlWmM83Xry4Bx
 hSgrPpu3LTSlNZrA8wGp6NkDZR8wxzGe9j/qwMHbBCKbeMUfwlLRpKHhbObYnijvPeOQ
 v+CLHSD5bN6ADWQIwKyrWk/2qokBFwp1blynVTa4pWlmJSlzuxHucF6xzMepeNFJKB/B
 Eh95Lh+qKdFDyqSXC8aU4+BKJ9GsEbPIHBy2aapOQIEyShWXvVHi5JdlKuqefrUv5+Wh
 ed5/SkkNVsNxjbnbuVgTszH6QUDBlKZoO2p2HqurbwFPxixzglZaF8NHELyGpMTAZYcT
 Iumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h0ARKpciyvlJkpzF/9XoqQBhluoMcoyy701jOPuzAdA=;
 b=HvuibrRINROIwoa6KOIZpm/bj9wnv4zyqx66Tc+FmRcpbHJdv+Q7GNaGP891kVX1vQ
 ZWpXNDe33yRlPZvpnYsW3moIQHHDGXyoXaNfuKiMMoYC1Tbu75aq75xCESs9F7Hnkq1v
 JXcZ8Ph0MwLCFvov+WI5UI5i0AjWUqxOmg2nUL6kXdYlKvYDqZnCtZqnTruvh0hAh+nE
 W2d2tpPsRZ22XDxzlg++XKfl0Wn/6oRC8jAWXq2FErvtYExY0Lo+MzuLQL+7fmtn1cJm
 pAb79BgNAKuM+jdRwgLshygiIfixNGGE7RJUaJem4pMYwn5eA1IjfyAETCS7N8s/h9sY
 qzeg==
X-Gm-Message-State: AO0yUKUzAgCLmX7unVlmTLnshwMSC2JL033TnbSvkos7/vC1YuCxOjRv
 UxWr+uUsQhua8rmBubrTrIXqLg==
X-Google-Smtp-Source: AK7set97ZKaqGRhK05PsZLyXFHsHpB/oJskqm3VF4j3Q2rI8ocdYo0CBBdMqXkf4yKyOUtL1RLKWFg==
X-Received: by 2002:a05:6808:58:b0:386:f58a:2262 with SMTP id
 v24-20020a056808005800b00386f58a2262mr5524409oic.57.1679957390065; 
 Mon, 27 Mar 2023 15:49:50 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:49:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 01/19] target/riscv: sync env->misa_ext* with cpu->cfg in
 realize()
Date: Mon, 27 Mar 2023 19:49:16 -0300
Message-Id: <20230327224934.363314-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 22:49:53 -0000

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


