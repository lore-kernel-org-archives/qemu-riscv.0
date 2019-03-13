Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456G-0000ze-SK
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4566-0000SU-TS
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h450t-0004Jx-Kp
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:49 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h450s-0004IE-AF
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:46 -0400
Received: by mail-pf1-x432.google.com with SMTP id d25so1512783pfn.8
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=gf7GuhzTbNSEG56QPkZpwiuw4/+z13/+nUo/8nIlnG0=;
	b=aiIU+QoKay9yjsbuu8qnVOcrX61vxnbjNogB5aC+a8Yr0Ngac4VI5nOdulG1i+3w6H
	7HSEIXkiGhbu+ju4KajxTTC+3rSbqRJztIMQnEk9Ll5ViBECq+gFTQHrp9jFMnCirtbv
	0mG6ZTShYVw0xzGnH4piqvY7Drpy60ZESK51rYlqpLOJWASAxSCfh+LbjbZOTw9gs/9a
	y/566XOfoHVo4dvf6V/vBwSibt/wCV0V9xFBtm5WL40WrrqGItYW/fB3TITmMpRC0rLw
	kMKsOUpd5uVDkru3Re63vUr47Iq39ELwCSc0bfmtnvar3UFIjqJhI/18v4XUS0XAGpae
	4iDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=gf7GuhzTbNSEG56QPkZpwiuw4/+z13/+nUo/8nIlnG0=;
	b=Q96b3CqfViSZ+F89JKESe0qoxyErDaFsFM1qjxa6n0Zko+MpzhiP+ZNVbs2KYIxH2P
	n3uKqKzobMzjomlQ6M8rbCxz/D689VNllw0OR1JqTmB9pcNh1XGT4zVK9hbM+AyF8+y7
	83XxpqVjadKcZ0vJez+ImFY/590YzFF80QaH5Zo4moQp/QtWoCSDhvkN25ZPa8/nzRip
	W3fCf9X8mWXhMl0dchpC0MZHgNXEEHn0X5uxDCQmo5qk+YaIqo0w9I311X6LnUUo9xQe
	pZKSGNm4uxVl181xe9NjxKR0Vdw4q7QFhjtuxn+n4+61/JB/+0LLyCnZpzjesVbJRI6x
	FddQ==
X-Gm-Message-State: APjAAAU8wAiu0oAA0D+S21LFBYUHtiXdEMHnRNw0hVK0SLvtwS9ngCYL
	RY0Yi9HpiV5Rl4EWG/qc2lnUC9lNhV93KLg4
X-Google-Smtp-Source: APXvYqzdSisnyVuRYdgpMtk4k3mlivAcceOjbzcpHFmqE7qKkUxfs4Ye+TtI//6UUltTJgE2hX8FzQ==
X-Received: by 2002:aa7:8157:: with SMTP id d23mr44409718pfn.67.1552487864731; 
	Wed, 13 Mar 2019 07:37:44 -0700 (PDT)
Received: from localhost ([122.146.90.161]) by smtp.gmail.com with ESMTPSA id
	p187sm6524964pfg.64.2019.03.13.07.37.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:44 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:46 -0700
Message-Id: <20190313143705.29129-11-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::432
Subject: [Qemu-riscv] [PULL 10/29] target/riscv: Convert RV64A insns to
 decodetree
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:12 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32-64.decode           |  13 +++
 target/riscv/insn_trans/trans_rva.inc.c |  58 ++++++++++
 target/riscv/translate.c                | 144 ------------------------
 3 files changed, 71 insertions(+), 144 deletions(-)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 008f1005469e..0bee95c9840d 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -43,3 +43,16 @@ divw     0000001 .....  ..... 100 ..... 0111011 @r
 divuw    0000001 .....  ..... 101 ..... 0111011 @r
 remw     0000001 .....  ..... 110 ..... 0111011 @r
 remuw    0000001 .....  ..... 111 ..... 0111011 @r
+
+# *** RV64A Standard Extension (in addition to RV32A) ***
+lr_d       00010 . . 00000 ..... 011 ..... 0101111 @atom_ld
+sc_d       00011 . . ..... ..... 011 ..... 0101111 @atom_st
+amoswap_d  00001 . . ..... ..... 011 ..... 0101111 @atom_st
+amoadd_d   00000 . . ..... ..... 011 ..... 0101111 @atom_st
+amoxor_d   00100 . . ..... ..... 011 ..... 0101111 @atom_st
+amoand_d   01100 . . ..... ..... 011 ..... 0101111 @atom_st
+amoor_d    01000 . . ..... ..... 011 ..... 0101111 @atom_st
+amomin_d   10000 . . ..... ..... 011 ..... 0101111 @atom_st
+amomax_d   10100 . . ..... ..... 011 ..... 0101111 @atom_st
+amominu_d  11000 . . ..... ..... 011 ..... 0101111 @atom_st
+amomaxu_d  11100 . . ..... ..... 011 ..... 0101111 @atom_st
diff --git a/target/riscv/insn_trans/trans_rva.inc.c b/target/riscv/insn_trans/trans_rva.inc.c
index 5d3c853ca504..f6dbbc065e15 100644
--- a/target/riscv/insn_trans/trans_rva.inc.c
+++ b/target/riscv/insn_trans/trans_rva.inc.c
@@ -158,3 +158,61 @@ static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
     REQUIRE_EXT(ctx, RVA);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TESL));
 }
+
+#ifdef TARGET_RISCV64
+
+static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
+{
+    return gen_lr(ctx, a, MO_ALIGN | MO_TEQ);
+}
+
+static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
+{
+    return gen_sc(ctx, a, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO_TEQ));
+}
+
+static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
+{
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TEQ));
+}
+#endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b0de062a4fd1..c2791459993e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -794,143 +794,6 @@ static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
     tcg_temp_free(t0);
 }
 
-static void gen_atomic(DisasContext *ctx, uint32_t opc,
-                      int rd, int rs1, int rs2)
-{
-    TCGv src1, src2, dat;
-    TCGLabel *l1, *l2;
-    TCGMemOp mop;
-    bool aq, rl;
-
-    /* Extract the size of the atomic operation.  */
-    switch (extract32(opc, 12, 3)) {
-    case 2: /* 32-bit */
-        mop = MO_ALIGN | MO_TESL;
-        break;
-#if defined(TARGET_RISCV64)
-    case 3: /* 64-bit */
-        mop = MO_ALIGN | MO_TEQ;
-        break;
-#endif
-    default:
-        gen_exception_illegal(ctx);
-        return;
-    }
-    rl = extract32(opc, 25, 1);
-    aq = extract32(opc, 26, 1);
-
-    src1 = tcg_temp_new();
-    src2 = tcg_temp_new();
-
-    switch (MASK_OP_ATOMIC_NO_AQ_RL_SZ(opc)) {
-    case OPC_RISC_LR:
-        /* Put addr in load_res, data in load_val.  */
-        gen_get_gpr(src1, rs1);
-        if (rl) {
-            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        }
-        tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
-        if (aq) {
-            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
-        }
-        tcg_gen_mov_tl(load_res, src1);
-        gen_set_gpr(rd, load_val);
-        break;
-
-    case OPC_RISC_SC:
-        l1 = gen_new_label();
-        l2 = gen_new_label();
-        dat = tcg_temp_new();
-
-        gen_get_gpr(src1, rs1);
-        tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
-
-        gen_get_gpr(src2, rs2);
-        /* Note that the TCG atomic primitives are SC,
-           so we can ignore AQ/RL along this path.  */
-        tcg_gen_atomic_cmpxchg_tl(src1, load_res, load_val, src2,
-                                  ctx->mem_idx, mop);
-        tcg_gen_setcond_tl(TCG_COND_NE, dat, src1, load_val);
-        gen_set_gpr(rd, dat);
-        tcg_gen_br(l2);
-
-        gen_set_label(l1);
-        /* Address comparion failure.  However, we still need to
-           provide the memory barrier implied by AQ/RL.  */
-        tcg_gen_mb(TCG_MO_ALL + aq * TCG_BAR_LDAQ + rl * TCG_BAR_STRL);
-        tcg_gen_movi_tl(dat, 1);
-        gen_set_gpr(rd, dat);
-
-        gen_set_label(l2);
-        tcg_temp_free(dat);
-        break;
-
-    case OPC_RISC_AMOSWAP:
-        /* Note that the TCG atomic primitives are SC,
-           so we can ignore AQ/RL along this path.  */
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_xchg_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOADD:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_add_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOXOR:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_xor_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOAND:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_and_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOOR:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_or_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOMIN:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_smin_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOMAX:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_smax_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOMINU:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_umin_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-    case OPC_RISC_AMOMAXU:
-        gen_get_gpr(src1, rs1);
-        gen_get_gpr(src2, rs2);
-        tcg_gen_atomic_fetch_umax_tl(src2, src1, src2, ctx->mem_idx, mop);
-        gen_set_gpr(rd, src2);
-        break;
-
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-
-    tcg_temp_free(src1);
-    tcg_temp_free(src2);
-}
-
 static void gen_set_rm(DisasContext *ctx, int rm)
 {
     TCGv_i32 t0;
@@ -1882,12 +1745,6 @@ static void decode_RV32_64G(DisasContext *ctx)
         gen_fp_store(ctx, MASK_OP_FP_STORE(ctx->opcode), rs1, rs2,
                      GET_STORE_IMM(ctx->opcode));
         break;
-    case OPC_RISC_ATOMIC:
-        if (!has_ext(ctx, RVA)) {
-            goto do_illegal;
-        }
-        gen_atomic(ctx, MASK_OP_ATOMIC(ctx->opcode), rd, rs1, rs2);
-        break;
     case OPC_RISC_FMADD:
         gen_fp_fmadd(ctx, MASK_OP_FP_FMADD(ctx->opcode), rd, rs1, rs2,
                      GET_RS3(ctx->opcode), GET_RM(ctx->opcode));
@@ -1912,7 +1769,6 @@ static void decode_RV32_64G(DisasContext *ctx)
         gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
                    (ctx->opcode & 0xFFF00000) >> 20);
         break;
-    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
-- 
2.19.2


