Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3ZEO-0002XQ-U3
	for mharc-qemu-riscv@gnu.org; Wed, 14 Jul 2021 03:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZEL-0002Wm-FT; Wed, 14 Jul 2021 03:22:54 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:37800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZEH-0005yD-G8; Wed, 14 Jul 2021 03:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626247409; x=1657783409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dHWhLjKGgYc6CwszLn9ceo2uXKnSQ2xMixsZnUCboWM=;
 b=IIguRd4iUVru105oolXpjiy7Vy0OA2325FA69F2l3R/wl4hyOjgr6Cok
 321yApSt7TefGQEhRWUEmNlQ7CPPKOkmf69ydklNbfHIq2ABldapZLcIA
 Tvd1hi6m9+mnU6mRxWAA0i/bcJVLVrDDcZfTqXOZXhm0HHZvWChieGhPV
 tpgAWd9N4Q26KUzwemFQfc/YXM//08SJb/1g4UnL+nQV2mkALrbVMrstI
 2wFxqNNYgUQ4e8kYvN//g0ivZbytE7W1urMUwlWkewy6oynSRngB8HIFE
 +E2ziDrlY/IHb691k+PfFAuUKJ2zdUsBNLEXVygQkSK5xdSUQQtHBpToD A==;
IronPort-SDR: Nz1xDddxO/ijrxjyhA9unr0DT0cBaeOC3hHm+oRlTrvTTZ3NHSA7pUP883m248gF1/+hlKQq+1
 qBu6TeE/z48g4i25YaoG5Gya2OE0Wew2xIip7mtP/NlhnZZ+9/IHky94MNdhagQfHjhpPg4rhN
 ebBHnFI3zY+RftTbLmeW5L9xbtPMFF0TaNy0RqsVDA63edG1K82jxUvdjXZSaZchfrXoHdmYgR
 PUzoHEI57KQYjJDrkqw9aaaOWKeDvpChVoXD37kBwXxwTyQMbj6XKjt/I+wOhh+49GyZHmqpBI
 eDY=
X-IronPort-AV: E=Sophos;i="5.84,238,1620662400"; d="scan'208";a="278349640"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2021 15:23:21 +0800
IronPort-SDR: +Jw8NrafevXlNWzSYwQdwKo+37pwilGlxtsYgsPg3Dxba0uGvkpEweSN3qWe3IlexPaKjuNnHz
 +5LW+IIDgkt1UhFyt8Ou8KgUgzM9JUXZYCzgkFtkRSjv5DOdfUZeRJcxdIVaQVC2IKSpFtQG6m
 vcpZsal17NOaaRJY6EoXlSdlqpVOwdaWD5ri5sDUBdAbdID9+qGdTzti6N0MsbbzjcGe3MqlJm
 LgAnk2/UvKtPwXXHXAEUuzLT02RoCLJuXSl+jpEzL0wPsuY26G+aS0rbqvE8V/BF9mhfuUnfxk
 QXi3wOYoFokzRKE08L4MpHbX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 00:00:47 -0700
IronPort-SDR: FjIrvGZ5IfgToGQPp4Hh6BTEQgd6ZugoTKePcqKYM0jkHQgpaFRDZvmgmPpHAyle/04/35nBj9
 dBMp5SeSu0k1D6IuaWZf2CsAob86b6MCPq9Ox9Og11ZTnXhz0/SjBtV0BZz/l+E4Y72t9fXizA
 k9XKj6PJAhc0CjGcQa6lBEfuNjJGtYCa0YtNSK4tR0bfmjMVWbCf0wJ+LKVhTN30UjUnxJllPj
 xk0sfMSL6OS4++3ULsD9+O/tDEQkfNnTfiWHo1w85/3yR/FgDZuO27rgN6WucF04HsoJo9yHh0
 fVE=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.112])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Jul 2021 00:22:38 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, peter.maydell@linaro.org
Subject: [PATCH v1 1/1] hw/riscv/boot: Check the error of fdt_pack()
Date: Wed, 14 Jul 2021 17:22:36 +1000
Message-Id: <da5acadd07eabd5a6e9fc8870fecb435173b8f47.1626247332.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=8220343f1=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Wed, 14 Jul 2021 07:22:54 -0000

Coverity reports that we don't check the error result of fdt_pack(), so
let's save the result and assert that it is 0.

Fixes: Coverity CID 1458136
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 0d38bb7426..25406a3f67 100644
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
@@ -198,7 +198,8 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
     temp = MIN(dram_end, 3072 * MiB);
     fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
 
-    fdt_pack(fdt);
+    ret = fdt_pack(fdt);
+    g_assert(ret == 0);
     /* copy in the device tree */
     qemu_fdt_dumpdtb(fdt, fdtsize);
 
-- 
2.31.1


