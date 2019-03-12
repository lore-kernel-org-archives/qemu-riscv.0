Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUE-0003au-RT
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hU5-00031K-Jf
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hH9-0000Mg-6w
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:17:00 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42942)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hH8-0000Li-UH
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:59 -0400
Received: by mail-pg1-x533.google.com with SMTP id b2so1805706pgl.9
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=wmQxXdnItwDZ7YMD9M8z9eZnFinNDm2EgX8NAlrDaVE=;
	b=jrI5useJvSOcJaRtNVZLWEt1WI5x3GLW33DhGvPUj0PBQVEsGC9MpaSnqeG5faQM21
	bhmm6w+IlzZe9JNKAtv+S/r5cJsE0G6hOcH97fVccbIaAWH1ixcGxJOg5AJm0OrlzSQ0
	xxfnKk+RaADcA8e2ZqYpx5MLw21QBzBpNEPLlIKvsvZ7X7mX0/QHNpF/K0UCNQN8CQ+s
	X0XugIZBsqTqbOzQ5mq7M8QwcXcvlyazMKz+1tQsucNm5XfdDhYCcfSx4uuKvGB8c1Vr
	7G+aj3deyfi2xSlKd3Ii7mdWCCTvPw/CO45cRrJ2YTK/CSUwelMSEklgzfnNjkTiohBz
	lywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=wmQxXdnItwDZ7YMD9M8z9eZnFinNDm2EgX8NAlrDaVE=;
	b=CuVtD00wnGRh0ii0DporUzvFBJNKi2KAbZ/dWQjMv1V8gWjcCee/zJRI//RBLpY9sT
	UTr0Njo8wGxWP/yskmozCrwSVT8xDzjinJ4t0/ZAA3YGu3Na1tVxbYNuysOFBA0H82bG
	vu7CBnWSs/HKMeTWZfDn7P8GOSAiYUIJuSXEQ0+ZMOwQEOPzTl8BBKJECXAbAzWp9Owu
	1MExLKZYfQ+HAQxRwHdnnsP5rvIvgWhn2LhUbeXW2rI1/NiuSVroF4+s6ZXcGLIdv1H8
	i8OGJbqmumfGgPsH2kT2tnTQtZDoVOr0Xu1Ii3HY3B/6MepOb7igc4E3l2GzQOJ+T/0X
	Qt9A==
X-Gm-Message-State: APjAAAVuOV6/V7jmX6jk5sRIf/1F25W0DToTxWnVc90c7bLGK8LQuxL4
	CcpeF5Bh5wi2q171m9Sbjw1Npg==
X-Google-Smtp-Source: APXvYqzNfiYkSPxSOQAaP86iZib07IsK/hQ4itDvos6DuLrpnWM9XXVUMNC7EKqXBCQx1Xgt1VWGyQ==
X-Received: by 2002:a17:902:1025:: with SMTP id
	b34mr40518583pla.306.1552396617129; 
	Tue, 12 Mar 2019 06:16:57 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	a4sm10438239pga.52.2019.03.12.06.16.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:56 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:22 -0700
Message-Id: <20190312131526.14710-26-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190312131526.14710-1-palmer@sifive.com>
References: <20190312131526.14710-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::533
Subject: [Qemu-riscv] [PULL 25/29] target/riscv: Remove shift and slt insn
 manual decoding
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:28 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 93 +++++++++++++++++--------
 target/riscv/translate.c                | 59 +++++-----------
 2 files changed, 81 insertions(+), 71 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 8879f2da35c7..88ef0003ec17 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -220,30 +220,25 @@ static bool trans_addi(DisasContext *ctx, arg_addi *a)
     return gen_arith_imm(ctx, a, &tcg_gen_add_tl);
 }
 
-static bool trans_slti(DisasContext *ctx, arg_slti *a)
+static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
 {
-    TCGv source1;
-    source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
+    tcg_gen_setcond_tl(TCG_COND_LT, ret, s1, s2);
+}
+
+static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
+{
+    tcg_gen_setcond_tl(TCG_COND_LTU, ret, s1, s2);
+}
 
-    tcg_gen_setcondi_tl(TCG_COND_LT, source1, source1, a->imm);
 
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
+static bool trans_slti(DisasContext *ctx, arg_slti *a)
+{
+    return gen_arith_imm(ctx, a, &gen_slt);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    TCGv source1;
-    source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-
-    tcg_gen_setcondi_tl(TCG_COND_LTU, source1, source1, a->imm);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
+    return gen_arith_imm(ctx, a, &gen_sltu);
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
@@ -322,20 +317,17 @@ static bool trans_sub(DisasContext *ctx, arg_sub *a)
 
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
 {
-    gen_arith(ctx, OPC_RISC_SLL, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_shift(ctx, a, &tcg_gen_shl_tl);
 }
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    gen_arith(ctx, OPC_RISC_SLT, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_slt);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    gen_arith(ctx, OPC_RISC_SLTU, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_sltu);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
@@ -345,14 +337,12 @@ static bool trans_xor(DisasContext *ctx, arg_xor *a)
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
-    gen_arith(ctx, OPC_RISC_SRL, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_shift(ctx, a, &tcg_gen_shr_tl);
 }
 
 static bool trans_sra(DisasContext *ctx, arg_sra *a)
 {
-    gen_arith(ctx, OPC_RISC_SRA, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_shift(ctx, a, &tcg_gen_sar_tl);
 }
 
 static bool trans_or(DisasContext *ctx, arg_or *a)
@@ -419,19 +409,62 @@ static bool trans_subw(DisasContext *ctx, arg_subw *a)
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
-    gen_arith(ctx, OPC_RISC_SLLW, a->rd, a->rs1, a->rs2);
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_andi_tl(source2, source2, 0x1F);
+    tcg_gen_shl_tl(source1, source1, source2);
+
+    tcg_gen_ext32s_tl(source1, source1);
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
     return true;
 }
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
-    gen_arith(ctx, OPC_RISC_SRLW, a->rd, a->rs1, a->rs2);
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    /* clear upper 32 */
+    tcg_gen_ext32u_tl(source1, source1);
+    tcg_gen_andi_tl(source2, source2, 0x1F);
+    tcg_gen_shr_tl(source1, source1, source2);
+
+    tcg_gen_ext32s_tl(source1, source1);
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
     return true;
 }
 
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
-    gen_arith(ctx, OPC_RISC_SRAW, a->rd, a->rs1, a->rs2);
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    /*
+     * first, trick to get it to act like working on 32 bits (get rid of
+     * upper 32, sign extend to fill space)
+     */
+    tcg_gen_ext32s_tl(source1, source1);
+    tcg_gen_andi_tl(source2, source2, 0x1F);
+    tcg_gen_sar_tl(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+
     return true;
 }
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8eb883463322..9ae40f65096f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -198,47 +198,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     gen_get_gpr(source2, rs2);
 
     switch (opc) {
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_SLLW:
-        tcg_gen_andi_tl(source2, source2, 0x1F);
-        tcg_gen_shl_tl(source1, source1, source2);
-        break;
-#endif
-    case OPC_RISC_SLL:
-        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
-        tcg_gen_shl_tl(source1, source1, source2);
-        break;
-    case OPC_RISC_SLT:
-        tcg_gen_setcond_tl(TCG_COND_LT, source1, source1, source2);
-        break;
-    case OPC_RISC_SLTU:
-        tcg_gen_setcond_tl(TCG_COND_LTU, source1, source1, source2);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_SRLW:
-        /* clear upper 32 */
-        tcg_gen_ext32u_tl(source1, source1);
-        tcg_gen_andi_tl(source2, source2, 0x1F);
-        tcg_gen_shr_tl(source1, source1, source2);
-        break;
-#endif
-    case OPC_RISC_SRL:
-        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
-        tcg_gen_shr_tl(source1, source1, source2);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_SRAW:
-        /* first, trick to get it to act like working on 32 bits (get rid of
-        upper 32, sign extend to fill space) */
-        tcg_gen_ext32s_tl(source1, source1);
-        tcg_gen_andi_tl(source2, source2, 0x1F);
-        tcg_gen_sar_tl(source1, source1, source2);
-        break;
-#endif
-    case OPC_RISC_SRA:
-        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
-        tcg_gen_sar_tl(source1, source1, source2);
-        break;
     CASE_OP_32_64(OPC_RISC_MUL):
         if (!has_ext(ctx, RVM)) {
             goto do_illegal;
@@ -742,6 +701,24 @@ static bool trans_arith(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static bool gen_shift(DisasContext *ctx, arg_r *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
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


