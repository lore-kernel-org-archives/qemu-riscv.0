Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtf-0002Fr-6R
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtR-00021w-P0
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtM-0002xv-JM
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:13 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36023)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtL-0001Wg-WD
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:08 -0500
Received: by mail-pl1-x636.google.com with SMTP id g9so1356159plo.3
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=+s1sqTEtCZ3RAMZxWX+p6Y4eJXedYntHNQmeNyvQCFE=;
	b=iqJkpY0+Qm0qLK6+lG8Q9dmR4cwuvDyOa7mOd1tYc7OiC0SaXHfz2UhBXrgz05cWBK
	KQOCYXtXnxQ+1zIzHvMqjZAMJecm+seozBIq6gssDO7SXzFWUMIqjoQjYI7YAEVCtrKf
	vxrFnETnhljpek9yFj8TTA/dTxUpKHWgNP2/kjNtleIThGMfjoVrvm2Pl4a+lW/AousU
	gc72MjO6+kmZrtsPRfgXvV+k6gnuBDvCcsSGp51gvk3gfQfUtvOc3PtkhPT/T20eJq1U
	v3xYecXiQdil1nkjlEtZQR0P0kMeZEpZf2TXsf7Gb0l6DfMhWlFJ8aqd+dbhToFMgKZR
	ZhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=+s1sqTEtCZ3RAMZxWX+p6Y4eJXedYntHNQmeNyvQCFE=;
	b=h0N+ANYue7MstvYvxCL+QnNDZeiLe5pgnEmQbk0vn3tj7rfwCbXGrouJnLznAepEbL
	RXNj9Q50OcXA4go1PKmPaHJwRXwG7euNUZHqOqwTGWIAURu4YuavW+IaamrK+GUVtRXX
	ohRjnMEjTsSsm45ofyZTyrVH3b0FkpfUVJEkn2aUDSawVk6zQgGprTu5EFKHcSQOAvzg
	pXYSHYMoEQJiUr2QNAnCttxpvVgg1d6xBPz0N0yekx6k/ea36aUyBIQjjLOEWyEB/njj
	t2AVVcGVPRb+ZUkFDCQ6uV5UpZdL/AksCiBVYkntEQOBBOCrbE/T4oSdVYGfdCfUmx4T
	x2DA==
X-Gm-Message-State: AHQUAubrsDRDl/mu3qqrl9YX3LEI9pNbTT8ECDI4pNu6aw7b50+NNfhP
	h119c9ANpm4TBS7rWy2LByagUw==
X-Google-Smtp-Source: AHgI3Ibt9K/8BxpopCM+e6yYm9/2uuKqEFYV2c8rr61u2VWe96vias1ZDJJo7G8lwm4BFAdNbCU7/w==
X-Received: by 2002:a17:902:9885:: with SMTP id
	s5mr1231426plp.52.1550073312290; 
	Wed, 13 Feb 2019 07:55:12 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f13sm17972819pgq.82.2019.02.13.07.55.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:11 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:01 -0800
Message-Id: <20190213155414.22285-23-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::636
Subject: [Qemu-riscv] [PATCH v7 22/35] target/riscv: Remove manual decoding
 from gen_load()
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:24 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

With decodetree we don't need to convert RISC-V opcodes into to MemOps
as the old gen_load() did.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 35 +++++++++++++++----------
 target/riscv/translate.c                |  6 +++--
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 000cb6a37bdd..a3e00140d7d0 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -129,34 +129,43 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
     return gen_branch(ctx, a, TCG_COND_GEU);
 }
 
-static bool trans_lb(DisasContext *ctx, arg_lb *a)
+static bool gen_load(DisasContext *ctx, arg_lb *a, TCGMemOp memop)
 {
-    gen_load(ctx, OPC_RISC_LB, a->rd, a->rs1, a->imm);
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+    tcg_gen_addi_tl(t0, t0, a->imm);
+
+    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
+    gen_set_gpr(a->rd, t1);
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
     return true;
 }
 
+static bool trans_lb(DisasContext *ctx, arg_lb *a)
+{
+    return gen_load(ctx, a, MO_SB);
+}
+
 static bool trans_lh(DisasContext *ctx, arg_lh *a)
 {
-    gen_load(ctx, OPC_RISC_LH, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_TESW);
 }
 
 static bool trans_lw(DisasContext *ctx, arg_lw *a)
 {
-    gen_load(ctx, OPC_RISC_LW, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_TESL);
 }
 
 static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
 {
-    gen_load(ctx, OPC_RISC_LBU, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_UB);
 }
 
 static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 {
-    gen_load(ctx, OPC_RISC_LHU, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_TEUW);
 }
 
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
@@ -180,14 +189,12 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
 #ifdef TARGET_RISCV64
 static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
 {
-    gen_load(ctx, OPC_RISC_LWU, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_TEUL);
 }
 
 static bool trans_ld(DisasContext *ctx, arg_ld *a)
 {
-    gen_load(ctx, OPC_RISC_LD, a->rd, a->rs1, a->imm);
-    return true;
+    return gen_load(ctx, a, MO_TEQ);
 }
 
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a3e77b88f6e9..82ccb7192921 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -532,7 +532,8 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
+#ifdef TARGET_RISCV64
+static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         target_long imm)
 {
     TCGv t0 = tcg_temp_new();
@@ -551,6 +552,7 @@ static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
+#endif
 
 static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
         target_long imm)
@@ -724,7 +726,7 @@ static void decode_RV32_64C0(DisasContext *ctx)
     case 3:
 #if defined(TARGET_RISCV64)
         /* C.LD(RV64/128) -> ld rd', offset[7:3](rs1')*/
-        gen_load(ctx, OPC_RISC_LD, rd_rs2, rs1s,
+        gen_load_c(ctx, OPC_RISC_LD, rd_rs2, rs1s,
                  GET_C_LD_IMM(ctx->opcode));
 #else
         /* C.FLW (RV32) -> flw rd', offset[6:2](rs1')*/
-- 
2.18.1


