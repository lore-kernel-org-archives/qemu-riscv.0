Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGEW-00087n-SN
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGER-00084s-F4
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:55 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEP-0000E9-8Z
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:55 -0500
Received: by mail-pg1-x536.google.com with SMTP id n7so1092069pgg.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SFFG6SkL7m74FCDlB/iBuhCPdlNKA+UjXBxfaADhV88=;
 b=Np4uIdtsuNFnGNNQ8+eFO6cGfRcMCveku3aSt86cNred1dvrJaz7IPqpzPpP7oc4Ns
 F0ZokpLjhOKZ0Oszy+y7HTZSPxpEDmm2zFbFcIGchJYYh+b9FQF6WuiGpEjSCaxuGdUh
 i04HyLDc6cTo3+fq6eTBpvDOZJUXjNoL/ctJhPKeiwU0uBkGjndj6H9s1CsmT2/P3P0V
 hLVvO8vSht/W8sDRyDc5og2Lh5yWUGWABukf+Ij75fSjOWKLu3hxknL6aUwDdjUauYR+
 W22wglNEnNBjEQa5iacZ4aHy6ogMKrdgFqsq8CQKCLAKaoY1hYsCgSQ0rMTCVOglLF98
 k/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SFFG6SkL7m74FCDlB/iBuhCPdlNKA+UjXBxfaADhV88=;
 b=JH55P/9UDkLAbYDyBu5npxP4U6Shj4eGMEnyHSl402O3pQ7nAj4CDQ8mmKKKGUlqCi
 5RHRsV9ZDLthvo2JrGQmKWMNZ/tE+QMIZsN195biWNSgzbOqaiXvZQg75blv/arSK51Z
 hvIVXKumQBlrZMO1ONYXzMc8Yrq8Sq2nsLeL68uq4vWb31BhLn2WXx0bLuqU9+zctJjd
 ERcm3bZy+oWV55I7sissoPojL79dioOMcO/OlcdZDu2wVOXJQIRyb6Yw6nokwjkUqi1L
 M2lkBfNf38Kr2audMhakvTVS4i4QOTdGi8TN6+dKfeB9rNBWSyomqWXuPoIxE0SMCYAm
 bs/Q==
X-Gm-Message-State: AOAM533NW3gdD2CRGQPy5uYEHMiMuXUNEDUFQTF71SEeynnmplxW19c0
 jST+BA2jlyeO+Q3Ag0QS9Fj81A==
X-Google-Smtp-Source: ABdhPJxow3JDRHQQmpy55JUSv/nBszlpyFp9YuA93agjnloByfQN+RqtI6k521nZAzbaZzTaeFcW6Q==
X-Received: by 2002:aa7:90cf:0:b029:1a3:a176:f4d0 with SMTP id
 k15-20020aa790cf0000b02901a3a176f4d0mr3877079pfk.8.1610444692038; 
 Tue, 12 Jan 2021 01:44:52 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:51 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 71/72] target/riscv: rvv-1.0: floating-point reciprocal
 estimate instruction
Date: Tue, 12 Jan 2021 17:39:45 +0800
Message-Id: <20210112093950.17530-72-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:44:55 -0000

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
index 4a08cdc547e..bfc42ffd821 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -886,6 +886,10 @@ DEF_HELPER_5(vfrsqrte7_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfrsqrte7_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfrsqrte7_v_d, void, ptr, ptr, ptr, env, i32)
 
+DEF_HELPER_5(vfrece7_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrece7_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrece7_v_d, void, ptr, ptr, ptr, env, i32)
+
 DEF_HELPER_6(vfmin_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 530be388c1a..669257cb5a0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -536,6 +536,7 @@ vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
 vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfrsqrte7_v     010011 . ..... 00100 001 ..... 1010111 @r2_vm
+vfrece7_v       010011 . ..... 00101 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f6fb4cbd144..7575657fd36 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2639,6 +2639,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
 
 GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
 GEN_OPFV_TRANS(vfrsqrte7_v, opfv_check, RISCV_FRM_DYN)
+GEN_OPFV_TRANS(vfrece7_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 36f45e118f6..17bdc080a79 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3821,6 +3821,197 @@ GEN_VEXT_V_ENV(vfrsqrte7_v_h, 2, 2)
 GEN_VEXT_V_ENV(vfrsqrte7_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfrsqrte7_v_d, 8, 8)
 
+/*
+ * Vector Floating-Point Reciprocal Estimate Instruction
+ *
+ * Adapted from riscv-v-spec recip.cc:
+ * https://github.com/riscv/riscv-v-spec/blob/master/recip.cc
+ */
+static uint64_t frece7(uint64_t f, int exp_size, int frac_size,
+                       float_status *s)
+{
+    bool sign = extract64(f, frac_size + exp_size, 1);
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
+static float16 frece7_h(float16 f, float_status *s)
+{
+    int exp_size = 5, frac_size = 10;
+    bool sign = float16_is_neg(f);
+
+    /* frece(+-inf) = +-0 */
+    if (float16_is_infinity(f)) {
+        return float16_set_sign(float16_zero, sign);
+    }
+
+    /* frece(+-0) = +-inf */
+    if (float16_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float16_set_sign(float16_infinity, sign);
+    }
+
+    /* frece(sNaN) = canonical NaN */
+    if (float16_is_signaling_nan(f, s)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float16_default_nan(s);
+    }
+
+    /* frece(qNaN) = canonical NaN */
+    if (float16_is_quiet_nan(f, s)) {
+        return float16_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val = frece7(f, exp_size, frac_size, s);
+    return make_float16(val);
+}
+
+static float32 frece7_s(float32 f, float_status *s)
+{
+    int exp_size = 8, frac_size = 23;
+    bool sign = float32_is_neg(f);
+
+    /* frece(+-inf) = +-0 */
+    if (float32_is_infinity(f)) {
+        return float32_set_sign(float32_zero, sign);
+    }
+
+    /* frece(+-0) = +-inf */
+    if (float32_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float32_set_sign(float32_infinity, sign);
+    }
+
+    /* frece(sNaN) = canonical NaN */
+    if (float32_is_signaling_nan(f, s)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float32_default_nan(s);
+    }
+
+    /* frece(qNaN) = canonical NaN */
+    if (float32_is_quiet_nan(f, s)) {
+        return float32_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val = frece7(f, exp_size, frac_size, s);
+    return make_float32(val);
+}
+
+static float64 frece7_d(float64 f, float_status *s)
+{
+    int exp_size = 11, frac_size = 52;
+    bool sign = float64_is_neg(f);
+
+    /* frece(+-inf) = +-0 */
+    if (float64_is_infinity(f)) {
+        return float64_set_sign(float64_zero, sign);
+    }
+
+    /* frece(+-0) = +-inf */
+    if (float64_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float64_set_sign(float64_infinity, sign);
+    }
+
+    /* frece(sNaN) = canonical NaN */
+    if (float64_is_signaling_nan(f, s)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float64_default_nan(s);
+    }
+
+    /* frece(qNaN) = canonical NaN */
+    if (float64_is_quiet_nan(f, s)) {
+        return float64_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val = frece7(f, exp_size, frac_size, s);
+    return make_float64(val);
+}
+
+RVVCALL(OPFVV1, vfrece7_v_h, OP_UU_H, H2, H2, frece7_h)
+RVVCALL(OPFVV1, vfrece7_v_w, OP_UU_W, H4, H4, frece7_s)
+RVVCALL(OPFVV1, vfrece7_v_d, OP_UU_D, H8, H8, frece7_d)
+GEN_VEXT_V_ENV(vfrece7_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfrece7_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfrece7_v_d, 8, 8)
+
 /* Vector Floating-Point MIN/MAX Instructions */
 RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum_noprop)
 RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum_noprop)
-- 
2.17.1


