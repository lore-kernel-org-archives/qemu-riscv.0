Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGEO-0007xv-LV
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEN-0007vA-MQ
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:51 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEL-0000Bu-6i
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:51 -0500
Received: by mail-pj1-x1035.google.com with SMTP id l23so1316147pjg.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iCgyc3zAl38PuPHog/CZHSNyO5v8qca36SYOLo9ioMA=;
 b=YPjBSdT/t8h8F+8EquCPNWUP9eCGcoEr/EzZIHgtWKXB4elT6IQmSvjAyrisEBcyn+
 Rhsih6S0Owi4tVaQc4xNFzJ7vq4pS/tVS36MYC4AOyH18ceLkBCCS6BJKys8sKTYESq2
 ufd5QcRmvtqZO3SEmJeHtc8cJZj+WV9AfPJzs68dprIZ65aWB/e6eTEL4cCdiaIkDjy9
 8YlmnNXxIqL2l5BUlWr8Z0RbL+2AXvLVdtxhEVazd4WfrJYtYDgX26yAaPfeean/u86D
 AQ4ljJLwDABqqC94U6ge0K4a5LHDsbwSBdthOKFQs+Y7bRzJJNcvX8/ptpCCDoOEarGt
 zYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iCgyc3zAl38PuPHog/CZHSNyO5v8qca36SYOLo9ioMA=;
 b=pPu+AOGdXWOOTZ1Vx6JOEp0wJ94hXV4CwsFxJI3O+UyhPBGSestX0yGr42P0rUeU71
 Gl9/HrzYHQwIbbGj5mJ3YUTc1ZeAXmXTDv9UTxXRwF4CbQ+hQwy0M4wgix3SGxMs6j4A
 41YmNtzrCkxEMaIoJ46pi462lNBagDNT/E3pIofJpCv/co82YLNjrVltbHfOEmtXJbWw
 rVBJvr2RdMRAmjIsJLPJAZY3pS1Dw417f1mJFisUMEE+FPILWaUoI+ExM5TMUZRp5lem
 oJPflU0lSzlGUQoW/5+FmRhI7ktzEH3Ve7fWbP2F2NJ7ewzJwB/oiMB4f2bidH3GmGa0
 n6Ug==
X-Gm-Message-State: AOAM532PXCN5z/THpN8bvIN2w7CHvQ5cgk7iAlhIhJBBpYooNn9PGMnk
 qAAqHqciwfFr7nnzBdlQc2zhqg==
X-Google-Smtp-Source: ABdhPJxhu+/WJ72/oWd5T7d1pA2A1g/vt/s8dnf4jQXrroJpwYgzvEuCNVxrRyVwLjrlFLCGx3fmlg==
X-Received: by 2002:a17:90b:3545:: with SMTP id
 lt5mr809183pjb.95.1610444687911; 
 Tue, 12 Jan 2021 01:44:47 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:47 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 70/72] target/riscv: rvv-1.0: floating-point reciprocal
 square-root estimate instruction
Date: Tue, 12 Jan 2021 17:39:44 +0800
Message-Id: <20210112093950.17530-71-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:44:52 -0000

From: Frank Chang <frank.chang@sifive.com>

Implement the floating-point reciprocal square-root estimate to 7 bits
instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |   4 +
 target/riscv/insn32.decode              |   1 +
 target/riscv/insn_trans/trans_rvv.c.inc |   1 +
 target/riscv/vector_helper.c            | 183 ++++++++++++++++++++++++
 4 files changed, 189 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 78f330b949e..4a08cdc547e 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -882,6 +882,10 @@ DEF_HELPER_5(vfsqrt_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfsqrt_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfsqrt_v_d, void, ptr, ptr, ptr, env, i32)
 
+DEF_HELPER_5(vfrsqrte7_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrsqrte7_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrsqrte7_v_d, void, ptr, ptr, ptr, env, i32)
+
 DEF_HELPER_6(vfmin_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f670c1282d8..530be388c1a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -535,6 +535,7 @@ vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
 vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfrsqrte7_v     010011 . ..... 00100 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2a3a437168f..f6fb4cbd144 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2638,6 +2638,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
 }
 
 GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
+GEN_OPFV_TRANS(vfrsqrte7_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index efa32565d9a..36f45e118f6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -18,6 +18,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
+#include "qemu/bitops.h"
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
@@ -3638,6 +3639,188 @@ GEN_VEXT_V_ENV(vfsqrt_v_h, 2, 2)
 GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8)
 
+/*
+ * Vector Floating-Point Reciprocal Square-Root Estimate Instruction
+ *
+ * Adapted from riscv-v-spec recip.cc:
+ * https://github.com/riscv/riscv-v-spec/blob/master/recip.cc
+ */
+static uint64_t frsqrte7(uint64_t f, int exp_size, int frac_size)
+{
+    bool sign = extract64(f, frac_size + exp_size, 1);
+    uint64_t exp = extract64(f, frac_size, exp_size);
+    uint64_t frac = extract64(f, 0, frac_size);
+
+    const uint8_t lookup_table[] = {
+        52, 51, 50, 48, 47, 46, 44, 43,
+        42, 41, 40, 39, 38, 36, 35, 34,
+        33, 32, 31, 30, 30, 29, 28, 27,
+        26, 25, 24, 23, 23, 22, 21, 20,
+        19, 19, 18, 17, 16, 16, 15, 14,
+        14, 13, 12, 12, 11, 10, 10, 9,
+        9, 8, 7, 7, 6, 6, 5, 4,
+        4, 3, 3, 2, 2, 1, 1, 0,
+        127, 125, 123, 121, 119, 118, 116, 114,
+        113, 111, 109, 108, 106, 105, 103, 102,
+        100, 99, 97, 96, 95, 93, 92, 91,
+        90, 88, 87, 86, 85, 84, 83, 82,
+        80, 79, 78, 77, 76, 75, 74, 73,
+        72, 71, 70, 70, 69, 68, 67, 66,
+        65, 64, 63, 63, 62, 61, 60, 59,
+        59, 58, 57, 56, 56, 55, 54, 53
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
+    }
+
+    int idx = ((exp & 1) << (precision - 1)) |
+                (frac >> (frac_size - precision + 1));
+    uint64_t out_frac = (uint64_t)(lookup_table[idx]) <<
+                            (frac_size - precision);
+    uint64_t out_exp = (3 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp) / 2;
+
+    uint64_t val = 0;
+    val = deposit64(val, 0, frac_size, out_frac);
+    val = deposit64(val, frac_size, exp_size, out_exp);
+    val = deposit64(val, frac_size + exp_size, 1, sign);
+    return val;
+}
+
+static float16 frsqrte7_h(float16 f, float_status *s)
+{
+    int exp_size = 5, frac_size = 10;
+    bool sign = float16_is_neg(f);
+
+    /*
+     * frsqrte(sNaN) = canonical NaN
+     * frsqrte(-inf) = canonical NaN
+     * frsqrte(-normal) = canonical NaN
+     * frsqrte(-subnormal) = canonical NaN
+     */
+    if (float16_is_signaling_nan(f, s) ||
+            (float16_is_infinity(f) && sign) ||
+            (float16_is_normal(f) && sign) ||
+            (float16_is_zero_or_denormal(f) && !float16_is_zero(f) && sign)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float16_default_nan(s);
+    }
+
+    /* frsqrte(qNaN) = canonical NaN */
+    if (float16_is_quiet_nan(f, s)) {
+        return float16_default_nan(s);
+    }
+
+    /* frsqrte(+-0) = +-inf */
+    if (float16_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float16_set_sign(float16_infinity, sign);
+    }
+
+    /* frsqrte(+inf) = +0 */
+    if (float16_is_infinity(f) && !sign) {
+        return float16_set_sign(float16_zero, sign);
+    }
+
+    /* +normal, +subnormal */
+    uint64_t val = frsqrte7(f, exp_size, frac_size);
+    return make_float16(val);
+}
+
+static float32 frsqrte7_s(float32 f, float_status *s)
+{
+    int exp_size = 8, frac_size = 23;
+    bool sign = float32_is_neg(f);
+
+    /*
+     * frsqrte(sNaN) = canonical NaN
+     * frsqrte(-inf) = canonical NaN
+     * frsqrte(-normal) = canonical NaN
+     * frsqrte(-subnormal) = canonical NaN
+     */
+    if (float32_is_signaling_nan(f, s) ||
+            (float32_is_infinity(f) && sign) ||
+            (float32_is_normal(f) && sign) ||
+            (float32_is_zero_or_denormal(f) && !float32_is_zero(f) && sign)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float32_default_nan(s);
+    }
+
+    /* frsqrte(qNaN) = canonical NaN */
+    if (float32_is_quiet_nan(f, s)) {
+        return float32_default_nan(s);
+    }
+
+    /* frsqrte(+-0) = +-inf */
+    if (float32_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float32_set_sign(float32_infinity, sign);
+    }
+
+    /* frsqrte(+inf) = +0 */
+    if (float32_is_infinity(f) && !sign) {
+        return float32_set_sign(float32_zero, sign);
+    }
+
+    /* +normal, +subnormal */
+    uint64_t val = frsqrte7(f, exp_size, frac_size);
+    return make_float32(val);
+}
+
+static float64 frsqrte7_d(float64 f, float_status *s)
+{
+    int exp_size = 11, frac_size = 52;
+    bool sign = float64_is_neg(f);
+
+    /*
+     * frsqrte(sNaN) = canonical NaN
+     * frsqrte(-inf) = canonical NaN
+     * frsqrte(-normal) = canonical NaN
+     * frsqrte(-subnormal) = canonical NaN
+     */
+    if (float64_is_signaling_nan(f, s) ||
+            (float64_is_infinity(f) && sign) ||
+            (float64_is_normal(f) && sign) ||
+            (float64_is_zero_or_denormal(f) && !float64_is_zero(f) && sign)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float64_default_nan(s);
+    }
+
+    /* frsqrte(qNaN) = canonical NaN */
+    if (float64_is_quiet_nan(f, s)) {
+        return float64_default_nan(s);
+    }
+
+    /* frsqrte(+-0) = +-inf */
+    if (float64_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float64_set_sign(float64_infinity, sign);
+    }
+
+    /* frsqrte(+inf) = +0 */
+    if (float64_is_infinity(f) && !sign) {
+        return float64_set_sign(float64_zero, sign);
+    }
+
+    /* +normal, +subnormal */
+    uint64_t val = frsqrte7(f, exp_size, frac_size);
+    return make_float64(val);
+}
+
+RVVCALL(OPFVV1, vfrsqrte7_v_h, OP_UU_H, H2, H2, frsqrte7_h)
+RVVCALL(OPFVV1, vfrsqrte7_v_w, OP_UU_W, H4, H4, frsqrte7_s)
+RVVCALL(OPFVV1, vfrsqrte7_v_d, OP_UU_D, H8, H8, frsqrte7_d)
+GEN_VEXT_V_ENV(vfrsqrte7_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfrsqrte7_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfrsqrte7_v_d, 8, 8)
+
 /* Vector Floating-Point MIN/MAX Instructions */
 RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum_noprop)
 RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum_noprop)
-- 
2.17.1


