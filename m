Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ0SQ-0007kT-Nx
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 01:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0S3-0007Yo-ET
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:30:39 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0S0-0000n5-BP
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:30:34 -0500
Received: by mail-pg1-x532.google.com with SMTP id 78so934443pgb.8
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 22:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TofwhUrqur+nfz+vYUg5s7uS+g1axympVTaiH26ziSo=;
 b=EHhumVzDciJDtBOM4uqAKPsy2YjiZ44T7DJBiVN0Qk7baGOaJJf1XBqIESAzuKUqid
 lnJrR8ubx2dNM1Bup32Pb0DkXXYUayLpmwX1J0/p5TQhgyBUU39D3LR+dTmfwXuoGE5J
 lPn0GLbtR1B18Sw7VFlr8Q/QtrlT4yyFqFEwQtZVCkoSh8wikYnE7QyY7tKcaWdFE/uE
 tQRne0hW17ghts6U7XtMP/W9VHFW2bxAoR9A489/bgErJyzL2Vsmt+p+vgIEV2cIHzEy
 4Yxq3ah7kiGEy/u8uCOiISyLe138H7OxvzIO9Z5QD/Jw1qsrsj4ZAOPBPIhNTy+Y3MVt
 s1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TofwhUrqur+nfz+vYUg5s7uS+g1axympVTaiH26ziSo=;
 b=gyaLWmfKt7wqKOA0mS38BRIX2sOtsAdfVr4s2zAJBIU9iyR5bypn7slLff4nHu0AjU
 c96c9fujmJ5/dvVXqfZdhDHCFYSDKj81emE2UxqVVi4JKq81wlqGgTgI+vawOC6ZY2bI
 C7ZHWXHGTVSSVu6e1ykQ4jZX5mgR18GC4WKtJWDQfxyAyUq9dtalc5GuF+7KgdUzrV0q
 K2FJ+BqS10yseQxw1InLoPZ62Zg5jDm5uaWCrKC1ucvCAss2VHnsr5AaekLCn1MbZiW9
 aPt62Y5m2GSeLitZaKBN1MT2TsOgb8WZ3JNMofFnir4OqVuooOmZc/CVD7T9cf27YypI
 EMZw==
X-Gm-Message-State: AO0yUKX2uuRFBkHviV5Cx2Ql5dWAwybzqcClriLNZeMEIZVaF3lMhBUK
 HPSAQD45Xk11V3KjdXdzxZssTg==
X-Google-Smtp-Source: AK7set/cyIZgNCxvo7M/OYJYSUxwE3yk8syJYNMLCVrixfj1cWHCDbPHlr3PWIBHvxJvx0hsld+s7Q==
X-Received: by 2002:aa7:9575:0:b0:5a8:4861:af7d with SMTP id
 x21-20020aa79575000000b005a84861af7dmr4237442pfq.20.1675924230864; 
 Wed, 08 Feb 2023 22:30:30 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7848f000000b00593c434b1b8sm543649pfn.48.2023.02.08.22.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:30:30 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 7/9] target/riscv: Tracking indirect branches
 (fcfi) using TCG
Date: Wed,  8 Feb 2023 22:29:45 -0800
Message-Id: <20230209062947.3585481-8-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062947.3585481-1-debug@rivosinc.com>
References: <20230209062947.3585481-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 06:30:43 -0000

zisslpcfi protects forward control flow (if enabled) by enforcing all
indirect call and jmp must land on a landing pad instruction `lpcll`
short for landing pad and check lower label value. If target of an
indirect call or jmp is not `lpcll` then cpu/hart must raise an illegal
instruction exception.

This patch implements the mechanism using TCG. Target architecture branch
instruction must define the end of a TB. Using this property, during
translation of branch instruction, TB flag = FCFI_LP_EXPECTED can be set.
Translation of target TB can check if FCFI_LP_EXPECTED flag is set and a
flag (fcfi_lp_expected) can be set in DisasContext. If `lpcll` gets
translated, fcfi_lp_expected flag in DisasContext can be cleared. Else
it'll fault.

This patch also also adds flag for forward and backward cfi in
DisasContext.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/cpu.h        |  3 +++
 target/riscv/cpu_helper.c | 12 +++++++++
 target/riscv/translate.c  | 52 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8803ea6426..98b272bcad 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -644,6 +644,9 @@ FIELD(TB_FLAGS, VMA, 25, 1)
 /* Native debug itrigger */
 FIELD(TB_FLAGS, ITRIGGER, 26, 1)
 
+/* Zisslpcfi needs a TB flag to track indirect branches */
+FIELD(TB_FLAGS, FCFI_LP_EXPECTED, 27, 1)
+
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
 #else
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 63377abc2f..d15918f534 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -129,6 +129,18 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
 
+    if (cpu->cfg.ext_cfi) {
+        /*
+         * For Forward CFI, only the expectation of a lpcll at
+         * the start of the block is tracked (which can only happen
+         * when FCFI is enabled for the current processor mode). A jump
+         * or call at the end of the previous TB will have updated
+         * env->elp to indicate the expectation.
+         */
+        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_LP_EXPECTED,
+                           env->elp != NO_LP_EXPECTED);
+    }
+
 #ifdef CONFIG_USER_ONLY
     flags |= TB_FLAGS_MSTATUS_FS;
     flags |= TB_FLAGS_MSTATUS_VS;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index df38db7553..7d43d20fc3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -41,6 +41,7 @@ static TCGv load_val;
 /* globals for PM CSRs */
 static TCGv pm_mask;
 static TCGv pm_base;
+static TCGOp *cfi_lp_check;
 
 #include "exec/gen-icount.h"
 
@@ -116,6 +117,10 @@ typedef struct DisasContext {
     bool itrigger;
     /* TCG of the current insn_start */
     TCGOp *insn_start;
+    /* CFI extension */
+    bool bcfi_enabled;
+    bool fcfi_enabled;
+    bool fcfi_lp_expected;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -1166,11 +1171,44 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
+    ctx->bcfi_enabled = cpu_get_bcfien(env);
+    ctx->fcfi_enabled = cpu_get_fcfien(env);
+    ctx->fcfi_lp_expected = FIELD_EX32(tb_flags, TB_FLAGS, FCFI_LP_EXPECTED);
     ctx->zero = tcg_constant_tl(0);
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
 {
+    DisasContext *ctx = container_of(db, DisasContext, base);
+
+    if (ctx->fcfi_lp_expected) {
+        /*
+         * Since we can't look ahead to confirm that the first
+         * instruction is a legal landing pad instruction, emit
+         * compare-and-branch sequence that will be fixed-up in
+         * riscv_tr_tb_stop() to either statically hit or skip an
+         * illegal instruction exception depending on whether the
+         * flag was lowered by translation of a CJLP or JLP as
+         * the first instruction in the block.
+         */
+        TCGv_i32 immediate;
+        TCGLabel *l;
+        l = gen_new_label();
+        immediate = tcg_temp_local_new_i32();
+        tcg_gen_movi_i32(immediate, 0);
+        cfi_lp_check = tcg_last_op();
+        tcg_gen_brcondi_i32(TCG_COND_EQ, immediate, 0, l);
+        tcg_temp_free_i32(immediate);
+        gen_exception_illegal(ctx);
+        gen_set_label(l);
+        /*
+         * Despite the use of gen_exception_illegal(), the rest of
+         * the TB needs to be generated. The TCG optimizer will
+         * clean things up depending on which path ends up being
+         * active.
+         */
+        ctx->base.is_jmp = DISAS_NEXT;
+    }
 }
 
 static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
@@ -1225,6 +1263,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    CPURISCVState *env = cpu->env_ptr;
 
     switch (ctx->base.is_jmp) {
     case DISAS_TOO_MANY:
@@ -1235,6 +1274,19 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     default:
         g_assert_not_reached();
     }
+
+    if (ctx->fcfi_lp_expected) {
+        /*
+         * If the "lp expected" flag is still up, the block needs to take an
+         * illegal instruction exception.
+         */
+        tcg_set_insn_param(cfi_lp_check, 1, tcgv_i32_arg(tcg_constant_i32(1)));
+    } else {
+        /*
+        * LP instruction requirement was met, clear up LP expected
+        */
+        env->elp = NO_LP_EXPECTED;
+    }
 }
 
 static void riscv_tr_disas_log(const DisasContextBase *dcbase,
-- 
2.25.1


