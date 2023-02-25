Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqf0-00076Y-FV
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqem-0006CC-0T
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:52 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqej-0002Db-By
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:51 -0500
Received: by mail-pj1-x1042.google.com with SMTP id kb15so1441582pjb.1
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKM2go0UqGbQo3c+LK2J6BohhY4B1W3gSGwXNmUfBI0=;
 b=I275+Vt/7vU6p+82WTACltBd6+p0PuFpFGbU0LMOcMafbfJed7vkL9sKOE5wxLUV+L
 eWixpyjB4FoBxOHD6lRbkitTha+M3h+ZxdNNVXn36Mm0jY5ogRBHhSxKpnjlKC3Pnc90
 pY7fJ0htlgNv+t6orUKgsO48nph3Z6IkcwhQRMhHJeKXCyf/AGa1Pfo3PEiSb5s1w7b+
 vwW5F3PCd8Jv097yqv6F6VWI8NZsZ+m6MPxUXKTIm76hyFElXI8udZWDccAZl3MFkJA0
 REHjr2HTb8Hqf31c+sldD8E3ewIW5psuOvZDc++1L/S/lfdkmNf9M0kBOwcIUhfAqsos
 DW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tKM2go0UqGbQo3c+LK2J6BohhY4B1W3gSGwXNmUfBI0=;
 b=IlCCvIL1DL+Ew8138lRkFd8DbRIV8sl4FWbhGbDe+vrV67qT+rrgLVFpn1RoFF/e2U
 BzvUdYqOKuPa1aJo88PWsJ5z3ZenY4sKdD5l8HxIwjs+9Q4tKCIReWMXuv7jKwniJTNQ
 5B/PKQaL9xGSYnhBNfrR+Efdfr4v9su4t0z2frC2Bj/LL86cctKfNJBeDEqPb/bLHrw5
 RHIkQuYbdvoNQC6fTl3tYtfFuumJwa+Q3JU5uPlsO1YM58vmM57Zu8KmYymp4qo9e+A7
 aHm+vUlWdfklh85FNlbP3sK2+NNbs21BIt0YQQegIpEI87wSu/Ksr6oT7V+EThw7T+lN
 0gfA==
X-Gm-Message-State: AO0yUKWnNzWexNUmY5bkJUFfTSim6BPwmqzCApTLnqwuNPGgyfSP9mT6
 DV1cORtL8HQnjyoDgiiuetwucA==
X-Google-Smtp-Source: AK7set8kp8P3beYfaufhrlpZewS6IxUrqlp51MrDxyQGGPpeTrs8gCnzGXrkgvEUBYizhoHdGgvPjQ==
X-Received: by 2002:a17:902:f690:b0:19a:80e6:2a1d with SMTP id
 l16-20020a170902f69000b0019a80e62a1dmr21759719plg.41.1677316547817; 
 Sat, 25 Feb 2023 01:15:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 29/76] target/hppa: Drop tcg_temp_free
Date: Fri, 24 Feb 2023 23:13:40 -1000
Message-Id: <20230225091427.1817156-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Sat, 25 Feb 2023 09:15:53 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 93 +----------------------------------------
 1 file changed, 1 insertion(+), 92 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index cee960949f..cb4fd1fd62 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -35,12 +35,10 @@
 #undef TCGv
 #undef tcg_temp_new
 #undef tcg_global_mem_new
-#undef tcg_temp_free
 
 #if TARGET_LONG_BITS == 64
 #define TCGv_tl              TCGv_i64
 #define tcg_temp_new_tl      tcg_temp_new_i64
-#define tcg_temp_free_tl     tcg_temp_free_i64
 #if TARGET_REGISTER_BITS == 64
 #define tcg_gen_extu_reg_tl  tcg_gen_mov_i64
 #else
@@ -49,7 +47,6 @@
 #else
 #define TCGv_tl              TCGv_i32
 #define tcg_temp_new_tl      tcg_temp_new_i32
-#define tcg_temp_free_tl     tcg_temp_free_i32
 #define tcg_gen_extu_reg_tl  tcg_gen_mov_i32
 #endif
 
@@ -58,7 +55,6 @@
 
 #define tcg_temp_new         tcg_temp_new_i64
 #define tcg_global_mem_new   tcg_global_mem_new_i64
-#define tcg_temp_free        tcg_temp_free_i64
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i64
 #define tcg_gen_mov_reg      tcg_gen_mov_i64
@@ -153,7 +149,6 @@
 #define TCGv_reg             TCGv_i32
 #define tcg_temp_new         tcg_temp_new_i32
 #define tcg_global_mem_new   tcg_global_mem_new_i32
-#define tcg_temp_free        tcg_temp_free_i32
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i32
 #define tcg_gen_mov_reg      tcg_gen_mov_i32
@@ -488,10 +483,6 @@ static void cond_free(DisasCond *cond)
 {
     switch (cond->c) {
     default:
-        if (cond->a0 != cpu_psw_n) {
-            tcg_temp_free(cond->a0);
-        }
-        tcg_temp_free(cond->a1);
         cond->a0 = NULL;
         cond->a1 = NULL;
         /* fallthru */
@@ -1021,7 +1012,6 @@ static DisasCond do_unit_cond(unsigned cf, TCGv_reg res,
         tcg_gen_and_reg(tmp, in1, in2);
         tcg_gen_andc_reg(cb, cb, res);
         tcg_gen_or_reg(cb, cb, tmp);
-        tcg_temp_free(tmp);
     }
 
     switch (cf >> 1) {
@@ -1040,7 +1030,6 @@ static DisasCond do_unit_cond(unsigned cf, TCGv_reg res,
         tcg_gen_andc_reg(tmp, tmp, res);
         tcg_gen_andi_reg(tmp, tmp, 0x80808080u);
         cond = cond_make_0(TCG_COND_NE, tmp);
-        tcg_temp_free(tmp);
         break;
 
     case 3: /* SHZ / NHZ */
@@ -1049,7 +1038,6 @@ static DisasCond do_unit_cond(unsigned cf, TCGv_reg res,
         tcg_gen_andc_reg(tmp, tmp, res);
         tcg_gen_andi_reg(tmp, tmp, 0x80008000u);
         cond = cond_make_0(TCG_COND_NE, tmp);
-        tcg_temp_free(tmp);
         break;
 
     case 4: /* SDC / NDC */
@@ -1070,9 +1058,6 @@ static DisasCond do_unit_cond(unsigned cf, TCGv_reg res,
     default:
         g_assert_not_reached();
     }
-    if (cf & 8) {
-        tcg_temp_free(cb);
-    }
     if (cf & 1) {
         cond.c = tcg_invert_cond(cond.c);
     }
@@ -1090,7 +1075,6 @@ static TCGv_reg do_add_sv(DisasContext *ctx, TCGv_reg res,
     tcg_gen_xor_reg(sv, res, in1);
     tcg_gen_xor_reg(tmp, in1, in2);
     tcg_gen_andc_reg(sv, sv, tmp);
-    tcg_temp_free(tmp);
 
     return sv;
 }
@@ -1105,7 +1089,6 @@ static TCGv_reg do_sub_sv(DisasContext *ctx, TCGv_reg res,
     tcg_gen_xor_reg(sv, res, in1);
     tcg_gen_xor_reg(tmp, in1, in2);
     tcg_gen_and_reg(sv, sv, tmp);
-    tcg_temp_free(tmp);
 
     return sv;
 }
@@ -1163,7 +1146,6 @@ static void do_add(DisasContext *ctx, unsigned rt, TCGv_reg in1,
         tmp = tcg_temp_new();
         tcg_gen_setcond_reg(cond.c, tmp, cond.a0, cond.a1);
         gen_helper_tcond(cpu_env, tmp);
-        tcg_temp_free(tmp);
     }
 
     /* Write back the result.  */
@@ -1172,7 +1154,6 @@ static void do_add(DisasContext *ctx, unsigned rt, TCGv_reg in1,
         save_or_nullify(ctx, cpu_psw_cb_msb, cb_msb);
     }
     save_gpr(ctx, rt, dest);
-    tcg_temp_free(dest);
 
     /* Install the new nullification.  */
     cond_free(&ctx->null_cond);
@@ -1257,16 +1238,12 @@ static void do_sub(DisasContext *ctx, unsigned rt, TCGv_reg in1,
         tmp = tcg_temp_new();
         tcg_gen_setcond_reg(cond.c, tmp, cond.a0, cond.a1);
         gen_helper_tcond(cpu_env, tmp);
-        tcg_temp_free(tmp);
     }
 
     /* Write back the result.  */
     save_or_nullify(ctx, cpu_psw_cb, cb);
     save_or_nullify(ctx, cpu_psw_cb_msb, cb_msb);
     save_gpr(ctx, rt, dest);
-    tcg_temp_free(dest);
-    tcg_temp_free(cb);
-    tcg_temp_free(cb_msb);
 
     /* Install the new nullification.  */
     cond_free(&ctx->null_cond);
@@ -1321,7 +1298,6 @@ static void do_cmpclr(DisasContext *ctx, unsigned rt, TCGv_reg in1,
     /* Clear.  */
     tcg_gen_movi_reg(dest, 0);
     save_gpr(ctx, rt, dest);
-    tcg_temp_free(dest);
 
     /* Install the new nullification.  */
     cond_free(&ctx->null_cond);
@@ -1381,7 +1357,6 @@ static void do_unit(DisasContext *ctx, unsigned rt, TCGv_reg in1,
             TCGv_reg tmp = tcg_temp_new();
             tcg_gen_setcond_reg(cond.c, tmp, cond.a0, cond.a1);
             gen_helper_tcond(cpu_env, tmp);
-            tcg_temp_free(tmp);
         }
         save_gpr(ctx, rt, dest);
 
@@ -1420,11 +1395,9 @@ static TCGv_i64 space_select(DisasContext *ctx, int sp, TCGv_reg base)
     tcg_gen_shri_reg(tmp, base, TARGET_REGISTER_BITS - 5);
     tcg_gen_andi_reg(tmp, tmp, 030);
     tcg_gen_trunc_reg_ptr(ptr, tmp);
-    tcg_temp_free(tmp);
 
     tcg_gen_add_ptr(ptr, ptr, cpu_env);
     tcg_gen_ld_i64(spc, ptr, offsetof(CPUHPPAState, sr[4]));
-    tcg_temp_free_ptr(ptr);
 
     return spc;
 }
@@ -1582,7 +1555,6 @@ static bool do_floadw(DisasContext *ctx, unsigned rt, unsigned rb,
     tmp = tcg_temp_new_i32();
     do_load_32(ctx, tmp, rb, rx, scale, disp, sp, modify, MO_TEUL);
     save_frw_i32(rt, tmp);
-    tcg_temp_free_i32(tmp);
 
     if (rt == 0) {
         gen_helper_loaded_fr0(cpu_env);
@@ -1608,7 +1580,6 @@ static bool do_floadd(DisasContext *ctx, unsigned rt, unsigned rb,
     tmp = tcg_temp_new_i64();
     do_load_64(ctx, tmp, rb, rx, scale, disp, sp, modify, MO_TEUQ);
     save_frd(rt, tmp);
-    tcg_temp_free_i64(tmp);
 
     if (rt == 0) {
         gen_helper_loaded_fr0(cpu_env);
@@ -1642,7 +1613,6 @@ static bool do_fstorew(DisasContext *ctx, unsigned rt, unsigned rb,
 
     tmp = load_frw_i32(rt);
     do_store_32(ctx, tmp, rb, rx, scale, disp, sp, modify, MO_TEUL);
-    tcg_temp_free_i32(tmp);
 
     return nullify_end(ctx);
 }
@@ -1663,7 +1633,6 @@ static bool do_fstored(DisasContext *ctx, unsigned rt, unsigned rb,
 
     tmp = load_frd(rt);
     do_store_64(ctx, tmp, rb, rx, scale, disp, sp, modify, MO_TEUQ);
-    tcg_temp_free_i64(tmp);
 
     return nullify_end(ctx);
 }
@@ -1685,7 +1654,6 @@ static bool do_fop_wew(DisasContext *ctx, unsigned rt, unsigned ra,
     func(tmp, cpu_env, tmp);
 
     save_frw_i32(rt, tmp);
-    tcg_temp_free_i32(tmp);
     return nullify_end(ctx);
 }
 
@@ -1701,9 +1669,7 @@ static bool do_fop_wed(DisasContext *ctx, unsigned rt, unsigned ra,
 
     func(dst, cpu_env, src);
 
-    tcg_temp_free_i64(src);
     save_frw_i32(rt, dst);
-    tcg_temp_free_i32(dst);
     return nullify_end(ctx);
 }
 
@@ -1718,7 +1684,6 @@ static bool do_fop_ded(DisasContext *ctx, unsigned rt, unsigned ra,
     func(tmp, cpu_env, tmp);
 
     save_frd(rt, tmp);
-    tcg_temp_free_i64(tmp);
     return nullify_end(ctx);
 }
 
@@ -1734,9 +1699,7 @@ static bool do_fop_dew(DisasContext *ctx, unsigned rt, unsigned ra,
 
     func(dst, cpu_env, src);
 
-    tcg_temp_free_i32(src);
     save_frd(rt, dst);
-    tcg_temp_free_i64(dst);
     return nullify_end(ctx);
 }
 
@@ -1752,9 +1715,7 @@ static bool do_fop_weww(DisasContext *ctx, unsigned rt,
 
     func(a, cpu_env, a, b);
 
-    tcg_temp_free_i32(b);
     save_frw_i32(rt, a);
-    tcg_temp_free_i32(a);
     return nullify_end(ctx);
 }
 
@@ -1770,9 +1731,7 @@ static bool do_fop_dedd(DisasContext *ctx, unsigned rt,
 
     func(a, cpu_env, a, b);
 
-    tcg_temp_free_i64(b);
     save_frd(rt, a);
-    tcg_temp_free_i64(a);
     return nullify_end(ctx);
 }
 
@@ -2098,8 +2057,6 @@ static bool trans_mfsp(DisasContext *ctx, arg_mfsp *a)
     tcg_gen_trunc_i64_reg(t1, t0);
 
     save_gpr(ctx, rt, t1);
-    tcg_temp_free(t1);
-    tcg_temp_free_i64(t0);
 
     cond_free(&ctx->null_cond);
     return true;
@@ -2176,7 +2133,6 @@ static bool trans_mtsp(DisasContext *ctx, arg_mtsp *a)
     } else {
         tcg_gen_mov_i64(cpu_sr[rs], t64);
     }
-    tcg_temp_free_i64(t64);
 
     return nullify_end(ctx);
 }
@@ -2192,7 +2148,6 @@ static bool trans_mtctl(DisasContext *ctx, arg_mtctl *a)
         tmp = tcg_temp_new();
         tcg_gen_andi_reg(tmp, reg, TARGET_REGISTER_BITS - 1);
         save_or_nullify(ctx, cpu_sar, tmp);
-        tcg_temp_free(tmp);
 
         cond_free(&ctx->null_cond);
         return true;
@@ -2254,7 +2209,6 @@ static bool trans_mtsarcm(DisasContext *ctx, arg_mtsarcm *a)
     tcg_gen_not_reg(tmp, load_gpr(ctx, a->r));
     tcg_gen_andi_reg(tmp, tmp, TARGET_REGISTER_BITS - 1);
     save_or_nullify(ctx, cpu_sar, tmp);
-    tcg_temp_free(tmp);
 
     cond_free(&ctx->null_cond);
     return true;
@@ -2273,8 +2227,6 @@ static bool trans_ldsid(DisasContext *ctx, arg_ldsid *a)
     tcg_gen_mov_i64(t0, space_select(ctx, a->sp, load_gpr(ctx, a->b)));
     tcg_gen_shri_i64(t0, t0, 32);
     tcg_gen_trunc_i64_reg(dest, t0);
-
-    tcg_temp_free_i64(t0);
 #endif
     save_gpr(ctx, a->t, dest);
 
@@ -2437,8 +2389,6 @@ static bool trans_probe(DisasContext *ctx, arg_probe *a)
 
     gen_helper_probe(dest, cpu_env, addr, level, want);
 
-    tcg_temp_free_i32(level);
-
     save_gpr(ctx, a->t, dest);
     return nullify_end(ctx);
 }
@@ -2530,8 +2480,6 @@ static bool trans_ixtlbxf(DisasContext *ctx, arg_ixtlbxf *a)
                       : offsetof(CPUHPPAState, cr[CR_IIAOQ]));
     tcg_gen_shli_i64(stl, stl, 32);
     tcg_gen_or_tl(addr, atl, stl);
-    tcg_temp_free_tl(atl);
-    tcg_temp_free_tl(stl);
 
     reg = load_gpr(ctx, a->r);
     if (a->addr) {
@@ -2539,7 +2487,6 @@ static bool trans_ixtlbxf(DisasContext *ctx, arg_ixtlbxf *a)
     } else {
         gen_helper_itlbp(cpu_env, addr, reg);
     }
-    tcg_temp_free_tl(addr);
 
     /* Exit TB for TLB change if mmu is enabled.  */
     if (ctx->tb_flags & PSW_C) {
@@ -2568,7 +2515,6 @@ static bool trans_lpa(DisasContext *ctx, arg_ldst *a)
         save_gpr(ctx, a->b, ofs);
     }
     save_gpr(ctx, a->t, paddr);
-    tcg_temp_free(paddr);
 
     return nullify_end(ctx);
 #endif
@@ -2819,8 +2765,6 @@ static bool trans_ds(DisasContext *ctx, arg_rrr_cf *a)
     tcg_gen_add2_i32(dest, cpu_psw_cb_msb, add1, zero, add2, zero);
     tcg_gen_add2_i32(dest, cpu_psw_cb_msb, dest, cpu_psw_cb_msb, addc, zero);
 
-    tcg_temp_free(addc);
-
     /* Write back the result register.  */
     save_gpr(ctx, a->t, dest);
 
@@ -2842,10 +2786,6 @@ static bool trans_ds(DisasContext *ctx, arg_rrr_cf *a)
         ctx->null_cond = do_cond(a->cf, dest, cpu_psw_cb_msb, sv);
     }
 
-    tcg_temp_free(add1);
-    tcg_temp_free(add2);
-    tcg_temp_free(dest);
-
     return nullify_end(ctx);
 }
 
@@ -3100,7 +3040,6 @@ static bool do_addb(DisasContext *ctx, unsigned r, TCGv_reg in1,
 
     cond = do_cond(c * 2 + f, dest, cb_msb, sv);
     save_gpr(ctx, r, dest);
-    tcg_temp_free(dest);
     return do_cbranch(ctx, disp, n, &cond);
 }
 
@@ -3128,7 +3067,6 @@ static bool trans_bb_sar(DisasContext *ctx, arg_bb_sar *a)
     tcg_gen_shl_reg(tmp, tcg_r, cpu_sar);
 
     cond = cond_make_0(a->c ? TCG_COND_GE : TCG_COND_LT, tmp);
-    tcg_temp_free(tmp);
     return do_cbranch(ctx, a->disp, a->n, &cond);
 }
 
@@ -3144,7 +3082,6 @@ static bool trans_bb_imm(DisasContext *ctx, arg_bb_imm *a)
     tcg_gen_shli_reg(tmp, tcg_r, a->p);
 
     cond = cond_make_0(a->c ? TCG_COND_GE : TCG_COND_LT, tmp);
-    tcg_temp_free(tmp);
     return do_cbranch(ctx, a->disp, a->n, &cond);
 }
 
@@ -3197,7 +3134,6 @@ static bool trans_shrpw_sar(DisasContext *ctx, arg_shrpw_sar *a)
         tcg_gen_trunc_reg_i32(t32, load_gpr(ctx, a->r2));
         tcg_gen_rotr_i32(t32, t32, cpu_sar);
         tcg_gen_extu_i32_reg(dest, t32);
-        tcg_temp_free_i32(t32);
     } else {
         TCGv_i64 t = tcg_temp_new_i64();
         TCGv_i64 s = tcg_temp_new_i64();
@@ -3206,9 +3142,6 @@ static bool trans_shrpw_sar(DisasContext *ctx, arg_shrpw_sar *a)
         tcg_gen_extu_reg_i64(s, cpu_sar);
         tcg_gen_shr_i64(t, t, s);
         tcg_gen_trunc_i64_reg(dest, t);
-
-        tcg_temp_free_i64(t);
-        tcg_temp_free_i64(s);
     }
     save_gpr(ctx, a->t, dest);
 
@@ -3240,13 +3173,11 @@ static bool trans_shrpw_imm(DisasContext *ctx, arg_shrpw_imm *a)
         tcg_gen_trunc_reg_i32(t32, t2);
         tcg_gen_rotri_i32(t32, t32, sa);
         tcg_gen_extu_i32_reg(dest, t32);
-        tcg_temp_free_i32(t32);
     } else {
         TCGv_i64 t64 = tcg_temp_new_i64();
         tcg_gen_concat_reg_i64(t64, t2, cpu_gr[a->r1]);
         tcg_gen_shri_i64(t64, t64, sa);
         tcg_gen_trunc_i64_reg(dest, t64);
-        tcg_temp_free_i64(t64);
     }
     save_gpr(ctx, a->t, dest);
 
@@ -3280,7 +3211,6 @@ static bool trans_extrw_sar(DisasContext *ctx, arg_extrw_sar *a)
         tcg_gen_shr_reg(dest, src, tmp);
         tcg_gen_extract_reg(dest, dest, 0, len);
     }
-    tcg_temp_free(tmp);
     save_gpr(ctx, a->t, dest);
 
     /* Install the new nullification.  */
@@ -3410,9 +3340,6 @@ static bool do_depw_sar(DisasContext *ctx, unsigned rt, unsigned c,
     } else {
         tcg_gen_shl_reg(dest, tmp, shift);
     }
-    tcg_temp_free(shift);
-    tcg_temp_free(mask);
-    tcg_temp_free(tmp);
     save_gpr(ctx, rt, dest);
 
     /* Install the new nullification.  */
@@ -3487,7 +3414,6 @@ static bool trans_be(DisasContext *ctx, arg_be *a)
         tcg_gen_mov_i64(cpu_iasq_b, new_spc);
         nullify_set(ctx, a->n);
     }
-    tcg_temp_free_i64(new_spc);
     tcg_gen_lookup_and_goto_ptr();
     ctx->base.is_jmp = DISAS_NORETURN;
     return nullify_end(ctx);
@@ -3876,9 +3802,6 @@ static bool trans_fcmp_f(DisasContext *ctx, arg_fclass2 *a)
 
     gen_helper_fcmp_s(cpu_env, ta, tb, ty, tc);
 
-    tcg_temp_free_i32(ta);
-    tcg_temp_free_i32(tb);
-
     return nullify_end(ctx);
 }
 
@@ -3896,9 +3819,6 @@ static bool trans_fcmp_d(DisasContext *ctx, arg_fclass2 *a)
 
     gen_helper_fcmp_d(cpu_env, ta, tb, ty, tc);
 
-    tcg_temp_free_i64(ta);
-    tcg_temp_free_i64(tb);
-
     return nullify_end(ctx);
 }
 
@@ -3958,7 +3878,6 @@ static bool trans_ftest(DisasContext *ctx, arg_ftest *a)
 
         tcg_gen_extract_reg(t, t, 21 - cbit, 1);
         ctx->null_cond = cond_make_0(TCG_COND_NE, t);
-        tcg_temp_free(t);
     }
 
  done:
@@ -4019,8 +3938,6 @@ static bool trans_xmpyu(DisasContext *ctx, arg_xmpyu *a)
     y = load_frw0_i64(a->r2);
     tcg_gen_mul_i64(x, x, y);
     save_frd(a->t, x);
-    tcg_temp_free_i64(x);
-    tcg_temp_free_i64(y);
 
     return nullify_end(ctx);
 }
@@ -4094,10 +4011,7 @@ static bool trans_fmpyfadd_f(DisasContext *ctx, arg_fmpyfadd_f *a)
         gen_helper_fmpyfadd_s(x, cpu_env, x, y, z);
     }
 
-    tcg_temp_free_i32(y);
-    tcg_temp_free_i32(z);
     save_frw_i32(a->t, x);
-    tcg_temp_free_i32(x);
     return nullify_end(ctx);
 }
 
@@ -4116,10 +4030,7 @@ static bool trans_fmpyfadd_d(DisasContext *ctx, arg_fmpyfadd_d *a)
         gen_helper_fmpyfadd_d(x, cpu_env, x, y, z);
     }
 
-    tcg_temp_free_i64(y);
-    tcg_temp_free_i64(z);
     save_frd(a->t, x);
-    tcg_temp_free_i64(x);
     return nullify_end(ctx);
 }
 
@@ -4234,13 +4145,11 @@ static void hppa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         }
     }
 
-    /* Free any temporaries allocated.  */
+    /* Forget any temporaries allocated.  */
     for (i = 0, n = ctx->ntempr; i < n; ++i) {
-        tcg_temp_free(ctx->tempr[i]);
         ctx->tempr[i] = NULL;
     }
     for (i = 0, n = ctx->ntempl; i < n; ++i) {
-        tcg_temp_free_tl(ctx->templ[i]);
         ctx->templ[i] = NULL;
     }
     ctx->ntempr = 0;
-- 
2.34.1


