Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CE9C54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 07:18:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5L1W-0007Hx-IL; Tue, 21 Nov 2023 02:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r5L1S-0007F8-S4; Tue, 21 Nov 2023 02:18:15 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r5L1Q-0003jI-BB; Tue, 21 Nov 2023 02:18:14 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 5071AC0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1700551089;
 bh=+tm80IOxtZrRk6/aiCijbvq3pGsJG2aqKhn9wVIaYIA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=MplioIrU+h2ybygkNrUDiC16SM3ADAy8kFIT74EpEu9cQoceXpqPnvjOM8aTcImOx
 cFpNaOGWvWYGXv96nio8bmpBOtOB5lAmHmM3g4UK5+CRtZjhgDGxXsh9cjhm83WM13
 YZkBIqKpxDWfOd2SqqjgpsvgLjyQKwtmoO/YPd6CXpLwHXCAH7irhCNxY+DCnonWsK
 ef8GcZDJVekaCg8SX7QMyRuDkhJ4IZKVCMnnukV6JuzzCtMkijPzYX0FcxZz5TIGER
 S8rl84+IXrXGFXiftYStFDYJLjJ4/eyo3oPBZsmwYWHe9uN92aa+8YGOpQ4Ofc0+V1
 /d5SCEXOjJwnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1700551089;
 bh=+tm80IOxtZrRk6/aiCijbvq3pGsJG2aqKhn9wVIaYIA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=TYtB53R47hfsRGHGNbdbb0ND+Se2uWrOW31vgfaB+QdxTA/Aaz5GAulOzk6YtuwEr
 bQtFEin48C4gY7nCfgF9zCiYEDaMJofteFPHc6y8XKa5YhRSghjmj4NuuqUVWlTiDs
 La0LA4ggsdACqPdK4tHUZ8eUttgPUy2nJ5xK3GQiGsVNNRvPf3/X7LrmAnv7zlxl12
 U0TaLS03x7PjcPg8gQOnJnIy0oWqoAy4Bwdamp3ea9hiRBt1cK4h22fj0bHOjyVhsE
 CMBOclstyGuBAPQjy+Pta3y3ijdEKWStF7DDz8RUmKUuh07td8aclRcr1O6ncwsbvL
 6mLLP6e1vD3CA==
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH v2 2/2] target/riscv/cpu_helper.c: Fix mxr bit behavior
Date: Tue, 21 Nov 2023 10:17:57 +0300
Message-ID: <20231121071757.7178-3-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231121071757.7178-1-ivan.klokov@syntacore.com>
References: <20231121071757.7178-1-ivan.klokov@syntacore.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
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

According to RISCV Specification sect 9.5 on two stage translation when
V=1 the vsstatus(mstatus in QEMU's terms) field MXR, which makes
execute-only pages readable, only overrides VS-stage page protection.
Setting MXR at HS-level(mstatus_hs), however, overrides both VS-stage
and G-stage execute-only permissions.

The hypervisor extension changes the behavior of MXR\MPV\MPRV bits.
Due to RISCV Specification sect. 9.4.1 when MPRV=1, explicit memory
accesses are translated and protected, and endianness is applied, as
though the current virtualization mode were set to MPV and the current
nominal privilege mode were set to MPP. vsstatus.MXR makes readable
those pages marked executable at the VS translation stage.

Fixes: 36a18664ba ("target/riscv: Implement second stage MMU")

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
 target/riscv/cpu_helper.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9ff0952e46..e7e23b34f4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1032,13 +1032,29 @@ restart:
         prot |= PAGE_WRITE;
     }
     if (pte & PTE_X) {
-        bool mxr;
+        bool mxr = false;
 
-        if (first_stage == true) {
+        /*
+         * Use mstatus for first stage or for the second stage without
+         * virt_enabled (MPRV+MPV)
+         */
+        if (first_stage || !env->virt_enabled) {
             mxr = get_field(env->mstatus, MSTATUS_MXR);
-        } else {
-            mxr = get_field(env->vsstatus, MSTATUS_MXR);
         }
+
+        /* MPRV+MPV case, check VSSTATUS */
+        if (first_stage && two_stage && !env->virt_enabled) {
+            mxr |= get_field(env->vsstatus, MSTATUS_MXR);
+        }
+
+        /*
+         * Setting MXR at HS-level overrides both VS-stage and G-stage
+         * execute-only permissions
+         */
+        if (env->virt_enabled) {
+            mxr |= get_field(env->mstatus_hs, MSTATUS_MXR);
+        }
+
         if (mxr) {
             prot |= PAGE_READ;
         }
-- 
2.34.1


