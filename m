Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmF4X-00032A-Uv
	for mharc-qemu-riscv@gnu.org; Wed, 23 Jan 2019 04:43:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmF4R-0002ko-3y
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 04:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gmEol-0007vD-ER
	for qemu-riscv@nongnu.org; Wed, 23 Jan 2019 04:27:33 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:58244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gmEoa-0007UZ-Jh; Wed, 23 Jan 2019 04:27:21 -0500
Received: from tweenies.uni-paderborn.de ([131.234.189.21]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
	id 1gmEoE-00066u-4o; Wed, 23 Jan 2019 10:26:58 +0100
Received: from mail.uni-paderborn.de by tweenies with queue id 3072084-4;
	Wed, 23 Jan 2019 09:26:57 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: sagark@eecs.berkeley.edu, palmer@sifive.com, kbastian@mail.uni-paderborn.de
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
Date: Wed, 23 Jan 2019 10:25:31 +0100
Message-Id: <20190123092538.8004-29-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.1.23.91816, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.18.5561000
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH v6 28/35] target/riscv: Rename trans_arith to
 gen_arith
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2019 09:43:48 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 18 +++++++++---------
 target/riscv/insn_trans/trans_rvm.inc.c | 14 +++++++-------
 target/riscv/translate.c                |  4 ++--
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index eac79f076f..904ae44968 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -307,12 +307,12 @@ static bool trans_srai(DisasContext *ctx, arg_srai *a)
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_add_tl);
+    return gen_arith(ctx, a, &tcg_gen_add_tl);
 }
 
 static bool trans_sub(DisasContext *ctx, arg_sub *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_sub_tl);
+    return gen_arith(ctx, a, &tcg_gen_sub_tl);
 }
 
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
@@ -322,17 +322,17 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a)
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    return trans_arith(ctx, a, &gen_slt);
+    return gen_arith(ctx, a, &gen_slt);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    return trans_arith(ctx, a, &gen_sltu);
+    return gen_arith(ctx, a, &gen_sltu);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_xor_tl);
+    return gen_arith(ctx, a, &tcg_gen_xor_tl);
 }
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
@@ -347,12 +347,12 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
 
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_or_tl);
+    return gen_arith(ctx, a, &tcg_gen_or_tl);
 }
 
 static bool trans_and(DisasContext *ctx, arg_and *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_and_tl);
+    return gen_arith(ctx, a, &tcg_gen_and_tl);
 }
 
 #ifdef TARGET_RISCV64
@@ -399,12 +399,12 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
-    return trans_arith(ctx, a, &gen_addw);
+    return gen_arith(ctx, a, &gen_addw);
 }
 
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
-    return trans_arith(ctx, a, &gen_subw);
+    return gen_arith(ctx, a, &gen_subw);
 }
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
diff --git a/target/riscv/insn_trans/trans_rvm.inc.c b/target/riscv/insn_trans/trans_rvm.inc.c
index 949f59ddb2..5844d6f5be 100644
--- a/target/riscv/insn_trans/trans_rvm.inc.c
+++ b/target/riscv/insn_trans/trans_rvm.inc.c
@@ -21,7 +21,7 @@
 
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
-    return trans_arith(ctx, a, &tcg_gen_mul_tl);
+    return gen_arith(ctx, a, &tcg_gen_mul_tl);
 }
 
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
@@ -41,7 +41,7 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
-    return trans_arith(ctx, a, &gen_mulhsu);
+    return gen_arith(ctx, a, &gen_mulhsu);
 }
 
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
@@ -61,28 +61,28 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
-    return trans_arith(ctx, a, &gen_div);
+    return gen_arith(ctx, a, &gen_div);
 }
 
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
-    return trans_arith(ctx, a, &gen_divu);
+    return gen_arith(ctx, a, &gen_divu);
 }
 
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
-    return trans_arith(ctx, a, &gen_rem);
+    return gen_arith(ctx, a, &gen_rem);
 }
 
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
-    return trans_arith(ctx, a, &gen_remu);
+    return gen_arith(ctx, a, &gen_remu);
 }
 
 #ifdef TARGET_RISCV64
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
-    return trans_arith(ctx, a, &gen_mulw);
+    return gen_arith(ctx, a, &gen_mulw);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6a722a0045..d0b0fca12b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -577,8 +577,8 @@ static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
 
 #endif
 
-static bool trans_arith(DisasContext *ctx, arg_r *a,
-                        void(*func)(TCGv, TCGv, TCGv))
+static bool gen_arith(DisasContext *ctx, arg_r *a,
+                      void(*func)(TCGv, TCGv, TCGv))
 {
     TCGv source1, source2;
     source1 = tcg_temp_new();
-- 
2.20.1


