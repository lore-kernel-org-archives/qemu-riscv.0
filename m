Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUR-0003mc-8Z
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUO-0002wr-GI
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGt-0000A0-FW
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:49 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41129)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGr-00006t-FD
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:41 -0400
Received: by mail-pg1-x52c.google.com with SMTP id k11so1807141pgb.8
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=x+KSY4trODYBFzC/37OIadxGaH6gv9HELNAGZ2ejb14=;
	b=hnzuZY4tg/RWQS+19FPpwmP9h+Ar/avnzXgbmPC2GJ4JSZpwAv4DG1UM1EcikhTaLN
	ItAn+Lh1EamipAdULwKYAYy9xIapTatMYVa0wbk6492caL36Q8e5JAXgg0F/Dw9SgIg2
	y9py8zondDfLaHIvcS5UwYSaZBgvAciUa0xSuyLc0u7p36aaU21GQQ3Zs7lkuxmKCdpv
	2eeDxHA4rpyYQ0XYM1n80XTHGIzL8eudr8d9vlXiCs2U0C183jttjOC6P2cQAuQg3yMU
	W+c2bWg/cBsMirwqEq2JO7WMklZDy562cO8mVi0liy/rxtX1Hc+8S8jB2ovrP0w20qIK
	e2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=x+KSY4trODYBFzC/37OIadxGaH6gv9HELNAGZ2ejb14=;
	b=WvkpAyLKw5v85zgko6wZ/C+PMt+q9DVD88Dv4RYITLYbziUC7br2uBdu2Gv5hs7DMA
	5RzMX1NsE1AdYo1n9iKCawGJcvhABoltIwCDq2KDp9nfujw4lkRanLNNm1+T4t687fB0
	/So6QmEuBqxWb0BCjvJGXaPLXoqv1yuSbFs4317ykwGI3f8ouectiV96LlSFUjvXP7kF
	N+QtGair4zpMNhWOLEIqUGntjfOBmkryBrE4vHA2yTrUyknq2tmbkNF5wVqa7fYksJsh
	vRb6NEfim8Y+R3FOaJq0xFoMRDo9q5cF2/iixqjTw64m5nDH03O2idCDud/OV/rmE68t
	frPA==
X-Gm-Message-State: APjAAAV2aon5/+EbK9e04Grs7imBHTsXqAPzK8NZcrAv5sJK1fpqaZNe
	65atl+udt0pKd1jRBPqyb9thKT8NoQeUGSrt
X-Google-Smtp-Source: APXvYqw0kjzYgu0/Bw1NlqR/tnm50pugJHNh7LOr+vWamu6pbs0ZURtHBrPa0OxECj6bpkF5eVaU2Q==
X-Received: by 2002:a63:704c:: with SMTP id a12mr5840202pgn.394.1552396597941; 
	Tue, 12 Mar 2019 06:16:37 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id d5sm3716609pgv.20.2019.03.12.06.16.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:36 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:16 -0700
Message-Id: <20190312131526.14710-20-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::52c
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:41 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

trans_jalr() is the only caller, so move the code into trans_jalr().

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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


