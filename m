Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3q-0003zR-UF
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3f-0003hU-2l
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3Z-0003Ps-OS
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:03 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44066)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3M-0002jh-2z
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:59 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c4so12073838pls.11
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=6AgrIKo0DbRa/jy4mmn7ILgzRvwVf41jjgfJ4DzQpCM=;
	b=C9QzVngyB5MFeDmGs5uGGjj+bPzUcyGo9Rcws5k+kejXsO8J/Up6/yesToYaNUO94A
	8f16+qJexD74R1oaAqTVlf+ZN8vkobl6GwN7z3CSfqm4//8MvBnv4gSp5MMPW2rTpEVP
	29ikOZhcXtUGYfiBnOJcUWg69ESeyU7iXeARKws921Y4jaR1UMLTrplqxV/ao7ftPNIG
	w2wl8iX2kw9o7l4HtNUFlVt9AtepS8HkniaPmhY2MxB07EqoV7G9nGpobtMuwKngEEvn
	IbCOZ8rXthxbWXqjL5J9l1wXXu0PZliAq8V1G8P+hfXNxqETaZ6pKQshVSTuhy6zz5TV
	S8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=6AgrIKo0DbRa/jy4mmn7ILgzRvwVf41jjgfJ4DzQpCM=;
	b=l6I3OPpfHW9DMbF40nfChGCoCSY2t51OHSTSCUw49hxlAjrbvhsIgRKeZp/TP2EkfJ
	nkOITvGf09BvJVX2wshiStbpAo09Gwv7ApAcaGDWbhzWWvmVWu6a8/L/XyELkX7lSzrx
	qk2UPXXTfv9+HZ0VSXHxyho1CMSLFl+JYuhB2Qe6obGTjNgcEpdtKfmQoZ+Xry/GH8Lm
	T69yXAbnyvOnzyQqGXAD9jpxnHaMkRQpFq/96YebnoQ2C0f/W/FmvLuYKC4a0aqUiMas
	KKFoXI28e9U++Uic2JNj17FRWgalnzb78sq4hiSzNfMddnqoyMBa2OzZFk9+xYGe/Mic
	nefA==
X-Gm-Message-State: APjAAAU5wWjBpA+EJT1wcRpXaK2d1uixwMWcEVrtqJl1fycacTpI/lGU
	Is8VpWNcPYfgN2yAgd6v78h+rA==
X-Google-Smtp-Source: APXvYqw3WbMwIo3UFqvxcjiKFvB1Bsr9LTMw/3EzE8174dxqoDlluaYVJq33QahS2QUFfrWDD/NqkQ==
X-Received: by 2002:a17:902:6b4b:: with SMTP id
	g11mr7570456plt.92.1551477041982; 
	Fri, 01 Mar 2019 13:50:41 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	z12sm27081784pgv.0.2019.03.01.13.50.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:41 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:38 -0800
Message-Id: <20190301214945.4353-28-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62b
Subject: [Qemu-riscv] [PULL 27/34] target/riscv: Rename trans_arith to
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
X-List-Received-Date: Fri, 01 Mar 2019 21:51:09 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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
2.18.1


