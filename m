Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNo2-0001gH-5I
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnz-0001Yn-N4
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:04:07 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNnx-0006nI-4N
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:04:07 -0400
Received: by mail-pl1-x635.google.com with SMTP id t11so6393944plq.11
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtlL/BWHCU9umxSh60qbvU+RiGFMjvlSCAGcAmnUDro=;
 b=QlW6qCfiogZLVO3/IxW5fJ2Xjgay7bBuUF4pMHvjt38SNmevm9VKfBVTNAvVRW/iCT
 TsllcOGvbvFOW29y4kK3qW6L0IQwYIvB0t7gaebPlg1cRQge+A55phMEZu959wUyOrfK
 pAIn6qG0m3Jk0z0lkRDHzPvfWjdeBU3WuUsnl5w0Ai/bMluNmnTtlrMUgYBonkdLfKW6
 4hkkk4sgJStJIuZqhhH2+6BnfbkAoVn/s14BoTwPRUOw15LCTi1UeCzvcGFtcPlR/HlM
 YDTmrVTmicR/sC2JFnWuuaURR3QwdxS1GoYtmrUnDJcy75VRlvL3J8+as374LbmYFQK+
 D49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtlL/BWHCU9umxSh60qbvU+RiGFMjvlSCAGcAmnUDro=;
 b=qU7xU5WnI+TUEvEzd9H6nfCvQAotmEvlsmx1+vXjbbyRzb7jKfTRJ4duiyQJZvy8HH
 c3PBJiCMhE5qYYPFK8mjgdIx/75CaoEpd4fUx6rIcF4iPDQTePWv0al6oXX+Vw0mjOsD
 cgVxz7hyAgsvkT/N7IkXh6t4WHIfsPTNecmzdmV17P8qET334OvOFwyu6mKjmlGJhsdN
 +1MbTqDjo6u8IG6ae6y3E87rkSuq4wO0c0G0LkDAUqlf1Q+ciPogpDZcOnJxk/gSxVbb
 IDHn9HAf7pHvAryoGP9SxgJAtdVMpGg/p40qjZJXow1XUQpdjwo81kHFWywPYqDKRJjL
 8RLQ==
X-Gm-Message-State: AOAM533MnO+hl9UeecylO9U7FobRKVboJZCxlXi5q84vvA2xBKjd3q1C
 ceNHZG83Jldfge/hvQxFNbSAJi46NLTwBSfR
X-Google-Smtp-Source: ABdhPJxhAoLZ2VcPiup3sTD3Xoi7LWYuvy1Wny6eiiinOUMDxb/+XHR1d/DNk/qlsF7iplR9QYrbYw==
X-Received: by 2002:a17:902:8a97:b0:13e:6e77:af59 with SMTP id
 p23-20020a1709028a9700b0013e6e77af59mr8661252plo.4.1635498243728; 
 Fri, 29 Oct 2021 02:04:03 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:04:03 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 70/76] target/riscv: rvv-1.0: floating-point reciprocal
 estimate instruction
Date: Fri, 29 Oct 2021 16:59:15 +0800
Message-Id: <20211029085922.255197-71-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Oct 2021 09:04:08 -0000

From: Frank Chang <frank.chang@sifive.com>

Implement the floating-point reciprocal estimate to 7 bits instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |   4 +
 target/riscv/insn32.decode              |   1 +
 target/riscv/insn_trans/trans_rvv.c.inc |   1 +
 target/riscv/vector_helper.c            | 191 ++++++++++++++++++++++++
 4 files changed, 197 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index bdf06dfb24d..ab283d12b79 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -845,6 +845,10 @@ DEF_HELPER_5(vfrsqrt7_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfrsqrt7_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfrsqrt7_v_d, void, ptr, ptr, ptr, env, i32)
 
+DEF_HELPER_5(vfrec7_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrec7_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrec7_v_d, void, ptr, ptr, ptr, env, i32)
+
 DEF_HELPER_6(vfmin_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6e5f288943a..952768f8ded 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -561,6 +561,7 @@ vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
 vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfrsqrt7_v      010011 . ..... 00100 001 ..... 1010111 @r2_vm
+vfrec7_v        010011 . ..... 00101 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 8fe718610a9..ff8f6df8f7b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2408,6 +2408,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
 
 GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
 GEN_OPFV_TRANS(vfrsqrt7_v, opfv_check, RISCV_FRM_DYN)
+GEN_OPFV_TRANS(vfrec7_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d5f3229bcb4..946dca53ffd 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3587,6 +3587,197 @@ GEN_VEXT_V_ENV(vfrsqrt7_v_h, 2, 2)
 GEN_VEXT_V_ENV(vfrsqrt7_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfrsqrt7_v_d, 8, 8)
 
+/*
+ * Vector Floating-Point Reciprocal Estimate Instruction
+ *
+ * Adapted from riscv-v-spec recip.c:
+ * https://github.com/riscv/riscv-v-spec/blob/master/recip.c
+ */
+static uint64_t frec7(uint64_t f, int exp_size, int frac_size,
+                      float_status *s)
+{
+    uint64_t sign = extract64(f, frac_size + exp_size, 1);
+    uint64_t exp = extract64(f, frac_size, exp_size);
+    uint64_t frac = extract64(f, 0, frac_size);
+
+    const uint8_t lookup_table[] = {
+        127, 125, 123, 121, 119, 117, 116, 114,
+        112, 110, 109, 107, 105, 104, 102, 100,
+        99, 97, 96, 94, 93, 91, 90, 88,
+        87, 85, 84, 83, 81, 80, 79, 77,
+        76, 75, 74, 72, 71, 70, 69, 68,
+        66, 65, 64, 63, 62, 61, 60, 59,
+        58, 57, 56, 55, 54, 53, 52, 51,
+        50, 49, 48, 47, 46, 45, 44, 43,
+        42, 41, 40, 40, 39, 38, 37, 36,
+        35, 35, 34, 33, 32, 31, 31, 30,
+        29, 28, 28, 27, 26, 25, 25, 24,
+        23, 23, 22, 21, 21, 20, 19, 19,
+        18, 17, 17, 16, 15, 15, 14, 14,
+        13, 12, 12, 11, 11, 10, 9, 9,
+        8, 8, 7, 7, 6, 5, 5, 4,
+        4, 3, 3, 2, 2, 1, 1, 0
+    };
+    const int precision = 7;
+
+    if (exp == 0 && frac != 0) { /* subnormal */
+        /* Normalize the subnormal. */
+        while (extract64(frac, frac_size - 1, 1) == 0) {
+            exp--;
+            frac <<= 1;
+        }
+
+        frac = (frac << 1) & MAKE_64BIT_MASK(0, frac_size);
+
+        if (exp != 0 && exp != UINT64_MAX) {
+            /*
+             * Overflow to inf or max value of same sign,
+             * depending on sign and rounding mode.
+             */
+            s->float_exception_flags |= (float_flag_inexact |
+                                         float_flag_overflow);
+
+            if ((s->float_rounding_mode == float_round_to_zero) ||
+                ((s->float_rounding_mode == float_round_down) && !sign) ||
+                ((s->float_rounding_mode == float_round_up) && sign)) {
+                /* Return greatest/negative finite value. */
+                return (sign << (exp_size + frac_size)) |
+                    (MAKE_64BIT_MASK(frac_size, exp_size) - 1);
+            } else {
+                /* Return +-inf. */
+                return (sign << (exp_size + frac_size)) |
+                    MAKE_64BIT_MASK(frac_size, exp_size);
+            }
+        }
+    }
+
+    int idx = frac >> (frac_size - precision);
+    uint64_t out_frac = (uint64_t)(lookup_table[idx]) <<
+                            (frac_size - precision);
+    uint64_t out_exp = 2 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp;
+
+    if (out_exp == 0 || out_exp == UINT64_MAX) {
+        /*
+         * The result is subnormal, but don't raise the underflow exception,
+         * because there's no additional loss of precision.
+         */
+        out_frac = (out_frac >> 1) | MAKE_64BIT_MASK(frac_size - 1, 1);
+        if (out_exp == UINT64_MAX) {
+            out_frac >>= 1;
+            out_exp = 0;
+        }
+    }
+
+    uint64_t val = 0;
+    val = deposit64(val, 0, frac_size, out_frac);
+    val = deposit64(val, frac_size, exp_size, out_exp);
+    val = deposit64(val, frac_size + exp_size, 1, sign);
+    return val;
+}
+
+static float16 frec7_h(float16 f, float_status *s)
+{
+    int exp_size = 5, frac_size = 10;
+    bool sign = float16_is_neg(f);
+
+    /* frec7(+-inf) = +-0 */
+    if (float16_is_infinity(f)) {
+        return float16_set_sign(float16_zero, sign);
+    }
+
+    /* frec7(+-0) = +-inf */
+    if (float16_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float16_set_sign(float16_infinity, sign);
+    }
+
+    /* frec7(sNaN) = canonical NaN */
+    if (float16_is_signaling_nan(f, s)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float16_default_nan(s);
+    }
+
+    /* frec7(qNaN) = canonical NaN */
+    if (float16_is_quiet_nan(f, s)) {
+        return float16_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val = frec7(f, exp_size, frac_size, s);
+    return make_float16(val);
+}
+
+static float32 frec7_s(float32 f, float_status *s)
+{
+    int exp_size = 8, frac_size = 23;
+    bool sign = float32_is_neg(f);
+
+    /* frec7(+-inf) = +-0 */
+    if (float32_is_infinity(f)) {
+        return float32_set_sign(float32_zero, sign);
+    }
+
+    /* frec7(+-0) = +-inf */
+    if (float32_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float32_set_sign(float32_infinity, sign);
+    }
+
+    /* frec7(sNaN) = canonical NaN */
+    if (float32_is_signaling_nan(f, s)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float32_default_nan(s);
+    }
+
+    /* frec7(qNaN) = canonical NaN */
+    if (float32_is_quiet_nan(f, s)) {
+        return float32_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val = frec7(f, exp_size, frac_size, s);
+    return make_float32(val);
+}
+
+static float64 frec7_d(float64 f, float_status *s)
+{
+    int exp_size = 11, frac_size = 52;
+    bool sign = float64_is_neg(f);
+
+    /* frec7(+-inf) = +-0 */
+    if (float64_is_infinity(f)) {
+        return float64_set_sign(float64_zero, sign);
+    }
+
+    /* frec7(+-0) = +-inf */
+    if (float64_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float64_set_sign(float64_infinity, sign);
+    }
+
+    /* frec7(sNaN) = canonical NaN */
+    if (float64_is_signaling_nan(f, s)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float64_default_nan(s);
+    }
+
+    /* frec7(qNaN) = canonical NaN */
+    if (float64_is_quiet_nan(f, s)) {
+        return float64_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val = frec7(f, exp_size, frac_size, s);
+    return make_float64(val);
+}
+
+RVVCALL(OPFVV1, vfrec7_v_h, OP_UU_H, H2, H2, frec7_h)
+RVVCALL(OPFVV1, vfrec7_v_w, OP_UU_W, H4, H4, frec7_s)
+RVVCALL(OPFVV1, vfrec7_v_d, OP_UU_D, H8, H8, frec7_d)
+GEN_VEXT_V_ENV(vfrec7_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfrec7_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfrec7_v_d, 8, 8)
+
 /* Vector Floating-Point MIN/MAX Instructions */
 RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number)
 RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number)
-- 
2.25.1


