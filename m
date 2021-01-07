Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxRKT-0008VG-Sg
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jan 2021 04:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=634a5def5=atish.patra@wdc.com>)
 id 1kxRKS-0008Sq-2Z; Thu, 07 Jan 2021 04:11:36 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:24019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=634a5def5=atish.patra@wdc.com>)
 id 1kxRKP-0005JK-AX; Thu, 07 Jan 2021 04:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610010693; x=1641546693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I/MhugurugNGvvWXulRQVrb0yhFYNb+h9xyzU5fFVjs=;
 b=ls+dSK+Z3Guwy5B4N+qgKFdRMPoOvICIvVQS2W/MSW8th3Xk/laP8pZ5
 Fjv7747FAXjyizYwU0nAuzuggum5MKKAX6v5veNjmDkoYzVS2IJ1GyTnU
 RBFpPj08OL6MQ9hzVnG/BItG2s01ypQYQt+Hapmh2kRhS3/gyDKYo1AsJ
 6IPprq/k4/GzEng1FkqvgQAnXS/RIa4HLGBA7RJwh1LOSE+sajlq2WD9e
 V7mok/h5quzgj0UWQfjqrZZ9sJk14kGj2e4tpJGx2xx+YT0iZatHsseEp
 EzBWhDhj3MSABir4AdTEbCs3eN7OyramHMjlXbo5ux/IBCeEYLrtiWYpr g==;
IronPort-SDR: y8zCJN3MiIqCkPom/4ZIBGgLiAUrlC/KgJEUWya1ZNiuYzuAQx0ghiFMkm529bRI3dt+kTdN92
 uqzSh34joPhyNnmfStjg0XIjw5mQ07k/VSmXcZJiVVoUIM9zcfplom7JGeUIANuQJcm24cMleJ
 0JNqyYfu9cPkShEuF8f/4PylqICGcoZiNVci/psQVhdeNqPqqSARuq5D/ec2eV4A8km3tmMREf
 GzbD8pGXIrFRLeuQL9SIqozwPUFqxJ+865A1zhOFvyigxrYxBLESTamDS0EDFI4r8KYg9SjANm
 osk=
X-IronPort-AV: E=Sophos;i="5.79,329,1602518400"; d="scan'208";a="161137545"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jan 2021 17:11:29 +0800
IronPort-SDR: pHJeTlnExuXeJtYLm3KqXtXzck0iKZFZ0B5NVVxoRC6PkR0Twy2HfKFHxRDM7mg6kie2JKCD1N
 BzrOKFKjr8FIyBvhOmRkuawO6gBU2IiwuqQWPXS6RN3RCaa6XDAZLdQmcoac50+3RqVsbu8aSy
 1GpLjkoJhBsgHA4BbSVcYeUeokU5+LmWPfIQgExhs4xga0dTDQYtCxzS5ZlEu6LAffaCwoUb3/
 iwvSQO7+Xg1n2qRK9YTrY0eJSE5IL/xcvQRkjgHlt5hCUkc8jt51kRLAsT+GOIj2gb1qAzvdS5
 Q47eeLnJcnc+xLfK+UAX00Mc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 00:54:28 -0800
IronPort-SDR: f5F+ouawqWDH9Tr4YAF9RDJWd3yx4bBp/oA8AetxHMxBa2j4DSu6okX42YkaaV8s4MlKN5ll/Z
 KqdGg6vfxKTxHPKc3Gbsd6ifCR5acb/9VVr3m94DU4dgtVW1fKdgtj0XHwBq5/w22/mdQDAsq4
 l+OQupdnlEl6p93umbbNIlIzChksA6RyKe5th/Pa6qTI6WumGSlusW51a77oW0DNXKratAPKro
 6I/Wnr8c3K1NuR9YtfmA66y2FBlVfL6BpRQy/NZbn70IbM/WEf3HAujrPSFhkRhUHcGzlwwmY/
 13Y=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.136])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jan 2021 01:11:30 -0800
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [v2 PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
Date: Thu,  7 Jan 2021 01:11:27 -0800
Message-Id: <20210107091127.3407870-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=634a5def5=atish.patra@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 07 Jan 2021 09:11:36 -0000

Currently, we place the DTB at 2MB from 4GB or end of DRAM which ever is
lesser. However, Linux kernel can address only 1GB of memory for RV32.
Thus, it can not map anything beyond 3GB (assuming 2GB is the starting address).
As a result, it can not process DT and panic if opensbi dynamic firmware
is used. While at it, place the DTB further away to avoid in memory placement
issues in future.

Fix this by placing the DTB at 16MB from 3GB or end of DRAM whichever is lower.

Fixes: 66b1205bc5ab ("RISC-V: Copy the fdt in dram instead of ROM")

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
Changes from v2->v1
1. Added the fixes tag and updated aligned down address to 16MB.
---
 hw/riscv/boot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index d62f3dc7581e..2ed23c7e9849 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -202,11 +202,11 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
     /*
      * We should put fdt as far as possible to avoid kernel/initrd overwriting
      * its content. But it should be addressable by 32 bit system as well.
-     * Thus, put it at an aligned address that less than fdt size from end of
-     * dram or 4GB whichever is lesser.
+     * Thus, put it at an 16MB aligned address that less than fdt size from the
+     * end of dram or 3GB whichever is lesser.
      */
-    temp = MIN(dram_end, 4096 * MiB);
-    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
+    temp = MIN(dram_end, 3072 * MiB);
+    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
 
     fdt_pack(fdt);
     /* copy in the device tree */
-- 
2.25.1


