Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUT-000069-Qj
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUA-0008Pe-25; Wed, 06 Oct 2021 17:29:58 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEU4-00083x-J5; Wed, 06 Oct 2021 17:29:55 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id DFE4D41DEF;
 Wed,  6 Oct 2021 23:29:30 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id C939960066;
 Wed,  6 Oct 2021 23:29:30 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 908A514005C;
 Wed,  6 Oct 2021 23:29:30 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 11/27] target/riscv: handling 128-bit part in
 logic/arith/shift gen helpers
Date: Wed,  6 Oct 2021 23:28:17 +0200
Message-Id: <20211006212833.108706-12-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:30:04 -0000

The code generation helpers are now able to handle also the 128-bit
functions, although no such function exists yet.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/translate.c | 102 +++++++++++++++++++++++++++++++++------
 1 file changed, 88 insertions(+), 14 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9a74abecdd..b3f70bcde0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -442,11 +442,14 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
 
     gen_set_gpr(ctx, a->rd, dest);
 
-    /* Temporary code so that the patch compiles */
     if (is_128bit(ctx)) {
-        (void)get_gprh(ctx, 6);
-        (void)dest_gprh(ctx, 6);
-        gen_set_gprh(ctx, 6, NULL);
+        uint64_t immh = -(a->imm < 0);
+        src1 = get_gprh(ctx, a->rs1);
+        dest = dest_gprh(ctx, a->rd);
+
+        func(dest, src1, immh);
+
+        gen_set_gprh(ctx, a->rd, dest);
     }
 
     return true;
@@ -463,6 +466,15 @@ static bool gen_logic(DisasContext *ctx, arg_r *a, DisasExtend ext,
 
     gen_set_gpr(ctx, a->rd, dest);
 
+    if (is_128bit(ctx)) {
+        dest = dest_gprh(ctx, a->rd);
+        src1 = get_gprh(ctx, a->rs1);
+        src2 = get_gprh(ctx, a->rs2);
+
+        func(dest, src1, src2);
+
+        gen_set_gprh(ctx, a->rd, dest);
+    }
     return true;
 }
 
@@ -485,8 +497,16 @@ static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
         fn64(dest, src1, a->imm);
 
         gen_set_gpr(ctx, a->rd, dest);
-    } else {
-        return false;
+    } else if (is_128bit(ctx)) {
+        TCGv src1l = get_gpr(ctx, a->rs1, ext),
+             src1h = get_gprh(ctx, a->rs1),
+             destl = dest_gpr(ctx, a->rd),
+             desth = dest_gprh(ctx, a->rd);
+
+        fn128(destl, desth, src1l, src1h, a->imm);
+
+        gen_set_gpr(ctx, a->rd, destl);
+        gen_set_gprh(ctx, a->rd, desth);
     }
     return true;
 }
@@ -512,8 +532,18 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
         fn64(dest, src1, src2);
 
         gen_set_gpr(ctx, a->rd, dest);
-    } else {
-        return false;
+    } else if (is_128bit(ctx)) {
+        TCGv src1l = get_gpr(ctx, a->rs1, ext),
+             src1h = get_gprh(ctx, a->rs1),
+             destl = dest_gpr(ctx, a->rd),
+             desth = dest_gprh(ctx, a->rd),
+             imml = tcg_constant_tl(a->imm),
+             immh = tcg_constant_tl(-(a->imm < 0));
+
+        fn128(destl, desth, src1l, src1h, imml, immh);
+
+        gen_set_gpr(ctx, a->rd, destl);
+        gen_set_gprh(ctx, a->rd, desth);
     }
     return true;
 }
@@ -540,8 +570,21 @@ static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
         fn64(dest, src1, src2);
 
         gen_set_gpr(ctx, a->rd, dest);
-    } else {
-        return false;
+    } else if (is_128bit(ctx)) {
+        TCGv src1l = get_gpr(ctx, a->rs1, ext),
+             src1h = get_gprh(ctx, a->rs1),
+             src2l = get_gpr(ctx, a->rs2, ext),
+             src2h = get_gprh(ctx, a->rs2),
+             destl = tcg_temp_new(),
+             desth = tcg_temp_new();
+
+        fn128(destl, desth, src1l, src1h, src2l, src2h);
+
+        gen_set_gpr(ctx, a->rd, destl);
+        gen_set_gprh(ctx, a->rd, desth);
+
+        tcg_temp_free(destl);
+        tcg_temp_free(desth);
     }
     return true;
 }
@@ -579,8 +622,24 @@ static bool gen_shift_imm_fn(DisasContext *ctx, arg_shift *a, DisasExtend ext,
         fn64(dest, src1, a->shamt);
 
         gen_set_gpr(ctx, a->rd, dest);
-    } else {
-        return false;
+    } else if (is_128bit(ctx)) {
+        if ((ctx->w && a->shamt >= 32)
+            || (!ctx->w && a->shamt >= 128)) {
+            return false;
+        }
+
+        TCGv src1l = get_gpr(ctx, a->rs1, ext),
+             src1h = get_gprh(ctx, a->rs1),
+             destl = tcg_temp_new(),
+             desth = tcg_temp_new();
+
+        fn128(destl, desth, src1l, src1h, a->shamt);
+
+        gen_set_gpr(ctx, a->rd, destl);
+        gen_set_gprh(ctx, a->rd, desth);
+
+        tcg_temp_free(destl);
+        tcg_temp_free(desth);
     }
     return true;
 }
@@ -632,8 +691,23 @@ static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
 
         gen_set_gpr(ctx, a->rd, dest);
         tcg_temp_free(ext2);
-    } else {
-        return false;
+    } else if (is_128bit(ctx)) {
+        TCGv src1l = get_gpr(ctx, a->rs1, ext),
+             src1h = get_gprh(ctx, a->rs1),
+             src2l = get_gpr(ctx, a->rs2, EXT_NONE),
+             destl = tcg_temp_new(),
+             desth = tcg_temp_new(),
+             shamt = tcg_temp_new();
+
+        tcg_gen_andi_tl(shamt, src2l, !ctx->w << 5 | 0x1f);
+        fn128(destl, desth, src1l, src1h, shamt);
+
+        gen_set_gpr(ctx, a->rd, destl);
+        gen_set_gprh(ctx, a->rd, desth);
+
+        tcg_temp_free(destl);
+        tcg_temp_free(desth);
+        tcg_temp_free(shamt);
     }
     return true;
 }
-- 
2.33.0


