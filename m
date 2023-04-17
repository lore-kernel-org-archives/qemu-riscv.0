Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPPi-00058q-LY
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 10:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPI-0003zq-35
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:00:37 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPF-000389-Ty
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:00:35 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1879502e2afso14462560fac.5
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681740032; x=1684332032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Eg4OjIu9XJVebHhIGr1W8Ypo/xVtjz2S0WyrM7TGQ8=;
 b=nI058Lwwby98hKDu+G6pu6wF2PDO40zcDPuYUG1ErYVggczuwYyy1UCw07fEiihO6q
 FpYwNrcJKisfFS/R6UEGV/jOUf0GQATMTTySPmDTiEs1h+ExPZU5Bg6Qo0Bv5KijtR/a
 VI9lLS6VLKU1WlqUu+nhBMQ7Ip+nt47U0pFh1I1PaOFivb59yC2fvdLdyEHyXAaUKOOJ
 +cAcPbqvR3QqN+39o/7xSjyYckvz0Grc966lrSHHCKShgawy7Os6wFEFmmOEYLoeaDAf
 mRiIDn2bHcFUati4wtA+oJRncADg9zbkGYUrAEBEVSx3IaRGro1vQRcQDKklqLvYxyAf
 q22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740032; x=1684332032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Eg4OjIu9XJVebHhIGr1W8Ypo/xVtjz2S0WyrM7TGQ8=;
 b=RWNEM87jdsLrnb/pWYHs7CLFA889oiA8ovGsMJcRsYNahAmaSxN2m+t/qmpVkZDmyc
 EPTnULE6sD8n5o2zrGzN3iiLg4pf35wtJyAk/jTYe/NTw3vbEWjCh2kxzcnjjevA3dkU
 6sihT9UVOQVXi17NqopGq34FOM3WdPlKc36YZRZ0yHC4jX0cSM1idSFKi8wORJFRcFss
 NUZJQ7py5qVMZE3YJ/RgveWJvFhPXfXyinobEUtQdOAyKJwgRB7sAF8VfGyEyYUF8Fop
 U0lsYTkXnXFtW3mxqtS37syG6n0PTXQ3A3RY+OL1f+CGlX++zHidgxpKLZseQSMJEANz
 brOQ==
X-Gm-Message-State: AAQBX9fLV1Hm0AgFPjAEK9KYinADlgp5oC1s9gnsxIcO4KcoYGRoJEAC
 VEOA+Dd16YrFya/XwRz+Q0Enmg==
X-Google-Smtp-Source: AKy350Y4CV8KdrZwC1UtEb0DcCpxDCdM0WhIJw+2x49XOH0Ddlwt3ETlw3UQRFawlHv7yz2Z+T/Y+Q==
X-Received: by 2002:a05:6870:d1c7:b0:187:9c57:90c5 with SMTP id
 b7-20020a056870d1c700b001879c5790c5mr8821910oac.1.1681740032640; 
 Mon, 17 Apr 2023 07:00:32 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05687031d000b001726cfeea97sm4531868oac.29.2023.04.17.07.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:00:32 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 03/12] target/riscv/cpu.c: remove set_priv_version()
Date: Mon, 17 Apr 2023 11:00:04 -0300
Message-Id: <20230417140013.58893-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417140013.58893-1-dbarboza@ventanamicro.com>
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Apr 2023 14:00:38 -0000

The setter is doing nothing special. Just set env->priv_ver directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fed7b467e4..bec60fe585 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -247,11 +247,6 @@ static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
     env->misa_ext_mask = env->misa_ext = ext;
 }
 
-static void set_priv_version(CPURISCVState *env, int priv_ver)
-{
-    env->priv_ver = priv_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -350,7 +345,7 @@ static void riscv_any_cpu_init(Object *obj)
         VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 }
 
 #if defined(TARGET_RISCV64)
@@ -361,7 +356,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -371,7 +366,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
 #endif
@@ -383,7 +378,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -396,7 +391,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    env->priv_ver = PRIV_VERSION_1_11_0;
 
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -430,7 +425,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -443,7 +438,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
@@ -453,7 +448,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
@@ -465,7 +460,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -478,7 +473,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    env->priv_ver = PRIV_VERSION_1_11_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -492,7 +487,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -1174,7 +1169,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (priv_version >= PRIV_VERSION_1_10_0) {
-        set_priv_version(env, priv_version);
+        env->priv_ver = priv_version;
     }
 
     riscv_cpu_validate_misa_priv(env, &local_err);
-- 
2.39.2


