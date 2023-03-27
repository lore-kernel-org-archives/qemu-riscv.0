Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmCB-0008Er-OQ
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 08:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmCA-0008EU-6T
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:30 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmC8-0002qJ-80
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 08:43:29 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-17786581fe1so9073328fac.10
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 05:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679921007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OSF/2nxdcwDZKN3dSMKYqw7KHIdYOdgDb/smyRYwUwQ=;
 b=WoAbOhTN+S2UgyzReQvmRLvhbIe+W+TX1lFiVV2D2xaRWD54czCRL9DBBTBFDNgcAc
 6pOpIYu0A6RyKNtMzYZeSFkSFjDwqQcVqenIzJ+JUTM/gVLwplh9ZOH/Vprj6UDlacq8
 +8fKy886oHB1FBmu+NYx6pvPoNP+aiFX2Cq/Pxq5zMsrdLcCiyIai05R+0QyfubSuT1Z
 RbMobxB3X20oLLnkmUHJE6tydJWvLPb/msJNr5OzDXrgawcVxSC71BP1eVBxYmkyrBYY
 jHI++uEI5rQAzOpLNUWwJ/gkydCtV47S44ddo5yzi/8wuh+KipiIstnTsIXc5qcGIlm+
 FW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OSF/2nxdcwDZKN3dSMKYqw7KHIdYOdgDb/smyRYwUwQ=;
 b=tN4tOZi+XjANlWkYcg1lAPxeH7JnkU7cts7YKweIEoPCbPGKBh+oFk1UjVzvYFujOj
 SX2QUWLg+/6S0lZx+gnloqYeZBC0dzwpUKT7Ww8HNfjg2m38d8Ld7s3jdt/4CdkEXHQj
 ucsV1b86cNT41qjdnPbsuxDyjDCbtxCBY6CJxOyglvbDqowm057BwMDvazWRutXvhUzF
 6E7n5bD4lAOvak2I9iAUE/QL6bDFEQnMNU0FNXUexzm5lkoPXO4dIPjZG3O04/SgnTg+
 4abxg680IhRK8VBaC7dbLMPQXqjhJ6EaaWTFmGx8I4kv+wtKS+GDPdQTJrnDR47i5Etd
 odIw==
X-Gm-Message-State: AO0yUKXHn2PjBtnyd+45K1bZlJvmG5TaILBzMyknU98sSNzG+I+O9VS1
 5DHa9pDUtO6RKxMd0zFkVB3FSg==
X-Google-Smtp-Source: AKy350ZWTwYeYksgD/xVbvLsRm6fwvkcHg7uTeW8bqXY179cfdgbzx7pBCVjGDVVTYuG9eKmfkEX3Q==
X-Received: by 2002:a05:6870:a454:b0:176:26b7:44b3 with SMTP id
 n20-20020a056870a45400b0017626b744b3mr8255958oal.36.1679921006846; 
 Mon, 27 Mar 2023 05:43:26 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m206-20020acabcd7000000b0037d7f4eb7e8sm11136677oif.31.2023.03.27.05.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 05:43:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 11/19] target/riscv: remove cpu->cfg.ext_s
Date: Mon, 27 Mar 2023 09:42:39 -0300
Message-Id: <20230327124247.106595-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327124247.106595-1-dbarboza@ventanamicro.com>
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 12:43:30 -0000

Create a new "s" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVS. Instances of cpu->cfg.ext_s and similar are
replaced with riscv_has_ext(env, RVS).

Remove the old "s" property and 'ext_s' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 11 +++++------
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9f4d8fe7e8..d657ad2fcf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -402,7 +402,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 
     cpu->cfg.ext_g = true;
     cpu->cfg.ext_u = true;
-    cpu->cfg.ext_s = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -837,7 +836,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
@@ -849,7 +848,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
@@ -1109,7 +1108,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVC)) {
         ext |= RVC;
     }
-    if (riscv_cpu_cfg(env)->ext_s) {
+    if (riscv_has_ext(env, RVS)) {
         ext |= RVS;
     }
     if (riscv_cpu_cfg(env)->ext_u) {
@@ -1448,6 +1447,8 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVE, .enabled = false},
     {.name = "m", .description = "Integer multiplication and division",
      .misa_bit = RVM, .enabled = true},
+    {.name = "s", .description = "Supervisor-level instructions",
+     .misa_bit = RVS, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1471,7 +1472,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
@@ -1579,7 +1579,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7a42c80b7d..fc35aa7509 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_s;
     bool ext_u;
     bool ext_h;
     bool ext_j;
-- 
2.39.2


