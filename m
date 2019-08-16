Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyWjz-0006yp-I9
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 03:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39035)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWjr-0006o3-EK
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:33:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWjn-0000LP-8B
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:33:31 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.236]:40679)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWio-0008Is-Ny; Fri, 16 Aug 2019 03:32:27 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 RDW083A009ED65.bt.com (10.187.98.35) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:28:31 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:32:24 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:32:24 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <rth@twiddle.net>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <imammedo@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <xiaoguangrong.eric@gmail.com>, <alistair@alistair23.me>,
 <peter.maydell@linaro.org>, <b.galvani@gmail.com>, <clg@kaod.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <i.mitsyanko@gmail.com>,
 <robh@kernel.org>, <peter.chubb@nicta.com.au>, <sundeep.lkml@gmail.com>,
 <jan.kiszka@web.de>, <balrogg@gmail.com>, <eric.auger@redhat.com>,
 <kraxel@redhat.com>, <michael@walle.cc>, <kwolf@redhat.com>,
 <mreitz@redhat.com>, <jsnow@redhat.com>, <keith.busch@intel.com>,
 <philmd@redhat.com>, <marcandre.lureau@redhat.com>,
 <Andrew.Baumann@microsoft.com>, <edgar.iglesias@gmail.com>,
 <antonynpavlov@gmail.com>, <chouteau@adacore.com>,
 <frederic.konrad@adacore.com>, <huth@tuxfamily.org>,
 <mark.cave-ayland@ilande.co.uk>, <hpoussin@reactos.org>,
 <arikalo@wavecomp.com>, <balaton@eik.bme.hu>, <gxt@mprc.pku.edu.cn>,
 <david@gibson.dropbear.id.au>, <deller@gmx.de>, <ehabkost@redhat.com>,
 <sstabellini@kernel.org>, <anthony.perard@citrix.com>,
 <paul.durrant@citrix.com>, <aurelien@aurel32.net>, <amarkovic@wavecomp.com>,
 <magnus.damm@gmail.com>, <berto@igalia.com>, <minyard@acm.org>,
 <pburton@wavecomp.com>, <jslaby@suse.cz>, <jcd@tribudubois.net>,
 <andrew.smirnov@gmail.com>, <green@moxielogic.com>, <jasowang@redhat.com>,
 <dmitry.fleytman@gmail.com>, <sw@weilnetz.de>, <jiri@resnulli.us>,
 <crwulff@gmail.com>, <marex@denx.de>, <lersek@redhat.com>,
 <proljc@gmail.com>, <shorne@gmail.com>, <yuval.shaia@oracle.com>,
 <palmer@sifive.com>, <sagark@eecs.berkeley.edu>,
 <kbastian@mail.uni-paderborn.de>, <walling@linux.ibm.com>,
 <cohuck@redhat.com>, <david@redhat.com>, <pasic@linux.ibm.com>,
 <borntraeger@de.ibm.com>, <fam@euphon.net>, <hare@suse.com>,
 <atar4qemu@gmail.com>, <stefanb@linux.ibm.com>, <alex.williamson@redhat.com>, 
 <jcmvbkbc@gmail.com>, <laurent@vivier.eu>, <claudio.fontana@suse.com>,
 <stefanha@redhat.com>, <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>,
 <qemu-ppc@nongnu.org>, <xen-devel@lists.xenproject.org>,
 <qemu-riscv@nongnu.org>, <qemu-s390x@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 17/42] hw/char: Declare device little or
 big endian
Thread-Index: AQHVVAS/MEVTyvOxxkaaWGWKyfz7nA==
Date: Fri, 16 Aug 2019 07:32:24 +0000
Message-ID: <1565940743566.34044@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594074356634044btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.236
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v7 17/42] hw/char: Declare device
 little or big endian
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2019 07:33:37 -0000

--_000_156594074356634044btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
respectively.

This *naive* deduction may result in genuinely native endian devices
being incorrectly declared as little or big endian, but should not
introduce regressions for current targets.

These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
has a new target with an opposite endian or 2) someone informed knows
better =3D)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/char/cadence_uart.c   | 2 +-
 hw/char/escc.c           | 2 +-
 hw/char/etraxfs_ser.c    | 2 +-
 hw/char/grlib_apbuart.c  | 2 +-
 hw/char/imx_serial.c     | 2 +-
 hw/char/lm32_uart.c      | 2 +-
 hw/char/milkymist-uart.c | 2 +-
 hw/char/pl011.c          | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index fa25fe2..6c7b904 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -457,7 +457,7 @@ static uint64_t uart_read(void *opaque, hwaddr offset,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void cadence_uart_reset(DeviceState *dev)
diff --git a/hw/char/escc.c b/hw/char/escc.c
index 8ddbb4b..36182d9 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -574,7 +574,7 @@ static uint64_t escc_mem_read(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps escc_mem_ops =3D {
     .read =3D escc_mem_read,
     .write =3D escc_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index 9745bca..cda687b 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -155,7 +155,7 @@ ser_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps ser_ops =3D {
     .read =3D ser_read,
     .write =3D ser_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index c2bb3ac..119fc84 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -237,7 +237,7 @@ static void grlib_apbuart_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps grlib_apbuart_ops =3D {
     .write      =3D grlib_apbuart_write,
     .read       =3D grlib_apbuart_read,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
 };

 static void grlib_apbuart_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 0655a95..7c66551 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -332,7 +332,7 @@ static void imx_event(void *opaque, int event)
 static const struct MemoryRegionOps imx_serial_ops =3D {
     .read =3D imx_serial_read,
     .write =3D imx_serial_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void imx_serial_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index d047a44..2fe5f60 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -205,7 +205,7 @@ static void uart_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
index 8a78fcc..bdb8282 100644
--- a/hw/char/milkymist-uart.c
+++ b/hw/char/milkymist-uart.c
@@ -156,7 +156,7 @@ static const MemoryRegionOps uart_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
 };

 static void uart_rx(void *opaque, const uint8_t *buf, int size)
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c1ae2f3..5fb95d2 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -287,7 +287,7 @@ static void pl011_event(void *opaque, int event)
 static const MemoryRegionOps pl011_ops =3D {
     .read =3D pl011_read,
     .write =3D pl011_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const VMStateDescription vmstate_pl011 =3D {
--
1.8.3.1

?


--_000_156594074356634044btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div style=3D"color: rgb(33, 33, 33);"><font size=3D"2"><span style=3D"font=
-size:10pt;">
<div class=3D"PlainText">
<div><span style=3D"font-size: 10pt;">For each device declared with DEVICE_=
NATIVE_ENDIAN, find the set of</span><br>
</div>
<div>targets from the set of target/hw/*/device.o.</div>
<div><br>
</div>
<div>If the set of targets are all little or all big endian, re-declare</di=
v>
<div>the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN</di=
v>
<div>respectively.</div>
<div><br>
</div>
<div>This *naive* deduction may result in genuinely native endian devices</=
div>
<div>being incorrectly declared as little or big endian, but should not</di=
v>
<div>introduce regressions for current targets.</div>
<div><br>
</div>
<div>These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it</=
div>
<div>has a new target with an opposite endian or 2) someone informed knows<=
/div>
<div>better =3D)</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/char/cadence_uart.c &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/char/escc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 &#43;-</di=
v>
<div>&nbsp;hw/char/etraxfs_ser.c &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/char/grlib_apbuart.c &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/char/imx_serial.c &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/char/lm32_uart.c &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/char/milkymist-uart.c | 2 &#43;-</div>
<div>&nbsp;hw/char/pl011.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</di=
v>
<div>&nbsp;8 files changed, 8 insertions(&#43;), 8 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c</div>
<div>index fa25fe2..6c7b904 100644</div>
<div>--- a/hw/char/cadence_uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/cadence_uart.c</div>
<div>@@ -457,7 &#43;457,7 @@ static uint64_t uart_read(void *opaque, hwaddr=
 offset,</div>
<div>&nbsp;static const MemoryRegionOps uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void cadence_uart_reset(DeviceState *dev)</div>
<div>diff --git a/hw/char/escc.c b/hw/char/escc.c</div>
<div>index 8ddbb4b..36182d9 100644</div>
<div>--- a/hw/char/escc.c</div>
<div>&#43;&#43;&#43; b/hw/char/escc.c</div>
<div>@@ -574,7 &#43;574,7 @@ static uint64_t escc_mem_read(void *opaque, hw=
addr addr,</div>
<div>&nbsp;static const MemoryRegionOps escc_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D escc_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D escc_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c</div>
<div>index 9745bca..cda687b 100644</div>
<div>--- a/hw/char/etraxfs_ser.c</div>
<div>&#43;&#43;&#43; b/hw/char/etraxfs_ser.c</div>
<div>@@ -155,7 &#43;155,7 @@ ser_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps ser_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D ser_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D ser_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c</div>
<div>index c2bb3ac..119fc84 100644</div>
<div>--- a/hw/char/grlib_apbuart.c</div>
<div>&#43;&#43;&#43; b/hw/char/grlib_apbuart.c</div>
<div>@@ -237,7 &#43;237,7 @@ static void grlib_apbuart_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps grlib_apbuart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write &nbsp; &nbsp; &nbsp;=3D grlib_apbuart_write=
,</div>
<div>&nbsp; &nbsp; &nbsp;.read &nbsp; &nbsp; &nbsp; =3D grlib_apbuart_read,=
</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void grlib_apbuart_realize(DeviceState *dev, Error **errp=
)</div>
<div>diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c</div>
<div>index 0655a95..7c66551 100644</div>
<div>--- a/hw/char/imx_serial.c</div>
<div>&#43;&#43;&#43; b/hw/char/imx_serial.c</div>
<div>@@ -332,7 &#43;332,7 @@ static void imx_event(void *opaque, int event)=
</div>
<div>&nbsp;static const struct MemoryRegionOps imx_serial_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D imx_serial_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D imx_serial_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void imx_serial_realize(DeviceState *dev, Error **errp)</=
div>
<div>diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c</div>
<div>index d047a44..2fe5f60 100644</div>
<div>--- a/hw/char/lm32_uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/lm32_uart.c</div>
<div>@@ -205,7 &#43;205,7 @@ static void uart_write(void *opaque, hwaddr ad=
dr,</div>
<div>&nbsp;static const MemoryRegionOps uart_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D uart_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D uart_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c</div>
<div>index 8a78fcc..bdb8282 100644</div>
<div>--- a/hw/char/milkymist-uart.c</div>
<div>&#43;&#43;&#43; b/hw/char/milkymist-uart.c</div>
<div>@@ -156,7 &#43;156,7 @@ static const MemoryRegionOps uart_mmio_ops =3D=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void uart_rx(void *opaque, const uint8_t *buf, int size)<=
/div>
<div>diff --git a/hw/char/pl011.c b/hw/char/pl011.c</div>
<div>index c1ae2f3..5fb95d2 100644</div>
<div>--- a/hw/char/pl011.c</div>
<div>&#43;&#43;&#43; b/hw/char/pl011.c</div>
<div>@@ -287,7 &#43;287,7 @@ static void pl011_event(void *opaque, int even=
t)</div>
<div>&nbsp;static const MemoryRegionOps pl011_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl011_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl011_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_pl011 =3D {</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_156594074356634044btcom_--

