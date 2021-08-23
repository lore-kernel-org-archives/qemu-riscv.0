Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG2r-0006C4-RM
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2p-00061a-Gg
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:43 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2k-00035g-E9
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:43 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so562107pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXJ3guWqlzaqn0iKN8apboyIQBkxnjeF9Y5TujOH5pQ=;
 b=Awi5vcmqv/BbDuzZuLKoUjpzsX30zLptlqKsGuZAY0gyWPyKcX+5/eMWHuraiC1u1k
 Fea33XKg1knbjpIgaGckXMspqUXn1BGhPLvPa3jG+v6RiYlf/j66I4d3YeOWvOLKaky4
 S6gvCFOjjfViZjS1EA2I430QYdAZOeOW2PtXqefIoMIjbl0pF2wZ0Lu6nP5xfWjGWedA
 iG8E2pjeIwt3HHZPgtj1C1WgVmnfToSNoZ6wERkxpAzRvlRs003aXiJLpnxktItrMiiS
 +lWgUrWSzu91cBS8luDrkYrYh9aZ7U0Vt8FAzZp4JZ8l9wl7Nr4sqK6CajKGpdvcQ+yb
 0QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nXJ3guWqlzaqn0iKN8apboyIQBkxnjeF9Y5TujOH5pQ=;
 b=OZycsjOjNGriWqK7Kjg2EAmzZYRvSy2+XgPTXTMsM/FIY9QHNWDXEkjtsKb0CEKP1i
 r/6s9iUTh3hyroUkJtRQFw/m+BudHI/+ma1C78SNVAInf6DMoMpeYfwOo9pBSBO9aYby
 zou8dK4LbPzR4PwAT6XJlXvPZ+8zV3zTB/ao87WjWiKhoSwjOHTBH078rOojf5RNIn9N
 h1EwzC1bHoNPg6Xe/1Uw/L6C0pDFzjpmE15WcfwzZnbVqfcg7rVzz4Yf8vS8Y03GhACZ
 OkD0Vtwy70lxMxQYd8m/aRBIrVzbCNljQCDjbEWfKd/lRftpqLb7uGfBHfkbrq3QsdPd
 gb8Q==
X-Gm-Message-State: AOAM533lAa4eF3nC2LF4hLGd/RvQZZTB5tRQAuCHP6/+tLGccyE9TGGJ
 aXWq0RpItD4jR93lRitCsAUKog==
X-Google-Smtp-Source: ABdhPJzmxqoU76vTfmPZPf5GPJs02vViOnNK0qEG8hD16O6f1WCGW+TqWTXCMDaVQcIDyADOpTtKWA==
X-Received: by 2002:a17:90b:395:: with SMTP id
 ga21mr227999pjb.159.1629748537006; 
 Mon, 23 Aug 2021 12:55:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 07/24] target/riscv: Remove gen_arith_div*
Date: Mon, 23 Aug 2021 12:55:12 -0700
Message-Id: <20210823195529.560295-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 19:55:44 -0000

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


