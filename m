Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTy9-00010B-27
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTy7-0000zc-QQ
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:19 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTy5-0000an-8S
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:19 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17e140619fdso43207206fac.11
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2W7bGVL35Yc0UFJ+sEGELn4vLTKReJQVA0yDUn5MBBM=;
 b=SMHpaWSFqtU91jTW6Cl0C/3keH5J8sTNOlKTldTOCG+iIMLpAE+7IbisP6VHx2LRwb
 vZKc/xeDoNTP6HsF1FSdDx+3PVIv0rYZE9rI+fBqfJq/W5ihh2rlhHRtyGxy4T66oP9n
 XkRZTFwlBfMHJD6s9uRxOAU6G7MtECJzXIE5s7QCQaMSPs98e08cv81vnJq+DZUVAtQ8
 GMTrRa0PVO/nK5A/cruIlR7TqqyOqVNaT9RXi7MUjxGCG2iluaXtoOxRuOjL+IiZ/Pl0
 kI/XJ69JNzqd+dh9A7PFPsh8Epr7e53a2XsX4DL7xgM3YjvWc0ajG7lRVcWknrcuwl6l
 Jv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2W7bGVL35Yc0UFJ+sEGELn4vLTKReJQVA0yDUn5MBBM=;
 b=2VtZPepDbESL+kfC9ftMx+zI78XsLmW9tGGZcBEPTaEj7uf/FJkxNUNKvBnRnu1Znd
 UKoMUvqPdJuwVjUYDhN7JSmxdWodrObWJEZRtZDRuMcZesVP20sanf0qok0Oo05kgdOA
 yD8noJ0g5VjERsr6GsoFR/GMkUmHQ8LZewNzS4iUs+4vhKJstg0d1bdgEl3ubdUXYTKK
 CQZ0BTAJy9dchOGGkRF0uvkqhMdoOD0mP1xx3At90CadmtV+p/nU9nFxj+JerIvF00XU
 djmrBMnLjC5XfHcl+NRBfqHMGcxUIF8zlGCy3HUzgsjhVPT0BsoCp+GuAozCWe1R5asJ
 vzGQ==
X-Gm-Message-State: AAQBX9fvEqTdro18y+EdtUr5ahZxASCkY6UtI3Jr/OcYdP3fWAg+qMKK
 Wuou187UrCmlQEJ7H3NOkf63WQ==
X-Google-Smtp-Source: AKy350ZIvOyYqFqw03bZ15Nan5w7+1SyMWfxL3XFP9qdyPey6THgp/j8Pzca0TJH9p172s8ZnL8A2w==
X-Received: by 2002:a05:6870:911f:b0:183:c9a0:ef36 with SMTP id
 o31-20020a056870911f00b00183c9a0ef36mr64998oae.40.1680804255245; 
 Thu, 06 Apr 2023 11:04:15 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:14 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 05/20] target/riscv: remove cpu->cfg.ext_a
Date: Thu,  6 Apr 2023 15:03:36 -0300
Message-Id: <20230406180351.570807-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:04:20 -0000

Create a new "a" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVA. Instances of cpu->cfg.ext_a and similar are
replaced with riscv_has_ext(env, RVA).

Remove the old "a" property and 'ext_a' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 16 ++++++++--------
 target/riscv/cpu.h |  1 -
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3b234a03d0..3770fd4f6f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -819,13 +819,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
-                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                            cpu->cfg.ext_d &&
+                            riscv_has_ext(env, RVA) &&
+                            cpu->cfg.ext_f && cpu->cfg.ext_d &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
-        cpu->cfg.ext_a = true;
         cpu->cfg.ext_f = true;
         cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
@@ -869,7 +868,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+    if ((cpu->cfg.ext_zawrs) && !riscv_has_ext(env, RVA)) {
         error_setg(errp, "Zawrs extension requires A extension");
         return;
     }
@@ -1160,7 +1159,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_m) {
         ext |= RVM;
     }
-    if (riscv_cpu_cfg(env)->ext_a) {
+    if (riscv_has_ext(env, RVA)) {
         ext |= RVA;
     }
     if (riscv_cpu_cfg(env)->ext_f) {
@@ -1496,7 +1495,10 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
-static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {};
+static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
+    {.name = "a", .description = "Atomic instructions",
+     .misa_bit = RVA, .enabled = true},
+};
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 {
@@ -1522,7 +1524,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
-    DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
     DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
@@ -1645,7 +1646,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
-        cpu->cfg.ext_a = misa_ext & RVA;
         cpu->cfg.ext_f = misa_ext & RVF;
         cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cbf3de2708..1d1a17d85b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -426,7 +426,6 @@ struct RISCVCPUConfig {
     bool ext_e;
     bool ext_g;
     bool ext_m;
-    bool ext_a;
     bool ext_f;
     bool ext_d;
     bool ext_c;
-- 
2.39.2


