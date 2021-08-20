Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8YG-0005rn-9O
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Y8-0005X6-FC
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:24 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xy-0003rr-RF
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:24 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so7787273pjb.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXJ3guWqlzaqn0iKN8apboyIQBkxnjeF9Y5TujOH5pQ=;
 b=tH9db2lLsNnOQXymS3hLsyJVZMl1v+qkVFcBOGDy/uHorB3Q82lyvBpNdymZ5Phl/e
 qtpFYGvYIU7NUIw4UfSQy4wXY+TfylkwWuRhtCgqDJsCJV2imE94dmwC+NaJS9W1GGpj
 a0XQqth0i5WEyuMVkToIxb0yV+KjvZ5hV6iyoOkMB7VDixZHgpwZBHfubtZJdsR2++26
 CWGdw481LX4Oc5p177JDj46wMHcFgC6vFcthpyyzNB2reLlRCjzJzooghRTqXL2rdfx6
 GUWbUNb0mMM/Nboxr2zK59HkDefqoA7ZOAwcv7xe6wu6O/56ErT93A8JukDq6FH0joR+
 zmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nXJ3guWqlzaqn0iKN8apboyIQBkxnjeF9Y5TujOH5pQ=;
 b=gm3sm4Zaaq1mavcyf2TJuJyAGmQZJdcUCJotq3RDbZixxMpxuUbva1GrDkK8x0YEJf
 4Oz/hDrVQ3jdLoU/Z3aqIIZ6Vb208FhmDRfqKxzODqeqRV0CndE3LVcNAMcHh9Tv7DuN
 q+LMvKUQis2uXTDpXUnAvxXaILHgMrQw1rE0LUCl9BGDIbMXaD8HxfgJoD51xLAq3dGi
 +CbG3QR2PrBQoxtVIuec9HacilnXAN4optVd0m27H3e9xIDX+dA/KvE+vkO8vBhQpqKa
 3FkGuDp3O2NlPqx0DR4dD56gaMUaLfcX60EywxdlW10Aqj+MLbiDUyDnE+3Aw9KvFShQ
 6iCw==
X-Gm-Message-State: AOAM532BavePgf9QiD94Aw13tx5amcSFdu7XMbFauuNUdKvI3CLA2hlI
 Q2R3IilT2uPkTpTb7KPXq8BAruAJWq2MLw==
X-Google-Smtp-Source: ABdhPJx0iYOYgiZd5zODSha9PdZWbqoU2+CeRCmHncLLvP7Se5dL1jOqz3FLVavchPRo7m0lq5fBxw==
X-Received: by 2002:a17:902:8c90:b0:12f:699b:27 with SMTP id
 t16-20020a1709028c9000b0012f699b0027mr10849804plo.28.1629481392178; 
 Fri, 20 Aug 2021 10:43:12 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 07/21] target/riscv: Remove gen_arith_div*
Date: Fri, 20 Aug 2021 07:42:43 -1000
Message-Id: <20210820174257.548286-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:24 -0000

Use ctx->w and the enhanced gen_arith function.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 42 -------------------------
 target/riscv/insn_trans/trans_rvm.c.inc | 16 +++++-----
 2 files changed, 8 insertions(+), 50 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7dd2839288..1855eacbac 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -507,48 +507,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
     return true;
 }
 
-static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
-                            void(*func)(TCGv, TCGv, TCGv))
-{
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-    tcg_gen_ext32s_tl(source1, source1);
-    tcg_gen_ext32s_tl(source2, source2);
-
-    (*func)(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
-}
-
-static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
-                            void(*func)(TCGv, TCGv, TCGv))
-{
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-    tcg_gen_ext32u_tl(source1, source1);
-    tcg_gen_ext32u_tl(source2, source2);
-
-    (*func)(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
-}
-
 static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_deposit_tl(ret, arg1, arg2,
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 013b3f7009..3d93b24c25 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -99,30 +99,30 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_w(ctx, a, &gen_div);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_uw(ctx, a, &gen_divu);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_w(ctx, a, &gen_rem);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_uw(ctx, a, &gen_remu);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
 }
-- 
2.25.1


