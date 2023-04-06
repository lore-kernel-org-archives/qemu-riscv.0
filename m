Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTyu-0001Yu-Nz
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTys-0001SZ-6z
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:05:06 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyp-0000gb-8C
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:05:04 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-17aaa51a911so43230505fac.5
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oY1JOzwqJ/OA56uJv92L1IGN2k9NTuKv7EeDFnvQ2eo=;
 b=QHnLXPAF5Sgaa+jiZJRXWDnOs7+EhsDjy6kvZhK9oFz8CLOhC28+EiETQ8dxiuaoNM
 cg9uXqom/UiU7ejCjRT13Vk2kv9Spgq18Fuq4FeVV54GEDhcwDXAQTa1Ck7LRPc57AXI
 FUudNKpXYQikjGtPpmH2tH45YD2SYB4bHKrbPK7eWiItMYh2AOTK8A9sZV3HyFoO9unb
 seFmrLPf0T9E1aN4utUP5hDCk2mYzRKEyCvs/Wpw4hOgLU4fTXgyYSr/rngq5AgXukuu
 EYsx/wjSvjBBPEy3rakdBsXURWIyw0kx6OTnciHnBpIkHnkntI0OdJF73bXJCKek92DK
 uvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oY1JOzwqJ/OA56uJv92L1IGN2k9NTuKv7EeDFnvQ2eo=;
 b=llLZPlwOZNsvDkvLZ6NNzz7FnR8kY39Ybu/H9v8ws9JzoZRiDpIh9vJKdu7a6tlmWO
 Ui8Sa9qn2Vd9mWCV77OqIzTF6IZnczlkFox1tHuXIbyzW1evIPMbaZtAuH2x/Qp/lctM
 o3qNgQI7EedbMeKnHEl8ltS6wGWwsUyf/oGSyhzvkSmP/9ck2HlSUkvbsvqIuArvmIoc
 nQKeaCXG+Ql7o7Jx37yjaSVhRHQo77/pItqaUBwvsM7IXFZGdtqdCFU04DVJlvAkMeGr
 UNnzcx0kINyKxCX3EoU7UyK56/ewn1raJtOMsTWRzrLhyTWqRBtyOQJgOr2toMls6GH0
 utWw==
X-Gm-Message-State: AAQBX9fZpd/Z2DZrTIY9qZSGzDfLJ1Uc9bjZMMUGnGtD5eSHSSQRN33E
 8kfAJ2YvqBw7hFT7OthZsHkBHg==
X-Google-Smtp-Source: AKy350aG++z4PIot/VYBR0y7NZ8A9pq+zNwpFRzMcA5xYXJvt9WKJz9bV3UGB/Y4mP/v6h+2qcrwMw==
X-Received: by 2002:a05:6870:14c5:b0:17a:cb34:758a with SMTP id
 l5-20020a05687014c500b0017acb34758amr105053oab.34.1680804301887; 
 Thu, 06 Apr 2023 11:05:01 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:05:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 20/20] target/riscv/cpu.c: redesign register_cpu_props()
Date: Thu,  6 Apr 2023 15:03:51 -0300
Message-Id: <20230406180351.570807-21-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:05:06 -0000

The function is now a no-op for all cpu_init() callers that are setting
a non-zero misa value in set_misa(), since it's no longer used to sync
cpu->cfg props with env->misa_ext bits. Remove it in those cases.

While we're at it, rename the function to match what it's actually
doing: create user properties to set/remove CPU extensions. Make a note
that it will overwrite env->misa_ext with the defaults set by each user
property.

Update the MISA bits comment in cpu.h as well.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 41 ++++++++++-------------------------------
 target/riscv/cpu.h |  5 +----
 2 files changed, 11 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 143079a8df..d1769fd218 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -228,7 +228,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(Object *obj);
+static void riscv_cpu_add_user_properties(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -356,7 +356,6 @@ static void riscv_any_cpu_init(Object *obj)
 #endif
 
     set_priv_version(env, PRIV_VERSION_1_12_0);
-    register_cpu_props(obj);
 }
 
 #if defined(TARGET_RISCV64)
@@ -365,7 +364,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 #ifndef CONFIG_USER_ONLY
@@ -377,7 +376,6 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
@@ -390,7 +388,6 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -436,7 +433,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 #ifndef CONFIG_USER_ONLY
@@ -449,7 +446,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 #ifndef CONFIG_USER_ONLY
@@ -461,7 +458,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
@@ -474,7 +470,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -488,7 +483,6 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -503,7 +497,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -521,7 +514,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
 }
 #endif
 
@@ -1577,30 +1570,16 @@ static Property riscv_cpu_extensions[] = {
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
index 070547234b..f47c3fc139 100644
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


