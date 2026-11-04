Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CD96083608
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ZKg8gun7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgst-0002Uk-0Y; Wed, 04 Nov 2026 14:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsQ-0002CV-MF
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:32 -0500
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsO-0002JM-CC
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:30 -0500
Received: by mail-dl1-x1229.google.com with SMTP id
 a92af1059eb24-1a3c08d6928so1752199c88.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821347; x=1794426147; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2NABy6KtqliH5i+c93gTPeFMXkmj/4e6tuIau6Do5Yc=;
 b=ZKg8gun7p0VkFMj+oU6JFtkAvlfjIgIdvhbcSi395lVCIaLjjFIBML2lvPfaW7U3y5
 BYqh7x68FCUy/FURnXdewf69EEbB947xKWhjTlBAri7gKhaKw2D5BvnhDnm94wgDUDpR
 PyhlZV07R6qOetVo2JyRsso/nQ9yZk1vcOupo+fgPsY2EtcsQti7gO6mtgIU7mtjqAc2
 WGZKX5gq7dI4ByWtqpfVc29pMuh7bBoTH8Muy84cUnZdh3CiDNqkLevPe165R1e7VVCg
 qnakGOHWhqBwZOBk6Wy/Vv11zhGzG9miudIImHNfUayV9+jkXaw5SuhXb6m9cyQjssup
 D2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821347; x=1794426147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2NABy6KtqliH5i+c93gTPeFMXkmj/4e6tuIau6Do5Yc=;
 b=SlkKvVjudZqT8FzYrEBIGCxV/Hmi/s7Q3G6HTXfDmIfgm18acegePwHIyLPhwBTAIC
 v6gqf1RdY82Pjc2lxU2hHog/ShEDeb3tvcg6iuxsVruZ7efNsLp5cPl5o70OmdUYhphv
 O4RaK1Fr0Z9bzYYF3J8zRlh2nTYEaUxe/HwXklQX/8erz52WpG+llMY+Se9cLoki/yCk
 xu5Lj1E+SP4RhEU7c+fM2E710ojWJ/R+59Ci0Act2/siinLfjB0Y487jwsgwciINnGXh
 EbX+gXjGDq58nxIeUBbPW2D70iM4qfi7D+R05E7EXWA1TXPcSeEte4icnpBtunvh1RMh
 ZXzg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEcBzwtoHUC4wqihmAXpO2OWWvmENiRd8Kcfid7qw2LKN36Fg0J3X/7igIU70J6sNHy+u9w2P0KZdp@nongnu.org
X-Gm-Message-State: APuU4Z8inK1fnDyCm3ZIwjk2dnoYKXYS/iPWNTThuLyvbjMq5UAezYKz
 sEhgiHUgvcCUkgJFPr36GnTbiC1xS5JQgexRvgjP6fGTzD3AcHMQPwE7vMmgWIoUARg=
X-Gm-Gg: AYBFou1u4rHBHF5WlSNX6B3lg9EkfM8j0Cw4XcXdullYrRIYRgwVMjZDHQ6VrCWw1nj
 eOIqCNIHkRH3cif5enLcx2wEZ76PJQNMGXQFn+YCnuuUjUv1ST0Ow6n1/W0crpR/hbAvCFF9BHJ
 eLOO0Qlq2JGpK9NHeZtpZ7EYCHycpNzlxjPgDLyZh5PAkChj+zOrFrscE4g/Mzo/CLh9Lt3vaS3
 Dkq7Gsp3nENNhWPBcpNrI2I73JBr+CYUmtOdOH0RNMkx9TR3XXBnMdukYFaUcWgWWEfcoaLaqll
 0DzIauUIU+2EOIS51XCh4H5l+oINYJoYncGObnVTRDuFmOu1Tu4njGkYprRd6sE5k7nRK8GnWzD
 HqjbH7PW+3+64qD6FwKO2+i5bmvkVd/S41cyxvoAQyY/enV19mvK5C8ZDwkMLDjs0XfjjGcLhgk
 9V3BDy20QhKo52Kn44UEqRK+kpLBb0e4/J6XO0cON2rC/zfiXq+IE1XOi08p05305VneXhdf4CE
 HCZH3tV5V+ypvRil5GVu0wFYD+ZN+kHElFdyMdvxVKiaRjfxFWlrBgKd1MyYe8vPPAy5SMb1peN
 EaPxNMMzUrBTL7AeyI4fHTU25Zfpw5G0tKOdaVnR96yVXLfk/oy/7zOvvyQ19OcBJ6auIJSX72u
 dy5M1QgLVcHhCKAAdMgOmv19o79EA
X-Received: by 2002:a05:7022:1509:b0:151:f0c5:7a09 with SMTP id
 a92af1059eb24-1ac5e22adbamr28773524c88.43.1793821346443; 
 Wed, 04 Nov 2026 11:42:26 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:26 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 03/38] target/riscv: rvv: Introduce RVBNA algorithm for
 Zvdota/Zvbdota extensions
Date: Thu,  5 Nov 2026 03:41:18 +0800
Message-ID: <20261104194155.679241-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1229;
 envelope-from=max.chou@sifive.com; helo=mail-dl1-x1229.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RISC-V Bulk Normalization Algorithm (RVBNA) is a scheme employed by
multiple RISC-V extensions (e.g. Zvdota/Zvbdota family) for efficient
computation of floating-point dot products.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 MAINTAINERS                      |   6 +
 target/riscv/tcg/meson.build     |   2 +-
 target/riscv/tcg/rvbna.c         | 185 +++++++++++++++++++++++++++++++
 target/riscv/tcg/rvbna.h         |  40 +++++++
 target/riscv/tcg/vector_helper.c |   1 +
 5 files changed, 233 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/tcg/rvbna.c
 create mode 100644 target/riscv/tcg/rvbna.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 55463103ff1..b91e5925344 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -416,6 +416,12 @@ F: target/riscv/tcg/xsf_helper.c
 F: disas/riscv-xsf*
 F: tests/tcg/riscv64/test-xsfvqmacc.S
 
+RISC-V Bulk Normalization Algorithm (RVBNA)
+M: Max Chou <max.chou@sifive.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: target/riscv/tcg/rvbna.*
+
 RENESAS RX CPUs
 R: Yoshinori Sato <yoshinori.sato@nifty.com>
 S: Orphan
diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
index 86805b30cbc..3b7821178fc 100644
--- a/target/riscv/tcg/meson.build
+++ b/target/riscv/tcg/meson.build
@@ -10,6 +10,7 @@ riscv_ss.add(files(
   'fpu_helper.c',
   'm128_helper.c',
   'op_helper.c',
+  'rvbna.c',
   'translate.c',
   'tcg-cpu.c',
   'vcrypto_helper.c',
@@ -27,4 +28,3 @@ riscv_system_ss.add(files(
   'th_csr.c',
 ))
 
-
diff --git a/target/riscv/tcg/rvbna.c b/target/riscv/tcg/rvbna.c
new file mode 100644
index 00000000000..f6150e4976d
--- /dev/null
+++ b/target/riscv/tcg/rvbna.c
@@ -0,0 +1,185 @@
+/*
+ * RISC-V Bulk Normalization Algorithm (RVBNA)
+ *
+ * Copyright (c) 2026 SiFive, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "qemu/host-utils.h"
+#include "fpu/softfloat.h"
+#include "fpu/softfloat-macros.h"
+#include "rvbna.h"
+
+static inline int rvbna_guard_bits(uint32_t n_prod)
+{
+    g_assert(n_prod > 0);
+    return 32 - clz32(n_prod - 1);
+}
+
+float32 rvbna_final_f32_add(float32 partial, float32 accumulator,
+                            float_status *fp_status)
+{
+    FloatRoundMode old_rm = get_float_rounding_mode(fp_status);
+    int old_flags = get_float_exception_flags(fp_status);
+    int new_flags;
+    float32 result;
+
+    set_float_rounding_mode(float_round_to_odd_inf, fp_status);
+    set_float_exception_flags(0, fp_status);
+    result = float32_add(partial, accumulator, fp_status);
+    new_flags = get_float_exception_flags(fp_status) &
+                (float_flag_invalid | float_flag_overflow);
+    set_float_rounding_mode(old_rm, fp_status);
+    set_float_exception_flags(old_flags | new_flags, fp_status);
+
+    return result;
+}
+
+#define RVBNA_STACK_THRESHOLD 8
+
+#define GEN_RVBNA(TA, TB, TO, A_E, A_M, B_E, B_M, OUT_E, OUT_M)              \
+TO rvbna_dot_##TA##_##TB(const TA a[], const TB b[], uint32_t n_prod,        \
+                         float_status *fp_status)                            \
+{                                                                            \
+    int32_t stack_ref_exps[RVBNA_STACK_THRESHOLD];                           \
+    bool stack_signs[RVBNA_STACK_THRESHOLD];                                 \
+    uint64_t stack_sigs[RVBNA_STACK_THRESHOLD];                              \
+    int32_t *prod_ref_exps = stack_ref_exps;                                 \
+    bool *prod_signs = stack_signs;                                          \
+    uint64_t *prod_sigs = stack_sigs;                                        \
+    g_autofree int32_t *heap_ref_exps = NULL;                                \
+    g_autofree bool *heap_signs = NULL;                                      \
+    g_autofree uint64_t *heap_sigs = NULL;                                   \
+    int guard_bits = rvbna_guard_bits(n_prod);                               \
+    int pad = OUT_M - (A_M + B_M) + guard_bits;                              \
+    int output_bias = (1 << (OUT_E - 1)) - 1;                                \
+    int a_exp_bias = (1 << (A_E - 1)) - 1;                                   \
+    int b_exp_bias = (1 << (B_E - 1)) - 1;                                   \
+    int ref_bias = output_bias - (a_exp_bias + b_exp_bias);                  \
+    int max_prod_ref_exp = ref_bias;                                         \
+    int overflow_exp = (1 << OUT_E) - 1;                                     \
+    int64_t acc = 0;                                                         \
+    bool nan_result = false;                                                 \
+    bool inf_result = false;                                                 \
+    bool inf_sign = false;                                                   \
+    bool any_pos_inf = false;                                                \
+    bool any_neg_inf = false;                                                \
+    bool any_invalid_prod = false;                                           \
+    bool any_signan = false;                                                 \
+    bool op_sign_inf, sign, overflow;                                        \
+    uint32_t i;                                                              \
+    uint64_t sig;                                                            \
+    int lead, exp, sig_bits;                                                 \
+                                                                             \
+    g_assert(pad >= 0);                                                      \
+    if (n_prod > RVBNA_STACK_THRESHOLD) {                                    \
+        heap_ref_exps = g_new(int32_t, n_prod);                              \
+        heap_signs = g_new(bool, n_prod);                                    \
+        heap_sigs = g_new(uint64_t, n_prod);                                 \
+        prod_ref_exps = heap_ref_exps;                                       \
+        prod_signs = heap_signs;                                             \
+        prod_sigs = heap_sigs;                                               \
+    }                                                                        \
+                                                                             \
+    for (i = 0; i < n_prod; i++) {                                           \
+        bool a_sign = TA##_is_neg(a[i]);                                     \
+        bool b_sign = TB##_is_neg(b[i]);                                     \
+        bool a_sub = TA##_is_zero_or_denormal(a[i]);                         \
+        bool b_sub = TB##_is_zero_or_denormal(b[i]);                         \
+        bool a_zero = TA##_is_zero(a[i]);                                    \
+        bool b_zero = TB##_is_zero(b[i]);                                    \
+        bool a_inf = TA##_is_infinity(a[i]);                                 \
+        bool b_inf = TB##_is_infinity(b[i]);                                 \
+        bool a_nan = TA##_is_any_nan(a[i]);                                  \
+        bool b_nan = TB##_is_any_nan(b[i]);                                  \
+        bool prod_sign = a_sign ^ b_sign;                                    \
+        bool invalid_prod = (a_inf && b_zero) || (b_inf && a_zero);          \
+        bool inf_prod_lhs = a_inf && !b_nan && !b_zero;                      \
+        bool inf_prod_rhs = b_inf && !a_nan && !a_zero;                      \
+        bool inf_prod = inf_prod_lhs || inf_prod_rhs;                        \
+        bool invalid_sum = inf_result && inf_prod &&                         \
+                           (inf_sign != prod_sign);                          \
+        uint32_t a_mant = extract32(a[i], 0, A_M);                           \
+        uint32_t b_mant = extract32(b[i], 0, B_M);                           \
+        bool a_signan = a_nan && TA##_is_signaling_nan(a[i], fp_status);     \
+        bool b_signan = b_nan && TB##_is_signaling_nan(b[i], fp_status);     \
+        uint64_t a_sig = a_mant | (!a_sub << A_M);                           \
+        uint64_t b_sig = b_mant | (!b_sub << B_M);                           \
+        bool prod_is_zero = a_zero || b_zero;                                \
+        bool either_inf = a_inf || b_inf;                                    \
+        bool either_nan = a_nan || b_nan;                                    \
+                                                                             \
+        any_invalid_prod |= invalid_prod;                                    \
+        nan_result |= a_nan || b_nan || any_invalid_prod || invalid_sum;     \
+        inf_result |= inf_prod;                                              \
+        inf_sign = inf_prod ? prod_sign : inf_sign;                          \
+                                                                             \
+        prod_signs[i] = prod_sign;                                           \
+        prod_sigs[i] = (uint64_t)(a_sig * b_sig) << pad;                     \
+        prod_ref_exps[i] = ref_bias;                                         \
+        if (!prod_is_zero) {                                                 \
+            prod_ref_exps[i] += (a_sub ? 1 : extract32(a[i], A_M, A_E)) +    \
+                                (b_sub ? 1 : extract32(b[i], B_M, B_E));     \
+        }                                                                    \
+        max_prod_ref_exp = MAX(prod_ref_exps[i], max_prod_ref_exp);          \
+                                                                             \
+        any_pos_inf |= (either_inf && !either_nan && !prod_is_zero &&        \
+                        (a_sign == b_sign));                                 \
+        any_neg_inf |= (either_inf && !either_nan && !prod_is_zero &&        \
+                        (a_sign != b_sign));                                 \
+        any_signan |= a_signan || b_signan;                                  \
+    }                                                                        \
+                                                                             \
+    op_sign_inf = any_pos_inf && any_neg_inf;                                \
+                                                                             \
+    if (nan_result) {                                                        \
+        if (any_signan || any_invalid_prod || op_sign_inf) {                 \
+            float_raise(float_flag_invalid, fp_status);                      \
+        }                                                                    \
+        return TO##_default_nan(fp_status);                                  \
+    } else if (inf_result) {                                                 \
+        return TO##_set_sign(TO##_infinity, inf_sign);                       \
+    }                                                                        \
+                                                                             \
+    for (i = 0; i < n_prod; i++) {                                           \
+        shift64RightJamming(prod_sigs[i],                                    \
+                            max_prod_ref_exp - prod_ref_exps[i], &sig);      \
+        acc += prod_signs[i] ? -(int64_t)sig : (int64_t)sig;                 \
+    }                                                                        \
+                                                                             \
+    sign = acc < 0;                                                          \
+    sig = sign ? -(uint64_t)acc : acc;                                       \
+    if (sig == 0) {                                                          \
+        return 0;                                                            \
+    }                                                                        \
+                                                                             \
+    lead = 63 - clz64(sig);                                                  \
+    exp = max_prod_ref_exp - OUT_M - guard_bits + lead;                      \
+    overflow = exp >= overflow_exp;                                          \
+    if (overflow) {                                                          \
+        float_raise(float_flag_overflow, fp_status);                         \
+        sig = 0;                                                             \
+        exp = overflow_exp;                                                  \
+    } else {                                                                 \
+        sig_bits = MAX(0, exp <= 0 ? OUT_M - (1 - exp) : OUT_M);             \
+        if (lead > sig_bits) {                                               \
+            shift64RightJamming(sig, lead - sig_bits, &sig);                 \
+        } else {                                                             \
+            sig <<= (sig_bits - lead);                                       \
+        }                                                                    \
+        exp = MAX(exp, 0);                                                   \
+    }                                                                        \
+    return (TO)deposit64(deposit64(sig, OUT_M, OUT_E, exp),                  \
+                         OUT_M + OUT_E,                                      \
+                         1, sign);                                           \
+}
+
+GEN_RVBNA(float8_e4m3, float8_e4m3, float32, 4, 3, 4, 3, 8, 23)
+GEN_RVBNA(float8_e4m3, float8_e5m2, float32, 4, 3, 5, 2, 8, 23)
+GEN_RVBNA(float8_e5m2, float8_e4m3, float32, 5, 2, 4, 3, 8, 23)
+GEN_RVBNA(float8_e5m2, float8_e5m2, float32, 5, 2, 5, 2, 8, 23)
+GEN_RVBNA(float16, float16, float32, 5, 10, 5, 10, 8, 23)
+GEN_RVBNA(bfloat16, bfloat16, float32, 8, 7, 8, 7, 8, 23)
diff --git a/target/riscv/tcg/rvbna.h b/target/riscv/tcg/rvbna.h
new file mode 100644
index 00000000000..d4d3eced952
--- /dev/null
+++ b/target/riscv/tcg/rvbna.h
@@ -0,0 +1,40 @@
+/*
+ * RISC-V Bulk Normalization Algorithm (RVBNA)
+ *
+ * Copyright (c) 2026 SiFive, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef TARGET_RISCV_TCG_RVBNA_H
+#define TARGET_RISCV_TCG_RVBNA_H
+
+#include "fpu/softfloat.h"
+
+float32 rvbna_final_f32_add(float32 partial, float32 accumulator,
+                            float_status *fp_status);
+
+float32 rvbna_dot_float8_e4m3_float8_e4m3(const float8_e4m3 a[],
+                                          const float8_e4m3 b[],
+                                          uint32_t n_prod,
+                                          float_status *fp_status);
+float32 rvbna_dot_float8_e4m3_float8_e5m2(const float8_e4m3 a[],
+                                          const float8_e5m2 b[],
+                                          uint32_t n_prod,
+                                          float_status *fp_status);
+float32 rvbna_dot_float8_e5m2_float8_e4m3(const float8_e5m2 a[],
+                                          const float8_e4m3 b[],
+                                          uint32_t n_prod,
+                                          float_status *fp_status);
+float32 rvbna_dot_float8_e5m2_float8_e5m2(const float8_e5m2 a[],
+                                          const float8_e5m2 b[],
+                                          uint32_t n_prod,
+                                          float_status *fp_status);
+float32 rvbna_dot_float16_float16(const float16 a[], const float16 b[],
+                                  uint32_t n_prod,
+                                  float_status *fp_status);
+float32 rvbna_dot_bfloat16_bfloat16(const bfloat16 a[], const bfloat16 b[],
+                                    uint32_t n_prod,
+                                    float_status *fp_status);
+
+#endif
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 917a48b5106..172ae0f11dc 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -31,6 +31,7 @@
 #include "tcg/tcg-gvec-desc.h"
 #include "internals.h"
 #include "vector_internals.h"
+#include "rvbna.h"
 #include <math.h>
 
 static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
-- 
2.56.0


