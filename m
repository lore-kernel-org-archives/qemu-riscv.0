Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG6Tk-0001sO-3e
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 17:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Tj-0001oU-7U
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:35 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Th-0001Hr-Mr
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:34 -0400
Received: by mail-pl1-x631.google.com with SMTP id e19so493157pla.10
 for <qemu-riscv@nongnu.org>; Tue, 17 Aug 2021 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DWW2ruvxat8p1EH7ZMnPGDRTm0cWRkZcMbECwmLW2qs=;
 b=Tt1ZFqzD+qky2Hz+UBJ2lg1XzCHH9fevmhOjKJtGi65Tul3Kye0N8d9ZKgM3oFzeRd
 bwUH36k4b1NbkEMBMkgTtqvXxUB9YNCu3RmKYFZp2pkK4ljzvt2n9wxteSv4ETOj9LaR
 pRbbOg0pq2zwjak/tKf6ynR8H07939+/52oqlUW77C44sOk2SUSyGSUgftrF5eilwnku
 9iKDESYrMafzScmPslXb5WPzQcwhkNWIHlpPI8xrUYzs373LDXt1kNiz64AeYMRKNAvv
 Rd8ntngIp0Sme5fT1eOSIgVx5MH8IE3KAITADbgdSgNMqFC0jwHNJsnHulHyWk2iN5ne
 5hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DWW2ruvxat8p1EH7ZMnPGDRTm0cWRkZcMbECwmLW2qs=;
 b=VaAYu7Cz3/rvmTkat4zJI+oF76C0MiRYUK5ghtH/JueRVjt4T0xqgHMDZtJW2TttpY
 /htwAAUImq2LpEYe5+hPy9752VcJbQTonG/r2DPjaKkZjy09xtptU6v1A+clw7PMkEbb
 0eL/sFh5z7lLSbEBYHCoNBN8+D/gvoFbQkXznJIZEFfFTNbOdEn4xr4nQKfNIC2SiJmJ
 xoeSObwe9efW1K+6Y6SD/B5pie3GHI2Y54Q+gJxEBeBCRVAgUsO3TOHWt2RSRP8u2nNw
 Gj2w2d/iQ7Rqd4CmwPf7Bs88Bybkj+KvRTHLmQvP1LQNgyVrxxCgLCNVX+ab3WPVFrc8
 zZTw==
X-Gm-Message-State: AOAM533zcNKepmBy4ScYphg/GzFnCHXGIc8tIG70gsunIUsbSNPRy0hu
 JiSyo3+TMnSVmuETrwb6fU8UfjjkeR6K1A==
X-Google-Smtp-Source: ABdhPJwmzT20r/9J8XTxOpOI0jfaJRqr3BydOQRKsaxYHPfU8IXJE7qqTaiMCt5Zrc2cO77DKZ212Q==
X-Received: by 2002:a17:90a:a406:: with SMTP id
 y6mr5363272pjp.221.1629235112465; 
 Tue, 17 Aug 2021 14:18:32 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
Subject: [PATCH v2 17/21] target/riscv: Use gen_shift_imm_fn for slli_uw
Date: Tue, 17 Aug 2021 11:17:59 -1000
Message-Id: <20210817211803.283639-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Tue, 17 Aug 2021 21:18:35 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index af7694ed29..d5a036b1f3 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -647,21 +647,18 @@ static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
     return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
 }
 
+static void gen_slli_uw(TCGv dest, TCGv src, target_long shamt)
+{
+    if (shamt < 32) {
+        tcg_gen_deposit_z_tl(dest, src, shamt, 32);
+    } else {
+        tcg_gen_shli_tl(dest, src, shamt);
+    }
+}
+
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-
-    TCGv source1 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-
-    if (a->shamt < 32) {
-        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
-    } else {
-        tcg_gen_shli_tl(source1, source1, a->shamt);
-    }
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
-- 
2.25.1


