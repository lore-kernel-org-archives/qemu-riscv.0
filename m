Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3F-0003Gg-Sv
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:50:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3C-0003DZ-Qc
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq35-0002VD-Ld
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:34 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq2p-00029n-Up
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:22 -0500
Received: by mail-pl1-x633.google.com with SMTP id m10so12074416plt.10
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=FknmTE/gn5oegbeIc/JeOtHgWo19PjqOvTAsx70ADeQ=;
	b=ZjkuauAIWvs+mTQx7Tk2VpknakEb6yAlkq9G1FusKy4Wl8ByzQFNlfy71cSuZGFKEZ
	zm+PNOt7jpT3a4rI48y95YuKyZMDTgx67ra41G0Koqt61e+ee6n0p5mqltisbaN6NZ+i
	8JT7wg7cOgizWGpI4tbdmVuFgEwcBkEKYK7tzkQoVCt67C9Fo+Z7wa0vMGWVAGYJp04L
	dpT+LdlAIKoThS8WSvgvXuajupiIFH/0Q3ytV5ccCHGIFJsE4C6Gv0IzsIBcabvuZZFu
	f8KTfmSFb89pqEtP7k4W5Z3DBs3X7qmwDhgFnam2WGq1ltBvCbKfQmooeJSVY0pXoCYi
	Qn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=FknmTE/gn5oegbeIc/JeOtHgWo19PjqOvTAsx70ADeQ=;
	b=YdHaqb8D940ww93IkF8qboFvmbPcvcX+p+teUkzYZkh++/vk96xo0XTlCuegBhrQoq
	wqryq3STp5l5jwu/V4NPmaSg0iwRaBXa5iBTMItEckI26e+RRY3KMJO2OrQiRceh2n7y
	B46tneoWrBMi8v+lQgO+cJEJrrZF82YF5G+pOm/5F6uVMi8yCv5ZCINYQAvz21rpWTOK
	nf6FCxhTOOp+7nh7U3NWeAqKrs7Xtw+osKur/EFVml5dCQJMPn7asAGWSO7CAAAv1Tu6
	TEgE1ggYUdmAORTxR955ve0ZXtHKaPYxdTUusJaFSR1XPFfdkammd5IkuQ/lgHhXxPOI
	d0xA==
X-Gm-Message-State: APjAAAXEFT6v79sBjFdS5JiZ2BpV1cFgIO6W6hiZDCaIVrPswuzD9p17
	pBIUE5cSjP/Y/y4pYNsHeMJ7ug==
X-Google-Smtp-Source: APXvYqxcBmaJBdS5T1LD+8IBiFtd3uBXFJG0qhuwIWCPrzMmA4+UbsBVqIQhYqobqhc9AR41ERIQvQ==
X-Received: by 2002:a17:902:7e49:: with SMTP id
	a9mr7314648pln.303.1551477013402; 
	Fri, 01 Mar 2019 13:50:13 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	20sm34268161pgr.80.2019.03.01.13.50.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:12 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:21 -0800
Message-Id: <20190301214945.4353-11-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::633
Subject: [Qemu-riscv] [PULL 10/34] target/riscv: Convert RV64A insns to
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:40 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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
2.18.1


