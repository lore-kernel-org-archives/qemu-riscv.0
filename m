Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUZ-0000GI-Bv
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUG-0008T7-Kq; Wed, 06 Oct 2021 17:30:07 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUD-0008AZ-2Y; Wed, 06 Oct 2021 17:30:03 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 8098941E93;
 Wed,  6 Oct 2021 23:29:39 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 6AECD60067;
 Wed,  6 Oct 2021 23:29:39 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 2F60F14005C;
 Wed,  6 Oct 2021 23:29:39 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 19/27] target/riscv: support for 128-bit base
 multiplications insns
Date: Wed,  6 Oct 2021 23:28:25 +0200
Message-Id: <20211006212833.108706-20-frederic.petrot@univ-grenoble-alpes.fr>
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

We deal here with the multiplication part of the M extension as, although a
bit complex, the code is generated inline, as opposed to division and
remainder that resort to helpers (to come soon).

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn_trans/trans_rvm.c.inc | 183 ++++++++++++++++++++++--
 1 file changed, 173 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 0c5f1ba548..d61c79450c 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -18,12 +18,106 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+static void gen_mulu2_i128(TCGv rll, TCGv rlh, TCGv rhl, TCGv rhh,
+                           TCGv al, TCGv ah, TCGv bl, TCGv bh)
+{
+    TCGv tmpl = tcg_temp_new(),
+         tmph = tcg_temp_new(),
+         cnst_zero = tcg_constant_tl(0);
+
+    tcg_gen_mulu2_tl(rll, rlh, al, bl);
+
+    tcg_gen_mulu2_tl(tmpl, tmph, al, bh);
+    tcg_gen_add2_tl(rlh, rhl, rlh, cnst_zero, tmpl, tmph);
+    tcg_gen_mulu2_tl(tmpl, tmph, ah, bl);
+    tcg_gen_add2_tl(rlh, tmph, rlh, rhl, tmpl, tmph);
+    /* Overflow detection into rhh */
+    tcg_gen_setcond_tl(TCG_COND_LTU, rhh, tmph, rhl);
+
+    tcg_gen_mov_tl(rhl, tmph);
+
+    tcg_gen_mulu2_tl(tmpl, tmph, ah, bh);
+    tcg_gen_add2_tl(rhl, rhh, rhl, rhh, tmpl, tmph);
+
+    tcg_temp_free(tmpl);
+    tcg_temp_free(tmph);
+}
+
+static void gen_mul_i128(TCGv rll, TCGv rlh,
+                         TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    TCGv rhl = tcg_temp_new(),
+         rhh = tcg_temp_new();
+
+    gen_mulu2_i128(rll, rlh, rhl, rhh, rs1l, rs1h, rs2l, rs2h);
+
+    tcg_temp_free(rhl);
+    tcg_temp_free(rhh);
+}
 
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_NONE,
-                     tcg_gen_mul_tl, tcg_gen_mul_tl, NULL);
+                     tcg_gen_mul_tl, tcg_gen_mul_tl, gen_mul_i128);
+}
+
+static void gen_mulh_i128(TCGv rhl, TCGv rhh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    TCGv rll = tcg_temp_new(),
+         rlh = tcg_temp_new(),
+         rlln = tcg_temp_new(),
+         rlhn = tcg_temp_new(),
+         rhln = tcg_temp_new(),
+         rhhn = tcg_temp_new(),
+         sgnres = tcg_temp_new(),
+         tmp = tcg_temp_new(),
+         cnst_one = tcg_constant_tl(1),
+         cnst_zero = tcg_constant_tl(0);
+
+    /* Extract sign of result (=> sgn(a) xor sgn(b)) */
+    tcg_gen_setcondi_tl(TCG_COND_LT, sgnres, rs1h, 0);
+    tcg_gen_setcondi_tl(TCG_COND_LT, tmp, rs2h, 0);
+    tcg_gen_xor_tl(sgnres, sgnres, tmp);
+
+    /* Take absolute value of operands */
+    tcg_gen_sari_tl(rhl, rs1h, 63);
+    tcg_gen_add2_tl(rlln, rlhn, rs1l, rs1h, rhl, rhl);
+    tcg_gen_xor_tl(rlln, rlln, rhl);
+    tcg_gen_xor_tl(rlhn, rlhn, rhl);
+
+    tcg_gen_sari_tl(rhl, rs2h, 63);
+    tcg_gen_add2_tl(rhln, rhhn, rs2l, rs2h, rhl, rhl);
+    tcg_gen_xor_tl(rhln, rhln, rhl);
+    tcg_gen_xor_tl(rhhn, rhhn, rhl);
+
+    /* Unsigned multiplication */
+    gen_mulu2_i128(rll, rlh, rhl, rhh, rlln, rlhn, rhln, rhhn);
+
+    /* Negation of result (two's complement : ~res + 1) */
+    tcg_gen_not_tl(rlln, rll);
+    tcg_gen_not_tl(rlhn, rlh);
+    tcg_gen_not_tl(rhln, rhl);
+    tcg_gen_not_tl(rhhn, rhh);
+
+    tcg_gen_add2_tl(rlln, tmp, rlln, cnst_zero, cnst_one, cnst_zero);
+    tcg_gen_add2_tl(rlhn, tmp, rlhn, cnst_zero, tmp, cnst_zero);
+    tcg_gen_add2_tl(rhln, tmp, rhln, cnst_zero, tmp, cnst_zero);
+    tcg_gen_add2_tl(rhhn, tmp, rhhn, cnst_zero, tmp, cnst_zero);
+
+    /* Move conditionally result or -result depending on result sign */
+    tcg_gen_movcond_tl(TCG_COND_NE, rhl, sgnres, cnst_zero, rhln, rhl);
+    tcg_gen_movcond_tl(TCG_COND_NE, rhh, sgnres, cnst_zero, rhhn, rhh);
+
+    tcg_temp_free(rll);
+    tcg_temp_free(rlh);
+    tcg_temp_free(rlln);
+    tcg_temp_free(rlhn);
+    tcg_temp_free(rhln);
+    tcg_temp_free(rhhn);
+    tcg_temp_free(sgnres);
+    tcg_temp_free(tmp);
 }
 
 static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
@@ -38,7 +132,58 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_NONE,
-                     gen_mulh, gen_mulh, NULL);
+                     gen_mulh, gen_mulh, gen_mulh_i128);
+}
+
+static void gen_mulhsu_i128(TCGv rhl, TCGv rhh,
+                            TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    TCGv rll = tcg_temp_new(),
+         rlh = tcg_temp_new(),
+         rlln = tcg_temp_new(),
+         rlhn = tcg_temp_new(),
+         rhln = tcg_temp_new(),
+         rhhn = tcg_temp_new(),
+         sgnres = tcg_temp_new(),
+         tmp = tcg_temp_new(),
+         cnst_one = tcg_constant_tl(1),
+         cnst_zero = tcg_constant_tl(0);
+
+    /* Extract sign of result (=> sgn(a)) */
+    tcg_gen_setcondi_tl(TCG_COND_LT, sgnres, rs1h, 0);
+
+    /* Take absolute value of rs1 */
+    tcg_gen_sari_tl(rhl, rs1h, 63);
+    tcg_gen_add2_tl(rlln, rlhn, rs1l, rs1h, rhl, rhl);
+    tcg_gen_xor_tl(rlln, rlln, rhl);
+    tcg_gen_xor_tl(rlhn, rlhn, rhl);
+
+    /* Unsigned multiplication */
+    gen_mulu2_i128(rll, rlh, rhl, rhh, rlln, rlhn, rs2l, rs2h);
+
+    /* Negation of result (two's complement : ~res + 1) */
+    tcg_gen_not_tl(rlln, rll);
+    tcg_gen_not_tl(rlhn, rlh);
+    tcg_gen_not_tl(rhln, rhl);
+    tcg_gen_not_tl(rhhn, rhh);
+
+    tcg_gen_add2_tl(rlln, tmp, rlln, cnst_zero, cnst_one, cnst_zero);
+    tcg_gen_add2_tl(rlhn, tmp, rlhn, cnst_zero, tmp, cnst_zero);
+    tcg_gen_add2_tl(rhln, tmp, rhln, cnst_zero, tmp, cnst_zero);
+    tcg_gen_add2_tl(rhhn, tmp, rhhn, cnst_zero, tmp, cnst_zero);
+
+    /* Move conditionally result or -result depending on result sign */
+    tcg_gen_movcond_tl(TCG_COND_NE, rhl, sgnres, cnst_zero, rhln, rhl);
+    tcg_gen_movcond_tl(TCG_COND_NE, rhh, sgnres, cnst_zero, rhhn, rhh);
+
+    tcg_temp_free(rll);
+    tcg_temp_free(rlh);
+    tcg_temp_free(rlln);
+    tcg_temp_free(rlhn);
+    tcg_temp_free(rhln);
+    tcg_temp_free(rhhn);
+    tcg_temp_free(sgnres);
+    tcg_temp_free(tmp);
 }
 
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
@@ -60,7 +205,19 @@ static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_NONE,
-                     gen_mulhsu, gen_mulhsu, NULL);
+                     gen_mulhsu, gen_mulhsu, gen_mulhsu_i128);
+}
+
+static void gen_mulhu_i128(TCGv rhl, TCGv rhh,
+                           TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    TCGv rll = tcg_temp_new(),
+         rlh = tcg_temp_new();
+
+    gen_mulu2_i128(rll, rlh, rhl, rhh, rs1l, rs1h, rs2l, rs2h);
+
+    tcg_temp_free(rll);
+    tcg_temp_free(rlh);
 }
 
 static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
@@ -75,7 +232,7 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
     return gen_arith(ctx, a, EXT_NONE,
-                     gen_mulhu, gen_mulhu, NULL);
+                     gen_mulhu, gen_mulhu, gen_mulhu_i128);
 }
 
 static void gen_div(TCGv ret, TCGv source1, TCGv source2)
@@ -218,18 +375,24 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a)
                      gen_remu, gen_remu, NULL);
 }
 
+static void gen_mulw_i128(TCGv rdl, TCGv rdh,
+                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
+{
+    tcg_gen_mul_tl(rdl, rs1l, rs2l);
+}
+
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
     return gen_arith(ctx, a, EXT_NONE,
-                     tcg_gen_mul_tl, tcg_gen_mul_tl, NULL);
+                     tcg_gen_mul_tl, tcg_gen_mul_tl, gen_mulw_i128);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
     return gen_arith(ctx, a, EXT_SIGN,
@@ -238,7 +401,7 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
     return gen_arith(ctx, a, EXT_ZERO,
@@ -247,7 +410,7 @@ static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
     return gen_arith(ctx, a, EXT_SIGN,
@@ -256,7 +419,7 @@ static bool trans_remw(DisasContext *ctx, arg_remw *a)
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
     ctx->w = true;
     return gen_arith(ctx, a, EXT_ZERO,
-- 
2.33.0


