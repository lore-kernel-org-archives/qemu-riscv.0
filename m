Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqk3-0000wZ-Gp
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjP-0006Wz-4L
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:40 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjK-0003Vy-Me
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:38 -0500
Received: by mail-pl1-x641.google.com with SMTP id z2so1852854plf.12
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOzgtxQuRYUCV99sbiOrEE+Favl4yWaCSa9C90hWUEA=;
 b=qel080CMEnyJGy8xzxrB7WHVbD60AzXHhVFlcy+GBRc7sw3cVsSA1Qm7vHMm8NQ21v
 aofF05vgovUES4fLxO80dY/8DCTaXTMYzT2JEghl61Cm6V3vJOMplZ/IOWeE1Ol6TLsB
 4ZViUfPPUrx2MiFv9YNt4zP/H1BZ9Uf2mIQq1VjvxRYQfyUWpgHqKkuG01UEo1AD2V2o
 3GHqAfQK7lhAbHy4IbOPtTo1ZsYlTHlmiyOcKvohNQiGklFGFif9cTinwp7qitA8w957
 3GMyfSkT99IwKRSmvmkmBwJ/xRQ+HMarm3m4QzLz2rKJmogE+/utbh/Q73OCvgkjwXja
 WC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EOzgtxQuRYUCV99sbiOrEE+Favl4yWaCSa9C90hWUEA=;
 b=qZU+SWc6wLvXBHzKBFrXfjR+NV3YW1/EC6R+bUFeX9YHx42+EhSNJ6cqGEWM4m5qpt
 4vo93eoz698gm20r8plaNVU7eJ1xkGbEDKSgbJMKDWw0HYgjlM6doNf5sF9s5p9atlQR
 0EfmDglcZS3cXmJa+PTgRT9oAVVE59nuXT/NAkzjAoznhuI3AuP2d6i57WhP2dN0hQ5v
 WU0GG5+nVTygT21p5YJA4TLxKj6q4y1F+GkjJChlxxspUffqBa9lh7rAU7u+bldi9rsv
 qdldiZv6NQI0z1gJ5VCfYQ8BzTU/8zs5ggb23VG/mO/IwJWbbjpR+eSITTW3Tl8WU2XG
 4XMw==
X-Gm-Message-State: AO0yUKXDWFvhKvaPxgtV9xEf48wN+F6F7x8+TQkUZf2NeWngm8e58gZx
 BYz/HPRfARBUAC+lw1KYFrhkmA==
X-Google-Smtp-Source: AK7set8Rj7yNnfZXPSs8nTWFCC0rld62h5sOUyhpPu5KLI2lSJIolIcp7AKdnuGLXv8e+xH7cCy2cA==
X-Received: by 2002:a05:6a20:8f21:b0:be:e450:69b3 with SMTP id
 b33-20020a056a208f2100b000bee45069b3mr24212694pzk.0.1677316832453; 
 Sat, 25 Feb 2023 01:20:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 69/76] target/sparc: Drop tcg_temp_free
Date: Fri, 24 Feb 2023 23:14:20 -1000
Message-Id: <20230225091427.1817156-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:41 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 136 ---------------------------------------
 1 file changed, 136 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index f32f237051..814f3f8b1e 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -158,7 +158,6 @@ static void gen_store_fpr_F(DisasContext *dc, unsigned int dst, TCGv_i32 v)
     tcg_gen_extu_i32_i64(t, v);
     tcg_gen_deposit_i64(cpu_fpr[dst / 2], cpu_fpr[dst / 2], t,
                         (dst & 1 ? 0 : 32), 32);
-    tcg_temp_free_i64(t);
     gen_update_fprs_dirty(dc, dst);
 }
 
@@ -378,11 +377,6 @@ static TCGv_i32 gen_add32_carry32(void)
     carry_32 = tcg_temp_new_i32();
     tcg_gen_setcond_i32(TCG_COND_LTU, carry_32, cc_src1_32, cc_src2_32);
 
-#if TARGET_LONG_BITS == 64
-    tcg_temp_free_i32(cc_src1_32);
-    tcg_temp_free_i32(cc_src2_32);
-#endif
-
     return carry_32;
 }
 
@@ -404,11 +398,6 @@ static TCGv_i32 gen_sub32_carry32(void)
     carry_32 = tcg_temp_new_i32();
     tcg_gen_setcond_i32(TCG_COND_LTU, carry_32, cc_src1_32, cc_src2_32);
 
-#if TARGET_LONG_BITS == 64
-    tcg_temp_free_i32(cc_src1_32);
-    tcg_temp_free_i32(cc_src2_32);
-#endif
-
     return carry_32;
 }
 
@@ -439,7 +428,6 @@ static void gen_op_addx_int(DisasContext *dc, TCGv dst, TCGv src1,
                generated the carry in the first place.  */
             carry = tcg_temp_new();
             tcg_gen_add2_tl(carry, dst, cpu_cc_src, src1, cpu_cc_src2, src2);
-            tcg_temp_free(carry);
             goto add_done;
         }
         carry_32 = gen_add32_carry32();
@@ -468,11 +456,6 @@ static void gen_op_addx_int(DisasContext *dc, TCGv dst, TCGv src1,
     tcg_gen_add_tl(dst, src1, src2);
     tcg_gen_add_tl(dst, dst, carry);
 
-    tcg_temp_free_i32(carry_32);
-#if TARGET_LONG_BITS == 64
-    tcg_temp_free(carry);
-#endif
-
  add_done:
     if (update_cc) {
         tcg_gen_mov_tl(cpu_cc_src, src1);
@@ -524,7 +507,6 @@ static void gen_op_subx_int(DisasContext *dc, TCGv dst, TCGv src1,
                generated the carry in the first place.  */
             carry = tcg_temp_new();
             tcg_gen_sub2_tl(carry, dst, cpu_cc_src, src1, cpu_cc_src2, src2);
-            tcg_temp_free(carry);
             goto sub_done;
         }
         carry_32 = gen_sub32_carry32();
@@ -547,11 +529,6 @@ static void gen_op_subx_int(DisasContext *dc, TCGv dst, TCGv src1,
     tcg_gen_sub_tl(dst, src1, src2);
     tcg_gen_sub_tl(dst, dst, carry);
 
-    tcg_temp_free_i32(carry_32);
-#if TARGET_LONG_BITS == 64
-    tcg_temp_free(carry);
-#endif
-
  sub_done:
     if (update_cc) {
         tcg_gen_mov_tl(cpu_cc_src, src1);
@@ -579,7 +556,6 @@ static inline void gen_op_mulscc(TCGv dst, TCGv src1, TCGv src2)
     tcg_gen_andi_tl(cpu_cc_src2, src2, 0xffffffff);
     tcg_gen_movcond_tl(TCG_COND_EQ, cpu_cc_src2, r_temp, zero,
                        zero, cpu_cc_src2);
-    tcg_temp_free(zero);
 
     // b2 = T0 & 1;
     // env->y = (b2 << 31) | (env->y >> 1);
@@ -590,14 +566,12 @@ static inline void gen_op_mulscc(TCGv dst, TCGv src1, TCGv src2)
     gen_mov_reg_N(t0, cpu_psr);
     gen_mov_reg_V(r_temp, cpu_psr);
     tcg_gen_xor_tl(t0, t0, r_temp);
-    tcg_temp_free(r_temp);
 
     // T0 = (b1 << 31) | (T0 >> 1);
     // src1 = T0;
     tcg_gen_shli_tl(t0, t0, 31);
     tcg_gen_shri_tl(cpu_cc_src, cpu_cc_src, 1);
     tcg_gen_or_tl(cpu_cc_src, cpu_cc_src, t0);
-    tcg_temp_free(t0);
 
     tcg_gen_add_tl(cpu_cc_dst, cpu_cc_src, cpu_cc_src2);
 
@@ -625,9 +599,6 @@ static inline void gen_op_multiply(TCGv dst, TCGv src1, TCGv src2, int sign_ext)
     }
 
     tcg_gen_mul_i64(dst, t0, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     tcg_gen_shri_i64(cpu_y, dst, 32);
 #endif
 }
@@ -665,7 +636,6 @@ static inline void gen_op_eval_ble(TCGv dst, TCGv_i32 src)
     tcg_gen_xor_tl(dst, dst, t0);
     gen_mov_reg_Z(t0, src);
     tcg_gen_or_tl(dst, dst, t0);
-    tcg_temp_free(t0);
 }
 
 // N ^ V
@@ -675,7 +645,6 @@ static inline void gen_op_eval_bl(TCGv dst, TCGv_i32 src)
     gen_mov_reg_V(t0, src);
     gen_mov_reg_N(dst, src);
     tcg_gen_xor_tl(dst, dst, t0);
-    tcg_temp_free(t0);
 }
 
 // C | Z
@@ -685,7 +654,6 @@ static inline void gen_op_eval_bleu(TCGv dst, TCGv_i32 src)
     gen_mov_reg_Z(t0, src);
     gen_mov_reg_C(dst, src);
     tcg_gen_or_tl(dst, dst, t0);
-    tcg_temp_free(t0);
 }
 
 // C
@@ -790,7 +758,6 @@ static inline void gen_op_eval_fbne(TCGv dst, TCGv src,
     gen_mov_reg_FCC0(dst, src, fcc_offset);
     gen_mov_reg_FCC1(t0, src, fcc_offset);
     tcg_gen_or_tl(dst, dst, t0);
-    tcg_temp_free(t0);
 }
 
 // 1 or 2: FCC0 ^ FCC1
@@ -801,7 +768,6 @@ static inline void gen_op_eval_fblg(TCGv dst, TCGv src,
     gen_mov_reg_FCC0(dst, src, fcc_offset);
     gen_mov_reg_FCC1(t0, src, fcc_offset);
     tcg_gen_xor_tl(dst, dst, t0);
-    tcg_temp_free(t0);
 }
 
 // 1 or 3: FCC0
@@ -819,7 +785,6 @@ static inline void gen_op_eval_fbl(TCGv dst, TCGv src,
     gen_mov_reg_FCC0(dst, src, fcc_offset);
     gen_mov_reg_FCC1(t0, src, fcc_offset);
     tcg_gen_andc_tl(dst, dst, t0);
-    tcg_temp_free(t0);
 }
 
 // 2 or 3: FCC1
@@ -837,7 +802,6 @@ static inline void gen_op_eval_fbg(TCGv dst, TCGv src,
     gen_mov_reg_FCC0(dst, src, fcc_offset);
     gen_mov_reg_FCC1(t0, src, fcc_offset);
     tcg_gen_andc_tl(dst, t0, dst);
-    tcg_temp_free(t0);
 }
 
 // 3: FCC0 & FCC1
@@ -848,7 +812,6 @@ static inline void gen_op_eval_fbu(TCGv dst, TCGv src,
     gen_mov_reg_FCC0(dst, src, fcc_offset);
     gen_mov_reg_FCC1(t0, src, fcc_offset);
     tcg_gen_and_tl(dst, dst, t0);
-    tcg_temp_free(t0);
 }
 
 // 0: !(FCC0 | FCC1)
@@ -860,7 +823,6 @@ static inline void gen_op_eval_fbe(TCGv dst, TCGv src,
     gen_mov_reg_FCC1(t0, src, fcc_offset);
     tcg_gen_or_tl(dst, dst, t0);
     tcg_gen_xori_tl(dst, dst, 0x1);
-    tcg_temp_free(t0);
 }
 
 // 0 or 3: !(FCC0 ^ FCC1)
@@ -872,7 +834,6 @@ static inline void gen_op_eval_fbue(TCGv dst, TCGv src,
     gen_mov_reg_FCC1(t0, src, fcc_offset);
     tcg_gen_xor_tl(dst, dst, t0);
     tcg_gen_xori_tl(dst, dst, 0x1);
-    tcg_temp_free(t0);
 }
 
 // 0 or 2: !FCC0
@@ -892,7 +853,6 @@ static inline void gen_op_eval_fbuge(TCGv dst, TCGv src,
     gen_mov_reg_FCC1(t0, src, fcc_offset);
     tcg_gen_andc_tl(dst, dst, t0);
     tcg_gen_xori_tl(dst, dst, 0x1);
-    tcg_temp_free(t0);
 }
 
 // 0 or 1: !FCC1
@@ -912,7 +872,6 @@ static inline void gen_op_eval_fbule(TCGv dst, TCGv src,
     gen_mov_reg_FCC1(t0, src, fcc_offset);
     tcg_gen_andc_tl(dst, t0, dst);
     tcg_gen_xori_tl(dst, dst, 0x1);
-    tcg_temp_free(t0);
 }
 
 // !3: !(FCC0 & FCC1)
@@ -924,7 +883,6 @@ static inline void gen_op_eval_fbo(TCGv dst, TCGv src,
     gen_mov_reg_FCC1(t0, src, fcc_offset);
     tcg_gen_and_tl(dst, dst, t0);
     tcg_gen_xori_tl(dst, dst, 0x1);
-    tcg_temp_free(t0);
 }
 
 static inline void gen_branch2(DisasContext *dc, target_ulong pc1,
@@ -973,8 +931,6 @@ static void gen_branch_n(DisasContext *dc, target_ulong pc1)
         t = tcg_const_tl(pc1);
         z = tcg_const_tl(0);
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_npc, cpu_cond, z, t, cpu_npc);
-        tcg_temp_free(t);
-        tcg_temp_free(z);
 
         dc->pc = DYNAMIC_PC;
     }
@@ -987,10 +943,6 @@ static inline void gen_generic_branch(DisasContext *dc)
     TCGv zero = tcg_const_tl(0);
 
     tcg_gen_movcond_tl(TCG_COND_NE, cpu_npc, cpu_cond, zero, npc0, npc1);
-
-    tcg_temp_free(npc0);
-    tcg_temp_free(npc1);
-    tcg_temp_free(zero);
 }
 
 /* call this function before using the condition register as it may
@@ -1034,7 +986,6 @@ static void gen_exception(DisasContext *dc, int which)
     save_state(dc);
     t = tcg_const_i32(which);
     gen_helper_raise_exception(cpu_env, t);
-    tcg_temp_free_i32(t);
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1042,7 +993,6 @@ static void gen_check_align(TCGv addr, int mask)
 {
     TCGv_i32 r_mask = tcg_const_i32(mask);
     gen_helper_check_align(cpu_env, addr, r_mask);
-    tcg_temp_free_i32(r_mask);
 }
 
 static inline void gen_mov_pc_npc(DisasContext *dc)
@@ -1961,7 +1911,6 @@ static void gen_ldstub(DisasContext *dc, TCGv dst, TCGv addr, int mmu_idx)
     TCGv m1 = tcg_const_tl(0xff);
     gen_address_mask(dc, addr);
     tcg_gen_atomic_xchg_tl(dst, addr, m1, mmu_idx, MO_UB);
-    tcg_temp_free(m1);
 }
 
 /* asi moves */
@@ -2225,11 +2174,8 @@ static void gen_ld_asi(DisasContext *dc, TCGv dst, TCGv addr,
                 TCGv_i64 t64 = tcg_temp_new_i64();
                 gen_helper_ld_asi(t64, cpu_env, addr, r_asi, r_mop);
                 tcg_gen_trunc_i64_tl(dst, t64);
-                tcg_temp_free_i64(t64);
             }
 #endif
-            tcg_temp_free_i32(r_mop);
-            tcg_temp_free_i32(r_asi);
         }
         break;
     }
@@ -2285,11 +2231,6 @@ static void gen_st_asi(DisasContext *dc, TCGv src, TCGv addr,
                 tcg_gen_add_tl(saddr, saddr, four);
                 tcg_gen_add_tl(daddr, daddr, four);
             }
-
-            tcg_temp_free(saddr);
-            tcg_temp_free(daddr);
-            tcg_temp_free(four);
-            tcg_temp_free_i32(tmp);
         }
         break;
 #endif
@@ -2306,11 +2247,8 @@ static void gen_st_asi(DisasContext *dc, TCGv src, TCGv addr,
                 TCGv_i64 t64 = tcg_temp_new_i64();
                 tcg_gen_extu_tl_i64(t64, src);
                 gen_helper_st_asi(cpu_env, addr, t64, r_asi, r_mop);
-                tcg_temp_free_i64(t64);
             }
 #endif
-            tcg_temp_free_i32(r_mop);
-            tcg_temp_free_i32(r_asi);
 
             /* A write to a TLB register may alter page maps.  End the TB. */
             dc->npc = DYNAMIC_PC;
@@ -2351,7 +2289,6 @@ static void gen_cas_asi(DisasContext *dc, TCGv addr, TCGv cmpv,
         tcg_gen_atomic_cmpxchg_tl(oldv, addr, cmpv, gen_load_gpr(dc, rd),
                                   da.mem_idx, da.memop);
         gen_store_gpr(dc, rd, oldv);
-        tcg_temp_free(oldv);
         break;
     default:
         /* ??? Should be DAE_invalid_asi.  */
@@ -2386,12 +2323,8 @@ static void gen_ldstub_asi(DisasContext *dc, TCGv dst, TCGv addr, int insn)
 
             s64 = tcg_const_i64(0xff);
             gen_helper_st_asi(cpu_env, addr, s64, r_asi, r_mop);
-            tcg_temp_free_i64(s64);
-            tcg_temp_free_i32(r_mop);
-            tcg_temp_free_i32(r_asi);
 
             tcg_gen_trunc_i64_tl(dst, t64);
-            tcg_temp_free_i64(t64);
 
             /* End the TB.  */
             dc->npc = DYNAMIC_PC;
@@ -2432,7 +2365,6 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr,
             tcg_gen_qemu_ld_i64(cpu_fpr[rd/2+1], addr, da.mem_idx,
                                 da.memop | MO_ALIGN_4);
             tcg_gen_mov_i64(cpu_fpr[rd / 2], d64);
-            tcg_temp_free_i64(d64);
             break;
         default:
             g_assert_not_reached();
@@ -2460,7 +2392,6 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr,
                 tcg_gen_add_tl(addr, addr, eight);
                 memop = da.memop;
             }
-            tcg_temp_free(eight);
         } else {
             gen_exception(dc, TT_ILL_INSN);
         }
@@ -2492,7 +2423,6 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr,
                 gen_helper_ld_asi(d64, cpu_env, addr, r_asi, r_mop);
                 d32 = gen_dest_fpr_F(dc);
                 tcg_gen_extrl_i64_i32(d32, d64);
-                tcg_temp_free_i64(d64);
                 gen_store_fpr_F(dc, rd, d32);
                 break;
             case 8:
@@ -2504,13 +2434,10 @@ static void gen_ldf_asi(DisasContext *dc, TCGv addr,
                 tcg_gen_addi_tl(addr, addr, 8);
                 gen_helper_ld_asi(cpu_fpr[rd/2+1], cpu_env, addr, r_asi, r_mop);
                 tcg_gen_mov_i64(cpu_fpr[rd / 2], d64);
-                tcg_temp_free_i64(d64);
                 break;
             default:
                 g_assert_not_reached();
             }
-            tcg_temp_free_i32(r_mop);
-            tcg_temp_free_i32(r_asi);
         }
         break;
     }
@@ -2574,7 +2501,6 @@ static void gen_stf_asi(DisasContext *dc, TCGv addr,
                 tcg_gen_add_tl(addr, addr, eight);
                 memop = da.memop;
             }
-            tcg_temp_free(eight);
         } else {
             gen_exception(dc, TT_ILL_INSN);
         }
@@ -2631,7 +2557,6 @@ static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
             } else {
                 tcg_gen_extr32_i64(hi, lo, tmp);
             }
-            tcg_temp_free_i64(tmp);
         }
         break;
 
@@ -2647,8 +2572,6 @@ static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
 
             save_state(dc);
             gen_helper_ld_asi(tmp, cpu_env, addr, r_asi, r_mop);
-            tcg_temp_free_i32(r_asi);
-            tcg_temp_free_i32(r_mop);
 
             /* See above.  */
             if ((da.memop & MO_BSWAP) == MO_TE) {
@@ -2656,7 +2579,6 @@ static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
             } else {
                 tcg_gen_extr32_i64(hi, lo, tmp);
             }
-            tcg_temp_free_i64(tmp);
         }
         break;
     }
@@ -2696,7 +2618,6 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
             }
             gen_address_mask(dc, addr);
             tcg_gen_qemu_st_i64(t64, addr, da.mem_idx, da.memop);
-            tcg_temp_free_i64(t64);
         }
         break;
 
@@ -2717,9 +2638,6 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
 
             save_state(dc);
             gen_helper_st_asi(cpu_env, addr, t64, r_asi, r_mop);
-            tcg_temp_free_i32(r_mop);
-            tcg_temp_free_i32(r_asi);
-            tcg_temp_free_i64(t64);
         }
         break;
     }
@@ -2739,7 +2657,6 @@ static void gen_casx_asi(DisasContext *dc, TCGv addr, TCGv cmpv,
         tcg_gen_atomic_cmpxchg_tl(oldv, addr, cmpv, gen_load_gpr(dc, rd),
                                   da.mem_idx, da.memop);
         gen_store_gpr(dc, rd, oldv);
-        tcg_temp_free(oldv);
         break;
     default:
         /* ??? Should be DAE_invalid_asi.  */
@@ -2762,7 +2679,6 @@ static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
 
     switch (da.type) {
     case GET_ASI_EXCP:
-        tcg_temp_free_i64(t64);
         return;
     case GET_ASI_DIRECT:
         gen_address_mask(dc, addr);
@@ -2775,14 +2691,11 @@ static void gen_ldda_asi(DisasContext *dc, TCGv addr, int insn, int rd)
 
             save_state(dc);
             gen_helper_ld_asi(t64, cpu_env, addr, r_asi, r_mop);
-            tcg_temp_free_i32(r_mop);
-            tcg_temp_free_i32(r_asi);
         }
         break;
     }
 
     tcg_gen_extr_i64_i32(lo, hi, t64);
-    tcg_temp_free_i64(t64);
     gen_store_gpr(dc, rd | 1, lo);
     gen_store_gpr(dc, rd, hi);
 }
@@ -2819,9 +2732,6 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
                 tcg_gen_qemu_st_i64(t64, d_addr, da.mem_idx, da.memop);
                 tcg_gen_add_tl(d_addr, d_addr, eight);
             }
-
-            tcg_temp_free(d_addr);
-            tcg_temp_free(eight);
         }
         break;
     default:
@@ -2831,13 +2741,9 @@ static void gen_stda_asi(DisasContext *dc, TCGv hi, TCGv addr,
 
             save_state(dc);
             gen_helper_st_asi(cpu_env, addr, t64, r_asi, r_mop);
-            tcg_temp_free_i32(r_mop);
-            tcg_temp_free_i32(r_asi);
         }
         break;
     }
-
-    tcg_temp_free_i64(t64);
 }
 #endif
 
@@ -2875,7 +2781,6 @@ static void gen_fmovs(DisasContext *dc, DisasCompare *cmp, int rd, int rs)
         TCGv_i64 c64 = tcg_temp_new_i64();
         tcg_gen_setcond_i64(cmp->cond, c64, cmp->c1, cmp->c2);
         tcg_gen_extrl_i64_i32(c32, c64);
-        tcg_temp_free_i64(c64);
     }
 
     s1 = gen_load_fpr_F(dc, rs);
@@ -2885,8 +2790,6 @@ static void gen_fmovs(DisasContext *dc, DisasCompare *cmp, int rd, int rs)
 
     tcg_gen_movcond_i32(TCG_COND_NE, dst, c32, zero, s1, s2);
 
-    tcg_temp_free_i32(c32);
-    tcg_temp_free_i32(zero);
     gen_store_fpr_F(dc, rd, dst);
 }
 
@@ -2932,10 +2835,7 @@ static inline void gen_load_trap_state_at_tl(TCGv_ptr r_tsptr, TCGv_env cpu_env)
         TCGv_ptr r_tl_tmp = tcg_temp_new_ptr();
         tcg_gen_ext_i32_ptr(r_tl_tmp, r_tl);
         tcg_gen_add_ptr(r_tsptr, r_tsptr, r_tl_tmp);
-        tcg_temp_free_ptr(r_tl_tmp);
     }
-
-    tcg_temp_free_i32(r_tl);
 }
 #endif
 
@@ -3035,11 +2935,6 @@ static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
     tcg_gen_neg_tl(t1, t1);
     tcg_gen_or_tl(lo2, lo2, t1);
     tcg_gen_and_tl(dst, dst, lo2);
-
-    tcg_temp_free(lo1);
-    tcg_temp_free(lo2);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 static void gen_alignaddr(TCGv dst, TCGv s1, TCGv s2, bool left)
@@ -3052,8 +2947,6 @@ static void gen_alignaddr(TCGv dst, TCGv s1, TCGv s2, bool left)
         tcg_gen_neg_tl(tmp, tmp);
     }
     tcg_gen_deposit_tl(cpu_gsr, cpu_gsr, tmp, 0, 3);
-
-    tcg_temp_free(tmp);
 }
 
 static void gen_faligndata(TCGv dst, TCGv gsr, TCGv s1, TCGv s2)
@@ -3075,10 +2968,6 @@ static void gen_faligndata(TCGv dst, TCGv gsr, TCGv s1, TCGv s2)
     tcg_gen_shri_tl(t2, t2, 1);
 
     tcg_gen_or_tl(dst, t1, t2);
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(shift);
 }
 #endif
 
@@ -3278,7 +3167,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 }
 
                 gen_helper_raise_exception(cpu_env, trap);
-                tcg_temp_free_i32(trap);
 
                 if (cond == 8) {
                     /* An unconditional trap ends the TB.  */
@@ -3337,8 +3225,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         }
                         gen_helper_tick_get_count(cpu_dst, cpu_env, r_tickptr,
                                                   r_const);
-                        tcg_temp_free_ptr(r_tickptr);
-                        tcg_temp_free_i32(r_const);
                         gen_store_gpr(dc, rd, cpu_dst);
                         if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
                             /* I/O operations in icount mode must end the TB */
@@ -3391,8 +3277,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         }
                         gen_helper_tick_get_count(cpu_dst, cpu_env, r_tickptr,
                                                   r_const);
-                        tcg_temp_free_ptr(r_tickptr);
-                        tcg_temp_free_i32(r_const);
                         gen_store_gpr(dc, rd, cpu_dst);
                         if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
                             /* I/O operations in icount mode must end the TB */
@@ -3478,7 +3362,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         gen_load_trap_state_at_tl(r_tsptr, cpu_env);
                         tcg_gen_ld_tl(cpu_tmp0, r_tsptr,
                                       offsetof(trap_state, tpc));
-                        tcg_temp_free_ptr(r_tsptr);
                     }
                     break;
                 case 1: // tnpc
@@ -3489,7 +3372,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         gen_load_trap_state_at_tl(r_tsptr, cpu_env);
                         tcg_gen_ld_tl(cpu_tmp0, r_tsptr,
                                       offsetof(trap_state, tnpc));
-                        tcg_temp_free_ptr(r_tsptr);
                     }
                     break;
                 case 2: // tstate
@@ -3500,7 +3382,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         gen_load_trap_state_at_tl(r_tsptr, cpu_env);
                         tcg_gen_ld_tl(cpu_tmp0, r_tsptr,
                                       offsetof(trap_state, tstate));
-                        tcg_temp_free_ptr(r_tsptr);
                     }
                     break;
                 case 3: // tt
@@ -3510,7 +3391,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         gen_load_trap_state_at_tl(r_tsptr, cpu_env);
                         tcg_gen_ld32s_tl(cpu_tmp0, r_tsptr,
                                          offsetof(trap_state, tt));
-                        tcg_temp_free_ptr(r_tsptr);
                     }
                     break;
                 case 4: // tick
@@ -3527,8 +3407,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         }
                         gen_helper_tick_get_count(cpu_tmp0, cpu_env,
                                                   r_tickptr, r_const);
-                        tcg_temp_free_ptr(r_tickptr);
-                        tcg_temp_free_i32(r_const);
                         if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
                             /* I/O operations in icount mode must end the TB */
                             dc->base.is_jmp = DISAS_EXIT;
@@ -4343,7 +4221,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                     }
                                     gen_helper_tick_set_limit(r_tickptr,
                                                               cpu_tick_cmpr);
-                                    tcg_temp_free_ptr(r_tickptr);
                                     /* End TB to handle timer interrupt */
                                     dc->base.is_jmp = DISAS_EXIT;
                                 }
@@ -4367,7 +4244,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                     }
                                     gen_helper_tick_set_count(r_tickptr,
                                                               cpu_tmp0);
-                                    tcg_temp_free_ptr(r_tickptr);
                                     /* End TB to handle timer interrupt */
                                     dc->base.is_jmp = DISAS_EXIT;
                                 }
@@ -4391,7 +4267,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                     }
                                     gen_helper_tick_set_limit(r_tickptr,
                                                               cpu_stick_cmpr);
-                                    tcg_temp_free_ptr(r_tickptr);
                                     /* End TB to handle timer interrupt */
                                     dc->base.is_jmp = DISAS_EXIT;
                                 }
@@ -4457,7 +4332,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                     gen_load_trap_state_at_tl(r_tsptr, cpu_env);
                                     tcg_gen_st_tl(cpu_tmp0, r_tsptr,
                                                   offsetof(trap_state, tpc));
-                                    tcg_temp_free_ptr(r_tsptr);
                                 }
                                 break;
                             case 1: // tnpc
@@ -4468,7 +4342,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                     gen_load_trap_state_at_tl(r_tsptr, cpu_env);
                                     tcg_gen_st_tl(cpu_tmp0, r_tsptr,
                                                   offsetof(trap_state, tnpc));
-                                    tcg_temp_free_ptr(r_tsptr);
                                 }
                                 break;
                             case 2: // tstate
@@ -4480,7 +4353,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                     tcg_gen_st_tl(cpu_tmp0, r_tsptr,
                                                   offsetof(trap_state,
                                                            tstate));
-                                    tcg_temp_free_ptr(r_tsptr);
                                 }
                                 break;
                             case 3: // tt
@@ -4491,7 +4363,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                     gen_load_trap_state_at_tl(r_tsptr, cpu_env);
                                     tcg_gen_st32_tl(cpu_tmp0, r_tsptr,
                                                     offsetof(trap_state, tt));
-                                    tcg_temp_free_ptr(r_tsptr);
                                 }
                                 break;
                             case 4: // tick
@@ -4507,7 +4378,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                     }
                                     gen_helper_tick_set_count(r_tickptr,
                                                               cpu_tmp0);
-                                    tcg_temp_free_ptr(r_tickptr);
                                     /* End TB to handle timer interrupt */
                                     dc->base.is_jmp = DISAS_EXIT;
                                 }
@@ -4638,7 +4508,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                     }
                                     gen_helper_tick_set_limit(r_tickptr,
                                                               cpu_hstick_cmpr);
-                                    tcg_temp_free_ptr(r_tickptr);
                                     /* End TB to handle timer interrupt */
                                     dc->base.is_jmp = DISAS_EXIT;
                                 }
@@ -5340,7 +5209,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         gen_store_gpr(dc, rd + 1, cpu_val);
                         tcg_gen_shri_i64(t64, t64, 32);
                         tcg_gen_trunc_i64_tl(cpu_val, t64);
-                        tcg_temp_free_i64(t64);
                         tcg_gen_ext32u_tl(cpu_val, cpu_val);
                     }
                     break;
@@ -5470,7 +5338,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         tcg_gen_qemu_ld_i64(t64, cpu_addr,
                                             dc->mem_idx, MO_TEUQ);
                         gen_helper_ldxfsr(cpu_fsr, cpu_env, cpu_fsr, t64);
-                        tcg_temp_free_i64(t64);
                         break;
                     }
 #endif
@@ -5490,8 +5357,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     tcg_gen_qemu_ld_i64(cpu_src2_64, cpu_addr, dc->mem_idx,
                                         MO_TEUQ | MO_ALIGN_4);
                     gen_store_fpr_Q(dc, rd, cpu_src1_64, cpu_src2_64);
-                    tcg_temp_free_i64(cpu_src1_64);
-                    tcg_temp_free_i64(cpu_src2_64);
                     break;
                 case 0x23:      /* lddf, load double fpreg */
                     gen_address_mask(dc, cpu_addr);
@@ -5532,7 +5397,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         t64 = tcg_temp_new_i64();
                         tcg_gen_concat_tl_i64(t64, lo, cpu_val);
                         tcg_gen_qemu_st64(t64, cpu_addr, dc->mem_idx);
-                        tcg_temp_free_i64(t64);
                     }
                     break;
 #if !defined(CONFIG_USER_ONLY) || defined(TARGET_SPARC64)
-- 
2.34.1


