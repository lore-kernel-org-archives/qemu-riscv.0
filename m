Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3N-0003Mj-8A
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:50:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3J-0003I2-GJ
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3H-0002lU-GW
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:45 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45820)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3C-0002TW-Tg
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:41 -0500
Received: by mail-pl1-x631.google.com with SMTP id r14so12071772pls.12
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=J/zvCnEoCaCzroOkmeDRYnGJlKytzjjzy0HbekAttPw=;
	b=A4bQ5Z+cbtFtJ3/OAkhWHKpM5ayn9XX0yBId41cx+jxOkP5A+MPKhqnz4ixOSps+gF
	ukPjpFQHfHBMUy3ddBtMwn4aB0bmQab7H+IQ6j8dvGI4dFWcrEiQOUp4ymliFMIUXRlL
	wKiMEy960+gFX6mZ5IHehJvvewRN+54zpL9LLDQE1+xWSX/ZQ08SFKd8BQcdTkRyz2q1
	c6qxpAv4u7RMeRLhtb/Pl7okheSaEYmwLnJhFPs4eiZmBfHC7wWz+wZkeRmTxJrLGQMB
	Zfhy1F3Gt9gjV1bKcEf3dUBqaJktJ9eb0SPOLRWk8lM3/VleKhIX1VcRwzWYBVrBH89t
	0uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=J/zvCnEoCaCzroOkmeDRYnGJlKytzjjzy0HbekAttPw=;
	b=U/Jnimlv/Dh9VfF1InDHmqZEpVblI6tRzsg2hWBIuLiTTh9CrTqxkKfEq+sop0Wry5
	KXTV3psxJmb3fWj3ryros5H4XNeVbJzml86rgjuBy3zjxnUygVo0ke+KmJpa0R15BwSZ
	sktuQ4C8mNO6LtuBh/05nnNoQTxy51bwUXFofbi7fDWfuTfTeHr0m3xbUdD+Kyko+BsK
	x/ZAQtZohI+FslrhAeQgLp1QmlHT1weJjz7lwZ9n+9QBTGOVjL0+0rdIcSI+6C6H6Arm
	fkax6OD3jSwtlxH+8n81E+RLSwGxmsQjvQbx/quKOrsyzs/VrLbLojepOi1cDByBOPh0
	Qm7g==
X-Gm-Message-State: APjAAAXeIFJG3uguOpO5dw/SiskMs4wSm6lhKoEdpQtwlQLM4cLGhGrr
	Dyi8HwC0ynBf5WLfFOunCYcbEg==
X-Google-Smtp-Source: APXvYqz3Ew3XNuSLQDR1lOSQK3uMBPdKGJQn1q5n2B33LJfHtsoO/goT5Y3YenI/9jTWzF9s/fDEWQ==
X-Received: by 2002:a17:902:4124:: with SMTP id
	e33mr7773953pld.236.1551477030346; 
	Fri, 01 Mar 2019 13:50:30 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	j68sm49878533pfc.64.2019.03.01.13.50.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:29 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:31 -0800
Message-Id: <20190301214945.4353-21-palmer@sifive.com>
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
Subject: [Qemu-riscv] [PULL 20/34] target/riscv: Remove manual decoding from
 gen_branch()
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:48 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

We now utilizes argument-sets of decodetree such that no manual
decoding is necessary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 46 +++++++++++++++++-------
 target/riscv/translate.c                | 47 -------------------------
 2 files changed, 33 insertions(+), 60 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 631a88906bce..ae4b0a2bcb78 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -72,41 +72,61 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     return true;
 }
 
-static bool trans_beq(DisasContext *ctx, arg_beq *a)
+static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 {
-    gen_branch(ctx, OPC_RISC_BEQ, a->rs1, a->rs2, a->imm);
+    TCGLabel *l = gen_new_label();
+    TCGv source1, source2;
+    source1 = tcg_temp_new();
+    source2 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_brcond_tl(cond, source1, source2, l);
+    gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
+    gen_set_label(l); /* branch taken */
+
+    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
+        /* misaligned */
+        gen_exception_inst_addr_mis(ctx);
+    } else {
+        gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
+    }
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+
     return true;
 }
 
+static bool trans_beq(DisasContext *ctx, arg_beq *a)
+{
+    return gen_branch(ctx, a, TCG_COND_EQ);
+}
+
 static bool trans_bne(DisasContext *ctx, arg_bne *a)
 {
-    gen_branch(ctx, OPC_RISC_BNE, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_branch(ctx, a, TCG_COND_NE);
 }
 
 static bool trans_blt(DisasContext *ctx, arg_blt *a)
 {
-    gen_branch(ctx, OPC_RISC_BLT, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_branch(ctx, a, TCG_COND_LT);
 }
 
 static bool trans_bge(DisasContext *ctx, arg_bge *a)
 {
-    gen_branch(ctx, OPC_RISC_BGE, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_branch(ctx, a, TCG_COND_GE);
 }
 
 static bool trans_bltu(DisasContext *ctx, arg_bltu *a)
 {
-    gen_branch(ctx, OPC_RISC_BLTU, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_branch(ctx, a, TCG_COND_LTU);
 }
 
 static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 {
-
-    gen_branch(ctx, OPC_RISC_BGEU, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_branch(ctx, a, TCG_COND_GEU);
 }
 
 static bool trans_lb(DisasContext *ctx, arg_lb *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9dee2ec24287..a3d5cdbad82d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -531,53 +531,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_branch(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
-                       target_long bimm)
-{
-    TCGLabel *l = gen_new_label();
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-    gen_get_gpr(source1, rs1);
-    gen_get_gpr(source2, rs2);
-
-    switch (opc) {
-    case OPC_RISC_BEQ:
-        tcg_gen_brcond_tl(TCG_COND_EQ, source1, source2, l);
-        break;
-    case OPC_RISC_BNE:
-        tcg_gen_brcond_tl(TCG_COND_NE, source1, source2, l);
-        break;
-    case OPC_RISC_BLT:
-        tcg_gen_brcond_tl(TCG_COND_LT, source1, source2, l);
-        break;
-    case OPC_RISC_BGE:
-        tcg_gen_brcond_tl(TCG_COND_GE, source1, source2, l);
-        break;
-    case OPC_RISC_BLTU:
-        tcg_gen_brcond_tl(TCG_COND_LTU, source1, source2, l);
-        break;
-    case OPC_RISC_BGEU:
-        tcg_gen_brcond_tl(TCG_COND_GEU, source1, source2, l);
-        break;
-    default:
-        gen_exception_illegal(ctx);
-        return;
-    }
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-
-    gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
-    gen_set_label(l); /* branch taken */
-    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + bimm) & 0x3)) {
-        /* misaligned */
-        gen_exception_inst_addr_mis(ctx);
-    } else {
-        gen_goto_tb(ctx, 0, ctx->base.pc_next + bimm);
-    }
-    ctx->base.is_jmp = DISAS_NORETURN;
-}
-
 static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         target_long imm)
 {
-- 
2.18.1


