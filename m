Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUqA0-0000oQ-SY
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 08:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9m-0000j5-RB; Fri, 09 Apr 2021 08:22:40 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:13110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9f-0000ud-EL; Fri, 09 Apr 2021 08:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617970951; x=1649506951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZRSu18u1FsBj8Of4XRmHZ8i/NxUK3I+0gnIJ2LKuObA=;
 b=WbJ4ry5moMV8rwq9EGwKuf0GLRSAs3Q4SU/j4R8atIp3p6Cgxk+JIoYf
 DOYYjpwyc+8xfZ2NeJevD+CEKQ3ccCUONGquwX2xhtgLjfATIcXZPjk3I
 X2TrwFjuHw1bHMouLeFVdJpZAyRQTiYtglQzKty34ZLXlt3ja8zivRpYX
 vGogBnRCBhRckjxtY2XoA+eY7f+orFPEUa5gXtqAQYTWPVInj9iyfYXKx
 //fuxw4ysWeVuKCFKjlFcmZwTp4kuee9tEAs7ynnKuFcPkE6JIyZZCiy5
 myBa4qXzVhona9vY0zwces7XGNWrE0+zTM0pKacULFXyRe9fEpRIH7H2F Q==;
IronPort-SDR: evvI/tWcX458vQ21+8TLaFOzHWG+gWBJgoX1PWA82eBL8BKS8TN2MYeENd8iggSeRyVavnvgL9
 H2NKnF84Dlup6+ZGQGMuoDPaFrJHoj311rXf12GqOK2c158egv+s40AyHMIBSBl1jeiCAAt6Ju
 wRpSKxmUYEyFjz+xxdwQv1+lzjvp89d9vUxwJo1eZuyfpkOCVdVs3GmoYoaWFYpGtylNvcnOU1
 w1phwgOUhzoGQ/UW/wwJziR+I16aATAOA+X5zaHrsCH9kaRvrmJBGD6yzALqiB6oZR9C5f8sSc
 kLY=
X-IronPort-AV: E=Sophos;i="5.82,209,1613404800"; d="scan'208";a="163998908"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 20:22:14 +0800
IronPort-SDR: dafp2ZwXMyTxeLtipmEbpXBK8EEnW8GPeEC7qhPv4bN/Dr8heQ2/TFDCJIWTW1aL3alneBwKAZ
 EFpUH8nRAEBzadi5hnkimI5tR8K+EDuTEy7LvR6xBJFV1/xHnHrK+G16JJBoaxN2MGzGHUyvcy
 NJYkuEwreCLeQYdqIOhcgb2X5cwxC2Q4gTsZR3qvFy2VadIAaOmeG040eq8D4V4mWg+iMa/XSN
 32w0M6TxVy0aPMCIs0vETG1Bdug/FJxF5H4EqAgmGcPALBNm9vSbkVf4jj2j1LglPHEws/nCMp
 W7ZJ4LN74AGY4k7ARbqLg05i
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 05:03:17 -0700
IronPort-SDR: oZQEpGo8OUW4gO3j6lPzv8oy11sDlQ2y6ICZ3PENyIX1D8GFTb2GYXjXijVnbH8n/9FjGjJk1L
 HCwIlo+FqIOLhRUl69oCSAB0/U5zvybe7xltFZv81FYJWUr49ZP8VgmCbXoWF9RnpMfZOfJlp6
 0CNpqiV9kFDLmaqViA7xIP4mpbyH9JP9v/oiqtW39faHgXQmdWz7yT4j6S3BAqQHgN9hPJiHRN
 FISwKm/N7ZidAGMmLyWLC3pT7m0acTUnDZFlyeqqxaPTkPfb6LKCqIZASkBPM0qImNaTb1nb2Y
 99s=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.98])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Apr 2021 05:22:06 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 2/8] target/riscv: Define ePMP mseccfg
Date: Fri,  9 Apr 2021 08:20:05 -0400
Message-Id: <ff64915c9ea90fe5b234013df538e435154b0d36.1617970729.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617970729.git.alistair.francis@wdc.com>
References: <cover.1617970729.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=726c96411=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 09 Apr 2021 12:22:41 -0000

From: Hou Weiying <weiying_hou@outlook.com>

Use address 0x390 and 0x391 for the ePMP CSRs.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <SG2PR02MB2634D85E5DF0C2BB540AE1BB93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
[ Changes by AF:
 - Tidy up commit message
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8549d77b4f..24d89939a0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -220,6 +220,9 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Enhanced Physical Memory Protection (ePMP) */
+#define CSR_MSECCFG         0x390
+#define CSR_MSECCFGH        0x391
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
-- 
2.31.0


