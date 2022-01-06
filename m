Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5ZtG-00029z-8q
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 16:01:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5Zt5-0001rU-Dl; Thu, 06 Jan 2022 16:01:33 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:56360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5Zt1-0002fX-IJ; Thu, 06 Jan 2022 16:01:30 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id E23A640412;
 Thu,  6 Jan 2022 22:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1641502882;
 bh=QWQcikqHyyIVKVM995av48jKujIMMOlLwWeI4ubj754=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ho8ffRcdzVxSJJ0cQIZLaSliScx7Ivx06PMTYm87z5ZFvNjj97N8SVOA0JwcXNnSZ
 XIGIIScH7VXIMY/a0G4jJR7UVoC2kobwRsvoDNKHFL8bb/OiQ80fN15+u72RaMlpMc
 QqBsoC/RloNng3PoeUpiPr50nHhwb/J0H0PKD2tnzsu8a6NBIIyWcOVh8KvT9Pa8hq
 PTKg0Ah0kRGuZpqWP6hVKLxZRdxSHMIihnw5CLpaXPFyBRcP5T8kc6rocuUd8G1dOC
 YajBePZqq5HT/TUqec00dQSR/pYWEw/mufQSpg/pgUohUwPlstcso7SEGJdLdfO48X
 20WrLCFtxRXng==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id C75F160074;
 Thu,  6 Jan 2022 22:01:22 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 94B1C14007F;
 Thu,  6 Jan 2022 22:01:22 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, f4bug@amsat.org, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v8 08/18] target/riscv: moving some insns close to similar
 insns
Date: Thu,  6 Jan 2022 22:00:58 +0100
Message-Id: <20220106210108.138226-9-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jan 2022 21:01:34 -0000

lwu and ld are functionally close to the other loads, but were after the
stores in the source file.
Similarly, xor was away from or and and by two arithmetic functions, while
the immediate versions were nicely put together.
This patch moves the aforementioned loads after lhu, and xor above or,
where they more logically belong.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 34 ++++++++++++-------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 51607b3d40..710f5e6a85 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -176,6 +176,18 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
     return gen_load(ctx, a, MO_TEUW);
 }
 
+static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load(ctx, a, MO_TEUL);
+}
+
+static bool trans_ld(DisasContext *ctx, arg_ld *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load(ctx, a, MO_TEUQ);
+}
+
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
     TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -207,18 +219,6 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
     return gen_store(ctx, a, MO_TESL);
 }
 
-static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
-{
-    REQUIRE_64BIT(ctx);
-    return gen_load(ctx, a, MO_TEUL);
-}
-
-static bool trans_ld(DisasContext *ctx, arg_ld *a)
-{
-    REQUIRE_64BIT(ctx);
-    return gen_load(ctx, a, MO_TEUQ);
-}
-
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
 {
     REQUIRE_64BIT(ctx);
@@ -317,11 +317,6 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
     return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
 }
 
-static bool trans_xor(DisasContext *ctx, arg_xor *a)
-{
-    return gen_logic(ctx, a, tcg_gen_xor_tl);
-}
-
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
 {
     return gen_shift(ctx, a, EXT_ZERO, tcg_gen_shr_tl);
@@ -332,6 +327,11 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
     return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl);
 }
 
+static bool trans_xor(DisasContext *ctx, arg_xor *a)
+{
+    return gen_logic(ctx, a, tcg_gen_xor_tl);
+}
+
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
     return gen_logic(ctx, a, tcg_gen_or_tl);
-- 
2.34.1


