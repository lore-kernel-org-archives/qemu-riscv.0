Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCzEJ-0005FN-RV
	for mharc-qemu-riscv@gnu.org; Wed, 25 Sep 2019 00:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53460)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoren@kernel.org>) id 1iCzEH-0005DK-AV
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 00:48:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoren@kernel.org>) id 1iCzEG-0001mq-7Q
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 00:48:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:36720)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoren@kernel.org>)
 id 1iCzEB-0001lN-Ob; Wed, 25 Sep 2019 00:48:35 -0400
Received: from guoren-Inspiron-7460.lan (unknown [223.93.147.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E6B021A4A;
 Wed, 25 Sep 2019 04:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569386914;
 bh=GMapcb2WUHqhsll7OX2TGMlEII/fxxpk18SPz1OiNHQ=;
 h=From:To:Cc:Subject:Date:From;
 b=btfWax6XT8Qss02p583ulK8ekt0bfbP9xQn6wnma5yluT6oaT0Agr5n0xdURfPh1r
 BRqeyhZ78ASME5v1ZVHCF4l+5S4mCPJE/ZDSsLzj57LGgt808LU67C/KP6mwGB/qKM
 gGnaNWZyGy7qgRhftjQEV5m0oJCF/b2uEnYhGKeQ=
From: guoren@kernel.org
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@sifive.com, alistair23@gmail.com,
 Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V3] target/riscv: Bugfix reserved bits in PTE for RV64
Date: Wed, 25 Sep 2019 12:48:15 +0800
Message-Id: <1569386895-8726-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 198.145.29.99
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
X-List-Received-Date: Wed, 25 Sep 2019 04:48:42 -0000

From: Guo Ren <ren_guo@c-sky.com>

Highest 10 bits of PTE are reserved in riscv-privileged, ref: [1], so we
need to ignore them. They can not be a part of ppn.

1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
   4.4 Sv39: Page-Based 39-bit Virtual-Memory System
   4.5 Sv48: Page-Based 48-bit Virtual-Memory System

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_bits.h   | 3 +++
 target/riscv/cpu_helper.c | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)
---
Changelog V3:
 - Use UUL define for PTE_RESERVED.
 - Keep ppn >> PTE_PPN_SHIFT 

Changelog V2:
 - Bugfix pte destroyed cause boot fail
 - Change to AND with a mask instead of shifting both directions

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index e998348..cdc62a8 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -470,6 +470,9 @@
 #define PTE_D               0x080 /* Dirty */
 #define PTE_SOFT            0x300 /* Reserved for Software */
 
+/* Reserved highest 10 bits in PTE */
+#define PTE_RESERVED        0xFFC0000000000000ULL
+
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 87dd6a6..7e04ff5 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -258,10 +258,12 @@ restart:
         }
 #if defined(TARGET_RISCV32)
         target_ulong pte = ldl_phys(cs->as, pte_addr);
+        hwaddr ppn = pte;
 #elif defined(TARGET_RISCV64)
         target_ulong pte = ldq_phys(cs->as, pte_addr);
+        hwaddr ppn = pte & ~PTE_RESERVED;
 #endif
-        hwaddr ppn = pte >> PTE_PPN_SHIFT;
+        ppn = ppn >> PTE_PPN_SHIFT;
 
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
-- 
2.7.4


