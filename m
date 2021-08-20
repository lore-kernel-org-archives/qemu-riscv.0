Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8YG-0005qj-1F
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Y7-0005SE-7G
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:23 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xz-0003sW-B2
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:22 -0400
Received: by mail-pl1-x635.google.com with SMTP id f3so6379153plg.3
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtzgxMrimjDaolvyiQ4xom5y79yzDTt02qA1Y6+PMUo=;
 b=bU4qGPSjyvWGwZ8dqXBOQY6phQwJgw6veLvRd2zRsiOhidUDXIim7ijwboFqYny9nG
 UMYYb7G8s8wBL/5J5/hO2RRLI6fpLbOSm1uJSPaS54AcUKa34GT1oiNEzjk0qSJmJy6n
 Vv2vz5VD7uluB6a8HG0c6YH6XoNsWEpxFDPMcdqBLze/Yz9hm+3xAf/+Kf75bOVVA+kp
 4j4WUjWONd+YyiM+IXSrC0r86GXZsPFByhvrmk2oJWWYfwZu5xREZQdNpPqXllY/bBnD
 vPVcfHymFwnAPC3npZvCSYQt4h0X7ZabCT8638xPGE2TiYhHPWhuE349umKrbspTDm5X
 sZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZtzgxMrimjDaolvyiQ4xom5y79yzDTt02qA1Y6+PMUo=;
 b=Dzf+RLEyq8hfdWg97uR4RMLEpHn6lo+rOZ+9X5h9GKLo/Wc2FSNu37p5gRMfpAJpXg
 cXrRgE/dVmNeYHEcFNIz6ZnDaln6QkbDhF6s0gEOqCIbrqY4nCIMuSEJ8jrSi3g4yePy
 eGpvXDd6JJHqRxH4Tzycqkpv9bUlXTeWkFourx3oX6YKTdaP6pnLBWX/mxvfxL4bjBog
 Cthlswm/zHt+UeyptfsOu3+suALdt4BUnp3mG/RdQBiVnNfHYOc88/DXipVSCIT6cx5T
 GXKnm3QaFv53EaXtc6z86klYtiGilHU0ij3BwSpo3SJ8EgcknhuF3f/GsWLow1BaSDQ9
 qPRA==
X-Gm-Message-State: AOAM531tyMDmSjXPDJdgzjxBjBvrznfzVSnRRyXQYvxnuCHCGqKntWrX
 gp0qOZMew+zkYRXGP3JMnvc9AA==
X-Google-Smtp-Source: ABdhPJxNFASU1pZVLAbxFRpuhAMcRfCqIk0Vvb8KU2o8UvJ4zyl+5BvlXkydud9G4Bu5SSzuZdQxrg==
X-Received: by 2002:a17:902:d504:b029:12d:4cb3:397e with SMTP id
 b4-20020a170902d504b029012d4cb3397emr17457108plg.41.1629481393832; 
 Fri, 20 Aug 2021 10:43:13 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 08/21] target/riscv: Use gen_arith for mulh and mulhu
Date: Fri, 20 Aug 2021 07:42:44 -1000
Message-Id: <20210820174257.548286-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:23 -0000

Split out gen_mulh and gen_mulhu and use the common helper.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvm.c.inc | 40 +++++++++++--------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 3d93b24c25..80552be7a3 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -25,20 +25,18 @@ static bool trans_mul(DisasContext *ctx, arg_mul *a)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
 }
 
+static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_muls2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_muls2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
 }
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
@@ -47,20 +45,18 @@ static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
 }
 
+static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_mulu2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_mulu2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
 }
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
-- 
2.25.1


