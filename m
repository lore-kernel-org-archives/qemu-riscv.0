Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j058M-0000zf-FZ
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 10:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60317)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j058J-0000uG-Rv
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 10:01:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j058I-000479-DX
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 10:01:27 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36829)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j058I-00040r-5U
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 10:01:26 -0500
Received: by mail-wm1-x343.google.com with SMTP id p17so3141969wma.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2020 07:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U6Am3X6OQTZ1x+tf20LucVI7jeDaV7FG5H5GI7lV8EE=;
 b=w2WmCj33W1pPjplq1vkGvP4r1LLm/qIZk/PhWqJ2Ao2pD2xj1LPBVu1ZAdDEC0C5DY
 YSKINVK4XvBick/c6PVD+n0aS729CVzuF+EaMguiB3oV3SVr2cUsNBHsfKg4X3am0xWu
 0SNDwohlhnz72jbGkdz8/1TGMuO7NynmCQFEvjm/I/n9cMSybW/+ptVslwkXo86GEZJe
 mBv9yqp29GLdn4Da4ty9P3Ugw4R+2tFsADBU59s4WKiORfC1aaLw8jD/CHMOqR1VV+HL
 vZS3q1Dh5BtWtgB9SRwUs8SPiF/z2MhezuehcCB/sV3USuaqRSLTIMckwR86PqYuiouP
 Nd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6Am3X6OQTZ1x+tf20LucVI7jeDaV7FG5H5GI7lV8EE=;
 b=Hywt8VLOqAjgPnyikO3JXsmj2oKVqbUO9Okj7AseOCNAUUVwBThRM68c1jJzFL5BU7
 cdC2u54wVyRykq1aclV5GIhQyhRTM02ugRTy+arTC7bW7DbyTcQfbHiMCysu6j7BfLEQ
 W0h4A4/J223Zuet35OKfJvFZ58nZcfGlvN9HcYA9CGfUB3VD6TbfnLarGoO7Q/yodKno
 fpA89L6X37mLvFLegg1w3uAuagj6pOt//x12V3P8ssOL+O2Q6hcCulVe6LABhcVj72DJ
 ZFtzPe9U4kXMF2nTkDFjb1J7IiJmu07KZO8kNJh+coBDIZdpYNaUMtKoK4tilmeqxoWS
 5OXQ==
X-Gm-Message-State: APjAAAXFTE/CMFuMlXkrEGFEuTPIZsmrzCH1dIZn+iLUsUWcfcfNEnK0
 2mrOzw7BmThLkGkV7CbSTO+jKQ==
X-Google-Smtp-Source: APXvYqxOMp8kveOFWUrZwYWQwbPSBkD6s7EKiNuV1LixsgOVeUhIHRE1vmd+9Be0JLtXQNSSaTScZw==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr4652088wme.37.1581087685087;
 Fri, 07 Feb 2020 07:01:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d23sm3790469wra.30.2020.02.07.07.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 07:01:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4621E1FF91;
 Fri,  7 Feb 2020 15:01:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, aaron@os.amperecomputing.com, peter.puhov@linaro.org,
 robert.foley@linaro.org, kuhn.chenqun@huawei.com, robhenry@microsoft.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v1 4/5] target/riscv: progressively load the instruction
 during decode
Date: Fri,  7 Feb 2020 15:01:17 +0000
Message-Id: <20200207150118.23007-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200207150118.23007-1-alex.bennee@linaro.org>
References: <20200207150118.23007-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Feb 2020 15:01:29 -0000

The plugin system would throw up a harmless warning when it detected
that a disassembly of an instruction didn't use all it's bytes. Fix
the riscv decoder to only load the instruction bytes it needs as it
needs them.

This drops opcode from the ctx in favour if passing the appropriately
sized opcode down a few levels of the decode.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/translate.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 14dc71156be..99f2bcf177c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -44,7 +44,6 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
-    uint32_t opcode;
     uint32_t mstatus_fs;
     uint32_t misa;
     uint32_t mem_idx;
@@ -492,45 +491,45 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     tcg_temp_free_i32(t0);
 }
 
-static void decode_RV32_64C0(DisasContext *ctx)
+static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
 {
-    uint8_t funct3 = extract32(ctx->opcode, 13, 3);
-    uint8_t rd_rs2 = GET_C_RS2S(ctx->opcode);
-    uint8_t rs1s = GET_C_RS1S(ctx->opcode);
+    uint8_t funct3 = extract32(opcode, 13, 3);
+    uint8_t rd_rs2 = GET_C_RS2S(opcode);
+    uint8_t rs1s = GET_C_RS1S(opcode);
 
     switch (funct3) {
     case 3:
 #if defined(TARGET_RISCV64)
         /* C.LD(RV64/128) -> ld rd', offset[7:3](rs1')*/
         gen_load_c(ctx, OPC_RISC_LD, rd_rs2, rs1s,
-                 GET_C_LD_IMM(ctx->opcode));
+                 GET_C_LD_IMM(opcode));
 #else
         /* C.FLW (RV32) -> flw rd', offset[6:2](rs1')*/
         gen_fp_load(ctx, OPC_RISC_FLW, rd_rs2, rs1s,
-                    GET_C_LW_IMM(ctx->opcode));
+                    GET_C_LW_IMM(opcode));
 #endif
         break;
     case 7:
 #if defined(TARGET_RISCV64)
         /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
         gen_store_c(ctx, OPC_RISC_SD, rs1s, rd_rs2,
-                  GET_C_LD_IMM(ctx->opcode));
+                  GET_C_LD_IMM(opcode));
 #else
         /* C.FSW (RV32) -> fsw rs2', offset[6:2](rs1')*/
         gen_fp_store(ctx, OPC_RISC_FSW, rs1s, rd_rs2,
-                     GET_C_LW_IMM(ctx->opcode));
+                     GET_C_LW_IMM(opcode));
 #endif
         break;
     }
 }
 
-static void decode_RV32_64C(DisasContext *ctx)
+static void decode_RV32_64C(DisasContext *ctx, uint16_t opcode)
 {
-    uint8_t op = extract32(ctx->opcode, 0, 2);
+    uint8_t op = extract32(opcode, 0, 2);
 
     switch (op) {
     case 0:
-        decode_RV32_64C0(ctx);
+        decode_RV32_64C0(ctx, opcode);
         break;
     }
 }
@@ -709,22 +708,24 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode_insn16.inc.c"
 
-static void decode_opc(DisasContext *ctx)
+static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
     /* check for compressed insn */
-    if (extract32(ctx->opcode, 0, 2) != 3) {
+    if (extract32(opcode, 0, 2) != 3) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
-            if (!decode_insn16(ctx, ctx->opcode)) {
+            if (!decode_insn16(ctx, opcode)) {
                 /* fall back to old decoder */
-                decode_RV32_64C(ctx);
+                decode_RV32_64C(ctx, opcode);
             }
         }
     } else {
+        uint32_t opcode32 = opcode;
+        opcode32 = deposit32(opcode32, 16, 16, translator_lduw(env, ctx->base.pc_next + 2));
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        if (!decode_insn32(ctx, ctx->opcode)) {
+        if (!decode_insn32(ctx, opcode32)) {
             gen_exception_illegal(ctx);
         }
     }
@@ -776,9 +777,9 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
+    uint16_t opcode16 = translator_lduw(env, ctx->base.pc_next);
 
-    ctx->opcode = translator_ldl(env, ctx->base.pc_next);
-    decode_opc(ctx);
+    decode_opc(env, ctx, opcode16);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
     if (ctx->base.is_jmp == DISAS_NEXT) {
-- 
2.20.1


