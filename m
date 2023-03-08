Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0GQ-00087g-4F
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GO-000878-FM
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:52 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GM-0002U6-NL
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:52 -0500
Received: by mail-oi1-x230.google.com with SMTP id e21so21016oie.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xsh1iCWD9Y32A+LimVSP5RAfzDBl9hWshDY0NEwDdpg=;
 b=FEBS5Tasc60jkmXQiMAQy9bLProHRH247hGmBfPlWHKJwggg5vo6RuCiBr0g+kIiie
 EHskP60EZJdH0OKYCOa3h+URwoS4rlUx/4s8f1KWjk4uYobleYAuTooqG73p+mgTqAMa
 D7+ZjEBK7MyyypHIMeYAOsAoiRkLIJzWS8EqKq62o692ElhFPLSa/eqADbkITFL6Bruj
 OJ9JqowaTvNZd+OjUJjqR36/Gcje1favXLZBZS/iACyicNuVANgJmPFMqr2NBTECJZdb
 b9rBnoZ8clB7TVjbaKtOg6URPzaLpXUhUN10bTxJ/0EFPC22jbuhRR/BpTqd5I/nvuRW
 /qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xsh1iCWD9Y32A+LimVSP5RAfzDBl9hWshDY0NEwDdpg=;
 b=zQk2RxQuVLDcgVDXcb6IGUBCgWrO2DhduqupXKCYl+b0HpDfOcYjmoctghmZnTg3RO
 ibLK3ov5SRB1u/X1J/H33hka/w7AmP0mZ1TRDHb0zoDIVSAfY2DHGMwGKW8Xs9JI/+wx
 JjCCOOpAGGl6dP8trCuKHVgNZl4W/cz2F7bMmlMRvx/g7BH/SZ+Yiob4TReiW7OF+RnC
 w4EeYoAWUlhhfJZmUIxk7pFSfQV2PyynIvpBdy/jx7cMIkGhx5JYfayj0fJ2YurkhW5i
 hY9rFG/afUBXbbFodKsyrPynZxKpJS4g4KXkdduopD6FTDL3QZHB58c2Ubt7IFR9xKpa
 68Cw==
X-Gm-Message-State: AO0yUKWePkGCouHvB7AIj9YlSc6LsEEhuMDhIbX4xr5hCcgl1jfy7ezq
 GFnY02nt27MtMDEO09zP4s4uXQ==
X-Google-Smtp-Source: AK7set9e+dNxmmH4B5KQSsvNwte59vXOlgmk0GU4i1/M6cZGujvR4HyQCwoHSw20jiBf/8xA/wVXvQ==
X-Received: by 2002:aca:1912:0:b0:383:de45:6d87 with SMTP id
 l18-20020aca1912000000b00383de456d87mr9778254oii.28.1678306790081; 
 Wed, 08 Mar 2023 12:19:50 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:19:49 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 06/17] target/riscv: move realize() validations to
 riscv_cpu_validate_set_extensions()
Date: Wed,  8 Mar 2023 17:19:14 -0300
Message-Id: <20230308201925.258223-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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
X-List-Received-Date: Wed, 08 Mar 2023 20:19:52 -0000

Center all validations that are scattered in riscv_cpu_realize() in the
same function.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 74 ++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 39 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e15f829edc..e2cd55320c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -881,9 +881,43 @@ static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
  */
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
+    CPUClass *cc = CPU_CLASS(mcc);
     CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
     uint32_t ext = 0;
 
+    riscv_cpu_validate_priv_spec(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
+        /*
+         * Enhanced PMP should only be available
+         * on harts with PMP support
+         */
+        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+        return;
+    }
+
+    /* Validate that MISA_MXL is set properly. */
+    switch (env->misa_mxl_max) {
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+    case MXL_RV128:
+        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+        break;
+#endif
+    case MXL_RV32:
+        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    assert(env->misa_mxl_max == env->misa_mxl);
+
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             cpu->cfg.ext_a && cpu->cfg.ext_f &&
@@ -1066,8 +1100,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVH;
     }
     if (cpu->cfg.ext_v) {
-        Error *local_err = NULL;
-
         riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
@@ -1169,9 +1201,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(dev);
-    CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
-    CPUClass *cc = CPU_CLASS(mcc);
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1180,51 +1210,17 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_validate_priv_spec(cpu, &local_err);
+    riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
-    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
-        /*
-         * Enhanced PMP should only be available
-         * on harts with PMP support
-         */
-        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
-        return;
-    }
-
-
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
         riscv_timer_init(cpu);
     }
-#endif /* CONFIG_USER_ONLY */
-
-    /* Validate that MISA_MXL is set properly. */
-    switch (env->misa_mxl_max) {
-#ifdef TARGET_RISCV64
-    case MXL_RV64:
-    case MXL_RV128:
-        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
-        break;
-#endif
-    case MXL_RV32:
-        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    assert(env->misa_mxl_max == env->misa_mxl);
 
-    riscv_cpu_validate_set_extensions(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-#ifndef CONFIG_USER_ONLY
     if (cpu->cfg.pmu_num) {
         if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-- 
2.39.2


