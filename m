Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkU0p-0005c8-38
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jan 2019 08:16:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gkU0c-0005R4-GD
	for qemu-riscv@nongnu.org; Fri, 18 Jan 2019 08:16:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gkU0M-000886-O9
	for qemu-riscv@nongnu.org; Fri, 18 Jan 2019 08:16:23 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:41498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gkU0H-0007Mj-8j; Fri, 18 Jan 2019 08:16:10 -0500
Received: from pova.uni-paderborn.de ([131.234.189.23]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 spheron)
	id 1gkTzv-0007W9-IW; Fri, 18 Jan 2019 14:15:47 +0100
Received: from mail.uni-paderborn.de by pova with queue id 3091137-2;
	Fri, 18 Jan 2019 13:15:46 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com,
	kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
Date: Fri, 18 Jan 2019 14:14:50 +0100
Message-Id: <20190118131456.32451-30-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.18.130916, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v4 29/35] target/riscv: Remove gen_system()
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
X-List-Received-Date: Fri, 18 Jan 2019 13:16:33 -0000

with all 16 bit insns moved to decodetree no path is falling back to
gen_system(), so we can remove it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/translate.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d0b0fca12b..0e37beb68e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -427,32 +427,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     tcg_temp_free_i32(t0);
 }
 
-static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
-                      int rd, int rs1, int csr)
-{
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-
-    switch (opc) {
-    case OPC_RISC_ECALL:
-        switch (csr) {
-        case 0x0: /* ECALL */
-            /* always generates U-level ECALL, fixed in do_interrupt handler */
-            generate_exception(ctx, RISCV_EXCP_U_ECALL);
-            tcg_gen_exit_tb(NULL, 0); /* no chaining */
-            ctx->base.is_jmp = DISAS_NORETURN;
-            break;
-        case 0x1: /* EBREAK */
-            generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
-            tcg_gen_exit_tb(NULL, 0); /* no chaining */
-            ctx->base.is_jmp = DISAS_NORETURN;
-            break;
-        default:
-            gen_exception_illegal(ctx);
-            break;
-        }
-        break;
-    }
-}
 
 static void decode_RV32_64C0(DisasContext *ctx)
 {
@@ -628,7 +602,6 @@ bool decode_insn16(DisasContext *ctx, uint16_t insn);
 
 static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
 {
-    int rs1, rd;
     uint32_t op;
 
     /* We do not do misaligned address check here: the address should never be
@@ -637,13 +610,9 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
      * perform the misaligned instruction fetch */
 
     op = MASK_OP_MAJOR(ctx->opcode);
-    rs1 = GET_RS1(ctx->opcode);
-    rd = GET_RD(ctx->opcode);
 
     switch (op) {
     case OPC_RISC_SYSTEM:
-        gen_system(env, ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
-                   (ctx->opcode & 0xFFF00000) >> 20);
         break;
     default:
         gen_exception_illegal(ctx);
-- 
2.20.1


