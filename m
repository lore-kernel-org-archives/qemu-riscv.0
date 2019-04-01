Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAnNB-0006zP-9J
	for mharc-qemu-riscv@gnu.org; Sun, 31 Mar 2019 23:12:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnN8-0006wZ-If
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnN7-0002wr-Jy
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:30 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:34514)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hAnN7-0002wR-Bm
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:29 -0400
Received: by mail-pf1-x444.google.com with SMTP id b3so3808428pfd.1
	for <qemu-riscv@nongnu.org>; Sun, 31 Mar 2019 20:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bnXtqozOkG0z0qCnfkwAnWD2s6dn2+EP98mQY8o0DN4=;
	b=IwTmtmSFyyyZOKW4PIIAABH7C7rV3H25nVU+95yPtMMnf2GV081bdsmG8E8Yag9pl2
	tOO4GUnhCIzoM6M5Pflg5NFKcxyUcFex+JAqR7V7KpcwN3tiuSIkKagq3vmENnuo9VUz
	6a7unnmxOLkGIlJvTvU7rC6zWvlnue/68F3Yt3bwUOClIGr2BsCGP63/7UE0qdAcTkRb
	OkyTQW1EseXuic01AELwwJ6V0vV0U9ave0q6vUYybHfc7xZSWsIFU43Aizt60A4Gapnl
	G5nxWEcbxl6sUC91PL9pwKr+rcih0qMP/QhDZ7cdg98SZmQ+ukOrbmneSlkQfOkorjOC
	P+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bnXtqozOkG0z0qCnfkwAnWD2s6dn2+EP98mQY8o0DN4=;
	b=EYDf9pgOE2Tl3m97iqePnMTqHTZTxfRba0rdw9zGg4AOHfD39tv1RefxvSW67z7Bj8
	UKObdhdkaaiQRVNJfCFK1kd29O6gefMAiaQ6QqXmhCocA0RGEyTCIZOG2m1jILuBJIWf
	gKk16rvpGF8mpNwPcSNPr9jKhAC/G+3FQu9OT/Ri8Tw97zKLRTLBbadclvfC2wOGH11g
	ZmpcX1kC9AVqFKlcp2mlKzwqE+Nm86AJqsTKN3JAS8pE9mkrb/Rleqc/E3ZfstVwKtNG
	NqCXyGKnzRoiOXUmblAY8nOZaaBmeCslC5qVn5eCUpz9AlgpW56xgsB5cFfD80/YFgqe
	reZg==
X-Gm-Message-State: APjAAAXnaREke0k6JugefDpHr9s5CPdNshg/p1rQkL6uvrGrS7l0/gi1
	IcFUgsjtPwBmn+jFYG+lHQjHcCrP/C2Q6Q==
X-Google-Smtp-Source: APXvYqxp4uHaZfVU9mNSR9lCIqFQCvItkOxdYZYgLxuCS3KDEaMjQNm+4gmXWwm8AA7WiGHqokzHAQ==
X-Received: by 2002:a62:e112:: with SMTP id q18mr9520300pfh.116.1554088348367; 
	Sun, 31 Mar 2019 20:12:28 -0700 (PDT)
Received: from cloudburst.imgcgcw.net ([147.50.13.10])
	by smtp.gmail.com with ESMTPSA id
	c1sm11843954pfd.114.2019.03.31.20.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 20:12:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com,
	palmer@sifive.com, qemu-riscv@nongnu.org
Date: Mon,  1 Apr 2019 10:11:54 +0700
Message-Id: <20190401031155.21293-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190401031155.21293-1-richard.henderson@linaro.org>
References: <20190401031155.21293-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-riscv] [PATCH for-4.1 7/8] target/riscv: Split gen_arith_imm
 into functional and temp
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
X-List-Received-Date: Mon, 01 Apr 2019 03:12:31 -0000

The tcg_gen_fooi_tl functions have some immediate constant
folding built in, which match up with some of the riscv asm
builtin macros, like mv and not.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 14 +++++++-------
 target/riscv/translate.c                | 19 +++++++++++++++++--
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index caf91f9a05..620df5f323 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -223,7 +223,7 @@ static bool trans_sd(DisasContext *ctx, arg_sd *a)
 
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
-    return gen_arith_imm(ctx, a, &tcg_gen_add_tl);
+    return gen_arith_imm_fn(ctx, a, &tcg_gen_addi_tl);
 }
 
 static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
@@ -239,25 +239,25 @@ static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
 
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
-    return gen_arith_imm(ctx, a, &gen_slt);
+    return gen_arith_imm_tl(ctx, a, &gen_slt);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    return gen_arith_imm(ctx, a, &gen_sltu);
+    return gen_arith_imm_tl(ctx, a, &gen_sltu);
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
 {
-    return gen_arith_imm(ctx, a, &tcg_gen_xor_tl);
+    return gen_arith_imm_fn(ctx, a, &tcg_gen_xori_tl);
 }
 static bool trans_ori(DisasContext *ctx, arg_ori *a)
 {
-    return gen_arith_imm(ctx, a, &tcg_gen_or_tl);
+    return gen_arith_imm_fn(ctx, a, &tcg_gen_ori_tl);
 }
 static bool trans_andi(DisasContext *ctx, arg_andi *a)
 {
-    return gen_arith_imm(ctx, a, &tcg_gen_and_tl);
+    return gen_arith_imm_fn(ctx, a, &tcg_gen_andi_tl);
 }
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
@@ -364,7 +364,7 @@ static bool trans_and(DisasContext *ctx, arg_and *a)
 #ifdef TARGET_RISCV64
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
-    return gen_arith_imm(ctx, a, &gen_addw);
+    return gen_arith_imm_tl(ctx, a, &gen_addw);
 }
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 50d8f58e4b..fb66e886bf 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -547,8 +547,23 @@ static int ex_rvc_shifti(int imm)
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode_insn32.inc.c"
 
-static bool gen_arith_imm(DisasContext *ctx, arg_i *a,
-                          void(*func)(TCGv, TCGv, TCGv))
+static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a,
+                             void (*func)(TCGv, TCGv, target_long))
+{
+    TCGv source1;
+    source1 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+
+    (*func)(source1, source1, a->imm);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
+static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
+                             void (*func)(TCGv, TCGv, TCGv))
 {
     TCGv source1, source2;
     source1 = tcg_temp_new();
-- 
2.17.1


