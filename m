Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxBZj-0006OS-2e
	for mharc-qemu-riscv@gnu.org; Fri, 22 Feb 2019 09:13:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gxBZd-0006I0-TI
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 09:13:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gxBZV-0000W1-C0
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 09:13:03 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:41352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gxBZH-00065u-8T; Fri, 22 Feb 2019 09:12:52 -0500
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 zuban)
	id 1gxBXr-0000lA-Lx; Fri, 22 Feb 2019 15:11:20 +0100
Received: from mail.uni-paderborn.de by wormulon with queue id 3169550-5;
	Fri, 22 Feb 2019 14:11:18 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Date: Fri, 22 Feb 2019 15:09:56 +0100
Message-Id: <20190222141024.22217-7-kbastian@mail.uni-paderborn.de>
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
Subject: [Qemu-riscv] [PATCH v8 06/34] target/riscv: Convert RVXI fence
 insns to decodetree
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
X-List-Received-Date: Fri, 22 Feb 2019 14:13:11 -0000

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvi.inc.c | 19 +++++++++++++++++++
 target/riscv/translate.c                | 12 ------------
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1f5bf1f6f9..804b721ca5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -82,3 +82,5 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
 sra      0100000 .....    ..... 101 ..... 0110011 @r
 or       0000000 .....    ..... 110 ..... 0110011 @r
 and      0000000 .....    ..... 111 ..... 0110011 @r
+fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
+fence_i  ---- ----   ----   ----- 001 ----- 0001111
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 136fa54d06..973d6371df 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -318,3 +318,22 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
     return true;
 }
 #endif
+
+static bool trans_fence(DisasContext *ctx, arg_fence *a)
+{
+    /* FENCE is a full memory barrier. */
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+    return true;
+}
+
+static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
+{
+    /*
+     * FENCE_I is a no-op in QEMU,
+     * however we need to end the translation block
+     */
+    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1ae84dcd59..f720746cb7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1950,18 +1950,6 @@ static void decode_RV32_64G(DisasContext *ctx)
         gen_fp_arith(ctx, MASK_OP_FP_ARITH(ctx->opcode), rd, rs1, rs2,
                      GET_RM(ctx->opcode));
         break;
-    case OPC_RISC_FENCE:
-        if (ctx->opcode & 0x1000) {
-            /* FENCE_I is a no-op in QEMU,
-             * however we need to end the translation block */
-            tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
-            tcg_gen_exit_tb(NULL, 0);
-            ctx->base.is_jmp = DISAS_NORETURN;
-        } else {
-            /* FENCE is a full memory barrier. */
-            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-        }
-        break;
     case OPC_RISC_SYSTEM:
         gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
                    (ctx->opcode & 0xFFF00000) >> 20);
-- 
2.20.1


