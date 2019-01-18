Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkU0a-0005PY-6q
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jan 2019 08:16:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gkU0X-0005LM-JT
	for qemu-riscv@nongnu.org; Fri, 18 Jan 2019 08:16:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gkU0M-00086w-3N
	for qemu-riscv@nongnu.org; Fri, 18 Jan 2019 08:16:15 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:50244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gkU0I-0007Oa-Tk; Fri, 18 Jan 2019 08:16:11 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 zuban)
	id 1gkTzx-00067g-KY; Fri, 18 Jan 2019 14:15:49 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3093582-5;
	Fri, 18 Jan 2019 13:15:48 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com,
	kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
Date: Fri, 18 Jan 2019 14:14:51 +0100
Message-Id: <20190118131456.32451-31-kbastian@mail.uni-paderborn.de>
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
Subject: [Qemu-riscv] [PATCH v4 30/35] target/riscv: Remove decode_RV32_64G()
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
X-List-Received-Date: Fri, 18 Jan 2019 13:16:26 -0000

decodetree handles all instructions now so the fallback is not necessary
anymore.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/translate.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0e37beb68e..b0251b3518 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -600,26 +600,6 @@ bool decode_insn16(DisasContext *ctx, uint16_t insn);
 #include "decode_insn16.inc.c"
 #include "insn_trans/trans_rvc.inc.c"
 
-static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
-{
-    uint32_t op;
-
-    /* We do not do misaligned address check here: the address should never be
-     * misaligned at this point. Instructions that set PC must do the check,
-     * since epc must be the address of the instruction that caused us to
-     * perform the misaligned instruction fetch */
-
-    op = MASK_OP_MAJOR(ctx->opcode);
-
-    switch (op) {
-    case OPC_RISC_SYSTEM:
-        break;
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-}
-
 static void decode_opc(DisasContext *ctx)
 {
     /* check for compressed insn */
@@ -636,8 +616,7 @@ static void decode_opc(DisasContext *ctx)
     } else {
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
         if (!decode_insn32(ctx, ctx->opcode)) {
-            /* fallback to old decoder */
-            decode_RV32_64G(ctx->env, ctx);
+            gen_exception_illegal(ctx);
         }
     }
 }
-- 
2.20.1


