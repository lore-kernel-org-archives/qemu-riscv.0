Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kq18i-00036X-Ue
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 16:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6131d52cb=atish.patra@wdc.com>)
 id 1kq18c-00035g-U8; Thu, 17 Dec 2020 16:48:44 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:6682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6131d52cb=atish.patra@wdc.com>)
 id 1kq18Z-0008JI-4X; Thu, 17 Dec 2020 16:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608241719; x=1639777719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Eyb1s+6C1ZE1gqsUGC3r72kRqTJupLnUxPH2PkKmvHQ=;
 b=T0f2EErIANnae781x4vqbMG+KS+jMJ7sQorRvlnH5q3o13X7RNDeCtlD
 GO94o2Fa5pkxnkRlN9nvKFaGJyH3z091o6ipKTVW57v+8mQLZYOdD7Nsv
 +1c9IZd4u3+opLGw2JGvXXPF3nGaVsRTB9qJOUopCSOUIk44pL8cN8Xz2
 qPpr8MdMStPWhKd5BSYEY973eXogRN6CnIgRm6y7HdEG+FDbeoY91/eGE
 6inf/C9/Z6bPECPbMOi1Z3pJieG7blPkOk8RFn99FeRlj2JtSNJmmA6K+
 IOuOlteTtyLz7Vto9uCZF536JaYjW10TIha/HNFdVh2pVh9DC4kLQ7G4u Q==;
IronPort-SDR: ZcxZlVdjBzHaCWJFzG3m7chKxipMxKvH7xbHzoQms1YmTgCnJ8yWIkayIH/OLQIZut2gRNOtjS
 o7bc9kLP5pCNgIatyCPPgR7Re/qoRg0JP03wKfNekn4XdBf8W2c8o7qxrASHQKtZMsxK/m//HT
 hEl1UB0tDsXYV4NC45yujGMfbG5vblWCnlHtm2gqZl4dSjVd6HDGMVWJUiZ9mzmpbbZfhGMKcc
 dzx5Sd1AwZM1DQZ5WxmOPfsgOJt6BT6gAFKzxcIL2LT4JgLPtQcRStgTASw5/zi/daZcfjgvHk
 l/Y=
X-IronPort-AV: E=Sophos;i="5.78,428,1599494400"; d="scan'208";a="159855642"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 05:48:32 +0800
IronPort-SDR: bJvl7pvdlXUyNG9vKc0JWtkX67/awytzhF0D/uG8eanlj/OH4f9sWLRanJ1XsHdcTdVciwac8b
 xRANA42NZURSkflxkyBK4J4Lj5ycXZ9wPj1rnHM9Ohs93yJDB9D/ndE+yy93iQC/mdK2inctx4
 j77iz+RCgSA77B7Tsk1oXV5o8Rd2zwxOIwVgD3d1dXExjQI66w8CKjnKYf9vG+1l9ZUn19Gcw3
 PNownZtCS1Hb0wZyNVGEzHsHe9G0Qyt8iUucqwoc72s2CakslyGzNVlRt4uEfkDz3skftO7aUz
 otZXFxfGWmUiD5nYPYCe7xv4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 13:33:48 -0800
IronPort-SDR: nvz75U7PzX5XOy1DWEInC4ulPk0GkFYYZkV33DV6ok+HqSv4vKENksp/SgqCvwmr2FdKEVw1z3
 8rZD8d7rCoH1q/4Ru5knbOWHJgpN+hqtZF7Aoso2H379JPOPyRDPwC9RKUw6TqeBCpN2A9fr1W
 9vCpiPEmZlPA4ymMknoRcZROZBGkuhSJnpieV1Bm8ucwjtDJhsqJTeF8X3zVKwDhp33ol0DlGu
 tLSV2PTPnql9BNn/Tm+UL1y72yQn8S+2kBb9YtS8jo14qxAAQ/84Ub4WM7x8sYFQ2unvQdUIv9
 h6g=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.39])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Dec 2020 13:48:32 -0800
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
Date: Thu, 17 Dec 2020 13:48:26 -0800
Message-Id: <20201217214826.2094617-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=6131d52cb=atish.patra@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Thu, 17 Dec 2020 21:48:46 -0000

Currently, we place the DTB at 2MB from 4GB or end of DRAM which ever is
lesser. However, Linux kernel can address only 1GB of memory for RV32.
Thus, it can not map anything beyond 3GB (assuming 2GB is the starting address).
As a result, it can not process DT and panic if opensbi dynamic firmware
is used.

Fix this by placing the DTB at 2MB from 3GB or end of DRAM whichever is lower.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 hw/riscv/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index d62f3dc7581e..9e77b22e4d56 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -203,9 +203,9 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
      * We should put fdt as far as possible to avoid kernel/initrd overwriting
      * its content. But it should be addressable by 32 bit system as well.
      * Thus, put it at an aligned address that less than fdt size from end of
-     * dram or 4GB whichever is lesser.
+     * dram or 3GB whichever is lesser.
      */
-    temp = MIN(dram_end, 4096 * MiB);
+    temp = MIN(dram_end, 3072 * MiB);
     fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
 
     fdt_pack(fdt);
-- 
2.25.1


