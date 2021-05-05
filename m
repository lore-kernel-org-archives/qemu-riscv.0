Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK31-0005XW-NU
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2x-0005TN-53
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:47 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2t-0002KG-7A
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:46 -0400
Received: by mail-pj1-x1029.google.com with SMTP id gj14so1059532pjb.5
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fIPRX4rZvfjgmZsp4kFN9w9Yg0oTaTpU0JN62XLcU4M=;
 b=Y4txtp2y4DxCfWPqt6KNy0GkKl8SwGOX3iYrnnagp8DGUaQdLbDy2foYUcajWFpoZx
 fKPUxkZ9wRAL/vezFzBLaywKuVv/EKKMinvmwHRzt4I/adtxctHD4OOXhcAh1KFRmXso
 M/HFqRNEv09X1wEHPmpFW7wcRwzldZoutWw9pGPEVUE0gWwvngUij6uTrgf5/mDs/cId
 zqdJN2N7ynS1EDwF2zg2GM62FtEZHHNII25rhgxFh6A5Z2arjtseXoSPJVG7zo9wHnVd
 a+mjrp/sKPZE2kW2LVYB7QHL+jC9qvdcqKauvPtJXmz9SlZJnucxxsXXeP9lViC+44en
 pFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fIPRX4rZvfjgmZsp4kFN9w9Yg0oTaTpU0JN62XLcU4M=;
 b=TD4ZJaGp9CTcIoAucdlFeSRAs4ANGQcqtp36TFjVNDKtr8+sNbhi1yWKsrxQa81tb4
 k8714kcQ+pql0neTFreeTLwPAtsRtQMuPVbKx2j2bDNeHPZ+g1U0PFQ4e1mbXd3AYxAO
 KHQWh8nM4vSrh5BwSarDxGvPdBQHviw99A4xtdRxnKHAG8j2omxYQ2PfvWUcMMMJm4wk
 FLH6Qg0oiJPV7qcklrlNtcX9GPIjvZLleq3AH+ioIMup+mcNJEsylweTRXxeQOukqezN
 QFm7DiGsaa1XGDilYB5f2bFX3tmP0YogPKHOHhd2pWBi373UhkAotNvnjB2fRcGjCVzQ
 NwKA==
X-Gm-Message-State: AOAM530ws/0yNZK2IuMBuZJcb9RNQOTvpdJIxs5j6kaNKvxcDyKLgdq3
 +jB4mtfLmueN7gWSuR3wUszlIg==
X-Google-Smtp-Source: ABdhPJwhmVO/bq7jj8xa312lFR3ONvegn8VBAKdcqUXolYswPxKow7rpDaFNmuDIm/DocJc9gqyCUA==
X-Received: by 2002:a17:90b:3504:: with SMTP id
 ls4mr11756468pjb.222.1620230800628; 
 Wed, 05 May 2021 09:06:40 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 04/17] target/riscv: rvb: logic-with-negate
Date: Thu,  6 May 2021 00:06:05 +0800
Message-Id: <20210505160620.15723-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:06:49 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6f7671872d2..a4d95ea6217 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -663,6 +663,9 @@ vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+andn       0100000 .......... 111 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+xnor       0100000 .......... 100 ..... 0110011 @r
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 4a5d271b438..b8676785c6f 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -35,6 +35,24 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
     return gen_unary(ctx, a, tcg_gen_ctpop_tl);
 }
 
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_andc_tl);
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_orc_tl);
+}
+
+static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_eqv_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.17.1


