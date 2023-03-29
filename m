Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZcV-0004xd-Um
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcU-0004xA-GZ
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:58 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcS-0001C8-TR
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:58 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 o26-20020a4ad49a000000b0053964a84b0fso2547917oos.7
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWV9ndGm/Tj2Mukcrmiqzpl3se6Rw9KRBWrrBkUe1O8=;
 b=VH/jaw0EK7N0iTuS7EDQsxDTPzHPBJc7stRkuKIUDQ7ibbiYb3CF/Z+BUlyaoSDRxo
 PW+tc0v8eBu1ro3qBe/BYhxGhsbumDotOmfT6ffaHVD/AMSHx+jbL6IWXS5ITkJ9D1W7
 qxruVaKtgBgyOOR0C5bmDWqKz74l2wEZ1TblaG5xiaHBuECmWcqAbHkq+wMM9jeMBB2M
 VvocblgICX2Qi6rfSkP5y5BhGD/5pz++q2q79s3EcewGwtvn+VrKn8z6O/YgeOoV3DTd
 Avle3jdvmN0QFVrKItsH5MQoPDbpN79YWrmF0l+lQZ+dtSVz4m6aWgGTbv5Ucx775e8c
 MhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JWV9ndGm/Tj2Mukcrmiqzpl3se6Rw9KRBWrrBkUe1O8=;
 b=09nT3R2206Myi13cYF8RWkugZZyANl0MZ+0iQ5XQcFzMjg02elrrlqyhXMvUF4pdP3
 xofSWJaYOc6JwDw5L7RLzT0wPfRWLywnniOpAoOhqMpv5NhgUSEBSsYnh3zvvHyEs1Ze
 UxwdJsDfAZPYUHn338BfUug8MqrL9aEiWFXQDuIPfxzkXKUu8bCUN5D7z5vp0jOBGL3x
 pOApgZ4UQEc0vWAg6+GpFIZ18kaBm+LFl0ZzRvQvjduKU8Wh+C4OtWqWJrXCbbt9XQpF
 K1WFpGXM6gCCteUko1s46Nk9WcoiSPFx5l32nQ/uRIrzpDUBAwv2JaH12tn2bMnIhV2q
 r3MA==
X-Gm-Message-State: AO0yUKWqi+Mw9IJpOHBZ0U/qT9vWjYia8R0ISQG0LP/TwQjXYrRoXlpb
 Bxs6MHyJZEJvIG1sRfREMH3j+w==
X-Google-Smtp-Source: AK7set9/4JOQN5YiBFg34CsgahF83YMNeWwWsNOjBoXqjeb0SRCZCXHATj0Lytt5X3cV0j/aPBnvww==
X-Received: by 2002:a4a:494a:0:b0:525:b0c8:4d4e with SMTP id
 z71-20020a4a494a000000b00525b0c84d4emr10088682ooa.0.1680110996059; 
 Wed, 29 Mar 2023 10:29:56 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 16/20] target/riscv: remove cpu->cfg.ext_v
Date: Wed, 29 Mar 2023 14:28:59 -0300
Message-Id: <20230329172903.636383-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc34.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 17:29:58 -0000

Create a new "v" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVV. Instances of cpu->cfg.ext_v and similar are
replaced with riscv_has_ext(env, RVV).

Remove the old "v" property and 'ext_v' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 12 +++++-------
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 86edc08545..b40a55bc8d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -876,7 +876,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     /* The V vector extension depends on the Zve64d extension */
-    if (cpu->cfg.ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         cpu->cfg.ext_zve64d = true;
     }
 
@@ -958,7 +958,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksh = true;
     }
 
-    if (cpu->cfg.ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         int vext_version = VEXT_VERSION_1_00_0;
         if (!is_power_of_2(cpu->cfg.vlen)) {
             error_setg(errp,
@@ -1115,7 +1115,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVH)) {
         ext |= RVH;
     }
-    if (riscv_cpu_cfg(env)->ext_v) {
+    if (riscv_has_ext(env, RVV)) {
         ext |= RVV;
     }
     if (riscv_has_ext(env, RVJ)) {
@@ -1453,6 +1453,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVH, .enabled = true},
     {.name = "x-j", .description = "Dynamic translated languages",
      .misa_bit = RVJ, .enabled = false},
+    {.name = "v", .description = "Vector operations",
+     .misa_bit = RVV, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1476,7 +1478,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
@@ -1569,7 +1570,6 @@ static Property riscv_cpu_extensions[] = {
 static void register_cpu_props(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
-    uint32_t misa_ext = cpu->env.misa_ext;
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
@@ -1579,8 +1579,6 @@ static void register_cpu_props(Object *obj)
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


