Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfItD-00011R-Rx
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItB-0000wI-Vv
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:30 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIt9-0004mx-VX
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:29 -0500
Received: by mail-pg1-x52e.google.com with SMTP id q28so709408pgk.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KmqWH1PGMfksoIEDQlG0wfODklz3c3A9y1+TZN4fHAI=;
 b=KYNQUjWyOflsAwvF9ixV8gL7ebvkNpTBG4YopCAGas3H/hkQUDkc+9wutt3vTXc6zU
 jW1GP3yPoURKs3P1jJpk6WV7xAVqkJL8Fakit/elU8zN/Z2Lk2VgZNIXELhbAvxqNLBr
 KmyqTUFiR01KrCBe3boLmuLgfm4ASz4TijLlsbEzcmiVvSy/HxTok8m3Yua/K7dmMWFl
 PtbIYlCh13225Z01tpAF6rwtDvFKnq+vYJhgHF4Ly84dPhe8UtVs3z8wmj8hRNTbyJ8b
 VSdP7ozcombnKUKcETaZW8NyhqGQLFsdJVQ0cNWijsR/1VX+FdX1mEADeqO2KKa9YAQa
 uYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KmqWH1PGMfksoIEDQlG0wfODklz3c3A9y1+TZN4fHAI=;
 b=GWmXA3smeWrw8s7EncnIZclSBP5iwN7dQKiy8IC2z/gtNfaYMIfuaQwMvBLzd1XNWS
 eopkKMj67doUz8E4WGcxgevXSMV1/Ce8JYJUP/1OWmk2azlLAxDfpMfUW4td+Y3o3iyI
 rzYWLlWcHvufyK2Y62AkkrifUDLSq/FyzZDLaaQdLtjnHq6SR+ZhOpJDBOXZWL4ltZtP
 dPIgYWwYiMBq2RbKvKNkt0/ujL0B5dxVaM1C55TztEdODPMmLnRwJkHiPTEXMQIwabgH
 RbUOCvnprXKQAThYBcYgplNF59r9061p0bkLiN1kuRo3BfiO3qvRgygq3b5YEw+UZ895
 P3Hg==
X-Gm-Message-State: AOAM532jx8tyVfNUe5I+PIqzGPv6MyU0dDSOGm6KG39F1DzYImacRw1G
 k2OE/Wz2rcN7u5YHpmjL8rdhDA==
X-Google-Smtp-Source: ABdhPJx68QV8U8tLT8FphUtBW55m1uVzcqYCAiPEyG30CFtM/uvQTI0eLklN1cVYVZZeLy0OrTQv/Q==
X-Received: by 2002:a63:1f50:: with SMTP id q16mr6961356pgm.214.1605688346677; 
 Wed, 18 Nov 2020 00:32:26 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:26 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Frank Chang <frank.chang@sifive.com>
Subject: [RFC 04/15] target/riscv: rvb: logic-with-negate
Date: Wed, 18 Nov 2020 16:29:42 +0800
Message-Id: <20201118083044.13992-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 18 Nov 2020 08:32:30 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++
 target/riscv/translate.c                | 33 +++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9e70a85d6f0..29a3d4c6ebc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,3 +598,7 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000000000 ..... 001 ..... 0010011 @r2
 ctz        011000000001 ..... 001 ..... 0010011 @r2
 pcnt       011000000010 ..... 001 ..... 0010011 @r2
+
+andn       0100000 .......... 111 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+xnor       0100000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 6f1054e3908..be25431e990 100644
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
index 97e5899750e..254a9dca8c2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -710,6 +710,39 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
 
 #endif
 
+static void gen_andn(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t;
+    t = tcg_temp_new();
+
+    tcg_gen_not_tl(t, arg2);
+    tcg_gen_and_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_orn(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t;
+    t = tcg_temp_new();
+
+    tcg_gen_not_tl(t, arg2);
+    tcg_gen_or_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
+static void gen_xnor(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv t;
+    t = tcg_temp_new();
+
+    tcg_gen_not_tl(t, arg2);
+    tcg_gen_xor_tl(ret, arg1, t);
+
+    tcg_temp_free(t);
+}
+
 #ifdef TARGET_RISCV64
 
 static bool gen_cxzw(DisasContext *ctx, arg_r2 *a,
-- 
2.17.1


