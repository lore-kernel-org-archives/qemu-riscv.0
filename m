Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUY-0003tM-VB
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUO-0003Hi-Rq
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGx-0000Cv-Dd
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:48 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44028)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGw-00008c-Fe
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:47 -0400
Received: by mail-pg1-x531.google.com with SMTP id l11so1797690pgq.10
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=Q2qhpdUhuvUe81gI8Uek6bSRoc1YAPzkYaFaPxjIAN4=;
	b=GFfSSiU95+AIKgH6wbTPmYVMEwvjaczjVKR8lmn5GM2Sv1onn9AtaTrB8NGKzEddkv
	DRsSv+ELpqL8DKkEBDhnVNyIEf0vvLLghHg/AJLo3pdyKT/dSl+xaDloYP4OJJDEBMNR
	SrucYdl8s9vh3th578ZM2+iGBLeG71l0dRB147OdfQPIcysbb1znE24P41dXDYiSJeva
	ZVxgGnXDrD1uAa3kTwxJxqJT+Mn8/DXXwt5obBIo/fb9ARVTtqCbL1qWu8BNqbv7aSo+
	uJjzPiJ1ydFVV+tyPDyev1coGFZR9kXX4623VXHCFJP6z8vBIIO+86gN5GUEt0E1VTg/
	MADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=Q2qhpdUhuvUe81gI8Uek6bSRoc1YAPzkYaFaPxjIAN4=;
	b=nGm37uGf1/Qo9ljyyYENQVwvZHe3JH1u8+L6mX/vFBcBqu2hW8TAWw2PcjuHbm8xNp
	MjOkOeVwmzuC4b9Kq1p2xa5nkqih2r1NnNGm5Q6+e0b58Dt23fpaWdjB+oiZcooTjMMN
	MmUAA9Q6im4apslqchPSDiqOLs8VV5Sc6Lg4AYMsR0PmxnoIM/RywH55aF7oW+HptEJV
	0s0cBIb56twvxG627lX32EXplx0brma0A5FIDVyd6gf3PRWmmHKL+8ltLXJoJDCJuqq1
	c2Nfimr+q8ly+LaumnDXpNuCl+KMDHfnfIzQrvENIJjshl9VM1fWt6qwB5NLBM7244Ow
	rygw==
X-Gm-Message-State: APjAAAUpZ/JHxbYWQp/xRLqd4TwUy8TL8HruYUZo7OsgZHUAQF1+H70s
	NGnCAQVE4He4hzxhcmqqwhrJzg==
X-Google-Smtp-Source: APXvYqyHEwT69F9OVjqaaKb8cXv7braEhBJN5Ul5tlK7pOJGf25DTCXY1O0z8F2bLlALmb/uzVP5Qg==
X-Received: by 2002:a63:ed0b:: with SMTP id d11mr34803136pgi.435.1552396600973;
	Tue, 12 Mar 2019 06:16:40 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	f65sm13765587pff.21.2019.03.12.06.16.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:40 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:17 -0700
Message-Id: <20190312131526.14710-21-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::531
Subject: [Qemu-riscv] [PULL 20/29] target/riscv: Remove manual decoding from
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:49 -0000

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
2.19.2


