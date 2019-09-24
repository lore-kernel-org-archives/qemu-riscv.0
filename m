Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCkbA-00082k-8o
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 09:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51829)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoren@kernel.org>) id 1iCcx6-0002Ef-Vk
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 01:01:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoren@kernel.org>) id 1iCcx5-0002Vq-Rz
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 01:01:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:42318)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoren@kernel.org>)
 id 1iCcx0-0002SV-Gm; Tue, 24 Sep 2019 01:01:22 -0400
Received: from guoren-Inspiron-7460.lan (unknown [223.93.147.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E62BF20872;
 Tue, 24 Sep 2019 05:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569301277;
 bh=n1RdI/OAQ/Vw9nYytQuGvnrhjR9yJhMd+lcOx6KQFv8=;
 h=From:To:Cc:Subject:Date:From;
 b=XntcTVCQElHvXgfQECcraAyn8QkgAwmxqKipHF0Q2uGOCXdfk9/CfaF52nEFsDHih
 D88ImgDkR3tnHgnmVBPFEeD/QekZyi6KFnoYrdnm04UEgBpb5bPKkCTD3c5xUbxIjB
 Fn+RASkpqoYtdRv6tll1cnrhz742yKIvNx5/VDYw=
From: guoren@kernel.org
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@sifive.com, alistair23@gmail.com,
 Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH] target/riscv: Bugfix reserved bits in PTE for RV64
Date: Tue, 24 Sep 2019 13:00:32 +0800
Message-Id: <1569301232-7128-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 198.145.29.99
X-Mailman-Approved-At: Tue, 24 Sep 2019 09:11:19 -0400
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
X-List-Received-Date: Tue, 24 Sep 2019 05:01:32 -0000

From: Guo Ren <ren_guo@c-sky.com>

Highest 10 bits of PTE are reserved in riscv-privileged, ref: [1], so we
need to ignore them. They can not be a part of ppn.

1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
   4.4 Sv39: Page-Based 39-bit Virtual-Memory System
   4.5 Sv48: Page-Based 48-bit Virtual-Memory System

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 87dd6a6..3c5e8f6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -260,6 +260,7 @@ restart:
         target_ulong pte = ldl_phys(cs->as, pte_addr);
 #elif defined(TARGET_RISCV64)
         target_ulong pte = ldq_phys(cs->as, pte_addr);
+        pte = pte << 10 >> 10;
 #endif
         hwaddr ppn = pte >> PTE_PPN_SHIFT;
 
-- 
2.7.4


