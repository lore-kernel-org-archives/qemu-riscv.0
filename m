Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvapn-0000i8-Ft
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapc-0000Xo-1c
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:41 -0500
Received: from [2607:f8b0:4864:20::1030] (port=37471
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapZ-0007eu-FV
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:39 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so8864368pjb.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XUpRDoMr5nohYMpF+ZK03tttThvFJWcTr3WQRTG0o3Y=;
 b=Pgd29W9KBu6Cs9Nwps4d1PLVFUPZhXidZn0EcmdvIcNbWA2Yk0XVHBjMXUf/fIqbKq
 ZwLDirCHtBJPQJdkbtGPnpN0FOMEaFhhFfGkkeRx70H89RA1Adub2BYHpS3j4V5I8Vcb
 ZT9KI6qh1naazRVen6IPvQN+AUmfXVw63232SsT2GNbxoxr5ucicXX+kJNxrFMYGrGGg
 aofCC2sXXCdM9NcvwuosVp9XVeZgaCb2u9ssizGMrnqL0xyObmbIh0JekJSWsW9Qbbja
 1vOn2hvkRWOplj0hi1kQuRl+LWjL+6hF9o8RYcHFtzgBUjny4va6ZzQLkNOAsnBZrE2Q
 a6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XUpRDoMr5nohYMpF+ZK03tttThvFJWcTr3WQRTG0o3Y=;
 b=6fHGRuMiiZXwNhNQKMsmqueD3cl7+OSvMIH7QxzeSMKaYjSQ8qywDM+GoIXrHVtFpy
 6osgxDaKcaRKIgmOmNqMb/E/HADj3ms7gLkFTM7y168zVBjZx/AI/yL5N8C6kkZanzpY
 ORQh95CYm3kRD9MGWeF4q+lKkF1vNie4I5exNgX/YmyHb+EeKsHTTypxbetE2GllX3lY
 Bxe2cquK5MsSE0WU4DgZZ/ecdREAda26K5nMI5git492kSS1hDuwdjSt5bem8GqPvFcg
 aJvsia8HegL9TJ523nwyh4vPHkEzHpAUNYMwR2rPl1N4XXavk5XHIn5kd5KoAzJv0DQZ
 k1fA==
X-Gm-Message-State: AOAM533U6Nsm0mXHb1IjtfdS9/VY+uhv0/eWtSriGh8b8DEXZ/ySTyUW
 ECqYM33UZz+dctuL3BQBtWuMXw==
X-Google-Smtp-Source: ABdhPJz8z2518RAOSNjD7rFRyeQRdRBTIQAoHGS7LADHz4NKP2zpNzse44VTkVJMRlyS/qvL6zHi9w==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr22041046pjb.36.1639123236228; 
 Fri, 10 Dec 2021 00:00:36 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:35 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 70/77] target/riscv: rvv-1.0: floating-point reciprocal
 estimate instruction
Date: Fri, 10 Dec 2021 15:56:56 +0800
Message-Id: <20211210075704.23951-71-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:42 -0000

From: Frank Chang <frank.chang@sifive.com>

Implement the floating-point reciprocal estimate to 7 bits instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |   4 +
 target/riscv/insn32.decode              |   1 +
 target/riscv/insn_trans/trans_rvv.c.inc |   1 +
 target/riscv/vector_helper.c            | 191 ++++++++++++++++++++++++
 4 files changed, 197 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index bdf06dfb24..ab283d12b7 100644
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
index 6e5f288943..952768f8de 100644
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
index 8fe718610a..ff8f6df8f7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2408,6 +2408,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
 
 GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
 GEN_OPFV_TRANS(vfrsqrt7_v, opfv_check, RISCV_FRM_DYN)
+GEN_OPFV_TRANS(vfrec7_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d5f3229bcb..946dca53ff 100644
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
2.31.1


