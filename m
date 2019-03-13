Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4561-0000cG-OV
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h455w-0000SZ-1j
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h451N-0004go-K8
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:18 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h451N-0004gR-Ez
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:17 -0400
Received: by mail-pg1-x529.google.com with SMTP id m2so1674797pgl.5
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=HUnEnyVI5R14VnpTsQIzTVL2LLaAC5bjc0Ce0VOCkPE=;
	b=UezjtZHyI2dQCbuJProqItCBO/Dk7UxAq38+lucuRNw367q7RoMmqSBZQxkuQtB4gx
	Uthw1mztByg94NAiGQKqy5huKQv59bqy753wfC1YZTjpcLQyDng7VLE1cJTBWSGdayxO
	vS58OnPh70WCOCRgEjf2Pf9xpuJeoEAKis8+vb1dXtvgyYtpxeI5mzOx9rK1yKg0Dfqs
	GJmzJw1cfmbCFHVLAtNVdCSuwV5zs6vQiE5tve7N+U4YhF+/SaEe5irhJlPC03bzyWa+
	4guEPKmLEtEvcb14twRzPEgj0VtasJ/MxSmjnVGZcOSKGdbWaWBXDmFHe28/wMNab1a/
	WbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=HUnEnyVI5R14VnpTsQIzTVL2LLaAC5bjc0Ce0VOCkPE=;
	b=nJ9DWp4vy85x2Cz6C5b3cSbRR8mpe8e2LUhAoYbSzKxH6EM4Nw3mraOi6Pufz+ZNmC
	kIhWGV0EeYnVWNyPuQiWL1qDIaUYBpaOtq492g61SYUVfm/cBF4R6qzvXQ4gxXGTSWY0
	K1VqPqOTxPacYZw5z2sic3EjfPin13KIzzX6gixPPBZ1OwKjGFmUFFAQfYqoYQy7WIrj
	LqU7IXc26YzbF7av7si2s+xvZdcWa50oosU69b6pZslrm3e8NSIJIx+tNExZnehKdBkn
	8pDNBYZGXlwZspLIo4+TFA72HVmPPyqNG643vmJs63jfGl4YbIQSkpgnJO9Sq0X55QSg
	1qdQ==
X-Gm-Message-State: APjAAAXkJA3WBkuCV2ECbRdz5ar2fhs9G49IAWHzEL98WGFUUTA7u45b
	daVF5rY5gcvkht8MJyqHw13bqYTU0jQoeQ/C
X-Google-Smtp-Source: APXvYqy4610rPqnN1mk3mVVfiUs7WF7Mu91uo9vgkAUbSUiHyP13ro3sXQsqrHU2wgjo9jkp6KzL1A==
X-Received: by 2002:a17:902:f095:: with SMTP id
	go21mr44879452plb.199.1552487896237; 
	Wed, 13 Mar 2019 07:38:16 -0700 (PDT)
Received: from localhost ([122.146.90.161]) by smtp.gmail.com with ESMTPSA id
	l2sm15781998pgj.64.2019.03.13.07.38.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:38:15 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:57 -0700
Message-Id: <20190313143705.29129-22-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::529
Subject: [Qemu-riscv] [PULL 21/29] target/riscv: Remove manual decoding from
 gen_load()
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
index ae4b0a2bcb78..cc361ed4d151 100644
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
index a3d5cdbad82d..99d6d3b4ae91 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -531,7 +531,8 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
+#ifdef TARGET_RISCV64
+static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         target_long imm)
 {
     TCGv t0 = tcg_temp_new();
@@ -550,6 +551,7 @@ static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
+#endif
 
 static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
         target_long imm)
@@ -723,7 +725,7 @@ static void decode_RV32_64C0(DisasContext *ctx)
     case 3:
 #if defined(TARGET_RISCV64)
         /* C.LD(RV64/128) -> ld rd', offset[7:3](rs1')*/
-        gen_load(ctx, OPC_RISC_LD, rd_rs2, rs1s,
+        gen_load_c(ctx, OPC_RISC_LD, rd_rs2, rs1s,
                  GET_C_LD_IMM(ctx->opcode));
 #else
         /* C.FLW (RV32) -> flw rd', offset[6:2](rs1')*/
-- 
2.19.2


