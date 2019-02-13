Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtc-0002Cq-Oq
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtQ-000208-0e
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtM-0002x5-4Z
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:11 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37574)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtL-0001aS-I7
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:07 -0500
Received: by mail-pf1-x436.google.com with SMTP id s22so1327674pfh.4
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=6//8iJOg8Cw7GJ2jACl1M1m3hQJcROI4U3cSTQc68og=;
	b=XmC4GolhhDiOfZa2momgOdXBSH2pu5cm0YFf1fLDvCHAi9PnIzBwP1Z+kex3n4/HXa
	M4yG+Apm9z83j0p7yC7F6tsNgLvMVCxbW02W1S3MYJ3A8wrL4prAIFe+/leIzNHX8/YV
	lB9OriLu7/WBgfaOkw68/09PDZ7v+FJpQ/Y/n6WrS4/AVOqG+Py/QFF6zNAD5G/dYFTs
	yIqlHawnJu0WEUVl6qMGWhfxvnj7VChBdjGf4956phSNn7yCIPIFfYCC/qtH3RB1yOB1
	QCGV6eZzmOja/G27et2QdFYaWzX6C8bm8DxHhI89SJflxiQGtTFHbtCq6+YzgfLHBVUE
	p94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=6//8iJOg8Cw7GJ2jACl1M1m3hQJcROI4U3cSTQc68og=;
	b=knIlb7GzhL4UFzE7aUIuenM9PQqhYlhgnofXGc3zbWf87R3l/ElPOkfslukamY8D1r
	4at1eskdvL4Q2CqbCF2QrslJQYWp6xnWgC8PXmn0e0eaNtURd5k9YySgL96wwCsW1RgO
	7lI2JPkomLACg8ZGkULwx3DLZqvlQ+IKzd54t6yvQc554Xoyky2ewkj7vHXBUXtjl0QA
	ZaYYFrTFBweQLKE0CPeXqfF7TnZOKlazaPj0PPbpYvxU51cpmGDo5o0PrA1dY/PZ41b4
	bKgnH2xrWdrYOOi2EXhRynGeCoe5wCEMs1eIYyIyRoDNDl1uEnh3pBOLFqeHP2d+toN+
	JJ5Q==
X-Gm-Message-State: AHQUAuZgvtPu0aEUZdDXsb8m3Ax8mtDJdEj9f5ggyx/9ZteIMEtFy7aR
	2cC3NklhbBvxJBWmdDdYDNnTj0miLHc=
X-Google-Smtp-Source: AHgI3IZpua7l/FnkHI5v0bJQ97dBnsxD22MJL6dK75/3xKulYfGJY2AUz+IgbVf5UvWyPwqnqV2FZw==
X-Received: by 2002:a65:4781:: with SMTP id e1mr1060170pgs.346.1550073313850; 
	Wed, 13 Feb 2019 07:55:13 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f14sm18469864pgv.23.2019.02.13.07.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:13 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:02 -0800
Message-Id: <20190213155414.22285-24-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::436
Subject: [Qemu-riscv] [PATCH v7 23/35] target/riscv: Remove manual decoding
 from gen_store()
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:23 -0000

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
index a3e00140d7d0..6c0e092a231b 100644
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
index 82ccb7192921..fbdad5bb08d2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -57,6 +57,7 @@ typedef struct DisasContext {
     CPURISCVState *env;
 } DisasContext;
 
+#ifdef TARGET_RISCV64
 /* convert riscv funct3 to qemu memop for load/store */
 static const int tcg_memop_lookup[8] = {
     [0 ... 7] = -1,
@@ -70,6 +71,7 @@ static const int tcg_memop_lookup[8] = {
     [6] = MO_TEUL,
 #endif
 };
+#endif
 
 #ifdef TARGET_RISCV64
 #define CASE_OP_32_64(X) case X: case glue(X, W)
@@ -552,9 +554,8 @@ static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
-#endif
 
-static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
+static void gen_store_c(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
         target_long imm)
 {
     TCGv t0 = tcg_temp_new();
@@ -573,6 +574,7 @@ static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
     tcg_temp_free(t0);
     tcg_temp_free(dat);
 }
+#endif
 
 #if !defined(TARGET_RISCV64)
 #ifndef CONFIG_USER_ONLY
@@ -737,7 +739,7 @@ static void decode_RV32_64C0(DisasContext *ctx)
     case 7:
 #if defined(TARGET_RISCV64)
         /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
-        gen_store(ctx, OPC_RISC_SD, rs1s, rd_rs2,
+        gen_store_c(ctx, OPC_RISC_SD, rs1s, rd_rs2,
                   GET_C_LD_IMM(ctx->opcode));
 #else
         /* C.FSW (RV32) -> fsw rs2', offset[6:2](rs1')*/
-- 
2.18.1


