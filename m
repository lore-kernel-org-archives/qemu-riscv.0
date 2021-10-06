Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUa-0000Im-NP
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUH-0008Th-IN; Wed, 06 Oct 2021 17:30:07 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUB-00089W-Mc; Wed, 06 Oct 2021 17:30:04 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 6F39041E88;
 Wed,  6 Oct 2021 23:29:37 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 5807660066;
 Wed,  6 Oct 2021 23:29:37 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 1FE9914005C;
 Wed,  6 Oct 2021 23:29:37 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 17/27] target/riscv: 128-bit double word integer arithmetic
 instructions
Date: Wed,  6 Oct 2021 23:28:23 +0200
Message-Id: <20211006212833.108706-18-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:30:12 -0000

The ISA adds the addid, addd and subd instructions that work on 64-bit
while in 128-bit mode. Similarly to what is done for insns working on
32-bit (w suffix), we set a 'd' flag so that masking and sign extension
occurs as it should when using the registers' accessors.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn32.decode              |  4 ++
 target/riscv/translate.c                | 12 ++++--
 target/riscv/insn_trans/trans_rvi.c.inc | 50 +++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 79611cb65d..eea540cea9 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -167,6 +167,10 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
 ldu      ............   ..... 111 ..... 0000011 @i
 lq       ............   ..... 010 ..... 0001111 @i
 sq       ............   ..... 100 ..... 0100011 @s
+addid    ............  .....  000 ..... 1011011 @i
+addd     0000000 ..... .....  000 ..... 1111011 @r
+subd     0100000 ..... .....  000 ..... 1111011 @r
+
 # *** RV32M Standard Extension ***
 mul      0000001 .....  ..... 000 ..... 0110011 @r
 mulh     0000001 .....  ..... 001 ..... 0110011 @r
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b3f70bcde0..120841de48 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -68,6 +68,7 @@ typedef struct DisasContext {
        to reset this known value.  */
     int frm;
     bool w;
+    bool d;
     bool virt_enabled;
     bool ext_ifencei;
     bool hlsx;
@@ -264,7 +265,7 @@ static inline TCGv cpu_gprh_check(DisasContext *ctx, int reg_num)
 
 static TCGv get_gprh(DisasContext *ctx, int reg_num)
 {
-    if (reg_num == 0 || ctx->w) {
+    if (reg_num == 0 || ctx->w || ctx->d) {
         return ctx->zero;
     }
     return cpu_gprh_check(ctx, reg_num);
@@ -300,7 +301,7 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
 static void gen_set_gprh(DisasContext *ctx, int reg_num, TCGv t)
 {
     if (reg_num != 0) {
-        if (ctx->w) {
+        if (ctx->w || ctx->d) {
             tcg_gen_sari_tl(cpu_gprh_check(ctx, reg_num), cpu_gpr[reg_num], 63);
         } else {
             tcg_gen_mov_tl(cpu_gprh_check(ctx, reg_num), t);
@@ -699,7 +700,10 @@ static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
              desth = tcg_temp_new(),
              shamt = tcg_temp_new();
 
-        tcg_gen_andi_tl(shamt, src2l, !ctx->w << 5 | 0x1f);
+        tcg_gen_andi_tl(shamt, src2l,
+                        (!(ctx->d ^ ctx->w) << 6)
+                        | ((ctx->d | !ctx->w) << 5)
+                        | 0x1f);
         fn128(destl, desth, src1l, src1h, shamt);
 
         gen_set_gpr(ctx, a->rd, destl);
@@ -804,6 +808,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->cs = cs;
     ctx->w = false;
+    ctx->d = false;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
 
@@ -830,6 +835,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next = ctx->pc_succ_insn;
     ctx->w = false;
+    ctx->d = false;
 
     for (int i = ctx->ntemp - 1; i >= 0; --i) {
         tcg_temp_free(ctx->temp[i]);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 1373fe94b9..05e13bbc1d 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -476,6 +476,56 @@ static bool trans_sq(DisasContext *ctx, arg_sq *a)
     return gen_store(ctx, a, MO_TEO);
 }
 
+static bool trans_addd(DisasContext *ctx, arg_addd *a)
+{
+    REQUIRE_128BIT(ctx);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE),
+         src2 = get_gpr(ctx, a->rs2, EXT_NONE),
+         destl = dest_gpr(ctx, a->rd),
+         desth = dest_gprh(ctx, a->rd);
+
+    ctx->d = true;
+    tcg_gen_add_tl(destl, src1, src2);
+
+    gen_set_gpr(ctx, a->rd, destl);
+    gen_set_gprh(ctx, a->rd, desth);
+
+    return true;
+}
+
+static bool trans_addid(DisasContext *ctx, arg_addid *a)
+{
+    REQUIRE_128BIT(ctx);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE),
+         destl = dest_gpr(ctx, a->rd),
+         desth = dest_gprh(ctx, a->rd);
+
+    ctx->d = true;
+    tcg_gen_addi_tl(destl, src1, a->imm);
+
+    gen_set_gpr(ctx, a->rd, destl);
+    gen_set_gprh(ctx, a->rd, desth);
+
+    return true;
+}
+
+static bool trans_subd(DisasContext *ctx, arg_subd *a)
+{
+    REQUIRE_128BIT(ctx);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE),
+         src2 = get_gpr(ctx, a->rs2, EXT_NONE),
+         destl = dest_gpr(ctx, a->rd),
+         desth = dest_gprh(ctx, a->rd);
+
+    ctx->d = true;
+    tcg_gen_sub_tl(destl, src1, src2);
+
+    gen_set_gpr(ctx, a->rd, destl);
+    gen_set_gprh(ctx, a->rd, desth);
+
+    return true;
+}
+
 static void gen_addi2_i128(TCGv retl, TCGv reth,
                            TCGv srcl, TCGv srch, target_long imm)
 {
-- 
2.33.0


