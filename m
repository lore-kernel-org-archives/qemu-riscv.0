Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1T-0007Hn-Vz
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1N-00079g-0z
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:58 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1I-0007Cv-Jo
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:25:56 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso912157pjb.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oyukTKpkx7E2+5MyXTDekUgKr37KnymCTJNQhCaEjRc=;
 b=GZwZ9IPZdcGH0v+1UV05rCL4VhHAF89wdAU7Me8H3Ts84yWNzUgnePwl5wH7IfSiZt
 5t+yRlBqh7WR4ztFYpBWEMn7wMfYqaDgLYTzqv2SNJviy6mZF3xc/4cG03W4PiyaeAsB
 ne4f63ds4y6bXY43VuuOsLYCJfCtlmkhyeZ9+vNMi/ZU4QRPgD+cCHMx1MWlsaWM1xfX
 DSoWu8rXvvV+miS0ErmgxQWJkyC5IisV5f2PZuhL1RYiajz7XlKoCC25wGBmJcQ5R1PG
 2CkK49m37av60JxuU2sE2JFsFmN4MQH9+AtcyhTZIF7yODqluxQGHJUe1yM0E7M9ol7N
 AMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oyukTKpkx7E2+5MyXTDekUgKr37KnymCTJNQhCaEjRc=;
 b=JlHNOmM8XlfL7+kCP+ZQ5fEg776E0/Ir2FsYY3I7yQB5vfn2RdXgfjFK+BNwTyORcR
 0TYBiK9A0wfoZyYVp74J1y546hTdHuquc+6EjWFITomERpfMGp4uKMU/sS1xt4GZVry3
 d4w4N/cV2QVLlK5qHEvj16UM+IrY/W3GRx4go424xHvxvZTXw8fIKkDXFzGOtIFhAl3/
 4Riaew908GxjwmL6ax8yRq5O0qysl/ZZEADoysCzICPz6MG8GmEDM2Sw+z9O6kwaE//H
 QJO4bGIJi0L9lDFDCoaPas1d3MjrqQrYqXQ5s4tLyDRL5Habp8/C61xLsBoC6e5djhEo
 YHzQ==
X-Gm-Message-State: AO0yUKVxXNFtPDS3ITWVciLIZ0dqdqiBdJsdpd9y/rSAlha8tlnktQZV
 xjRMvYSq0D0HfvLQG0NflXFzpg==
X-Google-Smtp-Source: AK7set99v5aZJYMnK60Dn9cwAMmiz4Q2gR4CXVh8MdbXnKLfZMcoYMWcOPfs9gpN9LLDsY04x7vKfQ==
X-Received: by 2002:a17:902:e745:b0:19b:dfd:a202 with SMTP id
 p5-20020a170902e74500b0019b0dfda202mr28728490plf.38.1677475551660; 
 Sun, 26 Feb 2023 21:25:51 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 15/76] target/arm: Drop tcg_temp_free from translator-sve.c
Date: Sun, 26 Feb 2023 19:24:04 -1000
Message-Id: <20230227052505.352889-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Mon, 27 Feb 2023 05:25:58 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 186 +------------------------------------
 1 file changed, 2 insertions(+), 184 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2f607a355e..5bf80b22d7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -130,7 +130,6 @@ static bool gen_gvec_fpst_zz(DisasContext *s, gen_helper_gvec_2_ptr *fn,
         tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, rd),
                            vec_full_reg_offset(s, rn),
                            status, vsz, vsz, data, fn);
-        tcg_temp_free_ptr(status);
     }
     return true;
 }
@@ -181,8 +180,6 @@ static bool gen_gvec_fpst_zzz(DisasContext *s, gen_helper_gvec_3_ptr *fn,
                            vec_full_reg_offset(s, rn),
                            vec_full_reg_offset(s, rm),
                            status, vsz, vsz, data, fn);
-
-        tcg_temp_free_ptr(status);
     }
     return true;
 }
@@ -249,7 +246,6 @@ static bool gen_gvec_fpst_zzzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
 {
     TCGv_ptr status = fpstatus_ptr(flavour);
     bool ret = gen_gvec_ptr_zzzz(s, fn, rd, rn, rm, ra, data, status);
-    tcg_temp_free_ptr(status);
     return ret;
 }
 
@@ -271,8 +267,6 @@ static bool gen_gvec_fpst_zzzzp(DisasContext *s, gen_helper_gvec_5_ptr *fn,
                            vec_full_reg_offset(s, ra),
                            pred_full_reg_offset(s, pg),
                            status, vsz, vsz, data, fn);
-
-        tcg_temp_free_ptr(status);
     }
     return true;
 }
@@ -321,7 +315,6 @@ static bool gen_gvec_fpst_zzp(DisasContext *s, gen_helper_gvec_3_ptr *fn,
                            vec_full_reg_offset(s, rn),
                            pred_full_reg_offset(s, pg),
                            status, vsz, vsz, data, fn);
-        tcg_temp_free_ptr(status);
     }
     return true;
 }
@@ -374,7 +367,6 @@ static bool gen_gvec_fpst_zzzp(DisasContext *s, gen_helper_gvec_4_ptr *fn,
                            vec_full_reg_offset(s, rm),
                            pred_full_reg_offset(s, pg),
                            status, vsz, vsz, data, fn);
-        tcg_temp_free_ptr(status);
     }
     return true;
 }
@@ -508,7 +500,6 @@ static void do_predtest1(TCGv_i64 d, TCGv_i64 g)
 
     gen_helper_sve_predtest1(t, d, g);
     do_pred_flags(t);
-    tcg_temp_free_i32(t);
 }
 
 static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
@@ -521,11 +512,8 @@ static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
     tcg_gen_addi_ptr(gptr, cpu_env, gofs);
 
     gen_helper_sve_predtest(t, dptr, gptr, tcg_constant_i32(words));
-    tcg_temp_free_ptr(dptr);
-    tcg_temp_free_ptr(gptr);
 
     do_pred_flags(t);
-    tcg_temp_free_i32(t);
 }
 
 /* For each element size, the bits within a predicate word that are active.  */
@@ -561,7 +549,6 @@ static void gen_xar8_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
     tcg_gen_andi_i64(d, d, mask);
     tcg_gen_andi_i64(t, t, ~mask);
     tcg_gen_or_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_xar16_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
@@ -575,7 +562,6 @@ static void gen_xar16_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
     tcg_gen_andi_i64(d, d, mask);
     tcg_gen_andi_i64(t, t, ~mask);
     tcg_gen_or_i64(d, d, t);
-    tcg_temp_free_i64(t);
 }
 
 static void gen_xar_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, int32_t sh)
@@ -984,11 +970,8 @@ static bool do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
     tcg_gen_addi_ptr(t_zn, cpu_env, vec_full_reg_offset(s, a->rn));
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->pg));
     fn(temp, t_zn, t_pg, desc);
-    tcg_temp_free_ptr(t_zn);
-    tcg_temp_free_ptr(t_pg);
 
     write_fp_dreg(s, a->rd, temp);
-    tcg_temp_free_i64(temp);
     return true;
 }
 
@@ -1253,11 +1236,7 @@ static bool do_index(DisasContext *s, int esz, int rd,
         tcg_gen_extrl_i64_i32(s32, start);
         tcg_gen_extrl_i64_i32(i32, incr);
         fns[esz](t_zd, s32, i32, desc);
-
-        tcg_temp_free_i32(s32);
-        tcg_temp_free_i32(i32);
     }
-    tcg_temp_free_ptr(t_zd);
     return true;
 }
 
@@ -1419,11 +1398,6 @@ static bool do_pppp_flags(DisasContext *s, arg_rprr_s *a,
         tcg_gen_st_i64(pd, cpu_env, dofs);
 
         do_predtest1(pd, pg);
-
-        tcg_temp_free_i64(pd);
-        tcg_temp_free_i64(pn);
-        tcg_temp_free_i64(pm);
-        tcg_temp_free_i64(pg);
     } else {
         /* The operation and flags generation is large.  The computation
          * of the flags depends on the original contents of the guarding
@@ -1694,9 +1668,6 @@ static bool trans_PTEST(DisasContext *s, arg_PTEST *a)
             tcg_gen_ld_i64(pn, cpu_env, nofs);
             tcg_gen_ld_i64(pg, cpu_env, gofs);
             do_predtest1(pn, pg);
-
-            tcg_temp_free_i64(pn);
-            tcg_temp_free_i64(pg);
         } else {
             do_predtest(s, nofs, gofs, words);
         }
@@ -1810,8 +1781,6 @@ static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
     }
 
  done:
-    tcg_temp_free_i64(t);
-
     /* PTRUES */
     if (setflag) {
         tcg_gen_movi_i32(cpu_NF, -(word != 0));
@@ -1869,11 +1838,8 @@ static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
     t = tcg_temp_new_i32();
 
     gen_fn(t, t_pd, t_pg, tcg_constant_i32(desc));
-    tcg_temp_free_ptr(t_pd);
-    tcg_temp_free_ptr(t_pg);
 
     do_pred_flags(t);
-    tcg_temp_free_i32(t);
     return true;
 }
 
@@ -1950,9 +1916,7 @@ static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
             t2 = tcg_constant_i64(0);
             tcg_gen_movcond_i64(TCG_COND_LT, reg, t0, t2, t1, reg);
         }
-        tcg_temp_free_i64(t1);
     }
-    tcg_temp_free_i64(t0);
 }
 
 /* Similarly with a vector and a scalar operand.  */
@@ -1982,7 +1946,6 @@ static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
         } else {
             gen_helper_sve_sqaddi_b(dptr, nptr, t32, desc);
         }
-        tcg_temp_free_i32(t32);
         break;
 
     case MO_16:
@@ -1996,7 +1959,6 @@ static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
         } else {
             gen_helper_sve_sqaddi_h(dptr, nptr, t32, desc);
         }
-        tcg_temp_free_i32(t32);
         break;
 
     case MO_32:
@@ -2011,7 +1973,6 @@ static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
         } else {
             gen_helper_sve_sqaddi_s(dptr, nptr, t64, desc);
         }
-        tcg_temp_free_i64(t64);
         break;
 
     case MO_64:
@@ -2025,7 +1986,6 @@ static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
             t64 = tcg_temp_new_i64();
             tcg_gen_neg_i64(t64, val);
             gen_helper_sve_sqaddi_d(dptr, nptr, t64, desc);
-            tcg_temp_free_i64(t64);
         } else {
             gen_helper_sve_sqaddi_d(dptr, nptr, val, desc);
         }
@@ -2034,9 +1994,6 @@ static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
     default:
         g_assert_not_reached();
     }
-
-    tcg_temp_free_ptr(dptr);
-    tcg_temp_free_ptr(nptr);
 }
 
 static bool trans_CNT_r(DisasContext *s, arg_CNT_r *a)
@@ -2222,10 +2179,6 @@ static void do_cpy_m(DisasContext *s, int esz, int rd, int rn, int pg,
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
 
     fns[esz](t_zd, t_zn, t_pg, val, desc);
-
-    tcg_temp_free_ptr(t_zd);
-    tcg_temp_free_ptr(t_zn);
-    tcg_temp_free_ptr(t_pg);
 }
 
 static bool trans_FCPY(DisasContext *s, arg_FCPY *a)
@@ -2372,9 +2325,6 @@ static void do_insr_i64(DisasContext *s, arg_rrr_esz *a, TCGv_i64 val)
     tcg_gen_addi_ptr(t_zn, cpu_env, vec_full_reg_offset(s, a->rn));
 
     fns[a->esz](t_zd, t_zn, val, desc);
-
-    tcg_temp_free_ptr(t_zd);
-    tcg_temp_free_ptr(t_zn);
 }
 
 static bool trans_INSR_f(DisasContext *s, arg_rrr_esz *a)
@@ -2386,7 +2336,6 @@ static bool trans_INSR_f(DisasContext *s, arg_rrr_esz *a)
         TCGv_i64 t = tcg_temp_new_i64();
         tcg_gen_ld_i64(t, cpu_env, vec_reg_offset(s, a->rm, 0, MO_64));
         do_insr_i64(s, a, t);
-        tcg_temp_free_i64(t);
     }
     return true;
 }
@@ -2476,10 +2425,6 @@ static bool do_perm_pred3(DisasContext *s, arg_rrr_esz *a, bool high_odd,
     tcg_gen_addi_ptr(t_m, cpu_env, pred_full_reg_offset(s, a->rm));
 
     fn(t_d, t_n, t_m, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(t_d);
-    tcg_temp_free_ptr(t_n);
-    tcg_temp_free_ptr(t_m);
     return true;
 }
 
@@ -2503,9 +2448,6 @@ static bool do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
     desc = FIELD_DP32(desc, PREDDESC, DATA, high_odd);
 
     fn(t_d, t_n, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(t_d);
-    tcg_temp_free_ptr(t_n);
     return true;
 }
 
@@ -2597,8 +2539,6 @@ static void find_last_active(DisasContext *s, TCGv_i32 ret, int esz, int pg)
     tcg_gen_addi_ptr(t_p, cpu_env, pred_full_reg_offset(s, pg));
 
     gen_helper_sve_last_active_element(ret, t_p, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(t_p);
 }
 
 /* Increment LAST to the offset of the next element in the vector,
@@ -2661,7 +2601,6 @@ static TCGv_i64 load_last_active(DisasContext *s, TCGv_i32 last,
                                  int rm, int esz)
 {
     TCGv_ptr p = tcg_temp_new_ptr();
-    TCGv_i64 r;
 
     /* Convert offset into vector into offset into ENV.
      * The final adjustment for the vector register base
@@ -2676,10 +2615,7 @@ static TCGv_i64 load_last_active(DisasContext *s, TCGv_i32 last,
     tcg_gen_ext_i32_ptr(p, last);
     tcg_gen_add_ptr(p, p, cpu_env);
 
-    r = load_esz(p, vec_full_reg_offset(s, rm), esz);
-    tcg_temp_free_ptr(p);
-
-    return r;
+    return load_esz(p, vec_full_reg_offset(s, rm), esz);
 }
 
 /* Compute CLAST for a Zreg.  */
@@ -2709,11 +2645,9 @@ static bool do_clast_vector(DisasContext *s, arg_rprr_esz *a, bool before)
     }
 
     ele = load_last_active(s, last, a->rm, esz);
-    tcg_temp_free_i32(last);
 
     vsz = vec_full_reg_size(s);
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd), vsz, vsz, ele);
-    tcg_temp_free_i64(ele);
 
     /* If this insn used MOVPRFX, we may need a second move.  */
     if (a->rd != a->rn) {
@@ -2756,13 +2690,9 @@ static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
      * a conditional move.
      */
     ele = load_last_active(s, last, rm, esz);
-    tcg_temp_free_i32(last);
 
     tcg_gen_movcond_i64(TCG_COND_GE, reg_val, cmp, tcg_constant_i64(0),
                         ele, reg_val);
-
-    tcg_temp_free_i64(cmp);
-    tcg_temp_free_i64(ele);
 }
 
 /* Compute CLAST for a Vreg.  */
@@ -2775,7 +2705,6 @@ static bool do_clast_fp(DisasContext *s, arg_rpr_esz *a, bool before)
 
         do_clast_scalar(s, esz, a->pg, a->rn, before, reg);
         write_fp_dreg(s, a->rd, reg);
-        tcg_temp_free_i64(reg);
     }
     return true;
 }
@@ -2821,7 +2750,6 @@ static TCGv_i64 do_last_scalar(DisasContext *s, int esz,
                                int pg, int rm, bool before)
 {
     TCGv_i32 last = tcg_temp_new_i32();
-    TCGv_i64 ret;
 
     find_last_active(s, last, esz, pg);
     if (before) {
@@ -2830,9 +2758,7 @@ static TCGv_i64 do_last_scalar(DisasContext *s, int esz,
         incr_last_active(s, last, esz);
     }
 
-    ret = load_last_active(s, last, rm, esz);
-    tcg_temp_free_i32(last);
-    return ret;
+    return load_last_active(s, last, rm, esz);
 }
 
 /* Compute LAST for a Vreg.  */
@@ -2841,7 +2767,6 @@ static bool do_last_fp(DisasContext *s, arg_rpr_esz *a, bool before)
     if (sve_access_check(s)) {
         TCGv_i64 val = do_last_scalar(s, a->esz, a->pg, a->rn, before);
         write_fp_dreg(s, a->rd, val);
-        tcg_temp_free_i64(val);
     }
     return true;
 }
@@ -2855,7 +2780,6 @@ static bool do_last_general(DisasContext *s, arg_rpr_esz *a, bool before)
     if (sve_access_check(s)) {
         TCGv_i64 val = do_last_scalar(s, a->esz, a->pg, a->rn, before);
         tcg_gen_mov_i64(cpu_reg(s, a->rd), val);
-        tcg_temp_free_i64(val);
     }
     return true;
 }
@@ -2883,7 +2807,6 @@ static bool trans_CPY_m_v(DisasContext *s, arg_rpr_esz *a)
         int ofs = vec_reg_offset(s, a->rn, 0, a->esz);
         TCGv_i64 t = load_esz(cpu_env, ofs, a->esz);
         do_cpy_m(s, a->esz, a->rd, a->rd, a->pg, t);
-        tcg_temp_free_i64(t);
     }
     return true;
 }
@@ -2942,14 +2865,7 @@ static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
 
     gen_fn(t, pd, zn, zm, pg, tcg_constant_i32(simd_desc(vsz, vsz, 0)));
 
-    tcg_temp_free_ptr(pd);
-    tcg_temp_free_ptr(zn);
-    tcg_temp_free_ptr(zm);
-    tcg_temp_free_ptr(pg);
-
     do_pred_flags(t);
-
-    tcg_temp_free_i32(t);
     return true;
 }
 
@@ -3021,13 +2937,7 @@ static bool do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
 
     gen_fn(t, pd, zn, pg, tcg_constant_i32(simd_desc(vsz, vsz, a->imm)));
 
-    tcg_temp_free_ptr(pd);
-    tcg_temp_free_ptr(zn);
-    tcg_temp_free_ptr(pg);
-
     do_pred_flags(t);
-
-    tcg_temp_free_i32(t);
     return true;
 }
 
@@ -3081,14 +2991,9 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
         TCGv_i32 t = tcg_temp_new_i32();
         fn_s(t, d, n, m, g, desc);
         do_pred_flags(t);
-        tcg_temp_free_i32(t);
     } else {
         fn(d, n, m, g, desc);
     }
-    tcg_temp_free_ptr(d);
-    tcg_temp_free_ptr(n);
-    tcg_temp_free_ptr(m);
-    tcg_temp_free_ptr(g);
     return true;
 }
 
@@ -3115,13 +3020,9 @@ static bool do_brk2(DisasContext *s, arg_rpr_s *a,
         TCGv_i32 t = tcg_temp_new_i32();
         fn_s(t, d, n, g, desc);
         do_pred_flags(t);
-        tcg_temp_free_i32(t);
     } else {
         fn(d, n, g, desc);
     }
-    tcg_temp_free_ptr(d);
-    tcg_temp_free_ptr(n);
-    tcg_temp_free_ptr(g);
     return true;
 }
 
@@ -3159,7 +3060,6 @@ static void do_cntp(DisasContext *s, TCGv_i64 val, int esz, int pn, int pg)
             TCGv_i64 g = tcg_temp_new_i64();
             tcg_gen_ld_i64(g, cpu_env, pred_full_reg_offset(s, pg));
             tcg_gen_and_i64(val, val, g);
-            tcg_temp_free_i64(g);
         }
 
         /* Reduce the pred_esz_masks value simply to reduce the
@@ -3181,8 +3081,6 @@ static void do_cntp(DisasContext *s, TCGv_i64 val, int esz, int pn, int pg)
         tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
 
         gen_helper_sve_cntp(val, t_pn, t_pg, tcg_constant_i32(desc));
-        tcg_temp_free_ptr(t_pn);
-        tcg_temp_free_ptr(t_pg);
     }
 }
 
@@ -3212,7 +3110,6 @@ static bool trans_INCDECP_r(DisasContext *s, arg_incdec_pred *a)
         } else {
             tcg_gen_add_i64(reg, reg, val);
         }
-        tcg_temp_free_i64(val);
     }
     return true;
 }
@@ -3297,7 +3194,6 @@ static bool trans_CTERM(DisasContext *s, arg_CTERM *a)
 
     tcg_gen_setcond_i64(cond, cmp, rn, rm);
     tcg_gen_extrl_i64_i32(cpu_NF, cmp);
-    tcg_temp_free_i64(cmp);
 
     /* VF = !NF & !CF.  */
     tcg_gen_xori_i32(cpu_VF, cpu_NF, 1);
@@ -3394,12 +3290,10 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     /* Set the count to zero if the condition is false.  */
     tcg_gen_movi_i64(t1, 0);
     tcg_gen_movcond_i64(cond, t0, op0, op1, t0, t1);
-    tcg_temp_free_i64(t1);
 
     /* Since we're bounded, pass as a 32-bit type.  */
     t2 = tcg_temp_new_i32();
     tcg_gen_extrl_i64_i32(t2, t0);
-    tcg_temp_free_i64(t0);
 
     /* Scale elements to bits.  */
     tcg_gen_shli_i32(t2, t2, a->esz);
@@ -3416,9 +3310,6 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
         gen_helper_sve_whileg(t2, ptr, t2, tcg_constant_i32(desc));
     }
     do_pred_flags(t2);
-
-    tcg_temp_free_ptr(ptr);
-    tcg_temp_free_i32(t2);
     return true;
 }
 
@@ -3450,7 +3341,6 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
         tcg_gen_sub_i64(diff, op0, op1);
         tcg_gen_sub_i64(t1, op1, op0);
         tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, diff, t1);
-        tcg_temp_free_i64(t1);
         /* Round down to a multiple of ESIZE.  */
         tcg_gen_andi_i64(diff, diff, -1 << a->esz);
         /* If op1 == op0, diff == 0, and the condition is always true. */
@@ -3470,7 +3360,6 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
     /* Since we're bounded, pass as a 32-bit type.  */
     t2 = tcg_temp_new_i32();
     tcg_gen_extrl_i64_i32(t2, diff);
-    tcg_temp_free_i64(diff);
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
@@ -3480,9 +3369,6 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 
     gen_helper_sve_whilel(t2, ptr, t2, tcg_constant_i32(desc));
     do_pred_flags(t2);
-
-    tcg_temp_free_ptr(ptr);
-    tcg_temp_free_i32(t2);
     return true;
 }
 
@@ -3814,12 +3700,8 @@ static bool do_reduce(DisasContext *s, arg_rpr_esz *a,
     status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
     fn(temp, t_zn, t_pg, status, t_desc);
-    tcg_temp_free_ptr(t_zn);
-    tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_ptr(status);
 
     write_fp_dreg(s, a->rd, temp);
-    tcg_temp_free_i64(temp);
     return true;
 }
 
@@ -3873,7 +3755,6 @@ static bool do_ppz_fp(DisasContext *s, arg_rpr_esz *a,
                            vec_full_reg_offset(s, a->rn),
                            pred_full_reg_offset(s, a->pg),
                            status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
     }
     return true;
 }
@@ -3942,12 +3823,7 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
 
     fns[a->esz - 1](t_val, t_val, t_rm, t_pg, t_fpst, t_desc);
 
-    tcg_temp_free_ptr(t_fpst);
-    tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_ptr(t_rm);
-
     write_fp_dreg(s, a->rd, t_val);
-    tcg_temp_free_i64(t_val);
     return true;
 }
 
@@ -4020,11 +3896,6 @@ static void do_fp_scalar(DisasContext *s, int zd, int zn, int pg, bool is_fp16,
     status = fpstatus_ptr(is_fp16 ? FPST_FPCR_F16 : FPST_FPCR);
     desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     fn(t_zd, t_zn, t_pg, scalar, status, desc);
-
-    tcg_temp_free_ptr(status);
-    tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_ptr(t_zn);
-    tcg_temp_free_ptr(t_zd);
 }
 
 static bool do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
@@ -4080,7 +3951,6 @@ static bool do_fp_cmp(DisasContext *s, arg_rprr_esz *a,
                            vec_full_reg_offset(s, a->rm),
                            pred_full_reg_offset(s, a->pg),
                            status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
     }
     return true;
 }
@@ -4237,8 +4107,6 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
                        status, vsz, vsz, 0, fn);
 
     gen_helper_set_rmode(tmode, tmode, status);
-    tcg_temp_free_i32(tmode);
-    tcg_temp_free_ptr(status);
     return true;
 }
 
@@ -4321,7 +4189,6 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
     clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
-    tcg_temp_free_i64(dirty_addr);
 
     /*
      * Note that unpredicated load/store of vector/predicate registers
@@ -4339,7 +4206,6 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
             tcg_gen_st_i64(t0, base, vofs + i);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
-        tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_ptr(0);
@@ -4354,11 +4220,8 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         tcg_gen_add_ptr(tp, base, i);
         tcg_gen_addi_ptr(i, i, 8);
         tcg_gen_st_i64(t0, tp, vofs);
-        tcg_temp_free_ptr(tp);
-        tcg_temp_free_i64(t0);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
-        tcg_temp_free_ptr(i);
     }
 
     /*
@@ -4381,14 +4244,12 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
             tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_qemu_ld_i64(t1, clean_addr, midx, MO_LEUW);
             tcg_gen_deposit_i64(t0, t0, t1, 32, 32);
-            tcg_temp_free_i64(t1);
             break;
 
         default:
             g_assert_not_reached();
         }
         tcg_gen_st_i64(t0, base, vofs + len_align);
-        tcg_temp_free_i64(t0);
     }
 }
 
@@ -4405,7 +4266,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
     clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
-    tcg_temp_free_i64(dirty_addr);
 
     /* Note that unpredicated load/store of vector/predicate registers
      * are defined as a stream of bytes, which equates to little-endian
@@ -4424,7 +4284,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
             tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ);
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
         }
-        tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_ptr(0);
@@ -4436,14 +4295,11 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         tcg_gen_add_ptr(tp, base, i);
         tcg_gen_ld_i64(t0, tp, vofs);
         tcg_gen_addi_ptr(i, i, 8);
-        tcg_temp_free_ptr(tp);
 
         tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ);
         tcg_gen_addi_i64(clean_addr, clean_addr, 8);
-        tcg_temp_free_i64(t0);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
-        tcg_temp_free_ptr(i);
     }
 
     /* Predicate register stores can be any multiple of 2.  */
@@ -4469,7 +4325,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         default:
             g_assert_not_reached();
         }
-        tcg_temp_free_i64(t0);
     }
 }
 
@@ -4578,8 +4433,6 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
 
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
     fn(cpu_env, t_pg, addr, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(t_pg);
 }
 
 /* Indexed by [mte][be][dtype][nreg] */
@@ -4977,7 +4830,6 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 
         poff = offsetof(CPUARMState, vfp.preg_tmp);
         tcg_gen_st_i64(tmp, cpu_env, poff);
-        tcg_temp_free_i64(tmp);
     }
 
     t_pg = tcg_temp_new_ptr();
@@ -4987,8 +4839,6 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
         = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
     fn(cpu_env, t_pg, addr, tcg_constant_i32(simd_desc(16, 16, zt)));
 
-    tcg_temp_free_ptr(t_pg);
-
     /* Replicate that first quadword.  */
     if (vsz > 16) {
         int doff = vec_full_reg_offset(s, zt);
@@ -5059,7 +4909,6 @@ static void do_ldro(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 
         poff = offsetof(CPUARMState, vfp.preg_tmp);
         tcg_gen_st_i64(tmp, cpu_env, poff);
-        tcg_temp_free_i64(tmp);
     }
 
     t_pg = tcg_temp_new_ptr();
@@ -5069,8 +4918,6 @@ static void do_ldro(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
         = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
     fn(cpu_env, t_pg, addr, tcg_constant_i32(simd_desc(32, 32, zt)));
 
-    tcg_temp_free_ptr(t_pg);
-
     /*
      * Replicate that first octaword.
      * The replication happens in units of 32; if the full vector size
@@ -5148,12 +4995,10 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
         tcg_gen_ld_i64(temp, cpu_env, pred_full_reg_offset(s, a->pg));
         tcg_gen_andi_i64(temp, temp, pred_esz_masks[esz] & psz_mask);
         tcg_gen_brcondi_i64(TCG_COND_EQ, temp, 0, over);
-        tcg_temp_free_i64(temp);
     } else {
         TCGv_i32 t32 = tcg_temp_new_i32();
         find_last_active(s, t32, esz, a->pg);
         tcg_gen_brcondi_i32(TCG_COND_LT, t32, 0, over);
-        tcg_temp_free_i32(t32);
     }
 
     /* Load the data.  */
@@ -5167,7 +5012,6 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     /* Broadcast to *all* elements.  */
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
                          vsz, vsz, temp);
-    tcg_temp_free_i64(temp);
 
     /* Zero the inactive elements.  */
     gen_set_label(over);
@@ -5363,10 +5207,6 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
     tcg_gen_addi_ptr(t_zm, cpu_env, vec_full_reg_offset(s, zm));
     tcg_gen_addi_ptr(t_zt, cpu_env, vec_full_reg_offset(s, zt));
     fn(cpu_env, t_zt, t_pg, t_zm, scalar, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(t_zt);
-    tcg_temp_free_ptr(t_zm);
-    tcg_temp_free_ptr(t_pg);
 }
 
 /* Indexed by [mte][be][ff][xs][u][msz].  */
@@ -6301,7 +6141,6 @@ static void gen_sshll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
             TCGv_vec t = tcg_temp_new_vec_matching(d);
             tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(halfbits, halfbits));
             tcg_gen_and_vec(vece, d, n, t);
-            tcg_temp_free_vec(t);
         } else {
             tcg_gen_sari_vec(vece, d, n, halfbits);
             tcg_gen_shli_vec(vece, d, d, shl);
@@ -6359,7 +6198,6 @@ static void gen_ushll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
             TCGv_vec t = tcg_temp_new_vec_matching(d);
             tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(halfbits, halfbits));
             tcg_gen_and_vec(vece, d, n, t);
-            tcg_temp_free_vec(t);
         } else {
             tcg_gen_shri_vec(vece, d, n, halfbits);
             tcg_gen_shli_vec(vece, d, d, shl);
@@ -6369,7 +6207,6 @@ static void gen_ushll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
             TCGv_vec t = tcg_temp_new_vec_matching(d);
             tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
             tcg_gen_and_vec(vece, d, n, t);
-            tcg_temp_free_vec(t);
         } else {
             tcg_gen_shli_vec(vece, d, n, halfbits);
             tcg_gen_shri_vec(vece, d, d, halfbits - shl);
@@ -6549,7 +6386,6 @@ static void gen_sqxtnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_gen_smin_vec(vece, d, d, t);
     tcg_gen_dupi_vec(vece, t, mask);
     tcg_gen_and_vec(vece, d, d, t);
-    tcg_temp_free_vec(t);
 }
 
 static const GVecGen2 sqxtnb_ops[3] = {
@@ -6583,7 +6419,6 @@ static void gen_sqxtnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_gen_shli_vec(vece, n, n, halfbits);
     tcg_gen_dupi_vec(vece, t, mask);
     tcg_gen_bitsel_vec(vece, d, t, d, n);
-    tcg_temp_free_vec(t);
 }
 
 static const GVecGen2 sqxtnt_ops[3] = {
@@ -6617,7 +6452,6 @@ static void gen_uqxtnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
 
     tcg_gen_dupi_vec(vece, t, max);
     tcg_gen_umin_vec(vece, d, n, t);
-    tcg_temp_free_vec(t);
 }
 
 static const GVecGen2 uqxtnb_ops[3] = {
@@ -6646,7 +6480,6 @@ static void gen_uqxtnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_gen_umin_vec(vece, n, n, t);
     tcg_gen_shli_vec(vece, n, n, halfbits);
     tcg_gen_bitsel_vec(vece, d, t, d, n);
-    tcg_temp_free_vec(t);
 }
 
 static const GVecGen2 uqxtnt_ops[3] = {
@@ -6682,7 +6515,6 @@ static void gen_sqxtunb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_gen_smax_vec(vece, d, n, t);
     tcg_gen_dupi_vec(vece, t, max);
     tcg_gen_umin_vec(vece, d, d, t);
-    tcg_temp_free_vec(t);
 }
 
 static const GVecGen2 sqxtunb_ops[3] = {
@@ -6713,7 +6545,6 @@ static void gen_sqxtunt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
     tcg_gen_umin_vec(vece, n, n, t);
     tcg_gen_shli_vec(vece, n, n, halfbits);
     tcg_gen_bitsel_vec(vece, d, t, d, n);
-    tcg_temp_free_vec(t);
 }
 
 static const GVecGen2 sqxtunt_ops[3] = {
@@ -6784,7 +6615,6 @@ static void gen_shrnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t shr)
     tcg_gen_shri_vec(vece, n, n, shr);
     tcg_gen_dupi_vec(vece, t, mask);
     tcg_gen_and_vec(vece, d, n, t);
-    tcg_temp_free_vec(t);
 }
 
 static const TCGOpcode shrnb_vec_list[] = { INDEX_op_shri_vec, 0 };
@@ -6843,7 +6673,6 @@ static void gen_shrnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t shr)
     tcg_gen_shli_vec(vece, n, n, halfbits - shr);
     tcg_gen_dupi_vec(vece, t, mask);
     tcg_gen_bitsel_vec(vece, d, t, d, n);
-    tcg_temp_free_vec(t);
 }
 
 static const TCGOpcode shrnt_vec_list[] = { INDEX_op_shli_vec, 0 };
@@ -6894,7 +6723,6 @@ static void gen_sqshrunb_vec(unsigned vece, TCGv_vec d,
     tcg_gen_smax_vec(vece, n, n, t);
     tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
     tcg_gen_umin_vec(vece, d, n, t);
-    tcg_temp_free_vec(t);
 }
 
 static const TCGOpcode sqshrunb_vec_list[] = {
@@ -6929,7 +6757,6 @@ static void gen_sqshrunt_vec(unsigned vece, TCGv_vec d,
     tcg_gen_umin_vec(vece, n, n, t);
     tcg_gen_shli_vec(vece, n, n, halfbits);
     tcg_gen_bitsel_vec(vece, d, t, d, n);
-    tcg_temp_free_vec(t);
 }
 
 static const TCGOpcode sqshrunt_vec_list[] = {
@@ -6984,7 +6811,6 @@ static void gen_sqshrnb_vec(unsigned vece, TCGv_vec d,
     tcg_gen_smin_vec(vece, n, n, t);
     tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
     tcg_gen_and_vec(vece, d, n, t);
-    tcg_temp_free_vec(t);
 }
 
 static const TCGOpcode sqshrnb_vec_list[] = {
@@ -7022,7 +6848,6 @@ static void gen_sqshrnt_vec(unsigned vece, TCGv_vec d,
     tcg_gen_shli_vec(vece, n, n, halfbits);
     tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
     tcg_gen_bitsel_vec(vece, d, t, d, n);
-    tcg_temp_free_vec(t);
 }
 
 static const TCGOpcode sqshrnt_vec_list[] = {
@@ -7071,7 +6896,6 @@ static void gen_uqshrnb_vec(unsigned vece, TCGv_vec d,
     tcg_gen_shri_vec(vece, n, n, shr);
     tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
     tcg_gen_umin_vec(vece, d, n, t);
-    tcg_temp_free_vec(t);
 }
 
 static const TCGOpcode uqshrnb_vec_list[] = {
@@ -7104,7 +6928,6 @@ static void gen_uqshrnt_vec(unsigned vece, TCGv_vec d,
     tcg_gen_umin_vec(vece, n, n, t);
     tcg_gen_shli_vec(vece, n, n, halfbits);
     tcg_gen_bitsel_vec(vece, d, t, d, n);
-    tcg_temp_free_vec(t);
 }
 
 static const TCGOpcode uqshrnt_vec_list[] = {
@@ -7440,11 +7263,6 @@ static bool trans_PSEL(DisasContext *s, arg_psel *a)
     /* Apply to either copy the source, or write zeros. */
     tcg_gen_gvec_ands(MO_64, pred_full_reg_offset(s, a->pd),
                       pred_full_reg_offset(s, a->pn), tmp, pl, pl);
-
-    tcg_temp_free_i64(tmp);
-    tcg_temp_free_i64(dbit);
-    tcg_temp_free_i64(didx);
-    tcg_temp_free_ptr(ptr);
     return true;
 }
 
-- 
2.34.1


