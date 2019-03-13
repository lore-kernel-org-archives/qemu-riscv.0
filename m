Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4565-0000hJ-HW
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h455v-0000I0-E6
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h451Q-0004iR-H2
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:21 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35415)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h451Q-0004hx-Ba
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:20 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e17so1682790pgd.2
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=bYl78yVA4cq06SSJZrAN5x67BYNpeaoZH5y/0bvxnbU=;
	b=UrDd8amDD3k/ec/dGB7e9W7/RiRQgyP4PXeqiokAuATA2BX9NxgSxQixBNinkDT0+x
	X6RZqqQgS63ig5W+cqsetWvSk+fbjKJKj1hJm9RBpDsk/szUshoOgciKEBWPrLKFuj94
	A0Ho2ensoCfuDlwg+V1F9VxIdFftO+D0LUipTQOtFHIDDca2BfqYLOxCbpb+JvBiD25Y
	Sy+hfG+25eHMrrVR1sYAOo3U4Fyj9mEdPNo03Q0INUFw7bU5MpnagOPl+Te5AnC6+dgA
	8Nx/OaBVNhOajcavulLg16vbucYP9TaWeTapc288d1vcB0TeZSZ8AOZNY9h9w+mS40yP
	HlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=bYl78yVA4cq06SSJZrAN5x67BYNpeaoZH5y/0bvxnbU=;
	b=BBfh6hmE4tm83qfrAJliMAajOlLSq+BvkqbZourqW41RMCKTRU24KAkA9xS4hTpBYM
	GWoCr1jTIDwnPWq9NdgxzwoU7bK+VcHFnsp4eoVko3ya75lzAkLR+vVV2Rol4V0EsJhu
	wX2yCDGXLknVbCkRYB3UiVHma6whmsrevacrvfWD49BgpmTHEHvQoIMmqMhaq3ebyDdG
	sDjGnDn4W/KU+8q9hYh95u1o1xJ1JQy3gpjjl7isFtI18yl45vd6A63wnwQgP00RPgyp
	2DcTF+/vRt1OnGW63kIQGCnaxXx5mJDEXohWnEq1gk/4zBpvxYXQuDBH4kVfwr/pUeF7
	d5sA==
X-Gm-Message-State: APjAAAUsL2JBaOQsJaRLWZiREtcWZhVYive3Yar6eD1iqo+L9F3WsRPf
	fuUsuF7Okb/TWkBR4XQd3eOddIBbWWklbzX9
X-Google-Smtp-Source: APXvYqwj4D9/V7aacGJ+3tZcn0Oovkye4kKnT9W53AJ148FLXL6uCfRta5Yd1EpTXya6T/v2XcCtBw==
X-Received: by 2002:a17:902:2989:: with SMTP id
	h9mr46411915plb.26.1552487898936; 
	Wed, 13 Mar 2019 07:38:18 -0700 (PDT)
Received: from localhost ([122.146.90.161]) by smtp.gmail.com with ESMTPSA id
	l2sm15782141pgj.64.2019.03.13.07.38.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:38:18 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:58 -0700
Message-Id: <20190313143705.29129-23-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::52b
Subject: [Qemu-riscv] [PULL 22/29] target/riscv: Remove manual decoding from
 gen_store()
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:00 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

With decodetree we don't need to convert RISC-V opcodes into to MemOps
as the old gen_store() did.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 27 +++++++++++++++++--------
 target/riscv/translate.c                |  8 +++++---
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index cc361ed4d151..5a09c6335ae0 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -168,22 +168,34 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
     return gen_load(ctx, a, MO_TEUW);
 }
 
-static bool trans_sb(DisasContext *ctx, arg_sb *a)
+static bool gen_store(DisasContext *ctx, arg_sb *a, TCGMemOp memop)
 {
-    gen_store(ctx, OPC_RISC_SB, a->rs1, a->rs2, a->imm);
+    TCGv t0 = tcg_temp_new();
+    TCGv dat = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+    tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_get_gpr(dat, a->rs2);
+
+    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
+    tcg_temp_free(t0);
+    tcg_temp_free(dat);
     return true;
 }
 
+
+static bool trans_sb(DisasContext *ctx, arg_sb *a)
+{
+    return gen_store(ctx, a, MO_SB);
+}
+
 static bool trans_sh(DisasContext *ctx, arg_sh *a)
 {
-    gen_store(ctx, OPC_RISC_SH, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_store(ctx, a, MO_TESW);
 }
 
 static bool trans_sw(DisasContext *ctx, arg_sw *a)
 {
-    gen_store(ctx, OPC_RISC_SW, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_store(ctx, a, MO_TESL);
 }
 
 #ifdef TARGET_RISCV64
@@ -199,8 +211,7 @@ static bool trans_ld(DisasContext *ctx, arg_ld *a)
 
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
 {
-    gen_store(ctx, OPC_RISC_SD, a->rs1, a->rs2, a->imm);
-    return true;
+    return gen_store(ctx, a, MO_TEQ);
 }
 #endif
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 99d6d3b4ae91..cdc08b1bff20 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -56,6 +56,7 @@ typedef struct DisasContext {
     int frm;
 } DisasContext;
 
+#ifdef TARGET_RISCV64
 /* convert riscv funct3 to qemu memop for load/store */
 static const int tcg_memop_lookup[8] = {
     [0 ... 7] = -1,
@@ -69,6 +70,7 @@ static const int tcg_memop_lookup[8] = {
     [6] = MO_TEUL,
 #endif
 };
+#endif
 
 #ifdef TARGET_RISCV64
 #define CASE_OP_32_64(X) case X: case glue(X, W)
@@ -551,9 +553,8 @@ static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
-#endif
 
-static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
+static void gen_store_c(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
         target_long imm)
 {
     TCGv t0 = tcg_temp_new();
@@ -572,6 +573,7 @@ static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
     tcg_temp_free(t0);
     tcg_temp_free(dat);
 }
+#endif
 
 #ifndef CONFIG_USER_ONLY
 /* The states of mstatus_fs are:
@@ -736,7 +738,7 @@ static void decode_RV32_64C0(DisasContext *ctx)
     case 7:
 #if defined(TARGET_RISCV64)
         /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
-        gen_store(ctx, OPC_RISC_SD, rs1s, rd_rs2,
+        gen_store_c(ctx, OPC_RISC_SD, rs1s, rd_rs2,
                   GET_C_LD_IMM(ctx->opcode));
 #else
         /* C.FSW (RV32) -> fsw rs2', offset[6:2](rs1')*/
-- 
2.19.2


