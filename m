Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMBFY-0006Qd-Tq
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 11:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lMBFW-0006Pq-JR; Tue, 16 Mar 2021 11:04:46 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:34647
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lMBFT-0001Ek-6n; Tue, 16 Mar 2021 11:04:46 -0400
Received: from [89.16.146.227] (helo=broc.dd1.int.kernkonzept.com)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1lMBFL-000510-BR; Tue, 16 Mar 2021 16:04:35 +0100
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Subject: [PATCH] target/riscv: Prevent lost illegal instruction exceptions
Date: Tue, 16 Mar 2021 16:03:54 +0100
Message-Id: <20210316150354.1948265-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=georg.kotheimer@kernkonzept.com; helo=mx.kernkonzept.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 16 Mar 2021 15:04:47 -0000

When decode_insn16() fails, we fall back to decode_RV32_64C() for
further compressed instruction decoding. However, prior to this change,
we did not raise an illegal instruction exception, if decode_RV32_64C()
fails to decode the instruction. This means that we skipped illegal
compressed instructions instead of raising an illegal instruction
exception.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
 target/riscv/translate.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0f28b5f41e..8c00734252 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -537,7 +537,7 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     tcg_temp_free_i32(t0);
 }
 
-static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
+static bool decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
 {
     uint8_t funct3 = extract16(opcode, 13, 3);
     uint8_t rd_rs2 = GET_C_RS2S(opcode);
@@ -554,7 +554,7 @@ static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
         gen_fp_load(ctx, OPC_RISC_FLW, rd_rs2, rs1s,
                     GET_C_LW_IMM(opcode));
 #endif
-        break;
+        return true;
     case 7:
 #if defined(TARGET_RISCV64)
         /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
@@ -565,18 +565,21 @@ static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
         gen_fp_store(ctx, OPC_RISC_FSW, rs1s, rd_rs2,
                      GET_C_LW_IMM(opcode));
 #endif
-        break;
+        return true;
+    default:
+        return false;
     }
 }
 
-static void decode_RV32_64C(DisasContext *ctx, uint16_t opcode)
+static bool decode_RV32_64C(DisasContext *ctx, uint16_t opcode)
 {
     uint8_t op = extract16(opcode, 0, 2);
 
     switch (op) {
     case 0:
-        decode_RV32_64C0(ctx, opcode);
-        break;
+        return decode_RV32_64C0(ctx, opcode);
+    default:
+        return false;
     }
 }
 
@@ -780,7 +783,9 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
             if (!decode_insn16(ctx, opcode)) {
                 /* fall back to old decoder */
-                decode_RV32_64C(ctx, opcode);
+                if (!decode_RV32_64C(ctx, opcode)) {
+                    gen_exception_illegal(ctx);
+                }
             }
         }
     } else {
-- 
2.30.1


