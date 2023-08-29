Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CBFC71153
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 21:55:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qb6gC-0000on-9m; Tue, 29 Aug 2023 17:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@is.currently.online>)
 id 1qb6cI-0007gZ-4K; Tue, 29 Aug 2023 17:51:18 -0400
Received: from netc0.host.rs.currently.online ([202.61.195.116])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@is.currently.online>)
 id 1qb6cD-0002GK-9E; Tue, 29 Aug 2023 17:51:17 -0400
Received: from carbon.srv.schuermann.io (unknown [IPv6:2001:7c7:2112::1c])
 by netc0.host.rs.currently.online (Postfix) with ESMTPS id 1403318CA0;
 Tue, 29 Aug 2023 21:50:53 +0000 (UTC)
From: leon@is.currently.online
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=is.currently.online;
 s=carbon; t=1693345850;
 bh=kYJy9Ny9RaidyT2nj/IfjvKp4Ax6Qf5vQ+djwvC2yac=;
 h=From:To:Cc:Subject:Date;
 b=ovt53bteiW/t0BYFfk9A7dKmlhFLtT1fgfgYYeT0zrmwW0TycxDOHwY3QOwkFI9Tx
 ED1bb8xmPzclrDc68PuBeDvT71Alv92ICd++YeQOjMn5rbOC0S4oPrpMfZSZL8H7dS
 EA7tMxNJpJ5I8ocAOkbSFw2M+XZpqPCG/s7z6ptA=
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair23@gmail.com>,
 Leon Schuermann <leons@opentitan.org>
Subject: [PATCH] target/riscv/pmp.c: respect mseccfg.RLB for pmpaddrX changes
Date: Tue, 29 Aug 2023 17:50:46 -0400
Message-Id: <20230829215046.1430463-1-leon@is.currently.online>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=202.61.195.116;
 envelope-from=leon@is.currently.online; helo=netc0.host.rs.currently.online
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FROM_SUSPICIOUS_NTLD=0.001, FROM_SUSPICIOUS_NTLD_FP=1.999,
 PDS_OTHER_BAD_TLD=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Leon Schuermann <leons@opentitan.org>

When the rule-lock bypass (RLB) bit is set in the mseccfg CSR, the PMP
configuration lock bits must not apply. While this behavior is
implemented for the pmpcfgX CSRs, this bit is not respected for
changes to the pmpaddrX CSRs. This patch ensures that pmpaddrX CSR
writes work even on locked regions when the global rule-lock bypass is
enabled.

Signed-off-by: Leon Schuermann <leons@opentitan.org>
---
 target/riscv/pmp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 9d8db493e6..5e60c26031 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -44,6 +44,10 @@ static inline uint8_t pmp_get_a_field(uint8_t cfg)
  */
 static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
 {
+    /* mseccfg.RLB is set */
+    if (MSECCFG_RLB_ISSET(env)) {
+        return 0;
+    }
 
     if (env->pmp_state.pmp[pmp_index].cfg_reg & PMP_LOCK) {
         return 1;

base-commit: a8fc5165aab02f328ccd148aafec1e59fd1426eb
-- 
2.34.1


