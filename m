Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lu8v3-0003Qa-Bv
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jun 2021 03:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=79658353d=alistair.francis@wdc.com>)
 id 1lu8v1-0003MZ-CH; Fri, 18 Jun 2021 03:27:59 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:17459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=79658353d=alistair.francis@wdc.com>)
 id 1lu8uv-0005fZ-Ou; Fri, 18 Jun 2021 03:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624001272; x=1655537272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AuURfL0k3VVidwsEBze4ybTVo1wFWOoP1zuo9Br1ZgM=;
 b=Ii711evdRTSV/IrpHfBQ+5N5RETYyXO21dZ8rxNurHxRXpdQQMUc21lG
 scNt72lSfUvSejvXaE2v5y+sLs1ZpeZ8CR7R7vFGvTaTD6nw1ew5hbrpL
 dEVdWf8ipjRPDYFWNbAuW6ymphLG+eZgvcjNIJZz/vDHJLxqit+aj7DhG
 LDlY5ey7rId3GziXDsybtYtLiSbocZi20DjFm4dFRzL8441ZSCZYfgf37
 KHU7Sx0Mc7qjLjqvRaaAO7iTNZXPai1U1MjNADWUw6BfxF7SJQG1TnbD+
 X20qljfqrdg6Llm8ZqIxQ9tqp5KjzBJgdJWiOJUAnZwjb52jictIkunl1 g==;
IronPort-SDR: x5SdZu3JO4uW72PqNy8mGvrEeNpa9K5r163JdJOe2+MePrHxJs74Pi/uAoL+iLVqLvCxZwakmK
 r5UuMLzqAKGvVkQaDxx3S82UA5FtddvaX3YQxSfHP64GnTIW7VrgOuJ67ybVi4C/0E2/b719uj
 UugL8b+oGiTX67WO59DcFxkI1X/NVVmMfqLIF1tTbx8OFXb5+KdmC3PiZ3N5jXpZgbq+c0OCfp
 GrcSXSERDKWZiorCwFsnCan1vDaRXYijvz5hGmpVB4LJ1L4OdZ6B4nUYffVbPd09/4H5QJftxM
 iO4=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="172284361"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2021 15:27:51 +0800
IronPort-SDR: kK93x0GnJAUxc/np9mjs5AM30iDFHtCPOzB1O5/06+knRpbSsxXpgOGuapouvN1U+ZA/1Y6B0c
 gtBZXbVqbs5K2uqVT85Rsfa1uYaoxYRDAtKRYXW/Jd3HTVyqFFxLbRUzKz+IKEEuZCDcIWsBdF
 Md+jMJldB+8Tcz0HmLt7fHsI5U9stx13wI4Xzq44D/mS0U4zV8iS2423s867COrwjw4PoiywHn
 nmrmamFQ0lYaLrogDgTfpUHDv1t/WLWp1Lsa8IbLg6kRq323QxteXWBJly157Es1vMz9EbkEfd
 ZZTBYQH1VgbViPnnvEDMRo5g
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 00:05:17 -0700
IronPort-SDR: MtZV/aUlqxRZ9Q3Oi+xJAiA7FEFLd9zVHSrhuQvZgOOB1DSzto00qpww4iasREa8ljWiX9h9Zh
 BdS7fsQrGy/TqYW7k4cex8UmjdFJOtZXbe0EA4PmVSwhgPrwekdhoRQ7MHxQOsb7bV3nmYbD1x
 Ruf6R6aOyhAbeDj6/sye/RlAp+tYQeJaS1zt2oDi1tbTX609KiRT7rDqDJzZNjRvgxPZN11Kxw
 M6bH3rQjTKKyO68U4qaTeu75gOIJTHFPgeBu0iOgjSGDUae5pnN0+Tj1q4iFJDBZn+2eEnNibf
 /U8=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.95])
 by uls-op-cesaip01.wdc.com with ESMTP; 18 Jun 2021 00:27:49 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 1/3] hw/char/ibex_uart: Make the register layout private
Date: Fri, 18 Jun 2021 17:27:48 +1000
Message-Id: <c437f570b2b30ab4170387a3ba2fad7d116a4986.1624001156.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624001156.git.alistair.francis@wdc.com>
References: <cover.1624001156.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=79658353d=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Fri, 18 Jun 2021 07:27:59 -0000

We don't need to expose the register layout in the public header, so
don't.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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


