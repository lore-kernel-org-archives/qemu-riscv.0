Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ0M8-0000xm-7s
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 01:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0M6-0000xM-78
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:24:26 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0M4-0007yB-Bs
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:24:25 -0500
Received: by mail-pl1-x633.google.com with SMTP id z1so1803058plg.6
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 22:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TofwhUrqur+nfz+vYUg5s7uS+g1axympVTaiH26ziSo=;
 b=WV0Yt6wdmrqWodN7vbRW+HPm9uh0fz0KSzT832srkfpLSdUHyuO0/+VTrgG6qUWMc3
 2Pj5GsMMEOY7VawBl/1zXs6znAeGGSK9sHUZ9SH9DuMWXudXWVif85UvZyTb5LuMFgZa
 yZYs3EjNSOCT8BszvohuA3RDv/cCNjFThcgrol/Isx9j+jUxC5+/7gVAroAjTUoNmiwF
 KxXMOJuSxV+0TIJeiv3hTwTRMHBA8U3+bn5yZud2rkE1YIipoUUFMdtHwPqv0j2BAbO1
 hmKLKwi7TES4kXEcIGqogMOij1yEUJY+vjJ+yV2zoOEmakrhWxOeTZxqrvVWGZFxjh1h
 D8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TofwhUrqur+nfz+vYUg5s7uS+g1axympVTaiH26ziSo=;
 b=uwskIt5uYjAjqQGCXwVfB54CYNjRQSRUCa9IixSFwrgEn1DKMv5OeQ6Q3PQKusOrjU
 kmkEL0NzY1NcOttybW5HiGGiz8eSoB+2HpPS0dKuGDtLy9ZoYmQmOQ619Iv5Bvw0ZyaI
 23Rqm47xPQESuey8rUCEhkQZMUwQoj9xyA/MStMiremaZ6l4I0mkT6lBf6PCJWlJGRVq
 OrEQ5rb1AJgTq6cd7VBKHT9zWz0/ccBicFw39LLHM605H6IfHMCqKGCEiNxCvkBx5xKz
 kN/DXANBPp5DTLZojwGRv743kBv4Tev31CTWc48eDSEfR2w+Rtcen1vn7oAvwUwcJHH7
 cVzg==
X-Gm-Message-State: AO0yUKW22hFnwav6TCEopAWZiVWQ2dIZv4zitUogylv2ZIYuxyeq50ip
 6lllRK1Zq6e8vuDOHM9jRw9lPg==
X-Google-Smtp-Source: AK7set9C10grrd179fFqlTXzN324Ox6RGtoPfKNW1oTMeK49OXjNuGAwmVD0ykk8pMnx0wYWV1dp0w==
X-Received: by 2002:a05:6a20:3d8d:b0:bc:f189:5064 with SMTP id
 s13-20020a056a203d8d00b000bcf1895064mr12998894pzi.52.1675923862920; 
 Wed, 08 Feb 2023 22:24:22 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b00571cdbd0771sm521919pfi.102.2023.02.08.22.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:24:22 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 7/9] target/riscv: Tracking indirect branches
 (fcfi) using TCG
Date: Wed,  8 Feb 2023 22:24:02 -0800
Message-Id: <20230209062404.3582018-8-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062404.3582018-1-debug@rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 06:24:26 -0000

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


