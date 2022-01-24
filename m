Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBu7j-0003CL-66
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jan 2022 02:50:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nBu7V-0003A6-Gt; Mon, 24 Jan 2022 02:50:35 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:47456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nBu7S-0000lr-B2; Mon, 24 Jan 2022 02:50:32 -0500
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id F0C0F403AD;
 Mon, 24 Jan 2022 08:50:24 +0100 (CET)
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by mailhub.u-ga.fr (Postfix) with ESMTP id EE26B100085;
 Mon, 24 Jan 2022 08:50:24 +0100 (CET)
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id E139760067;
 Mon, 24 Jan 2022 08:50:24 +0100 (CET)
Received: from palmier.vpn.u-ga.fr (pers-165-10.vpn.u-ga.fr [147.171.165.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 5031C40069;
 Mon, 24 Jan 2022 08:50:24 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH] target/riscv: correct "code should not be reached" for x-rv128
Date: Mon, 24 Jan 2022 08:49:40 +0100
Message-Id: <20220124074940.363064-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 24 Jan 2022 07:50:35 -0000

The addition of uxl support in gdbstub adds a few checks on the maximum
register length, but omitted MXL_RV128, leading to the occurence of
"code should not be reached" in a few places.
This patch makes rv128 react as rv64 for gdb, as previously.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 target/riscv/gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index f531a74c2f..9ed049c29e 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -64,6 +64,7 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     case MXL_RV32:
         return gdb_get_reg32(mem_buf, tmp);
     case MXL_RV64:
+    case MXL_RV128:
         return gdb_get_reg64(mem_buf, tmp);
     default:
         g_assert_not_reached();
@@ -84,6 +85,7 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         length = 4;
         break;
     case MXL_RV64:
+    case MXL_RV128:
         if (env->xl < MXL_RV64) {
             tmp = (int32_t)ldq_p(mem_buf);
         } else {
@@ -420,6 +422,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  1, "riscv-32bit-virtual.xml", 0);
         break;
     case MXL_RV64:
+    case MXL_RV128:
         gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
                                  riscv_gdb_set_virtual,
                                  1, "riscv-64bit-virtual.xml", 0);
-- 
2.34.1


