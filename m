Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmEnk-0008RI-CT
	for mharc-qemu-riscv@gnu.org; Wed, 23 Jan 2019 04:26:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmEni-0008Qk-T2
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 04:26:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmEnh-0007ID-14
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 04:26:26 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:47398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gmEne-0007HN-W6; Wed, 23 Jan 2019 04:26:24 -0500
Received: from pova.uni-paderborn.de ([131.234.189.23]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 nylar)
	id 1gmEnb-0004q0-PK; Wed, 23 Jan 2019 10:26:19 +0100
Received: from mail.uni-paderborn.de by pova with queue id 3100755-2;
	Wed, 23 Jan 2019 09:26:18 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Date: Wed, 23 Jan 2019 10:25:04 +0100
Message-Id: <20190123092538.8004-2-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.23.91816, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v6 01/35] target/riscv: Move CPURISCVState
 pointer to DisasContext
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
X-List-Received-Date: Wed, 23 Jan 2019 09:26:27 -0000

CPURISCVState is rarely used, so there is no need to pass it to every
translate function. This paves the way for decodetree which only passes
DisasContext to translate functions.

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/translate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 312bf298b3..c4a4d8115c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -52,6 +52,7 @@ typedef struct DisasContext {
        to any system register, which includes CSR_FRM, so we do not have
        to reset this known value.  */
     int frm;
+    CPURISCVState *env;
 } DisasContext;
 
 /* convert riscv funct3 to qemu memop for load/store */
@@ -1797,19 +1798,19 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
     }
 }
 
-static void decode_opc(CPURISCVState *env, DisasContext *ctx)
+static void decode_opc(DisasContext *ctx)
 {
     /* check for compressed insn */
     if (extract32(ctx->opcode, 0, 2) != 3) {
-        if (!riscv_has_ext(env, RVC)) {
+        if (!riscv_has_ext(ctx->env, RVC)) {
             gen_exception_illegal(ctx);
         } else {
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
-            decode_RV32_64C(env, ctx);
+            decode_RV32_64C(ctx->env, ctx);
         }
     } else {
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        decode_RV32_64G(env, ctx);
+        decode_RV32_64G(ctx->env, ctx);
     }
 }
 
@@ -1854,10 +1855,10 @@ static bool riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
 static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
-    CPURISCVState *env = cpu->env_ptr;
+    ctx->env = cpu->env_ptr;
 
-    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
-    decode_opc(env, ctx);
+    ctx->opcode = cpu_ldl_code(ctx->env, ctx->base.pc_next);
+    decode_opc(ctx);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
     if (ctx->base.is_jmp == DISAS_NEXT) {
-- 
2.20.1


