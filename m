Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEV9-0000iM-Kk
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUX-0000Bt-J1; Wed, 06 Oct 2021 17:30:21 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:44120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUV-0008Os-F1; Wed, 06 Oct 2021 17:30:21 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 82B6141E9F;
 Wed,  6 Oct 2021 23:29:40 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 6DCBA60066;
 Wed,  6 Oct 2021 23:29:40 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 34D0014005C;
 Wed,  6 Oct 2021 23:29:40 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 20/27] target/riscv: addition of the 'd' insns for 128-bit
 mult/div/rem
Date: Wed,  6 Oct 2021 23:28:26 +0200
Message-Id: <20211006212833.108706-21-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:30:22 -0000

All mult/div/rem instructions that work on double integers (suffixed
'd') can be tcg-generated in a few micro-ops, they are added here.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn32.decode              |   7 ++
 target/riscv/insn_trans/trans_rvm.c.inc | 112 +++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index be8d6aa85f..380604acee 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -198,6 +198,13 @@ divuw    0000001 .....  ..... 101 ..... 0111011 @r
 remw     0000001 .....  ..... 110 ..... 0111011 @r
 remuw    0000001 .....  ..... 111 ..... 0111011 @r
 
+# *** RV128M Standard Extension (in addition to RV64M) ***
+muld     0000001 .....  ..... 000 ..... 1111011 @r
+divd     0000001 .....  ..... 100 ..... 1111011 @r
+divud    0000001 .....  ..... 101 ..... 1111011 @r
+remd     0000001 .....  ..... 110 ..... 1111011 @r
+remud    0000001 .....  ..... 111 ..... 1111011 @r
+
 # *** RV32A Standard Extension ***
 lr_w       00010 . . 00000 ..... 010 ..... 0101111 @atom_ld
 sc_w       00011 . . ..... ..... 010 ..... 0101111 @atom_st
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index d61c79450c..9ed9ba0f0f 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -390,13 +390,25 @@ static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
                      tcg_gen_mul_tl, tcg_gen_mul_tl, gen_mulw_i128);
 }
 
+static void gen_divw_i128(TCGv rdl, TCGv rdh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_div(rdl, rs1l, rs2l);
+}
+
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
     REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
     return gen_arith(ctx, a, EXT_SIGN,
-                     gen_div, gen_div, NULL);
+                     gen_div, gen_div, gen_divw_i128);
+}
+
+static void gen_divuw_i128(TCGv rdl, TCGv rdh,
+                           TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_divu(rdl, rs1l, rs2l);
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
@@ -405,7 +417,13 @@ static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
     return gen_arith(ctx, a, EXT_ZERO,
-                     gen_divu, gen_divu, NULL);
+                     gen_divu, gen_divu, gen_divuw_i128);
+}
+
+static void gen_remw_i128(TCGv rdl, TCGv rdh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_rem(rdl, rs1l, rs2l);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
@@ -414,7 +432,13 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a)
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
     return gen_arith(ctx, a, EXT_SIGN,
-                     gen_rem, gen_rem, NULL);
+                     gen_rem, gen_rem, gen_remw_i128);
+}
+
+static void gen_remuw_i128(TCGv rdl, TCGv rdh,
+                           TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_remu(rdl, rs1l, rs2l);
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
@@ -423,5 +447,85 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
     return gen_arith(ctx, a, EXT_ZERO,
-                     gen_remu, gen_remu, NULL);
+                     gen_remu, gen_remu, gen_remuw_i128);
+}
+
+static void gen_muld_i128(TCGv rdl, TCGv rdh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    tcg_gen_mul_tl(rdl, rs1l, rs2l);
+}
+
+static bool trans_muld(DisasContext *ctx, arg_muld *a)
+{
+    REQUIRE_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+    ctx->d = true;
+
+    return gen_arith(ctx, a, EXT_SIGN,
+                     tcg_gen_mul_tl, tcg_gen_mul_tl, gen_muld_i128);
+}
+
+static void gen_divd_i128(TCGv rdl, TCGv rdh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_div(rdl, rs1l, rs2l);
+}
+
+static bool trans_divd(DisasContext *ctx, arg_divd *a)
+{
+    REQUIRE_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+    ctx->d = true;
+
+    return gen_arith(ctx, a, EXT_SIGN,
+                     gen_div, gen_div, gen_divd_i128);
+}
+
+static void gen_divud_i128(TCGv rdl, TCGv rdh,
+                           TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_divu(rdl, rs1l, rs2l);
+}
+
+static bool trans_divud(DisasContext *ctx, arg_divud *a)
+{
+    REQUIRE_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+    ctx->d = true;
+
+    return gen_arith(ctx, a, EXT_ZERO,
+                     gen_divu, gen_divu, gen_divud_i128);
+}
+
+static void gen_remd_i128(TCGv rdl, TCGv rdh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_rem(rdl, rs1l, rs2l);
+}
+
+static bool trans_remd(DisasContext *ctx, arg_remd *a)
+{
+    REQUIRE_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+    ctx->d = true;
+
+    return gen_arith(ctx, a, EXT_SIGN,
+                     gen_rem, gen_rem, gen_remd_i128);
+}
+
+static void gen_remud_i128(TCGv rdl, TCGv rdh,
+                           TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    gen_remu(rdl, rs1l, rs2l);
+}
+
+static bool trans_remud(DisasContext *ctx, arg_remud *a)
+{
+    REQUIRE_128BIT(ctx);
+    REQUIRE_EXT(ctx, RVM);
+    ctx->d = true;
+
+    return gen_arith(ctx, a, EXT_ZERO,
+                     gen_remu, gen_remu, gen_remud_i128);
 }
-- 
2.33.0


