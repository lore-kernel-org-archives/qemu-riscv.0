Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87EBC52D6F
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 00:05:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgCKg-00027E-9X; Mon, 19 Aug 2024 20:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sgCKS-00012C-9h
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2024 20:02:29 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sgCK5-0001Cv-LT
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2024 20:02:10 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2021c08b95cso16756915ad.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2024 17:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724112103; x=1724716903;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/EClWHKuW/aBNSw/RcWXHqSeJ1M6ROHJzVo1g9Z3V64=;
 b=P3eBa4X2ZKq2KTn6/15qPgaNgZRTHhlO+WVw4CQ7VQj5d9kwDdXxcjxM4Qz0Q1BIT+
 xXToqJ+b3x3HCcNhxZROG+iGXSkxY7A5KiT/OFKMZ12+zNXW+3NMNN+hnUIw21d7ncFX
 LVRM0Sb0wi0kWNNl4gDabpzPoxvvuY+Xa4N5AwL5tVtk9ogEZsHdAbcyua5pLO+zcooM
 v1Gwddmc77N0w5B4Y1U9BBam6yXYNq7iWu4CsTrthAp3aT5R05w/7hC2rFtSjQp2o9UB
 1u96vrOto8Aj3WgpFoOE6tlUmLuygeuHMqt++cKoy89mL6vl8ve0/mNAUCa3Al2A6m1x
 fRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724112103; x=1724716903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/EClWHKuW/aBNSw/RcWXHqSeJ1M6ROHJzVo1g9Z3V64=;
 b=buWJ8MM4sYnpYHTSOrzxA+iTkY9LOcrFgQqRQc2FdkKiJYI82JT7jlRMid89taTmfY
 KwFVqXQi/uyr2T6nqg6ddrd8z8p9VCC8Sm51UDfnWdL7Ynkr5aSoOPNsDqHGvAaxaNRY
 zexzLSDitgw5BHewlJLMzr5EBsTRSbutVXxS9XiVfXpN2H4HyTj2xudvPVY+xLEnD46y
 jGcgnKUqLN0qk73eE4gI4KD1F6fiQHQRu7PySKMQzuV9W9oKUb2gRYJuIHnruWxfg7+W
 B649OfZL7lvbW62otqUQpfu0fTFD0JMCUsmvBQfiFQJfDvOvzkVdz8thlqzbNjYk2o2U
 zLGQ==
X-Gm-Message-State: AOJu0Yx9+pbfCuKFJj+eo26+BGqKeO42MKQfAtnLaxsX1487/BRWVB5t
 tDQ1meg+HxrcPoGtmf010uzihTyvh3XFeZoAz8s5KCJTHUUHWiTV/7yjN0NW0HGKu7Fh/4FZUxZ
 M
X-Google-Smtp-Source: AGHT+IGurjM1BJt7GOYYCByUtPGtMF2fgWBGfNLKQjtoB0V3ZolQJPBgERTCxJRPTkforgMHD8UNRA==
X-Received: by 2002:a17:902:d50f:b0:1f2:fcc0:66f with SMTP id
 d9443c01a7336-2025f1c7be1mr15542565ad.31.1724112101476; 
 Mon, 19 Aug 2024 17:01:41 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f038a779sm67477445ad.188.2024.08.19.17.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 17:01:41 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 05/15] target/riscv: tracking indirect branches (fcfi) for
 zicfilp
Date: Mon, 19 Aug 2024 17:01:19 -0700
Message-ID: <20240820000129.3522346-6-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240820000129.3522346-1-debug@rivosinc.com>
References: <20240820000129.3522346-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

zicfilp protects forward control flow (if enabled) by enforcing all
indirect call and jmp must land on a landing pad instruction `lpad`. If
target of an indirect call or jmp is not `lpad` then cpu/hart must raise
a sw check exception with tval = 2.

This patch implements the mechanism using TCG. Target architecture branch
instruction must define the end of a TB. Using this property, during
translation of branch instruction, TB flag = FCFI_LP_EXPECTED can be set.
Translation of target TB can check if FCFI_LP_EXPECTED flag is set and a
flag (fcfi_lp_expected) can be set in DisasContext. If `lpad` gets
translated, fcfi_lp_expected flag in DisasContext can be cleared. Else
it'll fault.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Co-developed-by: Jim Shu <jim.shu@sifive.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  3 +++
 target/riscv/cpu_bits.h   |  3 +++
 target/riscv/cpu_helper.c | 12 ++++++++++++
 target/riscv/translate.c  | 21 ++++++++++++++++++++-
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 11c6513a90..edf540339a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -606,6 +606,9 @@ FIELD(TB_FLAGS, ITRIGGER, 22, 1)
 FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
 FIELD(TB_FLAGS, PRIV, 24, 2)
 FIELD(TB_FLAGS, AXL, 26, 2)
+/* zicfilp needs a TB flag to track indirect branches */
+FIELD(TB_FLAGS, FCFI_ENABLED, 28, 1)
+FIELD(TB_FLAGS, FCFI_LP_EXPECTED, 29, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b05ebe6f29..900769ce60 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -685,6 +685,9 @@ typedef enum RISCVException {
     RISCV_EXCP_SEMIHOST = 0x3f,
 } RISCVException;
 
+/* zicfilp defines lp violation results in sw check with tval = 2*/
+#define RISCV_EXCP_SW_CHECK_FCFI_TVAL      2
+
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9f08a67a9e..3a56bea8b9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -133,6 +133,18 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
 
+    if (cpu_get_fcfien(env)) {
+        /*
+         * For Forward CFI, only the expectation of a lpcll at
+         * the start of the block is tracked (which can only happen
+         * when FCFI is enabled for the current processor mode). A jump
+         * or call at the end of the previous TB will have updated
+         * env->elp to indicate the expectation.
+         */
+        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_LP_EXPECTED, env->elp);
+        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_ENABLED, 1);
+    }
+
 #ifdef CONFIG_USER_ONLY
     fs = EXT_STATUS_DIRTY;
     vs = EXT_STATUS_DIRTY;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index acba90f170..6c1c868a4a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -116,6 +116,9 @@ typedef struct DisasContext {
     bool frm_valid;
     bool insn_start_updated;
     const GPtrArray *decoders;
+    /* zicfilp extension. fcfi_enabled, lp expected or not */
+    bool fcfi_enabled;
+    bool fcfi_lp_expected;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -1238,6 +1241,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->ztso = cpu->cfg.ext_ztso;
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
+    ctx->fcfi_lp_expected = FIELD_EX32(tb_flags, TB_FLAGS, FCFI_LP_EXPECTED);
+    ctx->fcfi_enabled = FIELD_EX32(tb_flags, TB_FLAGS, FCFI_ENABLED);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
     ctx->decoders = cpu->decoders;
@@ -1265,11 +1270,25 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu_env(cpu);
     uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
-
     ctx->ol = ctx->xl;
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next += ctx->cur_insn_len;
 
+    /*
+     * instr decode of `lpad` should have lowered fcfi_lp_expected.
+     * If not `lpad`, raise sw check exception.
+     */
+    if (ctx->fcfi_lp_expected) {
+        /* Emit after insn_start, i.e. before the op following insn_start. */
+        tcg_ctx->emit_before_op = QTAILQ_NEXT(ctx->base.insn_start, link);
+        tcg_gen_st_tl(tcg_constant_tl(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
+                      tcg_env, offsetof(CPURISCVState, sw_check_code));
+        gen_helper_raise_exception(tcg_env,
+                      tcg_constant_i32(RISCV_EXCP_SW_CHECK));
+        tcg_ctx->emit_before_op = NULL;
+        ctx->base.is_jmp = DISAS_NORETURN;
+    }
+
     /* Only the first insn within a TB is allowed to cross a page boundary. */
     if (ctx->base.is_jmp == DISAS_NEXT) {
         if (ctx->itrigger || !is_same_page(&ctx->base, ctx->base.pc_next)) {
-- 
2.44.0


