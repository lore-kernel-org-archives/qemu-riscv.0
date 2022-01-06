Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5ZtZ-0002kL-MX
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 16:02:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtR-0002Vm-B7; Thu, 06 Jan 2022 16:01:55 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:56442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtP-0002j5-Jf; Thu, 06 Jan 2022 16:01:53 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 96D2E40426;
 Thu,  6 Jan 2022 22:01:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1641502883;
 bh=8uTdq7Q6X3/spHCFXwuLtmZus5VPmKEo9Kzr18N14to=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sFhSAKD2ltaDlTlqHkM9y2CRkpeE8xCiMMQVF3cpdLGYMoiL5WuFR9MYVTi+sIiwt
 IiTChzuqohj/lY2mTo1Y+4E2uPrYwoavVk6zTqkgdKLlG0lRgCgrnb5H2i1YZbhlXR
 nowyB66wc09w1algRvIpy04yj1peRQi9S+SpYul96ae1CyRgMsiSRTbUm28/Rca2y6
 sf06qlifb/SCLjSYw5dDqeu3ezOPoKSHkE/0Nn5GYzE/c2GymC7aoDLvw7/uhlA7Ek
 C5FqeBW+rhM+XYNnH9jW+YP4kKXA+9gat/rtOP6xxbDAwIHposcItmmtNvMjy8xSTL
 B41gJWMamAopQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 7F6846005B;
 Thu,  6 Jan 2022 22:01:23 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 4FC4C140080;
 Thu,  6 Jan 2022 22:01:23 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, f4bug@amsat.org, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v8 11/18] target/riscv: support for 128-bit U-type instructions
Date: Thu,  6 Jan 2022 22:01:01 +0100
Message-Id: <20220106210108.138226-12-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Thu, 06 Jan 2022 21:01:57 -0000

Adding the 128-bit version of lui and auipc, and introducing to that end
a "set register with immediat" function to handle extension on 128 bits.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 21 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  8 ++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b43efc9bc3..ba1ad1be5f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -322,6 +322,27 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
     }
 }
 
+static void gen_set_gpri(DisasContext *ctx, int reg_num, target_long imm)
+{
+    if (reg_num != 0) {
+        switch (get_ol(ctx)) {
+        case MXL_RV32:
+            tcg_gen_movi_tl(cpu_gpr[reg_num], (int32_t)imm);
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
     assert(get_ol(ctx) == MXL_RV128);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e572976e88..6113acc669 100644
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
2.34.1


