Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQN9b-00081v-H4
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 02:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9Y-0007xF-UM
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 02:12:44 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:49381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9W-0000k2-0R
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 02:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661235162; x=1692771162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YOQjuP0GwYm+xsEBe9XVUk27tsNs57ziEwBkqS6jfJw=;
 b=eqn7XifGUqaEITmlDJOmuQhXuElmrI/6yuA3v5KbeUszGgBwBi7soyTb
 FUOIGarz+dDhgEUCgTYnlTbuNNoXh/JfApokxj6Ff6peczET4jiJaWn3a
 uDDGJBv4fNtvm2qHkOil0OhEd1GjAiotr35ZVnINH9CamNR6/93aIbVgq
 eC3muyYA6y2UPBDkFcgmOvAyMoBVmBRMj7n1ohhOOYWISP3YLCLlSiFEi
 W08u1CSFYcDgp2YbYedSXwpeP4m/k+OeoxITLz8m80m8U4VWaDNQtK05L
 ta6JxfMK96VFyLzWN6brKVBlT6hRZ9NkaVOhgNLV2EC34cf6zSBbdH+dV A==;
X-IronPort-AV: E=Sophos;i="5.93,256,1654531200"; d="scan'208";a="313671692"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Aug 2022 14:12:36 +0800
IronPort-SDR: A+KQXjhB41wOQyG77IEfcDB5aY5mfOzF5GSckgPt8BFeNeU3Sagf14Rcd11lunJhjJ4atjFf9a
 DkByPMmEOMTleIZxFxO1qRKRibvgPgu2vdpaTtR0enOECfqpM4yiZ2RJeDPjAIY3Mcb4sfJB/b
 QSpVim2OhCIFpErYOn+hmpVfsUCe2zMUgKieb9JBCn68NYGB7BnQE35tXHOPoqvY1eqVJAJUbn
 u9o8NNuqbaCZn4IWwR7SiP7qaocTtEhPIUrtedM7pVqCkCMo/iFBZiSV3SoCBULtoJg9+VGO7X
 nSGf5SDfUSKkuU1BJuLHg3Yy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 22:27:53 -0700
IronPort-SDR: v1SsXBndKZwqaf1/4NU5S1dvRw4U7MC8n1guTSesNbRGTl2SKKjd4zsjQStf0judRtYPWiVN/1
 kPWCztkAq0dz93h+72KABoJIdo/sGEMKWXCqix+p7pcg0PebaM/1Ko4GjvLGDRtMxmD5h4tMZ3
 tcE5v+BjQng7GqlOrQ484smpJQ5rThKwWa7HmoZXYxsgWWcz3b+hjyqVq10bzt+9+qKCjS6g/y
 iCnASD2uoypaqySl5o7611hlJg847IkJF0NgQvAlSlThXhfMKeEG/jKHiIfiq7jusYoKiL6eR+
 By0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 23:12:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MBf5w0s4Jz1RwqM
 for <qemu-riscv@nongnu.org>; Mon, 22 Aug 2022 23:12:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1661235155; x=1663827156; bh=YOQjuP0GwYm+xsEBe9
 XVUk27tsNs57ziEwBkqS6jfJw=; b=WaG6+m9WzzkUdQ+mzsZxecZqk+kldKRSF4
 OXFRgzfmEAqy9TqM1hM+ajRMnhSI5t4HAx37ZByS+OYbe6/h7oPmWO1AJr+UI7Hv
 RHA2g/AegA0VlOLsTpUZcvGAPZeqAOXdkASR5YyecDU/Jj07mX2pxT7CLkZaEtRp
 1ABoHy/JX9OokY1Ayvr1gWuGtMyTqP1p32HnmcJThb9On5eG4JS4wm/KlgTdCc+a
 clSVmD1UhLzUEZZW0PVuJsbsAajzPDf7bwEjkH8Mf1fGxm6ysok1zHDtKAikVgIh
 mEqbvYmRduG7mNE4A9KyWTomXL4aSr6qqlbb7Yan4u5MFqKRTt4w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id o6KoVkAnGfoh for <qemu-riscv@nongnu.org>;
 Mon, 22 Aug 2022 23:12:35 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MBf5r48wYz1RtVk;
 Mon, 22 Aug 2022 23:12:32 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 1/4] hw/ssi: ibex_spi: fixup typos in ibex_spi_host
Date: Tue, 23 Aug 2022 16:12:00 +1000
Message-Id: <20220823061201.132342-2-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
References: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=2270691b0=wilfred.mallawa@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Tue, 23 Aug 2022 06:12:45 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch fixes up minor typos in ibex_spi_host

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
2.37.2


