Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtk-0002Mg-Pz
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtT-00023Z-GW
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtM-0002yS-MJ
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:14 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46347)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtM-0001up-Bd
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:08 -0500
Received: by mail-pf1-x436.google.com with SMTP id g6so1306669pfh.13
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=KKieqmlC5XL3lWxjJnmmG+VwQjQnzvEmZPDTD0IIgJw=;
	b=iyTXZaYZyh70JzGyDtDeSx1AVF+tsaZqK2Tt8HoeItU9DihzYyL3jdn7bHCvPvE8G6
	t+pd2gUl1iLv1jPBJB1hc3iFPR+x2iOqZ+2giMc5chqrcSQBn0ERPxcKTs9Mu7dhkIo/
	CBGVbh5a7WXbjZ4HcyoyeFFuM+3QtUwHFwm973DS3GbaZrTODoKGqZTbjEluGCJxbV+1
	BLFK6khHdNt+6/GwYgKj1NjhiI8WnuSHtd48ZZzI4EdLEmNgRCJ8vAc+wvkxqN9fQTVf
	uXES+aFgNhMa/n0+ZeAuVVU2qsVuc1NoF+V8c8xaHL9qNfqfrWH83L6kvvw5XP0Yoix1
	wzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=KKieqmlC5XL3lWxjJnmmG+VwQjQnzvEmZPDTD0IIgJw=;
	b=tRi0qS476yY/qUc28s5HYDd3xMTmLDvCYpE5QCSpFnV01dINJCLInbABNidtIih0t9
	jtL3sVU6EXK4eAo5GM5vNHF61PJzsFVb+nylx6SRsgWG/t78R0kF5Vdfr18OelWSN9Nd
	QrVeqVj6n4rDSkQUMGINRaW7omIxtixtfDmTbyVsFWWy+9o08BdZEzD+cqEOh7mkIBmy
	H4BuU1q0+mB3jWVA/t46pJPf5AP/xr/sE53SpI/H+CiyF1ojhro/bkXtjwLoPHBQMWAa
	xaL97j/k40QemwriELpZw4rj9W/Hr7BKC4ri5q8wOoijKRDAasI+IPV9Dm9jbeLTw50b
	4hRQ==
X-Gm-Message-State: AHQUAuaAcLvhEJf4DWXyAjYUBaTR8dWtT4O1fAKEppoBF4Lw3li804An
	4IS8eSj8tVQyVQ04UShiSzzvlA==
X-Google-Smtp-Source: AHgI3IbR0GQGStVUaQAyyzrLPN+2j65naogUgAaKq8XzZ7hQ9whpm2K0S3NvA48hJvzkKxcDh3M0xQ==
X-Received: by 2002:a63:6a05:: with SMTP id f5mr1076441pgc.72.1550073321909;
	Wed, 13 Feb 2019 07:55:21 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	l2sm23099094pgn.52.2019.02.13.07.55.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:21 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:07 -0800
Message-Id: <20190213155414.22285-29-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::436
Subject: [Qemu-riscv] [PATCH v7 28/35] target/riscv: Rename trans_arith to
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:28 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 18 +++++++++---------
 target/riscv/insn_trans/trans_rvm.inc.c | 14 +++++++-------
 target/riscv/translate.c                |  4 ++--
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index d94b371b4d00..aed34dc2bb11 100644
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
index 949f59ddb2f9..5844d6f5beff 100644
--- a/target/riscv/insn_trans/trans_rvm.inc.c
+++ b/target/riscv/insn_trans/trans_rvm.inc.c
@@ -21,7 +21,7 @@
 
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_mul_tl);
+    return gen_arith(ctx, a, &tcg_gen_mul_tl);
 }
 
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
@@ -41,7 +41,7 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
-    return trans_arith(ctx, a, &gen_mulhsu);
+    return gen_arith(ctx, a, &gen_mulhsu);
 }
 
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
@@ -61,28 +61,28 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
-    return trans_arith(ctx, a, &gen_div);
+    return gen_arith(ctx, a, &gen_div);
 }
 
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
-    return trans_arith(ctx, a, &gen_divu);
+    return gen_arith(ctx, a, &gen_divu);
 }
 
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
-    return trans_arith(ctx, a, &gen_rem);
+    return gen_arith(ctx, a, &gen_rem);
 }
 
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
-    return trans_arith(ctx, a, &gen_remu);
+    return gen_arith(ctx, a, &gen_remu);
 }
 
 #ifdef TARGET_RISCV64
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
-    return trans_arith(ctx, a, &gen_mulw);
+    return gen_arith(ctx, a, &gen_mulw);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9ae7aaa7ed00..3d49c8ed4054 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -624,8 +624,8 @@ static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
 
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


