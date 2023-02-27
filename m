Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW22-0008Tz-U5
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW20-0008Ph-3Z
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:36 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1y-0007oF-0m
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:35 -0500
Received: by mail-pj1-x1042.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so8889570pjb.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRXjTp+TXfW0C5esl+Zugvmwem8SqRIai2YjZ7FQqDw=;
 b=IaDMnUfSpDyZf2gVFTRpcpj1HmN9PuUZYpRvelzakPf1zd2p9vl/+pgZQJ6usCkjsv
 RilHP9KdnJBIwBEYCZwYZ9MKCSrzN6uzgy3JG9OKjIbcNcAGTGWJhudrOav0HFx3eKIY
 1+lvNGQi0ODjmog9tjYLPdVPN/fi9HXAMN6Y33ggnJYuAUuUW+dmAChvzCMeVpBBbwuP
 q6m0RngJOP8WDsXO4Nbl6ERQ1l0WuSMNEqqpdJPwG4a4rQ3cjrgrFGrKjHWPHpSdXlcZ
 mG2BdV+Qhsx809PIoNQH0xEdMvUQKsAh19CtWUO1KVvg1/eJhslcOgMBvElB2LiutfSC
 lXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRXjTp+TXfW0C5esl+Zugvmwem8SqRIai2YjZ7FQqDw=;
 b=e1wW9txG7lo09Y0mlnYVI8aFb3NyTaaoFUzCTNRTLZzYvJeAoJvxAgB8vyt8z1I3/J
 pfaKvIRz4TjvnJj2joishgw6IYld309ZIpV9huOrZHZQDW93JwRTaVEuhN7RTyqFn7dx
 45JsQSEZ7GK5dTPnb83A0z7dG9zV4lgRmqcnh3Sz9W/R+0yvfCgGNNl1t03mvkmhRSK2
 odclONrERfPQdQX38Ucd2rawRctKsQnEZ1wjTSpgC+elcIymK3bbAdn1XLFy9Tkz2MbN
 aNAVP0OdGnElo1Z5snWlgglpFic7UXvBUpXUm3QmhYlg90fEtqC0A9JONXK89K07MDiP
 e1Ww==
X-Gm-Message-State: AO0yUKUErFrD/7IYB/5eKIRbXNH+Qv/AOlW64ILBB3VWvXuM15uW9hR8
 LuHbuZ79USKHHbi3y2Zzc13FNQ==
X-Google-Smtp-Source: AK7set8ly18mIeAVUA5DhLkvciKB8cTkUjcyvY//+4dCDtnR/IZ9XCTboZNTCXaF9XAGZP6Ab8fxrQ==
X-Received: by 2002:a17:902:e5d2:b0:19c:ff5d:1fd2 with SMTP id
 u18-20020a170902e5d200b0019cff5d1fd2mr5214788plf.8.1677475592648; 
 Sun, 26 Feb 2023 21:26:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 30/76] target/i386: Drop tcg_temp_free
Date: Sun, 26 Feb 2023 19:24:19 -1000
Message-Id: <20230227052505.352889-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:36 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c      | 41 --------------------------------
 target/i386/tcg/decode-new.c.inc | 15 ------------
 target/i386/tcg/emit.c.inc       |  6 -----
 3 files changed, 62 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index baf1cfc2bc..692f0c63a8 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -899,10 +899,6 @@ static void gen_compute_eflags(DisasContext *s)
     gen_update_cc_op(s);
     gen_helper_cc_compute_all(cpu_cc_src, dst, src1, src2, cpu_cc_op);
     set_cc_op(s, CC_OP_EFLAGS);
-
-    if (dead) {
-        tcg_temp_free(zero);
-    }
 }
 
 typedef struct CCPrepare {
@@ -1650,7 +1646,6 @@ static void gen_shift_flags(DisasContext *s, MemOp ot, TCGv result,
     } else {
         tcg_gen_mov_tl(cpu_cc_src, shm1);
     }
-    tcg_temp_free(z_tl);
 
     /* Get the two potential CC_OP values into temporaries.  */
     tcg_gen_movi_i32(s->tmp2_i32, (is_right ? CC_OP_SARB : CC_OP_SHLB) + ot);
@@ -1666,8 +1661,6 @@ static void gen_shift_flags(DisasContext *s, MemOp ot, TCGv result,
     s32 = tcg_temp_new_i32();
     tcg_gen_trunc_tl_i32(s32, count);
     tcg_gen_movcond_i32(TCG_COND_NE, cpu_cc_op, s32, z32, s->tmp2_i32, oldop);
-    tcg_temp_free_i32(z32);
-    tcg_temp_free_i32(s32);
 
     /* The CC_OP value is no longer predictable.  */
     set_cc_op(s, CC_OP_DYNAMIC);
@@ -1827,8 +1820,6 @@ static void gen_rot_rm_T1(DisasContext *s, MemOp ot, int op1, int is_right)
     tcg_gen_movi_i32(s->tmp3_i32, CC_OP_EFLAGS);
     tcg_gen_movcond_i32(TCG_COND_NE, cpu_cc_op, t1, t0,
                         s->tmp2_i32, s->tmp3_i32);
-    tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(t1);
 
     /* The CC_OP value is no longer predictable.  */ 
     set_cc_op(s, CC_OP_DYNAMIC);
@@ -2049,7 +2040,6 @@ static void gen_shiftd_rm_T1(DisasContext *s, MemOp ot, int op1,
     gen_op_st_rm_T0_A0(s, ot, op1);
 
     gen_shift_flags(s, ot, s->T0, s->tmp0, count, is_right);
-    tcg_temp_free(count);
 }
 
 static void gen_shift(DisasContext *s1, int op, MemOp ot, int d, int s)
@@ -2513,13 +2503,6 @@ static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
     tcg_gen_movcond_tl(cc.cond, s->T0, cc.reg, cc.reg2,
                        s->T0, cpu_regs[reg]);
     gen_op_mov_reg_v(s, ot, reg, s->T0);
-
-    if (cc.mask != -1) {
-        tcg_temp_free(cc.reg);
-    }
-    if (!cc.use_reg2) {
-        tcg_temp_free(cc.reg2);
-    }
 }
 
 static inline void gen_op_movl_T0_seg(DisasContext *s, X86Seg seg_reg)
@@ -2748,7 +2731,6 @@ static void gen_set_hflag(DisasContext *s, uint32_t mask)
         tcg_gen_ld_i32(t, cpu_env, offsetof(CPUX86State, hflags));
         tcg_gen_ori_i32(t, t, mask);
         tcg_gen_st_i32(t, cpu_env, offsetof(CPUX86State, hflags));
-        tcg_temp_free_i32(t);
         s->flags |= mask;
     }
 }
@@ -2760,7 +2742,6 @@ static void gen_reset_hflag(DisasContext *s, uint32_t mask)
         tcg_gen_ld_i32(t, cpu_env, offsetof(CPUX86State, hflags));
         tcg_gen_andi_i32(t, t, ~mask);
         tcg_gen_st_i32(t, cpu_env, offsetof(CPUX86State, hflags));
-        tcg_temp_free_i32(t);
         s->flags &= ~mask;
     }
 }
@@ -2772,7 +2753,6 @@ static void gen_set_eflags(DisasContext *s, target_ulong mask)
     tcg_gen_ld_tl(t, cpu_env, offsetof(CPUX86State, eflags));
     tcg_gen_ori_tl(t, t, mask);
     tcg_gen_st_tl(t, cpu_env, offsetof(CPUX86State, eflags));
-    tcg_temp_free(t);
 }
 
 static void gen_reset_eflags(DisasContext *s, target_ulong mask)
@@ -2782,7 +2762,6 @@ static void gen_reset_eflags(DisasContext *s, target_ulong mask)
     tcg_gen_ld_tl(t, cpu_env, offsetof(CPUX86State, eflags));
     tcg_gen_andi_tl(t, t, ~mask);
     tcg_gen_st_tl(t, cpu_env, offsetof(CPUX86State, eflags));
-    tcg_temp_free(t);
 }
 
 /* Clear BND registers during legacy branches.  */
@@ -3015,13 +2994,11 @@ static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
         tcg_gen_nonatomic_cmpxchg_i64(old, s->A0, cmp, val,
                                       s->mem_index, MO_TEUQ);
     }
-    tcg_temp_free_i64(val);
 
     /* Set tmp0 to match the required value of Z. */
     tcg_gen_setcond_i64(TCG_COND_EQ, cmp, old, cmp);
     Z = tcg_temp_new();
     tcg_gen_trunc_i64_tl(Z, cmp);
-    tcg_temp_free_i64(cmp);
 
     /*
      * Extract the result values for the register pair.
@@ -3042,12 +3019,10 @@ static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EDX], Z, zero,
                            s->T1, cpu_regs[R_EDX]);
     }
-    tcg_temp_free_i64(old);
 
     /* Update Z. */
     gen_compute_eflags(s);
     tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, Z, ctz32(CC_Z), 1);
-    tcg_temp_free(Z);
 }
 
 #ifdef TARGET_X86_64
@@ -3072,8 +3047,6 @@ static void gen_cmpxchg16b(DisasContext *s, CPUX86State *env, int modrm)
     }
 
     tcg_gen_extr_i128_i64(s->T0, s->T1, val);
-    tcg_temp_free_i128(cmp);
-    tcg_temp_free_i128(val);
 
     /* Determine success after the fact. */
     t0 = tcg_temp_new_i64();
@@ -3081,13 +3054,11 @@ static void gen_cmpxchg16b(DisasContext *s, CPUX86State *env, int modrm)
     tcg_gen_xor_i64(t0, s->T0, cpu_regs[R_EAX]);
     tcg_gen_xor_i64(t1, s->T1, cpu_regs[R_EDX]);
     tcg_gen_or_i64(t0, t0, t1);
-    tcg_temp_free_i64(t1);
 
     /* Update Z. */
     gen_compute_eflags(s);
     tcg_gen_setcondi_i64(TCG_COND_EQ, t0, t0, 0);
     tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, t0, ctz32(CC_Z), 1);
-    tcg_temp_free_i64(t0);
 
     /*
      * Extract the result values for the register pair.  We may do this
@@ -3437,10 +3408,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_neg_tl(t1, t0);
                 tcg_gen_atomic_cmpxchg_tl(t0, a0, t0, t1,
                                           s->mem_index, ot | MO_LE);
-                tcg_temp_free(t1);
                 tcg_gen_brcond_tl(TCG_COND_NE, t0, t2, label1);
 
-                tcg_temp_free(t2);
                 tcg_gen_neg_tl(s->T0, t0);
             } else {
                 tcg_gen_neg_tl(s->T0, s->T0);
@@ -3927,9 +3896,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_mov_tl(s->cc_srcT, cmpv);
             tcg_gen_sub_tl(cpu_cc_dst, cmpv, oldv);
             set_cc_op(s, CC_OP_SUBB + ot);
-            tcg_temp_free(oldv);
-            tcg_temp_free(newv);
-            tcg_temp_free(cmpv);
         }
         break;
     case 0x1c7: /* cmpxchg8b */
@@ -4380,7 +4346,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (shift) {
             TCGv imm = tcg_const_tl(x86_ldub_code(env, s));
             gen_shiftd_rm_T1(s, ot, opreg, op, imm);
-            tcg_temp_free(imm);
         } else {
             gen_shiftd_rm_T1(s, ot, opreg, op, cpu_regs[R_ECX]);
         }
@@ -4614,7 +4579,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                     tcg_gen_st_tl(last_addr, cpu_env,
                                   offsetof(CPUX86State, fpdp));
                 }
-                tcg_temp_free(last_addr);
             } else {
                 /* register float ops */
                 opreg = rm;
@@ -6279,9 +6243,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_compute_eflags(s);
             tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, ~CC_Z);
             tcg_gen_or_tl(cpu_cc_src, cpu_cc_src, t2);
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
-            tcg_temp_free(t2);
         }
         break;
     case 0x102: /* lar */
@@ -6308,7 +6269,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_mov_reg_v(s, ot, reg, t0);
             gen_set_label(label1);
             set_cc_op(s, CC_OP_EFLAGS);
-            tcg_temp_free(t0);
         }
         break;
     case 0x118:
@@ -6353,7 +6313,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 TCGv_i64 notu = tcg_temp_new_i64();
                 tcg_gen_not_i64(notu, cpu_bndu[reg]);
                 gen_bndck(env, s, modrm, TCG_COND_GTU, notu);
-                tcg_temp_free_i64(notu);
             } else if (prefixes & PREFIX_DATA) {
                 /* bndmov -- from reg/mem */
                 if (reg >= 4 || s->aflag == MO_16) {
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index d5fd8d965c..4fdd87750b 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -1567,20 +1567,6 @@ illegal:
     return false;
 }
 
-static void decode_temp_free(X86DecodedOp *op)
-{
-    if (op->v_ptr) {
-        tcg_temp_free_ptr(op->v_ptr);
-    }
-}
-
-static void decode_temps_free(X86DecodedInsn *decode)
-{
-    decode_temp_free(&decode->op[0]);
-    decode_temp_free(&decode->op[1]);
-    decode_temp_free(&decode->op[2]);
-}
-
 /*
  * Convert one instruction. s->base.is_jmp is set if the translation must
  * be stopped.
@@ -1835,7 +1821,6 @@ static void disas_insn_new(DisasContext *s, CPUState *cpu, int b)
         decode.e.gen(s, env, &decode);
         gen_writeback(s, &decode, 0, s->T0);
     }
-    decode_temps_free(&decode);
     return;
  illegal_op:
     gen_illegal_opcode(s);
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index e61ae9a2e9..88359480dd 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -629,7 +629,6 @@ static inline void gen_ternary_sse(DisasContext *s, CPUX86State *env, X86Decoded
     /* The format of the fourth input is Lx */
     tcg_gen_addi_ptr(ptr3, cpu_env, ZMM_OFFSET(op3));
     fn(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2, ptr3);
-    tcg_temp_free_ptr(ptr3);
 }
 #define TERNARY_SSE(uname, uvname, lname)                                          \
 static void gen_##uvname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
@@ -1001,7 +1000,6 @@ static inline void gen_vsib_avx(DisasContext *s, CPUX86State *env, X86DecodedIns
         int ymmh_ofs = vector_elem_offset(&decode->op[1], MO_128, 1);
         tcg_gen_gvec_dup_imm(MO_64, ymmh_ofs, 16, 16, 0);
     }
-    tcg_temp_free_ptr(index);
 }
 #define VSIB_AVX(uname, lname)                                                     \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
@@ -1627,7 +1625,6 @@ static void gen_PMOVMSKB(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
             tcg_gen_deposit_tl(s->T0, t, s->T0, 8, TARGET_LONG_BITS - 8);
         }
     }
-    tcg_temp_free(t);
 }
 
 static void gen_PSHUFW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
@@ -1762,7 +1759,6 @@ static void gen_PSRLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
     } else {
         gen_helper_psrldq_xmm(cpu_env, OP_PTR0, OP_PTR1, imm_vec);
     }
-    tcg_temp_free_ptr(imm_vec);
 }
 
 static void gen_PSLLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
@@ -1775,7 +1771,6 @@ static void gen_PSLLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
     } else {
         gen_helper_pslldq_xmm(cpu_env, OP_PTR0, OP_PTR1, imm_vec);
     }
-    tcg_temp_free_ptr(imm_vec);
 }
 
 static void gen_RORX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
@@ -2293,7 +2288,6 @@ static void gen_VZEROALL(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
     tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, xmm_t0));
     gen_helper_memset(ptr, ptr, tcg_constant_i32(0),
                       tcg_constant_ptr(CPU_NB_REGS * sizeof(ZMMReg)));
-    tcg_temp_free_ptr(ptr);
 }
 
 static void gen_VZEROUPPER(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
-- 
2.34.1


