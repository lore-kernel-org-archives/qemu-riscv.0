Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1okJ3N-0005Zp-Oy
	for mharc-qemu-riscv@gnu.org; Mon, 17 Oct 2022 01:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282226d84=wilfred.mallawa@opensource.wdc.com>)
 id 1okJ3K-0005T3-Or
 for qemu-riscv@nongnu.org; Mon, 17 Oct 2022 01:52:42 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282226d84=wilfred.mallawa@opensource.wdc.com>)
 id 1okJ3G-0002Xv-Ef
 for qemu-riscv@nongnu.org; Mon, 17 Oct 2022 01:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665985958; x=1697521958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dnnqBhqj++5GfT8TR5/jas2IcErOSKAqgO+V3K9+o5M=;
 b=U/C6apq6e7RwXU1gRtXTbpOx9ubdPiTKvMKQDs/W670ANBdqG/k8pQk7
 cZfqTMe5Gmi8dAUqUJEnAHjczgvvwJrSHwIBCEzBlEx92jeg3PaQS2jez
 rp1MVAFAPLZweOW+OZjVPjiv2vXs561gV+jmXZ1WBUN9MziFUCZktgYUZ
 F4rBsUKMKNUVnYrw97Cnu/L4fYLzHwjhZSGHmHUN/Gn0m2GVYQLUdZDA8
 PouR6vTxS08gEAQgGVeBK6FkImZXOJThCnpW7YsZeuzTNJrf91iVftX0S
 CoybGVIIlZejJjyVVwnZfpXb9J0jUWmu8k88NquWZEwViIVCp2acGB+ny w==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="213985495"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 13:52:36 +0800
IronPort-SDR: IpuCunZuHFUQ9FTTdXOqIF2n6GpFOCdOZsSx1huaww56gW+sYypBS0e64XYO8pckhx2tOxX4os
 DXwmbltzstqS63Q3uCJ4NgbvpPfIeuod716F0GLwAQ8KrFdOO1DhjMw76cEhkfzZXNTQG5IHTD
 C0bFzAiwkZXStSj6zfVtt04xA6yqNVZp+8S8IPrZ96G/9CCjMpneDb1Par9kEzcUB7HInI/2MY
 ihCQ/cdpuWYP6uejhI6uNa/3jYL/vfC05VWfbF9SVOQm64IkZWo052T+Y1S9gIuEkaksYv+JhO
 AlHX5llESCYdYwBn4aDnEhOS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 22:06:30 -0700
IronPort-SDR: aH/V8wCAcjLEzuGPJtTJSFDnVbOjmwdlYhrnGA6ZxvI01fBYpIjwWE01f9Gr0OUhXs5RBHGTFT
 Ty2jTeQr9NZZieAEblisJ0G+xJFi/112Auc2mLv+PfxRY81FTRiltvz7+riIke+eSeTosflf6A
 aMN9kkVx/VKRh2uZGPoJKgoxwR6VEHdW4APeFjll/0jAuSLZTgEJzdLUqVkP5tYuna764D6EX7
 kuEvQoqXGCj4PPFLe6D44s+Y4m3DrsBvkZ1suydSEIWulJa1RLXOdszN/YOUr9Su8w8/nMovEG
 47o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 22:52:37 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrR3S041kz1RwqL
 for <qemu-riscv@nongnu.org>; Sun, 16 Oct 2022 22:52:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665985955; x=1668577956; bh=dnnqBhqj++5GfT8TR5
 /jas2IcErOSKAqgO+V3K9+o5M=; b=N1f/td6VGpgNSzlT9eLHFzCSkp6t8jiE5g
 9jIKOW1oBPp474cKPVILXUHyCtVn0ajLsfl8B/cLrSbJKms2AbYSLUW0Ah/TvYi6
 UbJPH6Y+3DUI8iccCyH9Om7bP1v5gAAsCW80tbqNmFyaI/0DasgCyUI0CXlkEBD9
 INoEb79GAx8e/dHWnvtBNVo0c7PyRtzmmZWX1yvUkPs4+5ZabMmEWh+9v2LTiX4H
 Ndmzjc2Tljt2Zl6XJCXswNsvyjVew9nwya9XLjRy4eVOHHdQ52gumCJzZ/qOQoiH
 1OHR/de7ocN1EEb2hSI9G8sqGGQxYG4NbCflCeBHQ+XkRmgt+Kwg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jpy6l0rfTqZ5 for <qemu-riscv@nongnu.org>;
 Sun, 16 Oct 2022 22:52:35 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.69])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrR3P2wQpz1RvLy;
 Sun, 16 Oct 2022 22:52:32 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: alistair@alistair23.me,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 2/2] hw/ssi/ibex_spi:  implement `FIELD32_1CLEAR` macro
Date: Mon, 17 Oct 2022 15:49:55 +1000
Message-Id: <20221017054950.317584-3-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017054950.317584-1-wilfred.mallawa@opensource.wdc.com>
References: <20221017054950.317584-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=282226d84=wilfred.mallawa@opensource.wdc.com;
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
X-List-Received-Date: Mon, 17 Oct 2022 05:52:43 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

use the `FIELD32_1CLEAR` macro to implement register
`rw1c` functionality to `ibex_spi`.

This change was tested by running the `SPI_HOST` from TockOS.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 57df462e3c..0a456cd1ed 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -342,7 +342,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
 {
     IbexSPIHostState *s =3D opaque;
     uint32_t val32 =3D val64;
-    uint32_t shift_mask =3D 0xff, status =3D 0, data =3D 0;
+    uint32_t shift_mask =3D 0xff, status =3D 0;
     uint8_t txqd_len;
=20
     trace_ibex_spi_host_write(addr, size, val64);
@@ -355,12 +355,11 @@ static void ibex_spi_host_write(void *opaque, hwadd=
r addr,
     case IBEX_SPI_HOST_INTR_STATE:
         /* rw1c status register */
         if (FIELD_EX32(val32, INTR_STATE, ERROR)) {
-            data =3D FIELD_DP32(data, INTR_STATE, ERROR, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], INTR_STATE, =
ERROR);
         }
         if (FIELD_EX32(val32, INTR_STATE, SPI_EVENT)) {
-            data =3D FIELD_DP32(data, INTR_STATE, SPI_EVENT, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], INTR_STATE, =
SPI_EVENT);
         }
-        s->regs[addr] =3D data;
         break;
     case IBEX_SPI_HOST_INTR_ENABLE:
         s->regs[addr] =3D val32;
@@ -505,27 +504,25 @@ static void ibex_spi_host_write(void *opaque, hwadd=
r addr,
      *  When an error occurs, the corresponding bit must be cleared
      *  here before issuing any further commands
      */
-        status =3D s->regs[addr];
         /* rw1c status register */
         if (FIELD_EX32(val32, ERROR_STATUS, CMDBUSY)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, CMDBUSY, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, CMDBUSY);
         }
         if (FIELD_EX32(val32, ERROR_STATUS, OVERFLOW)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, OVERFLOW, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, OVERFLOW);
         }
         if (FIELD_EX32(val32, ERROR_STATUS, UNDERFLOW)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, UNDERFLOW, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, UNDERFLOW);
         }
         if (FIELD_EX32(val32, ERROR_STATUS, CMDINVAL)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, CMDINVAL, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, CMDINVAL);
         }
         if (FIELD_EX32(val32, ERROR_STATUS, CSIDINVAL)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, CSIDINVAL, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, CSIDINVAL);
         }
         if (FIELD_EX32(val32, ERROR_STATUS, ACCESSINVAL)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, ACCESSINVAL, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, ACCESSINVAL);
         }
-        s->regs[addr] =3D status;
         break;
     case IBEX_SPI_HOST_EVENT_ENABLE:
     /* Controls which classes of SPI events raise an interrupt. */
--=20
2.37.3


