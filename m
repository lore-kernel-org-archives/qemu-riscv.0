Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mez6G-0006WO-39
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez6A-0006Pc-1S; Mon, 25 Oct 2021 08:29:06 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez67-00085R-L9; Mon, 25 Oct 2021 08:29:05 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 5891941A83;
 Mon, 25 Oct 2021 14:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1635164914;
 bh=CDLOH5KLJqjjJyhk64e79ajNgoRDyTEZjw1WAtSm7f8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P9Kr2IIZCX7IUzHiCWlsrcHHBiX142Yg/9BpINC3Ny6aC44UTqbd0i2CZYgETjPdk
 6H4guU3zperEsHsCEmNLbLWHoJhPLZF5CVHVhbQu7q6DmxeCKgRQxh1wKYPagnjz4R
 656L0lhLG87Cfqmui5zWOhwIMI6EFXfQVLq4UXkF7dudTDq/mywYRRxseCkULEuUaz
 iklFh+s4qVE29qf+9+LzMofl/iQF120w6QPD3o/kTEE4lq2of8U9LYwgKuZUbPHEEh
 zkVlmSdIjets42brdP6zHNPKI/cDJZ0d3d6bcPT2vKDEE6MTOUdr0GXaimyOkx7Yzv
 OQ+odGfW5tBLg==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 3600A60070;
 Mon, 25 Oct 2021 14:28:34 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 01DA414005A;
 Mon, 25 Oct 2021 14:28:33 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v4 10/17] target/riscv: support for 128-bit U-type instructions
Date: Mon, 25 Oct 2021 14:28:11 +0200
Message-Id: <20211025122818.168890-11-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Mon, 25 Oct 2021 12:29:06 -0000

Adding the 128-bit version of lui and auipc, and introducing to that end
a set register with immediat function to handle extension on 128 bits.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/translate.c                | 22 ++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  8 ++++----
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b183ad2b6e..ab706d799a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -282,6 +282,28 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
     }
 }
 
+static void gen_set_gpri(DisasContext *ctx, int reg_num, target_long imm)
+{
+    if (reg_num != 0) {
+        switch (get_ol(ctx)) {
+        case MXL_RV32:
+            tcg_gen_movi_tl(cpu_gpr[reg_num], imm);
+            tcg_gen_ext32s_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
+            break;
+        case MXL_RV64:
+        case MXL_RV128:
+            tcg_gen_movi_tl(cpu_gpr[reg_num], imm);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        if (get_xl_max(ctx) == MXL_RV128) {
+            tcg_gen_movi_tl(cpu_gprh[reg_num], -(imm < 0));
+        }
+    }
+}
+
 static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
 {
     if (get_ol(ctx) != MXL_RV128) {
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index d17bde6a3a..3222a45d72 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -26,14 +26,14 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
 
 static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
 {
-     REQUIRE_64BIT(ctx);
-     return trans_illegal(ctx, a);
+    REQUIRE_64_OR_128BIT(ctx);
+    return trans_illegal(ctx, a);
 }
 
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
     if (a->rd != 0) {
-        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
+        gen_set_gpri(ctx, a->rd, a->imm);
     }
     return true;
 }
@@ -41,7 +41,7 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
     if (a->rd != 0) {
-        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm + ctx->base.pc_next);
+        gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
     }
     return true;
 }
-- 
2.33.0


