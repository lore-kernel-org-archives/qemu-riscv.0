Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63482C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 02:24:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2j5Q-0005YI-RT; Mon, 13 Nov 2023 21:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1r2j5O-0005XY-T3; Mon, 13 Nov 2023 21:23:30 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1r2j5L-0001qn-VD; Mon, 13 Nov 2023 21:23:30 -0500
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 3AE2N9fY043538;
 Tue, 14 Nov 2023 10:23:09 +0800 (+08)
 (envelope-from alvinga@andestech.com)
Received: from alvinga-VirtualBox.andestech.com (10.0.13.65) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; 
 Tue, 14 Nov 2023 10:23:07 +0800
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>
CC: <alistair.francis@wdc.com>, <liweiwei@iscas.ac.cn>, Alvin Chang
 <alvinga@andestech.com>
Subject: [PATCH v5] target/riscv: update checks on writing pmpcfg for Smepmp
 to version 1.0
Date: Tue, 14 Nov 2023 10:22:54 +0800
Message-ID: <20231114022254.294711-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.13.65]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3AE2N9fY043538
Received-SPF: pass client-ip=60.248.80.70; envelope-from=alvinga@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  Alvin Chang <alvinga@andestech.com>
From:  Alvin Chang via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Current checks on writing pmpcfg for Smepmp follows Smepmp version
0.9.1. However, Smepmp specification has already been ratified, and
there are some differences between version 0.9.1 and 1.0. In this
commit we update the checks of writing pmpcfg to follow Smepmp version
1.0.

When mseccfg.MML is set, the constraints to modify PMP rules are:
1. Locked rules cannot be removed or modified until a PMP reset, unless
   mseccfg.RLB is set.
2. From Smepmp specification version 1.0, chapter 2 section 4b:
   Adding a rule with executable privileges that either is M-mode-only
   or a locked Shared-Region is not possible and such pmpcfg writes are
   ignored, leaving pmpcfg unchanged.

The commit transfers the value of pmpcfg into the index of the Smepmp
truth table, and checks the rules by aforementioned specification
changes.

Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
Changes from v4: Rebase on master.

Changes from v3: Modify "epmp_operation" to "smepmp_operation".

Changes from v2: Adopt switch case ranges and numerical order.

Changes from v1: Convert ePMP over to Smepmp.

 target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 162e88a90a..4069514069 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -102,16 +102,40 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
                 locked = false;
             }
 
-            /* mseccfg.MML is set */
-            if (MSECCFG_MML_ISSET(env)) {
-                /* not adding execute bit */
-                if ((val & PMP_LOCK) != 0 && (val & PMP_EXEC) != PMP_EXEC) {
+            /*
+             * mseccfg.MML is set. Locked rules cannot be removed or modified
+             * until a PMP reset. Besides, from Smepmp specification version 1.0
+             * , chapter 2 section 4b says:
+             * Adding a rule with executable privileges that either is
+             * M-mode-only or a locked Shared-Region is not possible and such
+             * pmpcfg writes are ignored, leaving pmpcfg unchanged.
+             */
+            if (MSECCFG_MML_ISSET(env) && !pmp_is_locked(env, pmp_index)) {
+                /*
+                 * Convert the PMP permissions to match the truth table in the
+                 * Smepmp spec.
+                 */
+                const uint8_t smepmp_operation =
+                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) << 2) |
+                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);
+
+                switch (smepmp_operation) {
+                case 0 ... 8:
                     locked = false;
-                }
-                /* shared region and not adding X bit */
-                if ((val & PMP_LOCK) != PMP_LOCK &&
-                    (val & 0x7) != (PMP_WRITE | PMP_EXEC)) {
+                    break;
+                case 9 ... 11:
+                    break;
+                case 12:
+                    locked = false;
+                    break;
+                case 13:
+                    break;
+                case 14:
+                case 15:
                     locked = false;
+                    break;
+                default:
+                    g_assert_not_reached();
                 }
             }
         } else {
-- 
2.34.1


