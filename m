Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyWjq-0006mb-FP
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 03:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWjj-0006dP-3d
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:33:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWjc-0000F2-CR
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:33:20 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.78]:56457)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWjY-0000Av-HM; Fri, 16 Aug 2019 03:33:14 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926083.bt.com (10.36.82.114) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:32:44 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:33:05 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:33:05 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v7 19/42] hw/dma: Declare device little or
 big endian
Thread-Index: AQHVVATXv2y4d28XbEKe3xKBzbpwgA==
Date: Fri, 16 Aug 2019 07:33:05 +0000
Message-ID: <1565940784105.45471@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594078410545471btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.78
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v7 19/42] hw/dma: Declare device
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
X-List-Received-Date: Fri, 16 Aug 2019 07:33:28 -0000

--_000_156594078410545471btcom_
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
 hw/dma/bcm2835_dma.c | 4 ++--
 hw/dma/etraxfs_dma.c | 2 +-
 hw/dma/pl080.c       | 2 +-
 hw/dma/pl330.c       | 2 +-
 hw/dma/puv3_dma.c    | 2 +-
 hw/dma/sparc32_dma.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index a39e8f4..907d25c 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -288,7 +288,7 @@ static void bcm2835_dma15_write(void *opaque, hwaddr of=
fset, uint64_t value,
 static const MemoryRegionOps bcm2835_dma0_ops =3D {
     .read =3D bcm2835_dma0_read,
     .write =3D bcm2835_dma0_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
@@ -296,7 +296,7 @@ static const MemoryRegionOps bcm2835_dma0_ops =3D {
 static const MemoryRegionOps bcm2835_dma15_ops =3D {
     .read =3D bcm2835_dma15_read,
     .write =3D bcm2835_dma15_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size =3D 4,
     .valid.max_access_size =3D 4,
 };
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index 85783eb..df3ba09 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -697,7 +697,7 @@ dma_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps dma_ops =3D {
  .read =3D dma_read,
  .write =3D dma_write,
- .endianness =3D DEVICE_NATIVE_ENDIAN,
+ .endianness =3D DEVICE_LITTLE_ENDIAN,
  .valid =3D {
  .min_access_size =3D 1,
  .max_access_size =3D 4
diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 7e57624..644eadb 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -346,7 +346,7 @@ static void pl080_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl080_ops =3D {
     .read =3D pl080_read,
     .write =3D pl080_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void pl080_reset(DeviceState *dev)
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index a56a3e7..4c51f2d 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1493,7 +1493,7 @@ static uint64_t pl330_iomem_read(void *opaque, hwaddr=
 offset,
 static const MemoryRegionOps pl330_ops =3D {
     .read =3D pl330_iomem_read,
     .write =3D pl330_iomem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c
index 122f87a..7002373 100644
--- a/hw/dma/puv3_dma.c
+++ b/hw/dma/puv3_dma.c
@@ -75,7 +75,7 @@ static const MemoryRegionOps puv3_dma_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void puv3_dma_realize(DeviceState *dev, Error **errp)
diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index 88765d0..6b32372 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -224,7 +224,7 @@ static void dma_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps dma_mem_ops =3D {
     .read =3D dma_mem_read,
     .write =3D dma_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
--
1.8.3.1

?


--_000_156594078410545471btcom_
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
<div><span style=3D"font-size: 12pt;">For each device declared with DEVICE_=
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
<div>&nbsp;hw/dma/bcm2835_dma.c | 4 &#43;&#43;--</div>
<div>&nbsp;hw/dma/etraxfs_dma.c | 2 &#43;-</div>
<div>&nbsp;hw/dma/pl080.c &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/dma/pl330.c &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/dma/puv3_dma.c &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/dma/sparc32_dma.c | 2 &#43;-</div>
<div>&nbsp;6 files changed, 7 insertions(&#43;), 7 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c</div>
<div>index a39e8f4..907d25c 100644</div>
<div>--- a/hw/dma/bcm2835_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/bcm2835_dma.c</div>
<div>@@ -288,7 &#43;288,7 @@ static void bcm2835_dma15_write(void *opaque, =
hwaddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_dma0_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_dma0_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_dma0_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>@@ -296,7 &#43;296,7 @@ static const MemoryRegionOps bcm2835_dma0_ops =
=3D {</div>
<div>&nbsp;static const MemoryRegionOps bcm2835_dma15_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D bcm2835_dma15_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D bcm2835_dma15_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 4,</div>
<div>&nbsp;};</div>
<div>diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c</div>
<div>index 85783eb..df3ba09 100644</div>
<div>--- a/hw/dma/etraxfs_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/etraxfs_dma.c</div>
<div>@@ -697,7 &#43;697,7 @@ dma_write(void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps dma_ops =3D {</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.read =3D dma_read,</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.write =3D dma_write,</div>
<div>-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>.end=
ianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>=
.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.valid =3D {</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.min_access_size =3D 1,</div>
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span=
>.max_access_size =3D 4</div>
<div>diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c</div>
<div>index 7e57624..644eadb 100644</div>
<div>--- a/hw/dma/pl080.c</div>
<div>&#43;&#43;&#43; b/hw/dma/pl080.c</div>
<div>@@ -346,7 &#43;346,7 @@ static void pl080_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps pl080_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl080_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl080_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl080_reset(DeviceState *dev)</div>
<div>diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c</div>
<div>index a56a3e7..4c51f2d 100644</div>
<div>--- a/hw/dma/pl330.c</div>
<div>&#43;&#43;&#43; b/hw/dma/pl330.c</div>
<div>@@ -1493,7 &#43;1493,7 @@ static uint64_t pl330_iomem_read(void *opaqu=
e, hwaddr offset,</div>
<div>&nbsp;static const MemoryRegionOps pl330_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl330_iomem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl330_iomem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c</div>
<div>index 122f87a..7002373 100644</div>
<div>--- a/hw/dma/puv3_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/puv3_dma.c</div>
<div>@@ -75,7 &#43;75,7 @@ static const MemoryRegionOps puv3_dma_ops =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void puv3_dma_realize(DeviceState *dev, Error **errp)</di=
v>
<div>diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c</div>
<div>index 88765d0..6b32372 100644</div>
<div>--- a/hw/dma/sparc32_dma.c</div>
<div>&#43;&#43;&#43; b/hw/dma/sparc32_dma.c</div>
<div>@@ -224,7 &#43;224,7 @@ static void dma_mem_write(void *opaque, hwaddr=
 addr,</div>
<div>&nbsp;static const MemoryRegionOps dma_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D dma_mem_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D dma_mem_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594078410545471btcom_--

