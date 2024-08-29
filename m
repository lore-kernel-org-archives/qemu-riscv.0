Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6717C87FCB
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 23:36:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sjofA-0003VG-HU; Thu, 29 Aug 2024 19:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjof8-0003RO-SH
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 19:34:46 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjof1-00039Y-CL
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 19:34:46 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2d3c5f769d6so813055a91.3
 for <qemu-riscv@nongnu.org>; Thu, 29 Aug 2024 16:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724974478; x=1725579278;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fvGH26X0+vKupgaNF4mDFcjO25Iuuu3HUu52oa4zQIQ=;
 b=PQEM7wtZtd0Glpfj/9wyRLCfC8CDpglD8TwO9QUwNRpuJH3RsjLpejBm+XECVt9ITW
 B8VqbOJcZ7aUcfeQHuIdIoss/Q8tipQ9yOeNnC7+HivxztazFRwyXVMRYeHx8IYPuvaV
 2g9u132tnd7ObqbROxAkzdg9kL65p2YqiBoN+x6QvdGcMVqDEZJBbUQhfZgQQwndWjS+
 3rvQOcOV1MMr6FDs2fDOi0sH+SsKK7n0mhnxtdHPRn6cC9vhLAvCnhIHolS7HIOqJ87d
 pl9wLzTqWgzqStY8+7U74D16MRaeAXLWacmnC5IiQJofLBRNqQyg8+ZtjJMqknsVj40s
 UPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724974478; x=1725579278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fvGH26X0+vKupgaNF4mDFcjO25Iuuu3HUu52oa4zQIQ=;
 b=HrZnDP2KPxYB5EryH/7njcyqQ8i/laDLythEXjlGzVTw6wS/wXytjwMOjyKMGAHBwC
 4VW4b9128+yJ5YTTWJD/SVVbYIkAJmhgEBpwgtAgzFTswtPMCfA7sM0LRt0EI72qyexX
 Uc0FVLGtZbPTcJMQzWhSQJH2oHtdm4yv76va5m6Qr0dKhE8XPqNLEzG+GxTg2Z/J5gYP
 Wuui33obR7lj4buzKU0W0d79uBspcblm+NiSa2r8n2pyITsHxwLUaUQoxsF9lGUOSwOe
 GJVPwNBaurviiTQtJUy82gq6tWPrC4uSbhiZ2HKBpZ6gLM0p6zmvarggkbVq6/07c3i9
 aHjw==
X-Gm-Message-State: AOJu0YxjSQqCgPKWVRpLVb//ipxt1d756PfKthY8WH4ZKsLIn4TjEde3
 n/NOZlNiggaRj24ymBpUeGtMx/dAes6pRqRp+NJ/FzlOSUKSpPJNrvmoyXxnYxMom8nLmbJ9n27
 R
X-Google-Smtp-Source: AGHT+IErSzRJgfbWcXQ5st8BsiaEZXzVvp0sKW7rZq6mUlZEm/FUddrErnhzqW7UmBhAu1anr2wJrA==
X-Received: by 2002:a17:90b:4b0a:b0:2d3:b970:e4d4 with SMTP id
 98e67ed59e1d1-2d856503a4emr4587030a91.38.1724974477515; 
 Thu, 29 Aug 2024 16:34:37 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d85b13df55sm2331074a91.27.2024.08.29.16.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 16:34:37 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v12 06/20] target/riscv: tracking indirect branches (fcfi) for
 zicfilp
Date: Thu, 29 Aug 2024 16:34:10 -0700
Message-ID: <20240829233425.1005029-7-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240829233425.1005029-1-debug@rivosinc.com>
References: <20240829233425.1005029-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=debug@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  3 +++
 target/riscv/cpu_bits.h   |  3 +++
 target/riscv/cpu_helper.c | 10 ++++++++++
 target/riscv/translate.c  | 23 +++++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a0f14c759e..f372a4074b 100644
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
index fffd865cb4..c3820eff8f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -132,6 +132,16 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
 
+    if (cpu_get_fcfien(env)) {
+        /*
+         * For Forward CFI, only the expectation of a lpad at
+         * the start of the block is tracked via env->elp. env->elp
+         * is turned on during jalr translation.
+         */
+        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_LP_EXPECTED, env->elp);
+        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_ENABLED, 1);
+    }
+
 #ifdef CONFIG_USER_ONLY
     fs = EXT_STATUS_DIRTY;
     vs = EXT_STATUS_DIRTY;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index acba90f170..b5c0511b4b 100644
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
@@ -1270,6 +1275,24 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next += ctx->cur_insn_len;
 
+    /*
+     * If 'fcfi_lp_expected' is still true after processing the instruction,
+     * then we did not see an 'lpad' instruction, and must raise an exception.
+     * Insert code to raise the exception at the start of the insn; any other
+     * code the insn may have emitted will be deleted as dead code following
+     * the noreturn exception
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


