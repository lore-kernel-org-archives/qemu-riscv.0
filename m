Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3902CC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:33:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFyYY-0004oE-Me; Wed, 20 Dec 2023 10:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1rFyYW-0004nh-Eo; Wed, 20 Dec 2023 10:32:20 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1rFyYU-0003Ca-Gd; Wed, 20 Dec 2023 10:32:20 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com C8C8FC0006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1703086332;
 bh=q8l3bQ+B7RBl7ITmRfBFrWM6QXnScbzjyMAudu6+Pd0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=ocByCbi/VV53CHQBDR5pk3J0D0Jq4KkLY73NOL4q93ckcaopTQlaeP+hxu5V3ARiL
 rPUnUKUxx1IwYQgxsqMI8Zg4Pg2jdFz8Y4r7XXX2RguvEnZlGoyKKVZ9+4pbWeRz8A
 ZqvcT1RrIiGpEd9IdEt4Eue6QyeD5fe6rWdRZoxWoTUzuzprZ6Ie43KHKXVLnKIVai
 vdpRJGkjLQGN5ty+lDA6LvSIi/btqLchadp6uWxFIUYS0EMkTVh4E0JGXBs4TBFE4z
 riO9RxIiaMcId1J25Qta3tcrY7unUX3+uP464abAVd9aC1atK59lukyOnHNr7q6X3i
 AgDicCEJ1kIjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1703086332;
 bh=q8l3bQ+B7RBl7ITmRfBFrWM6QXnScbzjyMAudu6+Pd0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=E327C9/RBn7hFjliRXr2nssaMl/IuOuVGlasj7wRJk2kEQIHmviAcyb4QO/B+5E1H
 XfC+GymZIbhqaqirAQw+vxNgCvT3OG9fAlmNE27MwrKnDk/Q1LxAj0jhTSboy0DmvN
 O8r5NcF7fsw3p73K1dU1axeVUS+UiJvtZMVljyHNbco61Wes8sB/XRXNsZl9zSRqOB
 091SDw4mTFNht8ZudyOCugWFLz1N9kwYzCuJovsA+ZKQAgQ6ky3zYKvvDlDhUkmPPx
 uxUhprWgzuxRAg41/bJD/e+reZxZrUzSx7f4XPfz6Uy0qPXGQkFuiY3J+DQv6D299m
 H+NoCR960Ivjw==
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH 1/1] target/riscv: pmp: Ignore writes when RW=01 and MML=0
Date: Wed, 20 Dec 2023 18:32:05 +0300
Message-ID: <20231220153205.11072-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=ivan.klokov@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

This patch changes behavior on writing RW=01 to pmpcfg with MML=0.
RWX filed is form of collective WARL with the combination of
pmpcfg.RW=01 remains reserved for future standard use.

According to definition of WARL writing the CSR has no other side
effect. But current implementation change architectural state and
change system behavior. After writing we will get unreadable-unwriteble
region regardless on the previous state.

On the other side WARL said that we should read legal value and nothing
says about what we should write. Current behavior change system state
regardless of whether we read this register or not.

Fixes: ac66f2f0 ("target/riscv: pmp: Ignore writes when RW=01")

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
 target/riscv/pmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 162e88a90a..c0b814699e 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -126,7 +126,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
             /* If !mseccfg.MML then ignore writes with encoding RW=01 */
             if ((val & PMP_WRITE) && !(val & PMP_READ) &&
                 !MSECCFG_MML_ISSET(env)) {
-                val &= ~(PMP_WRITE | PMP_READ);
+                return false;
             }
             env->pmp_state.pmp[pmp_index].cfg_reg = val;
             pmp_update_rule_addr(env, pmp_index);
-- 
2.34.1


