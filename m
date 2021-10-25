Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mez60-0006BU-2I
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez5k-0005r3-O7; Mon, 25 Oct 2021 08:28:41 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:42748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez5g-0007wz-B8; Mon, 25 Oct 2021 08:28:40 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D735841866;
 Mon, 25 Oct 2021 14:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1635164912;
 bh=xaFt3bSIeDUxsG9cz5UtJ0cc7VYxozTNCEYroWi2KgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0bXNkR1YWHJzXPVZq+2PohOSRqH++7ZJUJyYyncMnOwTb/xIF/4h3l3u/MK30c2MZ
 mi83QnjqGVw0oHDL2fOSxjFCWoVkxBkRsrDEPwh4ph84bcFcaT+WWQOJqkI87DF4LX
 5yL2afvGE+Ry1t8XMeEpaVabwK2QpSOwW2xKRLPL4Iqg951VgnNrlLxyNqWtH8f2zb
 jziQQogcfDmEYIUslTZc9ty7HwXyn/yYbgo6EfPX4F9ToAvi+vAEZadHGX8MNGxoda
 vBhWlp7mImpAiCfQ/CUc8YhuJ/Ikl3oDx8HLqn/pgV3o8kZWgb1hwhXqck/Pk/a+H3
 rNhkt2V99o3aw==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id B589960066;
 Mon, 25 Oct 2021 14:28:32 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 805D214005A;
 Mon, 25 Oct 2021 14:28:32 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v4 04/17] target/riscv: separation of bitwise logic and
 aritmetic helpers
Date: Mon, 25 Oct 2021 14:28:05 +0200
Message-Id: <20211025122818.168890-5-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Oct 2021 12:28:45 -0000

Introduction of a gen_logic function for bitwise logic to implement
instructions in which not propagation of information occurs between bits and
use of this function on the bitwise instructions.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 27 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc |  6 +++---
 target/riscv/insn_trans/trans_rvi.c.inc | 12 +++++------
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e10c8769b3..5c7971b189 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -376,6 +376,33 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode-insn32.c.inc"
 
+static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
+                             void (*func)(TCGv, TCGv, target_long))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    func(dest, src1, a->imm);
+
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool gen_logic(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                      void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    TCGv src2 = get_gpr(ctx, a->rs2, ext);
+
+    func(dest, src1, src2);
+
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
 static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index c8d31907c5..acdcfdb178 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -86,19 +86,19 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_andc_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_andc_tl);
 }
 
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_orc_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_orc_tl);
 }
 
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
     REQUIRE_ZBB(ctx);
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
 }
 
 static bool trans_min(DisasContext *ctx, arg_min *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 91dc438a3a..fae82bd946 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -250,17 +250,17 @@ static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_xori_tl);
+    return gen_logic_imm_fn(ctx, a, tcg_gen_xori_tl);
 }
 
 static bool trans_ori(DisasContext *ctx, arg_ori *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_ori_tl);
+    return gen_logic_imm_fn(ctx, a, tcg_gen_ori_tl);
 }
 
 static bool trans_andi(DisasContext *ctx, arg_andi *a)
 {
-    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_andi_tl);
+    return gen_logic_imm_fn(ctx, a, tcg_gen_andi_tl);
 }
 
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
@@ -317,7 +317,7 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_xor_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_xor_tl);
 }
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
@@ -332,12 +332,12 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
 
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_or_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_or_tl);
 }
 
 static bool trans_and(DisasContext *ctx, arg_and *a)
 {
-    return gen_arith(ctx, a, EXT_NONE, tcg_gen_and_tl);
+    return gen_logic(ctx, a, EXT_NONE, tcg_gen_and_tl);
 }
 
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
-- 
2.33.0


