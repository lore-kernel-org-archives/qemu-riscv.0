Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6P-0007Js-RR
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i62-0006Yb-HR
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:40 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5k-0001Z0-4I
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:38 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so5354385pjo.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lbT7rR4xAZ+TINcw0n3vg8MxSKcWXYHtQH2vV0PJUA8=;
 b=GCNmFCvx+2bFPvSIENUpcshqAYTMWkdpmFvPDuO0pMn1alP4Zqw6TuIPTiUEBdEWFC
 HchAPqDg3fgVLZrcMKG1N9h6N+y0WYGSaJ1gc1g55NucRmhPqXuKe2h6Jrf7o7evhhQn
 VhdQ4Cv+MezTroeIC9vtIFwmLu8MPU8vV2a4YqJYYNQTSDXbvOaoAiiB240sxn3k33UE
 qJQlu4UfajGAh4MuupnzoAq7zYlVUglJU1RTiiYunIv5dlI8BqzMLlevDzHoXWSKwunQ
 nL6y8Fik8JX3ZWo7CSn17kTzV8jQl29cHgn8dmHZ9qPBQ/rsdrUoS/bmozp3axbcUtfx
 Qoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lbT7rR4xAZ+TINcw0n3vg8MxSKcWXYHtQH2vV0PJUA8=;
 b=dwJ5p9+UMou0rak8aw5Rz+NCqRjJ5ziABTiCdHNmapHae/UqFSj/n7IDowY3z/iDTk
 TPMU4bMzaw95/RHkz9joXNXHx52hTwL+ObdlqCtzP4hTbowBCpwNw5g+eop8gL2i2lhx
 5/s0Vn+u4pTlesViyLRxkri9MkQgeRItC+CW0Sc10FrKim03WBrJxou04xaBwCi2YU34
 Whxz+xeZJyOd0Vs9PacBXy5P5DtBEH/mWx24aRZTjIaU3e66yrgp0RWvV0HupJDzfONk
 YCfT/2kPcW2xDrHOZ6N88obmup6gIurzNJMlp0GgqnRmTuFdRYX+jMvd8ulZrcnhTzHn
 nEUA==
X-Gm-Message-State: AOAM530KZvCA55QfQVzOWElgy+Heyir7DnO1lFgiljfFMuN2m/tlxirQ
 +O2Vr0NgQPS2qG1SP8PD4tFX8cGLZVIsPw==
X-Google-Smtp-Source: ABdhPJymI9HTMxv336TjQ2Je1aq8eBSSvFDhp8WdCPeDVJClN8M7c8W0Ys9mS8d6cMXwn/JCzcUspg==
X-Received: by 2002:a17:90a:4e4a:: with SMTP id
 t10mr35752021pjl.173.1625804778835; 
 Thu, 08 Jul 2021 21:26:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 15/17] target/riscv: Use gen_arith for mulh and mulhu
Date: Thu,  8 Jul 2021 21:26:06 -0700
Message-Id: <20210709042608.883256-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:40 -0000

Split out gen_mulh and gen_mulhu and use the common helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 16 ++++++++++++++++
 target/riscv/insn_trans/trans_rvm.c.inc | 24 ++----------------------
 2 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6ad40e43b0..8ff75a5798 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -235,6 +235,22 @@ static TCGv gpr_dst(DisasContext *ctx, int reg_num)
     return cpu_gpr[reg_num];
 }
 
+static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_muls2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
+static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_mulu2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
 {
     TCGv rl = tcg_temp_new();
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 10ecc456fc..34220b824d 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -28,17 +28,7 @@ static bool trans_mul(DisasContext *ctx, arg_mul *a)
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-
-    tcg_gen_muls2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, gen_mulh);
 }
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
@@ -50,17 +40,7 @@ static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-
-    tcg_gen_mulu2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, gen_mulhu);
 }
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
-- 
2.25.1


