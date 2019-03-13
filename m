Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4562-0000dX-Oo
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h455r-0000SU-Na
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:42:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h451f-0004re-DE
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:36 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h451f-0004rF-7j
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:35 -0400
Received: by mail-pf1-x430.google.com with SMTP id j5so1535500pfa.2
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=41jWe7eqKwUbIEv9qKvD//y2zi/3DdoUZKjfpiZ07j0=;
	b=GSkbOg16dhpw621yodZJdqcR4g7rv5ZNbX8ZrViKaWdYRBJX9rmILRFvZYMsgjp1iY
	nQ7RvAEJSO2RtWegGQuWGCEh1zQjqLUKA0cm4ol+1bngt6b6GLwaK8MPuSPTxU1hsR6u
	FlkmSoT0TXt2mFDF5al8RiDlqG3W2VInzw8MYOAsLgkuIMUbOHz0qcXCrpbps0KS7tzA
	MNyOQXO3cK9GD4DwyQ4SkTTW4kqZ33ZiTZaI7uA+6qULNM2ZyfHnbmEKZIxnRTEIKIco
	VToXcgKBkWgabRDkrZ737dZ2rNcmqpiqNS0e88apjROmxXpRi2Rq4nEGXYJA1JMfUItI
	YD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=41jWe7eqKwUbIEv9qKvD//y2zi/3DdoUZKjfpiZ07j0=;
	b=HSfgVM4mn//F6l+l+Q8gZ542zSX3jkegOTSApD87uJzZthZ24aFb9KvZYR6FJcosq8
	erdA8ND1h1JQ+XDoIXjjFJCGER4yDT3zkMvJjgpnvMw5orcXfQDbZr0p8IwVNrozjhwp
	+GNF6GmCirOPxYOEpDHkbgen9AGTqEt7fgJeGYUzH4NxAygh2tjrUEsP8Dq09g842mLk
	7fGG1uWRmu+B77WyZFbp88r8j5khr80CeD+dw+a5OHaOURt13LySFzJqjhLGqFs5OI6D
	JNswDKvnD+x8lU9KL9lm6Yq4otuD9+L9lYvX8Sy0ZsX+dXDLyBkED583b2EVS8Xn/+Gm
	tkjA==
X-Gm-Message-State: APjAAAWzUX/tzNn/esOMKi0x2lIcpDgeP0s2fYvPP48XX4vApfiX4ytJ
	gAZ3XwOF/Eh3F2fX19iinUqhtfvDKf0ccgc6
X-Google-Smtp-Source: APXvYqwoHahgwLpM1FauHbEV/UlVqocyDplYSkQjzK3IaHRyHS1l5fNNpkiqbBj6UOid6KxLGPMzxg==
X-Received: by 2002:a17:902:76c7:: with SMTP id
	j7mr45041179plt.121.1552487914012; 
	Wed, 13 Mar 2019 07:38:34 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	p187sm6530729pfg.64.2019.03.13.07.38.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:38:33 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:37:03 -0700
Message-Id: <20190313143705.29129-28-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190313143705.29129-1-palmer@sifive.com>
References: <20190313143705.29129-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::430
Subject: [Qemu-riscv] [PULL 27/29] target/riscv: Rename trans_arith to
 gen_arith
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2019 14:42:57 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 18 +++++++++---------
 target/riscv/insn_trans/trans_rvm.inc.c | 14 +++++++-------
 target/riscv/translate.c                |  4 ++--
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 88ef0003ec17..d420a4d8b2e9 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -307,12 +307,12 @@ static bool trans_srai(DisasContext *ctx, arg_srai *a)
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_add_tl);
+    return gen_arith(ctx, a, &tcg_gen_add_tl);
 }
 
 static bool trans_sub(DisasContext *ctx, arg_sub *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_sub_tl);
+    return gen_arith(ctx, a, &tcg_gen_sub_tl);
 }
 
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
@@ -322,17 +322,17 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a)
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    return trans_arith(ctx, a, &gen_slt);
+    return gen_arith(ctx, a, &gen_slt);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    return trans_arith(ctx, a, &gen_sltu);
+    return gen_arith(ctx, a, &gen_sltu);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_xor_tl);
+    return gen_arith(ctx, a, &tcg_gen_xor_tl);
 }
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
@@ -347,12 +347,12 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
 
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_or_tl);
+    return gen_arith(ctx, a, &tcg_gen_or_tl);
 }
 
 static bool trans_and(DisasContext *ctx, arg_and *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_and_tl);
+    return gen_arith(ctx, a, &tcg_gen_and_tl);
 }
 
 #ifdef TARGET_RISCV64
@@ -399,12 +399,12 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
-    return trans_arith(ctx, a, &gen_addw);
+    return gen_arith(ctx, a, &gen_addw);
 }
 
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
-    return trans_arith(ctx, a, &gen_subw);
+    return gen_arith(ctx, a, &gen_subw);
 }
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
diff --git a/target/riscv/insn_trans/trans_rvm.inc.c b/target/riscv/insn_trans/trans_rvm.inc.c
index d2bf2f171904..204af225f8f3 100644
--- a/target/riscv/insn_trans/trans_rvm.inc.c
+++ b/target/riscv/insn_trans/trans_rvm.inc.c
@@ -22,7 +22,7 @@
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return trans_arith(ctx, a, &tcg_gen_mul_tl);
+    return gen_arith(ctx, a, &tcg_gen_mul_tl);
 }
 
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
@@ -44,7 +44,7 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return trans_arith(ctx, a, &gen_mulhsu);
+    return gen_arith(ctx, a, &gen_mulhsu);
 }
 
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
@@ -66,32 +66,32 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return trans_arith(ctx, a, &gen_div);
+    return gen_arith(ctx, a, &gen_div);
 }
 
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return trans_arith(ctx, a, &gen_divu);
+    return gen_arith(ctx, a, &gen_divu);
 }
 
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return trans_arith(ctx, a, &gen_rem);
+    return gen_arith(ctx, a, &gen_rem);
 }
 
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return trans_arith(ctx, a, &gen_remu);
+    return gen_arith(ctx, a, &gen_remu);
 }
 
 #ifdef TARGET_RISCV64
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return trans_arith(ctx, a, &gen_mulw);
+    return gen_arith(ctx, a, &gen_mulw);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3cd7e16c63cf..dedf4189d5b7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -629,8 +629,8 @@ static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
 
 #endif
 
-static bool trans_arith(DisasContext *ctx, arg_r *a,
-                        void(*func)(TCGv, TCGv, TCGv))
+static bool gen_arith(DisasContext *ctx, arg_r *a,
+                      void(*func)(TCGv, TCGv, TCGv))
 {
     TCGv source1, source2;
     source1 = tcg_temp_new();
-- 
2.19.2


