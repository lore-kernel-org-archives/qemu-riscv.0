Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf6q2-0006SM-3B
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6q1-0006SD-Bi
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:21:45 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6pt-0006Vf-HT
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:21:44 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1755e639b65so20932318fac.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=te1h2KJtHjxr5984Nn4ryuLU3cbmePxUQ78YXA41udU=;
 b=cT2kEOPjpZSxK2jroviqtuOPPGXBHKLxkCYsdwjjxJUUR1m4/g4jBYmNIv/3r9R6tR
 iuPoGCSoaVQP7p7KhR/dvufAkh104r0G+InG3S76W46lOJidQAOFGz/HBfdWVcr4KWHH
 vd0t+rtM17+7M6mQBKWOA5OUFTRHccEXxlWb4S6tsBJC2p9pzF2pO7XSVk2MchdR2Mwp
 QA92H4+FQnaclVcrG3iCkBXuO7/QS5cu2fhPrQxfhiYI9aSJRqdgvBNxU7VrIGuYZrWt
 rWOJ5FOIFYnyvW84Edhdrw0tbJ7aWPKebv/dIh+UUMTYF9hDRt0eaeS8vrl484YnOzka
 as6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=te1h2KJtHjxr5984Nn4ryuLU3cbmePxUQ78YXA41udU=;
 b=04r56aiG6dvCXG4Ku+RYL1tSMebDQRAkcNGtseYYBPtiY0z3kJ1V+InI5W/CAQfP+L
 9UvAPNO39Ky4C/CGxrPaHj8ynE8I8f5wdkia4RS3ardz4G97chOXt/t6eQ4dIQQDV19d
 5nvNXib3xZIxVS0K0YwrW7wflEhYlkInoPolJdATn+vGruCpGKEBB9Cs4Dp95THW6taa
 zv8nzVDTkqYT0fiqLiZo/3PF7KCPFi7HbuF5BY2TFfe+Ohk7DHktiU5DCQ5/n4NBmwiD
 jSKAXOLw6ATQN4YcK/YP1qqMt2cWem9GdQbZmvYznxu18qRQ1iRAJh81tk87zltTUkk6
 ki9Q==
X-Gm-Message-State: AO0yUKUIUCpt0Gg31HliTQ+2po59bVyikK+5mvBPL6N9RfR7L38T0PLJ
 kF7qAtxAz5eiFSUNWeRr5AnVOA==
X-Google-Smtp-Source: AK7set+ngF70OEAYQejXvgyuhc52/ImQUp2+JKRCvvc2vT+2wKUEYbN4KCv/dcrgofq5GZxQfMHmJw==
X-Received: by 2002:a05:6870:330f:b0:177:a776:8207 with SMTP id
 x15-20020a056870330f00b00177a7768207mr909299oae.36.1679523662443; 
 Wed, 22 Mar 2023 15:21:02 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 13/25] target/riscv: put env->misa_ext <-> cpu->cfg
 code into helpers
Date: Wed, 22 Mar 2023 19:19:52 -0300
Message-Id: <20230322222004.357013-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 22 Mar 2023 22:21:45 -0000

The extremely tedious code that sets cpu->cfg based on misa_ext, and
vice-versa, is scattered around riscv_cpu_validate_set_extensions() and
set_misa().

Introduce helpers to do this work, cleaning up the logic of both
functions a bit. While we're at it, add a note in cpu.h informing that
any future change in MISA RV* bits should also be reflected in the
helpers as well.

We'll want to keep env->misa_ext changes in sync with cpu->cfg during
realize() in the next patches, and both helpers will have a role to play
in that.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 120 ++++++++++++++++++++++++---------------------
 target/riscv/cpu.h |   3 +-
 2 files changed, 65 insertions(+), 58 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0e56a1c01f..c4f18d0436 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -234,10 +234,69 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
     }
 }
 
-static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
+static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
 {
-    RISCVCPU *cpu;
+    uint32_t ext = 0;
 
+    if (cfg->ext_i) {
+        ext |= RVI;
+    }
+    if (cfg->ext_e) {
+        ext |= RVE;
+    }
+    if (cfg->ext_m) {
+        ext |= RVM;
+    }
+    if (cfg->ext_a) {
+        ext |= RVA;
+    }
+    if (cfg->ext_f) {
+        ext |= RVF;
+    }
+    if (cfg->ext_d) {
+        ext |= RVD;
+    }
+    if (cfg->ext_c) {
+        ext |= RVC;
+    }
+    if (cfg->ext_s) {
+        ext |= RVS;
+    }
+    if (cfg->ext_u) {
+        ext |= RVU;
+    }
+    if (cfg->ext_h) {
+        ext |= RVH;
+    }
+    if (cfg->ext_v) {
+        ext |= RVV;
+    }
+    if (cfg->ext_j) {
+        ext |= RVJ;
+    }
+
+    return ext;
+}
+
+static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
+                                       uint32_t misa_ext)
+{
+    cfg->ext_i = misa_ext & RVI;
+    cfg->ext_e = misa_ext & RVE;
+    cfg->ext_m = misa_ext & RVM;
+    cfg->ext_a = misa_ext & RVA;
+    cfg->ext_f = misa_ext & RVF;
+    cfg->ext_d = misa_ext & RVD;
+    cfg->ext_v = misa_ext & RVV;
+    cfg->ext_c = misa_ext & RVC;
+    cfg->ext_s = misa_ext & RVS;
+    cfg->ext_u = misa_ext & RVU;
+    cfg->ext_h = misa_ext & RVH;
+    cfg->ext_j = misa_ext & RVJ;
+}
+
+static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
+{
     env->misa_mxl_max = env->misa_mxl = mxl;
     env->misa_ext_mask = env->misa_ext = ext;
 
@@ -251,25 +310,7 @@ static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
         return;
     }
 
-    /*
-     * We can't use riscv_cpu_cfg() in this case because it is
-     * a read-only inline and we're going to change the values
-     * of cpu->cfg.
-     */
-    cpu = env_archcpu(env);
-
-    cpu->cfg.ext_i = ext & RVI;
-    cpu->cfg.ext_e = ext & RVE;
-    cpu->cfg.ext_m = ext & RVM;
-    cpu->cfg.ext_a = ext & RVA;
-    cpu->cfg.ext_f = ext & RVF;
-    cpu->cfg.ext_d = ext & RVD;
-    cpu->cfg.ext_v = ext & RVV;
-    cpu->cfg.ext_c = ext & RVC;
-    cpu->cfg.ext_s = ext & RVS;
-    cpu->cfg.ext_u = ext & RVU;
-    cpu->cfg.ext_h = ext & RVH;
-    cpu->cfg.ext_j = ext & RVJ;
+    riscv_set_cpucfg_with_misa(&env_archcpu(env)->cfg, ext);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1153,42 +1194,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      */
     riscv_cpu_disable_priv_spec_isa_exts(cpu);
 
-    if (cpu->cfg.ext_i) {
-        ext |= RVI;
-    }
-    if (cpu->cfg.ext_e) {
-        ext |= RVE;
-    }
-    if (cpu->cfg.ext_m) {
-        ext |= RVM;
-    }
-    if (cpu->cfg.ext_a) {
-        ext |= RVA;
-    }
-    if (cpu->cfg.ext_f) {
-        ext |= RVF;
-    }
-    if (cpu->cfg.ext_d) {
-        ext |= RVD;
-    }
-    if (cpu->cfg.ext_c) {
-        ext |= RVC;
-    }
-    if (cpu->cfg.ext_s) {
-        ext |= RVS;
-    }
-    if (cpu->cfg.ext_u) {
-        ext |= RVU;
-    }
-    if (cpu->cfg.ext_h) {
-        ext |= RVH;
-    }
-    if (cpu->cfg.ext_v) {
-        ext |= RVV;
-    }
-    if (cpu->cfg.ext_j) {
-        ext |= RVJ;
-    }
+    ext = riscv_get_misa_ext_with_cpucfg(&cpu->cfg);
 
     env->misa_ext_mask = env->misa_ext = ext;
 }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ebe0fff668..2263629332 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,7 +66,8 @@
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 /*
- * Consider updating set_misa() when adding new
+ * Consider updating riscv_get_misa_ext_with_cpucfg()
+ * and riscv_set_cpucfg_with_misa() when adding new
  * MISA bits here.
  */
 #define RVI RV('I')
-- 
2.39.2


