Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGdzJ-00068D-BN
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 05:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzH-00061p-Pt
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:23 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzF-0000Ce-A6
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:23 -0400
Received: by mail-pf1-x432.google.com with SMTP id g14so4878905pfm.1
 for <qemu-riscv@nongnu.org>; Thu, 19 Aug 2021 02:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xvHkMx0NJrAIX0G63nBDwHxvlJhJWW1IfOl+Smg9tUc=;
 b=dYbDHBneINNY+nO8/LhZ39BYtDrftAXxLJBpBcJdnTknuhP68RArlLxJG8UWZJzUvM
 ZxbOc44o5p5eTx+2tFV8QDY0ccAmX7/Iw4XPGeM+a65+oHMdsQNkn++fsl53gMfw4az5
 kR7MjLYxXR8D0joOnza17LXaJbnCnyCv8wZYcJo94eJH89HY8b5zHcndi7K88UYvXpPL
 hoBpezzzuOlHBpjuCqfKf+EFuB84NsCFq5xOa7nERFiSNLXtnxxwx3p1Hy8lje6NJNqw
 U3goU8iGgaJ183yf0Q6w2/EirSsnH2GxmWgMN8t003L5kIZETxrCkki7jECuzuqE8SVb
 RW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xvHkMx0NJrAIX0G63nBDwHxvlJhJWW1IfOl+Smg9tUc=;
 b=RmBizZAwXI0hQC0HJ1M0PAWdQHxiKZHqiUxGcdBalk2fYMK2kp9peQPwVypzXqLQ4M
 BjbqaosgdFZH4Ic457/+t+xM5+Rn+iYdCVe1cwGcuWy4+nrdInQkSjtzEj0YQ4Gbtd+p
 0TNwmePwgoNHDQy2nrKNubVwFOVvf8t8AhF5+gjIz++kcB0JQ0oC56Xo+DnT9d8/Nfp3
 JopA+zHOTBi9Ph+Lrm6xeEmCi8za1ml0PJJObtwp0q8grEpcGYYIM6ryPBi+FUcCZq1H
 qUHwuvkiFLt5z8SArk8R6Grt9uN/KvaJd0ZOevTQZJYztR6+0x8OlQVaH/zWaqp+7Xzb
 90Jg==
X-Gm-Message-State: AOAM532C8DunkY2u/4frBk/OySascis+rBAs9FK5OccwP2iyW4SF3gZf
 9QtuE8uFCxkJKwWknAWzpRC66g==
X-Google-Smtp-Source: ABdhPJw9ipSrq/pAK5LYVJOC3hrb6pUZs4fLSnz6SN7AS6wP8o8/K18F5i0hhWLEO/P7sXX7Q8gyqA==
X-Received: by 2002:a05:6a00:1748:b0:3e2:ace4:82b7 with SMTP id
 j8-20020a056a00174800b003e2ace482b7mr10878151pfc.56.1629363919701; 
 Thu, 19 Aug 2021 02:05:19 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 08/21] target/riscv: Move gen_* helpers for RVM
Date: Wed, 18 Aug 2021 23:04:49 -1000
Message-Id: <20210819090502.428068-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 09:05:24 -0000

Move these helpers near their use by the trans_*
functions within insn_trans/trans_rvm.c.inc.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 115 ------------------------
 target/riscv/insn_trans/trans_rvm.c.inc | 115 ++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 115 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index bc40b9c701..7fbacfa6ee 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -249,121 +249,6 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
     }
 }
 
-static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    TCGv rl = tcg_temp_new();
-    TCGv rh = tcg_temp_new();
-
-    tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
-    /* fix up for one negative */
-    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
-    tcg_gen_and_tl(rl, rl, arg2);
-    tcg_gen_sub_tl(ret, rh, rl);
-
-    tcg_temp_free(rl);
-    tcg_temp_free(rh);
-}
-
-static void gen_div(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, mone, min;
-
-    /*
-     * Handle by altering args to tcg_gen_div to produce req'd results:
-     * For overflow: want source1 in temp1 and 1 in temp2
-     * For div by zero: want -1 in temp1 and 1 in temp2 -> -1 result
-     */
-    temp1 = tcg_temp_new();
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-    mone = tcg_constant_tl(-1);
-    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
-
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
-    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
-    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
-
-    /* if div by zero, set temp1 to -1, else source1. */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1);
-
-    /* if overflow or div by zero, set temp2 to 1, else source2 */
-    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
-
-    tcg_gen_div_tl(ret, temp1, temp2);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, max;
-
-    temp1 = tcg_temp_new();
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-    max = tcg_constant_tl(~0);
-
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
-    tcg_gen_divu_tl(ret, temp1, temp2);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, mone, min;
-
-    temp1 = tcg_temp_new();
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-    mone = tcg_constant_tl(-1);
-    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
-
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
-    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
-    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
-
-    /*
-     * if overflow or div by zero, set temp2 to 1, else source2
-     * this automatically takes care of returning the original
-     * dividend for div by zero.
-     */
-    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
-
-    tcg_gen_rem_tl(ret, source1, temp2);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp2, zero, one;
-
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-
-    /*
-     * if div by zero, set temp2 to 1, else source2
-     * this automatically takes care of returning the original dividend.
-     */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
-    tcg_gen_remu_tl(ret, source1, temp2);
-
-    tcg_temp_free(temp2);
-}
-
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 80552be7a3..28bdfbca70 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -39,6 +39,21 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulh);
 }
 
+static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv rl = tcg_temp_new();
+    TCGv rh = tcg_temp_new();
+
+    tcg_gen_mulu2_tl(rl, rh, arg1, arg2);
+    /* fix up for one negative */
+    tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
+    tcg_gen_and_tl(rl, rl, arg2);
+    tcg_gen_sub_tl(ret, rh, rl);
+
+    tcg_temp_free(rl);
+    tcg_temp_free(rh);
+}
+
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
@@ -59,24 +74,124 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
 }
 
+static void gen_div(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    /*
+     * Handle by altering args to tcg_gen_div to produce req'd results:
+     * For overflow: want source1 in temp1 and 1 in temp2
+     * For div by zero: want -1 in temp1 and 1 in temp2 -> -1 result
+     */
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
+    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
+
+    /* if div by zero, set temp1 to -1, else source1. */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, mone, source1);
+
+    /* if overflow or div by zero, set temp2 to 1, else source2 */
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
+
+    tcg_gen_div_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
 
+static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, max;
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    max = tcg_constant_tl(~0);
+
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+    tcg_gen_divu_tl(ret, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
 
+static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp1, temp2, zero, one, mone, min;
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
+    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
+
+    /*
+     * if overflow or div by zero, set temp2 to 1, else source2
+     * this automatically takes care of returning the original
+     * dividend for div by zero.
+     */
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
+
+    tcg_gen_rem_tl(ret, source1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
 
+static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp2, zero, one;
+
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+
+    /*
+     * if div by zero, set temp2 to 1, else source2
+     * this automatically takes care of returning the original dividend.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
+    tcg_gen_remu_tl(ret, source1, temp2);
+
+    tcg_temp_free(temp2);
+}
+
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-- 
2.25.1


