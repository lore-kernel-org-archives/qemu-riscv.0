Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9MES-00058k-Tf
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 02:15:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1n9MEI-00056i-1G; Mon, 17 Jan 2022 02:15:02 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:36430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1n9MEF-0008Mq-Un; Mon, 17 Jan 2022 02:15:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4130360F70;
 Mon, 17 Jan 2022 07:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A37C36AE3;
 Mon, 17 Jan 2022 07:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642403693;
 bh=jjm5NWk3SO/aGygcHcvNGAeKOMCMQq/MU64LaFWU2KU=;
 h=From:To:Cc:Subject:Date:From;
 b=FD115qMaeV3dX+9EL3coh4w1mDt/kmYGJJmfq93uulCEuOk6ltSa1nPpCU5F2Pq3f
 VfRvSG8Kne14VnVGX44oNKD1Sg+azAyiVrgqpVqhuSsOlXaKy5xcqClzPTVCOPaQ0S
 IevJ6td+Njmdkd0146uziN2aC2MI3DvqOageO4n5IDuMZEHeBaiKIdlem1d0dwiq6R
 5kvOcHdbuxewRpcWpAGmBLRejde5PzVo8fHdnTNCJwheHc+0hG9aEtRhKBE/5gubVI
 L71DsVH1av0I6GQnlUhqpObYlFjXuTgBb8q9lFhaNdroP2q3MpRHBXhJWbHns4mFn8
 zCSxLWpWD6pvA==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Guo Ren <ren_guo@c-sky.com>,
 Bin Meng <bmeng.cn@gmail.com>, Liu Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>
Subject: [PATCH] target/riscv: Ignore reserved bits in PTE for RV64
Date: Mon, 17 Jan 2022 15:14:39 +0800
Message-Id: <20220117071439.1841844-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=guoren@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 17 Jan 2022 07:15:08 -0000

From: Guo Ren <ren_guo@c-sky.com>

Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
need to ignore them. They cannot be a part of ppn.

1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
   4.4 Sv39: Page-Based 39-bit Virtual-Memory System
   4.5 Sv48: Page-Based 48-bit Virtual-Memory System

2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Junqiang Wang <wangjunqiang@iscas.ac.cn>

---
 Changelog V7:
  - Update svpbmt reason in commit log

 Changelog V6:
  - Add Reviewer: Alistair Francis

 Changelog V5:
  - Add Reviewer and Tester: Bin Meng

 Changelog V4:
  - Change title to Ignore not Bugfix
  - Use PTE_PPN_MASK for RV32 and RV64

 Changelog V3:
  - Use UUL define for PTE_RESERVED
  - Keep ppn >> PTE_PPN_SHIFT

 Changelog V2:
  - Bugfix pte destroyed cause boot fail
  - Change to AND with a mask instead of shifting both directions
---
 target/riscv/cpu_bits.h   | 7 +++++++
 target/riscv/cpu_helper.c | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5106f0e769..fa22839d54 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -479,6 +479,13 @@ typedef enum {
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
 
+/* Page table PPN mask */
+#if defined(TARGET_RISCV32)
+#define PTE_PPN_MASK        0xffffffffUL
+#elif defined(TARGET_RISCV64)
+#define PTE_PPN_MASK        0x3fffffffffffffULL
+#endif
+
 /* Leaf page shift amount */
 #define PGSHIFT             12
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7945f687b4..06c5403fdd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -619,7 +619,7 @@ restart:
             return TRANSLATE_FAIL;
         }
 
-        hwaddr ppn = pte >> PTE_PPN_SHIFT;
+        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
 
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
-- 
2.25.1


