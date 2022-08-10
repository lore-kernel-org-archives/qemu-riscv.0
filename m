Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLwX7-0001cX-NB
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 20:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2146f6254=wilfred.mallawa@opensource.wdc.com>)
 id 1oLuiZ-0000Yi-E4
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 19:02:27 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2146f6254=wilfred.mallawa@opensource.wdc.com>)
 id 1oLuiV-0004Qd-Mn
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 19:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660172543; x=1691708543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0vdSw+Rdt9Z/Qr6KlA7e9PvKVitzNyAkTLtTd92Pti8=;
 b=QI+vJvwuj4/C7cHdoXLKCYt0Ehtt5IscvBm3/oucc+alcUcj5w4VXb7P
 LwyUB/dKvA5iSSfUTRrczqNUdIWwxryn/vXeBDjQ/p9tsWLa61TJ2Hh/l
 6kDW6PxQPut4os5lUahDdsPNWQBvUrmHyWKAsLCz69OxXEqrhH+fe2FSy
 JMv0plHd5U+f8ovjVd0yJQASD7QPhYGARW2aq4PMRg8zI1Ofzt4vqfqK4
 KQ3WvJJ89+DKaXZHBuRncTxEEg2NXJE1FEYcoxEvruaDeXO8bm3pKkuEz
 lazGeDAKKcH8v32qsgi8fW7vbQ303pUcOvryCXAaEmYznnd8iJrNIhmRX A==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654531200"; d="scan'208";a="320480950"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2022 07:02:09 +0800
IronPort-SDR: Ic5WvXQcy3ClIcJSLbzosEE0DnpSMo7uV/XDKNIVSQqlONsXT+gp7QSpYn1Dz2a/fcBepwPBmm
 iPaKYzfh1k0JMM3sARn6ollc2LgsIeW85rV0bPdwjEcF89AY7piMAILbVC5MMERrk003JYD397
 +PTmepupcJTY5QMLdaKFRln2ZWl2oaAYrPtP8TL7886r2k0MxHaI+KIxpomFBNgcv0lMiyeRUK
 lNS3CuwSBACzyr/W+f4VfcCz0a4JAPaRN8oae3zOWZjOuDHvsPoPQPIhHZMNuFiMYgkY+n805F
 YD1ykwZ37N2ZfYKLzjJLGlJ4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 15:17:44 -0700
IronPort-SDR: 8Q1JPowqIZyjNw3sZw/J69WkTxXrrUYBQ5194+TaLOPvT/mypYSZ0AhdvlAzmMzvzEr67CRm++
 LlL1XVAq3vIB46d8lP41pIxa/aMUtZmDPqWZ2O4vke9zBPZ02L5IIoY0PuHctGHLD0TC26t3Qu
 O56xShVHTXeVd0XBNFUHG94pCjqNJR+Tw4dVJNONc3h93RkVnH+e5/xFKEOP8S9106z9MF2Rtw
 a0CqpKKABY94tP/8wvGcnKcGPKgh8Hpk0rKF+2y2ic633oGU+F67EU8YhUR6VA0cP6+h+s8Xpc
 tcU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 16:02:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M356n0Hscz1Rwnx
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 16:02:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1660172528;
 x=1662764529; bh=0vdSw+Rdt9Z/Qr6KlA7e9PvKVitzNyAkTLtTd92Pti8=; b=
 i/8xA+upysNEOc5sQQUo85qlcTP0xNipSOlaHJox1z2/N+8HSVy6NAknI1x2wKw3
 Od/4EDFACkzTM0mB4gEkXO6pko3pl0vrAgDQUTOFKt0gi+CoURih51LZojBBhnfi
 7RnVBzX8ktf6HHnXWgm5ZMTEN0zTkjQ/CzZPSMN60w6MhCMcP+1XaqcaJH2wJX3A
 0tzjzwtsjIq7pFvm5NQoc5kodG37/whT9kYPxNlqyRnAfPI5JxVv+BaIfDYQEgP7
 MZruFIDsrutVHEkflfENn2BhaiZUXP1RkFR387HsY2vqiDO5/kGc15OxAmnNeXSM
 KuH5Iq/IrvI008mAn+9vBw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XeDBdAtqqiDU for <qemu-riscv@nongnu.org>;
 Wed, 10 Aug 2022 16:02:08 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.24])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M356k32lYz1RtVk;
 Wed, 10 Aug 2022 16:02:05 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH 1/3] hw/ssi: fixup typos in ibex_spi_host
Date: Thu, 11 Aug 2022 09:01:58 +1000
Message-Id: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=2146f6254=wilfred.mallawa@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Aug 2022 20:58:34 -0400
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
X-List-Received-Date: Wed, 10 Aug 2022 23:02:27 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch fixes up minor typos in ibex_spi_host

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index d14580b409..601041d719 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -172,7 +172,7 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
                         & R_INTR_STATE_SPI_EVENT_MASK;
     int err_irq =3D 0, event_irq =3D 0;
=20
-    /* Error IRQ enabled and Error IRQ Cleared*/
+    /* Error IRQ enabled and Error IRQ Cleared */
     if (error_en && !err_pending) {
         /* Event enabled, Interrupt Test Error */
         if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
@@ -434,7 +434,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
     case IBEX_SPI_HOST_TXDATA:
         /*
          * This is a hardware `feature` where
-         * the first word written TXDATA after init is omitted entirely
+         * the first word written to TXDATA after init is omitted entire=
ly
          */
         if (s->init_status) {
             s->init_status =3D false;
@@ -487,7 +487,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
         break;
     case IBEX_SPI_HOST_ERROR_STATUS:
     /*
-     *  Indicates that any errors that have occurred.
+     *  Indicates any errors that have occurred.
      *  When an error occurs, the corresponding bit must be cleared
      *  here before issuing any further commands
      */
--=20
2.37.1


