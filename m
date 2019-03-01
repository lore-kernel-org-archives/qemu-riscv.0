Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3a-0003af-5a
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3T-0003RP-0i
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3P-00037k-HD
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:54 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38168)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3K-0002XA-FL
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:51 -0500
Received: by mail-pg1-x534.google.com with SMTP id m2so12050476pgl.5
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=nPPzIdX0rpmyy3MoFLlXZz0uKI5n0DbKz/S5XJ1YzAE=;
	b=CLPOcyFfcxLtNNIKCHlw3R3waEE1vZVd3S/XMwpYtoch2ri9kyr86XC+S9AADNNBIc
	hZPJbHHI+SQLI4u/zsRmJ+ElgFl6K1fQ4uZps2jUc3PdBuswYUXfKYQZCvhYYtL4PZhG
	af8XO5D+mehlPFdygFVeRKYY4HeA6dEFmTQEMLvp6LHfU6kigKYhYJBwCb7L/c7JElhn
	fjhZGEfNA14K9vhMm138hoVkAKxdWWz3P4cwB1JpTp35kE0zoN+rnr8CBMG0rRvy5gBC
	upe7illSAMtPYlfOLMWeeJ/CVzfwZOAjS2UVVVVNW6kB4VyBaMOjXhwUVl5aATzE456a
	/T1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=nPPzIdX0rpmyy3MoFLlXZz0uKI5n0DbKz/S5XJ1YzAE=;
	b=Qv7CZ92K9HmqKpqJP0AVj3KVdvAw98tTLoxitRlU/1bo/QkpXNJPdV8lIZwKNyU4ue
	mDSAGnA6SEun9LT4MCSXfs6+fZ3VzuCdg5IAJ7N8y8WAeBsWEXEbHS0w0YZ1lvpikzFC
	xO0nZOmw6JHm9Kf3zKrG5TRVqu2hYz/+UUuAUkF2u7FTokC+6IkQvumXrfjTUR5lee83
	VfpROYCgAVoxfzqx15exp8TRs+Twg84Va9JauUI85+k5dxy78/7u03dKcemolM9O4v1w
	vs9yYEukckzAe6cMwnEW+jfDeJDz4b8onrdsxgNbx9WvwmbEQ63q0FbYfnTu6ylvATSH
	U5CA==
X-Gm-Message-State: APjAAAWdlClU2ZuzHYBFqDdfjN7egdSwPc2QRpT/53/dgfE5ZpOCIp0S
	JHPBhEeJHNbFbRasiyEDru7MgA==
X-Google-Smtp-Source: APXvYqxKY2XJh0BMbs4UYWcE23JU7a+8ZGALjmV79H+DC76MavkxuaL8k0XcEB8j7aOvZ0/CTyuhFA==
X-Received: by 2002:a62:e80f:: with SMTP id c15mr2918465pfi.33.1551477032004; 
	Fri, 01 Mar 2019 13:50:32 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	a4sm44879072pga.52.2019.03.01.13.50.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:31 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:32 -0800
Message-Id: <20190301214945.4353-22-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::534
Subject: [Qemu-riscv] [PULL 21/34] target/riscv: Remove manual decoding from
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:56 -0000

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
2.18.1


