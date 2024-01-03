Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0E4C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:48:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5Ee-0003ii-24; Wed, 03 Jan 2024 12:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5EO-0002V6-UK
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:42 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5EM-0001ar-Gk
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:40 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6d98f6e8de1so3526259b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704303637; x=1704908437; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iuIlMixa+qWdIu7SpCSQCDmDPoiwKpmn6qm/naO42AI=;
 b=hnjRefqabqwKnVk7xXTmFNTPnAvUGvRwPBuOeYoMLek/9VKclXH6RnEKzylRnH8oms
 5sgvNTxCwaL8uYH2uzb5asDf5EyHdTkfSNKBIeKjgHX5YdU0N0AHHnwm/6DYJ/+CrVRK
 ovJ6ttNQLh1uxaIwFq8B7yek8SfrvkL4AVv3Imp0b/jaNVHzN4/5dv/pm1GLDk1JvygW
 XXnR9cIAsJzEGDNEjvBaqagVPuo+1jLuEuvSA6+gUnuXwPjdNKax8/4AK9GPWr0H0S1R
 S9NzhN1y0MsDLnorXSQZFmBrXw8ee21oJefgPtPrGpMgQN2fD0aT1/ktzqEzjGaaKySn
 j0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303637; x=1704908437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iuIlMixa+qWdIu7SpCSQCDmDPoiwKpmn6qm/naO42AI=;
 b=iZcChkS+wOWhcR/Va3FwA2oQGZuJ9yYrkfqKaKwi2ZA/YBRLVTuhsVp437phI5d30L
 ++Sf3AOyPliUVjWRiw5W3EyF1q/Uw52sokbmLMxcWCy3LjHsRkmI4RPte88AmmKqdFVU
 753WlJ4vtFukwt704vp77YNCF4OC8uIRvIopSD3kNaq/kSLy0LLbJ3PEkw6ii86hCWiR
 DEQYILxRsSJo33YDY3BTlsgip0Vrs0PtBfGqf14aBuA8EqS1WD4R4lqlhkAbjsCht2d8
 /4UH9AnAzlGEm/nu0kiNQyJyqb0kOjZkWiD3eJD3/WMgpmFJXZ5wblzllEcE1pg0QmFZ
 Ddcg==
X-Gm-Message-State: AOJu0Ywy9feLGukldupORkKK7J+zDpzieikKZbuzGNwyNqyuMA4CD/zc
 OxjfGIozeK+VfWs83uuaPFBsefBV2l22qg==
X-Google-Smtp-Source: AGHT+IFG7RgRzSWJewNuw7PNEQWgmVz9865RfE5a04Yb0w+skS8lF071qlnK+6/etvYAJu9PUGkVgw==
X-Received: by 2002:aa7:85ce:0:b0:6d9:a5e9:528e with SMTP id
 z14-20020aa785ce000000b006d9a5e9528emr6953694pfn.30.1704303636775; 
 Wed, 03 Jan 2024 09:40:36 -0800 (PST)
Received: from grind.. ([189.79.21.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020aa78503000000b006d7f1ae421csm24042050pfn.145.2024.01.03.09.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:40:36 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, vladimir.isaev@syntacore.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 04/16] target/riscv: move 'mmu' to riscv_cpu_properties[]
Date: Wed,  3 Jan 2024 14:40:01 -0300
Message-ID: <20240103174013.147279-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103174013.147279-1-dbarboza@ventanamicro.com>
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42c.google.com
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
 target/riscv/cpu.c | 55 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e90b70c0a7..9f1407b73f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -419,6 +419,8 @@ static void riscv_max_cpu_init(Object *obj)
     CPURISCVState *env = &cpu->env;
     RISCVMXL mlx = MXL_RV64;
 
+    cpu->cfg.mmu = true;
+
 #ifdef TARGET_RISCV32
     mlx = MXL_RV32;
 #endif
@@ -433,7 +435,11 @@ static void riscv_max_cpu_init(Object *obj)
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
@@ -551,13 +557,18 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
 
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
@@ -569,7 +580,11 @@ static void rv128_base_cpu_init(Object *obj)
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
@@ -1550,8 +1565,38 @@ static const PropertyInfo prop_pmu_mask = {
     .set = prop_pmu_mask_set,
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
+    cpu_option_add_user_setting(name, value);
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
+static const PropertyInfo prop_mmu = {
+    .name = "mmu",
+    .get = prop_mmu_get,
+    .set = prop_mmu_set,
+};
+
 Property riscv_cpu_options[] = {
-    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
@@ -1572,6 +1617,8 @@ static Property riscv_cpu_properties[] = {
     {.name = "pmu-mask", .info = &prop_pmu_mask},
     {.name = "pmu-num", .info = &prop_pmu_num}, /* Deprecated */
 
+    {.name = "mmu", .info = &prop_mmu},
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
-- 
2.43.0


