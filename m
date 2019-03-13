Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4561-0000cb-WC
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h455w-0000I0-Gz
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h451K-0004fP-VU
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:15 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h451K-0004el-QG
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:14 -0400
Received: by mail-pf1-x433.google.com with SMTP id d25so1513785pfn.8
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=CJije1N9VEU+KmGXkjNd3i7L8/MbjB95YQIq3e8m+MM=;
	b=gs0tNbdsDf58HLaWqTrZ7NIJdbA94Kxvs1/cCLGp7ARXBjmQ/e2oQpj2N3Y+Tx8rx9
	DY54Q4wel+5zTXYNi5ygg2Ys883TY28aT2uhz0mMaVnWBf5IyigcQB+13s7KO9u/EkFD
	t5jB7XU8uFo1hxyjSEkqLxrI5rSZ0eLQQ7YPbHKTCq2PfT8Ali+5uG/IS8II+x2QjWk9
	U9SZBgdoJj3T/YG+dxcrNX1tVBqHGWXskuI+zKiLG2dtggpEGCjSz36mU+KCclGUSo9Z
	mB4FChbv5kCfE3KYFQUIUIvIy7TYbmWcDgUDzXrxSG2jCN049o8wkhS1vZM7eB+RZ0ZA
	dyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=CJije1N9VEU+KmGXkjNd3i7L8/MbjB95YQIq3e8m+MM=;
	b=LHLWl40hxPqttt2oj9ZVuNAPrc3z479cFnOMHDgyeEWeNq5kTLk/E1hkZMGL7a2N4l
	bRWrujznJlP9sN/OGRuxIYBIDTY3DqoZTZEc863/7fh1VWH5CfdGqdZxRXDXNe7xxg2I
	F7Jsy2Mu7FuM/wpQ9JUPSOnK1GB4DfOkzCqzw7Nw6vnQgcqd6jcQkJwY2mfkeanx6E//
	s2Q1tpENa1FZxtwsjTnoN//9lpN53xUyv9dNdSO858sV+5gBJn4qmfPlP9IQ+NzmEelI
	7/aTKeoKvHhko9/dvJXgvN8b5mSw3pZmMYqA1Uj8Ws36yUJ1uSWrsyPL++JwNg0TXwlm
	sSeQ==
X-Gm-Message-State: APjAAAVu2UQg4mxS7bbMngPmDx2douPUbPSBrYtm2DqDiZssClQxumXD
	q6hzDG9UnyimS/EIpIuew4uNaClxKCm1kEzb
X-Google-Smtp-Source: APXvYqxJ1Rz28bHBXIpM00c+AqaPtJ0rcAwEhyuwQVbwRf3SgbdKxRbkbpy1gKz+DsTbWmB12oCxpg==
X-Received: by 2002:a17:902:e40a:: with SMTP id
	ci10mr22554276plb.77.1552487893494; 
	Wed, 13 Mar 2019 07:38:13 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	p2sm26044440pfi.95.2019.03.13.07.38.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:38:12 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:56 -0700
Message-Id: <20190313143705.29129-21-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::433
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:04 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

We now utilizes argument-sets of decodetree such that no manual
decoding is necessary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
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


