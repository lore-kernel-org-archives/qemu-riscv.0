Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqlSt-0003ft-QI
	for mharc-qemu-riscv@gnu.org; Tue, 08 Jun 2021 19:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqlSs-0003cN-4E; Tue, 08 Jun 2021 19:48:58 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:51192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqlSp-00017h-My; Tue, 08 Jun 2021 19:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623196135; x=1654732135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AuURfL0k3VVidwsEBze4ybTVo1wFWOoP1zuo9Br1ZgM=;
 b=M81ktoxtUEROgQbKqMDM1DgZBOYKu8iiSzW5kS4MqX5L7M8ZMXYDNfCu
 O3nAg8q8P5N5ccRNl+x9mwXsRjslFP8moetxCyYuy6BKQwYsPbjEIZwOR
 YIUtWRdOp5vdGtjSHzU9Qkm9+SlfbEd6Ss2ptrm8eZHyw6eOH24yPmIFv
 Lk6GDxPgJKYy1Tw2OC4N/LsvGSU/KvX7YU31J7J2zQmGAXaV3ECoGm2vk
 7SWI9KJiIU3Nc5cyhPw0Y1wN9GuwKyQ8ddIZudS7ncYkObpL/GEEoMtHV
 6HhLqrfbkbbQwrAS47uObjb3DcY/iBrb/hiQ7xtbOWh4VzQ+ZC0bw8aQt w==;
IronPort-SDR: l4oeEovJujlQ1d7tNusS9Ysl1Hj4aytYzDhCN4/FCEJBjIlkxKhGDuPUSs4yIhFkDY7e9VbtAN
 qiJUR/83ULrLNYnosr+pJiW58cALFWa4/YwVl7v7RC/yFAsUxEtFrBCD0Mdz/DfIyZUPi+7sJ3
 KrdN/32qtEmKxne1RJUuBT2xZDkN0wtrQbhQzHIXI88TDudh5CwnMNXl3maFCj+69udJ6XHl9x
 F6pNtBXweeg5OHbx7aqeLaGVrLlC+PxbwnY/46SL/Aot1GFrMyYNulrW/plkFQ41LtfTC/RmpD
 ZCU=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; d="scan'208";a="282652289"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 07:48:52 +0800
IronPort-SDR: U4O9364AvSIVJ2/+W+qS+hRNLi0gwJb4L3TkbJ4LRIlj14SzNoB+iCJtajfLS+h+P/yWj9khLT
 +HuNKMYqWx04KXxmHb8A5FwpEMEI+2+EfTcDrzrNpDz/+upYgcolN5kytEKHGxYqSA9OJwnifZ
 ItllfIjVr9U5hFcGkaVmUYYIz5YAzqlmRv1B6dJxqQc/sn4OEQHPGb+5GgzvD4Q3ZoS9kxq7gl
 /RW2xQ1HfmOrnCiHUlRnfYu3Uw7BgUJObLD9hJBh/iBuCYE0rCByoSUp8z2wuzhoTdyiAdsRvM
 sYfPQnPdaES5rTEqRHScK0KV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 16:27:57 -0700
IronPort-SDR: 1KHNkzicYUckwAkMGmXblVppdfjSePVJLG1WdVNQVupDcI46FhxeNWLIedeZ9uMQ0h68+1klIZ
 NPS3wDFpD00PDgRuC3MHOhVe7NmAiHuJHPek2077n7l1SIepDMdnqbm9d/sq9y/Ee0JpLDfxUH
 7QGdeSl7Ygw/4kV39DJq20rZhVTusCjgKhDSZi0LU40VsTj9C61BQzUEJ1M/5STO8JR9kec6bE
 +Yf+/VQxhcHI1s7JCf0VKlr5vWqiNtBTRzGqOmhGds6v4yBF4vFK7YO3OgqRN+PiIwFv1CxXzZ
 aWE=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.83])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Jun 2021 16:48:50 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 1/3] hw/char/ibex_uart: Make the register layout private
Date: Wed,  9 Jun 2021 09:48:31 +1000
Message-Id: <596c88e8529549275971eb7ce33f80e1154ca8aa.1623196022.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623196022.git.alistair.francis@wdc.com>
References: <cover.1623196022.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Tue, 08 Jun 2021 23:48:58 -0000

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


