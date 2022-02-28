Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOWuU-0006PD-1H
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 22:41:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=051f0bf02=alistair.francis@opensource.wdc.com>)
 id 1nOWuR-0006Oq-So
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 22:41:15 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:7968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=051f0bf02=alistair.francis@opensource.wdc.com>)
 id 1nOWuN-0001R6-3I
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 22:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646019670; x=1677555670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y5HXAkbzU9MjBknj22dP6LJaRxD4YX/TQ0qHSp0sTKs=;
 b=arftKk/GwLeWi3IpLIpS86xfqPnkwAAWCCZ3ae7D39ljd/hB8bTWatbq
 vxxFtWLyqNBtRzVpO0oktDlDmlHDP45bW6zvTXsmniLuAZIbZpa5+zHE6
 Yttb07d3gcJPnH3SteifcJWnstMe5Y2FbRpu7CyoOjZnYOL+Gl8zST52o
 W8By0EtR0iDmvOZzsP4jKc2A4WYUq5RZSzH7N83FgdFw154cdilFMU6UA
 m+jgIBealTgLcF21km4Esxd/Ji3rWDJicZS3ShUTFAB/RAzsaaDWDHJuS
 nnxHdeqLXmm4hAUETKPfCicaokippO/U+6Gyeg3l6VSnpUVLakE6XCSie Q==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643644800"; d="scan'208";a="198906077"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Feb 2022 11:41:05 +0800
IronPort-SDR: 4kCO4Ik7GEjUrWE1gopEl3OkN7tW2q6tYrzPlQyyq4SAaxdhd5wzx547q1oVQAIQqBlKWGAwyI
 yVLb5favDskx9cXm2Yx4FoH63zz6B7oe1mOMbNCJyzi8D6eqIzQro1qN7yv0xJmvwyiIYv0KvQ
 75QIOdKHJ4KewGJ6IWUiRtvGf+QhkKwwAKJkfyr9OfKRd8KYZhLB8btV7f6YhzDpn15b6xBmMQ
 Tf1NoHcg0XghDVNVibrFzoxTxiJ3Sb8rzPXO9HpHk6emt6IHsOO+OCk2hyotlQgOg7mfzhsEor
 htoSYngE31As29WqOmsff6d9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 19:13:37 -0800
IronPort-SDR: COJodAaOtZxNGBzjFasWwVSMjBuUmei+pHKhfP3tiEJfUhtNkPu9kac2fMP10Y8pzxY0BpCY+n
 WiI73bFMFMLRriLHts+SSS81fNsv74YZlnaD5KJHibNoJH+W9KXVqB1m+EAOECV3wcCQU8RbEi
 OcSSNoz4aSs6BBPbZB4PBO1eBC94jdPmJhXcLzGU9k6kFaxryWj6JZTJ0g4+iwqL0PBlwiQt6i
 lKD/3CF5CZQNuwK3YCxwHhE0Dr0YRtzYoNgt1r0T0kd+2H3AK+mqXViYG1BPuGQcontdjb8P+L
 ezY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 19:41:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K6R4L6YCwz1SVp0
 for <qemu-riscv@nongnu.org>; Sun, 27 Feb 2022 19:41:06 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1646019664;
 x=1648611665; bh=Y5HXAkbzU9MjBknj22dP6LJaRxD4YX/TQ0qHSp0sTKs=; b=
 cGGw/H7ap+0Xifsl8fBQLkUIOMbEDiOmXSL9LmTFvSF5GE2TwUcJXQIOu/GCYD/G
 bYHQRT80sFZKAKeP1AqrTZyZn7G4Um1yf0QCSTVl1b47U54TCAzzgm+QvY8FOW/m
 L9CtC+DJT4FVgLQhNdabQPKvSmHGlm4lWwteuy+8RPkeqNkrbsNwW7oAfhWhzqHm
 aOgXfMtM8wIL5/Fv8xlerZRLUGrjC34LQgQIgoEjSh9YDBaOriBpcOSAlXkhmnHB
 vdQ+Z20ivaRfQzp1ifT2ORroXWRCOQs+e5xImtMocQDh2crwiJee4IlBvt7e6CRG
 47PP+tsDsDpaiy7Fs1qS4Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4D3DKY0kxbQL for <qemu-riscv@nongnu.org>;
 Sun, 27 Feb 2022 19:41:04 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.100])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K6R4B3pVDz1Rvlx;
 Sun, 27 Feb 2022 19:40:57 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH v2 1/2] hw/ssi: Add Ibex SPI device model
Date: Mon, 28 Feb 2022 13:40:46 +1000
Message-Id: <20220228034047.34612-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=051f0bf02=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Feb 2022 03:41:16 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Adds the SPI_HOST device model for ibex. The device specification is as p=
er
[1]. The model has been tested on opentitan with spi_host unit tests
written for TockOS.

[1] https://docs.opentitan.org/hw/ip/spi_host/doc/

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/ssi/ibex_spi_host.c         | 613 +++++++++++++++++++++++++++++++++
 hw/ssi/meson.build             |   1 +
 hw/ssi/trace-events            |   7 +
 include/hw/ssi/ibex_spi_host.h |  94 +++++
 4 files changed, 715 insertions(+)
 create mode 100644 hw/ssi/ibex_spi_host.c
 create mode 100644 include/hw/ssi/ibex_spi_host.h

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
new file mode 100644
index 0000000000..bee2ade3ef
--- /dev/null
+++ b/hw/ssi/ibex_spi_host.c
@@ -0,0 +1,613 @@
+
+/*
+ * QEMU model of the Ibex SPI Controller
+ * SPEC Reference: https://docs.opentitan.org/hw/ip/spi_host/doc/
+ *
+ * Copyright (C) 2022 Western Digital
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/ssi/ibex_spi_host.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+REG32(INTR_STATE, 0x00)
+    FIELD(INTR_STATE, ERROR, 0, 1)
+    FIELD(INTR_STATE, SPI_EVENT, 1, 1)
+REG32(INTR_ENABLE, 0x04)
+    FIELD(INTR_ENABLE, ERROR, 0, 1)
+    FIELD(INTR_ENABLE, SPI_EVENT, 1, 1)
+REG32(INTR_TEST, 0x08)
+    FIELD(INTR_TEST, ERROR, 0, 1)
+    FIELD(INTR_TEST, SPI_EVENT, 1, 1)
+REG32(ALERT_TEST, 0x0c)
+    FIELD(ALERT_TEST, FETAL_TEST, 0, 1)
+REG32(CONTROL, 0x10)
+    FIELD(CONTROL, RX_WATERMARK, 0, 8)
+    FIELD(CONTROL, TX_WATERMARK, 1, 8)
+    FIELD(CONTROL, OUTPUT_EN, 29, 1)
+    FIELD(CONTROL, SW_RST, 30, 1)
+    FIELD(CONTROL, SPIEN, 31, 1)
+REG32(STATUS, 0x14)
+    FIELD(STATUS, TXQD, 0, 8)
+    FIELD(STATUS, RXQD, 18, 8)
+    FIELD(STATUS, CMDQD, 16, 3)
+    FIELD(STATUS, RXWM, 20, 1)
+    FIELD(STATUS, BYTEORDER, 22, 1)
+    FIELD(STATUS, RXSTALL, 23, 1)
+    FIELD(STATUS, RXEMPTY, 24, 1)
+    FIELD(STATUS, RXFULL, 25, 1)
+    FIELD(STATUS, TXWM, 26, 1)
+    FIELD(STATUS, TXSTALL, 27, 1)
+    FIELD(STATUS, TXEMPTY, 28, 1)
+    FIELD(STATUS, TXFULL, 29, 1)
+    FIELD(STATUS, ACTIVE, 30, 1)
+    FIELD(STATUS, READY, 31, 1)
+REG32(CONFIGOPTS, 0x18)
+    FIELD(CONFIGOPTS, CLKDIV_0, 0, 16)
+    FIELD(CONFIGOPTS, CSNIDLE_0, 16, 4)
+    FIELD(CONFIGOPTS, CSNTRAIL_0, 20, 4)
+    FIELD(CONFIGOPTS, CSNLEAD_0, 24, 4)
+    FIELD(CONFIGOPTS, FULLCYC_0, 29, 1)
+    FIELD(CONFIGOPTS, CPHA_0, 30, 1)
+    FIELD(CONFIGOPTS, CPOL_0, 31, 1)
+REG32(CSID, 0x1c)
+    FIELD(CSID, CSID, 0, 32)
+REG32(COMMAND, 0x20)
+    FIELD(COMMAND, LEN, 0, 8)
+    FIELD(COMMAND, CSAAT, 9, 1)
+    FIELD(COMMAND, SPEED, 10, 2)
+    FIELD(COMMAND, DIRECTION, 12, 2)
+REG32(ERROR_ENABLE, 0x2c)
+    FIELD(ERROR_ENABLE, CMDBUSY, 0, 1)
+    FIELD(ERROR_ENABLE, OVERFLOW, 1, 1)
+    FIELD(ERROR_ENABLE, UNDERFLOW, 2, 1)
+    FIELD(ERROR_ENABLE, CMDINVAL, 3, 1)
+    FIELD(ERROR_ENABLE, CSIDINVAL, 4, 1)
+REG32(ERROR_STATUS, 0x30)
+    FIELD(ERROR_STATUS, CMDBUSY, 0, 1)
+    FIELD(ERROR_STATUS, OVERFLOW, 1, 1)
+    FIELD(ERROR_STATUS, UNDERFLOW, 2, 1)
+    FIELD(ERROR_STATUS, CMDINVAL, 3, 1)
+    FIELD(ERROR_STATUS, CSIDINVAL, 4, 1)
+    FIELD(ERROR_STATUS, ACCESSINVAL, 5, 1)
+REG32(EVENT_ENABLE, 0x30)
+    FIELD(EVENT_ENABLE, RXFULL, 0, 1)
+    FIELD(EVENT_ENABLE, TXEMPTY, 1, 1)
+    FIELD(EVENT_ENABLE, RXWM, 2, 1)
+    FIELD(EVENT_ENABLE, TXWM, 3, 1)
+    FIELD(EVENT_ENABLE, READY, 4, 1)
+    FIELD(EVENT_ENABLE, IDLE, 5, 1)
+
+static inline uint8_t div4_round_up(uint8_t dividend)
+{
+    return (dividend + 3) / 4;
+}
+
+static void ibex_spi_rxfifo_reset(IbexSPIHostState *s)
+{
+    /* Empty the RX FIFO and assert RXEMPTY */
+    fifo8_reset(&s->rx_fifo);
+    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXFULL_MASK;
+    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_RXEMPTY_MASK;
+}
+
+static void ibex_spi_txfifo_reset(IbexSPIHostState *s)
+{
+    /* Empty the TX FIFO and assert TXEMPTY */
+    fifo8_reset(&s->tx_fifo);
+    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXFULL_MASK;
+    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_TXEMPTY_MASK;
+}
+
+static void ibex_spi_host_reset(DeviceState *dev)
+{
+    IbexSPIHostState *s =3D IBEX_SPI_HOST(dev);
+    trace_ibex_spi_host_reset("Resetting Ibex SPI");
+
+    /* SPI Host Register Reset */
+    s->regs[IBEX_SPI_HOST_INTR_STATE]   =3D 0x00;
+    s->regs[IBEX_SPI_HOST_INTR_ENABLE]  =3D 0x00;
+    s->regs[IBEX_SPI_HOST_INTR_TEST]    =3D 0x00;
+    s->regs[IBEX_SPI_HOST_ALERT_TEST]   =3D 0x00;
+    s->regs[IBEX_SPI_HOST_CONTROL]      =3D 0x7f;
+    s->regs[IBEX_SPI_HOST_STATUS]       =3D 0x00;
+    s->regs[IBEX_SPI_HOST_CONFIGOPTS]   =3D 0x00;
+    s->regs[IBEX_SPI_HOST_CSID]         =3D 0x00;
+    s->regs[IBEX_SPI_HOST_COMMAND]      =3D 0x00;
+    /* RX/TX Modelled by FIFO */
+    s->regs[IBEX_SPI_HOST_RXDATA]       =3D 0x00;
+    s->regs[IBEX_SPI_HOST_TXDATA]       =3D 0x00;
+
+    s->regs[IBEX_SPI_HOST_ERROR_ENABLE] =3D 0x1F;
+    s->regs[IBEX_SPI_HOST_ERROR_STATUS] =3D 0x00;
+    s->regs[IBEX_SPI_HOST_EVENT_ENABLE] =3D 0x00;
+
+    ibex_spi_rxfifo_reset(s);
+    ibex_spi_txfifo_reset(s);
+
+    return;
+}
+
+/*
+ * Check if we need to trigger an interrupt.
+ * The two interrupts lines (host_err and event) can
+ * be enabled separately in 'IBEX_SPI_HOST_INTR_ENABLE'.
+ *
+ * Interrupts are triggered based on the ones
+ * enabled in the `IBEX_SPI_HOST_EVENT_ENABLE` and `IBEX_SPI_HOST_ERROR_=
ENABLE`.
+ */
+static void ibex_spi_host_irq(IbexSPIHostState *s)
+{
+    bool error_en =3D s->regs[IBEX_SPI_HOST_INTR_ENABLE]
+                    & R_INTR_ENABLE_ERROR_MASK;
+    bool event_en =3D s->regs[IBEX_SPI_HOST_INTR_ENABLE]
+                    & R_INTR_ENABLE_SPI_EVENT_MASK;
+    bool err_pending =3D s->regs[IBEX_SPI_HOST_INTR_STATE]
+                        & R_INTR_STATE_ERROR_MASK;
+    bool status_pending =3D s->regs[IBEX_SPI_HOST_INTR_STATE]
+                        & R_INTR_STATE_SPI_EVENT_MASK;
+    int err_irq =3D 0, event_irq =3D 0;
+
+    /* Error IRQ enabled and Error IRQ Cleared*/
+    if (error_en && !err_pending) {
+        /* Event enabled, Interrupt Test Error */
+        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
+            err_irq =3D 1;
+        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
+                    &  R_ERROR_ENABLE_CMDBUSY_MASK) &&
+                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
+                    & R_ERROR_STATUS_CMDBUSY_MASK) {
+            /* Wrote to COMMAND when not READY */
+            err_irq =3D 1;
+        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
+                    &  R_ERROR_ENABLE_CMDINVAL_MASK) &&
+                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
+                    & R_ERROR_STATUS_CMDINVAL_MASK) {
+            /* Invalid command segment */
+            err_irq =3D 1;
+        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
+                    & R_ERROR_ENABLE_CSIDINVAL_MASK) &&
+                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
+                    & R_ERROR_STATUS_CSIDINVAL_MASK) {
+            /* Invalid value for CSID */
+            err_irq =3D 1;
+        }
+        if (err_irq) {
+            s->regs[IBEX_SPI_HOST_INTR_STATE] |=3D R_INTR_STATE_ERROR_MA=
SK;
+        }
+        qemu_set_irq(s->host_err, err_irq);
+    }
+
+    /* Event IRQ Enabled and Event IRQ Cleared */
+    if (event_en && !status_pending) {
+        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_SPI_EVENT_MAS=
K) {
+            /* Event enabled, Interrupt Test Event */
+            event_irq =3D 1;
+        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
+                    & R_EVENT_ENABLE_READY_MASK) &&
+                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK=
)) {
+            /* SPI Host ready for next command */
+            event_irq =3D 1;
+        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
+                    & R_EVENT_ENABLE_TXEMPTY_MASK) &&
+                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_TXEMPTY_MA=
SK)) {
+            /* SPI TXEMPTY, TXFIFO drained */
+            event_irq =3D 1;
+        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
+                    & R_EVENT_ENABLE_RXFULL_MASK) &&
+                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_RXFULL_MAS=
K)) {
+            /* SPI RXFULL, RXFIFO  full */
+            event_irq =3D 1;
+        }
+        if (event_irq) {
+            s->regs[IBEX_SPI_HOST_INTR_STATE] |=3D R_INTR_STATE_SPI_EVEN=
T_MASK;
+        }
+        qemu_set_irq(s->event, event_irq);
+    }
+}
+
+static void ibex_spi_host_transfer(IbexSPIHostState *s)
+{
+    uint32_t rx, tx;
+    /* Get num of one byte transfers */
+    uint8_t segment_len =3D ((s->regs[IBEX_SPI_HOST_COMMAND] & R_COMMAND=
_LEN_MASK)
+                          >> R_COMMAND_LEN_SHIFT);
+    while (segment_len > 0) {
+        if (fifo8_is_empty(&s->tx_fifo)) {
+            /* Assert Stall */
+            s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_TXSTALL_MASK;
+            break;
+        } else if (fifo8_is_full(&s->rx_fifo)) {
+            /* Assert Stall */
+            s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_RXSTALL_MASK;
+            break;
+        } else {
+            tx =3D fifo8_pop(&s->tx_fifo);
+        }
+
+        rx =3D ssi_transfer(s->ssi, tx);
+
+        trace_ibex_spi_host_transfer(tx, rx);
+
+        if (!fifo8_is_full(&s->rx_fifo)) {
+            fifo8_push(&s->rx_fifo, rx);
+        } else {
+            /* Assert RXFULL */
+            s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_RXFULL_MASK;
+        }
+        --segment_len;
+    }
+
+    /* Assert Ready */
+    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_READY_MASK;
+    /* Set RXQD */
+    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXQD_MASK;
+    s->regs[IBEX_SPI_HOST_STATUS] |=3D (R_STATUS_RXQD_MASK
+                                    & div4_round_up(segment_len));
+    /* Set TXQD */
+    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXQD_MASK;
+    s->regs[IBEX_SPI_HOST_STATUS] |=3D (fifo8_num_used(&s->tx_fifo) / 4)
+                                    & R_STATUS_TXQD_MASK;
+    /* Clear TXFULL */
+    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXFULL_MASK;
+    /* Assert TXEMPTY and drop remaining bytes that exceed segment_len *=
/
+    ibex_spi_txfifo_reset(s);
+    /* Reset RXEMPTY */
+    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXEMPTY_MASK;
+
+    ibex_spi_host_irq(s);
+}
+
+static uint64_t ibex_spi_host_read(void *opaque, hwaddr addr,
+                                     unsigned int size)
+{
+    IbexSPIHostState *s =3D opaque;
+    uint32_t rc =3D 0;
+    uint8_t rx_byte =3D 0;
+
+    trace_ibex_spi_host_read(addr, size);
+
+    /* Match reg index */
+    addr =3D addr >> 2;
+    switch (addr) {
+    /* Skipping any W/O registers */
+    case IBEX_SPI_HOST_INTR_STATE...IBEX_SPI_HOST_INTR_ENABLE:
+    case IBEX_SPI_HOST_CONTROL...IBEX_SPI_HOST_STATUS:
+        rc =3D s->regs[addr];
+        break;
+    case IBEX_SPI_HOST_CSID:
+        rc =3D s->regs[addr];
+        break;
+    case IBEX_SPI_HOST_CONFIGOPTS:
+        rc =3D s->config_opts[s->regs[IBEX_SPI_HOST_CSID]];
+        break;
+    case IBEX_SPI_HOST_TXDATA:
+        rc =3D s->regs[addr];
+        break;
+    case IBEX_SPI_HOST_RXDATA:
+        /* Clear RXFULL */
+        s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXFULL_MASK;
+
+        for (int i =3D 0; i < 4; ++i) {
+            if (fifo8_is_empty(&s->rx_fifo)) {
+                /* Assert RXEMPTY, no IRQ */
+                s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_RXEMPTY_MASK=
;
+                s->regs[IBEX_SPI_HOST_ERROR_STATUS] |=3D
+                                                R_ERROR_STATUS_UNDERFLOW=
_MASK;
+                return rc;
+            }
+            rx_byte =3D fifo8_pop(&s->rx_fifo);
+            rc |=3D rx_byte << (i * 8);
+        }
+        break;
+    case IBEX_SPI_HOST_ERROR_ENABLE...IBEX_SPI_HOST_EVENT_ENABLE:
+        rc =3D s->regs[addr];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad offset 0x%" HWADDR_PRIx "\n"=
,
+                      addr << 2);
+    }
+    return rc;
+}
+
+
+static void ibex_spi_host_write(void *opaque, hwaddr addr,
+                                uint64_t val64, unsigned int size)
+{
+    IbexSPIHostState *s =3D opaque;
+    uint32_t val32 =3D val64;
+    uint32_t shift_mask =3D 0xff;
+    uint8_t txqd_len;
+
+    trace_ibex_spi_host_write(addr, size, val64);
+
+    /* Match reg index */
+    addr =3D addr >> 2;
+
+    switch (addr) {
+    /* Skipping any R/O registers */
+    case IBEX_SPI_HOST_INTR_STATE...IBEX_SPI_HOST_INTR_ENABLE:
+        s->regs[addr] =3D val32;
+        break;
+    case IBEX_SPI_HOST_INTR_TEST:
+        s->regs[addr] =3D val32;
+        ibex_spi_host_irq(s);
+        break;
+    case IBEX_SPI_HOST_ALERT_TEST:
+        s->regs[addr] =3D val32;
+        qemu_log_mask(LOG_UNIMP,
+                        "%s: SPI_ALERT_TEST is not supported\n", __func_=
_);
+        break;
+    case IBEX_SPI_HOST_CONTROL:
+        s->regs[addr] =3D val32;
+
+        if (val32 & R_CONTROL_SW_RST_MASK)  {
+            ibex_spi_host_reset((DeviceState *)s);
+            /* Clear active if any */
+            s->regs[IBEX_SPI_HOST_STATUS] &=3D  ~R_STATUS_ACTIVE_MASK;
+        }
+
+        if (val32 & R_CONTROL_OUTPUT_EN_MASK)  {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: CONTROL_OUTPUT_EN is not supported\n", __=
func__);
+        }
+        break;
+    case IBEX_SPI_HOST_CONFIGOPTS:
+        /* Update the respective config-opts register based on CSIDth in=
dex */
+        s->config_opts[s->regs[IBEX_SPI_HOST_CSID]] =3D val32;
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: CONFIGOPTS Hardware settings not supported\n"=
,
+                         __func__);
+        break;
+    case IBEX_SPI_HOST_CSID:
+        if (val32 >=3D s->num_cs) {
+            /* CSID exceeds max num_cs */
+            s->regs[IBEX_SPI_HOST_ERROR_STATUS] |=3D
+                                                R_ERROR_STATUS_CSIDINVAL=
_MASK;
+            ibex_spi_host_irq(s);
+            return;
+        }
+        s->regs[addr] =3D val32;
+        break;
+    case IBEX_SPI_HOST_COMMAND:
+        s->regs[addr] =3D val32;
+
+        /* STALL, IP not enabled */
+        if (!(s->regs[IBEX_SPI_HOST_CONTROL] & R_CONTROL_SPIEN_MASK)) {
+            return;
+        }
+
+        /* SPI not ready, IRQ Error */
+        if (!(s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK)) {
+            s->regs[IBEX_SPI_HOST_ERROR_STATUS] |=3D R_ERROR_STATUS_CMDB=
USY_MASK;
+            ibex_spi_host_irq(s);
+            return;
+        }
+        /* Assert Not Ready */
+        s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_READY_MASK;
+
+        if (((val32 & R_COMMAND_DIRECTION_MASK) >> R_COMMAND_DIRECTION_S=
HIFT)
+            !=3D BIDIRECTIONAL_TRANSFER) {
+                qemu_log_mask(LOG_UNIMP,
+                          "%s: Rx Only/Tx Only are not supported\n", __f=
unc__);
+        }
+
+        if (val32 & R_COMMAND_CSAAT_MASK)  {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: CSAAT is not supported\n", __func__);
+        }
+        if (val32 & R_COMMAND_SPEED_MASK)  {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: SPEED is not supported\n", __func__);
+        }
+
+        /* Set Transfer Callback */
+        timer_mod(s->fifo_trigger_handle,
+                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                    (TX_INTERRUPT_TRIGGER_DELAY_NS));
+
+        break;
+    case IBEX_SPI_HOST_TXDATA:
+        /*
+         * This is a hardware `feature` where
+         * the first word written TXDATA after init is omitted entirely
+         */
+        if (s->init_status) {
+            s->init_status =3D false;
+            return;
+        }
+
+        for (int i =3D 0; i < 4; ++i) {
+            /* Attempting to write when TXFULL */
+            if (fifo8_is_full(&s->tx_fifo)) {
+                /* Assert RXEMPTY, no IRQ */
+                s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_TXFULL_MASK;
+                s->regs[IBEX_SPI_HOST_ERROR_STATUS] |=3D
+                                                 R_ERROR_STATUS_OVERFLOW=
_MASK;
+                ibex_spi_host_irq(s);
+                return;
+            }
+            /* Byte ordering is set by the IP */
+            if ((s->regs[IBEX_SPI_HOST_STATUS] &
+                R_STATUS_BYTEORDER_MASK) =3D=3D 0) {
+                /* LE: LSB transmitted first (default for ibex processor=
) */
+                shift_mask =3D 0xff << (i * 8);
+            } else {
+                /* BE: MSB transmitted first */
+                qemu_log_mask(LOG_UNIMP,
+                             "%s: Big endian is not supported\n", __func=
__);
+            }
+
+            fifo8_push(&s->tx_fifo, (val32 & shift_mask) >> (i * 8));
+        }
+
+        /* Reset TXEMPTY */
+        s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXEMPTY_MASK;
+        /* Update TXQD */
+        txqd_len =3D (s->regs[IBEX_SPI_HOST_STATUS] &
+                    R_STATUS_TXQD_MASK) >> R_STATUS_TXQD_SHIFT;
+        /* Partial bytes (size < 4) are padded, in words. */
+        txqd_len +=3D 1;
+        s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXQD_MASK;
+        s->regs[IBEX_SPI_HOST_STATUS] |=3D txqd_len;
+        /* Assert Ready */
+        s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_READY_MASK;
+        break;
+    case IBEX_SPI_HOST_ERROR_ENABLE:
+        s->regs[addr] =3D val32;
+
+        if (val32 & R_ERROR_ENABLE_CMDINVAL_MASK)  {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: Segment Length is not supported\n", __fun=
c__);
+        }
+        break;
+    case IBEX_SPI_HOST_ERROR_STATUS:
+    /*
+     *  Indicates that any errors that have occurred.
+     *  When an error occurs, the corresponding bit must be cleared
+     *  here before issuing any further commands
+     */
+        s->regs[addr] =3D val32;
+        break;
+    case IBEX_SPI_HOST_EVENT_ENABLE:
+    /* Controls which classes of SPI events raise an interrupt. */
+        s->regs[addr] =3D val32;
+
+        if (val32 & R_EVENT_ENABLE_RXWM_MASK)  {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: RXWM is not supported\n", __func__);
+        }
+        if (val32 & R_EVENT_ENABLE_TXWM_MASK)  {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: TXWM is not supported\n", __func__);
+        }
+
+        if (val32 & R_EVENT_ENABLE_IDLE_MASK)  {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: IDLE is not supported\n", __func__);
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad offset 0x%" HWADDR_PRIx "\n"=
,
+                      addr << 2);
+    }
+}
+
+static const MemoryRegionOps ibex_spi_ops =3D {
+    .read =3D ibex_spi_host_read,
+    .write =3D ibex_spi_host_write,
+    /* Ibex default LE */
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+};
+
+static Property ibex_spi_properties[] =3D {
+    DEFINE_PROP_UINT32("num_cs", IbexSPIHostState, num_cs, 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_ibex =3D {
+    .name =3D TYPE_IBEX_SPI_HOST,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IbexSPIHostState, IBEX_SPI_HOST_MAX_R=
EGS),
+        VMSTATE_VARRAY_UINT32(config_opts, IbexSPIHostState,
+                              num_cs, 0, vmstate_info_uint32, uint32_t),
+        VMSTATE_FIFO8(rx_fifo, IbexSPIHostState),
+        VMSTATE_FIFO8(tx_fifo, IbexSPIHostState),
+        VMSTATE_TIMER_PTR(fifo_trigger_handle, IbexSPIHostState),
+        VMSTATE_BOOL(init_status, IbexSPIHostState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void fifo_trigger_update(void *opaque)
+{
+    IbexSPIHostState *s =3D opaque;
+    ibex_spi_host_transfer(s);
+}
+
+static void ibex_spi_host_realize(DeviceState *dev, Error **errp)
+{
+    IbexSPIHostState *s =3D IBEX_SPI_HOST(dev);
+    int i;
+
+    s->ssi =3D ssi_create_bus(dev, "ssi");
+    s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
+
+    for (i =3D 0; i < s->num_cs; ++i) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
+    }
+
+    /* Setup CONFIGOPTS Multi-register */
+    s->config_opts =3D malloc(sizeof(uint32_t) * s->num_cs);
+
+    /* Setup FIFO Interrupt Timer */
+    s->fifo_trigger_handle =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                          fifo_trigger_update, s);
+
+    /* FIFO sizes as per OT Spec */
+    fifo8_create(&s->tx_fifo, IBEX_SPI_HOST_TXFIFO_LEN);
+    fifo8_create(&s->rx_fifo, IBEX_SPI_HOST_RXFIFO_LEN);
+}
+
+static void ibex_spi_host_init(Object *obj)
+{
+    IbexSPIHostState *s =3D IBEX_SPI_HOST(obj);
+
+    s->init_status =3D true;
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->host_err);
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->event);
+
+    memory_region_init_io(&s->mmio, obj, &ibex_spi_ops, s,
+                          TYPE_IBEX_SPI_HOST, 0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static void ibex_spi_host_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->realize =3D ibex_spi_host_realize;
+    dc->reset =3D ibex_spi_host_reset;
+    dc->vmsd =3D &vmstate_ibex;
+    device_class_set_props(dc, ibex_spi_properties);
+}
+
+static const TypeInfo ibex_spi_host_info =3D {
+    .name          =3D TYPE_IBEX_SPI_HOST,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(IbexSPIHostState),
+    .instance_init =3D ibex_spi_host_init,
+    .class_init    =3D ibex_spi_host_class_init,
+};
+
+static void ibex_spi_host_register_types(void)
+{
+    type_register_static(&ibex_spi_host_info);
+}
+
+type_init(ibex_spi_host_register_types)
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index 0ded9cd092..702aa5e4df 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -10,3 +10,4 @@ softmmu_ss.add(when: 'CONFIG_XILINX_SPIPS', if_true: fi=
les('xilinx_spips.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-o=
spi.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_spi.c'))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_spi.c'))
+softmmu_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_spi_host.c'))
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
index 612d3d6087..c707d4aaba 100644
--- a/hw/ssi/trace-events
+++ b/hw/ssi/trace-events
@@ -20,3 +20,10 @@ npcm7xx_fiu_ctrl_read(const char *id, uint64_t addr, u=
int32_t data) "%s offset:
 npcm7xx_fiu_ctrl_write(const char *id, uint64_t addr, uint32_t data) "%s=
 offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 npcm7xx_fiu_flash_read(const char *id, int cs, uint64_t addr, unsigned i=
nt size, uint64_t value) "%s[%d] offset: 0x%08" PRIx64 " size: %u value: =
0x%" PRIx64
 npcm7xx_fiu_flash_write(const char *id, unsigned cs, uint64_t addr, unsi=
gned int size, uint64_t value) "%s[%d] offset: 0x%08" PRIx64 " size: %u v=
alue: 0x%" PRIx64
+
+# ibex_spi_host.c
+
+ibex_spi_host_reset(const char *msg) "%s"
+ibex_spi_host_transfer(uint32_t tx_data, uint32_t rx_data) "tx_data: 0x%=
" PRIx32 " rx_data: @0x%" PRIx32
+ibex_spi_host_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" =
PRIx64 " size %u: 0x%" PRIx64
+ibex_spi_host_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size %u=
:"
diff --git a/include/hw/ssi/ibex_spi_host.h b/include/hw/ssi/ibex_spi_hos=
t.h
new file mode 100644
index 0000000000..3fedcb6805
--- /dev/null
+++ b/include/hw/ssi/ibex_spi_host.h
@@ -0,0 +1,94 @@
+
+/*
+ * QEMU model of the Ibex SPI Controller
+ * SPEC Reference: https://docs.opentitan.org/hw/ip/spi_host/doc/
+ *
+ * Copyright (C) 2022 Western Digital
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#ifndef IBEX_SPI_HOST_H
+#define IBEX_SPI_HOST_H
+
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+#include "hw/ssi/ssi.h"
+#include "qemu/fifo8.h"
+#include "qom/object.h"
+#include "hw/registerfields.h"
+#include "qemu/timer.h"
+
+#define TYPE_IBEX_SPI_HOST "ibex-spi"
+#define IBEX_SPI_HOST(obj) \
+    OBJECT_CHECK(IbexSPIHostState, (obj), TYPE_IBEX_SPI_HOST)
+
+/* SPI Registers */
+#define IBEX_SPI_HOST_INTR_STATE         (0x00 / 4)  /* rw */
+#define IBEX_SPI_HOST_INTR_ENABLE        (0x04 / 4)  /* rw */
+#define IBEX_SPI_HOST_INTR_TEST          (0x08 / 4)  /* wo */
+#define IBEX_SPI_HOST_ALERT_TEST         (0x0c / 4)  /* wo */
+#define IBEX_SPI_HOST_CONTROL            (0x10 / 4)  /* rw */
+#define IBEX_SPI_HOST_STATUS             (0x14 / 4)  /* ro */
+#define IBEX_SPI_HOST_CONFIGOPTS         (0x18 / 4)  /* rw */
+#define IBEX_SPI_HOST_CSID               (0x1c / 4)  /* rw */
+#define IBEX_SPI_HOST_COMMAND            (0x20 / 4)  /* wo */
+/* RX/TX Modelled by FIFO */
+#define IBEX_SPI_HOST_RXDATA             (0x24 / 4)
+#define IBEX_SPI_HOST_TXDATA             (0x28 / 4)
+
+#define IBEX_SPI_HOST_ERROR_ENABLE       (0x2c / 4)  /* rw */
+#define IBEX_SPI_HOST_ERROR_STATUS       (0x30 / 4)  /* rw */
+#define IBEX_SPI_HOST_EVENT_ENABLE       (0x34 / 4)  /* rw */
+
+/* FIFO Len in Bytes */
+#define IBEX_SPI_HOST_TXFIFO_LEN         288
+#define IBEX_SPI_HOST_RXFIFO_LEN         256
+
+/*  Max Register (Based on addr) */
+#define IBEX_SPI_HOST_MAX_REGS           (IBEX_SPI_HOST_EVENT_ENABLE + 1=
)
+
+/* MISC */
+#define TX_INTERRUPT_TRIGGER_DELAY_NS    100
+#define BIDIRECTIONAL_TRANSFER           3
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+    uint32_t regs[IBEX_SPI_HOST_MAX_REGS];
+    /* Multi-reg that sets config opts per CS */
+    uint32_t *config_opts;
+    Fifo8 rx_fifo;
+    Fifo8 tx_fifo;
+    QEMUTimer *fifo_trigger_handle;
+
+    qemu_irq event;
+    qemu_irq host_err;
+    uint32_t num_cs;
+    qemu_irq *cs_lines;
+    SSIBus *ssi;
+
+    /* Used to track the init status, for replicating TXDATA ghost write=
s */
+    bool init_status;
+} IbexSPIHostState;
+
+#endif
--=20
2.35.1


