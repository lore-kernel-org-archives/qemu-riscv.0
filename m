Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3a-0003b0-CE
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3S-0003R7-RH
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3O-00033C-1c
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:54 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3K-0002Yz-73
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:49 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q17so12012473pfh.10
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=qsaDjuD7cYGnev4FgbYMJhzlxE/p3Kn1ZCz4427+MCo=;
	b=Fdb5utaI5ouAhx0MWV5CRVTaRnL5y0jxV3m4TJvmBaSri3DN+sRhr2TtghzgxBKe82
	D6eBgr4V18fDWG+MrVMPJN80IDaz9XR8uoYEYGQ/9JWxczTNnT89HZVayuW4O28CdnUH
	TEmzhQmqrfhJAnuyziNElcNlIasCeNPyOy1UoEQZ4eEL7gj6GcSJfXWL1Gam2845xXuG
	HDUO+FvghJoGHxxgScisefa3e5RddLqRuP0o0PfTIuogkWneOI68M56zL8fD3/VIdZ1u
	tfjzHTGZNgOf12lrbhOs8H+iJ4Xq7PCAlkAdrwmg+kKgFaq+XuRDcxHPVM31YOxMZXQv
	MT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=qsaDjuD7cYGnev4FgbYMJhzlxE/p3Kn1ZCz4427+MCo=;
	b=VGZXNeaQ/iDUtmHa8BLDjlvSu0qddplCOUHV95gixuURqjMoK76l+VKhzNshWLNNXe
	EcfWyuBdzez+nei/67NPZaF0j6c1TAAkhhJSTPxJQm7mQLGIRV0lx28XTBfZXdY112v0
	qY9j9qor1egg+75TRLusVvbQbOAokpsI46GEW9Uv61F1En8XGK525cJS+aV/owaqdjMN
	ShK59V6rhd/h+k1mif/VjLsxPPYfCikiSpKs/O/YqAg/VI2OOPX3Xqr+JRrO1YKWkg6S
	lR1t9N9oYWRDcjkh1IJmZXDliFNt2NJT50Gyi09ZAAlWUeQiz+TFLEGIcDPGskn2XzJz
	u9Rg==
X-Gm-Message-State: APjAAAXAXrl/aJHCOiKOXPpgBZbUhdlbqgxJerustJtQQ816mhfOEtM0
	WG8ZVpnTsze1s2Ar/oxNS04zog==
X-Google-Smtp-Source: APXvYqz5z55FHzQjQkjwN4vBUokpZvaISx8Q6DIDr5QBOwxVyr1AnBc41JeTuohPcpP/NHAMe3I8QQ==
X-Received: by 2002:a62:1752:: with SMTP id 79mr7725798pfx.127.1551477033715; 
	Fri, 01 Mar 2019 13:50:33 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	h75sm38332418pfd.150.2019.03.01.13.50.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:33 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:33 -0800
Message-Id: <20190301214945.4353-23-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::42f
Subject: [Qemu-riscv] [PULL 22/34] target/riscv: Remove manual decoding from
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:57 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

With decodetree we don't need to convert RISC-V opcodes into to MemOps
as the old gen_store() did.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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
2.18.1


