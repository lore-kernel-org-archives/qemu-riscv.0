Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyWlo-0000Rk-SR
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 03:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWlg-0000L0-7g
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:35:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWlb-0001N0-Li
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:35:23 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.234]:14775)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWl5-000142-SP; Fri, 16 Aug 2019 03:34:48 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:34:34 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:34:45 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:34:45 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v7 25/42] hw/misc: Declare device little or
 big endian
Thread-Index: AQHVVAUT1axlSjXNWEqoCGdR6qt9zw==
Date: Fri, 16 Aug 2019 07:34:45 +0000
Message-ID: <1565940884636.2215@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_15659408846362215btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.234
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v7 25/42] hw/misc: Declare device
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
X-List-Received-Date: Fri, 16 Aug 2019 07:35:31 -0000

--_000_15659408846362215btcom_
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
 hw/misc/a9scu.c    | 2 +-
 hw/misc/applesmc.c | 6 +++---
 hw/misc/arm11scu.c | 2 +-
 hw/misc/arm_l2x0.c | 2 +-
 hw/misc/puv3_pm.c  | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c
index 4307f00..3de8cd3 100644
--- a/hw/misc/a9scu.c
+++ b/hw/misc/a9scu.c
@@ -94,7 +94,7 @@ static void a9_scu_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps a9_scu_ops =3D {
     .read =3D a9_scu_read,
     .write =3D a9_scu_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void a9_scu_reset(DeviceState *dev)
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 2d7eb3c..6c91f29 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -285,7 +285,7 @@ static void qdev_applesmc_isa_reset(DeviceState *dev)
 static const MemoryRegionOps applesmc_data_io_ops =3D {
     .write =3D applesmc_io_data_write,
     .read =3D applesmc_io_data_read,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -295,7 +295,7 @@ static const MemoryRegionOps applesmc_data_io_ops =3D {
 static const MemoryRegionOps applesmc_cmd_io_ops =3D {
     .write =3D applesmc_io_cmd_write,
     .read =3D applesmc_io_cmd_read,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
@@ -305,7 +305,7 @@ static const MemoryRegionOps applesmc_cmd_io_ops =3D {
 static const MemoryRegionOps applesmc_err_io_ops =3D {
     .write =3D applesmc_io_err_write,
     .read =3D applesmc_io_err_read,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .impl =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c
index 84275df..59fd7c0 100644
--- a/hw/misc/arm11scu.c
+++ b/hw/misc/arm11scu.c
@@ -57,7 +57,7 @@ static void mpcore_scu_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps mpcore_scu_ops =3D {
     .read =3D mpcore_scu_read,
     .write =3D mpcore_scu_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void arm11_scu_realize(DeviceState *dev, Error **errp)
diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
index b88f40a..72ecf46 100644
--- a/hw/misc/arm_l2x0.c
+++ b/hw/misc/arm_l2x0.c
@@ -157,7 +157,7 @@ static void l2x0_priv_reset(DeviceState *dev)
 static const MemoryRegionOps l2x0_mem_ops =3D {
     .read =3D l2x0_priv_read,
     .write =3D l2x0_priv_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
  };

 static void l2x0_priv_init(Object *obj)
diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c
index b538b4a..cd82b69 100644
--- a/hw/misc/puv3_pm.c
+++ b/hw/misc/puv3_pm.c
@@ -118,7 +118,7 @@ static const MemoryRegionOps puv3_pm_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void puv3_pm_realize(DeviceState *dev, Error **errp)
--
1.8.3.1

?


--_000_15659408846362215btcom_
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
<div>&nbsp;hw/misc/a9scu.c &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;hw/misc/applesmc.c | 6 &#43;&#43;&#43;---</div>
<div>&nbsp;hw/misc/arm11scu.c | 2 &#43;-</div>
<div>&nbsp;hw/misc/arm_l2x0.c | 2 &#43;-</div>
<div>&nbsp;hw/misc/puv3_pm.c &nbsp;| 2 &#43;-</div>
<div>&nbsp;5 files changed, 7 insertions(&#43;), 7 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c</div>
<div>index 4307f00..3de8cd3 100644</div>
<div>--- a/hw/misc/a9scu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/a9scu.c</div>
<div>@@ -94,7 &#43;94,7 @@ static void a9_scu_write(void *opaque, hwaddr of=
fset,</div>
<div>&nbsp;static const MemoryRegionOps a9_scu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D a9_scu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D a9_scu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void a9_scu_reset(DeviceState *dev)</div>
<div>diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c</div>
<div>index 2d7eb3c..6c91f29 100644</div>
<div>--- a/hw/misc/applesmc.c</div>
<div>&#43;&#43;&#43; b/hw/misc/applesmc.c</div>
<div>@@ -285,7 &#43;285,7 @@ static void qdev_applesmc_isa_reset(DeviceStat=
e *dev)</div>
<div>&nbsp;static const MemoryRegionOps applesmc_data_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D applesmc_io_data_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D applesmc_io_data_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -295,7 &#43;295,7 @@ static const MemoryRegionOps applesmc_data_io_=
ops =3D {</div>
<div>&nbsp;static const MemoryRegionOps applesmc_cmd_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D applesmc_io_cmd_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D applesmc_io_cmd_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>@@ -305,7 &#43;305,7 @@ static const MemoryRegionOps applesmc_cmd_io_o=
ps =3D {</div>
<div>&nbsp;static const MemoryRegionOps applesmc_err_io_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D applesmc_io_err_write,</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D applesmc_io_err_read,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 1,</div>
<div>diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c</div>
<div>index 84275df..59fd7c0 100644</div>
<div>--- a/hw/misc/arm11scu.c</div>
<div>&#43;&#43;&#43; b/hw/misc/arm11scu.c</div>
<div>@@ -57,7 &#43;57,7 @@ static void mpcore_scu_write(void *opaque, hwadd=
r offset,</div>
<div>&nbsp;static const MemoryRegionOps mpcore_scu_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D mpcore_scu_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D mpcore_scu_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void arm11_scu_realize(DeviceState *dev, Error **errp)</d=
iv>
<div>diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c</div>
<div>index b88f40a..72ecf46 100644</div>
<div>--- a/hw/misc/arm_l2x0.c</div>
<div>&#43;&#43;&#43; b/hw/misc/arm_l2x0.c</div>
<div>@@ -157,7 &#43;157,7 @@ static void l2x0_priv_reset(DeviceState *dev)<=
/div>
<div>&nbsp;static const MemoryRegionOps l2x0_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D l2x0_priv_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D l2x0_priv_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; };</div>
<div>&nbsp;</div>
<div>&nbsp;static void l2x0_priv_init(Object *obj)</div>
<div>diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c</div>
<div>index b538b4a..cd82b69 100644</div>
<div>--- a/hw/misc/puv3_pm.c</div>
<div>&#43;&#43;&#43; b/hw/misc/puv3_pm.c</div>
<div>@@ -118,7 &#43;118,7 @@ static const MemoryRegionOps puv3_pm_ops =3D {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static void puv3_pm_realize(DeviceState *dev, Error **errp)</div=
>
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

--_000_15659408846362215btcom_--

