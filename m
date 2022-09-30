Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oe6md-00043y-H5
	for mharc-qemu-riscv@gnu.org; Thu, 29 Sep 2022 23:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=265e2c498=wilfred.mallawa@opensource.wdc.com>)
 id 1oe6mZ-00042P-7W
 for qemu-riscv@nongnu.org; Thu, 29 Sep 2022 23:33:47 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:43257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=265e2c498=wilfred.mallawa@opensource.wdc.com>)
 id 1oe6mW-0001cH-3O
 for qemu-riscv@nongnu.org; Thu, 29 Sep 2022 23:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664508824; x=1696044824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E8bRBXJM2CYdcA4IjvhSjuvCa2JM//rykvWTyVLaQe4=;
 b=PuOC7I9Xrovijzqpp2RcMl9O0ncGgSQ98obfbVXqQN3z8tDZD6myorUE
 o2Xn2KwPYvWaqrI/GModEWJW9IjSi84cjQTxTs18LWuymE+SduejzLx4U
 XjM3WWzOBTb88jM+PYy2j+tUcJ+/4GLCCDTwCGaUQZdtkp5VR1osr9piT
 22gSydh13+D4adUUPxEAmTEmNJnelNEKKBIN5EtP7RJ6+dSscYHboQUfI
 5KOOJeYgouEehtoFIOgSjWhXi75MysHDkJYpoUOrWqHjquP2lZ1kc8qco
 OLz0SMoyK3j4mwiLafy+96yvxBTQ2z3Y1W6qVt90Dv7c9IXNhAjo28l4V w==;
X-IronPort-AV: E=Sophos;i="5.93,357,1654531200"; d="scan'208";a="212638614"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Sep 2022 11:33:41 +0800
IronPort-SDR: Ow8v/FGOKE+Zhu36Xt7pgI7ACgMyV2V3H4S50METEaDKrBGgPamE4sc1c5bGgKLVVgmF+z1BfJ
 Us7fKNPQ2LZDC+ZLtqB5ubMMnF7rU+B+fVrsmEJ7sXyBFvFLqiO6J7kaWeuMkAqRwmD4PPQRKt
 RhXzNk58YDVUR02c3M/nCY5nALrlJba9Lgol7oqFUN7wgerVoH2MboVYrp0gfYVCmA1OFb5RA8
 /8WBkH4BSLPNGkBBnK2hZn5W5WkydmYue92fvLpoCtdUUdLtcN23CqDctJTMcBr3hsxdG2QtVq
 TVfL8luscjIwbTwaJPKiZqw7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 19:53:34 -0700
IronPort-SDR: Qctk/SmMDRf2Ywtb5nizexgqq1Vospr8DuO+STIo/7XBTRd7tV8P89ox3PM84b+M0580fUkdT0
 F3r2qRLbRh6TVRw1pAJRVs4qvlFNXqUBkaLolwNbMiMR6J1pYk9SdxrxR0VFkvTz8BvWZpQl+a
 yvwDGEysGxxQ2xm5lWwaMv1zyoJm+1eChIoSNGwJrtTyclCT24rS5lo40nmK/3DpzZfxQgDE4h
 S1YOHCKjb+GKIwH0ZjrmqzDNjC0lGGK4gL+yWOZ5DcLDQNC+cMg9O3AY2fVUDqHlqFmJjjeb8Z
 SrU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 20:33:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mdwn060Zyz1RvTr
 for <qemu-riscv@nongnu.org>; Thu, 29 Sep 2022 20:33:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664508819; x=1667100820; bh=E8bRBXJM2CYdcA4Ijv
 hSjuvCa2JM//rykvWTyVLaQe4=; b=PoN+Lk8T3kCiZbZ7Jx2diqhUCnDpd+fc2y
 +kpzzOkzsS+MZHB/XZMO44Jxy2u9seMFSWqr2LfTydOPETKHTtiRQTvxemqrwOal
 Bx0/xJXhE+XoLGTltB+K5BN/Fk76oCDuztkT1XNdY5qHRxsIuVBNwxNcA/a8kpgq
 f0+m3KzuuLmDtgsDUa5sMjmUh5378jx2JSLBp5I5s7Ni93V6EYX39cWvaWI+P4QZ
 hLipSkcpw9d1BMiyqUFrb6cJi809bDuJg0kshCD/SkOtJJmjWmRBvmhX3Rr3h8+e
 44H9esY2K7DNWYhr+KUAWZ1MwoeA0d6jJnSv4AcvJ3vafywSGSOw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id t8RG6HloYydb for <qemu-riscv@nongnu.org>;
 Thu, 29 Sep 2022 20:33:39 -0700 (PDT)
Received: from fedora.wdc.com (unknown [10.225.165.55])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mdwmw58dPz1RvLy;
 Thu, 29 Sep 2022 20:33:36 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 1/2] hw/ssi: ibex_spi: fixup coverity issue
Date: Fri, 30 Sep 2022 13:32:42 +1000
Message-Id: <20220930033241.206581-2-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930033241.206581-1-wilfred.mallawa@opensource.wdc.com>
References: <20220930033241.206581-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=265e2c498=wilfred.mallawa@opensource.wdc.com;
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
X-List-Received-Date: Fri, 30 Sep 2022 03:33:48 -0000

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
index 94d7da9cc2..d145a4cdbd 100644
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
+    uint32_t shift_mask =3D 0xff, status =3D 0;
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
2.37.3


