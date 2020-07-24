Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jylZV-0000MC-5f
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 20:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZR-0000ES-RQ
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:17 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZP-0008FD-TK
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:17 -0400
Received: by mail-pf1-x441.google.com with SMTP id a24so4061681pfc.10
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 17:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1utSzpi1MINPmUJjhg3agUHxuOyctwcD9LWDx9rrV3c=;
 b=BX3os+dBMrPKAVnAg6Hs3+uW5fHDk4sEPnmly9Wm6Vy3UAdxNxYbi/DQUPzxE0VFAe
 N2AAmSLNZCXoacFEZvUECt4t9ofGTm2TMO9VJPq9Q6Meit7cRM6LAsefIbwcZ1fCmtNc
 Vf0+y/SCIGkm9d0TzmtlTiNtcAngfGYbc2efADMQD4qMzmc/jBFXXfBTc2KECX7OGNOV
 kJk0kwhm6WoyYsG2OQZHD/3lCuyh0PkR7oyTXTBxgk5VdaSWVfWA77DzuAbpR0m16Gj5
 dU6fHkR2PSAWaNHVdLbFUIWOMWdnwvla3ngU0tduCVvdDTNQL+mEMLiNmII+G7+zyuyj
 hQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1utSzpi1MINPmUJjhg3agUHxuOyctwcD9LWDx9rrV3c=;
 b=q6ZU76DR8iNqkYkbMhEb01QSOZdoac/83hr68ukpo8Q/rEkT8HuqTGBvRQvlXWXRKC
 et1StYUFYllsvJIrvvVLDfS8W2MDoQ8FKGM4YTuKpGce/8bSwKUK2ChxY2zcKLg5SOe7
 8bqGa5kpFpEM1H/Aqt1dvNh8rdr689Ebcz1Eur8RJ1OaEkselTn5p7e567NVZLaqVyUZ
 IS44SGDJdou/EAJosdXrsXzrQYhJRiEIyDrienjM8BwuPK+lWBIe8VHvZv9hVTjH0V17
 7v5jIm2gBQ2u7awvey63Ix0Peux2btf1kWfzX+wfSGshT9lc4Zr8LM9WzE6ZWSH6AQgH
 yU8A==
X-Gm-Message-State: AOAM531vdkzpp6gcIZa17RLm48LBpLihDX4KkLY8ieSZNgfluNpU01F+
 0AwDY6ZQThdzvkjPc/7bR8eZVw==
X-Google-Smtp-Source: ABdhPJwpyHrRHNjXbT9AG9hrl2LW2N918UjbVD6bp5xBWR0k8zH1Axok4Rry+/JPzd7nh3mTRoQAqA==
X-Received: by 2002:a62:7847:: with SMTP id t68mr5716296pfc.112.1595550494530; 
 Thu, 23 Jul 2020 17:28:14 -0700 (PDT)
Received: from localhost.localdomain (216-160-65-90.tukw.qwest.net.
 [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id q20sm4224635pfn.111.2020.07.23.17.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 17:28:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, qemu-riscv@nongnu.org, alistair23@gmail.com,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 4/7] target/riscv: Check nanboxed inputs to fp helpers
Date: Thu, 23 Jul 2020 17:28:04 -0700
Message-Id: <20200724002807.441147-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724002807.441147-1-richard.henderson@linaro.org>
References: <20200724002807.441147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 24 Jul 2020 00:28:18 -0000

If a 32-bit input is not properly nanboxed, then the input is
replaced with the default qnan.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/internals.h  | 11 +++++++
 target/riscv/fpu_helper.c | 64 ++++++++++++++++++++++++++++-----------
 2 files changed, 57 insertions(+), 18 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 9f4ba7d617..f1a546dba6 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -43,4 +43,15 @@ static inline uint64_t nanbox_s(float32 f)
     return f | MAKE_64BIT_MASK(32, 32);
 }
 
+static inline float32 check_nanbox_s(uint64_t f)
+{
+    uint64_t mask = MAKE_64BIT_MASK(32, 32);
+
+    if (likely((f & mask) == mask)) {
+        return (uint32_t)f;
+    } else {
+        return 0x7fc00000u; /* default qnan */
+    }
+}
+
 #endif
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 72541958a7..bb346a8249 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,9 +81,12 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
 
-static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
-                           uint64_t frs3, int flags)
+static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
+                           uint64_t rs3, int flags)
 {
+    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs2 = check_nanbox_s(rs2);
+    float32 frs3 = check_nanbox_s(rs3);
     return nanbox_s(float32_muladd(frs1, frs2, frs3, flags, &env->fp_status));
 }
 
@@ -139,74 +142,97 @@ uint64_t helper_fnmadd_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                           float_muladd_negate_product, &env->fp_status);
 }
 
-uint64_t helper_fadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+uint64_t helper_fadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
+    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs2 = check_nanbox_s(rs2);
     return nanbox_s(float32_add(frs1, frs2, &env->fp_status));
 }
 
-uint64_t helper_fsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+uint64_t helper_fsub_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
+    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs2 = check_nanbox_s(rs2);
     return nanbox_s(float32_sub(frs1, frs2, &env->fp_status));
 }
 
-uint64_t helper_fmul_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+uint64_t helper_fmul_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
+    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs2 = check_nanbox_s(rs2);
     return nanbox_s(float32_mul(frs1, frs2, &env->fp_status));
 }
 
-uint64_t helper_fdiv_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+uint64_t helper_fdiv_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
+    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs2 = check_nanbox_s(rs2);
     return nanbox_s(float32_div(frs1, frs2, &env->fp_status));
 }
 
-uint64_t helper_fmin_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
+    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs2 = check_nanbox_s(rs2);
     return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
 }
 
-uint64_t helper_fmax_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
+    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs2 = check_nanbox_s(rs2);
     return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
 }
 
-uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t frs1)
+uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
 {
+    float32 frs1 = check_nanbox_s(rs1);
     return nanbox_s(float32_sqrt(frs1, &env->fp_status));
 }
 
-target_ulong helper_fle_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+target_ulong helper_fle_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
+    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs2 = check_nanbox_s(rs2);
     return float32_le(frs1, frs2, &env->fp_status);
 }
 
-target_ulong helper_flt_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
+    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs2 = check_nanbox_s(rs2);
     return float32_lt(frs1, frs2, &env->fp_status);
 }
 
-target_ulong helper_feq_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
+target_ulong helper_feq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
+    float32 frs1 = check_nanbox_s(rs1);
+    float32 frs2 = check_nanbox_s(rs2);
     return float32_eq_quiet(frs1, frs2, &env->fp_status);
 }
 
-target_ulong helper_fcvt_w_s(CPURISCVState *env, uint64_t frs1)
+target_ulong helper_fcvt_w_s(CPURISCVState *env, uint64_t rs1)
 {
+    float32 frs1 = check_nanbox_s(rs1);
     return float32_to_int32(frs1, &env->fp_status);
 }
 
-target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t frs1)
+target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)
 {
+    float32 frs1 = check_nanbox_s(rs1);
     return (int32_t)float32_to_uint32(frs1, &env->fp_status);
 }
 
 #if defined(TARGET_RISCV64)
-uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t frs1)
+uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
 {
+    float32 frs1 = check_nanbox_s(rs1);
     return float32_to_int64(frs1, &env->fp_status);
 }
 
-uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t frs1)
+uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
 {
+    float32 frs1 = check_nanbox_s(rs1);
     return float32_to_uint64(frs1, &env->fp_status);
 }
 #endif
@@ -233,8 +259,9 @@ uint64_t helper_fcvt_s_lu(CPURISCVState *env, uint64_t rs1)
 }
 #endif
 
-target_ulong helper_fclass_s(uint64_t frs1)
+target_ulong helper_fclass_s(uint64_t rs1)
 {
+    float32 frs1 = check_nanbox_s(rs1);
     return fclass_s(frs1);
 }
 
@@ -275,7 +302,8 @@ uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
 
 uint64_t helper_fcvt_d_s(CPURISCVState *env, uint64_t rs1)
 {
-    return float32_to_float64(rs1, &env->fp_status);
+    float32 frs1 = check_nanbox_s(rs1);
+    return float32_to_float64(frs1, &env->fp_status);
 }
 
 uint64_t helper_fsqrt_d(CPURISCVState *env, uint64_t frs1)
-- 
2.25.1


