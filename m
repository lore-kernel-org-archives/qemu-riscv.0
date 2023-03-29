Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZcB-0004RN-UH
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZc4-0004PQ-Eq
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:33 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZc2-00012s-Qv
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:32 -0400
Received: by mail-oi1-x231.google.com with SMTP id bj20so12166473oib.3
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0vtkGJLU38HcfUXao6wOAAND11VJePszY8mXcH23VY=;
 b=U6zFrcOnv7uz8n5+ccj7oFEtVytWCnWwwMTBsUHzi8VK7M39OdsZgn71V04sJ+lo00
 Bnk3tuTCeEPpYXR+mMQNEn9pUHJcLHc7ANpE5Zj8empXCpAzAAWOqyC3/OfvDrpA0Kdg
 4ZFB7nTZnHOuEpspD2d9P52Kr2qljQM4EEVatmygullb5bp01D1bJkSLX5oeMkbWLbN2
 7+V6aV94h+RXs4hZ3Lgr1fagvxfGyB0s5uYi7jbBLw9qPnD6hedOg25KV0eUU4i5Aryt
 ieM1/Kdm9lQL9o6/DQ/o12g3juuXL7xE8BDmXyelbJ+Uy+vmfQK57QMZakDFc1wpTLKs
 /egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0vtkGJLU38HcfUXao6wOAAND11VJePszY8mXcH23VY=;
 b=fw/d4FHn5fKkTe2K3lnKp/qsrrnHonHCH44CEBuXxnW1WJkJ7iP8ENwbQzOU9tmh/A
 3rxMUtz9nOAOclbvz/KPXaPU88QdnrdnYeI6BwaM0uTrU74S8E4iDYDj4RnPCEZraQG2
 0Yp9Bba2ZGQ2lomOUW53ukn24TilRu0NpEXl4PdQgUltzCwlEHsNRhG8kwxxt9ZIeAfg
 rBRELdd1LlBpxrt6/AYiMop2Ixkz2VdWdXeB1Zp67+R1Mx0RlCVxUl11POUhw/k/FCsy
 nCGlOwd84948Lgsw5A/sBQOoCsSsWyAiIgKWbojyjfGG577VgZmE4SPUFcHoKUo7yMIg
 VbcQ==
X-Gm-Message-State: AO0yUKWnUY3Nob6fpTktDoH2Qj53xv8Htqi/eX5KNhiI7O0UQ5YD09oB
 wGCkrq21HZTnjhMBBvTYXyaBnjfPADWo68+RCrk=
X-Google-Smtp-Source: AK7set/tY1YBVVYCD10gJ+6JGLsvGt27tfs3vM28YVGoCu7Cm5qn37h7zhQE4CSNtWQD10QPf9q2kg==
X-Received: by 2002:a05:6808:b29:b0:386:c6dd:6204 with SMTP id
 t9-20020a0568080b2900b00386c6dd6204mr9566775oij.8.1680110970175; 
 Wed, 29 Mar 2023 10:29:30 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:29 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 07/20] target/riscv: remove cpu->cfg.ext_d
Date: Wed, 29 Mar 2023 14:28:50 -0300
Message-Id: <20230329172903.636383-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 17:29:33 -0000

Create a new "d" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVD. Instances of cpu->cfg.ext_d and similar are
replaced with riscv_has_ext(env, RVD).

Remove the old "d" property and 'ext_d' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 13 ++++++-------
 target/riscv/cpu.h |  1 -
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 693ff10cab..9bb714d0d8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -812,13 +812,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
-                            cpu->cfg.ext_f && cpu->cfg.ext_d &&
+                            cpu->cfg.ext_f && riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
         cpu->cfg.ext_f = true;
-        cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
 
@@ -874,7 +873,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+    if (riscv_has_ext(env, RVD) && !cpu->cfg.ext_f) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
@@ -894,7 +893,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zve32f = true;
     }
 
-    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+    if (cpu->cfg.ext_zve64d && !riscv_has_ext(env, RVD)) {
         error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
@@ -1104,7 +1103,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_f) {
         ext |= RVF;
     }
-    if (riscv_cpu_cfg(env)->ext_d) {
+    if (riscv_has_ext(env, RVD)) {
         ext |= RVD;
     }
     if (riscv_has_ext(env, RVC)) {
@@ -1439,6 +1438,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVA, .enabled = true},
     {.name = "c", .description = "Compressed instructions",
      .misa_bit = RVC, .enabled = true},
+    {.name = "d", .description = "Double-precision float point",
+     .misa_bit = RVD, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1466,7 +1467,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
-    DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1578,7 +1578,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_f = misa_ext & RVF;
-        cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c6dc24d236..e4cf79e36f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ struct RISCVCPUConfig {
     bool ext_g;
     bool ext_m;
     bool ext_f;
-    bool ext_d;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


