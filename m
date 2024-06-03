Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AE1C25B75
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 06:06:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sE0pN-0004pa-Q9; Mon, 03 Jun 2024 02:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sE0pM-0004oq-Hg
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 02:05:52 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sE0pJ-0008E4-9w
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 02:05:52 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-6818eea9c3aso2097069a12.1
 for <qemu-riscv@nongnu.org>; Sun, 02 Jun 2024 23:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717394748; x=1717999548; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HMMpEE/JJctlG7sQRtnFuABlbxP7zrN/AaVKCJ+lHgY=;
 b=C4Rng5iU8y4iiQGZslvPTAKORiXvNfU3QhXY4sVE43W4AwKm7cGBml3I7kjQMy1ucW
 A9b+jD6RHdLVSYARnzVh2GD40LFGyyOPFi2CxqcozFe3qW+ZM7z/Jd9kRvl+G/ceXd31
 fFsc2q5+8aiEQxZcNWjIYr2VjKtME44irazMOxnNRUz3SHdiUEOdC2hoGfmLUGo364tP
 co2v+VzhqZgQfAcycTEm+6jwgcUHf1MbUR2jk7k8PwbHiwVyKtvmjuQ3T9vDA/aNXrnz
 4Cy631cNzUlN4hTT2ntj+8BjFDXcgQ6BnGmBgoQbvydRcwZjX/elBxlLiDkN/D5FcCgE
 kMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717394748; x=1717999548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HMMpEE/JJctlG7sQRtnFuABlbxP7zrN/AaVKCJ+lHgY=;
 b=vioEiRuuRvTPeZcIQNGeMBF5lqJSRmMWzNwZnpcTgzeheka5BxSyUocNAB9utylsBw
 xzspWnU98vkGOiIrtOmxyUCyYHZhJL7VsCzExyxqzaNzrWGAqhO42BqSc9Nj62KyY8HG
 txX5rk/nuJBC2ccjKg6Czvg/nbAcFMbZ7UUo+o0cfdoQzNNZOoOABiPAUROGBh0QhejQ
 djU/xPlQySGop2ANFXp+XGZUWObvozWfnPRCrZToag0wtpu3RY/IFL7zHlZWKLGSO94r
 i0bsI8YUy6m/9ewlTgZadAgM7p57vakPJtZB9uofKwWUJRLIQPpdCU2SYWC0Yly7s/Jz
 Wvsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpWogvdRmq7g8OTQoBUgZqSi1e0qxjl2OI7iBLUr6DjEXjtZwh70hGRYZdavB4XGlmlm+LFcLo3d4sxbqnO4YIpw0odjM=
X-Gm-Message-State: AOJu0Yx0G9psMpb/0c8N2j9l11Uhm8dfJIquyIKBjOcO+PDfifnI+q70
 VF3J/KEA4KVtewU/egFBdWU/00QRUSvuXOVzBX4I6AMZbS50HELfmzWmnFD6Kjw=
X-Google-Smtp-Source: AGHT+IGu5ftOfA/JtCy+4wUkRnaKf3q7nfRkApiG/GZk3F15YJN8vlw85xLn8O1expcuBXH0Pzb/Gg==
X-Received: by 2002:a17:90a:db43:b0:2b5:340d:cfcc with SMTP id
 98e67ed59e1d1-2c1dc573642mr6446240a91.11.1717394747729; 
 Sun, 02 Jun 2024 23:05:47 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1a77afa1fsm7149291a91.42.2024.06.02.23.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 23:05:47 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>,
 Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Subject: [PATCH 2/6] target/riscv: Introduce extension implied rule helpers
Date: Mon,  3 Jun 2024 14:05:18 +0800
Message-ID: <20240603060522.2180-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240603060522.2180-1-frank.chang@sifive.com>
References: <20240603060522.2180-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Introduce helpers to enable the extensions based on the implied rules.
The implied extensions are enabled recursively, so we don't have to
expand all of them manually. This also eliminates the old-fashioned
ordering requirement. For example, Zvksg implies Zvks, Zvks implies
Zvksed, etc., removing the need to check the implied rules of Zvksg
before Zvks.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
---
 target/riscv/tcg/tcg-cpu.c | 84 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 683f604d9f..243a8547a2 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -36,6 +36,9 @@
 static GHashTable *multi_ext_user_opts;
 static GHashTable *misa_ext_user_opts;

+static GHashTable *misa_implied_rules;
+static GHashTable *ext_implied_rules;
+
 static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
 {
     return g_hash_table_contains(multi_ext_user_opts,
@@ -833,11 +836,90 @@ static void riscv_cpu_validate_profiles(RISCVCPU *cpu)
     }
 }

+static void riscv_cpu_init_implied_exts_rules(void)
+{
+    RISCVCPUImpliedExtsRule *rule;
+    int i;
+
+    for (i = 0; (rule = riscv_misa_implied_rules[i]); i++) {
+        g_hash_table_insert(misa_implied_rules, GUINT_TO_POINTER(rule->ext),
+                            (gpointer)rule);
+    }
+
+    for (i = 0; (rule = riscv_ext_implied_rules[i]); i++) {
+        g_hash_table_insert(ext_implied_rules, GUINT_TO_POINTER(rule->ext),
+                            (gpointer)rule);
+    }
+}
+
+static void cpu_enable_implied_rule(RISCVCPU *cpu,
+                                    RISCVCPUImpliedExtsRule *rule)
+{
+    CPURISCVState *env = &cpu->env;
+    RISCVCPUImpliedExtsRule *ir;
+    int i;
+
+    if (!rule->enabled) {
+        /* Enable the implied MISAs. */
+        if (rule->implied_misas) {
+            riscv_cpu_set_misa_ext(env, env->misa_ext | rule->implied_misas);
+
+            for (i = 0; misa_bits[i] != 0; i++) {
+                if (rule->implied_misas & misa_bits[i]) {
+                    ir = g_hash_table_lookup(misa_implied_rules,
+                                             GUINT_TO_POINTER(misa_bits[i]));
+
+                    if (ir) {
+                        cpu_enable_implied_rule(cpu, ir);
+                    }
+                }
+            }
+        }
+
+        /* Enable the implied extensions. */
+        for (i = 0; rule->implied_exts[i] != RISCV_IMPLIED_EXTS_RULE_END; i++) {
+            cpu_cfg_ext_auto_update(cpu, rule->implied_exts[i], true);
+
+            ir = g_hash_table_lookup(ext_implied_rules,
+                                     GUINT_TO_POINTER(rule->implied_exts[i]));
+
+            if (ir) {
+                cpu_enable_implied_rule(cpu, ir);
+            }
+        }
+
+        rule->enabled = true;
+    }
+}
+
+static void riscv_cpu_enable_implied_rules(RISCVCPU *cpu)
+{
+    RISCVCPUImpliedExtsRule *rule;
+    int i;
+
+    /* Enable the implied MISAs. */
+    for (i = 0; (rule = riscv_misa_implied_rules[i]); i++) {
+        if (riscv_has_ext(&cpu->env, rule->ext)) {
+            cpu_enable_implied_rule(cpu, rule);
+        }
+    }
+
+    /* Enable the implied extensions. */
+    for (i = 0; (rule = riscv_ext_implied_rules[i]); i++) {
+        if (isa_ext_is_enabled(cpu, rule->ext)) {
+            cpu_enable_implied_rule(cpu, rule);
+        }
+    }
+}
+
 void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;

+    riscv_cpu_init_implied_exts_rules();
+    riscv_cpu_enable_implied_rules(cpu);
+
     riscv_cpu_validate_misa_priv(env, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1343,6 +1425,8 @@ static void riscv_tcg_cpu_instance_init(CPUState *cs)

     misa_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
     multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
+    misa_implied_rules = g_hash_table_new(NULL, g_direct_equal);
+    ext_implied_rules = g_hash_table_new(NULL, g_direct_equal);
     riscv_cpu_add_user_properties(obj);

     if (riscv_cpu_has_max_extensions(obj)) {
--
2.43.2


