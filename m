Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3nsp-0002GX-KQ
	for mharc-qemu-riscv@gnu.org; Wed, 14 Jul 2021 19:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3nsn-0002Fe-4j; Wed, 14 Jul 2021 19:01:37 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:27003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3nsj-0007Ly-Gj; Wed, 14 Jul 2021 19:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626303692; x=1657839692;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HEx7hskJBkjo4DXZJz2WBuEWdngpJD/Ko2p0QxEhjek=;
 b=McvGIsIZVZvbktyRvyzy7v5Bwbavck5LOOn2Bf/6kl7Mk1i+mTmivdx8
 ehy9IfqOl9h5rwOWePZI7sUxFNDjX1b5b1zAkg2CDp4iwQmTUCYHnj9+6
 vpU8MUzpYFfiyx38rar1AUs8esWDSGj20l2qxkugm6ypNGjyhMmzoYf5Z
 WLzy40568IxVrfbkRm51i/7+H0O6X5Ynp6QtT38ConfEepaM1njMhZ3C8
 7+nAmzbB33hCCZD+PAqmJlzXrzvxrtPWr8P6wq9PJxAwH1Fw+LNk8o9NA
 NDs5G31b0GJ+BJR4Sa5k7so4i8F68nGqasNWTQ8rKV4VKQ82tI99BXSAh A==;
IronPort-SDR: +JhpM9dCoTFN7Q6th3F4ULH+agMjJBImGAzePStAYuRym4RYLdD4nQI0939SeyqprijVfcyv/B
 /1TMBxg6WFsyjsHrcPtKsPkGoCsR10/dt3fNfJSQZIskTSm0eohpRNcjdMH3VmneYuyCk5LxoL
 82KnVLqjmJLD84nhtQAVZyr1s69Gz6xvBN+8gA33kSZZTw5pf/4ggzgo99mtLCZeG2yIbgGcst
 lpvtXPyIo8CA62H/ngkecdqpehlwuRB3VoXwti+tRjLb52etICLKHn9TkaeU0xkxCM3JJLUySC
 SLs=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="174602868"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 07:01:28 +0800
IronPort-SDR: O1kcYHFlYWILyrRgUZuKFuu3MmctFG10qJ7X3WYNoVm5tS24NTpQql9zCqOhD2DtFKTSHB6bOn
 GHsVEW29XlfXFFlhB8tsHxVwMVs0ptaHXqCUmVKXNj5/RJgjGylImxKQuFOgbUfi3HwPEAAY3J
 eUwXJWFvdgSl63b07WRv3IJDb57DhsEjW0GIcN2WtMbh3E4jNgP/ahs4qLWUXMI3/v5fJA2sTj
 G5dOazf+u9WspnQzMxLWVk0bMgG0BiegH8wC1tCR5NF6PHmFBcS75zW57EWTgvSAzz5zknRHNC
 eL8YFJ4f/IgawR2BaPJmBPwh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 15:39:33 -0700
IronPort-SDR: rdN4kbgAdUBn8UwMUeB5z4DZiw8VI1Po5KLpu0Bt49ZdiOMRcGgXihfZelIVVmhUZkje+YaGnb
 QJHpaPP4HpKYlirgO0XmH+Cw6ATotYyFb8vGMAbOAQvqgWNrWbUN6+or79bklzxIbSR2m+yC5d
 53CWKlqr878kseYFWIvIjPiNrXVWzE3cI9Iu+4GZvgvmvrvSU/oDKf0kcppVA39gsa9D8w/hlI
 MzmC/Dy62kdEDSqREpyDOVEHQYARN5GEofMEkae9L0sfTmfOCM5TNuvRUuwl0G5D+EE2Ki2ARl
 7BU=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.113])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Jul 2021 16:01:25 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, peter.maydell@linaro.org
Subject: [PATCH v2 1/1] hw/riscv/boot: Check the error of fdt_pack()
Date: Thu, 15 Jul 2021 09:01:22 +1000
Message-Id: <07325315b49d5555269f76094e4bc5296e0643b9.1626303527.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=8220343f1=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Wed, 14 Jul 2021 23:01:37 -0000

Coverity reports that we don't check the error result of fdt_pack(), so
let's save the result and assert that it is 0.

Fixes: Coverity CID 1458136
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/riscv/boot.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 0d38bb7426..993bf89064 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -182,7 +182,7 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
     uint32_t temp, fdt_addr;
     hwaddr dram_end = dram_base + mem_size;
-    int fdtsize = fdt_totalsize(fdt);
+    int ret, fdtsize = fdt_totalsize(fdt);
 
     if (fdtsize <= 0) {
         error_report("invalid device-tree");
@@ -198,7 +198,9 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
     temp = MIN(dram_end, 3072 * MiB);
     fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
 
-    fdt_pack(fdt);
+    ret = fdt_pack(fdt);
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret == 0);
     /* copy in the device tree */
     qemu_fdt_dumpdtb(fdt, fdtsize);
 
-- 
2.31.1


