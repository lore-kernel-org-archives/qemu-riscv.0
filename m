Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4566-0000iF-0v
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4560-0000SZ-BY
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h451I-0004dN-2I
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:12 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38930)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h451H-0004cw-TJ
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:12 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i20so1523802pfo.6
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=Ufl9mIvfBvqXJlM4yPEMo9b41vDNqWzzYMaqmxB/A98=;
	b=m/85Z2VR3B3PDctK/yf7UBSTNGfCUiv0Xd+SdbgHcsBlvVQHx46NXNMBNGj9iRWkZW
	GZjoygVJCY4bmxkVOu5jZR3RxzX/v5IJJgWZYD73i6q0tS+k8IybPmadiz0o+bG/saAK
	SiAdVCS/juFfxkUDTuPQ2fjzMQ2Lmllj+6T+9jZUW9US1dzvNe5BqS9Qi9ERzx+Qo49c
	Zc9q+3TxHEqCRszORl5fOdOqyfycaxtLQcbqprnECBbQrZtrU50PxIIaZIuqWqlkbfZ5
	JaJ4krDQwJhTxNQUjeXHTdTto38MyG3hW7mCj9QUIGcmHLWUnyonflSTuzI5eHOebf9V
	RlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=Ufl9mIvfBvqXJlM4yPEMo9b41vDNqWzzYMaqmxB/A98=;
	b=lAMyQeE3iuuDK/tvq3KjV71pyXRACrqCEO3GmoXUF6VJPMOPcLdxw1owUQbktVYUrs
	ff9tCPxwbpq4IPRLVuk/LD8GvbpGoE5GTvLYujwMLKAEHUSLWJNEWcRyiNNaPzuYrGTg
	QItbBsEyFQIW7NwLBuNxkSdq+wuVxvJzqVdaHTBJ5mHQmtPqsjxhQXg0X+Y2C5obhayA
	p237XDPBp2einnqMmGGMTGrnxtKgkomaAo84C4A0/tLtxbrz/vyHU4Td5JqDprMrPuLX
	sEhV/STeMSMeychRXmqtgtGMzdD6DYrDY2i4uLl9yI4CnIVXnyQr2dERQgYqkrsLFq8P
	kEZA==
X-Gm-Message-State: APjAAAVDiGJhpmcTsImgEl/6D3wjShoc71pK/teyv/OzMAbgazHfCIv8
	mWttRiTGK8Mo6gZotNP1OWDS/NfWEnk0YwAJ
X-Google-Smtp-Source: APXvYqw6yOoLZMKPFifpFnWLBwkafMNynQXDXon4UYr5BPE+6pGIIpX5GeUUT8AizUFZSowvZh9Saw==
X-Received: by 2002:a17:902:b111:: with SMTP id
	q17mr8369823plr.230.1552487890675; 
	Wed, 13 Mar 2019 07:38:10 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	p34sm24614180pgb.18.2019.03.13.07.38.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:38:09 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:55 -0700
Message-Id: <20190313143705.29129-20-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::42f
Subject: [Qemu-riscv] [PULL 19/29] target/riscv: Remove gen_jalr()
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:05 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

trans_jalr() is the only caller, so move the code into trans_jalr().

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 28 +++++++++++++++++-
 target/riscv/translate.c                | 38 -------------------------
 2 files changed, 27 insertions(+), 39 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 4a23372cb823..631a88906bce 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -42,7 +42,33 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
 
 static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
-    gen_jalr(ctx, OPC_RISC_JALR, a->rd, a->rs1, a->imm);
+    /* no chaining with JALR */
+    TCGLabel *misaligned = NULL;
+    TCGv t0 = tcg_temp_new();
+
+
+    gen_get_gpr(cpu_pc, a->rs1);
+    tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
+    tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
+
+    if (!has_ext(ctx, RVC)) {
+        misaligned = gen_new_label();
+        tcg_gen_andi_tl(t0, cpu_pc, 0x2);
+        tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
+    }
+
+    if (a->rd != 0) {
+        tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
+    }
+    tcg_gen_lookup_and_goto_ptr();
+
+    if (misaligned) {
+        gen_set_label(misaligned);
+        gen_exception_inst_addr_mis(ctx);
+    }
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    tcg_temp_free(t0);
     return true;
 }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 80afa2c1e62b..9dee2ec24287 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -531,44 +531,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_jalr(DisasContext *ctx, uint32_t opc, int rd, int rs1,
-                     target_long imm)
-{
-    /* no chaining with JALR */
-    TCGLabel *misaligned = NULL;
-    TCGv t0 = tcg_temp_new();
-
-    switch (opc) {
-    case OPC_RISC_JALR:
-        gen_get_gpr(cpu_pc, rs1);
-        tcg_gen_addi_tl(cpu_pc, cpu_pc, imm);
-        tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
-
-        if (!has_ext(ctx, RVC)) {
-            misaligned = gen_new_label();
-            tcg_gen_andi_tl(t0, cpu_pc, 0x2);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
-        }
-
-        if (rd != 0) {
-            tcg_gen_movi_tl(cpu_gpr[rd], ctx->pc_succ_insn);
-        }
-        tcg_gen_lookup_and_goto_ptr();
-
-        if (misaligned) {
-            gen_set_label(misaligned);
-            gen_exception_inst_addr_mis(ctx);
-        }
-        ctx->base.is_jmp = DISAS_NORETURN;
-        break;
-
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-    tcg_temp_free(t0);
-}
-
 static void gen_branch(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
                        target_long bimm)
 {
-- 
2.19.2


