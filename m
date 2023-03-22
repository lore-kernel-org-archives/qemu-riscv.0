Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf70G-0006vj-5D
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70D-0006vD-SS
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:17 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf703-0007K1-8v
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:16 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-544787916d9so363784697b3.13
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6M3MReCgnUZXNMksGOWsfeTro2kCwbSHmO2GLp7GTIU=;
 b=ZwPFIAUsv/63QsB/4bJIHf3O87DBxQ+cmdZF7VBDL+634ZZOtTC+ttOwJQhztjBMn+
 iLg5YvLgtHSFUIqocirMhJyIuMpajIgxhqTm2VptlvzvxqRcHZw9RIw2XorfwPm+iwWh
 JZyrwtsyFsHpPdHEqtqPIu3b/qSBuz9fb59xYKbhjQtEvAcREk3LAsQBnMOYpIUkXJmx
 drB9iF2/EsYd/oHWahtvkVwmd1oDt45MNP0BiJR9ZwUftlunKwqXIYToYltAU0G8lx0l
 zcn41N5kFPhI3chRzByVegI11o5taERgVUapFU3wYfaBJEmHiGo+gh7VXEAGErrHpvp6
 SFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6M3MReCgnUZXNMksGOWsfeTro2kCwbSHmO2GLp7GTIU=;
 b=SJxFJTsoWsgr82E8E/kGTFfPuN5KksPxvP5Gz2w5xki5AcFRIoPMnCs92WnB1T+Dgn
 2yxxBqXvVjxBsc9uuqynW7inQnL2LJOzNetS1eyjbUfzFyedU2Jw1ZyJWraYaBSFKiCb
 UrkcmlQlT6tvX8pQp+Ny9MfM+R7xa/KxIx1vWnY4WCICVEp5wceVl+xx4euedb+ZNoBZ
 bHrpuW3X2++8Cfrv27eG7GHxpqWXakk2NFhWvORKw0OdsEMiBEKJSiN2yO5BtpQurBuV
 tKql6f4lelAFN88gHoJC9SmIId053E64g0qxJSX4QWQnrSgGpR3Stg/79l1bWItVWk4v
 odDw==
X-Gm-Message-State: AAQBX9fba16IQRuxqGKHTs31JX3wK6b8tT1rngW3C+BBPodioAfFKn1T
 WNDRCD22kbV3D7xv02427vbVcsbTOL66a8OhFYk=
X-Google-Smtp-Source: AKy350Yyvb2E25Vl7brEKHyDKOwHPz1tZuoCF2/cdDE2DxdoH/vrJitIy32fWs6p6SJY9hOdYSXEcg==
X-Received: by 2002:a05:6870:7010:b0:177:777d:307d with SMTP id
 u16-20020a056870701000b00177777d307dmr785613oae.57.1679523659282; 
 Wed, 22 Mar 2023 15:20:59 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 12/25] target/riscv/cpu.c: redesign
 register_cpu_props()
Date: Wed, 22 Mar 2023 19:19:51 -0300
Message-Id: <20230322222004.357013-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112f.google.com
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
X-List-Received-Date: Wed, 22 Mar 2023 22:32:18 -0000

Now that the function is a no-op if 'env.misa_ext != 0', and no one that
are setting misa_ext != 0 is calling it because set_misa() is setting
the cpu cfg accordingly, remove the now deprecated code and rename the
function to register_generic_cpu_props().

This function is now doing exactly what the name says: it is creating
user-facing properties to allow changes in the CPU cfg via the QEMU
command line, setting default values if no user input is provided.

Note that there's the possibility of a CPU to set a certain misa value
and, at the same, also want user-facing flags and defaults from this
function. This is not the case since commit 26b2bc58599c ("target/riscv:
Don't expose the CPU properties on names CPUs"), but given that this is
also a possibility, clarify in the function that using this function
will overwrite existing values in cpu->cfg.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 48 ++++++++++------------------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index df5c0bda70..0e56a1c01f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -221,7 +221,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(Object *obj);
+static void register_generic_cpu_props(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -386,7 +386,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -472,7 +472,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -485,7 +485,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
     /* Set latest version of privileged specification */
     env->priv_ver = PRIV_VERSION_LATEST;
 #ifndef CONFIG_USER_ONLY
@@ -572,7 +572,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(obj);
+    register_generic_cpu_props(obj);
 }
 #endif
 
@@ -1554,44 +1554,16 @@ static Property riscv_cpu_extensions[] = {
 };
 
 /*
- * Register CPU props based on env.misa_ext. If a non-zero
- * value was set, register only the required cpu->cfg.ext_*
- * properties and leave. env.misa_ext = 0 means that we want
- * all the default properties to be registered.
+ * Register generic CPU props with user-facing flags declared
+ * in riscv_cpu_extensions[].
+ *
+ * Note that this will overwrite existing values in cpu->cfg.
  */
-static void register_cpu_props(Object *obj)
+static void register_generic_cpu_props(Object *obj)
 {
-    RISCVCPU *cpu = RISCV_CPU(obj);
-    uint32_t misa_ext = cpu->env.misa_ext;
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
-    /*
-     * If misa_ext is not zero, set cfg properties now to
-     * allow them to be read during riscv_cpu_realize()
-     * later on.
-     */
-    if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_i = misa_ext & RVI;
-        cpu->cfg.ext_e = misa_ext & RVE;
-        cpu->cfg.ext_m = misa_ext & RVM;
-        cpu->cfg.ext_a = misa_ext & RVA;
-        cpu->cfg.ext_f = misa_ext & RVF;
-        cpu->cfg.ext_d = misa_ext & RVD;
-        cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_c = misa_ext & RVC;
-        cpu->cfg.ext_s = misa_ext & RVS;
-        cpu->cfg.ext_u = misa_ext & RVU;
-        cpu->cfg.ext_h = misa_ext & RVH;
-        cpu->cfg.ext_j = misa_ext & RVJ;
-
-        /*
-         * We don't want to set the default riscv_cpu_extensions
-         * in this case.
-         */
-        return;
-    }
-
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
-- 
2.39.2


