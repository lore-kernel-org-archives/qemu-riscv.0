Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUP-0003l7-W5
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUM-0002x0-Lu
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGz-0000Ej-Gw
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:50 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGz-0000Bp-8E
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:49 -0400
Received: by mail-pf1-x431.google.com with SMTP id u9so1833522pfn.1
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=UyxLicd7f0QJ/WTbR8fwB4M0mL8dTflNVrYGmVM3DCY=;
	b=TE/OAJ88Q8ihUo9+5/qEJvLjdG3rlRBSOuXcW+dpDLwh7c9XX5G67dtCfvI6zQQbzG
	iUFxFpttRFemZqblwOy8S4xSSCS3L4O5ZXL+iSeXa6xzWcStshAFPfI+8Rt43Dj6G7GE
	uuPvZ2FE1KD1jXIhrjZdSXVgkydFddhSVQHdgueCZg0pc6/zcvdp0+nnGuWw6zpJvxGk
	b9LFrE+N5NYFjbSBQHNpy09zRWroX4FwEa91ZriObOvSCs4+FL7qQaCn3xkZZDjVWtV6
	TQyVIr+XXYz+kdZ6HeftwF+fQsGgK0os1WTtMxjGpiSqtG5IMW3um27uiLUoZNQmCMDr
	KTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=UyxLicd7f0QJ/WTbR8fwB4M0mL8dTflNVrYGmVM3DCY=;
	b=nSfax+NoIKqqA+eOPvzN52uPX0bI1N8gXZY/p1L7QaUGV3oXodLHZd8uN+OYOTefDY
	+ZUCrIC1pFFAZr+LbIdfXCRWGNBKtHbxx1hxlPNW7WqQ7BbQt2NqGQA3bQ07cbpHr4j6
	0ZtMNL7mq/Q0cdjZXNjSeiZvi5C1MneFqieJJPrrAKbBwou+Vma9epxEnfsOnylqVu28
	g3oxZB1eJeJysplwUYAcRuy/JJnZEpEOKgBBgqxfI7MleGnBxN6fsTxo+tln+JkfIVrn
	7/KzyCVVhxa0H/0yqeBS/PHK0X9gxSku5nQW0Znvu/sphGpZdeGz6M6x8cPkuT5yuwZ2
	xGvA==
X-Gm-Message-State: APjAAAUap9drHzBg1gD2Vizs0aJg9KtnzRyYa1uRUiDtTQDyMjICNvn3
	TwMMIMD6wiaa1/5Xb9BCYDZ7pKoQ0uroAAdg
X-Google-Smtp-Source: APXvYqyIKsooy7krBw0U/1V83rAF452zXSJd4VYDwZhF8IX+Ydc1XeSP0xkKcrYSqNvHlR39SAWWxQ==
X-Received: by 2002:a63:5b25:: with SMTP id p37mr45078pgb.243.1552396604280;
	Tue, 12 Mar 2019 06:16:44 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	p7sm12295251pfn.17.2019.03.12.06.16.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:43 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:18 -0700
Message-Id: <20190312131526.14710-22-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::431
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:39 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

With decodetree we don't need to convert RISC-V opcodes into to MemOps
as the old gen_load() did.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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


