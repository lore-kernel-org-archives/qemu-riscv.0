Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwth-0002Ht-8k
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtT-00023z-Sm
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtM-0002z0-TC
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:15 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34653)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtM-0001V1-Hm
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:08 -0500
Received: by mail-pl1-x634.google.com with SMTP id w4so1361094plz.1
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=4pdDUSthSFaNpctciMvnBam+yyiPaqzqjMabFEflHNE=;
	b=LMfew2DFV1TlcWXmhXpth2dRFfDcROD8/M5zMpmazhaQZAuXgwAfJIhDD1wEfoatsh
	10fqftP5wRFGSkX13D5dt7ibjsSvlnCp4wK/BopURLF3qFEuIi/DMzwVaZ1DkuUIP9ie
	q4+3TqMhQ31fU4dgktxNB13WzVwhPumrvmlgAAEYqYCghbbo+Scm2yRaxwPm8PFbhu9E
	0hKvFh4JzB1hI4QDAH11zMUwNMFp/Cs6mZAE7wvJm8BTG7q2UcPigrZDvSUy58uq09S9
	rTfDJQ+K1aDoY9Mof8s16OkSQmW5Cw4Mex3Oa3Nn2frrKbq6lY0Z6wteDArXpTtOiBfq
	bvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=4pdDUSthSFaNpctciMvnBam+yyiPaqzqjMabFEflHNE=;
	b=cCsgcUm0R2sZ7xY6yiGGoejpdeZo8+tP9YF6TxktrRWKfJKFt4BzBhMU3MJwi5c7yD
	N7CzMKMqOOUA7WxeMPspL1h3z0PJq65TAw//z/3z6A417/1BnZrW1gTnj3PxBSXQsH5M
	d7/9Hv2FMDd5GxKl9/W1dH/Yr7lQFVWjRSOi5zzZa5UHO46ZpK8dPnItjWXCZFKgDxEt
	ksshDCbEwqWyLLUEWlLEN8B+CUmAaCVxsyD+XYtOBDnoGYD62RSri9caVDgBQBWmZB9S
	9erTj6NWgJWelmoqpHEicet49qiLtabxR2MEqiDjZjF3BZVwBXstD3jUcyY/7fuB3gkY
	2U0A==
X-Gm-Message-State: AHQUAuY59y5aO1tYaSoz568bidQxWud/xFP7RuKUfDya9DuEDqCKSTfi
	wpqvQ3hBNpYdxW301TZknXbRxQ==
X-Google-Smtp-Source: AHgI3IY9aFt9/ShfwCJMBB0r3igsz/UKRlCOv0DNWItGPUBPpm4w24ZXZJjm3UofQJdkNWv0uizTqw==
X-Received: by 2002:a17:902:1a2:: with SMTP id
	b31mr1176528plb.87.1550073310741; 
	Wed, 13 Feb 2019 07:55:10 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	e9sm74772154pfh.42.2019.02.13.07.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:10 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:00 -0800
Message-Id: <20190213155414.22285-22-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::634
Subject: [Qemu-riscv] [PATCH v7 21/35] target/riscv: Remove manual decoding
 from gen_branch()
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:26 -0000

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
index 39af38081ede..000cb6a37bdd 100644
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
+    if (!riscv_has_ext(ctx->env, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
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
index abdcd0631af4..a3e77b88f6e9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -532,53 +532,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
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


