Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvg4-0007Ch-M3
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvg3-0007Bf-MC
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:59 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvg0-0007PX-Lu
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:59 -0400
Received: by mail-oi1-x233.google.com with SMTP id y184so7629273oiy.8
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JVdzF50fsI+t2HDxCaDh1omTenCi8EjQSZ5MonRq7CU=;
 b=XBNkictLHINZbOqsgZPWOMpro2mX1yOBn4WAfmg8jqIlVVS5dR5t9pIc3D7XoNkQf6
 JpthsaIeva0WyDcTtrQBp6kvGqD/uHtys7aZOtd5JbWsMG+Ed1Ji8BcBB5m2PfyHLIN6
 He1umpElRGqLcRHuf65bALNo/VmHLCHZ30LgThEllhnRkGz/SrKIX6U0qPX9gFpYF91t
 zLbqC9XJXdh8rXerrV4ulPo52NeMmwiJ5uL7W5J/wHF5zxdDWKmhNcOItgAzl6pxy5ZJ
 gG1rTVo5xwJhq7n/7tK0dPXEj3LBp7raSiJ+AdnQIFzK/fNV1eDGzVPF7V6ebM/ALsY5
 khYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JVdzF50fsI+t2HDxCaDh1omTenCi8EjQSZ5MonRq7CU=;
 b=TAwOz/ZA3mpuxdPnUYN536oDfd23KXPG3mfDFGRzb656FdZq5RQyQ2/R2rri6M4Y6d
 2DRnQxUQ7LprFqnFIij4Gf5qWzWnu/E1hvVrT3MZCBqh3dmh0S/G794Fa3+7mKNRxtig
 pteRP/6WIe/BRvkBsE6SbZiqGNopQIfM7eUMemGsSIb6PqTzEh6m6WKYXVYBCJlDRqRi
 hF/6c9OM6qs3sdEZZwwYAQ+aN+c+tL2z3cmyufGfylSSE3qjweDltB19QDMXY3b1qKZf
 wa47GEITux+wV+Osfap/SvCmtK8a4F4uHY+29goMrGX03GQjojX/RQVImXUoE2cNRtnk
 Lsaw==
X-Gm-Message-State: AO0yUKWVPpUkaOaOKZWj/s+9gDGRue/PgslhACDsn6+dc4Zi4EDRf6z2
 PPeR93+y1kH5KeWrJXDE5Ug6ZKpDqRSQPyYNeT4=
X-Google-Smtp-Source: AK7set9Qu249dBsBkWpj1/tA/TBEMrPJ0LT17sCkSX+y9iH31Yj2l7Q2uA/ieMjuciLZnkt2iWlXsg==
X-Received: by 2002:a05:6808:4ca:b0:387:85fc:f915 with SMTP id
 a10-20020a05680804ca00b0038785fcf915mr5652306oie.47.1679957455956; 
 Mon, 27 Mar 2023 15:50:55 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 19/19] target/riscv/cpu.c: redesign register_cpu_props()
Date: Mon, 27 Mar 2023 19:49:34 -0300
Message-Id: <20230327224934.363314-20-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Mon, 27 Mar 2023 22:50:59 -0000

The function is now a no-op for all cpu_init() callers that are setting
a non-zero misa value in set_misa(), since it's no longer used to sync
cpu->cfg props with env->misa_ext bits. Remove it in those cases.

While we're at it, rename the function to match what it's actually
doing: create user properties to set/remove CPU extensions. Make a note
that it will overwrite env->misa_ext with the defaults set by each user
property.

Update the MISA bits comment in cpu.h as well.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 41 ++++++++++-------------------------------
 target/riscv/cpu.h |  5 +----
 2 files changed, 11 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a0c009df4a..49512df452 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -222,7 +222,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(Object *obj);
+static void riscv_cpu_add_user_properties(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -350,7 +350,6 @@ static void riscv_any_cpu_init(Object *obj)
 #endif
 
     set_priv_version(env, PRIV_VERSION_1_12_0);
-    register_cpu_props(obj);
 }
 
 #if defined(TARGET_RISCV64)
@@ -359,7 +358,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 #ifndef CONFIG_USER_ONLY
@@ -371,7 +370,6 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
@@ -384,7 +382,6 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -430,7 +427,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 #ifndef CONFIG_USER_ONLY
@@ -443,7 +440,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 #ifndef CONFIG_USER_ONLY
@@ -455,7 +452,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
@@ -468,7 +464,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -482,7 +477,6 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -497,7 +491,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -515,7 +508,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
 }
 #endif
 
@@ -1509,30 +1502,16 @@ static Property riscv_cpu_extensions[] = {
 };
 
 /*
- * Register CPU props based on env.misa_ext. If a non-zero
- * value was set, register only the required cpu->cfg.ext_*
- * properties and leave. env.misa_ext = 0 means that we want
- * all the default properties to be registered.
+ * Add CPU properties with user-facing flags.
+ *
+ * This will overwrite existing env->misa_ext values with the
+ * defaults set via riscv_cpu_add_misa_properties().
  */
-static void register_cpu_props(Object *obj)
+static void riscv_cpu_add_user_properties(Object *obj)
 {
-    RISCVCPU *cpu = RISCV_CPU(obj);
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
-    /*
-     * If misa_ext is not zero, set cfg properties now to
-     * allow them to be read during riscv_cpu_realize()
-     * later on.
-     */
-    if (cpu->env.misa_ext != 0) {
-        /*
-         * We don't want to set the default riscv_cpu_extensions
-         * in this case.
-         */
-        return;
-    }
-
     riscv_cpu_add_misa_properties(obj);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ce92e8393d..02f26130d5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -65,10 +65,7 @@
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
-/*
- * Consider updating register_cpu_props() when adding
- * new MISA bits here.
- */
+/* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
 #define RVI RV('I')
 #define RVE RV('E') /* E and I are mutually exclusive */
 #define RVM RV('M')
-- 
2.39.2


