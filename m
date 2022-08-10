Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLwX1-0001ZK-BJ
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 20:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2146f6254=wilfred.mallawa@opensource.wdc.com>)
 id 1oLujP-0000jO-6T
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 19:03:19 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:57412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2146f6254=wilfred.mallawa@opensource.wdc.com>)
 id 1oLujN-0004Wb-EA
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 19:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660172597; x=1691708597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v4byzCh+jC3Z/dV9ZzTitk+VpmQdpEtuAKDzahjmZ+M=;
 b=GSZj9zu6u2tvf8SwErnPQIutGmA2K88v69XriaDlL6XswsCrVUlHcNFF
 73eIos8qrHr5G39DPsc7v2mXkInFO+4fCXwrH2idd487wgh+3ziJWuJr1
 xaKPEUJ3g7mis6wHeDzTlBNutrqWk1pqZSXqfh7Tw8z2wNmycvKgcSMjb
 ABZ7oZ+5cqBFIVl9nW/xxbNblB2ZbbEUTUwy818eFlwqSvQB9IlobTzTv
 p/G5w9uh79tUB6s6LUyS4cKQN9gkkTgrUbPkN5CBuOLRiT7/mA7f/9AF6
 ScYUr4+SEgktyuKUm10h6syHcJRzpBDjvoUSjr1ioNsszHHwlg8JUcm56 A==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654531200"; d="scan'208";a="312669201"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2022 07:03:03 +0800
IronPort-SDR: MKTfHH4OffV+lI8GkhHwMd2wGXm3TQkWFM2giCPI3dzdBphyZ7JUXQFHFh5u+W9dkh1dBsfBU2
 wEaXDT6kFHfBUFfBOU956bHDfn3IH0UTrt93Lb0cQeonx1PfIBqJbLFc1UWfRCZGrz5akW+jRX
 HPjr2cJyrhogYcRZptEbe0jr/7x3EGodbRFSA36/il28UOluBE9A7oXCC2xLIy5yeMRsIorSUR
 RcnHGmUzHmA4Z4a5YaqAlfS5+gBleQw/oyMx//xx5mUn2D85QByJNuYlg70AO+Rzb9CmrySitt
 /DrWotP+49yMK6SBWitKjrvl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 15:18:38 -0700
IronPort-SDR: 0gVSdEMKyOTIoEPGHwtyMwLzQDrF1ZRdGe+kyamunTmAdsJ59p92EG6FvkvHM3Y6Gvjd1Ky8VB
 OP1c//ubkLkb2cWqiXTGOkWbhuGa5+Yknxl6o2irfqNQvom2kl55flyd3EOkODhq2M75ZijZrJ
 w531y23EWuuWzG3AxG60kwaAP1SGfXJzq6JLu4VszCgE/rdjIwUQXSDkW3BiuCEn3xYWw26x/C
 sQ9VHCG+sQIPrzFt69NO3vjqd2PVH08hcEjhcKVEmWItIZiXA0yvN99sVLqhRjuzPCPOKobB5E
 RNg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 16:03:04 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M357q01Kgz1Rwnm
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 16:03:02 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1660172582; x=1662764583; bh=v4byzCh+jC3Z/dV9Zz
 Titk+VpmQdpEtuAKDzahjmZ+M=; b=FyJ+dL72ivLTtkOUs6bmudVHDWZi8W1tbp
 l5pXqrANq0z+oLYsPKJWk5a15Zh5S4hiq3Z4C1+e73VUzGb8Jtw5HGI8zplOe6Wz
 5DDFyy3lZ+tqFXbWcms8r1j/4fajPnPEtSCT2lyrfRNk9RmTbNse7zT9ixZyj+Cq
 WNE5oveZA+HptPsuSdVDBWM/y4VkraHY8UnVviM/PwVACcr6btuV6eomZNA5Mnh9
 Ab35FyKOg3ayIaNQWfxHAMGAm+TDn9Ks2iGtzXj6EStVveNVfZvda/lovFr0cSWx
 gXa6jwTneFUGSUMjRYhcOZbKdlaIOwyre1mtw2HuJRue4JTc39fg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6gpQRYMIz9MX for <qemu-riscv@nongnu.org>;
 Wed, 10 Aug 2022 16:03:02 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.24])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M357m4gxLz1RtVk;
 Wed, 10 Aug 2022 16:03:00 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH 3/3] hw/ssi: fixup/add rw1c functionality
Date: Thu, 11 Aug 2022 09:02:02 +1000
Message-Id: <20220810230200.149398-3-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
References: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=2146f6254=wilfred.mallawa@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Aug 2022 20:58:36 -0400
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
X-List-Received-Date: Wed, 10 Aug 2022 23:03:19 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch adds the `rw1c` functionality to the respective
registers. The status fields are cleared when the respective
field is set.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/ssi/ibex_spi_host.c         | 36 +++++++++++++++++++++++++++++++---
 include/hw/ssi/ibex_spi_host.h |  4 ++--
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 8c35bfa95f..935372506c 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -352,7 +352,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
 {
     IbexSPIHostState *s =3D opaque;
     uint32_t val32 =3D val64;
-    uint32_t shift_mask =3D 0xff, data;
+    uint32_t shift_mask =3D 0xff, data =3D 0;
     uint8_t txqd_len;
=20
     trace_ibex_spi_host_write(addr, size, val64);
@@ -362,7 +362,17 @@ static void ibex_spi_host_write(void *opaque, hwaddr=
 addr,
=20
     switch (addr) {
     /* Skipping any R/O registers */
-    case IBEX_SPI_HOST_INTR_STATE...IBEX_SPI_HOST_INTR_ENABLE:
+    case IBEX_SPI_HOST_INTR_STATE:
+        /* rw1c status register */
+        if (FIELD_EX32(val32, INTR_STATE, ERROR)) {
+            data =3D FIELD_DP32(data, INTR_STATE, ERROR, 0);
+        }
+        if (FIELD_EX32(val32, INTR_STATE, SPI_EVENT)) {
+            data =3D FIELD_DP32(data, INTR_STATE, SPI_EVENT, 0);
+        }
+        s->regs[addr] =3D data;
+        break;
+    case IBEX_SPI_HOST_INTR_ENABLE:
         s->regs[addr] =3D val32;
         break;
     case IBEX_SPI_HOST_INTR_TEST:
@@ -506,7 +516,27 @@ static void ibex_spi_host_write(void *opaque, hwaddr=
 addr,
      *  When an error occurs, the corresponding bit must be cleared
      *  here before issuing any further commands
      */
-        s->regs[addr] =3D val32;
+        data =3D s->regs[addr];
+        /* rw1c status register */
+        if (FIELD_EX32(val32, ERROR_STATUS, CMDBUSY)) {
+            data =3D FIELD_DP32(data, ERROR_STATUS, CMDBUSY, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, OVERFLOW)) {
+            data =3D FIELD_DP32(data, ERROR_STATUS, OVERFLOW, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, UNDERFLOW)) {
+            data =3D FIELD_DP32(data, ERROR_STATUS, UNDERFLOW, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, CMDINVAL)) {
+            data =3D FIELD_DP32(data, ERROR_STATUS, CMDINVAL, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, CSIDINVAL)) {
+            data =3D FIELD_DP32(data, ERROR_STATUS, CSIDINVAL, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, ACCESSINVAL)) {
+            data =3D FIELD_DP32(data, ERROR_STATUS, ACCESSINVAL, 0);
+        }
+        s->regs[addr] =3D data;
         break;
     case IBEX_SPI_HOST_EVENT_ENABLE:
     /* Controls which classes of SPI events raise an interrupt. */
diff --git a/include/hw/ssi/ibex_spi_host.h b/include/hw/ssi/ibex_spi_hos=
t.h
index 3fedcb6805..1f6d077766 100644
--- a/include/hw/ssi/ibex_spi_host.h
+++ b/include/hw/ssi/ibex_spi_host.h
@@ -40,7 +40,7 @@
     OBJECT_CHECK(IbexSPIHostState, (obj), TYPE_IBEX_SPI_HOST)
=20
 /* SPI Registers */
-#define IBEX_SPI_HOST_INTR_STATE         (0x00 / 4)  /* rw */
+#define IBEX_SPI_HOST_INTR_STATE         (0x00 / 4)  /* rw1c */
 #define IBEX_SPI_HOST_INTR_ENABLE        (0x04 / 4)  /* rw */
 #define IBEX_SPI_HOST_INTR_TEST          (0x08 / 4)  /* wo */
 #define IBEX_SPI_HOST_ALERT_TEST         (0x0c / 4)  /* wo */
@@ -54,7 +54,7 @@
 #define IBEX_SPI_HOST_TXDATA             (0x28 / 4)
=20
 #define IBEX_SPI_HOST_ERROR_ENABLE       (0x2c / 4)  /* rw */
-#define IBEX_SPI_HOST_ERROR_STATUS       (0x30 / 4)  /* rw */
+#define IBEX_SPI_HOST_ERROR_STATUS       (0x30 / 4)  /* rw1c */
 #define IBEX_SPI_HOST_EVENT_ENABLE       (0x34 / 4)  /* rw */
=20
 /* FIFO Len in Bytes */
--=20
2.37.1


