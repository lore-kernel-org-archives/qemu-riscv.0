Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWHz-0002gr-8x
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHx-0002S2-83
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:05 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHr-0004pb-8P
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:02 -0500
Received: by mail-pf1-x42f.google.com with SMTP id a7so2783302pfx.10
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6bFQbr4bFP1rh4Nb5AKcYb/yq2BEfgRK7JPoiaNmaA=;
 b=CdPLsiuQ19juWpyq14r/MO76tXcmg+ScjE9v9VqqyD6flMQpnFswRfylRCqikQCApK
 i5VKVDzGOrtUFcDBiRQmDS1Dq6/yi9fgyWzbu6B/xgk+aUqLjgb3ZkDizuDUYFSipyOp
 CC2d3IUMQlxf6rdHD7iitQiIWH95SeCYIfer/Y0yXnWiUd6k4Rt3IYQZIoxWqzR9dy8z
 3aO8+mkwGrUNl8fiySV19x5ulWOytqCNoD9rO3Ws9sxGs3/iOridir+dcNQuQJ61LmPs
 CPIrWo2bHogZNJOOFjUhtuBr4UvP3HLgT0d3qoF5e6HoLOtUrWH/Sw80o0hNtkU2NRYZ
 Xb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6bFQbr4bFP1rh4Nb5AKcYb/yq2BEfgRK7JPoiaNmaA=;
 b=c36jJ4pBvs/LUKicOxTKnwl/LzrQRVKkbXZ09LWadd2hT+I0Jywq0JqNkEn5udUonI
 wDrlNW3uaFgzyCp/iCQ6zPswOTdBFyECZRC5kXPk8K3U18o1T2ChcgUBa10CY8LLQrPN
 EajX68Ic+gHkJ6T7x8BYSKj4e3SAYwyKcixxL4vxxeyZroWafC8btnHTdsGq/QYPJiBq
 78LIO0lWSclH7pzJkOfWIYO7qNj/WeKlX13lbZVBEOlPXv2XTrjRN+xHS2wUcctfpH9Q
 PI0RMVUJieVu90rbxT6DKvL1sKepnK/JixnHAg7yMpvCE30uS/DhnJOYfNgNAxODYgDe
 gzmw==
X-Gm-Message-State: AO0yUKV0z7S3/j6UUUVQiajIXGUch6cpMCahw49rU7o2vq2bbcds8z3w
 x+fG+HyxkR3GrqACbiKUkW213Q==
X-Google-Smtp-Source: AK7set+eITPfouu9k0DhcMMugT+nQE/iLy0iGpSYRMopG0FAC0sd98bXHdLs4L74KzgJ6720pdo3EQ==
X-Received: by 2002:aa7:958a:0:b0:5e1:f54e:8074 with SMTP id
 z10-20020aa7958a000000b005e1f54e8074mr10046437pfj.21.1677476577405; 
 Sun, 26 Feb 2023 21:42:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 05/70] target/arm: Create gen_set_rmode, gen_restore_rmode
Date: Sun, 26 Feb 2023 19:41:28 -1000
Message-Id: <20230227054233.390271-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:05 -0000

Split out common subroutines for handing rounding mode
changes during translation.  Use tcg_constant_i32 and
tcg_temp_new_i32 instead of tcg_const_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 17 ++++++++++++++
 target/arm/translate-a64.c | 47 +++++++++++++++-----------------------
 target/arm/translate-sve.c |  6 ++---
 target/arm/translate-vfp.c | 26 ++++++++-------------
 4 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 3dbff87349..062f91de54 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -616,6 +616,23 @@ static inline TCGv_ptr gen_lookup_cp_reg(uint32_t key)
     return ret;
 }
 
+/*
+ * Set and reset rounding mode around another operation.
+ */
+static inline TCGv_i32 gen_set_rmode(ARMFPRounding rmode, TCGv_ptr fpst)
+{
+    TCGv_i32 new = tcg_constant_i32(arm_rmode_to_sf(rmode));
+    TCGv_i32 old = tcg_temp_new_i32();
+
+    gen_helper_set_rmode(old, new, fpst);
+    return old;
+}
+
+static inline void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst)
+{
+    gen_helper_set_rmode(old, old, fpst);
+}
+
 /*
  * Helpers for implementing sets of trans_* functions.
  * Defer the implementation of NAME to FUNC, with optional extra arguments.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3c0462a9c1..9e682f36c9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6146,13 +6146,12 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
     case 0xb: /* FRINTZ */
     case 0xc: /* FRINTA */
     {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(opcode & 7));
+        TCGv_i32 tcg_rmode;
+
         fpst = fpstatus_ptr(FPST_FPCR_F16);
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        tcg_rmode = gen_set_rmode(opcode & 7, fpst);
         gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
         break;
     }
     case 0xe: /* FRINTX */
@@ -6231,10 +6230,9 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        TCGv_i32 tcg_rmode = gen_set_rmode(rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
     } else {
         gen_fpst(tcg_res, tcg_op, fpst);
     }
@@ -6304,10 +6302,9 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        TCGv_i32 tcg_rmode = gen_set_rmode(rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
     } else {
         gen_fpst(tcg_res, tcg_op, fpst);
     }
@@ -6944,9 +6941,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
             rmode = FPROUNDING_TIEAWAY;
         }
 
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
 
         switch (type) {
         case 1: /* float64 */
@@ -7023,7 +7018,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
             g_assert_not_reached();
         }
 
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -8771,9 +8766,8 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
 
     assert(!(is_scalar && is_q));
 
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     tcg_fpstatus = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, tcg_fpstatus);
     fracbits = (16 << size) - immhb;
     tcg_shift = tcg_constant_i32(fracbits);
 
@@ -8831,7 +8825,7 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
         }
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    gen_restore_rmode(tcg_rmode, tcg_fpstatus);
 }
 
 /* AdvSIMD scalar shift by immediate
@@ -10219,12 +10213,11 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     if (is_fcvt) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         tcg_fpstatus = fpstatus_ptr(FPST_FPCR);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     } else {
-        tcg_rmode = NULL;
         tcg_fpstatus = NULL;
+        tcg_rmode = NULL;
     }
 
     if (size == 3) {
@@ -10276,7 +10269,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     if (is_fcvt) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -12406,8 +12399,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         tcg_fpstatus = NULL;
     }
     if (rmode >= 0) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     } else {
         tcg_rmode = NULL;
     }
@@ -12590,7 +12582,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     clear_vec_high(s, is_q, rd);
 
     if (tcg_rmode) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -12758,8 +12750,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     }
 
     if (rmode >= 0) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     }
 
     if (is_scalar) {
@@ -12859,7 +12850,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     }
 
     if (tcg_rmode) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3c65dd1ff2..3ca60fb36b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4096,17 +4096,15 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    tmode = tcg_const_i32(arm_rmode_to_sf(mode));
     status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-
-    gen_helper_set_rmode(tmode, tmode, status);
+    tmode = gen_set_rmode(mode, status);
 
     tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                        vec_full_reg_offset(s, a->rn),
                        pred_full_reg_offset(s, a->pg),
                        status, vsz, vsz, 0, fn);
 
-    gen_helper_set_rmode(tmode, tmode, status);
+    gen_restore_rmode(tmode, status);
     return true;
 }
 
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index e7acfb3338..dd782aacf4 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -464,8 +464,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         fpst = fpstatus_ptr(FPST_FPCR);
     }
 
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(rounding, fpst);
 
     if (sz == 3) {
         TCGv_i64 tcg_op;
@@ -489,7 +488,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         vfp_store_reg32(tcg_res, rd);
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     return true;
 }
 
@@ -533,9 +532,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
     }
 
     tcg_shift = tcg_constant_i32(0);
-
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(rounding, fpst);
 
     if (sz == 3) {
         TCGv_i64 tcg_double, tcg_res;
@@ -572,7 +569,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
         vfp_store_reg32(tcg_res, rd);
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     return true;
 }
 
@@ -2783,10 +2780,9 @@ static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR_F16);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rinth(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
 }
@@ -2808,10 +2804,9 @@ static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rints(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
 }
@@ -2842,10 +2837,9 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
     tmp = tcg_temp_new_i64();
     vfp_load_reg64(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rintd(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg64(tmp, a->vd);
     return true;
 }
-- 
2.34.1


