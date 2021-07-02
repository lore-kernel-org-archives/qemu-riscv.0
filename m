Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lzBai-0004JJ-7P
	for mharc-qemu-riscv@gnu.org; Fri, 02 Jul 2021 01:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8103b7a7b=alistair.francis@wdc.com>)
 id 1lzBag-0004GB-5B; Fri, 02 Jul 2021 01:19:50 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:49384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8103b7a7b=alistair.francis@wdc.com>)
 id 1lzBae-0000UE-DT; Fri, 02 Jul 2021 01:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625203191; x=1656739191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oX7q0IJl6Dt5J2lO5ygo/BScCkapHchEBLgRnKgMJEY=;
 b=UMp1pWuodS6k3D7At/L5GmD+fXnwe/YFbfVGeLpuDWfLCh+VwPNiBS6C
 9+fzEss4DDezjpq/T4eK1Lnwh56nxnBZCYHrsXADCksnGOd/sHfpw94Of
 mu7mJtVax8VCTgpkpA3pdXMfv7HF9GQus3lQYN2uY1UpIXTa4lVF2C+lT
 iZ+17kYSbceMozHdpx3mnmwVXcWjJJVzN63dOHSmz/6+HfVcFs4eM1+HP
 SA3Y0mbUH6bOmaZqHU6qRDN7E5Tcik2Zlcc72CURA4rNNV88fFD3OhOrM
 VHqSRurXRAwl0MKDmnceYLrOY3WeklU2sQiU6pqi2uZgYmVI45dZ104LR A==;
IronPort-SDR: lxFwll7/UU6xbayiz80c57wpFZZqBNDPUad/mTFovyRmFY5dA0I5cuo35pbZV1XEjyrUFK+w/P
 J8qLqX80ytdKBg6K44cOBgy+BCPdslzEDLaTCYrpPPrldOLW18eNfY6Afc4TK/MZibPeYiBqXu
 gh+30IucM4cV0jO048arl5128WACnHTSNqZd5PTN7XJ9LXmqqZnluF3trXBDyt6SGdIEC7DEn1
 c9yPe6YeJ21Ukuo/WcfuGCoi6ePO6hA/zpZWfuw6w63/6Vt9Fb/6+QaI2hIuvn1c/KBvlBC4yf
 qF4=
X-IronPort-AV: E=Sophos;i="5.83,316,1616428800"; d="scan'208";a="277327906"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2021 13:19:48 +0800
IronPort-SDR: ByGCvYo0//gTzlVaWCxLWfri5KlJ40EgFm8bz8pamTUQu1oeBU8SdX2QjlBwCMtSsAunlidgo1
 TMFySavDeGDIwWeb6r0jMjPkPPCFNJhLPlt6jsDWGZ9KmIFG+iYOzP/zTnBmEj+gAFqWhOxTCK
 BBt/07KesOvnMnL8eDLvA6BVJkzJtHK50UuwPnAllUO4jubVClnjJmEpLFBt5v2XaQPvgZT/b6
 I7T0LPd467I83B2wXBXyie+rBMaKAM8Aw2fKWViWemvIB1D7DRfpsd3FgDabs1MEU84EOurE/n
 jiHy0UIN+QYi4Yoqttsv4Csx
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 21:56:52 -0700
IronPort-SDR: OkvlsJh2U4hK+i3fdSTsEe9h3m+KC3R0Nd3eEg5zg2q4uFQUOhrA3y0yTJwOAKCaQg3GieOjuT
 ijh72np+WQuu1/NQ3veDp1kku/i8j2yovEn7Pm1pifYucMlS+FjsO8Uj33l3MasJtG5OIgOjil
 4Rl6WkSltFWZk0DT9IvB2pPGn3nQ2ugyYdonXNwWDNKpFg8hR5NWmLkLRb459mAyohjlXm6mrG
 28z4pSnnRu9eJTFlewtNRLtL4RK4vLyZfSRtYbw3Od1cUv23p+tCHBoXA/QCkfGOmRWnKdJsKp
 sUw=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.102])
 by uls-op-cesaip01.wdc.com with ESMTP; 01 Jul 2021 22:19:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/3] char: ibex_uart: Update the register layout
Date: Fri,  2 Jul 2021 15:19:20 +1000
Message-Id: <95a65b30416ac27416ed551f499e14b85284573c.1625202999.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625202999.git.alistair.francis@wdc.com>
References: <cover.1625202999.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=8103b7a7b=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 02 Jul 2021 05:19:50 -0000

Update the register layout to match the latest OpenTitan bitstream.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/ibex_uart.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index fe4b6c3c9e..6b0c9330bf 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -42,7 +42,8 @@ REG32(INTR_STATE, 0x00)
     FIELD(INTR_STATE, RX_OVERFLOW, 3, 1)
 REG32(INTR_ENABLE, 0x04)
 REG32(INTR_TEST, 0x08)
-REG32(CTRL, 0x0C)
+REG32(ALERT_TEST, 0x0C)
+REG32(CTRL, 0x10)
     FIELD(CTRL, TX_ENABLE, 0, 1)
     FIELD(CTRL, RX_ENABLE, 1, 1)
     FIELD(CTRL, NF, 2, 1)
@@ -52,25 +53,25 @@ REG32(CTRL, 0x0C)
     FIELD(CTRL, PARITY_ODD, 7, 1)
     FIELD(CTRL, RXBLVL, 8, 2)
     FIELD(CTRL, NCO, 16, 16)
-REG32(STATUS, 0x10)
+REG32(STATUS, 0x14)
     FIELD(STATUS, TXFULL, 0, 1)
     FIELD(STATUS, RXFULL, 1, 1)
     FIELD(STATUS, TXEMPTY, 2, 1)
     FIELD(STATUS, RXIDLE, 4, 1)
     FIELD(STATUS, RXEMPTY, 5, 1)
-REG32(RDATA, 0x14)
-REG32(WDATA, 0x18)
-REG32(FIFO_CTRL, 0x1c)
+REG32(RDATA, 0x18)
+REG32(WDATA, 0x1C)
+REG32(FIFO_CTRL, 0x20)
     FIELD(FIFO_CTRL, RXRST, 0, 1)
     FIELD(FIFO_CTRL, TXRST, 1, 1)
     FIELD(FIFO_CTRL, RXILVL, 2, 3)
     FIELD(FIFO_CTRL, TXILVL, 5, 2)
-REG32(FIFO_STATUS, 0x20)
+REG32(FIFO_STATUS, 0x24)
     FIELD(FIFO_STATUS, TXLVL, 0, 5)
     FIELD(FIFO_STATUS, RXLVL, 16, 5)
-REG32(OVRD, 0x24)
-REG32(VAL, 0x28)
-REG32(TIMEOUT_CTRL, 0x2c)
+REG32(OVRD, 0x28)
+REG32(VAL, 0x2C)
+REG32(TIMEOUT_CTRL, 0x30)
 
 static void ibex_uart_update_irqs(IbexUartState *s)
 {
-- 
2.31.1


