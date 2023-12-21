Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057A6C46CCD
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:53:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGNDR-0002ZE-Dv; Thu, 21 Dec 2023 12:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDG-0002WL-1u
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:03 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDD-0007wv-4i
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:01 -0500
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-35fc16720f9so4203315ab.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 09:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703181116; x=1703785916; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVrDBA2eoqpj3r2szEcFrStMdGViyzt8k41KgkSS3X8=;
 b=e3HYaPWAc1msqNCUDULMyzqfHSPMsEg6K2/LtK6hGjANYqcmAR33aiUYdNUPeOrmAR
 VEqFstjqh3bwkVw+pknLKXwJ/P1UaqShdTFfeTtnV2Vs8DtWW4sjYDlmsWELCtf1T64G
 /tDORSsm2FSQ0AXkuAxJaYIdpcniyCRa7UFGLzUswfBmzvQfTOMi2Hgntdbx+ZrL7Vda
 YGcpNZuJNTwjc3iucUSbKmqVMrwYA8w+yiOKWB5eTQcqdmJUD9qVcxffAB9ndIwL5pO/
 7lpjUQwalvTNkxirRNrvDqyWkBowwoWddYVYThMIbztOw1SBGPV/GI9spXaHLICYIqa2
 2bnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703181116; x=1703785916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVrDBA2eoqpj3r2szEcFrStMdGViyzt8k41KgkSS3X8=;
 b=Aa18ZFNKatygaaPh7nuKCY2Vc7SOp57eP3qpYh1ibzZzclstKxiYcbGcNe6ZEFDxod
 Ew/fLXv1sakhZ0JnzjSLtxx+IBHmKmqfJMbBuvi6WlOGFaSAbNu/NOoYytd93A0jkyp9
 VJuJkYOVVYs7XBlTEJRk8VUBVOM33evBO32oFbGX0WRicW55QAWbqnHuXQ5kIm2eH3rb
 O1XFnbDIvEhuNQp+iEjhpKUMYXsWX4nTWSv9BlGwTDa0d8oQSBUmB7kbBHDvtlANqcOV
 pSVg3524OJzr2QBut1JFSE1d4leHl8GmXR9PuT31itE8gJWsxh36XEYBmLTuj4tTHBY+
 sR4Q==
X-Gm-Message-State: AOJu0YxbCo+Mw80zTdOSroi+G8HtAenzoqbQfRasehhOUVAE36mO+MnQ
 KStrIdov5QGIMlLrZWjCFJNj8P9NXcK97Dl95aId0A==
X-Google-Smtp-Source: AGHT+IH1j4JW8Tm97OL219fTwpWrYTogCAgCeADKIZCWyiEYdTPldk+58qj90CNk2nC0UST3bH4SHA==
X-Received: by 2002:a05:6e02:2143:b0:35f:cd16:b58a with SMTP id
 d3-20020a056e02214300b0035fcd16b58amr3549538ilv.44.1703181116312; 
 Thu, 21 Dec 2023 09:51:56 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a63f50a000000b005b18c53d73csm1806261pgh.16.2023.12.21.09.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 09:51:55 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 04/16] target/riscv: move 'mmu' to riscv_cpu_properties[]
Date: Thu, 21 Dec 2023 14:51:25 -0300
Message-ID: <20231221175137.497379-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221175137.497379-1-dbarboza@ventanamicro.com>
References: <20231221175137.497379-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Commit 7f0bdfb5bfc ("target/riscv/cpu.c: remove cfg setup from
riscv_cpu_init()") already did some of the work by making some
cpu_init() functions to explictly enable their own 'mmu' default.

The generic CPUs didn't get update by that commit, so they are still
relying on the defaults set by the 'mmu' option. But having 'mmu' and
'pmp' being default=true will force CPUs that doesn't implement these
options to set them to 'false' in their cpu_init(), which isn't ideal.

We'll move 'mmu' to riscv_cpu_properties[] without any defaults, i.e.
the default will be 'false'. Compensate it by manually setting 'mmu =
true' to the generic CPUs that requires it.

Implement a setter for it to forbid the 'mmu' setting to be changed for
vendor CPUs. This will allow the option to exist for all CPUs and, at
the same time, protect vendor CPUs from undesired changes:

$ ./build/qemu-system-riscv64 -M virt -cpu sifive-e51,mmu=true
qemu-system-riscv64: can't apply global sifive-e51-riscv-cpu.mmu=true:
   CPU 'sifive-e51' does not allow changing the value of 'mmu'

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 67 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8f68da9969..90dd2bccf6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -410,6 +410,8 @@ static void riscv_max_cpu_init(Object *obj)
     CPURISCVState *env = &cpu->env;
     RISCVMXL mlx = MXL_RV64;
 
+    cpu->cfg.mmu = true;
+
 #ifdef TARGET_RISCV32
     mlx = MXL_RV32;
 #endif
@@ -424,7 +426,11 @@ static void riscv_max_cpu_init(Object *obj)
 #if defined(TARGET_RISCV64)
 static void rv64_base_cpu_init(Object *obj)
 {
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+
+    cpu->cfg.mmu = true;
+
     /* We set this in the realise function */
     riscv_cpu_set_misa(env, MXL_RV64, 0);
     /* Set latest version of privileged specification */
@@ -542,13 +548,18 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
 
 static void rv128_base_cpu_init(Object *obj)
 {
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+
     if (qemu_tcg_mttcg_enabled()) {
         /* Missing 128-bit aligned atomics */
         error_report("128-bit RISC-V currently does not work with Multi "
                      "Threaded TCG. Please use: -accel tcg,thread=single");
         exit(EXIT_FAILURE);
     }
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+
+    cpu->cfg.mmu = true;
+
     /* We set this in the realise function */
     riscv_cpu_set_misa(env, MXL_RV128, 0);
     /* Set latest version of privileged specification */
@@ -560,7 +571,11 @@ static void rv128_base_cpu_init(Object *obj)
 #else
 static void rv32_base_cpu_init(Object *obj)
 {
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+
+    cpu->cfg.mmu = true;
+
     /* We set this in the realise function */
     riscv_cpu_set_misa(env, MXL_RV32, 0);
     /* Set latest version of privileged specification */
@@ -1431,6 +1446,19 @@ const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static bool riscv_cpu_is_vendor(Object *obj)
+{
+    return !riscv_cpu_is_generic(obj);
+}
+
+static void cpu_set_prop_err(RISCVCPU *cpu, const char *propname,
+                             Error **errp)
+{
+    g_autofree char *cpuname = riscv_cpu_get_name(cpu);
+    error_setg(errp, "CPU '%s' does not allow changing the value of '%s'",
+               cpuname, propname);
+}
+
 static void prop_pmu_num_set(Object *obj, Visitor *v, const char *name,
                              void *opaque, Error **errp)
 {
@@ -1468,8 +1496,37 @@ const PropertyInfo prop_pmu_num = {
     .set = prop_pmu_num_set,
 };
 
+static void prop_mmu_set(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    bool value;
+
+    visit_type_bool(v, name, &value, errp);
+
+    if (cpu->cfg.mmu != value && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, "mmu", errp);
+        return;
+    }
+
+    cpu->cfg.mmu = value;
+}
+
+static void prop_mmu_get(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    bool value = RISCV_CPU(obj)->cfg.mmu;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+const PropertyInfo prop_mmu = {
+    .name = "mmu",
+    .get = prop_mmu_get,
+    .set = prop_mmu_set,
+};
+
 Property riscv_cpu_options[] = {
-    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
@@ -1491,6 +1548,8 @@ static Property riscv_cpu_properties[] = {
                        MAKE_64BIT_MASK(3, 16)),
     {.name = "pmu-num", .info = &prop_pmu_num}, /* Deprecated */
 
+    {.name = "mmu", .info = &prop_mmu},
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
-- 
2.43.0


