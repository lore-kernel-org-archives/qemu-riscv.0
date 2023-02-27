Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWJC-0006X2-Mm
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJA-0006N9-Tq
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:21 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIw-0005Ot-Fh
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:20 -0500
Received: by mail-pj1-x1035.google.com with SMTP id c23so4878389pjo.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACEQFJsCeUwaXp7PoC/4fjWEfP1E4KipqQGgtxf0o58=;
 b=K20mHKyUpbMdBve+NBezk3D4PrI3rGLY1YYvW4RSvMoS4eOT1iS0XvMvthNyL1Axhg
 WAIhj1m112b9e+k547OKjNHGzIl6g1lS1z0Hhikq0gOGejNGxQGvvFBrtTk0kMEweN60
 awQPSLlmZBsjM/k7ZaoF3dxN3TS2SUgTX/DoxC3+8mLcHOr17obHeYumDswl7Gkrx9tq
 hyaK3SvwKTBKlV3frZNPDF3Y30zsk/xqB641/HunZBYabBuWFVKftZ4GZIoKsMuCrw9T
 hmto5ddicEeb0i1HSyX1TkF4zFhCQr5rNjpDRGW8vd9na12z5NTFOca28OlYmBJnPEy/
 beJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ACEQFJsCeUwaXp7PoC/4fjWEfP1E4KipqQGgtxf0o58=;
 b=sDKO4/CfGQneAT19v1Yp4LXljb2xba+8ZCBl8RHkt7PTfeO7huyd3H57F9eqfi2NHS
 ujT/kip1agYe4MvAq0m37IAKc1SBJLhXHleeSseHcI3tY0aLy8IYm3JnjVjKGFoM21wg
 69hkkbzDnU5FuCdU4TBpu767lx/+2PHMt5hFZuDcrEXekNLh0z7s5fr8a4hvaPSBIyFy
 F2dc1OCQrGOkORwusk27D37/ATIBE6UbQN9KL89wvV0C2jYrluAjR7ykx/OvtI/MpqYi
 3ootoeT/6ZppR1aQciIAWRuB58gMua2hkzDx7epXmpg2Pn2GkaMHP6+pXpvkL95QVist
 k51g==
X-Gm-Message-State: AO0yUKVkgeMemPjN6IDO4TjB98rmXXqq/Jiu/cMaesxNVneZ8o2amrIl
 jNx+vZPz/E//3o6GymMBi+TexA==
X-Google-Smtp-Source: AK7set9qT9iua6vyZgsBcoO/ulMB5oSbcCrW6gySxYrcmTuXCsCb3UWJOk86HNMJ4J+OorQVR1obyg==
X-Received: by 2002:a05:6a21:789c:b0:cb:c276:58cc with SMTP id
 bf28-20020a056a21789c00b000cbc27658ccmr22169314pzc.28.1677476638849; 
 Sun, 26 Feb 2023 21:43:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 28/70] target/m68k: Avoid tcg_const_* throughout
Date: Sun, 26 Feb 2023 19:41:51 -1000
Message-Id: <20230227054233.390271-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Feb 2023 05:44:21 -0000

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 158 ++++++++++++++++++++--------------------
 1 file changed, 77 insertions(+), 81 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 3d97aaf578..e16c608ef8 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -264,10 +264,7 @@ static void gen_jmp(DisasContext *s, TCGv dest)
 
 static void gen_raise_exception(int nr)
 {
-    TCGv_i32 tmp;
-
-    tmp = tcg_const_i32(nr);
-    gen_helper_raise_exception(cpu_env, tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(nr));
 }
 
 static void gen_raise_exception_format2(DisasContext *s, int nr,
@@ -471,7 +468,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
         if ((ext & 0x80) == 0) {
             /* base not suppressed */
             if (IS_NULL_QREG(base)) {
-                base = tcg_const_i32(offset + bd);
+                base = tcg_constant_i32(offset + bd);
                 bd = 0;
             }
             if (!IS_NULL_QREG(add)) {
@@ -487,7 +484,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
                 add = tmp;
             }
         } else {
-            add = tcg_const_i32(bd);
+            add = tcg_constant_i32(bd);
         }
         if ((ext & 3) != 0) {
             /* memory indirect */
@@ -623,8 +620,7 @@ static void gen_flush_flags(DisasContext *s)
         break;
 
     default:
-        t0 = tcg_const_i32(s->cc_op);
-        gen_helper_flush_flags(cpu_env, t0);
+        gen_helper_flush_flags(cpu_env, tcg_constant_i32(s->cc_op));
         s->cc_op_synced = 1;
         break;
     }
@@ -785,14 +781,14 @@ static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,
         switch (reg0) {
         case 0: /* Absolute short.  */
             offset = (int16_t)read_im16(env, s);
-            return tcg_const_i32(offset);
+            return tcg_constant_i32(offset);
         case 1: /* Absolute long.  */
             offset = read_im32(env, s);
-            return tcg_const_i32(offset);
+            return tcg_constant_i32(offset);
         case 2: /* pc displacement  */
             offset = s->pc;
             offset += (int16_t)read_im16(env, s);
-            return tcg_const_i32(offset);
+            return tcg_constant_i32(offset);
         case 3: /* pc index+displacement.  */
             return gen_lea_indexed(env, s, NULL_QREG);
         case 4: /* Immediate.  */
@@ -1171,23 +1167,23 @@ static int gen_ea_mode_fp(CPUM68KState *env, DisasContext *s, int mode,
             }
             switch (opsize) {
             case OS_BYTE:
-                tmp = tcg_const_i32((int8_t)read_im8(env, s));
+                tmp = tcg_constant_i32((int8_t)read_im8(env, s));
                 gen_helper_exts32(cpu_env, fp, tmp);
                 break;
             case OS_WORD:
-                tmp = tcg_const_i32((int16_t)read_im16(env, s));
+                tmp = tcg_constant_i32((int16_t)read_im16(env, s));
                 gen_helper_exts32(cpu_env, fp, tmp);
                 break;
             case OS_LONG:
-                tmp = tcg_const_i32(read_im32(env, s));
+                tmp = tcg_constant_i32(read_im32(env, s));
                 gen_helper_exts32(cpu_env, fp, tmp);
                 break;
             case OS_SINGLE:
-                tmp = tcg_const_i32(read_im32(env, s));
+                tmp = tcg_constant_i32(read_im32(env, s));
                 gen_helper_extf32(cpu_env, fp, tmp);
                 break;
             case OS_DOUBLE:
-                t64 = tcg_const_i64(read_im64(env, s));
+                t64 = tcg_constant_i64(read_im64(env, s));
                 gen_helper_extf64(cpu_env, fp, t64);
                 break;
             case OS_EXTENDED:
@@ -1195,9 +1191,9 @@ static int gen_ea_mode_fp(CPUM68KState *env, DisasContext *s, int mode,
                     gen_exception(s, s->base.pc_next, EXCP_FP_UNIMP);
                     break;
                 }
-                tmp = tcg_const_i32(read_im32(env, s) >> 16);
+                tmp = tcg_constant_i32(read_im32(env, s) >> 16);
                 tcg_gen_st16_i32(tmp, fp, offsetof(FPReg, l.upper));
-                t64 = tcg_const_i64(read_im64(env, s));
+                t64 = tcg_constant_i64(read_im64(env, s));
                 tcg_gen_st_i64(t64, fp, offsetof(FPReg, l.lower));
                 break;
             case OS_PACKED:
@@ -1257,7 +1253,7 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
             goto done;
         case 10: /* PL */
         case 11: /* MI */
-            c->v2 = tcg_const_i32(0);
+            c->v2 = tcg_constant_i32(0);
             c->v1 = tmp = tcg_temp_new();
             tcg_gen_sub_i32(tmp, QREG_CC_N, QREG_CC_V);
             gen_ext(tmp, tmp, op - CC_OP_CMPB, 1);
@@ -1273,7 +1269,7 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
         }
     }
 
-    c->v2 = tcg_const_i32(0);
+    c->v2 = tcg_constant_i32(0);
 
     switch (cond) {
     case 0: /* T */
@@ -2004,7 +2000,7 @@ DISAS_INSN(movem)
 
     addr = tcg_temp_new();
     tcg_gen_mov_i32(addr, tmp);
-    incr = tcg_const_i32(opsize_bytes(opsize));
+    incr = tcg_constant_i32(opsize_bytes(opsize));
 
     if (is_load) {
         /* memory to register */
@@ -2240,13 +2236,13 @@ DISAS_INSN(arith_im)
     opsize = insn_opsize(insn);
     switch (opsize) {
     case OS_BYTE:
-        im = tcg_const_i32((int8_t)read_im8(env, s));
+        im = tcg_constant_i32((int8_t)read_im8(env, s));
         break;
     case OS_WORD:
-        im = tcg_const_i32((int16_t)read_im16(env, s));
+        im = tcg_constant_i32((int16_t)read_im16(env, s));
         break;
     case OS_LONG:
-        im = tcg_const_i32(read_im32(env, s));
+        im = tcg_constant_i32(read_im32(env, s));
         break;
     default:
         g_assert_not_reached();
@@ -2398,7 +2394,6 @@ DISAS_INSN(cas2w)
 {
     uint16_t ext1, ext2;
     TCGv addr1, addr2;
-    TCGv regs;
 
     /* cas2 Dc1:Dc2,Du1:Du2,(Rn1):(Rn2) */
 
@@ -2430,13 +2425,13 @@ DISAS_INSN(cas2w)
      *     Dc2 = (R2)
      */
 
-    regs = tcg_const_i32(REG(ext2, 6) |
-                         (REG(ext1, 6) << 3) |
-                         (REG(ext2, 0) << 6) |
-                         (REG(ext1, 0) << 9));
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         gen_helper_exit_atomic(cpu_env);
     } else {
+        TCGv regs = tcg_constant_i32(REG(ext2, 6) |
+                                     (REG(ext1, 6) << 3) |
+                                     (REG(ext2, 0) << 6) |
+                                     (REG(ext1, 0) << 9));
         gen_helper_cas2w(cpu_env, regs, addr1, addr2);
     }
 
@@ -2480,10 +2475,10 @@ DISAS_INSN(cas2l)
      *     Dc2 = (R2)
      */
 
-    regs = tcg_const_i32(REG(ext2, 6) |
-                         (REG(ext1, 6) << 3) |
-                         (REG(ext2, 0) << 6) |
-                         (REG(ext1, 0) << 9));
+    regs = tcg_constant_i32(REG(ext2, 6) |
+                            (REG(ext1, 6) << 3) |
+                            (REG(ext2, 0) << 6) |
+                            (REG(ext1, 0) << 9));
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         gen_helper_cas2l_parallel(cpu_env, regs, addr1, addr2);
     } else {
@@ -2557,7 +2552,7 @@ DISAS_INSN(negx)
      * (X, N) =  -(src + X);
      */
 
-    z = tcg_const_i32(0);
+    z = tcg_constant_i32(0);
     tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, src, z, QREG_CC_X, z);
     tcg_gen_sub2_i32(QREG_CC_N, QREG_CC_X, z, z, QREG_CC_N, QREG_CC_X);
     gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
@@ -2602,8 +2597,7 @@ DISAS_INSN(clr)
     int opsize;
     TCGv zero;
 
-    zero = tcg_const_i32(0);
-
+    zero = tcg_constant_i32(0);
     opsize = insn_opsize(insn);
     DEST_EA(env, insn, opsize, zero, NULL);
     gen_logic_cc(s, zero, opsize);
@@ -2939,7 +2933,7 @@ DISAS_INSN(jump)
     }
     if ((insn & 0x40) == 0) {
         /* jsr */
-        gen_push(s, tcg_const_i32(s->pc));
+        gen_push(s, tcg_constant_i32(s->pc));
     }
     gen_jmp(s, tmp);
 }
@@ -2964,7 +2958,7 @@ DISAS_INSN(addsubq)
     if (imm == 0) {
         imm = 8;
     }
-    val = tcg_const_i32(imm);
+    val = tcg_constant_i32(imm);
     dest = tcg_temp_new();
     tcg_gen_mov_i32(dest, src);
     if ((insn & 0x38) == 0x08) {
@@ -3008,7 +3002,7 @@ DISAS_INSN(branch)
     }
     if (op == 1) {
         /* bsr */
-        gen_push(s, tcg_const_i32(s->pc));
+        gen_push(s, tcg_constant_i32(s->pc));
     }
     if (op > 1) {
         /* Bcc */
@@ -3157,9 +3151,10 @@ DISAS_INSN(mov3q)
     int val;
 
     val = (insn >> 9) & 7;
-    if (val == 0)
+    if (val == 0) {
         val = -1;
-    src = tcg_const_i32(val);
+    }
+    src = tcg_constant_i32(val);
     gen_logic_cc(s, src, OS_LONG);
     DEST_EA(env, insn, OS_LONG, src, NULL);
 }
@@ -3437,7 +3432,7 @@ static inline void shift_reg(DisasContext *s, uint16_t insn, int opsize)
             tcg_gen_extr_i64_i32(QREG_CC_N, QREG_CC_C, t64);
             /* Note that C=0 if shift count is 0, and we get that for free.  */
         } else {
-            TCGv zero = tcg_const_i32(0);
+            TCGv zero = tcg_constant_i32(0);
             tcg_gen_extrl_i64_i32(QREG_CC_N, t64);
             tcg_gen_shri_i32(QREG_CC_C, QREG_CC_N, bits);
             tcg_gen_movcond_i32(TCG_COND_EQ, QREG_CC_C,
@@ -3459,7 +3454,7 @@ static inline void shift_reg(DisasContext *s, uint16_t insn, int opsize)
          *     V = ((s ^ t) & (-1 << (bits - 1))) != 0
          */
         if (!logical && m68k_feature(s->env, M68K_FEATURE_M68K)) {
-            TCGv_i64 tt = tcg_const_i64(32);
+            TCGv_i64 tt = tcg_constant_i64(32);
             /* if shift is greater than 32, use 32 */
             tcg_gen_movcond_i64(TCG_COND_GT, s64, s64, tt, tt, s64);
             /* Sign extend the input to 64 bits; re-do the shift.  */
@@ -3640,7 +3635,7 @@ static TCGv rotate_x(TCGv reg, TCGv shift, int left, int size)
 {
     TCGv X, shl, shr, shx, sz, zero;
 
-    sz = tcg_const_i32(size);
+    sz = tcg_constant_i32(size);
 
     shr = tcg_temp_new();
     shl = tcg_temp_new();
@@ -3651,7 +3646,7 @@ static TCGv rotate_x(TCGv reg, TCGv shift, int left, int size)
         tcg_gen_sub_i32(shr, shr, shift); /* shr = size + 1 - shift */
         tcg_gen_subi_i32(shx, shift, 1);  /* shx = shift - 1 */
         /* shx = shx < 0 ? size : shx; */
-        zero = tcg_const_i32(0);
+        zero = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_LT, shx, shx, zero, sz, shx);
     } else {
         tcg_gen_mov_i32(shr, shift);      /* shr = shift */
@@ -3730,7 +3725,7 @@ static TCGv rotate32_x(TCGv reg, TCGv shift, int left)
 
     /* if shift == 0, register and X are not affected */
 
-    zero = tcg_const_i32(0);
+    zero = tcg_constant_i32(0);
     tcg_gen_movcond_i32(TCG_COND_EQ, X, shift, zero, QREG_CC_X, X);
     tcg_gen_movcond_i32(TCG_COND_EQ, reg, shift, zero, reg, lo);
 
@@ -3748,7 +3743,7 @@ DISAS_INSN(rotate_im)
         tmp = 8;
     }
 
-    shift = tcg_const_i32(tmp);
+    shift = tcg_constant_i32(tmp);
     if (insn & 8) {
         rotate(DREG(insn, 0), shift, left, 32);
     } else {
@@ -3773,7 +3768,7 @@ DISAS_INSN(rotate8_im)
         tmp = 8;
     }
 
-    shift = tcg_const_i32(tmp);
+    shift = tcg_constant_i32(tmp);
     if (insn & 8) {
         rotate(reg, shift, left, 8);
     } else {
@@ -3797,7 +3792,7 @@ DISAS_INSN(rotate16_im)
         tmp = 8;
     }
 
-    shift = tcg_const_i32(tmp);
+    shift = tcg_constant_i32(tmp);
     if (insn & 8) {
         rotate(reg, shift, left, 16);
     } else {
@@ -3912,7 +3907,7 @@ DISAS_INSN(rotate_mem)
 
     SRC_EA(env, src, OS_WORD, 0, &addr);
 
-    shift = tcg_const_i32(1);
+    shift = tcg_constant_i32(1);
     if (insn & 0x0200) {
         rotate(src, shift, left, 16);
     } else {
@@ -4006,12 +4001,12 @@ DISAS_INSN(bfext_mem)
     if (ext & 0x20) {
         len = DREG(ext, 0);
     } else {
-        len = tcg_const_i32(extract32(ext, 0, 5));
+        len = tcg_constant_i32(extract32(ext, 0, 5));
     }
     if (ext & 0x800) {
         ofs = DREG(ext, 6);
     } else {
-        ofs = tcg_const_i32(extract32(ext, 6, 5));
+        ofs = tcg_constant_i32(extract32(ext, 6, 5));
     }
 
     if (is_sign) {
@@ -4127,12 +4122,12 @@ DISAS_INSN(bfop_mem)
     if (ext & 0x20) {
         len = DREG(ext, 0);
     } else {
-        len = tcg_const_i32(extract32(ext, 0, 5));
+        len = tcg_constant_i32(extract32(ext, 0, 5));
     }
     if (ext & 0x800) {
         ofs = DREG(ext, 6);
     } else {
-        ofs = tcg_const_i32(extract32(ext, 6, 5));
+        ofs = tcg_constant_i32(extract32(ext, 6, 5));
     }
 
     switch (insn & 0x0f00) {
@@ -4244,12 +4239,12 @@ DISAS_INSN(bfins_mem)
     if (ext & 0x20) {
         len = DREG(ext, 0);
     } else {
-        len = tcg_const_i32(extract32(ext, 0, 5));
+        len = tcg_constant_i32(extract32(ext, 0, 5));
     }
     if (ext & 0x800) {
         ofs = DREG(ext, 6);
     } else {
-        ofs = tcg_const_i32(extract32(ext, 6, 5));
+        ofs = tcg_constant_i32(extract32(ext, 6, 5));
     }
 
     gen_helper_bfins_mem(QREG_CC_N, cpu_env, addr, src, ofs, len);
@@ -4382,7 +4377,7 @@ DISAS_INSN(move16_mem)
     TCGv reg, addr;
 
     reg = AREG(insn, 0);
-    addr = tcg_const_i32(read_im32(env, s));
+    addr = tcg_constant_i32(read_im32(env, s));
 
     if ((insn >> 3) & 1) {
         /* MOVE16 (xxx).L, (Ay) */
@@ -4572,14 +4567,14 @@ DISAS_INSN(cf_movec)
     } else {
         reg = DREG(ext, 12);
     }
-    gen_helper_cf_movec_to(cpu_env, tcg_const_i32(ext & 0xfff), reg);
+    gen_helper_cf_movec_to(cpu_env, tcg_constant_i32(ext & 0xfff), reg);
     gen_exit_tb(s);
 }
 
 DISAS_INSN(m68k_movec)
 {
     uint16_t ext;
-    TCGv reg;
+    TCGv reg, creg;
 
     if (IS_USER(s)) {
         gen_exception(s, s->base.pc_next, EXCP_PRIVILEGE);
@@ -4593,10 +4588,11 @@ DISAS_INSN(m68k_movec)
     } else {
         reg = DREG(ext, 12);
     }
+    creg = tcg_constant_i32(ext & 0xfff);
     if (insn & 1) {
-        gen_helper_m68k_movec_to(cpu_env, tcg_const_i32(ext & 0xfff), reg);
+        gen_helper_m68k_movec_to(cpu_env, creg, reg);
     } else {
-        gen_helper_m68k_movec_from(reg, cpu_env, tcg_const_i32(ext & 0xfff));
+        gen_helper_m68k_movec_from(reg, cpu_env, creg);
     }
     gen_exit_tb(s);
 }
@@ -4647,7 +4643,7 @@ DISAS_INSN(pflush)
         return;
     }
 
-    opmode = tcg_const_i32((insn >> 3) & 3);
+    opmode = tcg_constant_i32((insn >> 3) & 3);
     gen_helper_pflush(cpu_env, AREG(insn, 0), opmode);
 }
 
@@ -4659,7 +4655,7 @@ DISAS_INSN(ptest)
         gen_exception(s, s->base.pc_next, EXCP_PRIVILEGE);
         return;
     }
-    is_read = tcg_const_i32((insn >> 5) & 1);
+    is_read = tcg_constant_i32((insn >> 5) & 1);
     gen_helper_ptest(cpu_env, AREG(insn, 0), is_read);
 }
 #endif
@@ -4829,7 +4825,7 @@ static void gen_op_fmove_fcr(CPUM68KState *env, DisasContext *s,
                 gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
                 return;
             }
-            tmp = tcg_const_i32(read_im32(env, s));
+            tmp = tcg_constant_i32(read_im32(env, s));
             gen_store_fcr(s, tmp, mask);
             return;
         }
@@ -4966,7 +4962,7 @@ DISAS_INSN(fpu)
     case 2:
         if (insn == 0xf200 && (ext & 0xfc00) == 0x5c00) {
             /* fmovecr */
-            TCGv rom_offset = tcg_const_i32(opmode);
+            TCGv rom_offset = tcg_constant_i32(opmode);
             cpu_dest = gen_fp_ptr(REG(ext, 7));
             gen_helper_fconst(cpu_env, cpu_dest, rom_offset);
             return;
@@ -5190,7 +5186,7 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
 {
     TCGv fpsr;
 
-    c->v2 = tcg_const_i32(0);
+    c->v2 = tcg_constant_i32(0);
     /* TODO: Raise BSUN exception.  */
     fpsr = tcg_temp_new();
     gen_load_fcr(s, fpsr, M68K_FPSR);
@@ -5410,7 +5406,7 @@ DISAS_INSN(fsave)
 
     if (m68k_feature(s->env, M68K_FEATURE_M68040)) {
         /* always write IDLE */
-        TCGv idle = tcg_const_i32(0x41000000);
+        TCGv idle = tcg_constant_i32(0x41000000);
         DEST_EA(env, insn, OS_LONG, idle, NULL);
     } else {
         disas_undef(env, s, insn);
@@ -5540,7 +5536,7 @@ DISAS_INSN(mac)
         /* Skip the accumulate if the value is already saturated.  */
         l1 = gen_new_label();
         tmp = tcg_temp_new();
-        gen_op_and32(tmp, QREG_MACSR, tcg_const_i32(MACSR_PAV0 << acc));
+        gen_op_and32(tmp, QREG_MACSR, tcg_constant_i32(MACSR_PAV0 << acc));
         gen_op_jmp_nz32(tmp, l1);
     }
 #endif
@@ -5551,11 +5547,11 @@ DISAS_INSN(mac)
         tcg_gen_add_i64(MACREG(acc), MACREG(acc), s->mactmp);
 
     if (s->env->macsr & MACSR_FI)
-        gen_helper_macsatf(cpu_env, tcg_const_i32(acc));
+        gen_helper_macsatf(cpu_env, tcg_constant_i32(acc));
     else if (s->env->macsr & MACSR_SU)
-        gen_helper_macsats(cpu_env, tcg_const_i32(acc));
+        gen_helper_macsats(cpu_env, tcg_constant_i32(acc));
     else
-        gen_helper_macsatu(cpu_env, tcg_const_i32(acc));
+        gen_helper_macsatu(cpu_env, tcg_constant_i32(acc));
 
 #if 0
     /* Disabled because conditional branches clobber temporary vars.  */
@@ -5574,7 +5570,7 @@ DISAS_INSN(mac)
             /* Skip the accumulate if the value is already saturated.  */
             l1 = gen_new_label();
             tmp = tcg_temp_new();
-            gen_op_and32(tmp, QREG_MACSR, tcg_const_i32(MACSR_PAV0 << acc));
+            gen_op_and32(tmp, QREG_MACSR, tcg_constant_i32(MACSR_PAV0 << acc));
             gen_op_jmp_nz32(tmp, l1);
         }
 #endif
@@ -5583,18 +5579,18 @@ DISAS_INSN(mac)
         else
             tcg_gen_add_i64(MACREG(acc), MACREG(acc), s->mactmp);
         if (s->env->macsr & MACSR_FI)
-            gen_helper_macsatf(cpu_env, tcg_const_i32(acc));
+            gen_helper_macsatf(cpu_env, tcg_constant_i32(acc));
         else if (s->env->macsr & MACSR_SU)
-            gen_helper_macsats(cpu_env, tcg_const_i32(acc));
+            gen_helper_macsats(cpu_env, tcg_constant_i32(acc));
         else
-            gen_helper_macsatu(cpu_env, tcg_const_i32(acc));
+            gen_helper_macsatu(cpu_env, tcg_constant_i32(acc));
 #if 0
         /* Disabled because conditional branches clobber temporary vars.  */
         if (l1 != -1)
             gen_set_label(l1);
 #endif
     }
-    gen_helper_mac_set_flags(cpu_env, tcg_const_i32(acc));
+    gen_helper_mac_set_flags(cpu_env, tcg_constant_i32(acc));
 
     if (insn & 0x30) {
         TCGv rw;
@@ -5644,8 +5640,8 @@ DISAS_INSN(move_mac)
     int src;
     TCGv dest;
     src = insn & 3;
-    dest = tcg_const_i32((insn >> 9) & 3);
-    gen_helper_mac_move(cpu_env, dest, tcg_const_i32(src));
+    dest = tcg_constant_i32((insn >> 9) & 3);
+    gen_helper_mac_move(cpu_env, dest, tcg_constant_i32(src));
     gen_mac_clear_flags();
     gen_helper_mac_set_flags(cpu_env, dest);
 }
@@ -5670,7 +5666,7 @@ DISAS_INSN(from_mext)
     TCGv reg;
     TCGv acc;
     reg = (insn & 8) ? AREG(insn, 0) : DREG(insn, 0);
-    acc = tcg_const_i32((insn & 0x400) ? 2 : 0);
+    acc = tcg_constant_i32((insn & 0x400) ? 2 : 0);
     if (s->env->macsr & MACSR_FI)
         gen_helper_get_mac_extf(reg, cpu_env, acc);
     else
@@ -5705,7 +5701,7 @@ DISAS_INSN(to_mac)
     }
     tcg_gen_andi_i32(QREG_MACSR, QREG_MACSR, ~(MACSR_PAV0 << accnum));
     gen_mac_clear_flags();
-    gen_helper_mac_set_flags(cpu_env, tcg_const_i32(accnum));
+    gen_helper_mac_set_flags(cpu_env, tcg_constant_i32(accnum));
 }
 
 DISAS_INSN(to_macsr)
@@ -5728,7 +5724,7 @@ DISAS_INSN(to_mext)
     TCGv val;
     TCGv acc;
     SRC_EA(env, val, OS_LONG, 0, NULL);
-    acc = tcg_const_i32((insn & 0x400) ? 2 : 0);
+    acc = tcg_constant_i32((insn & 0x400) ? 2 : 0);
     if (s->env->macsr & MACSR_FI)
         gen_helper_set_mac_extf(cpu_env, val, acc);
     else if (s->env->macsr & MACSR_SU)
-- 
2.34.1


