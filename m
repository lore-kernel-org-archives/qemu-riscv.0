Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNQcI-0004fT-Bz
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 23:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQc9-0004Ye-3y
 for qemu-riscv@nongnu.org; Sun, 14 Aug 2022 23:18:07 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:55721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQbz-0007Q0-WB
 for qemu-riscv@nongnu.org; Sun, 14 Aug 2022 23:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660533475; x=1692069475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DpUrOLtNTJGn6WeISdxZPFtJtbvXhcV5iwomnnWlCDE=;
 b=VbIEdoSfMuAbLHEyTDHzWuyjUo6U3Bdypl7lt7/ZtYMx2tuEfng57jx5
 njA46tC1OBh8//NURs7L9hDi3pzv9wPsvdGxvHTSNdw46V+mrqJH8DMt5
 ZTvZxCUurJHCJnjkJtb8n1uqmkrrXgzacsRjvsMJmQD503Bbhc7lxY3z/
 2kOOHuj5rnMclUi6dAgUAtCQNRPrwPqN0TjVFVYpvBMngVSdDFkbwkB3t
 zKBlpoC4cRv6a4XOSnpfXGmBgpK0g8MVj7ivVj0TLqf9RSso4T/b7x9cn
 SvxjmsPzuVEsS2nSw3FrocNb73uZboO0ELTcKCwDgKkv5AIX7A9eKmA2L w==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654531200"; d="scan'208";a="213758476"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2022 11:17:47 +0800
IronPort-SDR: I9qSU2z7TFa4Bu/rpma46yFs2sNkP97+cO+osN4M+LxSUhwN2OgqS9VpbLne8Ef1OR1Jk0DR2Y
 l5EKcqioKmKiNk/1SSd33lIrJZdAkU1vYwi9WuAGd9k5vo63x1Oh2fPIA8X4cxHY+OpP68Vz6l
 7PdwlsViyFnSBnQhkhtNKxcqqdelBxdtAcounjQru1P2xLc4EsmMEFwPYpeh15gq8TX+BYFhhE
 YGsNqJpMjIY2b3uBiQ9a3d1LBhGVE+18wFtxe3ufK2wlDHSuzgpmxCh78RGR22GkammwfLV7q1
 rGqhRxvM+iaKSaD8UxWzKW2H
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 19:33:18 -0700
IronPort-SDR: mXE8BXXkw0NqGHUnYBjodlKBTx154+Wrjyw/iEOVFtB8W9HmjS3U3U4z5RWW11l/jXNHxM6Xq2
 e0cLI8mtml5/Whd+4/bbAK7WqaVSmECR5xr7WdasEGlz5Y4nF+CqYLv4nAoYlb2j388n7stIXS
 NnTNPYlnWY1ofVMc1vUyYliZEhhK4TOM1wgSCk0JmGkM4chL4t8wXS7qRehGW1+sIsyGAEN3ik
 pMJmEW9x9z+b4ReuuEvFGjyzM93fftx64I2j2qkSl6mhL8Jtf1WiZ147OyHup1CCv1geKYa7Yu
 97M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 20:17:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M5fbv6HXFz1Rwnx
 for <qemu-riscv@nongnu.org>; Sun, 14 Aug 2022 20:17:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1660533467; x=1663125468; bh=DpUrOLtNTJGn6WeISd
 xZPFtJtbvXhcV5iwomnnWlCDE=; b=g7x70M0d0SVAeSmb7xRuccwp0Q+QA+SAvK
 v0f42pr2xYdlxFpRAP2itZ6iMHnssbejrEOBYMjefa34/lLOxrenK13oVM77EB/S
 gC2zkXojMKkZ8Y8hOqRt9dX+Y/7LLqW7izwHk5m+QSDMoHEpVj38bT659mkJlG1j
 Giw22wthJxB9ecLOQNIHUhWWsv2SYDpIbTuuayQiAMd5r/EatFIvDZzOfzuYY2ZB
 w9xkE7EuqrFuewjsfuwBClZYiyOs7htXCjsvgWMDuDExiyKeOpHnb2dsKKTueutt
 iicF1Wm8V+x1+354w4VU0yT+Syd8un2WKy0oyipGmQ4cSx71lt2g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id p40DrjhF5D1j for <qemu-riscv@nongnu.org>;
 Sun, 14 Aug 2022 20:17:47 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M5fbs19TZz1RtVk;
 Sun, 14 Aug 2022 20:17:44 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 3/4] hw/ssi: ibex_spi: fixup/add rw1c functionality
Date: Mon, 15 Aug 2022 13:16:24 +1000
Message-Id: <20220815031624.170857-4-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
References: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=219596703=wilfred.mallawa@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Mon, 15 Aug 2022 03:18:11 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch adds the `rw1c` functionality to the respective
registers. The status fields are cleared when the respective
field is set.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/ssi/ibex_spi_host.c         | 34 ++++++++++++++++++++++++++++++++--
 include/hw/ssi/ibex_spi_host.h |  4 ++--
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index d377f1100c..19dd094d76 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -350,7 +350,17 @@ static void ibex_spi_host_write(void *opaque, hwaddr=
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
@@ -493,7 +503,27 @@ static void ibex_spi_host_write(void *opaque, hwaddr=
 addr,
      *  When an error occurs, the corresponding bit must be cleared
      *  here before issuing any further commands
      */
-        s->regs[addr] =3D val32;
+        status =3D s->regs[addr];
+        /* rw1c status register */
+        if (FIELD_EX32(val32, ERROR_STATUS, CMDBUSY)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, CMDBUSY, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, OVERFLOW)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, OVERFLOW, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, UNDERFLOW)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, UNDERFLOW, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, CMDINVAL)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, CMDINVAL, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, CSIDINVAL)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, CSIDINVAL, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, ACCESSINVAL)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, ACCESSINVAL, 0);
+        }
+        s->regs[addr] =3D status;
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


