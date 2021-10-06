Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEU5-0008Ni-OX
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETl-00082D-5P; Wed, 06 Oct 2021 17:29:33 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETj-00082h-E7; Wed, 06 Oct 2021 17:29:32 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D49D941DDF;
 Wed,  6 Oct 2021 23:29:29 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id BDEBC60066;
 Wed,  6 Oct 2021 23:29:29 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 8A17F14005C;
 Wed,  6 Oct 2021 23:29:29 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 10/27] target/riscv: adding accessors to the registers
 upper part
Date: Wed,  6 Oct 2021 23:28:16 +0200
Message-Id: <20211006212833.108706-11-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:29:34 -0000

Set and get functions to access the 64 top bits of the register, stored
in the gprh field of the cpu state.
It looks as if the access to the gprh field can not be protected to make
sure it is accessed only in the 128-bit version of the processor because
the misa/misah field is writable (as it should since the spec indicates
that the registers size might be dynamically changeable), although it is
for now only set at initialization time.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/translate.c | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0700c82a36..9a74abecdd 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -251,6 +251,25 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
     g_assert_not_reached();
 }
 
+/* Make sure high part of registers not accessed when not 128-bit */
+static inline TCGv cpu_gprh_check(DisasContext *ctx, int reg_num)
+{
+    if (is_128bit(ctx)) {
+        return cpu_gprh[reg_num];
+    } else {
+        /* Cannot use qemu_build_not_reached as misa is rw */
+        return 0;
+    }
+}
+
+static TCGv get_gprh(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0 || ctx->w) {
+        return ctx->zero;
+    }
+    return cpu_gprh_check(ctx, reg_num);
+}
+
 static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
     if (reg_num == 0 || ctx->w) {
@@ -259,6 +278,14 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
     return cpu_gpr[reg_num];
 }
 
+static TCGv dest_gprh(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0 || ctx->w) {
+        return temp_new(ctx);
+    }
+    return cpu_gprh_check(ctx, reg_num);
+}
+
 static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
 {
     if (reg_num != 0) {
@@ -270,6 +297,17 @@ static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
     }
 }
 
+static void gen_set_gprh(DisasContext *ctx, int reg_num, TCGv t)
+{
+    if (reg_num != 0) {
+        if (ctx->w) {
+            tcg_gen_sari_tl(cpu_gprh_check(ctx, reg_num), cpu_gpr[reg_num], 63);
+        } else {
+            tcg_gen_mov_tl(cpu_gprh_check(ctx, reg_num), t);
+        }
+    }
+}
+
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
@@ -404,6 +442,13 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
 
     gen_set_gpr(ctx, a->rd, dest);
 
+    /* Temporary code so that the patch compiles */
+    if (is_128bit(ctx)) {
+        (void)get_gprh(ctx, 6);
+        (void)dest_gprh(ctx, 6);
+        gen_set_gprh(ctx, 6, NULL);
+    }
+
     return true;
 }
 
-- 
2.33.0


