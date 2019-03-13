Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h455w-0000Yj-6S
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h455u-0000I0-5M
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h451W-0004mB-Nu
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:27 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43100)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h451W-0004lY-IY
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:26 -0400
Received: by mail-pf1-x430.google.com with SMTP id q17so1510922pfh.10
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=CSVTaqppm2/LirOiLWtCJqLb9eW9MAiusGuua0n6QXg=;
	b=lJXICawy8yXea0f6VjlNr7vbAyxZU2VxKrDoPC94eAes9JzYV/BzPBmyOzOdr6ipfN
	4+tigi7OsWwKU2WGdqU5kXOb4wyKJ0b5si2t9KfLzE/yuLaT1zjv7k+zXEm9XDc/+ppu
	aYJb1y22GEkzDXT0h0qqpu/IVsjCsE7S5A1Z2OUFqLSgOCGYpGhbiAtfL9CC7XK0s1dO
	7rruqHpGlwmgprtiLGPcdeAK8FLHNUS3mY3rEun08jaF1JvM4bJn2i7pYK91JxNQGJcB
	89kk0hdrL02XcqA2G/soua83hA0J9Bv9gv5itmvrbrnOr/t2e7asSowaCEiFeHxpj9i/
	ax+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=CSVTaqppm2/LirOiLWtCJqLb9eW9MAiusGuua0n6QXg=;
	b=V4fyBSETUWqVM465B0cLKr1+nN3T7xLTBvfDAh0EbtAZ0nhFxaCUvkIIcXKtk4GRLq
	2tsBaZ355gtjmjmge10jSxAQMH28R0SpGrE1FsFzp0bNDtaeqiAbTGNtcAhHXDT/sLsy
	Z8wVOgSVd5THD1hEeVhqaa5fQ4xv+6Es2zqCGXc9sxqScFdXzg4zApGjAWJxGlGU7Fjp
	fyiYgtHvbilov5EMPq12bCNCXSX4PYG3nLnLaUGenbiXlBa6MDWrH+zoWIPM7uX38lNY
	pwZIKGNCw7lVwnu4ArguFhOI2QhNcc4I3K7Wo69C1A0fVaimyD++1nm5Nk1oESEj41yq
	q22w==
X-Gm-Message-State: APjAAAUDhBS2TR/yqa2U8ez51kq/uJo/eiUclHLLR07dKLzzpqSf8aK7
	wDAA3GTnP6iKcUSHm+6K9M8PfnkJahhq4fBY
X-Google-Smtp-Source: APXvYqwy2rN2goy9szrUt5BgC5qznBNxX22rFTYeaEUtdRstR2KPAl6Okp09B9fXEBcnKtHcqJ6AeQ==
X-Received: by 2002:a63:540c:: with SMTP id i12mr2130821pgb.69.1552487905248; 
	Wed, 13 Mar 2019 07:38:25 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	c2sm15609234pfd.159.2019.03.13.07.38.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:38:24 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:37:00 -0700
Message-Id: <20190313143705.29129-25-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190313143705.29129-1-palmer@sifive.com>
References: <20190313143705.29129-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::430
Subject: [Qemu-riscv] [PULL 24/29] target/riscv: make ADD/SUB/OR/XOR/AND
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
X-List-Received-Date: Wed, 13 Mar 2019 14:42:59 -0000

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
2.19.2


