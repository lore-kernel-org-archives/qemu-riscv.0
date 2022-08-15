Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNQcC-0004Z6-Ox
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 23:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQbx-0004XG-Ka
 for qemu-riscv@nongnu.org; Sun, 14 Aug 2022 23:17:53 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:37639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQbg-0007Mx-T7
 for qemu-riscv@nongnu.org; Sun, 14 Aug 2022 23:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660533456; x=1692069456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GJ0aIZiS4P7ZTH1lRU7m7x3esfoqpYMCfPGwn6D8CEk=;
 b=IyEmQ2jrBXw41yWmATi37yWu4vUMVESDcLplh+saC0JVdNOHcH0SLLI3
 UKN0moZobFG4Gd7lpEpwx/e2In8tBRLAIvV/OUReCWipZGX3SBvCSmOhI
 /SC4JR9dfmyCTGX5hjEes6N85CmdvUxdNbH0kJ3JUEhuC8ZyzKwxcNBM/
 dgK3JTemAg9H7kKansv0hguHTSU9fOtXMaybmsFcaT2ryQPTFpjCF53ly
 w8ng5BGvJr5Ik8NTARLErKVNOeizsZeIbg5m0/42+VF+SVAjFs2JmiFu7
 kn8eSSCVwWthTF6z0ZCX6MMtnAZPmw897/OQ32GsHmmOz82+legrD+SMt Q==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654531200"; d="scan'208";a="207178559"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2022 11:17:34 +0800
IronPort-SDR: RRYPM9ve+jHN5sx8EWKXEmIZy+t80U8Z4o886UKJxR7T+04Mt/x1hUEqkgmSjLTUFQWE6vEJcj
 NQX1LTDb8XPIRcx7qJqDw0C5oB9BV9V3sTXpcGIo03j8vB1+36urwU1SIONKK5qL7o5LQRSOyA
 kilyOr0Hm01bJomN2/k/pOVAl6afxfzNF2u7fTOfzcrLz+ppkQGPVEmxHpUXW92zhnOMnKKG8D
 aRj9D2UQ2f+vRFQ1kuaTz+rbOk8ZZy9mxtzMt8jUMoh/pHgOAILi2CJtj8FBlwn1j3BBenDFeg
 sKq0HnuYahlBWJARkale+frf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 19:33:05 -0700
IronPort-SDR: YS/2hUuOhHqRh4FFcWh/7VFC91y6OB7Hdavorgpj+OEVkljNa9lcxqFXymkQsZJEESprZEjUDP
 bKOYYzExS/5szej/X20yJk+SBggj+N2v62x2z3xGvWDqEMqbg7oKDDaLyOvdWsgoG9uf2qNA+2
 yWd67v0eYX9VL5j6crt6cF4U2MH8Ydk7EAwNE7I8xyAiKdq18L8STEDPUonQjGREUY08Edq97T
 WlsgPrVjNnux/HVB7nJKAs/2vTlhu+6PwBVWW1vPzNMRMuqghrWhVggO4BARS1nMEp4c3PEAhC
 598=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 20:17:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M5fbf2Zlsz1Rw4L
 for <qemu-riscv@nongnu.org>; Sun, 14 Aug 2022 20:17:34 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1660533453; x=1663125454; bh=GJ0aIZiS4P7ZTH1lRU
 7m7x3esfoqpYMCfPGwn6D8CEk=; b=syFNrY3Wb9y3lOG86zbBCwuWnT8pnNpo1n
 Lz+ZkrSA95HikVIB4lnPhSW0jIETpYkTE6awmiIEVIYUe4eFc53QVd6cekdzVrw8
 RA/iYvf2pb14oxCEyRUDDU9P14QauQ8uKNbdaS6Mkx55G5Z1tNLpDIVl4Xn7n/cB
 4HitSqP6qMAdy7ZRvNuHRyY5v45H9THNrA/MTV/Dqelx5SNHHAG7QxBrBevXrSQb
 bTDciTv/FUYAVKnxro27FVGnmH4tQVbbsnIadBron+U0RKZm8dezi2n6x9GgyenS
 T0SesXhawJ4TWdEG17a5v+VuD3GBH0/s0IWUuPhH+YO9eSqmI8ew==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id sqlC3LnE2sxq for <qemu-riscv@nongnu.org>;
 Sun, 14 Aug 2022 20:17:33 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M5fbb1dZVz1RtVk;
 Sun, 14 Aug 2022 20:17:30 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v2 2/4] hw/ssi: ibex_spi: fixup coverity issue
Date: Mon, 15 Aug 2022 13:16:23 +1000
Message-Id: <20220815031624.170857-3-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
References: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=219596703=wilfred.mallawa@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Mon, 15 Aug 2022 03:17:54 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch addresses the coverity issues specified in [1],
as suggested, `FIELD_DP32()`/`FIELD_EX32()` macros have been
implemented to clean up the code.

Patch V2: Style changes have been made as suggested by
Andrew Jones, to promote code readability.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg887713.html

Fixes: Coverity CID 1488107

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 128 +++++++++++++++++++++--------------------
 1 file changed, 65 insertions(+), 63 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 601041d719..d377f1100c 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -108,18 +108,20 @@ static inline uint8_t div4_round_up(uint8_t dividen=
d)
=20
 static void ibex_spi_rxfifo_reset(IbexSPIHostState *s)
 {
+    uint32_t data =3D s->regs[IBEX_SPI_HOST_STATUS];
     /* Empty the RX FIFO and assert RXEMPTY */
     fifo8_reset(&s->rx_fifo);
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXFULL_MASK;
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_RXEMPTY_MASK;
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
+    data =3D FIELD_DP32(data, STATUS, TXEMPTY, 1);
+    s->regs[IBEX_SPI_HOST_STATUS] =3D data;
 }
=20
 static void ibex_spi_host_reset(DeviceState *dev)
@@ -162,37 +164,38 @@ static void ibex_spi_host_reset(DeviceState *dev)
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
+                    FIELD_EX32(err_status_reg, ERROR_STATUS,  CMDBUSY)) =
{
             /* Wrote to COMMAND when not READY */
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    &  R_ERROR_ENABLE_CMDINVAL_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CMDINVAL_MASK) {
+        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CMDINVAL)  &&
+                    FIELD_EX32(err_status_reg, ERROR_STATUS,  CMDINVAL))=
 {
             /* Invalid command segment */
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    & R_ERROR_ENABLE_CSIDINVAL_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CSIDINVAL_MASK) {
+        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CSIDINVAL) &&
+                    FIELD_EX32(err_status_reg, ERROR_STATUS,  CSIDINVAL)=
) {
             /* Invalid value for CSID */
             err_irq =3D 1;
         }
@@ -204,22 +207,19 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
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
+                    FIELD_EX32(status_reg, STATUS, READY)) {
             /* SPI Host ready for next command */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_TXEMPTY_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_TXEMPTY_MA=
SK)) {
+        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  TXEMPTY) &&
+                    FIELD_EX32(status_reg, STATUS,  TXEMPTY)) {
             /* SPI TXEMPTY, TXFIFO drained */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_RXFULL_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_RXFULL_MAS=
K)) {
+        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  RXFULL) &&
+                    FIELD_EX32(status_reg, STATUS,  RXFULL)) {
             /* SPI RXFULL, RXFIFO  full */
             event_irq =3D 1;
         }
@@ -232,10 +232,11 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
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
@@ -262,22 +263,21 @@ static void ibex_spi_host_transfer(IbexSPIHostState=
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
@@ -340,7 +340,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
 {
     IbexSPIHostState *s =3D opaque;
     uint32_t val32 =3D val64;
-    uint32_t shift_mask =3D 0xff;
+    uint32_t shift_mask =3D 0xff, data =3D 0, status =3D 0;
     uint8_t txqd_len;
=20
     trace_ibex_spi_host_write(addr, size, val64);
@@ -397,21 +397,23 @@ static void ibex_spi_host_write(void *opaque, hwadd=
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
+        if (FIELD_EX32(val32, COMMAND, DIRECTION) !=3D BIDIRECTIONAL_TRA=
NSFER) {
                 qemu_log_mask(LOG_UNIMP,
                           "%s: Rx Only/Tx Only are not supported\n", __f=
unc__);
         }
@@ -452,8 +454,8 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
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
@@ -464,18 +466,18 @@ static void ibex_spi_host_write(void *opaque, hwadd=
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
2.37.1


