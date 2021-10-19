Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcljs-0000wu-45
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljY-0000UV-O0; Tue, 19 Oct 2021 05:48:37 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljS-0006Vl-EW; Tue, 19 Oct 2021 05:48:36 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 37C0741F6E;
 Tue, 19 Oct 2021 11:48:28 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 1FAC1601D5;
 Tue, 19 Oct 2021 11:48:28 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 03BF514005D;
 Tue, 19 Oct 2021 11:48:27 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v3 08/21] target/riscv: adding accessors to the registers
 upper part
Date: Tue, 19 Oct 2021 11:47:59 +0200
Message-Id: <20211019094812.614056-9-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 09:48:40 -0000

Set and get functions to access the 64 top bits of a register, stored in
the gprh field of the cpu state.  The access to the gprh field can not be
protected at compile time to make sure it is accessed only
in the 128-bit version of the processor because we have no way to
indicate that the misa_mxl_max field is const.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/translate.c | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b64fe8470d..b6ddcf7a10 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -55,6 +55,7 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
+    RISCVMXL misa_mxl_max;
     RISCVMXL xl;
     uint32_t misa_ext;
     uint32_t opcode;
@@ -116,6 +117,13 @@ static inline int get_olen(DisasContext *ctx)
     return 16 << get_ol(ctx);
 }
 
+/* The maximum register length */
+#ifdef TARGET_RISCV32
+#define get_xl_max(ctx)    MXL_RV32
+#else
+#define get_xl_max(ctx)    ((ctx)->misa_mxl_max)
+#endif
+
 /*
  * RISC-V requires NaN-boxing of narrower width floating point values.
  * This applies when a 32-bit value is assigned to a 64-bit FP register.
@@ -220,6 +228,7 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
         }
         break;
     case MXL_RV64:
+    case MXL_RV128:
         break;
     default:
         g_assert_not_reached();
@@ -227,6 +236,14 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
     return cpu_gpr[reg_num];
 }
 
+static TCGv get_gprh(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0 || get_ol(ctx) < MXL_RV128) {
+        return ctx->zero;
+    }
+    return cpu_gprh[reg_num];
+}
+
 static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
     if (reg_num == 0 || get_olen(ctx) < TARGET_LONG_BITS) {
@@ -235,6 +252,14 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
     return cpu_gpr[reg_num];
 }
 
+static TCGv dest_gprh(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0 || get_ol(ctx) < MXL_RV128) {
+        return temp_new(ctx);
+    }
+    return cpu_gprh[reg_num];
+}
+
 static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
 {
     if (reg_num != 0) {
@@ -243,6 +268,7 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
             tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
             break;
         case MXL_RV64:
+        case MXL_RV128:
             tcg_gen_mov_tl(cpu_gpr[reg_num], t);
             break;
         default:
@@ -251,6 +277,17 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
     }
 }
 
+static void gen_set_gprh(DisasContext *ctx, int reg_num, TCGv t)
+{
+    if (reg_num != 0) {
+        if (get_ol(ctx) < MXL_RV128) {
+            tcg_gen_sari_tl(cpu_gprh[reg_num], cpu_gpr[reg_num], 63);
+        } else {
+            tcg_gen_mov_tl(cpu_gprh[reg_num], t);
+        }
+    }
+}
+
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
@@ -392,6 +429,13 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
 
     gen_set_gpr(ctx, a->rd, dest);
 
+    /* devilish temporary code so that the patch compiles */
+    if (get_xl_max(ctx) == MXL_RV128) {
+        (void)get_gprh(ctx, 6);
+        (void)dest_gprh(ctx, 6);
+        gen_set_gprh(ctx, 6, NULL);
+    }
+
     return true;
 }
 
@@ -655,6 +699,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
     ctx->ntemp = 0;
-- 
2.33.0


