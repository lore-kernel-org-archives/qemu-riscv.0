Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvfq-0006Pz-9N
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfo-0006NL-Az
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:44 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvfm-0008WI-La
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:50:44 -0400
Received: by mail-oi1-x230.google.com with SMTP id b19so7625278oib.7
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6VgBT2O6XbTMjSjb92N2rctEEcrMV8nXEMeJi/GimA=;
 b=pdun739LhwViA0782mJYQ3iPjo+9ZJpiiNZc9HOHqUoK3DZVXilSIMBGG8it01Rt/3
 6N067XyZhyjJbZ3j4iOm/cHPqVrAi1b6xaDlMs70F2xrlUveQEOJuSAbHCa4NcVQZB2d
 iaUfQWdrqUVnaAYWWnAN3qCFgt8Vb32drLHaPk+b67hr7xtxQNDIjGSreV5pgiblQUs7
 Mqe9IfReE1t5GhwBlsiuJvb97mSEArKxBhZxkzBTmeRb/Fc1TEQlcjSkyChKQ6KiWZT7
 tmnqdc8Am9UgzKMgtTMZvjK8BnZTRV2PSXzFraTIT2yjwD7ShnoweJVATHAnNirWfTAH
 Dq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6VgBT2O6XbTMjSjb92N2rctEEcrMV8nXEMeJi/GimA=;
 b=8E+9Clyo//wf9Ji7BS9nC0a4dYSt0vTeWwLyvKDnWsPt9Q3QzpqWlmLXDX75dE/Sw/
 qKiS63cSBFV0MsNtPSUZjuTMu9NrET54bs4PjGMXStztNLivPdwOx3b6stD/dr2fqCsZ
 XzH8GBgHVWBc25fvZdkwY59eWMBYUGQH3Iw5ZaG5USXy+xVafsGKiKGzEk6kPooFrnx+
 3XtkMnyfT7Ja0yMHYMSCeiuqsqjs8zulndszUSga1rUKYADU+MaNIC00iLySqvrrnZm6
 vuKtW7XSzW/txR65HHu8GDga6FsApDo/PJlZ4mYOlQ2X0ucfS4IhfcsxlbtdOZUz/U/Z
 3rXQ==
X-Gm-Message-State: AO0yUKXb9ApokZBGMhjoJoRara1VyFRVToDcupAFEiauSzE2fN5ah8KQ
 pGBNNHPifb+iWxOW/8rK3Yvzsw==
X-Google-Smtp-Source: AK7set/K4md1vyVnMVUXlvogXQxUpqywfekyhE3cYFsBJOb/TBTnSBP3MyICVeKz8mS/A2qr2MJe1Q==
X-Received: by 2002:a05:6808:56c:b0:383:fa46:af3e with SMTP id
 j12-20020a056808056c00b00383fa46af3emr6381426oig.44.1679957441677; 
 Mon, 27 Mar 2023 15:50:41 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:50:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 15/19] target/riscv: remove cpu->cfg.ext_v
Date: Mon, 27 Mar 2023 19:49:30 -0300
Message-Id: <20230327224934.363314-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Mon, 27 Mar 2023 22:50:44 -0000

Create a new "v" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVV. Instances of cpu->cfg.ext_v and similar are
replaced with riscv_has_ext(env, RVV).

Remove the old "v" property and 'ext_v' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 12 +++++-------
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e02d6f06e8..a916252077 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -877,7 +877,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     /* The V vector extension depends on the Zve64d extension */
-    if (cpu->cfg.ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         cpu->cfg.ext_zve64d = true;
     }
 
@@ -959,7 +959,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksh = true;
     }
 
-    if (cpu->cfg.ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         int vext_version = VEXT_VERSION_1_00_0;
         if (!is_power_of_2(cpu->cfg.vlen)) {
             error_setg(errp,
@@ -1116,7 +1116,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVH)) {
         ext |= RVH;
     }
-    if (riscv_cpu_cfg(env)->ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         ext |= RVV;
     }
     if (riscv_has_ext(env, RVJ)) {
@@ -1454,6 +1454,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVH, .enabled = true},
     {.name = "x-j", .description = "Dynamic translated languages",
      .misa_bit = RVJ, .enabled = false},
+    {.name = "v", .description = "Vector operations",
+     .misa_bit = RVV, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1477,7 +1479,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
@@ -1570,7 +1571,6 @@ static Property riscv_cpu_extensions[] = {
 static void register_cpu_props(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
-    uint32_t misa_ext = cpu->env.misa_ext;
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
@@ -1580,8 +1580,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_v = misa_ext & RVV;
-
         /*
          * We don't want to set the default riscv_cpu_extensions
          * in this case.
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 43a40ba950..c0280ace2a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_v;
     bool ext_zba;
     bool ext_zbb;
     bool ext_zbc;
-- 
2.39.2


