Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnZce-0003r4-Ex
	for mharc-qemu-riscv@gnu.org; Mon, 31 May 2021 00:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=778d471cf=alistair.francis@wdc.com>)
 id 1lnZcb-0003ow-4v; Mon, 31 May 2021 00:33:49 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=778d471cf=alistair.francis@wdc.com>)
 id 1lnZcY-0002P1-Od; Mon, 31 May 2021 00:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622435625; x=1653971625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZZBEAFlCHLzJMkkQp7hJCLjN0lO5/I5hMxBAVXTFw4Q=;
 b=QZYJsg4jnpLBsn97VvZUycnJoABC2+c99E2tOpFM+xl+v0V9wUhgPTxB
 9ZCSU1tDJmm7mF0h2ZpEVK2ph/VjlvDlhg1k2I0p1HD4Hgk1BKNZAJL3J
 M/qbLxB6dp1xfYtwHAG6/bMOZgjtGFm7rWYrFnNPx6n4oaG/eBGvejFMi
 YEAZWmnpIkYHLixMeZ57dpMTH9hS1NT7Dp+7PKkfTaf9x0BQp4wIHqV2o
 R3Q9jWV14g/fHbuhV+nNFje+anO/wiFtorWteHLkHws7pjB7o6MbZo+qC
 402Cb9f+EKwYyozXo0/8kMYvr0R4bYMfVyyWhbA1c+nJQfsrS6nhKKsDA w==;
IronPort-SDR: q6mrPQo3Ig0LZaf5J8ohOT+Iy2ooh1j0ixVDG4+MdO45D0ha5Upwx9bJNhnrWsprFiZp1X96VC
 p4dhxIcyK6Jy3CZhscHg4SAiNFSVWMlQVEx1d8RgV322ypjMWx6/y+hLFGUWwrurERtx4W7YQk
 zhiC1kIOq87fQq9E4sp7xemcQ/MhdZIl9DzuITebiVoqEQwyEjOZq5U6Dg2q+zCygYZ+Td9mDs
 RCmsrYyNRvy+NGM1/+rmk/G2F+vtf6L/wCA8Q37X+pTi0C0O2rGKFc5uoExokv5jgyikDJJvhw
 19M=
X-IronPort-AV: E=Sophos;i="5.83,236,1616428800"; d="scan'208";a="174840777"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2021 12:33:40 +0800
IronPort-SDR: cKkaUZ0/D8AqoO0U1vjS4Myx+dXBm08F4da2ZaFPEEvSsy2KXeoOBl16rpTVauynF4ofYnWPbZ
 Ff/oVBa1QWNKvtUjeOez8vb3jC7QXoBp/5JYyqaApakzbh9PI39kpMdHrnSGYrmdk2vdHpfZER
 AEi1xigQUQQmfJijVQ+YQtJRtr+JGpOyOnwxwF88MkEuR/cVzL/IkMfz2Y/qD4l29pInGRQjx8
 IgSweVDMztS70zxWHl9WjBqwlkV44NPt+P/rQnsVK9fxdJoX/PZTZd9JIFlFN4x4BMo0fgVQrM
 aEC3UIUks+1kg6D+9GONoadP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2021 21:11:39 -0700
IronPort-SDR: XeVZEhm4J21rFbwb2SqcmCaOUuMJdIfRp96IjG4xDDoZFV0SBfOX3y8k/Ma6jRRBfZ35M0hc1K
 5NnfiozvaaH5UujBJfxkjm6buqSyX3Vc8ihMVujh7ZFQQ+k38lVFVLwufrKSgO9kSwB3gz5atS
 VFVVw1tGbDanneBXda1zKAy/9qJ3GhLDK17TxeuKiXT97vh84yQ2VVUxIDM7adOtQWCz+k4iX9
 ZAf24lA2OO0n7xfuo0hlHli2ngQR/SrSe6fKzYtAUd8I/3z+DnnI+dOs30MaPICbyrkLKxUkOV
 dz0=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.65])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 May 2021 21:33:40 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/3] hw/char/ibex_uart: Make the register layout private
Date: Mon, 31 May 2021 14:33:37 +1000
Message-Id: <547296f990a03d5524ab65a9987083d69e4ebaea.1622435529.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622435529.git.alistair.francis@wdc.com>
References: <cover.1622435529.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=778d471cf=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Mon, 31 May 2021 04:33:50 -0000

We don't need to expose the register layout in the public header, so
don't.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/ibex_uart.h | 37 -------------------------------------
 hw/char/ibex_uart.c         | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
index 546f958eb8..a39985516a 100644
--- a/include/hw/char/ibex_uart.h
+++ b/include/hw/char/ibex_uart.h
@@ -31,43 +31,6 @@
 #include "qemu/timer.h"
 #include "qom/object.h"
 
-REG32(INTR_STATE, 0x00)
-    FIELD(INTR_STATE, TX_WATERMARK, 0, 1)
-    FIELD(INTR_STATE, RX_WATERMARK, 1, 1)
-    FIELD(INTR_STATE, TX_EMPTY, 2, 1)
-    FIELD(INTR_STATE, RX_OVERFLOW, 3, 1)
-REG32(INTR_ENABLE, 0x04)
-REG32(INTR_TEST, 0x08)
-REG32(CTRL, 0x0C)
-    FIELD(CTRL, TX_ENABLE, 0, 1)
-    FIELD(CTRL, RX_ENABLE, 1, 1)
-    FIELD(CTRL, NF, 2, 1)
-    FIELD(CTRL, SLPBK, 4, 1)
-    FIELD(CTRL, LLPBK, 5, 1)
-    FIELD(CTRL, PARITY_EN, 6, 1)
-    FIELD(CTRL, PARITY_ODD, 7, 1)
-    FIELD(CTRL, RXBLVL, 8, 2)
-    FIELD(CTRL, NCO, 16, 16)
-REG32(STATUS, 0x10)
-    FIELD(STATUS, TXFULL, 0, 1)
-    FIELD(STATUS, RXFULL, 1, 1)
-    FIELD(STATUS, TXEMPTY, 2, 1)
-    FIELD(STATUS, RXIDLE, 4, 1)
-    FIELD(STATUS, RXEMPTY, 5, 1)
-REG32(RDATA, 0x14)
-REG32(WDATA, 0x18)
-REG32(FIFO_CTRL, 0x1c)
-    FIELD(FIFO_CTRL, RXRST, 0, 1)
-    FIELD(FIFO_CTRL, TXRST, 1, 1)
-    FIELD(FIFO_CTRL, RXILVL, 2, 3)
-    FIELD(FIFO_CTRL, TXILVL, 5, 2)
-REG32(FIFO_STATUS, 0x20)
-    FIELD(FIFO_STATUS, TXLVL, 0, 5)
-    FIELD(FIFO_STATUS, RXLVL, 16, 5)
-REG32(OVRD, 0x24)
-REG32(VAL, 0x28)
-REG32(TIMEOUT_CTRL, 0x2c)
-
 #define IBEX_UART_TX_FIFO_SIZE 16
 #define IBEX_UART_CLOCK 50000000 /* 50MHz clock */
 
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 73b8f2e45b..fe4b6c3c9e 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -35,6 +35,43 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 
+REG32(INTR_STATE, 0x00)
+    FIELD(INTR_STATE, TX_WATERMARK, 0, 1)
+    FIELD(INTR_STATE, RX_WATERMARK, 1, 1)
+    FIELD(INTR_STATE, TX_EMPTY, 2, 1)
+    FIELD(INTR_STATE, RX_OVERFLOW, 3, 1)
+REG32(INTR_ENABLE, 0x04)
+REG32(INTR_TEST, 0x08)
+REG32(CTRL, 0x0C)
+    FIELD(CTRL, TX_ENABLE, 0, 1)
+    FIELD(CTRL, RX_ENABLE, 1, 1)
+    FIELD(CTRL, NF, 2, 1)
+    FIELD(CTRL, SLPBK, 4, 1)
+    FIELD(CTRL, LLPBK, 5, 1)
+    FIELD(CTRL, PARITY_EN, 6, 1)
+    FIELD(CTRL, PARITY_ODD, 7, 1)
+    FIELD(CTRL, RXBLVL, 8, 2)
+    FIELD(CTRL, NCO, 16, 16)
+REG32(STATUS, 0x10)
+    FIELD(STATUS, TXFULL, 0, 1)
+    FIELD(STATUS, RXFULL, 1, 1)
+    FIELD(STATUS, TXEMPTY, 2, 1)
+    FIELD(STATUS, RXIDLE, 4, 1)
+    FIELD(STATUS, RXEMPTY, 5, 1)
+REG32(RDATA, 0x14)
+REG32(WDATA, 0x18)
+REG32(FIFO_CTRL, 0x1c)
+    FIELD(FIFO_CTRL, RXRST, 0, 1)
+    FIELD(FIFO_CTRL, TXRST, 1, 1)
+    FIELD(FIFO_CTRL, RXILVL, 2, 3)
+    FIELD(FIFO_CTRL, TXILVL, 5, 2)
+REG32(FIFO_STATUS, 0x20)
+    FIELD(FIFO_STATUS, TXLVL, 0, 5)
+    FIELD(FIFO_STATUS, RXLVL, 16, 5)
+REG32(OVRD, 0x24)
+REG32(VAL, 0x28)
+REG32(TIMEOUT_CTRL, 0x2c)
+
 static void ibex_uart_update_irqs(IbexUartState *s)
 {
     if (s->uart_intr_state & s->uart_intr_enable & R_INTR_STATE_TX_WATERMARK_MASK) {
-- 
2.31.1


