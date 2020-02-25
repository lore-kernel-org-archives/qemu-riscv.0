Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Zkc-00046G-W5
	for mharc-qemu-riscv@gnu.org; Tue, 25 Feb 2020 07:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34269)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j6ZkZ-0003xR-Vf
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 07:55:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j6ZkY-0004Fe-Hz
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 07:55:47 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50955)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j6ZkY-0004Dz-9O
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 07:55:46 -0500
Received: by mail-wm1-x343.google.com with SMTP id a5so2899568wmb.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Feb 2020 04:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4RkOSmwzwH2dQilc05ZWPR0LyOE7aaRoCCPjbXdJZE=;
 b=lLJD8/8U2pEK6tt9h1UuIe+5luto6aqJ7iVDNz+QI/kNbnb4rgqY30zuM5JMMqFIqw
 RlqsZOPlripJH8/V5WD7S+J8CYFOzQGEBx38zZP+jicQOjwEPdDYnht6SdsW/zonChG2
 A5FOYrBXqUhXcSPTJF9rGtzwO0mVfUcRRboL3ZuuzWcrDZdPAAQArTy22Q7M+JKm+wqZ
 r/Iid0+0lKGzjzAFPRE63b84lgoAybm5chwUaE3IJoYe+Dazz1RvU96UasH2YpQmHCy0
 UB331wPEAQh/67UJyiBGB2uHmPz6Kk2YPZWBdqoHaZPM6Fz+j5kx07YFmKho4tr9mNGs
 7xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4RkOSmwzwH2dQilc05ZWPR0LyOE7aaRoCCPjbXdJZE=;
 b=nzUZy0ciHECRLCs1HWnz9TW/KR4LS6PuvKvZPnSqE73ComZ+Z2LVn2e7QwC+PnGcYl
 DDOAAO9C1l+i5K2ak6gC02B9PSGf/gXSJ6v8GnlCa/nz+FMbIWSN5LNUly1am6syCMIj
 HH0xKAlAgqyYFoZHJWfb5HCS3Tp7bZ/QS1K267l0lVMBFXoR7juRkAhLWVIDbvSbanIH
 E1SupVbOPCdHZulAwSBEvdPKuCanTLt22xMMa0SnyuAWct6KnMvpzmWiPuskP4LNLwWT
 mOWwiRUQMUYte3NCIh+1mrQ7NG0rJqzjCzM2Q2k8T1OQICnWdegTBLaPMQHjCxUvt59F
 H3/g==
X-Gm-Message-State: APjAAAULIzYektzSNQpyThZNqp8rljDTP/AoBFourzHFUZzDsscW/n62
 Z+1uItnNIr7nJNC9lEcPGTAtSQ==
X-Google-Smtp-Source: APXvYqwJkJnbO9/aXL5DdiuIAX5GZT3q4YvEyjq3Ir/LRxRisDv2pXCpeK6xn/wBPArWRf2LBNaTDA==
X-Received: by 2002:a1c:c208:: with SMTP id s8mr5282583wmf.30.1582635345203;
 Tue, 25 Feb 2020 04:55:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z19sm4022542wmi.35.2020.02.25.04.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 04:55:44 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88E1C1FF9E;
 Tue, 25 Feb 2020 12:47:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, aaron@os.amperecomputing.com, peter.puhov@linaro.org,
 robert.foley@linaro.org, kuhn.chenqun@huawei.com, robhenry@microsoft.com,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 richard.henderson@linaro.org, balrogg@gmail.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, stefanb@linux.vnet.ibm.com,
 marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v3 14/19] target/riscv: progressively load the instruction
 during decode
Date: Tue, 25 Feb 2020 12:47:05 +0000
Message-Id: <20200225124710.14152-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225124710.14152-1-alex.bennee@linaro.org>
References: <20200225124710.14152-1-alex.bennee@linaro.org>
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
X-List-Received-Date: Tue, 25 Feb 2020 12:55:49 -0000

The plugin system would throw up a harmless warning when it detected
that a disassembly of an instruction didn't use all it's bytes. Fix
the riscv decoder to only load the instruction bytes it needs as it
needs them.

This drops opcode from the ctx in favour if passing the appropriately
sized opcode down a few levels of the decode.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Robert Foley <robert.foley@linaro.org>

---
v2
  - use extract16 for uint16_t opcodes
---
 target/riscv/instmap.h   |  8 ++++----
 target/riscv/translate.c | 40 +++++++++++++++++++++-------------------
 2 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/target/riscv/instmap.h b/target/riscv/instmap.h
index f8ad7d60fd5..40b6d2b64de 100644
--- a/target/riscv/instmap.h
+++ b/target/riscv/instmap.h
@@ -344,8 +344,8 @@ enum {
 #define GET_C_LW_IMM(inst)          ((extract32(inst, 6, 1) << 2) \
                                     | (extract32(inst, 10, 3) << 3) \
                                     | (extract32(inst, 5, 1) << 6))
-#define GET_C_LD_IMM(inst)          ((extract32(inst, 10, 3) << 3) \
-                                    | (extract32(inst, 5, 2) << 6))
+#define GET_C_LD_IMM(inst)          ((extract16(inst, 10, 3) << 3) \
+                                    | (extract16(inst, 5, 2) << 6))
 #define GET_C_J_IMM(inst)           ((extract32(inst, 3, 3) << 1) \
                                     | (extract32(inst, 11, 1) << 4) \
                                     | (extract32(inst, 2, 1) << 5) \
@@ -363,7 +363,7 @@ enum {
 #define GET_C_RD(inst)              GET_RD(inst)
 #define GET_C_RS1(inst)             GET_RD(inst)
 #define GET_C_RS2(inst)             extract32(inst, 2, 5)
-#define GET_C_RS1S(inst)            (8 + extract32(inst, 7, 3))
-#define GET_C_RS2S(inst)            (8 + extract32(inst, 2, 3))
+#define GET_C_RS1S(inst)            (8 + extract16(inst, 7, 3))
+#define GET_C_RS2S(inst)            (8 + extract16(inst, 2, 3))
 
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 14dc71156be..d5de7f468a7 100644
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
+    uint8_t funct3 = extract16(opcode, 13, 3);
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
+    uint8_t op = extract16(opcode, 0, 2);
 
     switch (op) {
     case 0:
-        decode_RV32_64C0(ctx);
+        decode_RV32_64C0(ctx, opcode);
         break;
     }
 }
@@ -709,22 +708,25 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode_insn16.inc.c"
 
-static void decode_opc(DisasContext *ctx)
+static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
     /* check for compressed insn */
-    if (extract32(ctx->opcode, 0, 2) != 3) {
+    if (extract16(opcode, 0, 2) != 3) {
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
+        opcode32 = deposit32(opcode32, 16, 16,
+                             translator_lduw(env, ctx->base.pc_next + 2));
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        if (!decode_insn32(ctx, ctx->opcode)) {
+        if (!decode_insn32(ctx, opcode32)) {
             gen_exception_illegal(ctx);
         }
     }
@@ -776,9 +778,9 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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


