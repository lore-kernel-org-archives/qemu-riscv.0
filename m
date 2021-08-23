Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG2r-0006Ax-JF
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2p-0005zf-17
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:43 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2k-00036E-SZ
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:42 -0400
Received: by mail-pj1-x1033.google.com with SMTP id oa17so12709142pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtzgxMrimjDaolvyiQ4xom5y79yzDTt02qA1Y6+PMUo=;
 b=dzGccQw1okVr4STQRfIPzRwzKR8tCS4rlgwZKE7uCYczzsDiOqVb71cyM8nRVsOCyJ
 pYbavkJgECi0PKlSc3Q088/xl3zBh99XXA395X2ebAmiBx38fJVy/Rfin6ODgTETRdVE
 1Gob8sEJzgKABgOUC5k2W+iu39iWeFZPiRSIoEPndbGmJkN07EDILjvvMHGG8eHdZxPx
 ZbPxofocJITzTQQN6vlXG7bKdPHdCNlXLREGC4zSJuWrpTbAY8FNVCSeH10Lp9wy7Bey
 U2zAO4JI2jadAxWmBjErgoZw8dyfm0Ay9HCoj7QRCjBhvy+sDUDnE1yNfAz9hMmcTLiJ
 ik9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZtzgxMrimjDaolvyiQ4xom5y79yzDTt02qA1Y6+PMUo=;
 b=PYsvTfE5xkUTvnufLVFLJT+r1zOQxZ/n0CykVbq0KZc1yFFvKhLtCheu8E3HaI0gGP
 2dOtwkoTGClaED4CaB0srhjOsicnU55F0jYjWVY0jZqxPEy1QxTWHCqxyJvtwhUwo+Ek
 G/2jKG7cWgKJtoVNyAIydxEvrpHUYQWT2vSCcxyzgcAYYpaPwgRl8uZDqd3Va2Mp1ygI
 ImhswEPUhOsvySoGoT+y/2R9w8oMxI0Arim9xpExNypJRfUMiPflP0IMo5y8T/P/u4u2
 xjO/MtjvIs3+Rse8L9/pBcDjiQkS6ZSWJ9HMFg8nuTPaSSsMvSPdlrhbtbkdj2ZfB06U
 t+Sg==
X-Gm-Message-State: AOAM530pGc/JauQH1a7cmFI6JN78xfhPRIMQtPjs57sDLnF79mjSqdAP
 GwOrdOIIg+jlHpofmsGIAg+0WA==
X-Google-Smtp-Source: ABdhPJw5EKcjEJHuqb26toi8CfDOwwNO5ncOhTsqe7GJL4MvDaKmKxwk7uwT584HyXTUjTZhlE+wcA==
X-Received: by 2002:a17:90b:23d1:: with SMTP id
 md17mr233092pjb.105.1629748537654; 
 Mon, 23 Aug 2021 12:55:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 08/24] target/riscv: Use gen_arith for mulh and mulhu
Date: Mon, 23 Aug 2021 12:55:13 -0700
Message-Id: <20210823195529.560295-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 19:55:43 -0000

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


