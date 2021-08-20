Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8YG-0005tq-O9
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YA-0005d8-3N
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:26 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Y5-0003wJ-Ss
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:25 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y11so9226471pfl.13
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kD7mJuftY22HTobeiFgod9RkHOG3VKFi3PUsGZtJYQ0=;
 b=ozFyskzmIpqP3oO7tYmjLKMwDEyint9ZiVpfxcrADM/CveIFhfqPB2ryFtn6fBlj6x
 jv2IMWRG4EEoYNCYujvDJduVH8ZzVYj3gw7fw0DrABcBWCEQpk2Fa/TkoRoZNpR1PHrj
 XjWp+nvENS4Wce8yOH4O23PwoqmGTZkACWhryukOyXTX4S9nlQhodaPdeA9rAaapyPZZ
 i1F90/1qhpqFXqrIgfyVmJTbTDcRwxU/1EAXmx9rLaJjX+EAL6H9JR13SSDvwz0uAX91
 A9iXWcfHeQkuzfBm+Y9fOkJ2hpUQsB4t5+V96inEqtfSXK5+6GtTP/7zwgCHAeeEpjyV
 1inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kD7mJuftY22HTobeiFgod9RkHOG3VKFi3PUsGZtJYQ0=;
 b=pFQMrZLrtB3a53qBNR6yfQvCwHe9amSotWP0zYWLo+jeeJmtVmc/i6v29YQ1b5MBsd
 6SDzfqhZ1ihASWif692T53B61JDs2HtipN30dC/AerJeBAMIhDj96JoS7YdT0HqivbeT
 69XMk/X/J19hrfVGrU0hTM1cKf8CfT7s5Shq06F4Lm/fhaDEc6nUV6gVbIGcxgL8zk9N
 Z6rEHVTq72KDmOiKjB5mpEWVASY//O6M2YR58xOJ2Gf35U4pYb94W4w4lgCrwem072B2
 Ht6s6uG8yeDu6bRAOj97dPJePSsH4lN8CUqqbL2TTbl61WsPSXpbjxx9a8xYKTqV2kUU
 w1yA==
X-Gm-Message-State: AOAM531fmpsn6DLFv2bgIKh+2H09hSQ8UIZvMbMQZRZTW1fLseA2V4hV
 KfQpi21LnA0oyalEeK1cZhZ7uA==
X-Google-Smtp-Source: ABdhPJw3eLJuMnNQczQYGW9zKTnECCJAzlLYc4r0BbOEcIc5gWwadzUenwNgbPBB907+1xdX1skz8Q==
X-Received: by 2002:a62:b414:0:b029:32e:3ef0:7735 with SMTP id
 h20-20020a62b4140000b029032e3ef07735mr20965115pfn.61.1629481398529; 
 Fri, 20 Aug 2021 10:43:18 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	bin.meng@windriver.com,
	alistair.francis@wdc.com
Subject: [PATCH v4 11/21] target/riscv: Add DisasExtend to gen_unary
Date: Fri, 20 Aug 2021 07:42:47 -1000
Message-Id: <20210820174257.548286-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:26 -0000

Use ctx->w for ctpopw, which is the only one that can
re-use the generic algorithm for the narrow operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 14 ++++++--------
 target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++---------------
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 09853530c4..785e9e58cc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -478,17 +478,15 @@ static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
     return true;
 }
 
-static bool gen_unary(DisasContext *ctx, arg_r2 *a,
-                      void(*func)(TCGv, TCGv))
+static bool gen_unary(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
+                      void (*func)(TCGv, TCGv))
 {
-    TCGv source = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
 
-    gen_get_gpr(ctx, source, a->rs1);
+    func(dest, src1);
 
-    (*func)(source, source);
-
-    gen_set_gpr(ctx, a->rd, source);
-    tcg_temp_free(source);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 73f088be23..e255678fff 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -26,7 +26,7 @@ static void gen_clz(TCGv ret, TCGv arg1)
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_clz);
+    return gen_unary(ctx, a, EXT_ZERO, gen_clz);
 }
 
 static void gen_ctz(TCGv ret, TCGv arg1)
@@ -37,13 +37,13 @@ static void gen_ctz(TCGv ret, TCGv arg1)
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_ctz);
+    return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
 }
 
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
+    return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
 
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
@@ -132,13 +132,13 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ext8s_tl);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8s_tl);
 }
 
 static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, tcg_gen_ext16s_tl);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16s_tl);
 }
 
 static void gen_sbop_mask(TCGv ret, TCGv shamt)
@@ -366,7 +366,6 @@ GEN_TRANS_SHADD(3)
 
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_ext32u_tl(ret, arg1);
     tcg_gen_clzi_tl(ret, ret, 64);
     tcg_gen_subi_tl(ret, ret, 32);
 }
@@ -375,7 +374,7 @@ static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_clzw);
+    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
 }
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -388,20 +387,15 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_ctzw);
-}
-
-static void gen_cpopw(TCGv ret, TCGv arg1)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    tcg_gen_ctpop_tl(ret, arg1);
+    return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
 }
 
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, gen_cpopw);
+    ctx->w = true;
+    return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
 
 static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
-- 
2.25.1


