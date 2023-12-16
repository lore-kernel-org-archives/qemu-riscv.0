Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B7FC46CA2
	for <qemu-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 13:53:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rEV5F-00018V-JG; Sat, 16 Dec 2023 08:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV5D-00016z-Hs; Sat, 16 Dec 2023 08:51:59 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV5A-0001Do-AA; Sat, 16 Dec 2023 08:51:59 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a1ca24776c3so508048766b.0; 
 Sat, 16 Dec 2023 05:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702734714; x=1703339514; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRDEQh1JkAlYBSiLzwHd6WKlB2tHlxIi9rObWqcFdBQ=;
 b=DdshK99spmVuVwLtHEmC196J09FpodzUaNQPO6LecQMwrLLIr3eY6eZ+Hi99mTc4UX
 2nggl30wFDfDb8BwpnaZGuzROoNkie08JE1XmC8fXwl+oTt8axoGvia4ou2ky834jdc6
 1LTrUoimNxuHGS70bOHfmUZQ1MNLiwh1nA6E6u1dxZFw36hP3Oy+5ah9HyNCstxRIT92
 SOE9/Bc+PMYmQBX2KxnevsjopOQuEffUJ17+TBYdImaW35epTzypLkTLtKP7U7RTR8ZT
 W7zq6MaAIu6N9sAzIMSxF+Bke9emoEVX2CU+k+FvQoUgB70iFJmDHg5QkG+7KYQpl+L/
 bq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702734714; x=1703339514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRDEQh1JkAlYBSiLzwHd6WKlB2tHlxIi9rObWqcFdBQ=;
 b=EwlxFRceN1p8/YLAWeLz3bpJnpEOX9fkFEFXICq8gufcH43E0sDLbORn2+FcQhjm/T
 MMzw5evdiECZwVFUSA42sdvb50JLWzjh5nU9iK44st3JHH/qQQASVdSj3jd6b/8yV+Kt
 jf8os0viecO2k+hOY7zAWlQJH7+uLs50US57iE3eB/L2/9nLrnfAi2XJdErAdII2oevY
 jN7VNwhxtheNKGdYosuql9yT/JcW6Dv92NBfdPOc6QHzTapdF7xwIJZPZ32mr5RA2jWI
 4unll1avhAoeICfISIyePcSjL99UmUAfGdv2EYT1hgqn193Qh0HC6AQeOiwpMCaEoGn4
 fgYQ==
X-Gm-Message-State: AOJu0YyrY4uKfwYZly/GWUgzHJHhM6M5KeCFFDG6ahMbKRRvJTgBRWSy
 jyGWKrSKolwFbS4/gBDhh7M=
X-Google-Smtp-Source: AGHT+IEDICg4fbFasj7V/rK61EZwtVUgNb9dpp3O07sKjUZ28ECj0ovQ7E1PaCSWN3PFKauJxZk3AQ==
X-Received: by 2002:a17:906:20c3:b0:a1c:91eb:63cf with SMTP id
 c3-20020a17090620c300b00a1c91eb63cfmr14333787ejc.14.1702734714386; 
 Sat, 16 Dec 2023 05:51:54 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 vw12-20020a170907a70c00b00a1c904675cfsm11819595ejc.29.2023.12.16.05.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 05:51:53 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: zhiwei_liu@linux.alibaba.com, baturo.alexey@gmail.com,
 richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 3/6] target/riscv: Add pointer masking tb flags
Date: Sat, 16 Dec 2023 13:51:33 +0000
Message-Id: <20231216135136.1597456-4-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231216135136.1597456-1-me@deliversmonkey.space>
References: <20231216135136.1597456-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.h        | 19 +++++++++++++------
 target/riscv/cpu_helper.c |  4 ++++
 target/riscv/translate.c  | 10 ++++++++++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f49d4aa52c..2099168950 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -390,6 +390,10 @@ struct CPUArchState {
     target_ulong senvcfg;
     uint64_t henvcfg;
 #endif
+    /* current number of masked top bits by pointer masking */
+    target_ulong pm_pmlen;
+    /* if pointer masking should do sign extension */
+    bool pm_signext;
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
@@ -538,14 +542,17 @@ FIELD(TB_FLAGS, VILL, 14, 1)
 FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
 FIELD(TB_FLAGS, XL, 16, 2)
-FIELD(TB_FLAGS, VTA, 18, 1)
-FIELD(TB_FLAGS, VMA, 19, 1)
+/* If pointer masking should be applied and address sign extended */
+FIELD(TB_FLAGS, PM_ENABLED, 18, 1)
+FIELD(TB_FLAGS, PM_SIGNEXTEND, 19, 1)
+FIELD(TB_FLAGS, VTA, 20, 1)
+FIELD(TB_FLAGS, VMA, 21, 1)
 /* Native debug itrigger */
-FIELD(TB_FLAGS, ITRIGGER, 20, 1)
+FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 /* Virtual mode enabled */
-FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
-FIELD(TB_FLAGS, PRIV, 22, 2)
-FIELD(TB_FLAGS, AXL, 24, 2)
+FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
+FIELD(TB_FLAGS, PRIV, 24, 2)
+FIELD(TB_FLAGS, AXL, 25, 2)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a3d477d226..79cddbd930 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -135,6 +135,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
     flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
     flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
+    if (env->pm_pmlen != 0) {
+        flags = FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, 1);
+    }
+    flags = FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, env->pm_signext);
 
     *pflags = flags;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6b4b9a671c..4c0d526b58 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -42,6 +42,8 @@ static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl, cpu_vstart;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
+/* number of top masked address bits by pointer masking extension */
+static TCGv pm_pmlen;
 
 /*
  * If an operation is being performed on less than TARGET_LONG_BITS,
@@ -103,6 +105,9 @@ typedef struct DisasContext {
     bool vl_eq_vlmax;
     CPUState *cs;
     TCGv zero;
+    /* pointer masking extension */
+    bool pm_enabled;
+    bool pm_signext;
     /* Use icount trigger for native debug */
     bool itrigger;
     /* FRM is known to contain a valid value. */
@@ -1176,6 +1181,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
     ctx->cs = cs;
+    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    ctx->pm_signext = FIELD_EX32(tb_flags, TB_FLAGS, PM_SIGNEXTEND);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
@@ -1307,4 +1314,7 @@ void riscv_translate_init(void)
                              "load_res");
     load_val = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, load_val),
                              "load_val");
+    /* Assign var with number of pointer masking masked bits to tcg global */
+    pm_pmlen = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, pm_pmlen),
+                                   "pmlen");
 }
-- 
2.34.1


