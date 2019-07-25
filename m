Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqaRz-0001Gn-Dz
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 05:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44926)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaRx-0001BA-Cg
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 05:54:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaRw-0000as-27
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 05:54:13 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.75]:12147)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqaRl-0000W3-9p; Thu, 25 Jul 2019 05:54:01 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926080.bt.com (10.36.82.111) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 10:53:51 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 10:53:52 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 10:53:52 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>,
 <sagark@eecs.berkeley.edu>, <david@redhat.com>, <palmer@sifive.com>,
 <mark.cave-ayland@ilande.co.uk>, <Alistair.Francis@wdc.com>,
 <edgar.iglesias@gmail.com>, <arikalo@wavecomp.com>, <pasic@linux.ibm.com>,
 <borntraeger@de.ibm.com>, <rth@twiddle.net>, <atar4qemu@gmail.com>,
 <ehabkost@redhat.com>, <alex.williamson@redhat.com>, <qemu-arm@nongnu.org>,
 <stefanha@redhat.com>, <shorne@gmail.com>, <david@gibson.dropbear.id.au>,
 <qemu-riscv@nongnu.org>, <qemu-s390x@nongnu.org>,
 <kbastian@mail.uni-paderborn.de>, <cohuck@redhat.com>, <laurent@vivier.eu>,
 <qemu-ppc@nongnu.org>, <amarkovic@wavecomp.com>, <pbonzini@redhat.com>,
 <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v4 05/15] hw/intc/armv7m_nic: Access
 MemoryRegion with MemOp
Thread-Index: AQHVQs7daVXrdQ0E+UmMJfUmXkfSMA==
Date: Thu, 25 Jul 2019 09:53:52 +0000
Message-ID: <1564048432710.98755@bt.com>
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156404843271098755btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.75
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v4 05/15] hw/intc/armv7m_nic:
 Access MemoryRegion with MemOp
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
X-List-Received-Date: Thu, 25 Jul 2019 09:54:14 -0000

--_000_156404843271098755btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/intc/armv7m_nvic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 9f8f0d3..25bb88a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -18,6 +18,7 @@
 #include "hw/intc/armv7m_nvic.h"
 #include "target/arm/cpu.h"
 #include "exec/exec-all.h"
+#include "exec/memop.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -2345,7 +2346,8 @@ static MemTxResult nvic_sysreg_ns_write(void *opaque,=
 hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region=
 */
         attrs.secure =3D 0;
-        return memory_region_dispatch_write(mr, addr, value, size, attrs);
+        return memory_region_dispatch_write(mr, addr, value, SIZE_MEMOP(si=
ze),
+                                            attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2364,7 +2366,8 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, =
hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region=
 */
         attrs.secure =3D 0;
-        return memory_region_dispatch_read(mr, addr, data, size, attrs);
+        return memory_region_dispatch_read(mr, addr, data, SIZE_MEMOP(size=
),
+                                           attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2390,7 +2393,8 @@ static MemTxResult nvic_systick_write(void *opaque, h=
waddr addr,

     /* Direct the access to the correct systick */
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]=
), 0);
-    return memory_region_dispatch_write(mr, addr, value, size, attrs);
+    return memory_region_dispatch_write(mr, addr, value, SIZE_MEMOP(size),
+                                        attrs);
 }

 static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
@@ -2402,7 +2406,7 @@ static MemTxResult nvic_systick_read(void *opaque, hw=
addr addr,

     /* Direct the access to the correct systick */
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]=
), 0);
-    return memory_region_dispatch_read(mr, addr, data, size, attrs);
+    return memory_region_dispatch_read(mr, addr, data, SIZE_MEMOP(size), a=
ttrs);
 }

 static const MemoryRegionOps nvic_systick_ops =3D {
--
1.8.3.1




--_000_156404843271098755btcom_
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
<div><span style=3D"font-size: 12pt;">Signed-off-by: Tony Nguyen &lt;tony.n=
guyen@bt.com&gt;</span><br>
</div>
<div>---</div>
<div>&nbsp;hw/intc/armv7m_nvic.c | 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;----</div>
<div>&nbsp;1 file changed, 8 insertions(&#43;), 4 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c</div>
<div>index 9f8f0d3..25bb88a 100644</div>
<div>--- a/hw/intc/armv7m_nvic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/armv7m_nvic.c</div>
<div>@@ -18,6 &#43;18,7 @@</div>
<div>&nbsp;#include &quot;hw/intc/armv7m_nvic.h&quot;</div>
<div>&nbsp;#include &quot;target/arm/cpu.h&quot;</div>
<div>&nbsp;#include &quot;exec/exec-all.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;qemu/log.h&quot;</div>
<div>&nbsp;#include &quot;qemu/module.h&quot;</div>
<div>&nbsp;#include &quot;trace.h&quot;</div>
<div>@@ -2345,7 &#43;2346,8 @@ static MemTxResult nvic_sysreg_ns_write(void=
 *opaque, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;if (attrs.secure) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* S accesses to the alias act like =
NS accesses to the real region */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;attrs.secure =3D 0;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_write(mr, a=
ddr, value, size, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_write(m=
r, addr, value, SIZE_MEMOP(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* NS attrs are RAZ/WI for privilege=
d, and BusFault for user */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (attrs.user) {</div>
<div>@@ -2364,7 &#43;2366,8 @@ static MemTxResult nvic_sysreg_ns_read(void =
*opaque, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;if (attrs.secure) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* S accesses to the alias act like =
NS accesses to the real region */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;attrs.secure =3D 0;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_read(mr, ad=
dr, data, size, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_read(mr=
, addr, data, SIZE_MEMOP(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* NS attrs are RAZ/WI for privilege=
d, and BusFault for user */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (attrs.user) {</div>
<div>@@ -2390,7 &#43;2393,8 @@ static MemTxResult nvic_systick_write(void *=
opaque, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Direct the access to the correct systick */</di=
v>
<div>&nbsp; &nbsp; &nbsp;mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&amp;=
s-&gt;systick[attrs.secure]), 0);</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_write(mr, addr, value, si=
ze, attrs);</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_write(mr, addr, value=
, SIZE_MEMOP(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
attrs);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,<=
/div>
<div>@@ -2402,7 &#43;2406,7 @@ static MemTxResult nvic_systick_read(void *o=
paque, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Direct the access to the correct systick */</di=
v>
<div>&nbsp; &nbsp; &nbsp;mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&amp;=
s-&gt;systick[attrs.secure]), 0);</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_read(mr, addr, data, size=
, attrs);</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_read(mr, addr, data, =
SIZE_MEMOP(size), attrs);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps nvic_systick_ops =3D {</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156404843271098755btcom_--

