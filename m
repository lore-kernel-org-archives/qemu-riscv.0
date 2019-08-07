Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdh-0006aL-G8
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44904)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHM6-0007D8-Pz
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:31:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHM3-00022t-R2
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:31:34 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.234]:36079)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvHM3-000220-EU; Wed, 07 Aug 2019 04:31:31 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 7 Aug 2019 09:31:06 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:31:28 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:31:28 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <frederic.konrad@adacore.com>, <berto@igalia.com>,
 <qemu-block@nongnu.org>, <arikalo@wavecomp.com>, <pasic@linux.ibm.com>,
 <hpoussin@reactos.org>, <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>, <lersek@redhat.com>, <jasowang@redhat.com>, 
 <jiri@resnulli.us>, <ehabkost@redhat.com>, <b.galvani@gmail.com>,
 <eric.auger@redhat.com>, <alex.williamson@redhat.com>, <stefanha@redhat.com>, 
 <jsnow@redhat.com>, <rth@twiddle.net>, <kwolf@redhat.com>, <andrew@aj.id.au>, 
 <crwulff@gmail.com>, <laurent@vivier.eu>, <sundeep.lkml@gmail.com>,
 <michael@walle.cc>, <qemu-ppc@nongnu.org>, <kbastian@mail.uni-paderborn.de>,
 <imammedo@redhat.com>, <fam@euphon.net>, <peter.maydell@linaro.org>,
 <david@redhat.com>, <palmer@sifive.com>, <keith.busch@intel.com>,
 <jcmvbkbc@gmail.com>, <hare@suse.com>, <sstabellini@kernel.org>,
 <andrew.smirnov@gmail.com>, <deller@gmx.de>, <magnus.damm@gmail.com>,
 <atar4qemu@gmail.com>, <minyard@acm.org>, <sw@weilnetz.de>,
 <yuval.shaia@oracle.com>, <qemu-s390x@nongnu.org>, <qemu-arm@nongnu.org>,
 <jan.kiszka@web.de>, <clg@kaod.org>, <shorne@gmail.com>,
 <qemu-riscv@nongnu.org>, <i.mitsyanko@gmail.com>, <cohuck@redhat.com>,
 <philmd@redhat.com>, <amarkovic@wavecomp.com>, <peter.chubb@nicta.com.au>,
 <aurelien@aurel32.net>, <pburton@wavecomp.com>, <sagark@eecs.berkeley.edu>,
 <green@moxielogic.com>, <kraxel@redhat.com>, <edgar.iglesias@gmail.com>,
 <gxt@mprc.pku.edu.cn>, <robh@kernel.org>, <borntraeger@de.ibm.com>,
 <joel@jms.id.au>, <antonynpavlov@gmail.com>, <chouteau@adacore.com>,
 <Andrew.Baumann@microsoft.com>, <mreitz@redhat.com>, <walling@linux.ibm.com>, 
 <dmitry.fleytman@gmail.com>, <mst@redhat.com>,
 <mark.cave-ayland@ilande.co.uk>, <jslaby@suse.cz>, <marex@denx.de>,
 <proljc@gmail.com>, <marcandre.lureau@redhat.com>, <alistair@alistair23.me>,
 <paul.durrant@citrix.com>, <david@gibson.dropbear.id.au>,
 <xiaoguangrong.eric@gmail.com>, <huth@tuxfamily.org>, <jcd@tribudubois.net>,
 <pbonzini@redhat.com>, <stefanb@linux.ibm.com>
Thread-Topic: [Qemu-devel] [PATCH v6 16/26] exec: Map device_endian onto MemOp
Thread-Index: AQHVTPqBizwOZ0pOOka1lx5iTeYAMw==
Date: Wed, 7 Aug 2019 08:31:28 +0000
Message-ID: <1565166687895.25037@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156516668789525037btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.234
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:47 -0400
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v6 16/26] exec: Map device_endian
 onto MemOp
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
X-List-Received-Date: Wed, 07 Aug 2019 08:31:37 -0000

--_000_156516668789525037btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation to replace device_endian with MemOp.

Mapping device_endian onto MemOp limits behaviour changes to this
relatively smaller patch.

The next patch will replace all device_endian usages with the
equivalent MemOp. That patch will be large but have no behaviour
changes.

A subsequent patch will then delete unused device_endian.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/char/serial.c          | 18 ++++++------------
 include/exec/cpu-common.h | 10 +++++++---
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 7c42a2a..7345f69 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -1012,22 +1012,15 @@ static void serial_mm_write(void *opaque, hwaddr ad=
dr,
     serial_ioport_write(s, addr >> s->it_shift, value, 1);
 }

-static const MemoryRegionOps serial_mm_ops[3] =3D {
-    [DEVICE_NATIVE_ENDIAN] =3D {
-        .read =3D serial_mm_read,
-        .write =3D serial_mm_write,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
-        .valid.max_access_size =3D 8,
-        .impl.max_access_size =3D 8,
-    },
-    [DEVICE_LITTLE_ENDIAN] =3D {
+static const MemoryRegionOps serial_mm_ops[2] =3D {
+    [0] =3D {
         .read =3D serial_mm_read,
         .write =3D serial_mm_write,
         .endianness =3D DEVICE_LITTLE_ENDIAN,
         .valid.max_access_size =3D 8,
         .impl.max_access_size =3D 8,
     },
-    [DEVICE_BIG_ENDIAN] =3D {
+    [1] =3D {
         .read =3D serial_mm_read,
         .write =3D serial_mm_write,
         .endianness =3D DEVICE_BIG_ENDIAN,
@@ -1053,8 +1046,9 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
     serial_realize_core(s, &error_fatal);
     vmstate_register(NULL, base, &vmstate_serial, s);

-    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
-                          "serial", 8 << it_shift);
+    memory_region_init_io(&s->io, NULL,
+                          &serial_mm_ops[end =3D=3D DEVICE_LITTLE_ENDIAN ?=
 0 : 1],
+                          s, "serial", 8 << it_shift);
     memory_region_add_subregion(address_space, base, &s->io);
     return s;
 }
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index f7dbe75..c388453 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -16,10 +16,14 @@ void tcg_flush_softmmu_tlb(CPUState *cs);

 #if !defined(CONFIG_USER_ONLY)

+#include "exec/memop.h"
+
 enum device_endian {
-    DEVICE_NATIVE_ENDIAN,
-    DEVICE_BIG_ENDIAN,
-    DEVICE_LITTLE_ENDIAN,
+#ifdef NEED_CPU_H
+    DEVICE_NATIVE_ENDIAN =3D MO_TE,
+#endif
+    DEVICE_BIG_ENDIAN =3D MO_BE,
+    DEVICE_LITTLE_ENDIAN =3D MO_LE,
 };

 #if defined(HOST_WORDS_BIGENDIAN)
--
1.8.3.1

?


--_000_156516668789525037btcom_
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
<div><span style=3D"font-size: 10pt;">Preparation to replace device_endian =
with MemOp.</span><br>
</div>
<div><br>
</div>
<div>Mapping device_endian onto MemOp limits behaviour changes to this</div=
>
<div>relatively smaller patch.</div>
<div><br>
</div>
<div>The next patch will replace all device_endian usages with the</div>
<div>equivalent MemOp. That patch will be large but have no behaviour</div>
<div>changes.</div>
<div><br>
</div>
<div>A subsequent patch will then delete unused device_endian.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/char/serial.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 18 &#43;&#4=
3;&#43;&#43;&#43;&#43;------------</div>
<div>&nbsp;include/exec/cpu-common.h | 10 &#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;---</div>
<div>&nbsp;2 files changed, 13 insertions(&#43;), 15 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/char/serial.c b/hw/char/serial.c</div>
<div>index 7c42a2a..7345f69 100644</div>
<div>--- a/hw/char/serial.c</div>
<div>&#43;&#43;&#43; b/hw/char/serial.c</div>
<div>@@ -1012,22 &#43;1012,15 @@ static void serial_mm_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;serial_ioport_write(s, addr &gt;&gt; s-&gt;it_shif=
t, value, 1);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static const MemoryRegionOps serial_mm_ops[3] =3D {</div>
<div>- &nbsp; &nbsp;[DEVICE_NATIVE_ENDIAN] =3D {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>- &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;[DEVICE_LITTLE_ENDIAN] =3D {</div>
<div>&#43;static const MemoryRegionOps serial_mm_ops[2] =3D {</div>
<div>&#43; &nbsp; &nbsp;[0] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.valid.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.impl.max_access_size =3D 8,</div>
<div>&nbsp; &nbsp; &nbsp;},</div>
<div>- &nbsp; &nbsp;[DEVICE_BIG_ENDIAN] =3D {</div>
<div>&#43; &nbsp; &nbsp;[1] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.read =3D serial_mm_read,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.write =3D serial_mm_write,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.endianness =3D DEVICE_BIG_ENDIAN,</=
div>
<div>@@ -1053,8 &#43;1046,9 @@ SerialState *serial_mm_init(MemoryRegion *ad=
dress_space,</div>
<div>&nbsp; &nbsp; &nbsp;serial_realize_core(s, &amp;error_fatal);</div>
<div>&nbsp; &nbsp; &nbsp;vmstate_register(NULL, base, &amp;vmstate_serial, =
s);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;memory_region_init_io(&amp;s-&gt;io, NULL, &amp;serial_=
mm_ops[end], s,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;&quot;serial&quot;, 8 &lt;&lt; it_shift);</div>
<div>&#43; &nbsp; &nbsp;memory_region_init_io(&amp;s-&gt;io, NULL,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;&amp;serial_mm_ops[end =3D=3D DEVICE_LITTLE_ENDIA=
N ? 0 : 1],</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;s, &quot;serial&quot;, 8 &lt;&lt; it_shift);</div=
>
<div>&nbsp; &nbsp; &nbsp;memory_region_add_subregion(address_space, base, &=
amp;s-&gt;io);</div>
<div>&nbsp; &nbsp; &nbsp;return s;</div>
<div>&nbsp;}</div>
<div>diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h</di=
v>
<div>index f7dbe75..c388453 100644</div>
<div>--- a/include/exec/cpu-common.h</div>
<div>&#43;&#43;&#43; b/include/exec/cpu-common.h</div>
<div>@@ -16,10 &#43;16,14 @@ void tcg_flush_softmmu_tlb(CPUState *cs);</div=
>
<div>&nbsp;</div>
<div>&nbsp;#if !defined(CONFIG_USER_ONLY)</div>
<div>&nbsp;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&#43;</div>
<div>&nbsp;enum device_endian {</div>
<div>- &nbsp; &nbsp;DEVICE_NATIVE_ENDIAN,</div>
<div>- &nbsp; &nbsp;DEVICE_BIG_ENDIAN,</div>
<div>- &nbsp; &nbsp;DEVICE_LITTLE_ENDIAN,</div>
<div>&#43;#ifdef NEED_CPU_H</div>
<div>&#43; &nbsp; &nbsp;DEVICE_NATIVE_ENDIAN =3D MO_TE,</div>
<div>&#43;#endif</div>
<div>&#43; &nbsp; &nbsp;DEVICE_BIG_ENDIAN =3D MO_BE,</div>
<div>&#43; &nbsp; &nbsp;DEVICE_LITTLE_ENDIAN =3D MO_LE,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(HOST_WORDS_BIGENDIAN)</div>
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

--_000_156516668789525037btcom_--

