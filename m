Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7rC-0005oR-Fz
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rA-0005n9-84
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:36 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7r8-0002r7-9i
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:35 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 l16-20020a9d4c10000000b006944b17058cso8751817otf.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYMlE/F1S0n9ko7FKmrIGnYN/pdSAseR81vgrE7fIjY=;
 b=iz6Q/HzY9A8Iq0JiWP3kdbgXLdhRbKgy0wC7PSxZtR/9uYNJyIrU+xw1QhpYdbNl3R
 zLayJC5ceEvHiWlE+n49j23AQyRCzI1yUCPxYClzQg083ts4OhaylyRcEXonNoct5hsV
 q7fLRBS7eaXSrdaJK9hMEoZDaqLSMvVuevytn1dVGwhSVetIY/4yPRNq2bsYazElIftW
 2ShQzj2N+zULcnCi5xObZVYtTq306M2uPKAbUgWXyHFad0BZIE2JdIO9buLiRF4hbzxU
 5d1WmzzbwLdVJTigvBivspTddtExKXfjUyfF0jjpjZDrhNGQZN75FykN8kq/Wtedo9Ph
 UyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oYMlE/F1S0n9ko7FKmrIGnYN/pdSAseR81vgrE7fIjY=;
 b=Lm/T+dWOAuoqUA0SHY0ray9IPs7od8bcjr7AiRynZh3IWevaT/UZxoWIhQUFr7Gt/8
 Mg/WhjJnQd1vtSr+OHQlhMcilfmoir1FdYrdEFnTMIz6XyJaizu07sf3+GHb9td9OrQ0
 KJhiWMKqMTeV2JVgEUnkB6Ts8e1pB9xpfgrvp+3ayRMj4anoWSQLR3h1NGqgdPtOq3vq
 sZ579Dd3T0sUh/V87ym7x5NtSmDE6FqliZsEm3gnjt5glCpADwxarq0r8nOzA1+jX0sa
 2Nqf4Ey3f3TNLMhoOCg6zKRVa/cpxx7RKW7LhlF5SSIJUCbcmFMGRwQK9250YimHLGlv
 touQ==
X-Gm-Message-State: AO0yUKUXujXNiwh05dMduLd3k3CIeDGHPVj99xISn5wRdapl9Dh5p4Vn
 rRAqu49IsbH1u/NW61XKyzny3g==
X-Google-Smtp-Source: AK7set9YNR3zbPeh6kI/YAfAtPUldmbDTsFwaC5vTo2gzE9x25WXJK5pQbzRkUxVaKC+OI6lgS4ZuA==
X-Received: by 2002:a9d:5f9d:0:b0:694:2f51:129b with SMTP id
 g29-20020a9d5f9d000000b006942f51129bmr17465901oti.24.1678812633643; 
 Tue, 14 Mar 2023 09:50:33 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:33 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 13/26] target/riscv: put env->misa_ext <-> cpu->cfg
 code into helpers
Date: Tue, 14 Mar 2023 13:49:35 -0300
Message-Id: <20230314164948.539135-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:36 -0000

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
index 6b5096d25e..28d4c5f768 100644
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
@@ -1156,42 +1197,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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


