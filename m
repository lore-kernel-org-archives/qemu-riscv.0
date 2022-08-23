Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQN9t-0008JX-8Z
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 02:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9l-0008Fr-Tx
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 02:12:59 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:25193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9j-0000l6-1x
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 02:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661235173; x=1692771173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tHrgF3pDx8EP5IPUOiRUdhbfaoy370OSxSTzeg5kSWA=;
 b=hJSrht7JoKflm3HLvmSZ7dEPSZ3ULMBA9xBKJeOTlbigZVdGURKjirIA
 xkRnXwMnjLNpC2G0W6OFc4s0/ApTfAEeq95FKRcRnCQTGp+Opt0QUzn0/
 hdz863TmJSJChs4Bfg7dNqFqunQJuPwdqAJ0P4GqepW2RD/Ox9YEvrEu2
 ZtvEka7nT7HVZ9b5PXuw5PdUc2NPGfqnaZS90IMDRxFDAEV0e1BqXJ+x2
 he1vcfgRjJJeB4xzp/jSQ8zyznPmpc28t4/hj5tsqep6BpSGLjXH2uiXz
 QxZpwVMT2R94uxGC5N4/Wp8OKJmMslVj6CE4yTQCNE2mqPBZrSIsKCJM2 g==;
X-IronPort-AV: E=Sophos;i="5.93,256,1654531200"; d="scan'208";a="209392993"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Aug 2022 14:12:47 +0800
IronPort-SDR: zDKbNuyglIPrP0kpsFI/bQ2VM51H4Ork5XNBYViFBLOM1IpKd7mgKMi0oYWELsKSrJ4NbA5XVV
 TkSRZvz0PVv71R87VJquLCYZEakLoEoQpu0hohA/Ps7LwyKwsxdvm1O1Olktb0ytYpR6S3GabR
 2FyLpQIhl4YKeD9UoiGDR0SHaPOvAwueu0I8ibSWFc9HCz1FzaQjm7vdjcR9xnZogIHDLqmxOY
 j1/tZ3F9PEGsuxhNmBMwsj+Pf56fp1MZxReXFfGfZsc+aL4tfOVERDVDW3yPQeX/6suOhZM+eS
 TmVfEOwJ6XhKnmRa0/U5AbOl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 22:33:28 -0700
IronPort-SDR: 0dBMUOlgwc9UD8bSKXSDiwL7nR/pBKHTo+oXF0R2CqiNlcI7oEI0AbkotrhmDMXawWi7uDQVDp
 RTjCseXnBTbOCAAhMRcq8S5mOYPmsGRW/ZagvOEZGizQK68Gq8PfJqFpl3Vc/U4vvLE2GyeJo4
 omY+VvIRKk9C7MfGfhlJaT9/9uBANNmBXsw4mYxwb4wqRLwnlrKDopINlsv/p2EiQ6hunv6ckL
 TBsBKYy1lvNGMZIW5XH5WjeN3ou3Obv8uFOX3w5jP41fbitGRu1zIdn3h03ycqRJ76wCcMbRhk
 4P8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 23:12:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MBf681T0Jz1RwqM
 for <qemu-riscv@nongnu.org>; Mon, 22 Aug 2022 23:12:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1661235167; x=1663827168; bh=tHrgF3pDx8EP5IPUOi
 RUdhbfaoy370OSxSTzeg5kSWA=; b=bly3Dx4iTDWunLHW3sLHtLi1V7PY/bOz2N
 1bXV+HOurdS6cf5ssSfxZ8MOFSODBC6MSdYGutiVDwJq/4/uWHcEHCTJBBk8cDmg
 yuU+blc0idEIPyFaJJ+7oasstmQpR5O2j0wuYr9iWW4DpvAfpIpFoOuEckPVfkYi
 MidhoQfGPk1g5jE1J9InwzOKrx1DNXTFDmgZskhE3FZAE47y/YJrwuw8CNdfJTiD
 utwBnn5cuFyPX+Wd9yitWOumDbW09/vz3MtrGZNCldlqSDY199U7AG2LThT8WSGf
 R4+gJyx+hrM3rNeNmsVxjiHWYFsnG5A7HE4BYY2+mOQ0bdXFfqAA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vQxEV1RDwsdw for <qemu-riscv@nongnu.org>;
 Mon, 22 Aug 2022 23:12:47 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MBf634bglz1RtVk;
 Mon, 22 Aug 2022 23:12:43 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 2/4] hw/ssi: ibex_spi: fixup coverity issue
Date: Tue, 23 Aug 2022 16:12:02 +1000
Message-Id: <20220823061201.132342-3-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
References: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2270691b0=wilfred.mallawa@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 23 Aug 2022 06:12:59 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch addresses the coverity issues specified in [1],
as suggested, `FIELD_DP32()`/`FIELD_EX32()` macros have been
implemented to clean up the code.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg887713.html

Fixes: Coverity CID 1488107

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/ssi/ibex_spi_host.c | 132 +++++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 64 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 601041d719..d52b193a1a 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -108,18 +108,22 @@ static inline uint8_t div4_round_up(uint8_t dividen=
d)
=20
 static void ibex_spi_rxfifo_reset(IbexSPIHostState *s)
 {
+    uint32_t data =3D s->regs[IBEX_SPI_HOST_STATUS];
     /* Empty the RX FIFO and assert RXEMPTY */
     fifo8_reset(&s->rx_fifo);
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXFULL_MASK;
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_RXEMPTY_MASK;
+    data =3D FIELD_DP32(data, STATUS, RXFULL, 0);
+    data =3D FIELD_DP32(data, STATUS, RXEMPTY, 1);
+    s->regs[IBEX_SPI_HOST_STATUS] =3D data;
 }
=20
 static void ibex_spi_txfifo_reset(IbexSPIHostState *s)
 {
+    uint32_t data =3D s->regs[IBEX_SPI_HOST_STATUS];
     /* Empty the TX FIFO and assert TXEMPTY */
     fifo8_reset(&s->tx_fifo);
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXFULL_MASK;
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_TXEMPTY_MASK;
+    data =3D FIELD_DP32(data, STATUS, TXFULL, 0);
+    data =3D FIELD_DP32(data, STATUS, TXEMPTY, 1);
+    s->regs[IBEX_SPI_HOST_STATUS] =3D data;
 }
=20
 static void ibex_spi_host_reset(DeviceState *dev)
@@ -162,37 +166,38 @@ static void ibex_spi_host_reset(DeviceState *dev)
  */
 static void ibex_spi_host_irq(IbexSPIHostState *s)
 {
-    bool error_en =3D s->regs[IBEX_SPI_HOST_INTR_ENABLE]
-                    & R_INTR_ENABLE_ERROR_MASK;
-    bool event_en =3D s->regs[IBEX_SPI_HOST_INTR_ENABLE]
-                    & R_INTR_ENABLE_SPI_EVENT_MASK;
-    bool err_pending =3D s->regs[IBEX_SPI_HOST_INTR_STATE]
-                        & R_INTR_STATE_ERROR_MASK;
-    bool status_pending =3D s->regs[IBEX_SPI_HOST_INTR_STATE]
-                        & R_INTR_STATE_SPI_EVENT_MASK;
+    uint32_t intr_test_reg =3D s->regs[IBEX_SPI_HOST_INTR_TEST];
+    uint32_t intr_en_reg =3D s->regs[IBEX_SPI_HOST_INTR_ENABLE];
+    uint32_t intr_state_reg =3D s->regs[IBEX_SPI_HOST_INTR_STATE];
+
+    uint32_t err_en_reg =3D s->regs[IBEX_SPI_HOST_ERROR_ENABLE];
+    uint32_t event_en_reg =3D s->regs[IBEX_SPI_HOST_EVENT_ENABLE];
+    uint32_t err_status_reg =3D s->regs[IBEX_SPI_HOST_ERROR_STATUS];
+    uint32_t status_reg =3D s->regs[IBEX_SPI_HOST_STATUS];
+
+
+    bool error_en =3D FIELD_EX32(intr_en_reg, INTR_ENABLE, ERROR);
+    bool event_en =3D FIELD_EX32(intr_en_reg, INTR_ENABLE, SPI_EVENT);
+    bool err_pending =3D FIELD_EX32(intr_state_reg, INTR_STATE, ERROR);
+    bool status_pending =3D FIELD_EX32(intr_state_reg, INTR_STATE, SPI_E=
VENT);
+
     int err_irq =3D 0, event_irq =3D 0;
=20
     /* Error IRQ enabled and Error IRQ Cleared */
     if (error_en && !err_pending) {
         /* Event enabled, Interrupt Test Error */
-        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
+        if (FIELD_EX32(intr_test_reg, INTR_TEST,  ERROR)) {
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    &  R_ERROR_ENABLE_CMDBUSY_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CMDBUSY_MASK) {
+        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CMDBUSY) &&
+                   FIELD_EX32(err_status_reg, ERROR_STATUS,  CMDBUSY)) {
             /* Wrote to COMMAND when not READY */
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    &  R_ERROR_ENABLE_CMDINVAL_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CMDINVAL_MASK) {
+        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CMDINVAL)  &&
+                   FIELD_EX32(err_status_reg, ERROR_STATUS,  CMDINVAL)) =
{
             /* Invalid command segment */
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    & R_ERROR_ENABLE_CSIDINVAL_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CSIDINVAL_MASK) {
+        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CSIDINVAL) &&
+                   FIELD_EX32(err_status_reg, ERROR_STATUS,  CSIDINVAL))=
 {
             /* Invalid value for CSID */
             err_irq =3D 1;
         }
@@ -204,22 +209,19 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
=20
     /* Event IRQ Enabled and Event IRQ Cleared */
     if (event_en && !status_pending) {
-        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_SPI_EVENT_MAS=
K) {
+        if (FIELD_EX32(intr_test_reg, INTR_STATE,  SPI_EVENT)) {
             /* Event enabled, Interrupt Test Event */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_READY_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK=
)) {
+        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  READY) &&
+                   FIELD_EX32(status_reg, STATUS, READY)) {
             /* SPI Host ready for next command */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_TXEMPTY_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_TXEMPTY_MA=
SK)) {
+        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  TXEMPTY) &&
+                   FIELD_EX32(status_reg, STATUS,  TXEMPTY)) {
             /* SPI TXEMPTY, TXFIFO drained */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_RXFULL_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_RXFULL_MAS=
K)) {
+        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  RXFULL) &&
+                   FIELD_EX32(status_reg, STATUS,  RXFULL)) {
             /* SPI RXFULL, RXFIFO  full */
             event_irq =3D 1;
         }
@@ -232,10 +234,11 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
=20
 static void ibex_spi_host_transfer(IbexSPIHostState *s)
 {
-    uint32_t rx, tx;
+    uint32_t rx, tx, data;
     /* Get num of one byte transfers */
-    uint8_t segment_len =3D ((s->regs[IBEX_SPI_HOST_COMMAND] & R_COMMAND=
_LEN_MASK)
-                          >> R_COMMAND_LEN_SHIFT);
+    uint8_t segment_len =3D FIELD_EX32(s->regs[IBEX_SPI_HOST_COMMAND],
+                                     COMMAND,  LEN);
+
     while (segment_len > 0) {
         if (fifo8_is_empty(&s->tx_fifo)) {
             /* Assert Stall */
@@ -262,22 +265,21 @@ static void ibex_spi_host_transfer(IbexSPIHostState=
 *s)
         --segment_len;
     }
=20
+    data =3D s->regs[IBEX_SPI_HOST_STATUS];
     /* Assert Ready */
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_READY_MASK;
+    data =3D FIELD_DP32(data, STATUS, READY, 1);
     /* Set RXQD */
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXQD_MASK;
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D (R_STATUS_RXQD_MASK
-                                    & div4_round_up(segment_len));
+    data =3D FIELD_DP32(data, STATUS, RXQD, div4_round_up(segment_len));
     /* Set TXQD */
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXQD_MASK;
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D (fifo8_num_used(&s->tx_fifo) / 4)
-                                    & R_STATUS_TXQD_MASK;
+    data =3D FIELD_DP32(data, STATUS, TXQD, fifo8_num_used(&s->tx_fifo) =
/ 4);
     /* Clear TXFULL */
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXFULL_MASK;
-    /* Assert TXEMPTY and drop remaining bytes that exceed segment_len *=
/
-    ibex_spi_txfifo_reset(s);
+    data =3D FIELD_DP32(data, STATUS, TXFULL, 0);
     /* Reset RXEMPTY */
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXEMPTY_MASK;
+    data =3D FIELD_DP32(data, STATUS, RXEMPTY, 0);
+    /* Update register status */
+    s->regs[IBEX_SPI_HOST_STATUS] =3D data;
+    /* Drop remaining bytes that exceed segment_len */
+    ibex_spi_txfifo_reset(s);
=20
     ibex_spi_host_irq(s);
 }
@@ -340,7 +342,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
 {
     IbexSPIHostState *s =3D opaque;
     uint32_t val32 =3D val64;
-    uint32_t shift_mask =3D 0xff;
+    uint32_t shift_mask =3D 0xff, data =3D 0, status =3D 0;
     uint8_t txqd_len;
=20
     trace_ibex_spi_host_write(addr, size, val64);
@@ -397,22 +399,24 @@ static void ibex_spi_host_write(void *opaque, hwadd=
r addr,
         s->regs[addr] =3D val32;
=20
         /* STALL, IP not enabled */
-        if (!(s->regs[IBEX_SPI_HOST_CONTROL] & R_CONTROL_SPIEN_MASK)) {
+        if (!(FIELD_EX32(s->regs[IBEX_SPI_HOST_CONTROL],
+                         CONTROL, SPIEN))) {
             return;
         }
=20
         /* SPI not ready, IRQ Error */
-        if (!(s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK)) {
+        if (!(FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
+                         STATUS, READY))) {
             s->regs[IBEX_SPI_HOST_ERROR_STATUS] |=3D R_ERROR_STATUS_CMDB=
USY_MASK;
             ibex_spi_host_irq(s);
             return;
         }
+
         /* Assert Not Ready */
         s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_READY_MASK;
=20
-        if (((val32 & R_COMMAND_DIRECTION_MASK) >> R_COMMAND_DIRECTION_S=
HIFT)
-            !=3D BIDIRECTIONAL_TRANSFER) {
-                qemu_log_mask(LOG_UNIMP,
+        if (FIELD_EX32(val32, COMMAND, DIRECTION) !=3D BIDIRECTIONAL_TRA=
NSFER) {
+            qemu_log_mask(LOG_UNIMP,
                           "%s: Rx Only/Tx Only are not supported\n", __f=
unc__);
         }
=20
@@ -452,8 +456,8 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
                 return;
             }
             /* Byte ordering is set by the IP */
-            if ((s->regs[IBEX_SPI_HOST_STATUS] &
-                R_STATUS_BYTEORDER_MASK) =3D=3D 0) {
+            status =3D s->regs[IBEX_SPI_HOST_STATUS];
+            if (FIELD_EX32(status, STATUS, BYTEORDER) =3D=3D 0) {
                 /* LE: LSB transmitted first (default for ibex processor=
) */
                 shift_mask =3D 0xff << (i * 8);
             } else {
@@ -464,18 +468,18 @@ static void ibex_spi_host_write(void *opaque, hwadd=
r addr,
=20
             fifo8_push(&s->tx_fifo, (val32 & shift_mask) >> (i * 8));
         }
-
+        status =3D s->regs[IBEX_SPI_HOST_STATUS];
         /* Reset TXEMPTY */
-        s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXEMPTY_MASK;
+        status =3D FIELD_DP32(status, STATUS, TXEMPTY, 0);
         /* Update TXQD */
-        txqd_len =3D (s->regs[IBEX_SPI_HOST_STATUS] &
-                    R_STATUS_TXQD_MASK) >> R_STATUS_TXQD_SHIFT;
+        txqd_len =3D FIELD_EX32(status, STATUS, TXQD);
         /* Partial bytes (size < 4) are padded, in words. */
         txqd_len +=3D 1;
-        s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXQD_MASK;
-        s->regs[IBEX_SPI_HOST_STATUS] |=3D txqd_len;
+        status =3D FIELD_DP32(status, STATUS, TXQD, txqd_len);
         /* Assert Ready */
-        s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_READY_MASK;
+        status =3D FIELD_DP32(status, STATUS, READY, 1);
+        /* Update register status */
+        s->regs[IBEX_SPI_HOST_STATUS] =3D status;
         break;
     case IBEX_SPI_HOST_ERROR_ENABLE:
         s->regs[addr] =3D val32;
--=20
2.37.2


