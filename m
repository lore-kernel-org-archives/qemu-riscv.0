Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D154C3DA49
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 23:33:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWOyQ-0004Oe-3M; Tue, 23 Jul 2024 19:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxw-0002Kq-0Q
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:45 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sWOxp-0007y5-Mj
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2024 19:30:42 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7a103ac7be3so754376a12.3
 for <qemu-riscv@nongnu.org>; Tue, 23 Jul 2024 16:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721777433; x=1722382233;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RA26pTTCCGZrMwpdrKiBc0SSPwJQN39A/vQ5CD8f/Ik=;
 b=IsXdODkZs+yOIsfGsqt7uOkaOyYQHPUsANbmCuMfsBV+aM9BFtCbyv+EYZjatefluq
 peMbmq1bhVsrMsLyXsYvbf0KgEd6AIivmeAE1Is57BP0trGxLD9ImFvONb1HVN3l3341
 PZO3IyFvALo3sqQBMMu0raAMUmT7QM/AaM0N+vpgEeZtdiU1Xqe89z+Z6Ya79bSIlNzD
 mvJLHRSHfLZdFoUwiQxd8MiidZ+WD47s2v7BivDaqWUE7jk1SXDLq/O42K151nyvSYyV
 35okYqAR9zDWjsuKaoz1SL4f3+BnlSYIhw6rTqcvp2cRx0Ps+KmXQWtvdee9h3t6vEnD
 oyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721777433; x=1722382233;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RA26pTTCCGZrMwpdrKiBc0SSPwJQN39A/vQ5CD8f/Ik=;
 b=comYTZRwdSozZuhmCFol5IH9wWMfqQnWqwOjTXCi5M437LSG43Pesu9aUaowg6Fchg
 GTNpJZs7gKjn+ay9dqUuIYn6ilxyhl1ZN2Xobu7m9bYdSdCZyImBzPzUEYIz1alD4aiC
 xOUcP6jeZ3b1L6x6VG4AkDPQnfKn6GjMRohR7kgWr5NKsIlKFIkdf/lFEU9gOx+aCHB4
 pg5EH4tXT5oMiu5/WU/Q6FyYNzKgAu+u6VN8LdEWxR4f2QpbhOptoOhOP+Mtngbqnc7A
 0JyOj8rUm6nNZabDDadb2duNOkLWburpk3WDBB79jNdB6anasDccNzM26u2LkzJhIl4v
 HaqA==
X-Gm-Message-State: AOJu0Yx4tWfJ7XstbiX7fDjwhBHo9e0dCVWk4InCC1i579+7xDhn+8bP
 lkBsB21yLFN9IcRx+T9UMwz3q++hiHJs13p3hERA8E6HYAAQMalx2j2aY6pE++I=
X-Google-Smtp-Source: AGHT+IFn6T8UUPLvJ8lAom0orLgIB6YlSSvE4DjPyecnjT5NqeUo8OINB5Byiv45uhr9LJFHlGXzzQ==
X-Received: by 2002:a17:90b:390e:b0:2c9:8b33:3197 with SMTP id
 98e67ed59e1d1-2cdae35852fmr1368962a91.10.1721777432784; 
 Tue, 23 Jul 2024 16:30:32 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb74e894csm179217a91.41.2024.07.23.16.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 16:30:32 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 23 Jul 2024 16:30:08 -0700
Subject: [PATCH v2 11/13] target/riscv: Repurpose the implied rule
 startergy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-counter_delegation-v2-11-c4170a5348ca@rivosinc.com>
References: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
In-Reply-To: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The current infrastructure for implied ISA extension enabling can
be used for other cases where a particular ISA is dependant on
multiple other ISA extension to enable all the features.

Rename the implied rule functions/data structures to accomodate that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/tcg/tcg-cpu.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index d78d5960cf30..1c9a87029423 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -40,7 +40,7 @@
 static GHashTable *multi_ext_user_opts;
 static GHashTable *misa_ext_user_opts;
 
-static GHashTable *multi_ext_implied_rules;
+static GHashTable *multi_ext_enabling_rules;
 static GHashTable *misa_ext_implied_rules;
 
 static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
@@ -730,7 +730,7 @@ static void riscv_cpu_validate_profiles(RISCVCPU *cpu)
     }
 }
 
-static void riscv_cpu_init_implied_exts_rules(void)
+static void riscv_cpu_init_ext_rules(void)
 {
     RISCVCPUImpliedExtsRule *rule;
 #ifndef CONFIG_USER_ONLY
@@ -756,14 +756,14 @@ static void riscv_cpu_init_implied_exts_rules(void)
 #ifndef CONFIG_USER_ONLY
         rule->enabled = bitmap_new(ms->smp.cpus);
 #endif
-        g_hash_table_insert(multi_ext_implied_rules,
+        g_hash_table_insert(multi_ext_enabling_rules,
                             GUINT_TO_POINTER(rule->ext), (gpointer)rule);
     }
 
     initialized = true;
 }
 
-static void cpu_enable_implied_rule(RISCVCPU *cpu,
+static void cpu_enable_ext_rule(RISCVCPU *cpu,
                                     RISCVCPUImpliedExtsRule *rule)
 {
     CPURISCVState *env = &cpu->env;
@@ -787,7 +787,7 @@ static void cpu_enable_implied_rule(RISCVCPU *cpu,
                                              GUINT_TO_POINTER(misa_bits[i]));
 
                     if (ir) {
-                        cpu_enable_implied_rule(cpu, ir);
+                        cpu_enable_ext_rule(cpu, ir);
                     }
                 }
             }
@@ -798,12 +798,12 @@ static void cpu_enable_implied_rule(RISCVCPU *cpu,
              rule->implied_multi_exts[i] != RISCV_IMPLIED_EXTS_RULE_END; i++) {
             cpu_cfg_ext_auto_update(cpu, rule->implied_multi_exts[i], true);
 
-            ir = g_hash_table_lookup(multi_ext_implied_rules,
-                                     GUINT_TO_POINTER(
-                                         rule->implied_multi_exts[i]));
+                ir = g_hash_table_lookup(multi_ext_enabling_rules,
+                                        GUINT_TO_POINTER(
+                                            rule->implied_multi_exts[i]));
 
             if (ir) {
-                cpu_enable_implied_rule(cpu, ir);
+                cpu_enable_ext_rule(cpu, ir);
             }
         }
 
@@ -844,7 +844,7 @@ static void cpu_enable_zc_implied_rules(RISCVCPU *cpu)
     }
 }
 
-static void riscv_cpu_enable_implied_rules(RISCVCPU *cpu)
+static void riscv_cpu_enable_ext_rules(RISCVCPU *cpu)
 {
     RISCVCPUImpliedExtsRule *rule;
     int i;
@@ -855,14 +855,14 @@ static void riscv_cpu_enable_implied_rules(RISCVCPU *cpu)
     /* Enable the implied MISAs. */
     for (i = 0; (rule = riscv_misa_ext_implied_rules[i]); i++) {
         if (riscv_has_ext(&cpu->env, rule->ext)) {
-            cpu_enable_implied_rule(cpu, rule);
+            cpu_enable_ext_rule(cpu, rule);
         }
     }
 
     /* Enable the implied extensions. */
     for (i = 0; (rule = riscv_multi_ext_implied_rules[i]); i++) {
         if (isa_ext_is_enabled(cpu, rule->ext)) {
-            cpu_enable_implied_rule(cpu, rule);
+            cpu_enable_ext_rule(cpu, rule);
         }
     }
 }
@@ -872,8 +872,8 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
-    riscv_cpu_init_implied_exts_rules();
-    riscv_cpu_enable_implied_rules(cpu);
+    riscv_cpu_init_ext_rules();
+    riscv_cpu_enable_ext_rules(cpu);
 
     riscv_cpu_validate_misa_priv(env, &local_err);
     if (local_err != NULL) {
@@ -1385,8 +1385,8 @@ static void riscv_tcg_cpu_instance_init(CPUState *cs)
         misa_ext_implied_rules = g_hash_table_new(NULL, g_direct_equal);
     }
 
-    if (!multi_ext_implied_rules) {
-        multi_ext_implied_rules = g_hash_table_new(NULL, g_direct_equal);
+    if (!multi_ext_enabling_rules) {
+        multi_ext_enabling_rules = g_hash_table_new(NULL, g_direct_equal);
     }
 
     riscv_cpu_add_user_properties(obj);

-- 
2.34.1


