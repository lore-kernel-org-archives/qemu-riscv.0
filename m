Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWMu-0002c3-CE
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMZ-0008LA-A9
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:47:51 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMS-00075t-O6
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:47:50 -0500
Received: by mail-pj1-x1041.google.com with SMTP id y2so4893388pjg.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcr99wziH116ux009K4xDB5EATn9J5O54brfNdbRB7g=;
 b=gEUYIQ8KRZTSdiSuyJjzlkSX6XB1me6R7t+4Dc8EjWbfgfGKdESQaQGnHnAGrSSQHQ
 YSHC3y56CgC/2wu7ItjTm1QiYtDHiIkqIWOotN71Mz36aARhvTvoYF3E/9afpInV2NWG
 aHxNz79HgO+GeDqQuD5EELhfKSLvEhYcLgfvvHm4TSGvWw3bhAR6bbokFrZy64M+iUTI
 8DW+1L7RjVcRUGiHeBosDDGkZkz1er5UOzwAq6yUh0nEPz3E8qGv8UbWFaAEbbJBEjQ1
 zt79jHhRJ2LLI9/EPfJyIVtMmIX/J9qfTS3uGG6jUh5a74pA+Myr6fwgcgkpfiz8B0Wr
 1emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fcr99wziH116ux009K4xDB5EATn9J5O54brfNdbRB7g=;
 b=1FLz5cDfhz7yczCVZV9s1QdBXKEi0CPFl3nV6dd8NnCfTRNynbDhBHzmY2AeYApHTk
 pZroR6ycUAXWZqnZI8y075F6KbhCK/hUI1mCqpU17EmAIYLPS457CQWm++qoOrvZrDl7
 2Wa/dMR87uRR03miLILuqK+jDZA4pz3VhnaEIHzk6pp/N88Ok+WDG3iN6zJG59uUtWxW
 4ovuyS9y/bRdWeHo9kbYjmGtW7NlLTi+aQhVJcEFixzsTzcI0B4TlhIwsIxWUchwbkJH
 2lArOQq6KPaeV1crV1xnt53QD2yRt2F0w3xOBV9rAXkUJGR5O1IXI55wcN3RHgN2vvZb
 hjhQ==
X-Gm-Message-State: AO0yUKUX+khT9dae1oDiZ/ycM0NMPyR4jdhAnaJ1Wzl6QeR+IDTHpb7j
 993omy/dVtUuShOkYVCvp+VEbg==
X-Google-Smtp-Source: AK7set/h+n9UOucjTXxI5a8eZVRPUehjGvoYqRhRBXHIjRHmCwtT+NYkXuCC1cJu2HXBvRq+gGJkqA==
X-Received: by 2002:a17:902:fb8c:b0:19c:f2d5:5830 with SMTP id
 lg12-20020a170902fb8c00b0019cf2d55830mr5703241plb.44.1677476861383; 
 Sun, 26 Feb 2023 21:47:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 44/70] target/ppc: Avoid tcg_const_* in translate.c
Date: Sun, 26 Feb 2023 19:42:07 -1000
Message-Id: <20230227054233.390271-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:47:51 -0000

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 142 +++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 70 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 52b812a01f..fb545423f5 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -263,8 +263,8 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
      * faulting instruction
      */
     gen_update_nip(ctx, ctx->cia);
-    t0 = tcg_const_i32(excp);
-    t1 = tcg_const_i32(error);
+    t0 = tcg_constant_i32(excp);
+    t1 = tcg_constant_i32(error);
     gen_helper_raise_exception_err(cpu_env, t0, t1);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -278,7 +278,7 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
      * faulting instruction
      */
     gen_update_nip(ctx, ctx->cia);
-    t0 = tcg_const_i32(excp);
+    t0 = tcg_constant_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -289,7 +289,7 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
     TCGv_i32 t0;
 
     gen_update_nip(ctx, nip);
-    t0 = tcg_const_i32(excp);
+    t0 = tcg_constant_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -386,7 +386,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
 static void spr_load_dump_spr(int sprn)
 {
 #ifdef PPC_DUMP_SPR_ACCESSES
-    TCGv_i32 t0 = tcg_const_i32(sprn);
+    TCGv_i32 t0 = tcg_constant_i32(sprn);
     gen_helper_load_dump_spr(cpu_env, t0);
 #endif
 }
@@ -400,7 +400,7 @@ void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
 static void spr_store_dump_spr(int sprn)
 {
 #ifdef PPC_DUMP_SPR_ACCESSES
-    TCGv_i32 t0 = tcg_const_i32(sprn);
+    TCGv_i32 t0 = tcg_constant_i32(sprn);
     gen_helper_store_dump_spr(cpu_env, t0);
 #endif
 }
@@ -672,25 +672,25 @@ void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn)
 
 void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
+    TCGv_i32 t0 = tcg_constant_i32((sprn - SPR_IBAT0U) / 2);
     gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4U) / 2) + 4);
+    TCGv_i32 t0 = tcg_constant_i32(((sprn - SPR_IBAT4U) / 2) + 4);
     gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0L) / 2);
+    TCGv_i32 t0 = tcg_constant_i32((sprn - SPR_IBAT0L) / 2);
     gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4L) / 2) + 4);
+    TCGv_i32 t0 = tcg_constant_i32(((sprn - SPR_IBAT4L) / 2) + 4);
     gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
 }
 
@@ -712,25 +712,25 @@ void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn)
 
 void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0U) / 2);
+    TCGv_i32 t0 = tcg_constant_i32((sprn - SPR_DBAT0U) / 2);
     gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4U) / 2) + 4);
+    TCGv_i32 t0 = tcg_constant_i32(((sprn - SPR_DBAT4U) / 2) + 4);
     gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0L) / 2);
+    TCGv_i32 t0 = tcg_constant_i32((sprn - SPR_DBAT0L) / 2);
     gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4L) / 2) + 4);
+    TCGv_i32 t0 = tcg_constant_i32(((sprn - SPR_DBAT4L) / 2) + 4);
     gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
 }
 
@@ -1040,13 +1040,15 @@ void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
 
 void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32(sprn);
+    TCGv_i32 t0 = tcg_constant_i32(sprn);
     gen_helper_booke_setpid(cpu_env, t0, cpu_gpr[gprn]);
 }
+
 void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_booke_set_eplc(cpu_env, cpu_gpr[gprn]);
 }
+
 void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_booke_set_epsc(cpu_env, cpu_gpr[gprn]);
@@ -1080,9 +1082,9 @@ void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
 static void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
                                     int bit, int sprn, int cause)
 {
-    TCGv_i32 t1 = tcg_const_i32(bit);
-    TCGv_i32 t2 = tcg_const_i32(sprn);
-    TCGv_i32 t3 = tcg_const_i32(cause);
+    TCGv_i32 t1 = tcg_constant_i32(bit);
+    TCGv_i32 t2 = tcg_constant_i32(sprn);
+    TCGv_i32 t3 = tcg_constant_i32(cause);
 
     gen_helper_fscr_facility_check(cpu_env, t1, t2, t3);
 }
@@ -1090,9 +1092,9 @@ static void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
 static void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
                                    int bit, int sprn, int cause)
 {
-    TCGv_i32 t1 = tcg_const_i32(bit);
-    TCGv_i32 t2 = tcg_const_i32(sprn);
-    TCGv_i32 t3 = tcg_const_i32(cause);
+    TCGv_i32 t1 = tcg_constant_i32(bit);
+    TCGv_i32 t2 = tcg_constant_i32(sprn);
+    TCGv_i32 t3 = tcg_constant_i32(cause);
 
     gen_helper_msr_facility_check(cpu_env, t1, t2, t3);
 }
@@ -1388,7 +1390,7 @@ static inline void gen_op_cmp(TCGv arg0, TCGv arg1, int s, int crf)
 
 static inline void gen_op_cmpi(TCGv arg0, target_ulong arg1, int s, int crf)
 {
-    TCGv t0 = tcg_const_tl(arg1);
+    TCGv t0 = tcg_constant_tl(arg1);
     gen_op_cmp(arg0, t0, s, crf);
 }
 
@@ -1409,7 +1411,7 @@ static inline void gen_op_cmp32(TCGv arg0, TCGv arg1, int s, int crf)
 
 static inline void gen_op_cmpi32(TCGv arg0, target_ulong arg1, int s, int crf)
 {
-    TCGv t0 = tcg_const_tl(arg1);
+    TCGv t0 = tcg_constant_tl(arg1);
     gen_op_cmp32(arg0, t0, s, crf);
 }
 
@@ -1476,7 +1478,7 @@ static void gen_isel(DisasContext *ctx)
     tcg_gen_extu_i32_tl(t0, cpu_crf[bi >> 2]);
     tcg_gen_andi_tl(t0, t0, mask);
 
-    zr = tcg_const_tl(0);
+    zr = tcg_constant_tl(0);
     tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr[rD(ctx->opcode)], t0, zr,
                        rA(ctx->opcode) ? cpu_gpr[rA(ctx->opcode)] : zr,
                        cpu_gpr[rB(ctx->opcode)]);
@@ -1568,7 +1570,7 @@ static inline void gen_op_arith_add(DisasContext *ctx, TCGv ret, TCGv arg1,
                 tcg_gen_mov_tl(ca32, ca);
             }
         } else {
-            TCGv zero = tcg_const_tl(0);
+            TCGv zero = tcg_constant_tl(0);
             if (add_ca) {
                 tcg_gen_add2_tl(t0, ca, arg1, zero, ca, zero);
                 tcg_gen_add2_tl(t0, ca, t0, ca, arg2, zero);
@@ -1609,7 +1611,7 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
                                 add_ca, compute_ca, compute_ov)               \
 static void glue(gen_, name)(DisasContext *ctx)                               \
 {                                                                             \
-    TCGv t0 = tcg_const_tl(const_val);                                        \
+    TCGv t0 = tcg_constant_tl(const_val);                                     \
     gen_op_arith_add(ctx, cpu_gpr[rD(ctx->opcode)],                           \
                      cpu_gpr[rA(ctx->opcode)], t0,                            \
                      ca, glue(ca, 32),                                        \
@@ -1636,7 +1638,7 @@ GEN_INT_ARITH_ADD_CONST(addzeo, 0x16, 0, cpu_ca, 1, 1, 1)
 /* addic  addic.*/
 static inline void gen_op_addic(DisasContext *ctx, bool compute_rc0)
 {
-    TCGv c = tcg_const_tl(SIMM(ctx->opcode));
+    TCGv c = tcg_constant_tl(SIMM(ctx->opcode));
     gen_op_arith_add(ctx, cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
                      c, cpu_ca, cpu_ca32, 0, 1, 0, compute_rc0);
 }
@@ -1709,7 +1711,7 @@ GEN_INT_ARITH_DIVW(divwo, 0x1F, 1, 1);
 #define GEN_DIVE(name, hlpr, compute_ov)                                      \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
-    TCGv_i32 t0 = tcg_const_i32(compute_ov);                                  \
+    TCGv_i32 t0 = tcg_constant_i32(compute_ov);                               \
     gen_helper_##hlpr(cpu_gpr[rD(ctx->opcode)], cpu_env,                      \
                      cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)], t0); \
     if (unlikely(Rc(ctx->opcode) != 0)) {                                     \
@@ -1802,8 +1804,8 @@ static inline void gen_op_arith_modw(DisasContext *ctx, TCGv ret, TCGv arg1,
         tcg_gen_rem_i32(t3, t0, t1);
         tcg_gen_ext_i32_tl(ret, t3);
     } else {
-        TCGv_i32 t2 = tcg_const_i32(1);
-        TCGv_i32 t3 = tcg_const_i32(0);
+        TCGv_i32 t2 = tcg_constant_i32(1);
+        TCGv_i32 t3 = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_EQ, t1, t1, t3, t2, t1);
         tcg_gen_remu_i32(t3, t0, t1);
         tcg_gen_extu_i32_tl(ret, t3);
@@ -1842,8 +1844,8 @@ static inline void gen_op_arith_modd(DisasContext *ctx, TCGv ret, TCGv arg1,
         tcg_gen_movcond_i64(TCG_COND_NE, t1, t2, t3, t2, t1);
         tcg_gen_rem_i64(ret, t0, t1);
     } else {
-        TCGv_i64 t2 = tcg_const_i64(1);
-        TCGv_i64 t3 = tcg_const_i64(0);
+        TCGv_i64 t2 = tcg_constant_i64(1);
+        TCGv_i64 t3 = tcg_constant_i64(0);
         tcg_gen_movcond_i64(TCG_COND_EQ, t1, t1, t3, t2, t1);
         tcg_gen_remu_i64(ret, t0, t1);
     }
@@ -2038,7 +2040,7 @@ static inline void gen_op_arith_subf(DisasContext *ctx, TCGv ret, TCGv arg1,
         } else if (add_ca) {
             TCGv zero, inv1 = tcg_temp_new();
             tcg_gen_not_tl(inv1, arg1);
-            zero = tcg_const_tl(0);
+            zero = tcg_constant_tl(0);
             tcg_gen_add2_tl(t0, cpu_ca, arg2, zero, cpu_ca, zero);
             tcg_gen_add2_tl(t0, cpu_ca, t0, cpu_ca, inv1, zero);
             gen_op_arith_compute_ca32(ctx, t0, inv1, arg2, cpu_ca32, 0);
@@ -2083,7 +2085,7 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
                                 add_ca, compute_ca, compute_ov)               \
 static void glue(gen_, name)(DisasContext *ctx)                               \
 {                                                                             \
-    TCGv t0 = tcg_const_tl(const_val);                                        \
+    TCGv t0 = tcg_constant_tl(const_val);                                     \
     gen_op_arith_subf(ctx, cpu_gpr[rD(ctx->opcode)],                          \
                       cpu_gpr[rA(ctx->opcode)], t0,                           \
                       add_ca, compute_ca, compute_ov, Rc(ctx->opcode));       \
@@ -2107,7 +2109,7 @@ GEN_INT_ARITH_SUBF_CONST(subfzeo, 0x16, 0, 1, 1, 1)
 /* subfic */
 static void gen_subfic(DisasContext *ctx)
 {
-    TCGv c = tcg_const_tl(SIMM(ctx->opcode));
+    TCGv c = tcg_constant_tl(SIMM(ctx->opcode));
     gen_op_arith_subf(ctx, cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
                       c, 0, 1, 0, 0);
 }
@@ -2115,7 +2117,7 @@ static void gen_subfic(DisasContext *ctx)
 /* neg neg. nego nego. */
 static inline void gen_op_arith_neg(DisasContext *ctx, bool compute_ov)
 {
-    TCGv zero = tcg_const_tl(0);
+    TCGv zero = tcg_constant_tl(0);
     gen_op_arith_subf(ctx, cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
                       zero, 0, 0, compute_ov, Rc(ctx->opcode));
 }
@@ -2214,7 +2216,7 @@ GEN_LOGICAL2(nor, tcg_gen_nor_tl, 0x03, PPC_INTEGER);
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 static void gen_pause(DisasContext *ctx)
 {
-    TCGv_i32 t0 = tcg_const_i32(0);
+    TCGv_i32 t0 = tcg_constant_i32(0);
     tcg_gen_st_i32(t0, cpu_env,
                    -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
 
@@ -3256,7 +3258,7 @@ static void gen_lmw(DisasContext *ctx)
     }
     gen_set_access_type(ctx, ACCESS_INT);
     t0 = tcg_temp_new();
-    t1 = tcg_const_i32(rD(ctx->opcode));
+    t1 = tcg_constant_i32(rD(ctx->opcode));
     gen_addr_imm_index(ctx, t0, 0);
     gen_helper_lmw(cpu_env, t0, t1);
 }
@@ -3273,7 +3275,7 @@ static void gen_stmw(DisasContext *ctx)
     }
     gen_set_access_type(ctx, ACCESS_INT);
     t0 = tcg_temp_new();
-    t1 = tcg_const_i32(rS(ctx->opcode));
+    t1 = tcg_constant_i32(rS(ctx->opcode));
     gen_addr_imm_index(ctx, t0, 0);
     gen_helper_stmw(cpu_env, t0, t1);
 }
@@ -3311,8 +3313,8 @@ static void gen_lswi(DisasContext *ctx)
     gen_set_access_type(ctx, ACCESS_INT);
     t0 = tcg_temp_new();
     gen_addr_register(ctx, t0);
-    t1 = tcg_const_i32(nb);
-    t2 = tcg_const_i32(start);
+    t1 = tcg_constant_i32(nb);
+    t2 = tcg_constant_i32(start);
     gen_helper_lsw(cpu_env, t0, t1, t2);
 }
 
@@ -3329,9 +3331,9 @@ static void gen_lswx(DisasContext *ctx)
     gen_set_access_type(ctx, ACCESS_INT);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
-    t1 = tcg_const_i32(rD(ctx->opcode));
-    t2 = tcg_const_i32(rA(ctx->opcode));
-    t3 = tcg_const_i32(rB(ctx->opcode));
+    t1 = tcg_constant_i32(rD(ctx->opcode));
+    t2 = tcg_constant_i32(rA(ctx->opcode));
+    t3 = tcg_constant_i32(rB(ctx->opcode));
     gen_helper_lswx(cpu_env, t0, t1, t2, t3);
 }
 
@@ -3352,8 +3354,8 @@ static void gen_stswi(DisasContext *ctx)
     if (nb == 0) {
         nb = 32;
     }
-    t1 = tcg_const_i32(nb);
-    t2 = tcg_const_i32(rS(ctx->opcode));
+    t1 = tcg_constant_i32(nb);
+    t2 = tcg_constant_i32(rS(ctx->opcode));
     gen_helper_stsw(cpu_env, t0, t1, t2);
 }
 
@@ -3373,7 +3375,7 @@ static void gen_stswx(DisasContext *ctx)
     t1 = tcg_temp_new_i32();
     tcg_gen_trunc_tl_i32(t1, cpu_xer);
     tcg_gen_andi_i32(t1, t1, 0x7F);
-    t2 = tcg_const_i32(rS(ctx->opcode));
+    t2 = tcg_constant_i32(rS(ctx->opcode));
     gen_helper_stsw(cpu_env, t0, t1, t2);
 }
 
@@ -3943,7 +3945,7 @@ static void gen_wait(DisasContext *ctx)
      * to occur.
      */
     if (wc == 0) {
-        TCGv_i32 t0 = tcg_const_i32(1);
+        TCGv_i32 t0 = tcg_constant_i32(1);
         tcg_gen_st_i32(t0, cpu_env,
                        -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
         /* Stop translation, as the CPU is supposed to sleep from now */
@@ -3989,7 +3991,7 @@ static void gen_doze(DisasContext *ctx)
     TCGv_i32 t;
 
     CHK_HV(ctx);
-    t = tcg_const_i32(PPC_PM_DOZE);
+    t = tcg_constant_i32(PPC_PM_DOZE);
     gen_helper_pminsn(cpu_env, t);
     /* Stop translation, as the CPU is supposed to sleep from now */
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
@@ -4004,7 +4006,7 @@ static void gen_nap(DisasContext *ctx)
     TCGv_i32 t;
 
     CHK_HV(ctx);
-    t = tcg_const_i32(PPC_PM_NAP);
+    t = tcg_constant_i32(PPC_PM_NAP);
     gen_helper_pminsn(cpu_env, t);
     /* Stop translation, as the CPU is supposed to sleep from now */
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
@@ -4019,7 +4021,7 @@ static void gen_stop(DisasContext *ctx)
     TCGv_i32 t;
 
     CHK_HV(ctx);
-    t = tcg_const_i32(PPC_PM_STOP);
+    t = tcg_constant_i32(PPC_PM_STOP);
     gen_helper_pminsn(cpu_env, t);
     /* Stop translation, as the CPU is supposed to sleep from now */
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
@@ -4034,7 +4036,7 @@ static void gen_sleep(DisasContext *ctx)
     TCGv_i32 t;
 
     CHK_HV(ctx);
-    t = tcg_const_i32(PPC_PM_SLEEP);
+    t = tcg_constant_i32(PPC_PM_SLEEP);
     gen_helper_pminsn(cpu_env, t);
     /* Stop translation, as the CPU is supposed to sleep from now */
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
@@ -4049,7 +4051,7 @@ static void gen_rvwinkle(DisasContext *ctx)
     TCGv_i32 t;
 
     CHK_HV(ctx);
-    t = tcg_const_i32(PPC_PM_RVWINKLE);
+    t = tcg_constant_i32(PPC_PM_RVWINKLE);
     gen_helper_pminsn(cpu_env, t);
     /* Stop translation, as the CPU is supposed to sleep from now */
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
@@ -4506,7 +4508,7 @@ static void gen_tw(DisasContext *ctx)
     if (check_unconditional_trap(ctx)) {
         return;
     }
-    t0 = tcg_const_i32(TO(ctx->opcode));
+    t0 = tcg_constant_i32(TO(ctx->opcode));
     gen_helper_tw(cpu_env, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
                   t0);
 }
@@ -4520,8 +4522,8 @@ static void gen_twi(DisasContext *ctx)
     if (check_unconditional_trap(ctx)) {
         return;
     }
-    t0 = tcg_const_tl(SIMM(ctx->opcode));
-    t1 = tcg_const_i32(TO(ctx->opcode));
+    t0 = tcg_constant_tl(SIMM(ctx->opcode));
+    t1 = tcg_constant_i32(TO(ctx->opcode));
     gen_helper_tw(cpu_env, cpu_gpr[rA(ctx->opcode)], t0, t1);
 }
 
@@ -4534,7 +4536,7 @@ static void gen_td(DisasContext *ctx)
     if (check_unconditional_trap(ctx)) {
         return;
     }
-    t0 = tcg_const_i32(TO(ctx->opcode));
+    t0 = tcg_constant_i32(TO(ctx->opcode));
     gen_helper_td(cpu_env, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
                   t0);
 }
@@ -4548,8 +4550,8 @@ static void gen_tdi(DisasContext *ctx)
     if (check_unconditional_trap(ctx)) {
         return;
     }
-    t0 = tcg_const_tl(SIMM(ctx->opcode));
-    t1 = tcg_const_i32(TO(ctx->opcode));
+    t0 = tcg_constant_tl(SIMM(ctx->opcode));
+    t1 = tcg_constant_i32(TO(ctx->opcode));
     gen_helper_td(cpu_env, cpu_gpr[rA(ctx->opcode)], t0, t1);
 }
 #endif
@@ -5018,7 +5020,7 @@ static void gen_dcbz(DisasContext *ctx)
 
     gen_set_access_type(ctx, ACCESS_CACHE);
     tcgv_addr = tcg_temp_new();
-    tcgv_op = tcg_const_i32(ctx->opcode & 0x03FF000);
+    tcgv_op = tcg_constant_i32(ctx->opcode & 0x03FF000);
     gen_addr_reg_index(ctx, tcgv_addr);
     gen_helper_dcbz(cpu_env, tcgv_addr, tcgv_op);
 }
@@ -5031,7 +5033,7 @@ static void gen_dcbzep(DisasContext *ctx)
 
     gen_set_access_type(ctx, ACCESS_CACHE);
     tcgv_addr = tcg_temp_new();
-    tcgv_op = tcg_const_i32(ctx->opcode & 0x03FF000);
+    tcgv_op = tcg_constant_i32(ctx->opcode & 0x03FF000);
     gen_addr_reg_index(ctx, tcgv_addr);
     gen_helper_dcbzep(cpu_env, tcgv_addr, tcgv_op);
 }
@@ -5106,7 +5108,7 @@ static void gen_mfsr(DisasContext *ctx)
     TCGv t0;
 
     CHK_SV(ctx);
-    t0 = tcg_const_tl(SR(ctx->opcode));
+    t0 = tcg_constant_tl(SR(ctx->opcode));
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5135,7 +5137,7 @@ static void gen_mtsr(DisasContext *ctx)
     TCGv t0;
 
     CHK_SV(ctx);
-    t0 = tcg_const_tl(SR(ctx->opcode));
+    t0 = tcg_constant_tl(SR(ctx->opcode));
     gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5167,7 +5169,7 @@ static void gen_mfsr_64b(DisasContext *ctx)
     TCGv t0;
 
     CHK_SV(ctx);
-    t0 = tcg_const_tl(SR(ctx->opcode));
+    t0 = tcg_constant_tl(SR(ctx->opcode));
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5196,7 +5198,7 @@ static void gen_mtsr_64b(DisasContext *ctx)
     TCGv t0;
 
     CHK_SV(ctx);
-    t0 = tcg_const_tl(SR(ctx->opcode));
+    t0 = tcg_constant_tl(SR(ctx->opcode));
     gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5550,7 +5552,7 @@ static void gen_mfdcr(DisasContext *ctx)
     TCGv dcrn;
 
     CHK_SV(ctx);
-    dcrn = tcg_const_tl(SPR(ctx->opcode));
+    dcrn = tcg_constant_tl(SPR(ctx->opcode));
     gen_helper_load_dcr(cpu_gpr[rD(ctx->opcode)], cpu_env, dcrn);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5564,7 +5566,7 @@ static void gen_mtdcr(DisasContext *ctx)
     TCGv dcrn;
 
     CHK_SV(ctx);
-    dcrn = tcg_const_tl(SPR(ctx->opcode));
+    dcrn = tcg_constant_tl(SPR(ctx->opcode));
     gen_helper_store_dcr(cpu_env, dcrn, cpu_gpr[rS(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5785,7 +5787,7 @@ static void gen_tlbre_440(DisasContext *ctx)
     case 1:
     case 2:
         {
-            TCGv_i32 t0 = tcg_const_i32(rB(ctx->opcode));
+            TCGv_i32 t0 = tcg_constant_i32(rB(ctx->opcode));
             gen_helper_440_tlbre(cpu_gpr[rD(ctx->opcode)], cpu_env,
                                  t0, cpu_gpr[rA(ctx->opcode)]);
         }
@@ -5831,7 +5833,7 @@ static void gen_tlbwe_440(DisasContext *ctx)
     case 1:
     case 2:
         {
-            TCGv_i32 t0 = tcg_const_i32(rB(ctx->opcode));
+            TCGv_i32 t0 = tcg_constant_i32(rB(ctx->opcode));
             gen_helper_440_tlbwe(cpu_env, t0, cpu_gpr[rA(ctx->opcode)],
                                  cpu_gpr[rS(ctx->opcode)]);
         }
@@ -5973,7 +5975,7 @@ static void gen_wrteei(DisasContext *ctx)
 /* dlmzb */
 static void gen_dlmzb(DisasContext *ctx)
 {
-    TCGv_i32 t0 = tcg_const_i32(Rc(ctx->opcode));
+    TCGv_i32 t0 = tcg_constant_i32(Rc(ctx->opcode));
     gen_helper_dlmzb(cpu_gpr[rA(ctx->opcode)], cpu_env,
                      cpu_gpr[rS(ctx->opcode)], cpu_gpr[rB(ctx->opcode)], t0);
 }
-- 
2.34.1


