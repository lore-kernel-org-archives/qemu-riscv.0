Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oe6mo-00048E-1B
	for mharc-qemu-riscv@gnu.org; Thu, 29 Sep 2022 23:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=265e2c498=wilfred.mallawa@opensource.wdc.com>)
 id 1oe6mk-000463-MH
 for qemu-riscv@nongnu.org; Thu, 29 Sep 2022 23:34:00 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=265e2c498=wilfred.mallawa@opensource.wdc.com>)
 id 1oe6mi-0001d5-52
 for qemu-riscv@nongnu.org; Thu, 29 Sep 2022 23:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664508836; x=1696044836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dk0sp7z3kDPth8yYGVQNx7ek/N0UtJjbzNJ1wI8KZlc=;
 b=E1wEWK2mDl7bYDODfEpvH0Qsdv2N1TYcc/clMGsRvd++tbOqhnhWywGY
 xMecFp+0hvusa6vKzqpDPa6q28Zo/xuaRfdSocPr2EZcF7Kpr+jpF5orw
 1GLPySDvlajP2TU7joSUS6FT3rMC0TWlt475xLuSmzOmXxpa3KbnY5yMy
 R+PKnEjS+yNtB8XPzAwyPnSjvE4ZbNA1Lm94Ahd5pwxSwA9P9C8KNYbDW
 s/3x35QikgkFrTuElvVSdP1stkAh8h/qD/vLwm6biYCgX+6BAW/n9m5jV
 7BI5T8L8mn3dipybrmiQdzFURbCkZUOt8rlYChw28KFf1MwGxep7viqLK A==;
X-IronPort-AV: E=Sophos;i="5.93,357,1654531200"; d="scan'208";a="210991995"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Sep 2022 11:33:52 +0800
IronPort-SDR: uvC6nXIKQ91wPoTpjB9NCecJaz9/Mx4qsjM6uEi6e1XQOBRrcakbvB0BPzKokpLr4Nt5njNJc5
 rUPIectl1F5jPupCrpYu6dSntaqYmyolrTxENixYd3sXJNb2DGVuHzh53PnPMUJiggbJPpMc60
 rwUD/RrZhrP52b9od7BKsNGLNPmTC0af4NzJtzm4NJ1cAVUi9pARtc68UVWy9Oj6bV0zQoD+KF
 FHw7c4F6E8BIssySFH9lQsvXtdlZodGLcRqE1C6HDz8kshbPVGt0ZoL4rG6CGwx+DyEr5NxfCz
 T2duGknMUvqhbXdC6dqbnZ4p
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 19:53:45 -0700
IronPort-SDR: cHNXQFW1RdbCiqGgrmji0XKR/UC2YTC++ZiiOw0D9Ofry7I71HIQx+UM2y8k+dZDAmHewjMotv
 wqnLR7SLdncduwqEPiZYUZr1UVHAKgoX7XezTC/XAHO2szOk3APY74Lh8dJ2UZniN84TYMrAAD
 Noh6uo3QdXJGTdp69sWF+7AC3iOrw5/TmKgT+Ic58nb9LC5WX7OVot7v7KAkMBdzK2htrjpqLR
 wr5Jd3epQTM3TH9S3/SsMfLnxUrAkMqWMChjPVh8qd8gUYy+FwGYaPtNmN3j3CZaAwQhpGufPq
 19s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 20:33:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MdwnC3rv1z1RvTr
 for <qemu-riscv@nongnu.org>; Thu, 29 Sep 2022 20:33:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664508831; x=1667100832; bh=dk0sp7z3kDPth8yYGV
 QNx7ek/N0UtJjbzNJ1wI8KZlc=; b=IgFZS+/4a1d4kVQu0fIcZEybm+p+1TvbEv
 OGhI+4Nxo0n9BLCU9y0q9DYGn4GlWZm4x8C9xY5sOTytPks/p7tI5eCbDs7yOynf
 YhlrpfU+fCXGDnZwa00xXlHDJa1evZLhpCSJJCGvV3dfYrQ9uTElIc9W+UvrM1gQ
 B904UHWl2sAJCXKWkUpAN52D1Pn80mtUWzwReUKILrwaIj8IHJB4e9BmNsVUV75D
 X8hY5BprFGUOsSyZGGd8bYkmpEjEGwjda1X8QUL0x4UaF6Dz5EkpgNu17j5sgAQc
 OfDe0ShQSxBKjJteIbNIhORQpYRzeWU+hih2zgGG8QWkp8z579tQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rnmhPXb-JhJJ for <qemu-riscv@nongnu.org>;
 Thu, 29 Sep 2022 20:33:51 -0700 (PDT)
Received: from fedora.wdc.com (unknown [10.225.165.55])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mdwn84HxWz1RvLy;
 Thu, 29 Sep 2022 20:33:48 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 2/2] hw/ssi: ibex_spi: fixup/add rw1c functionality
Date: Fri, 30 Sep 2022 13:32:44 +1000
Message-Id: <20220930033241.206581-3-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930033241.206581-1-wilfred.mallawa@opensource.wdc.com>
References: <20220930033241.206581-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=265e2c498=wilfred.mallawa@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 30 Sep 2022 03:34:00 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch adds the `rw1c` functionality to the respective
registers. The status fields are cleared when the respective
field is set.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/ssi/ibex_spi_host.c         | 36 +++++++++++++++++++++++++++++++---
 include/hw/ssi/ibex_spi_host.h |  4 ++--
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index d145a4cdbd..57df462e3c 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -342,7 +342,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
 {
     IbexSPIHostState *s =3D opaque;
     uint32_t val32 =3D val64;
-    uint32_t shift_mask =3D 0xff, status =3D 0;
+    uint32_t shift_mask =3D 0xff, status =3D 0, data =3D 0;
     uint8_t txqd_len;
=20
     trace_ibex_spi_host_write(addr, size, val64);
@@ -352,7 +352,17 @@ static void ibex_spi_host_write(void *opaque, hwaddr=
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
@@ -495,7 +505,27 @@ static void ibex_spi_host_write(void *opaque, hwaddr=
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
2.37.3


