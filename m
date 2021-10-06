Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUy-0000ZB-3Y
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUa-0000IS-Cp; Wed, 06 Oct 2021 17:30:24 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:44130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUX-0008RZ-RJ; Wed, 06 Oct 2021 17:30:24 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D608241EF7;
 Wed,  6 Oct 2021 23:29:44 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id C063460066;
 Wed,  6 Oct 2021 23:29:44 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 8A67914005C;
 Wed,  6 Oct 2021 23:29:44 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 24/27] target/riscv: modification of the trans_csrxx for
 128-bit support
Date: Wed,  6 Oct 2021 23:28:30 +0200
Message-Id: <20211006212833.108706-25-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:30:25 -0000

As opposed to the gen_arith and gen_shift generation helpers, the csr insns
do not have a common prototype, so the choice to generate 32/64 or 128-bit
helper calls is done in the trans_csrxx functions.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 201 ++++++++++++++++++------
 1 file changed, 156 insertions(+), 45 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 1a1defb102..7d09cdd89c 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -1087,20 +1087,74 @@ static bool do_csrrw(DisasContext *ctx, int rd, int rc, TCGv src, TCGv mask)
     return do_csr_post(ctx);
 }
 
+static bool do_csrr_i128(DisasContext *ctx, int rd, int rc)
+{
+    TCGv_i32 csr = tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrr_i128(cpu_env, csr);
+    gen_set_gpr(ctx, rd, cpu_hlpr[0]);
+    gen_set_gprh(ctx, rd, cpu_hlpr[1]);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrw_i128(DisasContext *ctx, int rc, TCGv srcl, TCGv srch)
+{
+    TCGv_i32 csr = tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrw_i128(cpu_env, csr, srcl, srch);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrrw_i128(DisasContext *ctx, int rd, int rc,
+                          TCGv srcl, TCGv srch, TCGv maskl, TCGv maskh)
+{
+    TCGv_i32 csr = tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrrw_i128(cpu_env, csr, srcl, srch, maskl, maskh);
+    gen_set_gpr(ctx, rd, cpu_hlpr[0]);
+    gen_set_gprh(ctx, rd, cpu_hlpr[1]);
+    return do_csr_post(ctx);
+}
+
 static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
 {
-    TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
-
-    /*
-     * If rd == 0, the insn shall not read the csr, nor cause any of the
-     * side effects that might occur on a csr read.
-     */
-    if (a->rd == 0) {
-        return do_csrw(ctx, a->csr, src);
+    if (!is_128bit(ctx)) {
+        TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
+
+        /*
+         * If rd == 0, the insn shall not read the csr, nor cause any of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd == 0) {
+            return do_csrw(ctx, a->csr, src);
+        }
+
+        TCGv mask = tcg_constant_tl(-1);
+        return do_csrrw(ctx, a->rd, a->csr, src, mask);
+    } else {
+        TCGv srcl = get_gpr(ctx, a->rs1, EXT_NONE);
+        TCGv srch = get_gprh(ctx, a->rs1);
+
+        /*
+         * If rd == 0, the insn shall not read the csr, nor cause any of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd == 0) {
+            return do_csrw_i128(ctx, a->csr, srcl, srch);
+        }
+
+        TCGv mask = tcg_constant_tl(-1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, srcl, srch, mask, mask);
     }
-
-    TCGv mask = tcg_constant_tl(-1);
-    return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
 static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
@@ -1112,13 +1166,24 @@ static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 == 0) {
-        return do_csrr(ctx, a->rd, a->csr);
+    if (!is_128bit(ctx)) {
+        if (a->rs1 == 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
+
+        TCGv ones = tcg_constant_tl(-1);
+        TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
+        return do_csrrw(ctx, a->rd, a->csr, ones, mask);
+    } else {
+        if (a->rs1 == 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv ones = tcg_constant_tl(-1);
+        TCGv maskl = get_gpr(ctx, a->rs1, EXT_ZERO);
+        TCGv maskh = get_gprh(ctx, a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, ones, ones, maskl, maskh);
     }
-
-    TCGv ones = tcg_constant_tl(-1);
-    TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
-    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
 }
 
 static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
@@ -1130,28 +1195,54 @@ static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 == 0) {
-        return do_csrr(ctx, a->rd, a->csr);
+    if (!is_128bit(ctx)) {
+        if (a->rs1 == 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
+
+        TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
+        return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
+    } else {
+        if (a->rs1 == 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv maskl = get_gpr(ctx, a->rs1, EXT_ZERO);
+        TCGv maskh = get_gprh(ctx, a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr,
+                             ctx->zero, ctx->zero, maskl, maskh);
     }
-
-    TCGv mask = get_gpr(ctx, a->rs1, EXT_ZERO);
-    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
 }
 
 static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
 {
-    TCGv src = tcg_constant_tl(a->rs1);
-
-    /*
-     * If rd == 0, the insn shall not read the csr, nor cause any of the
-     * side effects that might occur on a csr read.
-     */
-    if (a->rd == 0) {
-        return do_csrw(ctx, a->csr, src);
+    if (!is_128bit(ctx)) {
+        TCGv src = tcg_constant_tl(a->rs1);
+
+        /*
+         * If rd == 0, the insn shall not read the csr, nor cause any of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd == 0) {
+            return do_csrw(ctx, a->csr, src);
+        }
+
+        TCGv mask = tcg_constant_tl(-1);
+        return do_csrrw(ctx, a->rd, a->csr, src, mask);
+    } else {
+        TCGv src = tcg_constant_tl(a->rs1);
+
+        /*
+         * If rd == 0, the insn shall not read the csr, nor cause any of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd == 0) {
+            return do_csrw_i128(ctx, a->csr, src, ctx->zero);
+        }
+
+        TCGv mask = tcg_constant_tl(-1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, src, ctx->zero, mask, mask);
     }
-
-    TCGv mask = tcg_constant_tl(-1);
-    return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
 static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
@@ -1163,16 +1254,26 @@ static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 == 0) {
-        return do_csrr(ctx, a->rd, a->csr);
+    if (!is_128bit(ctx)) {
+        if (a->rs1 == 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
+
+        TCGv ones = tcg_constant_tl(-1);
+        TCGv mask = tcg_constant_tl(a->rs1);
+        return do_csrrw(ctx, a->rd, a->csr, ones, mask);
+    } else {
+        if (a->rs1 == 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv ones = tcg_constant_tl(-1);
+        TCGv mask = tcg_constant_tl(a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, ones, ones, mask, ctx->zero);
     }
-
-    TCGv ones = tcg_constant_tl(-1);
-    TCGv mask = tcg_constant_tl(a->rs1);
-    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
 }
 
-static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
+static bool trans_csrrci(DisasContext *ctx, arg_csrrci * a)
 {
     /*
      * If rs1 == 0, the insn shall not write to the csr at all, nor
@@ -1181,10 +1282,20 @@ static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 == 0) {
-        return do_csrr(ctx, a->rd, a->csr);
+    if (!is_128bit(ctx)) {
+        if (a->rs1 == 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
+
+        TCGv mask = tcg_constant_tl(a->rs1);
+        return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
+    } else {
+        if (a->rs1 == 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv mask = tcg_constant_tl(a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr,
+                             ctx->zero, ctx->zero, mask, ctx->zero);
     }
-
-    TCGv mask = tcg_constant_tl(a->rs1);
-    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
 }
-- 
2.33.0


