Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUY-0000F8-VF
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUF-0008SI-Kn; Wed, 06 Oct 2021 17:30:03 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUC-00089c-3P; Wed, 06 Oct 2021 17:30:03 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 7561A41E8D;
 Wed,  6 Oct 2021 23:29:38 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 5EE2C60066;
 Wed,  6 Oct 2021 23:29:38 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 28EB814005C;
 Wed,  6 Oct 2021 23:29:38 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 18/27] target/riscv: 128-bit double word integer shift
 instructions
Date: Wed,  6 Oct 2021 23:28:24 +0200
Message-Id: <20211006212833.108706-19-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:30:07 -0000

All variations of shifts on 64-bit values are available in the
128-bit ISA, so we add them now.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn32.decode              | 10 +++++
 target/riscv/translate.c                |  4 +-
 target/riscv/insn_trans/trans_rvi.c.inc | 58 +++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index eea540cea9..be8d6aa85f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,6 +22,7 @@
 %rs1       15:5
 %rd        7:5
 %sh5       20:5
+%sh6       20:6
 
 %sh7    20:7
 %csr    20:12
@@ -92,6 +93,9 @@
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
 
+# Formats 128:
+@sh6       ...... ...... ..... ... ..... ....... &shift shamt=%sh6 %rs1 %rd
+
 # *** Privileged Instructions ***
 ecall       000000000000     00000 000 00000 1110011
 ebreak      000000000001     00000 000 00000 1110011
@@ -168,8 +172,14 @@ ldu      ............   ..... 111 ..... 0000011 @i
 lq       ............   ..... 010 ..... 0001111 @i
 sq       ............   ..... 100 ..... 0100011 @s
 addid    ............  .....  000 ..... 1011011 @i
+sllid    000000 ......  ..... 001 ..... 1011011 @sh6
+srlid    000000 ......  ..... 101 ..... 1011011 @sh6
+sraid    010000 ......  ..... 101 ..... 1011011 @sh6
 addd     0000000 ..... .....  000 ..... 1111011 @r
 subd     0100000 ..... .....  000 ..... 1111011 @r
+slld     0000000 ..... .....  001 ..... 1111011 @r
+srld     0000000 ..... .....  101 ..... 1111011 @r
+srad     0100000 ..... .....  101 ..... 1111011 @r
 
 # *** RV32M Standard Extension ***
 mul      0000001 .....  ..... 000 ..... 0110011 @r
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 120841de48..195dc3f461 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -624,8 +624,8 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
 
         gen_set_gpr(ctx, a->rd, dest);
     } else if (is_128bit(ctx)) {
-        if ((ctx->w && a->shamt >= 32)
-            || (!ctx->w && a->shamt >= 128)) {
+        if ((ctx->w && a->shamt >= 32) || (ctx->d && a->shamt >= 64)
+            || (!ctx->w && !ctx->d && a->shamt >= 128)) {
             return false;
         }
 
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 05e13bbc1d..1a1defb102 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -888,6 +888,39 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
                             NULL, gen_sraiw_tl, gen_sraiw_i128);
 }
 
+static bool trans_sllid(DisasContext *ctx, arg_sllid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->d = true;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, NULL, gen_slliwd_i128);
+}
+
+static void gen_srlid_i128(TCGv retl, TCGv reth,
+                           TCGv srcl, TCGv srch, target_long shamt)
+{
+    tcg_gen_shri_tl(retl, srcl, shamt);
+}
+
+static bool trans_srlid(DisasContext *ctx, arg_srlid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->d = true;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, NULL, gen_srlid_i128);
+}
+
+static void gen_sraid_i128(TCGv retl, TCGv reth,
+                           TCGv srcl, TCGv srch, target_long shamt)
+{
+    tcg_gen_sari_tl(retl, srcl, shamt);
+}
+
+static bool trans_sraid(DisasContext *ctx, arg_sraid *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->d = true;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, NULL, NULL, gen_sraid_i128);
+}
+
 static void gen_addw_i128(TCGv retl, TCGv reth,
                           TCGv src1l, TCGv src1h,
                           TCGv src2l, TCGv src2h)
@@ -960,6 +993,31 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
                      NULL, tcg_gen_sar_tl, gen_srawd_i128);
 }
 
+/* Translation functions for 64-bit operations specific to RV128 */
+static bool trans_slld(DisasContext *ctx, arg_slld *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->d = true;
+    return gen_shift(ctx, a, EXT_NONE,
+                     tcg_gen_shl_tl, tcg_gen_shl_tl, gen_sllwd_i128);
+}
+
+static bool trans_srld(DisasContext *ctx, arg_srld *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->d = true;
+    return gen_shift(ctx, a, EXT_ZERO,
+                     tcg_gen_shr_tl, tcg_gen_shr_tl, gen_srlwd_i128);
+}
+
+static bool trans_srad(DisasContext *ctx, arg_srad *a)
+{
+    REQUIRE_128BIT(ctx);
+    ctx->d = true;
+    return gen_shift(ctx, a, EXT_SIGN,
+                     tcg_gen_sar_tl, tcg_gen_sar_tl, gen_srawd_i128);
+}
+
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
     /* FENCE is a full memory barrier. */
-- 
2.33.0


