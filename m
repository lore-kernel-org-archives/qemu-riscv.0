Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9Ilt-0008NL-Ko
	for mharc-qemu-riscv@gnu.org; Tue, 03 Mar 2020 20:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=3258e4f7a=alistair.francis@wdc.com>)
 id 1j9Ilq-0008Ml-3h
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 20:24:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=3258e4f7a=alistair.francis@wdc.com>)
 id 1j9Ilp-0007GC-1U
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 20:24:22 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:16870)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=3258e4f7a=alistair.francis@wdc.com>)
 id 1j9Ill-00078V-89; Tue, 03 Mar 2020 20:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1583285057; x=1614821057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xO5lDNI57+ZUonUsJ58F4KlftObd3tOaYp8RT/BsLFo=;
 b=TXUChy+ive9+LDtgMnzvVBtllZZ9tU2Xj4l4a9D/LohaJGc0zKDXvlDi
 Z+C9VfhjMnSOjwGhmbzmo3cw/LRldwHhP1MCuBd9usOF07v4Irt3tCcwr
 hbfYqewzzYaAQdO9zKHYVAWZ1IWC9G3xYHKOQXgLnjwT4A05fFBuw4PMB
 WL9nZC3+rxMiH8A7/ITveYwf/89r/zQ/RZi7I0ZcBYsBBAUI2DaJlCUqy
 KqaQc9qkC4kgJ6gE+fjBKZRvrfUkHY1CzXWSJCEnZDmoqLq9EkREle2kd
 LY7sfVShrbF4XcGI/A2mJgVRHgA5ue4bt8PNVf7AR52pLbx0i+7VFcZL/ g==;
IronPort-SDR: J7E4Qh1ts06Bc2kM4o4lUrNhiepr4+pNPsNlenue+B5388bISTupXs4zlrV3rel8uaASDBCdnV
 WWCy7HIznjXD7i+YRMJzpLPFzQSrwpTeYdn2N2RMPahbGao1UT2UsrCQSmk9LPJX7MFI3Cnw2s
 RhFu8teHXzdffN7VHWmmn+H0qF2Pyrrn/2P0hpkvP5U4pvc6Nv5Tkngky3kN4anylEkBbWK4No
 TDD9WG693eB2HG6+k9xbxp6s8E4boVLRiHLywI7rEzdzO04F/AYq4xrvAr/akU2YF05SrYDxyk
 Brc=
X-IronPort-AV: E=Sophos;i="5.70,511,1574092800"; d="scan'208";a="239580932"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2020 09:24:13 +0800
IronPort-SDR: Hhl34WJsQBKIlzr0/mr90f0OKRdmYtiNr3zl15xdQ7Q6j2kart19iAtLnSHgiSJ2kKmPhtIZiR
 EabaJl9ZXfMXdvt0GAHebeAPW1FoIljWXuQlKDatPSfOk7XsAEzKtM2SlpKLkyq2PpD7lFYDcp
 airwt/e4j17aN5dbNLGRgjl5sRmo+Xxo8f3KknyVEOhC7vvuhJpP3IowfmwzHVLe73gwMZ4kef
 bbk2kM1VRCSsmGyVEtYrMSYzsMyxN+cvGKXgIv5sRH4I2iEiO+dY6JJdHgdlCU9InxqkqELSk6
 4WA/Q6wMMeuYHFm4y2GoqJ+P
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 17:16:04 -0800
IronPort-SDR: tUjXUgxzsT8Y3fIVX8oLmxmhj5KLFsgA+rHCDBhw/sWdLE54dhYoWdsYeWODlzPNU7EPl0goYc
 kMPQohnOV5PfuPi7M23mBaI9d52uQCPFeqMoqYhwvOhsB5QSvu6Xm6mO+hnEFKnmaf02gYqKVe
 EbYYzRJMaAY/3JfrpbJVfYhVvLXxbgiPTxK+NWKD0+cYlVq2khWTD2ClsOzGp8yFe6PWBC5WmS
 lbG9G9UyeYCkc/7qhamjDtlFByppqRakAhNmbn0lgWYHA1zHCadyEVUJBeP20MsyBH88w+H/5C
 6Io=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Mar 2020 17:24:14 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 1/1] target/riscv: Don't set write permissions on dirty PTEs
Date: Tue,  3 Mar 2020 17:16:59 -0800
Message-Id: <c827880a47774cd3a6bcd59b79657f380da11d5d.1583284602.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.141.245
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
X-List-Received-Date: Wed, 04 Mar 2020 01:24:23 -0000

The RISC-V spec specifies that when a write happens and the D bit is
clear the implementation will set the bit in the PTE. It does not
describe that the PTE being dirty means that we should provide write
access. This patch removes the write access granted to pages when the
dirty bit is set.

Following the prot variable we can see that it affects all of these
functions:
 riscv_cpu_tlb_fill()
   tlb_set_page()
     tlb_set_page_with_attrs()
       address_space_translate_for_iotlb()

Looking at the cputlb code (tlb_set_page_with_attrs() and
address_space_translate_for_iotlb()) it looks like the main affect of
setting write permissions is that the page can be marked as TLB_NOTDIRTY.

I don't see any other impacts (related to the dirty bit) for giving a
page write permissions.

Setting write permission on dirty PTEs results in userspace inside a
Hypervisor guest (VU) becoming corrupted. This appears to be because it
ends up with write permission in the second stage translation in cases
where we aren't doing a store.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5ea5d133aa..cc9f20b471 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -572,10 +572,8 @@ restart:
             if ((pte & PTE_X)) {
                 *prot |= PAGE_EXEC;
             }
-            /* add write permission on stores or if the page is already dirty,
-               so that we TLB miss on later writes to update the dirty bit */
-            if ((pte & PTE_W) &&
-                    (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
+            /* add write permission on stores */
+            if ((pte & PTE_W) && (access_type == MMU_DATA_STORE)) {
                 *prot |= PAGE_WRITE;
             }
             return TRANSLATE_SUCCESS;
-- 
2.25.1


