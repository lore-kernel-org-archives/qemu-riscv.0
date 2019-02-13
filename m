Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtN-0001wp-6u
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtJ-0001t3-E9
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtH-0002nd-ED
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:05 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtF-0001hH-B2
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:01 -0500
Received: by mail-pg1-x542.google.com with SMTP id m1so1306614pgq.8
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=Uxpy/z8JNz77LHOz7M9TSaHFga3sbdzCa4Vag1aurso=;
	b=ZLHChjLgy6DdarP7K8mfJs/tv2mPY5MbIVP7q1x4BsSqc8O9CdZywh1F+Z0OySIPjf
	76ZiuSl3IbxuCKWchmTZPZaQkRfF0mPCs5uYZKtwFZ+ZbmsJYrQSJ/vrBCDkEo5nmzvW
	gdRMYC2zY6wQFosigveZB2daP/qu9Y4Zvyp3an1DAQUPnuimyD0ynlnI9TiOlgNK4egp
	FGDMvzhDBDuLISJhmzNqLEi5PG4viP/IAfx2QOAAAUS1StoDgNLTryyOwifRZHbvTp3w
	zJxxjZpf/xl3t0xouHpGpqv1PSAGUDIgwaosyjtMwWDLwoYPwlNpA22Wk2x7G71/ZvlD
	kcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=Uxpy/z8JNz77LHOz7M9TSaHFga3sbdzCa4Vag1aurso=;
	b=iKqhvFMaVb0WgoKII8Zon/SgQdMoFm/q7Pa4xuQkdS4EwglTrL3dy9AtMFQ3dQ/Btf
	sVsjoJ926usS55dbCVcYwB1Hvt1WVk4+0UcMyLZvr1SVvgTJmWCfLQy1IGCpMyyF6d6Q
	lmDbRVaodTFVS2D2zD612S9mzQiBjgK2SSZVBekCjEYlws3SvlfHqaijUn2ENRazgDyP
	2eheJgGWcMwFtp9kPA7jbeSxmEzTdfbExYTYWBlZk0BNsflAVZnXiklVqpXxM0BlJnPC
	Tncg80zQYMhjXgbYuFCUb00Zgp8wIRoOX7kqcGsdXI5vjMoNfUCXp77lRgXtnT92coI2
	/PJQ==
X-Gm-Message-State: AHQUAuaUNb0fkBMMVUYtUcvqqvLL7SXW3Cfy93D8l1aDQkMrNugcJUPU
	8GktDIjqxxnv643T9zp6K9/nIqwV1v0=
X-Google-Smtp-Source: AHgI3IYFkKPyCAHCG6TnY37zryMp1WtyzHBiWZj01UW+pQf8GvWXJIiP5Fu3grqBPxa1Pomzs/ZW8g==
X-Received: by 2002:a62:138f:: with SMTP id 15mr1101052pft.219.1550073317178; 
	Wed, 13 Feb 2019 07:55:17 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	o1sm43007302pgn.63.2019.02.13.07.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:16 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:04 -0800
Message-Id: <20190213155414.22285-26-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PATCH v7 25/35] target/riscv: make ADD/SUB/OR/XOR/AND
 insn use arg lists
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:07 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

manual decoding in gen_arith() is not necessary with decodetree. For now
the function is called trans_arith as the original gen_arith still
exists. The former will be renamed to gen_arith as soon as the old
gen_arith can be removed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32.decode              |  3 +-
 target/riscv/insn_trans/trans_rvi.inc.c | 21 +++++--------
 target/riscv/translate.c                | 40 +++++++++++++++----------
 3 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d6b4197841f5..6f3ab7aa52d3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -36,11 +36,12 @@
 # Argument sets:
 &b    imm rs2 rs1
 &i    imm rs1 rd
+&r    rd rs1 rs2
 &shift     shamt rs1 rd
 &atomic    aq rl rs2 rs1 rd
 
 # Formats 32:
-@r       .......   ..... ..... ... ..... .......                   %rs2 %rs1 %rd
+@r       .......   ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
 @i       ............    ..... ... ..... ....... &i      imm=%imm_i     %rs1 %rd
 @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
 @s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index ba9cce2a1410..d322ddf7fc21 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -312,14 +312,12 @@ static bool trans_srai(DisasContext *ctx, arg_srai *a)
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
 {
-    gen_arith(ctx, OPC_RISC_ADD, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &tcg_gen_add_tl);
 }
 
 static bool trans_sub(DisasContext *ctx, arg_sub *a)
 {
-    gen_arith(ctx, OPC_RISC_SUB, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &tcg_gen_sub_tl);
 }
 
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
@@ -342,8 +340,7 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
 {
-    gen_arith(ctx, OPC_RISC_XOR, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &tcg_gen_xor_tl);
 }
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
@@ -360,14 +357,12 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
 
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
-    gen_arith(ctx, OPC_RISC_OR, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &tcg_gen_or_tl);
 }
 
 static bool trans_and(DisasContext *ctx, arg_and *a)
 {
-    gen_arith(ctx, OPC_RISC_AND, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &tcg_gen_and_tl);
 }
 
 #ifdef TARGET_RISCV64
@@ -414,14 +409,12 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
-    gen_arith(ctx, OPC_RISC_ADDW, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_addw);
 }
 
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
-    gen_arith(ctx, OPC_RISC_SUBW, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_subw);
 }
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index cf75d9b1ff49..99ff11778f8a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -199,12 +199,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     gen_get_gpr(source2, rs2);
 
     switch (opc) {
-    CASE_OP_32_64(OPC_RISC_ADD):
-        tcg_gen_add_tl(source1, source1, source2);
-        break;
-    CASE_OP_32_64(OPC_RISC_SUB):
-        tcg_gen_sub_tl(source1, source1, source2);
-        break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_SLLW:
         tcg_gen_andi_tl(source2, source2, 0x1F);
@@ -221,9 +215,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     case OPC_RISC_SLTU:
         tcg_gen_setcond_tl(TCG_COND_LTU, source1, source1, source2);
         break;
-    case OPC_RISC_XOR:
-        tcg_gen_xor_tl(source1, source1, source2);
-        break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_SRLW:
         /* clear upper 32 */
@@ -249,12 +240,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
         tcg_gen_sar_tl(source1, source1, source2);
         break;
-    case OPC_RISC_OR:
-        tcg_gen_or_tl(source1, source1, source2);
-        break;
-    case OPC_RISC_AND:
-        tcg_gen_and_tl(source1, source1, source2);
-        break;
     CASE_OP_32_64(OPC_RISC_MUL):
         if (!has_ext(ctx, RVM)) {
             goto do_illegal;
@@ -725,8 +710,33 @@ static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_add_tl(ret, arg1, arg2);
     tcg_gen_ext32s_tl(ret, ret);
 }
+
+static void gen_subw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_sub_tl(ret, arg1, arg2);
+    tcg_gen_ext32s_tl(ret, ret);
+}
+
 #endif
 
+static bool trans_arith(DisasContext *ctx, arg_r *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1, source2;
+    source1 = tcg_temp_new();
+    source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    (*func)(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.inc.c"
 #include "insn_trans/trans_rvm.inc.c"
-- 
2.18.1


