Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32238EEB562
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 18:28:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qegC3-0003MD-Od; Fri, 08 Sep 2023 14:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegC2-0003Kc-0Z; Fri, 08 Sep 2023 14:26:58 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegBz-0006nH-NB; Fri, 08 Sep 2023 14:26:57 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9a64619d8fbso293310366b.0; 
 Fri, 08 Sep 2023 11:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694197614; x=1694802414; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIg2Hv3wClQUBbYNJLcyCb1qCDVdrIXCMVVkW1eDMF8=;
 b=fXtdt6TovEyYiiPa7x8ZfYHWSFv7GG6NruANTxLfBc0OR7MtxaAoK9AS5v8wwnsAkB
 Ojyd9UAevNi8WQIUyBvXGLopUKN/Yw8B5JSlg4Aqx7tMzCumzHeWN9TaM/MWlgkWtDGE
 zAm7qoNt+N+8212L1P+eIiTbkUMDBeJOxt9eergt3Xx0fuzjLdYFFWXdQ3DhG9xDKE8h
 aM2FpAgY8c9pEv+mZdSI3AvrnL/YWjqktYsW4K/jcI0NoTYMeF3xxh1Lwmrag64hqTQ9
 Cbsba8QkO8/cC0Mn0G+oAvq91run7lfgKYAdiCCqS4p40XxR964posCVI9NBvjP1qpDb
 d9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694197614; x=1694802414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIg2Hv3wClQUBbYNJLcyCb1qCDVdrIXCMVVkW1eDMF8=;
 b=eaSo4GKIstrThD2FD2YtebmW0y0ampjH+TXcjZkgub3KrkzB5ecHep8apPp5Y04Eqm
 48VI0mSXgWj9gAywb+fAQVfIAJI/64GwRrTySc6BuYA9MlAqZ08CuLBNwztLG6m6hO5t
 Ht84ULmDsw0LsPf8KIiBk8PvFAatucQccL4DY6Cc9tnQOwak8i3NafhXqV6+/dlHWf8F
 C/+30rIJeP/45z82iiFmu2xMX7PKpvmBxlIo+L+D0f0bvp6bp254oTyTBsuiRazVYVw/
 U/f6XPJTmeDtzp1oWQ7eehGENtCXkQ8wc/RtmxlE6j9ZF1V036TeA6QzVq93DHjBS1A9
 Ff1Q==
X-Gm-Message-State: AOJu0YzmntpmcpuVnzp+78nIKrq3nbiQqmcus830iTQ2NPmt7dU5qBZj
 Ozp9SjJhdjXUWBjOlFJFLRI=
X-Google-Smtp-Source: AGHT+IFH2z3nKGftsfg0JDf1XU1FVkOv+QCaY/ycK8fru1agety7yl0DERy88ONCmEwnvOBtAndnvw==
X-Received: by 2002:a17:906:518b:b0:99c:47a:8bcd with SMTP id
 y11-20020a170906518b00b0099c047a8bcdmr2497075ejk.67.1694197613991; 
 Fri, 08 Sep 2023 11:26:53 -0700 (PDT)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 cb22-20020a170906a45600b0099d804da2e9sm1342667ejb.225.2023.09.08.11.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 11:26:53 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, zhiwei_liu@linux.alibaba.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC v1 5/8] target/riscv: Add pointer masking tb flags
Date: Fri,  8 Sep 2023 18:26:37 +0000
Message-Id: <20230908182640.1102270-6-baturo.alexey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908182640.1102270-1-baturo.alexey@gmail.com>
References: <20230908182640.1102270-1-baturo.alexey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.h        | 19 +++++++++++++------
 target/riscv/cpu_helper.c |  4 ++++
 target/riscv/translate.c  | 10 ++++++++++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 25fe60476b..17d0088cb4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -356,6 +356,10 @@ struct CPUArchState {
     target_ulong senvcfg;
     uint64_t henvcfg;
 #endif
+    /* current number of masked top bits by pointer masking */
+    target_ulong pm_n_bits;
+    /* if pointer masking should do sign extension */
+    bool pm_signext;
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
@@ -492,14 +496,17 @@ FIELD(TB_FLAGS, VILL, 14, 1)
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
index 57859314e3..b3871b0a28 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -136,6 +136,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
     flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
     flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
     flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
+    if (env->pm_n_bits != 0) {
+        flags = FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, 1);
+    }
+    flags = FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, env->pm_signext);
 
     *pflags = flags;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ce47904590..3434ba58b6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -42,6 +42,8 @@ static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl, cpu_vstart;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
+/* number of top masked address bits by pointer masking extension */
+static TCGv pm_n_bits;
 
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
@@ -1175,6 +1180,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
     ctx->cs = cs;
+    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    ctx->pm_signext = FIELD_EX32(tb_flags, TB_FLAGS, PM_SIGNEXTEND);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
@@ -1306,4 +1313,7 @@ void riscv_translate_init(void)
                              "load_res");
     load_val = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, load_val),
                              "load_val");
+    /* Assign var with number of pointer masking masked bits to tcg global */
+    pm_n_bits = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, pm_n_bits),
+                                   "pmbits");
 }
-- 
2.34.1


