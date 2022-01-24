Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nC5tr-00006L-Gc
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jan 2022 15:25:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nC5tl-0008VS-V3; Mon, 24 Jan 2022 15:25:10 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nC5tj-0004d0-Mi; Mon, 24 Jan 2022 15:25:09 -0500
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 68379402B1;
 Mon, 24 Jan 2022 21:25:04 +0100 (CET)
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by mailhub.u-ga.fr (Postfix) with ESMTP id 64F9210005A;
 Mon, 24 Jan 2022 21:25:04 +0100 (CET)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 56BD160067;
 Mon, 24 Jan 2022 21:25:04 +0100 (CET)
Received: from palmier.vpn.u-ga.fr (pers-165-10.vpn.u-ga.fr [147.171.165.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id A615914005C;
 Mon, 24 Jan 2022 21:25:03 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2] target/riscv: correct "code should not be reached" for
 x-rv128
Date: Mon, 24 Jan 2022 21:24:56 +0100
Message-Id: <20220124202456.420258-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
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
X-List-Received-Date: Mon, 24 Jan 2022 20:25:11 -0000

The addition of uxl support in gdbstub adds a few checks on the maximum
register length, but omitted MXL_RV128, an experimental feature.
This patch makes rv128 react as rv64, as previously.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 target/riscv/cpu.c     | 3 +--
 target/riscv/gdbstub.c | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1cb0436187..5ada71e5bf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -528,10 +528,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     switch (env->misa_mxl_max) {
 #ifdef TARGET_RISCV64
     case MXL_RV64:
+    case MXL_RV128:
         cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
         break;
-    case MXL_RV128:
-        break;
 #endif
     case MXL_RV32:
         cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
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


