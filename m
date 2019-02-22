Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxBZm-0006SB-HZ
	for mharc-qemu-riscv@gnu.org; Fri, 22 Feb 2019 09:13:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gxBZi-0006N0-0x
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 09:13:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gxBZe-0000mP-5M
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 09:13:12 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:42006)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gxBZH-000779-Fo; Fri, 22 Feb 2019 09:12:52 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
	id 1gxBYN-0001yt-6P; Fri, 22 Feb 2019 15:11:52 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3169556-5;
	Fri, 22 Feb 2019 14:11:50 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 22 Feb 2019 15:10:18 +0100
Message-Id: <20190222141024.22217-29-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222141024.22217-1-kbastian@mail.uni-paderborn.de>
References: <20190222141024.22217-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.22.140616, AntiVirus-Engine: 5.58.0,
	AntiVirus-Data: 2019.2.19.5580002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v8 28/34] target/riscv: Remove gen_system()
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
X-List-Received-Date: Fri, 22 Feb 2019 14:13:15 -0000

with all 16 bit insns moved to decodetree no path is falling back to
gen_system(), so we can remove it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/translate.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index dedf4189d5..92be090bc7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -473,33 +473,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     tcg_temp_free_i32(t0);
 }
 
-static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
-                       int csr)
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
-
 static void decode_RV32_64C0(DisasContext *ctx)
 {
     uint8_t funct3 = extract32(ctx->opcode, 13, 3);
@@ -680,7 +653,6 @@ bool decode_insn16(DisasContext *ctx, uint16_t insn);
 
 static void decode_RV32_64G(DisasContext *ctx)
 {
-    int rs1, rd;
     uint32_t op;
 
     /* We do not do misaligned address check here: the address should never be
@@ -689,14 +661,8 @@ static void decode_RV32_64G(DisasContext *ctx)
      * perform the misaligned instruction fetch */
 
     op = MASK_OP_MAJOR(ctx->opcode);
-    rs1 = GET_RS1(ctx->opcode);
-    rd = GET_RD(ctx->opcode);
 
     switch (op) {
-    case OPC_RISC_SYSTEM:
-        gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
-                   (ctx->opcode & 0xFFF00000) >> 20);
-        break;
     default:
         gen_exception_illegal(ctx);
         break;
-- 
2.20.1


