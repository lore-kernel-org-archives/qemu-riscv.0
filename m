Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpM90-0006UY-1R
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 21:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8z-0006Tc-0C
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:02:21 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8v-0000ts-A7
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:02:20 -0500
Received: by mail-pf1-x434.google.com with SMTP id 131so15615165pfb.9
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 18:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u120+DVpg45n1ziD1lZqn1EL9cn7+DYhSPkDIbFuH6U=;
 b=PrStDb81pmqcNxGAmmYLN8+gsHWA1md+ej9k6K7iBlzf5WhNR/8WqXYG22heHzHcAT
 vVgnxn0dNWT5vRrjOgCgNKBhwI8MYtgmcHdd/bT5/7sYqbEbVmCxUoZjLkbSbV10sIql
 P6Gr4xU1J8ABXtW+hTYsyrfnoTY5UAsCcRC8c5ZrfE+NVGZeoGeYMb9e38/dd1cmrLrm
 OlV+ic6OIIgOojq4v7gq7MvYbBwPbDh+zbkrY93otVFT/eiyxbzJBuBuU42cwenEQt/N
 H4ckE5re0vmmYop5AWIE7zNtctMKWzmBMtPy/2aCmBLnR2rohzmG2TP6IDw/Y0w7cg/k
 1xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u120+DVpg45n1ziD1lZqn1EL9cn7+DYhSPkDIbFuH6U=;
 b=E79IpXK+9DbjaGpjJMcAFInkCWi+n1iYx3RO/AqukXtLGNkm6+P98tt//f9E8yhjw3
 4f3epi6amlIlgN8mIJCOzASbmsPrSv4/ZCemtswpyT84eMTmURqZwJM4qgZxbaA2LR6p
 z0XEax4qSb0N+nQhxzRAjA+nNrtT09rPyMmVT5z6VJloiLjeAbTkIaj/V02xPUPnUPLy
 XQeIIrN3/rAfWOA0baD/JP35evNBJBRptAH6vfQYdYcp2xgp02m6YUfCmCHtsUNVNA6z
 RMcf5ReIBvcS1Vi3j4gnKALgwtD55kCvm2wq3beF4l3egwIqvY3Y+GvNpZ9BInyb2ru1
 A6fQ==
X-Gm-Message-State: AOAM532oVLcS9BAeJ8D0iDOekIB976xNEDiNQlWdL5Tyj3J1L+RiKl+X
 ZEo0dyeKoOs02EeKJUM2nqarlA==
X-Google-Smtp-Source: ABdhPJx7mww1ynzUf4y1DmgMRSiKQKDYxPSf+QzNDtvk+X2VveXCX9QH/4gr98pREwXYeHE19CFaBw==
X-Received: by 2002:a65:4582:: with SMTP id o2mr31278783pgq.97.1608084136071; 
 Tue, 15 Dec 2020 18:02:16 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:15 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 04/15] target/riscv: rvb: logic-with-negate
Date: Wed, 16 Dec 2020 10:01:29 +0800
Message-Id: <20201216020150.3157-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x434.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 02:02:21 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++++++
 target/riscv/translate.c                | 21 +++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ac4d8395a45..85421dccb99 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,3 +598,7 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 pcnt       011000 000010 ..... 001 ..... 0010011 @r2
+
+andn       0100000 .......... 111 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+xnor       0100000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index f5930f2ad53..6016ceefd64 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -35,6 +35,24 @@ static bool trans_pcnt(DisasContext *ctx, arg_pcnt *a)
     return gen_unary(ctx, a, &tcg_gen_ctpop_tl);
 }
 
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_andn);
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_orn);
+}
+
+static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_xnor);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4c9eb86e630..fb0b2fd0728 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -711,6 +711,27 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
 
 #endif
 
+static void gen_andn(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_andc_tl(ret, arg1, arg2);
+    tcg_temp_free(t);
+}
+
+static void gen_orn(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_orc_tl(ret, arg1, arg2);
+    tcg_temp_free(t);
+}
+
+static void gen_xnor(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_eqv_tl(ret, arg1, arg2);
+    tcg_temp_free(t);
+}
+
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
-- 
2.17.1


