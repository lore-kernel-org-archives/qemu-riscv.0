Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG6TZ-0001SB-IK
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 17:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TW-0001Kq-O5
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:22 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TU-00017v-Ql
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:22 -0400
Received: by mail-pf1-x433.google.com with SMTP id j187so5646pfg.4
 for <qemu-riscv@nongnu.org>; Tue, 17 Aug 2021 14:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRN+8AnIpyUm35kwMVcgF6kocdTAwbllDazAtB5D33w=;
 b=LmcN/9SvdoCTXAK2OQdmn/ClHDaYcj3p1wFgQsUqzJ5+/6YCIGv779jw81UlKdOSNL
 izrHL5YwN25ftfqBeGKwwIlnG/BEix3nHSlqObCWnXBl3+EdAp9nlOFls7WjVMCeqGD7
 0bSrRIMxgHAjQ7j6LazYkIwfTrsTqtK4Ik14cl/B4Sz6xHPvdkFUKMZ5CwMCcwNpjD6b
 rtLsIvjLYEpsZNxXw/Z7JoWOBBRKK649s7Jh8trkMbY/JHgnOk7yHbxOl50vIQurZE+e
 kQ1l//+E8o2qIRSJBNy5WbunxcwVYU/JXvP8NiUkjn6iFXPjiwJ3P9BnT6onrZH0WhjW
 UaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRN+8AnIpyUm35kwMVcgF6kocdTAwbllDazAtB5D33w=;
 b=f5U6hDUrwbslaZheoXURq7n8x+2gw3xmiVvIyuXEMsEY6WMdnInSLBuQ0FodoFl1AC
 bVMcTEVf2Q+WoQeXPJwb3tB0O/7NT96zSlf4im+0vgMvzTfSc/IlW9sKS7QurUw+ZN/G
 uwPtHSRwpZqEosQnCFljHslPJ1q0jHGbeIbmBrp8JYCVzvN/slH3V9cgS8VYWLjhC4/P
 sCE7o543Doubils4y9B3UEGeELPWeDrlrvxEFftzBvmeCeHnNuDBzkfK+aXGBDy8dByt
 lnPcUjxSBFfSPjDe3Sy/+YjJxGS44jelJAom1CSOosvUVbgtXyXSxCjgueCq8CLASCNT
 7hQg==
X-Gm-Message-State: AOAM530jGCyBJ4wdK5Bi4eP2owZhrK4mh9niUry9fP31C/qvBtkdjkZ2
 XJJNzdVCb9p3fJEut/r2r0bC+Q==
X-Google-Smtp-Source: ABdhPJwwK61RxNEBpbq3d96vRPj76RT4J/EzkTYFOMUW6lfwVKvnDfsjESESOOVtJsWjYeS3cy3U2Q==
X-Received: by 2002:a62:3185:0:b0:3e1:ae2e:4b78 with SMTP id
 x127-20020a623185000000b003e1ae2e4b78mr5464814pfx.18.1629235099425; 
 Tue, 17 Aug 2021 14:18:19 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
Subject: [PATCH v2 08/21] target/riscv: Move gen_* helpers for RVM
Date: Tue, 17 Aug 2021 11:17:50 -1000
Message-Id: <20210817211803.283639-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Tue, 17 Aug 2021 21:18:23 -0000

Move these helpers near their use by the trans_*
functions within insn_trans/trans_rvm.c.inc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 112 ------------------------
 target/riscv/insn_trans/trans_rvm.c.inc | 112 ++++++++++++++++++++++++
 2 files changed, 112 insertions(+), 112 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e337dca01b..168274934d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -248,118 +248,6 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
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
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
-    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
-    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
-
-    /* if div by zero, set source1 to -1, otherwise don't change */
-    tcg_gen_movcond_tl(TCG_COND_NE, temp1, source2, zero, source1, mone);
-
-    /* if overflow or div by zero, set source2 to 1, else don't change */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, temp2, zero, source2, one);
-
-    tcg_gen_div_tl(ret, temp1, temp2);
-
-    tcg_temp_free(temp1);
-    tcg_temp_free(temp2);
-}
-
-static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
-{
-    TCGv temp1, temp2, zero, one, mone;
-
-    temp1 = tcg_temp_new();
-    temp2 = tcg_temp_new();
-    zero = tcg_constant_tl(0);
-    one = tcg_constant_tl(1);
-    mone = tcg_constant_tl(-1);
-
-    tcg_gen_movcond_tl(TCG_COND_NE, temp1, source2, zero, source1, mone);
-    tcg_gen_movcond_tl(TCG_COND_NE, temp2, source2, zero, source2, one);
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
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
-    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
-    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
-    tcg_gen_setcondi_tl(TCG_COND_EQ, temp2, source2, 0); /* temp2 = div0 */
-    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
-
-    /* if overflow or div by zero, set source2 to 1, else don't change */
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, temp2, zero, source2, one);
-    tcg_gen_rem_tl(temp1, temp1, temp2);
-
-    /* if div by zero, just return the original dividend */
-    tcg_gen_movcond_tl(TCG_COND_NE, ret, source2, zero, temp1, source1);
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
-    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, source2, one);
-    tcg_gen_remu_tl(temp2, source1, temp2);
-
-    /* if div by zero, just return the original dividend */
-    tcg_gen_movcond_tl(TCG_COND_NE, ret, source2, zero, temp2, source1);
-
-    tcg_temp_free(temp2);
-}
-
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 80552be7a3..ca665b96b1 100644
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
@@ -59,18 +74,115 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
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
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
+    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
+
+    /* if div by zero, set source1 to -1, otherwise don't change */
+    tcg_gen_movcond_tl(TCG_COND_NE, temp1, source2, zero, source1, mone);
+
+    /* if overflow or div by zero, set source2 to 1, else don't change */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, temp2, zero, source2, one);
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
+    TCGv temp1, temp2, zero, one, mone;
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, temp1, source2, zero, source1, mone);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, source2, zero, source2, one);
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
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
+    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, temp2, source2, 0); /* temp2 = div0 */
+    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
+
+    /* if overflow or div by zero, set source2 to 1, else don't change */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, temp2, zero, source2, one);
+    tcg_gen_rem_tl(temp1, temp1, temp2);
+
+    /* if div by zero, just return the original dividend */
+    tcg_gen_movcond_tl(TCG_COND_NE, ret, source2, zero, temp1, source1);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+}
+
+static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv temp2, zero, one;
+
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, source2, one);
+    tcg_gen_remu_tl(temp2, source1, temp2);
+
+    /* if div by zero, just return the original dividend */
+    tcg_gen_movcond_tl(TCG_COND_NE, ret, source2, zero, temp2, source1);
+
+    tcg_temp_free(temp2);
+}
+
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-- 
2.25.1


