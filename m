Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393EAC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:44:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGUO-0001qo-Li; Thu, 21 Dec 2023 05:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGGUH-0000yB-JR; Thu, 21 Dec 2023 05:41:09 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGGUA-0004yZ-5E; Thu, 21 Dec 2023 05:41:09 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3368d1c7b23so42317f8f.0; 
 Thu, 21 Dec 2023 02:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703155259; x=1703760059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRDEQh1JkAlYBSiLzwHd6WKlB2tHlxIi9rObWqcFdBQ=;
 b=T3tzKDEn9w8jbNTP7GSYqUy4Q3WD1qdSM+5/C4+Vpj+zGGopDfL6bY6x01O3Uqskxz
 CJXd/fuKfe9e5jIapKYPPGD0D7Cj6KYx3J69K3gtotf1rVKMLNe0L2UmstZ6xqQs4kmM
 Dcll4UCip9KFMk9TOJY1s0luOXeoNbAGvlzsTY3KWg+BDpu06OHP+Io+uAwlvH27iY8R
 K6zV1TkWPpc3xpezyBid4mygcq/jHhK/hUDXV+JTMVPwN1LB1JvcGnKrx/6oTBdBEyMi
 qWS6RM6UZS6ne0DBUjB9Lux+lXGbOWoFVTcPSms8StXVt5R0zpHfSg7l1mkfVs+e6rWL
 ajVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155259; x=1703760059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRDEQh1JkAlYBSiLzwHd6WKlB2tHlxIi9rObWqcFdBQ=;
 b=EpdRPxaHo+K0mI+f4b9tfkaEyDoDsy01oi90Lm4Ip8VXwlMtIMjFFpUM5oBs0Oy1VF
 ojzejkDSAAkyGQXUXJoGIcKaNR6g7X7khU3lVG24SfXkn6MLtNkpjnfm1uP7ePd8+KVC
 kBs/vk+hFX18dSmbpIlzgNAI4TrtZeARQpVQd9lTQdoWsnVNmOr0CIycIGjtgKSO2WSY
 HPSAkd4HuoVOCjT7ya6KGzAWqALwR83827YoTOtHh5jioOq7VfafNn2a7oi9fO2KHo0U
 uFlhg5YmrlQ37Dmf0QgR69iDHriII0ip12VkW8BGi13wURIK3djSMtC+d2Z+gWQeZH5d
 NFFg==
X-Gm-Message-State: AOJu0YwSRliBeatX++6R1Jrm65N59Ckn6vXS3STv7VIJBQPIZehXco2o
 0g2EcJKWBAK/0j00Iq3zp3U=
X-Google-Smtp-Source: AGHT+IEEgaKPH1f/CHCA77RpfqnHueISatT3LoVm8Ul3bW29nFl3gF4cV10YbozFxuueRufcWBqMuQ==
X-Received: by 2002:a05:600c:6985:b0:40d:1467:3d84 with SMTP id
 fp5-20020a05600c698500b0040d14673d84mr598759wmb.118.1703155258912; 
 Thu, 21 Dec 2023 02:40:58 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 bh20-20020a05600c3d1400b0040d15dcb77asm10633674wmb.23.2023.12.21.02.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:40:58 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH 3/6] target/riscv: Add pointer masking tb flags
Date: Thu, 21 Dec 2023 10:40:32 +0000
Message-Id: <20231221104035.1287244-4-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221104035.1287244-1-me@deliversmonkey.space>
References: <20231221104035.1287244-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wr1-x429.google.com
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


