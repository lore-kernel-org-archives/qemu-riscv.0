Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG6TW-0001KT-Mv
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 17:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TU-0001Cy-Lg
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:20 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:39704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TS-00015q-2t
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:20 -0400
Received: by mail-pf1-x434.google.com with SMTP id t13so5173pfl.6
 for <qemu-riscv@nongnu.org>; Tue, 17 Aug 2021 14:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VfaTNl6cZJeuhpoWMW6b1lJ/gL2AkVre0lGbvDe+dvQ=;
 b=UND8A57WXN1a7YFdKXdeJNup1uzGMa7pf8H3ejNaffID9qtwq2PWTfC9p5hA4xuIUC
 QKTZATkr7/vL4oZSr6AKZfpdUGX7UZPsR6zvQY+5nF3JMz4bGgqPKAZwcAtRZgjhCuho
 neCo5CGlcSMpiMl1XclH6vsoo+EsyuwVOsCVLg2jdIklNJuWLtj7qNa2349nb2vuKkfR
 +2ehTl9FLquICbb3XCvnuzrxM/tj8lArNdMSDHlaoyxiO3BfumI/A5DzQMzS22OJhS9L
 iwtB8kTvFsmwapiGifa6bKJoTlG8kPyL9B2oLca2OoF6G1YQUMEYn6pegvsWEzZxnGPW
 b24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VfaTNl6cZJeuhpoWMW6b1lJ/gL2AkVre0lGbvDe+dvQ=;
 b=jnV8NW1wTyTn5c7k1Zwr/4IFHGYzAnHUoIiFu41f7ET5OfkxZfqZkv/WsUmC8Sq1PH
 GSMUQ8HMlyeDe/VnQ82YZ4EfUmo3LsLVOKfvm6BVrX9e04ZoDetRg4WXkBUk8PCg4Hox
 NzXai5LhDR9tVIBTFlLqdepev6bCc7JO/GPUJ0uGa9dXMnaMT/uBqfvbY97X90O8wK0G
 4doo1XmVRdLpFD+sSJzJeif9t/Srspnmim7msQUvkmUhC5G2Pzoo8UFEDOelJJIFria/
 pkV4aDjgzfEss6bbW/x2NWDja+XOwJZNUZCUYM84LO+aIEPRcz9ocLTnWvTc1ZRCPkaQ
 2WIA==
X-Gm-Message-State: AOAM531aw4esLPjIteoesUGna0Fa2XMFsz1I/0lAd3B0hL3QgGfHq4WN
 4WmZCo9+I5riulBAir8/ttWI2Q==
X-Google-Smtp-Source: ABdhPJwMtLQ0cPpXaX694Lbxc7N0YLZKuHXo2b2+i66zelrQV72dvmM0RjVkz3WQQsij+t+IfNpk3Q==
X-Received: by 2002:a65:63d0:: with SMTP id n16mr5263861pgv.432.1629235096661; 
 Tue, 17 Aug 2021 14:18:16 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
Subject: [PATCH v2 06/21] target/riscv: Remove gen_arith_div*
Date: Tue, 17 Aug 2021 11:17:48 -1000
Message-Id: <20210817211803.283639-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-List-Received-Date: Tue, 17 Aug 2021 21:18:21 -0000

Use ctx->w and the enhanced gen_arith function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 42 -------------------------
 target/riscv/insn_trans/trans_rvm.c.inc | 16 +++++-----
 2 files changed, 8 insertions(+), 50 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4819682bf1..e337dca01b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -491,48 +491,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
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


