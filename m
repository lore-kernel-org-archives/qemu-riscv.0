Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQN9s-0008J3-Q9
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 02:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9l-0008Fq-Tn
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 02:12:59 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:25202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9j-0000ls-6Y
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 02:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661235173; x=1692771173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KqLG8xfKmm5DZaru5NgSj5bTY6JbfBZFtjvQZh2l7wE=;
 b=KWjhTJoRQJ2YWqu912fC9l0x+L/YcaSAE7jwqTjJH3H7hH0LDEWfZGy8
 j6jdf8v/3AIYPcPLrxSPR1xVDzGDhOJJ6X7FcOdIlwRXvY+jS551OS0HK
 mJ9CV2jmXm3wQsVx7wSsezsRH+egIUTjLa6HwgHA54zVKAY2brdS0GfKJ
 mBI4ZVXzq0NdNfVA5lrxLLis0w7GBu+sJG/Wb7dn17sDPS4hGocVA+0Qt
 FkECd9pVLyYTe4/d8CZsmFKA61RspeB7l4TOlwIB7CzfhfE5OYij75C7N
 cKcRlpwo0+RVJis5FXesntoQ0sLAWn7w6uxToTlENITSzRa+xjXjIDbt9 g==;
X-IronPort-AV: E=Sophos;i="5.93,256,1654531200"; d="scan'208";a="209393004"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Aug 2022 14:12:52 +0800
IronPort-SDR: JnFGYNlZPTltOJe6iEKDQYwsDScKIMc0lZU+xy8AmD+U5/dDDz33yl30wAFmHXqrAE0odOhiu9
 1vyPHo+vJb1jsEH0JhnK92egWkamc6UXj/WxLVAbuoaoYGmOk9mfaO+CWswlmxr8k9KrecyREw
 dc/i54AUlI6gMDMhfmM2f2gfumgSGN25SPCwEhOseTYXHL2vKtadKUU8NGWW7NPIjpFLgsB1cV
 vZZyOjUguFk6j6+tC5yumBH0hEeLRcBaHivdCyG6BLdHNOlBuPo0+Yka+FHfk+gfWx5cN2p5IE
 2aE0brJawTR25VrrHkkuDK0O
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 22:33:33 -0700
IronPort-SDR: GSgl0EKJMgbN7tychBo7JxhH6DFUHbqgEaFzwTIY/O5W/OF88RtMdNtrb9l+BrNdau/qer7RqV
 T24WeB6jYUpKmJ4/qFOy4Ch2rLp5SZRm3a1QqHuCb3CqkIZ5OsipMsUvrWKdhuTCSCo65pojQa
 3LB978THSThPtae0BxlvOdUwPqk5IIDz8jPQxifZeFhqFMYL2oNXCtTPLYZN1k0qKqERPzwRBi
 CPbEgOFRn2+li4h+ISf57KFarfnXfJADwHYa0VOMcCIWLpTktH4FHn9h/clrnTiXBLyKuJSgZT
 68E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 23:12:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MBf6F35XFz1Rwnl
 for <qemu-riscv@nongnu.org>; Mon, 22 Aug 2022 23:12:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1661235172; x=1663827173; bh=KqLG8xfKmm5DZaru5N
 gSj5bTY6JbfBZFtjvQZh2l7wE=; b=pcdWOVVPmDmWzX/1vn5uYopeErsx4TWERJ
 F8q5s6IajqhN068lEWqEmMht9CDCwro6tiXH0YFuiYPkTcgnbnZl+QIyiUrxZ4GL
 ZptUG5lXYcfi4/ajT86ZoNKR8NGUaraO8le8/MYPU01T82OBBSWLWqf+gwYtAkNu
 Gvoz5Rfu5c43tyJT3qRrWEUvoAC7dmTA3cvc7JVGt4gWXN01VgTjIjzKQidxXH9f
 V3mg0jdWK4ip32P/glbH5rW7C2AG1yAuW4J3hZc8JxdhJdBYbGz82CRfbWwXT+wB
 qxUYJBxVWa/tv1n/U4uqCG+tLi4s6ijU83/CpIz8rlh6Q/vUmCng==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YIXOLP9OaDur for <qemu-riscv@nongnu.org>;
 Mon, 22 Aug 2022 23:12:52 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MBf6B27RDz1RtVk;
 Mon, 22 Aug 2022 23:12:49 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 3/4] hw/ssi: ibex_spi: fixup/add rw1c functionality
Date: Tue, 23 Aug 2022 16:12:03 +1000
Message-Id: <20220823061201.132342-4-wilfred.mallawa@opensource.wdc.com>
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
X-List-Received-Date: Tue, 23 Aug 2022 06:12:59 -0000

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
index d52b193a1a..40d401ad47 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
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
2.37.2


