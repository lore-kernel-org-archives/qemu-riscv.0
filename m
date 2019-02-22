Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxBZh-0006Ml-Vy
	for mharc-qemu-riscv@gnu.org; Fri, 22 Feb 2019 09:13:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gxBZc-0006H2-S4
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 09:13:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gxBZV-0000Wc-9m
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 09:13:03 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:56038)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gxBZI-0006h0-AM; Fri, 22 Feb 2019 09:12:52 -0500
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 spheron)
	id 1gxBYB-0001kD-GC; Fri, 22 Feb 2019 15:11:39 +0100
Received: from mail.uni-paderborn.de by magmaria with queue id 3163439-3;
	Fri, 22 Feb 2019 14:11:37 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Date: Fri, 22 Feb 2019 15:10:09 +0100
Message-Id: <20190222141024.22217-20-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222141024.22217-1-kbastian@mail.uni-paderborn.de>
References: <20190222141024.22217-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.22.140315, AntiVirus-Engine: 5.58.0,
	AntiVirus-Data: 2019.2.19.5580002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v8 19/34] target/riscv: Remove gen_jalr()
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
X-List-Received-Date: Fri, 22 Feb 2019 14:13:10 -0000

trans_jalr() is the only caller, so move the code into trans_jalr().

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
v7 -> v8:
    - riscv_has_ext -> has_ext

 target/riscv/insn_trans/trans_rvi.inc.c | 28 +++++++++++++++++-
 target/riscv/translate.c                | 38 -------------------------
 2 files changed, 27 insertions(+), 39 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 4a23372cb8..631a88906b 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -42,7 +42,33 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
 
 static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
-    gen_jalr(ctx, OPC_RISC_JALR, a->rd, a->rs1, a->imm);
+    /* no chaining with JALR */
+    TCGLabel *misaligned = NULL;
+    TCGv t0 = tcg_temp_new();
+
+
+    gen_get_gpr(cpu_pc, a->rs1);
+    tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
+    tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
+
+    if (!has_ext(ctx, RVC)) {
+        misaligned = gen_new_label();
+        tcg_gen_andi_tl(t0, cpu_pc, 0x2);
+        tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
+    }
+
+    if (a->rd != 0) {
+        tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
+    }
+    tcg_gen_lookup_and_goto_ptr();
+
+    if (misaligned) {
+        gen_set_label(misaligned);
+        gen_exception_inst_addr_mis(ctx);
+    }
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    tcg_temp_free(t0);
     return true;
 }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 80afa2c1e6..9dee2ec242 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -531,44 +531,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_jalr(DisasContext *ctx, uint32_t opc, int rd, int rs1,
-                     target_long imm)
-{
-    /* no chaining with JALR */
-    TCGLabel *misaligned = NULL;
-    TCGv t0 = tcg_temp_new();
-
-    switch (opc) {
-    case OPC_RISC_JALR:
-        gen_get_gpr(cpu_pc, rs1);
-        tcg_gen_addi_tl(cpu_pc, cpu_pc, imm);
-        tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
-
-        if (!has_ext(ctx, RVC)) {
-            misaligned = gen_new_label();
-            tcg_gen_andi_tl(t0, cpu_pc, 0x2);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
-        }
-
-        if (rd != 0) {
-            tcg_gen_movi_tl(cpu_gpr[rd], ctx->pc_succ_insn);
-        }
-        tcg_gen_lookup_and_goto_ptr();
-
-        if (misaligned) {
-            gen_set_label(misaligned);
-            gen_exception_inst_addr_mis(ctx);
-        }
-        ctx->base.is_jmp = DISAS_NORETURN;
-        break;
-
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-    tcg_temp_free(t0);
-}
-
 static void gen_branch(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
                        target_long bimm)
 {
-- 
2.20.1


