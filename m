Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtB-0001lq-NC
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:55:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwt7-0001gv-To
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwt4-0002Tl-Tz
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:53 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40446)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwsu-00019N-Ad
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:43 -0500
Received: by mail-pf1-x434.google.com with SMTP id h1so1321796pfo.7
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=GzIoeft+9baenNYhrzKaAOcv7sAJC1+tiLlhAKqZTmc=;
	b=BSzNVqXBgE1ivFgCc0tZ3gyjqLTXSVcu7R12J758QyYXyQHiIRqIRQmPWTXtcai57j
	oHQIWXGCx3/T4qXr2su0zURM/0hZDFCC6TzcJ3QYLMqyW0OfcXhK6ipa/ewng1sw+DjL
	Kp5+2QJ4peR3w9nkcfdYNqQxkTNJ7+7xmVUC2YaukCEZ3KZCoVraFw24zxeTEgSMP5sq
	KAwN2OeZJmb44ronRaLT7K1k3PsfQjkJiNPZUEx+5RH2eVTwHoIS199TOLhaFA0vMlyF
	A1nRg0MEdggWPSaPsvpi0zwICtUHEJwhtp4X5OPEMOftb9MbjPpZESaeuA2Skfe0ZKE0
	uhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=GzIoeft+9baenNYhrzKaAOcv7sAJC1+tiLlhAKqZTmc=;
	b=lnglMH4EDkSf84AlIe903vhBiI6QjNWBglD49DaAArlUv7DCo0Y9fmdRVaXL5RjLQ8
	rKAISDPTS3Q8hsNB2QQXUTe6aYxiSbInU4XZKNYdMUjpbmTiu9SyCSs2u9Ky/SJOtAYa
	uLB+VVRA5RlsHH1LNm9LUWmlttvZwvEVgUGO/Afk7Oiqgq1ItfQ717iUW4mTPKQMtZBa
	zf9k8O/qX+N7QaL0PXCJqpc9d7uoqq0VU6PbDKiNYH+JmIoMJpbPjjqrrI4sfqjOV9Bj
	2+z8XZCG6dKnP38cFbvD+wk01Ck/4x9xIatGEBX0PP9XL0HjGEZA8JxbR3vha7xGuNnm
	XnLA==
X-Gm-Message-State: AHQUAuZqtEdeH6yP/CnvCQpJT0nj+4AuTbYeBS0pGOz7QhVRtWSntMld
	FIURhFfw5Hnz/kDZ7w7PhwIXAw==
X-Google-Smtp-Source: AHgI3IYtSpIDiWmbB1sl9hZHDrFQPUfvjG/hNaaKuU2uiKh9Zf+pzuv/e340ctFeaytVhafS5DkYTQ==
X-Received: by 2002:a65:6491:: with SMTP id e17mr1055625pgv.418.1550073294692; 
	Wed, 13 Feb 2019 07:54:54 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	d129sm27895693pfc.31.2019.02.13.07.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:54:54 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:50 -0800
Message-Id: <20190213155414.22285-12-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::434
Subject: [Qemu-riscv] [PATCH v7 11/35] target/riscv: Convert RV64A insns to
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
X-List-Received-Date: Wed, 13 Feb 2019 15:55:55 -0000

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
index ab6ccf0e90e8..11620e030efe 100644
--- a/target/riscv/insn_trans/trans_rva.inc.c
+++ b/target/riscv/insn_trans/trans_rva.inc.c
@@ -147,3 +147,61 @@ static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
 {
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
index 8a1d06cc0bf6..570d27a2d3c3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -795,143 +795,6 @@ static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
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
@@ -1877,12 +1740,6 @@ static void decode_RV32_64G(DisasContext *ctx)
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
@@ -1907,7 +1764,6 @@ static void decode_RV32_64G(DisasContext *ctx)
         gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
                    (ctx->opcode & 0xFFF00000) >> 20);
         break;
-    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
-- 
2.18.1


