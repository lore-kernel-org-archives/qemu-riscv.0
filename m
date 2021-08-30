Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKmvI-0007hp-Lg
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 15:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKkts-00058V-VH; Mon, 30 Aug 2021 13:16:52 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:50052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKktr-0007Aq-3f; Mon, 30 Aug 2021 13:16:48 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 88DAB418FE;
 Mon, 30 Aug 2021 19:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630343805;
 bh=lvnKBF58TocO8l9r0pZztMzwAfONAopXS8iqA568Jg0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b/1/0MHz/PDPq5DSAIuTbH+BC62PagazU/qP+20DIL4jyx1EZsn2//3jbqWWZq/iV
 ByKkavvoalzvobE3ejAab3xf7B0j0Za+rywtO7N8Et38l4TjPYpuAUdlLanje5imYB
 1iHYgPAdYclumajM1kd/U59gtpHjl8jDOvRAPkh8l9p4DRD/gpQBNEZqnN8a8T9iO1
 SM7qqr0ixNuHMMSMx2YzvF1F3BmqZ7wIqn71QAZxWHjdmHdUUWNpxxKxLsG/BI7aL8
 S4SktZ5GOOpvIHqYSAQJVy9smDvNMNtJhoP0pkCnXyPvrY//r5iurDtZwOab9rGZ9p
 4FSouGMvSaS4w==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 83E3980137;
 Mon, 30 Aug 2021 19:16:45 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 3FFD5187E13;
 Mon, 30 Aug 2021 19:16:45 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/8] target/riscv: 128-bit registers creation and access
Date: Mon, 30 Aug 2021 19:16:32 +0200
Message-Id: <20210830171638.126325-2-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (110)
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
X-Mailman-Approved-At: Mon, 30 Aug 2021 15:26:23 -0400
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
X-List-Received-Date: Mon, 30 Aug 2021 17:16:54 -0000

Addition of the upper 64 bits of the 128-bit registers, along with
the setter and getter for them and creation of the corresponding
global tcg values.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 slirp                    |  2 +-
 target/riscv/cpu.h       |  3 +++
 target/riscv/translate.c | 30 ++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/slirp b/slirp
index a88d9ace23..8f43a99191 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
+Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d1a73276fb..6528b4540e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -120,6 +120,9 @@ FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
     target_ulong gpr[32];
+#if defined(TARGET_RISCV128)
+    target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
+#endif
     uint64_t fpr[32]; /* assume both F and D extensions */
 
     /* vector coprocessor state. */
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 713b14da8b..be9c64f3e4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -33,6 +33,9 @@
 
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
+#if defined(TARGET_RISCV128)
+static TCGv cpu_gprh[32];
+#endif
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
@@ -211,6 +214,17 @@ static inline void gen_get_gpr(TCGv t, int reg_num)
     }
 }
 
+#if defined(TARGET_RISCV128)
+static inline void gen_get_gprh(TCGv t, int reg_num)
+{
+    if (reg_num == 0) {
+        tcg_gen_movi_tl(t, 0);
+    } else {
+        tcg_gen_mov_tl(t, cpu_gprh[reg_num]);
+    }
+}
+#endif
+
 /* Wrapper for setting reg values - need to check of reg is zero since
  * cpu_gpr[0] is not actually allocated. this is more for safety purposes,
  * since we usually avoid calling the OP_TYPE_gen function if we see a write to
@@ -223,6 +237,15 @@ static inline void gen_set_gpr(int reg_num_dst, TCGv t)
     }
 }
 
+#if defined(TARGET_RISCV128)
+static inline void gen_set_gprh(int reg_num_dst, TCGv t)
+{
+    if (reg_num_dst != 0) {
+        tcg_gen_mov_tl(cpu_gprh[reg_num_dst], t);
+    }
+}
+#endif
+
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
 {
     TCGv rl = tcg_temp_new();
@@ -1074,10 +1097,17 @@ void riscv_translate_init(void)
     /* Use the gen_set_gpr and gen_get_gpr helper functions when accessing */
     /* registers, unless you specifically block reads/writes to reg 0 */
     cpu_gpr[0] = NULL;
+#if defined(TARGET_RISCV128)
+    cpu_gprh[0] = NULL;
+#endif
 
     for (i = 1; i < 32; i++) {
         cpu_gpr[i] = tcg_global_mem_new(cpu_env,
             offsetof(CPURISCVState, gpr[i]), riscv_int_regnames[i]);
+#if defined(TARGET_RISCV128)
+        cpu_gprh[i] = tcg_global_mem_new(cpu_env,
+            offsetof(CPURISCVState, gprh[i]), riscv_int_regnames[i]);
+#endif
     }
 
     for (i = 0; i < 32; i++) {
-- 
2.33.0


