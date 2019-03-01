Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3Y-0003Xw-1R
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3O-0003P7-N9
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3K-0002sf-OI
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:50 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3J-0002cc-EY
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:46 -0500
Received: by mail-pl1-x631.google.com with SMTP id k2so12091422plt.3
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=zWNoGYDbcXh+t2B2Gw4hooEpnaJHheBUwebNfBTclMM=;
	b=WGl1YthsmDk7yjDgF6og5IQdNoYYGvPunBXgIl4d9l+WGvfpJlrxhYnxaXVuGfqbd8
	I5//t9h/67U/hyfBSSbujxmam9Pxyew74J6SOOFwKN61O/a738iKcL7GBsnObF2P05dU
	JBDSAiLCcoQpm0NhlO0kylzTU+fyXlB2Y1jzTNHsx8ajXZTciKTnkWMLbzHJRozOYke6
	ABSoajajFEKQFaLDZe8E479uyCloKRc1tp80tQnDuNxLdCf6qjLvEywl7SUsfF3Ko8pt
	G42pFomm0PXOzYb7640lmSzhRzUMAGPlGPP6OS0MxYj2gt+gifczi6oBb0Lq6Y83XSuk
	ksEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=zWNoGYDbcXh+t2B2Gw4hooEpnaJHheBUwebNfBTclMM=;
	b=ekQmhkPPCmAc/QyN8a8gzGl6itBPjAdKkMlExL1zvKycVAwH1LPLdAPXIOKRhiq7IH
	NxuCdvqd5x5J+j0DVLeV+Ngs0DWeOLGfF/BUZ3jLwOe3ugKyJ/NtLEMDjwRVz7VtU28g
	9M97RNor7xj6zKeDIsGaQ93LY5OAL+rZUEgeDPSjfFMEIQDiPRo08L/5MImzNijzvbMQ
	Hh5GskAfcnU30+CPNUExZx41QGtXv9+7nRjDn/5xGw9HZymGAP2ZnaVLIb36MM9Deqj8
	gGmZIhdI0VhLm9FTFLBYKyA8DcUaa8yvdFa0TR0/wShVzbT3GoLbPBpH/zEq59PSqVyQ
	sIeQ==
X-Gm-Message-State: APjAAAWUoTlLNk4J29vi3YsRUwNaN+uWAf/OjxKrsfe8ASsoLrKmJTOK
	uYUCariQQ5Wli5A6nMEr08qKtw==
X-Google-Smtp-Source: APXvYqx76HqSS7GFaxiioEHK4q10GRVuOEhQAK0OfRqB09Cn3rWQKRrZQEkQ5S+Z88bi+xuOfRW1sw==
X-Received: by 2002:a17:902:7405:: with SMTP id
	g5mr7857042pll.230.1551477037017; 
	Fri, 01 Mar 2019 13:50:37 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	k27sm21369641pgb.70.2019.03.01.13.50.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:36 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:35 -0800
Message-Id: <20190301214945.4353-25-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::631
Subject: [Qemu-riscv] [PULL 24/34] target/riscv: make ADD/SUB/OR/XOR/AND
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:54 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

manual decoding in gen_arith() is not necessary with decodetree. For now
the function is called trans_arith as the original gen_arith still
exists. The former will be renamed to gen_arith as soon as the old
gen_arith can be removed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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
index 0265740bdb69..8879f2da35c7 100644
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
index 0157758a160a..8eb883463322 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -198,12 +198,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
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
@@ -220,9 +214,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     case OPC_RISC_SLTU:
         tcg_gen_setcond_tl(TCG_COND_LTU, source1, source1, source2);
         break;
-    case OPC_RISC_XOR:
-        tcg_gen_xor_tl(source1, source1, source2);
-        break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_SRLW:
         /* clear upper 32 */
@@ -248,12 +239,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
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
@@ -730,8 +715,33 @@ static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
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


