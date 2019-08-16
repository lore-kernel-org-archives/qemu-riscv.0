Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyWjW-0006XW-62
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 03:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWjP-0006Me-80
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:33:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWjM-00008B-F9
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:33:03 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.80]:56624)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWjI-0008Uc-Og; Fri, 16 Aug 2019 03:32:58 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 BWP09926085.bt.com (10.36.82.116) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:32:44 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:32:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:32:47 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v7 18/42] hw/display: Declare device little
 or big endian
Thread-Index: AQHVVATMm+Gw97XX1E69XWqXb5W1uQ==
Date: Fri, 16 Aug 2019 07:32:47 +0000
Message-ID: <1565940766250.74217@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594076625074217btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.80
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v7 18/42] hw/display: Declare
 device little or big endian
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
X-List-Received-Date: Fri, 16 Aug 2019 07:33:06 -0000

--_000_156594076625074217btcom_
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
 hw/display/pl110.c    | 2 +-
 hw/display/tc6393xb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index 2bdfc3c..d0c6317 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -471,7 +471,7 @@ static void pl110_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl110_ops =3D {
     .read =3D pl110_read,
     .write =3D pl110_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void pl110_mux_ctrl_set(void *opaque, int line, int level)
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 0b7c59c..6bc3360 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -547,7 +547,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint=
32_t base, qemu_irq irq)
     static const MemoryRegionOps tc6393xb_ops =3D {
         .read =3D tc6393xb_readb,
         .write =3D tc6393xb_writeb,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
+        .endianness =3D DEVICE_LITTLE_ENDIAN,
         .impl =3D {
             .min_access_size =3D 1,
             .max_access_size =3D 1,
--
1.8.3.1

?


--_000_156594076625074217btcom_
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
<div>&nbsp;hw/display/pl110.c &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/display/tc6393xb.c | 2 &#43;-</div>
<div>&nbsp;2 files changed, 2 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/display/pl110.c b/hw/display/pl110.c</div>
<div>index 2bdfc3c..d0c6317 100644</div>
<div>--- a/hw/display/pl110.c</div>
<div>&#43;&#43;&#43; b/hw/display/pl110.c</div>
<div>@@ -471,7 &#43;471,7 @@ static void pl110_write(void *opaque, hwaddr o=
ffset,</div>
<div>&nbsp;static const MemoryRegionOps pl110_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl110_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl110_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void pl110_mux_ctrl_set(void *opaque, int line, int level=
)</div>
<div>diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c</div>
<div>index 0b7c59c..6bc3360 100644</div>
<div>--- a/hw/display/tc6393xb.c</div>
<div>&#43;&#43;&#43; b/hw/display/tc6393xb.c</div>
<div>@@ -547,7 &#43;547,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sys=
mem, uint32_t base, qemu_irq irq)</div>
<div>&nbsp; &nbsp; &nbsp;static const MemoryRegionOps tc6393xb_ops =3D {</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D tc6393xb_readb,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D tc6393xb_writeb,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1=
,</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594076625074217btcom_--

