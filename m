Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWHs-0002IS-HX
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHq-00025W-IF
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:42:58 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHo-0004oW-F1
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:42:58 -0500
Received: by mail-pg1-x530.google.com with SMTP id s18so2860839pgq.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dS1IiMxvN3PN6cOLh1bTyXU8CtedsGRsJAlzWKhUz38=;
 b=PxM5EFzydZoVsO47nVeNlB6okP5U3NE3ZqJDgRf4iUKYTc39XcEuxWN86DTGAn2Pg5
 bcaaBzcSjYrT5tSjocGZXV2KYFFpOehbMGKO9zNO0mCGIYBEke92s+ablInOles2KqRf
 LPqZYQAxgdfJBWTUpyJUf1/7NL3R2Bm2pVW5CX8CGwTV94vJkYUGIFWzBzCJf/UMKBm4
 JoJN7DMvGh79lmWx1lpC39P86YTr5QoPVyKACHNJEQFl/MAuaz3RfrnUFGlQ0/eix0AX
 Ak3W4gIcRck+4EFdtPIoZmPxUvbExaIcsJ3A72g6e0x+N9PAqNfG74Vk6on5O0mQvGRB
 uI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dS1IiMxvN3PN6cOLh1bTyXU8CtedsGRsJAlzWKhUz38=;
 b=1D9JFCwOOQWUFyDt7b9KJUl/eAifs7Zi/ncfG1bVyyphq8k0GQbw+/KVjfi/pmVpxh
 d1wQuXqZmEieSnQ204VJrBMaUHtu69KjPe41VQkC1WBoQh6I7sJ0Q0hGQXmcsEf7TPC0
 +YPtAEmL9P4GQy+w2W5lUNCWS07sQaUvtMbB5qCpYaJ0iC9Y7XYaxP/xVQqvq6iiZM4i
 h9ISME7dENfCzvZ2BoPqxBjuP5CvpkrWYosamiIttIp4tgmAz1Q6rMWdswR1+9IHIKsJ
 jG1+/oScticbqpiUubbl6PZ1FOX0Hgd1jUg/SLGn6ODmWf8xj3zr5TUaVLyfEsATb79p
 RBYA==
X-Gm-Message-State: AO0yUKUNBxS0/+HEI4L4OM5Pp6XoexbShzXCI2rYv7pSLbEHMiaDuSOg
 QKrhEphjyUsi10brsfX+VRtgcA==
X-Google-Smtp-Source: AK7set9HEht8UwWKd9gGBT1rXbTo7YG5smzfqKIq6RSh+nDNFfPpZfpSgCrtwTN1bnaWLV5bP3FIUQ==
X-Received: by 2002:a05:6a00:47:b0:5cd:d766:8a2b with SMTP id
 i7-20020a056a00004700b005cdd7668a2bmr18698810pfk.6.1677476574927; 
 Sun, 26 Feb 2023 21:42:54 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 04/70] target/arm: Consistently use ARMFPRounding during
 translation
Date: Sun, 26 Feb 2023 19:41:27 -1000
Message-Id: <20230227054233.390271-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:42:58 -0000

In preparation for extracting new helpers, ensure that
the rounding mode is represented as ARMFPRounding and
not FloatRoundMode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 16 ++++++++--------
 target/arm/translate-sve.c | 18 +++++++++---------
 target/arm/translate-vfp.c |  6 +++---
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1c575de3e0..3c0462a9c1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6202,7 +6202,7 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0xa: /* FRINTM */
     case 0xb: /* FRINTZ */
     case 0xc: /* FRINTA */
-        rmode = arm_rmode_to_sf(opcode & 7);
+        rmode = opcode & 7;
         gen_fpst = gen_helper_rints;
         break;
     case 0xe: /* FRINTX */
@@ -6212,14 +6212,14 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
         gen_fpst = gen_helper_rints;
         break;
     case 0x10: /* FRINT32Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint32_s;
         break;
     case 0x11: /* FRINT32X */
         gen_fpst = gen_helper_frint32_s;
         break;
     case 0x12: /* FRINT64Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint64_s;
         break;
     case 0x13: /* FRINT64X */
@@ -6231,7 +6231,7 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(rmode);
+        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -6275,7 +6275,7 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
     case 0xa: /* FRINTM */
     case 0xb: /* FRINTZ */
     case 0xc: /* FRINTA */
-        rmode = arm_rmode_to_sf(opcode & 7);
+        rmode = opcode & 7;
         gen_fpst = gen_helper_rintd;
         break;
     case 0xe: /* FRINTX */
@@ -6285,14 +6285,14 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
         gen_fpst = gen_helper_rintd;
         break;
     case 0x10: /* FRINT32Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint32_d;
         break;
     case 0x11: /* FRINT32X */
         gen_fpst = gen_helper_frint32_d;
         break;
     case 0x12: /* FRINT64Z */
-        rmode = float_round_to_zero;
+        rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint64_d;
         break;
     case 0x13: /* FRINT64X */
@@ -6304,7 +6304,7 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(rmode);
+        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5bf80b22d7..3c65dd1ff2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4082,7 +4082,7 @@ TRANS_FEAT(FRINTX, aa64_sve, gen_gvec_fpst_arg_zpz, frintx_fns[a->esz],
            a, 0, a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
 static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
-                          int mode, gen_helper_gvec_3_ptr *fn)
+                          ARMFPRounding mode, gen_helper_gvec_3_ptr *fn)
 {
     unsigned vsz;
     TCGv_i32 tmode;
@@ -4096,7 +4096,7 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    tmode = tcg_const_i32(mode);
+    tmode = tcg_const_i32(arm_rmode_to_sf(mode));
     status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 
     gen_helper_set_rmode(tmode, tmode, status);
@@ -4111,15 +4111,15 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
 }
 
 TRANS_FEAT(FRINTN, aa64_sve, do_frint_mode, a,
-           float_round_nearest_even, frint_fns[a->esz])
+           FPROUNDING_TIEEVEN, frint_fns[a->esz])
 TRANS_FEAT(FRINTP, aa64_sve, do_frint_mode, a,
-           float_round_up, frint_fns[a->esz])
+           FPROUNDING_POSINF, frint_fns[a->esz])
 TRANS_FEAT(FRINTM, aa64_sve, do_frint_mode, a,
-           float_round_down, frint_fns[a->esz])
+           FPROUNDING_NEGINF, frint_fns[a->esz])
 TRANS_FEAT(FRINTZ, aa64_sve, do_frint_mode, a,
-           float_round_to_zero, frint_fns[a->esz])
+           FPROUNDING_ZERO, frint_fns[a->esz])
 TRANS_FEAT(FRINTA, aa64_sve, do_frint_mode, a,
-           float_round_ties_away, frint_fns[a->esz])
+           FPROUNDING_TIEAWAY, frint_fns[a->esz])
 
 static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
     NULL,                    gen_helper_sve_frecpx_h,
@@ -7145,9 +7145,9 @@ TRANS_FEAT(FCVTLT_sd, aa64_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_sd, a, 0, FPST_FPCR)
 
 TRANS_FEAT(FCVTX_ds, aa64_sve2, do_frint_mode, a,
-           float_round_to_odd, gen_helper_sve_fcvt_ds)
+           FPROUNDING_ODD, gen_helper_sve_fcvt_ds)
 TRANS_FEAT(FCVTXNT_ds, aa64_sve2, do_frint_mode, a,
-           float_round_to_odd, gen_helper_sve2_fcvtnt_ds)
+           FPROUNDING_ODD, gen_helper_sve2_fcvtnt_ds)
 
 static gen_helper_gvec_3_ptr * const flogb_fns[] = {
     NULL,               gen_helper_flogb_h,
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 757a2bf7d9..e7acfb3338 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -2783,7 +2783,7 @@ static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR_F16);
-    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     gen_helper_rinth(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -2808,7 +2808,7 @@ static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     gen_helper_rints(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -2842,7 +2842,7 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
     tmp = tcg_temp_new_i64();
     vfp_load_reg64(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
     gen_helper_rintd(tmp, tmp, fpst);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-- 
2.34.1


