Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwoMH-0003YR-Iy
	for mharc-qemu-riscv@gnu.org; Mon, 13 Dec 2021 11:39:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoLj-00037U-Rs; Mon, 13 Dec 2021 11:38:52 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoLh-0003aX-P5; Mon, 13 Dec 2021 11:38:51 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 9F56F4028C;
 Mon, 13 Dec 2021 17:38:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1639413521;
 bh=FFASgJzyM8XBbIE8Jjg+U1Nbvi3kojYlYD2ju86f8VM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eVGYHaE5j2JVxPPLk2UUiT++jftHl4QK7vtjxeQwRIrODfQL2R1wi8+auHk+czLDL
 O6m+TYIMhKSNYEg0pstUsFxwvQFXNA0KYBJbU8GOyLTBImBsor/CRbI8zvEMPauIVt
 Da8mXzp365TjQgJsPpjzYnEMdiGaeDBJfz5Ry32wa30LRJWPBNEJO332tj39RqdOOk
 seV6yVQK2N44u/65zBwe5wnqZzVG9ewuCeXGRv/Dc3F56PzpyiVidB8cy8YIa+xkA+
 Mu9zo1JiQNPsEDkiqmDT/IxZoe0Sk1w/s3OgYCs1K3fJI72YV1FN6kyp3T73Fkj4tO
 hi2ugpUVsyuXQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 89C7560067;
 Mon, 13 Dec 2021 17:38:41 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 58A7614005C;
 Mon, 13 Dec 2021 17:38:41 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v7 10/18] target/riscv: support for 128-bit bitwise
 instructions
Date: Mon, 13 Dec 2021 17:38:26 +0100
Message-Id: <20211213163834.170504-11-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 13 Dec 2021 16:38:52 -0000

The 128-bit bitwise instructions do not need any function prototype change
as the functions can be applied independently on the lower and upper part of
the registers.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b6127783b3..4790dc0cb4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -448,7 +448,15 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
 
     func(dest, src1, a->imm);
 
-    gen_set_gpr(ctx, a->rd, dest);
+    if (get_xl(ctx) == MXL_RV128) {
+        TCGv src1h = get_gprh(ctx, a->rs1);
+        TCGv desth = dest_gprh(ctx, a->rd);
+
+        func(desth, src1h, -(a->imm < 0));
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    } else {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
 
     return true;
 }
@@ -462,7 +470,16 @@ static bool gen_logic(DisasContext *ctx, arg_r *a,
 
     func(dest, src1, src2);
 
-    gen_set_gpr(ctx, a->rd, dest);
+    if (get_xl(ctx) == MXL_RV128) {
+        TCGv src1h = get_gprh(ctx, a->rs1);
+        TCGv src2h = get_gprh(ctx, a->rs2);
+        TCGv desth = dest_gprh(ctx, a->rd);
+
+        func(desth, src1h, src2h);
+        gen_set_gpr128(ctx, a->rd, dest, desth);
+    } else {
+        gen_set_gpr(ctx, a->rd, dest);
+    }
 
     return true;
 }
-- 
2.34.1


