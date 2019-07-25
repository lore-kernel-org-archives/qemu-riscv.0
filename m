Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqaRJ-0006sk-Q0
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 05:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44655)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaRF-0006bP-Ph
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 05:53:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaRE-0000JJ-HH
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 05:53:29 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.71]:13806)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqaR9-0000Ds-Je; Thu, 25 Jul 2019 05:53:23 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926076.bt.com (10.36.82.107) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 10:53:22 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 10:53:22 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 10:53:21 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v4 04/15] hw/s390x: Access MemoryRegion with
 MemOp
Thread-Index: AQHVQs7Ls/U7acV6K0+gx27C+Mlpug==
Date: Thu, 25 Jul 2019 09:53:21 +0000
Message-ID: <1564048401609.3262@bt.com>
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_15640484016093262btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.71
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v4 04/15] hw/s390x: Access
 MemoryRegion with MemOp
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
X-List-Received-Date: Thu, 25 Jul 2019 09:53:31 -0000

--_000_15640484016093262btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/s390x/s390-pci-inst.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 0023514..c126bcc 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -15,6 +15,7 @@
 #include "cpu.h"
 #include "s390-pci-inst.h"
 #include "s390-pci-bus.h"
+#include "exec/memop.h"
 #include "exec/memory-internal.h"
 #include "qemu/error-report.h"
 #include "sysemu/hw_accel.h"
@@ -372,7 +373,7 @@ static MemTxResult zpci_read_bar(S390PCIBusDevice *pbde=
v, uint8_t pcias,
     mr =3D pbdev->pdev->io_regions[pcias].memory;
     mr =3D s390_get_subregion(mr, offset, len);
     offset -=3D mr->addr;
-    return memory_region_dispatch_read(mr, offset, data, len,
+    return memory_region_dispatch_read(mr, offset, data, SIZE_MEMOP(len),
                                        MEMTXATTRS_UNSPECIFIED);
 }

@@ -471,7 +472,7 @@ static MemTxResult zpci_write_bar(S390PCIBusDevice *pbd=
ev, uint8_t pcias,
     mr =3D pbdev->pdev->io_regions[pcias].memory;
     mr =3D s390_get_subregion(mr, offset, len);
     offset -=3D mr->addr;
-    return memory_region_dispatch_write(mr, offset, data, len,
+    return memory_region_dispatch_write(mr, offset, data, SIZE_MEMOP(len),
                                         MEMTXATTRS_UNSPECIFIED);
 }

@@ -780,7 +781,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8=
_t r3, uint64_t gaddr,

     for (i =3D 0; i < len / 8; i++) {
         result =3D memory_region_dispatch_write(mr, offset + i * 8,
-                                              ldq_p(buffer + i * 8), 8,
+                                              ldq_p(buffer + i * 8),
+                                              SIZE_MEMOP(8),
                                               MEMTXATTRS_UNSPECIFIED);
         if (result !=3D MEMTX_OK) {
             s390_program_interrupt(env, PGM_OPERAND, 6, ra);
--
1.8.3.1




--_000_15640484016093262btcom_
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
<div>&nbsp;hw/s390x/s390-pci-inst.c | 8 &#43;&#43;&#43;&#43;&#43;---</div>
<div>&nbsp;1 file changed, 5 insertions(&#43;), 3 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c</div>
<div>index 0023514..c126bcc 100644</div>
<div>--- a/hw/s390x/s390-pci-inst.c</div>
<div>&#43;&#43;&#43; b/hw/s390x/s390-pci-inst.c</div>
<div>@@ -15,6 &#43;15,7 @@</div>
<div>&nbsp;#include &quot;cpu.h&quot;</div>
<div>&nbsp;#include &quot;s390-pci-inst.h&quot;</div>
<div>&nbsp;#include &quot;s390-pci-bus.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;exec/memory-internal.h&quot;</div>
<div>&nbsp;#include &quot;qemu/error-report.h&quot;</div>
<div>&nbsp;#include &quot;sysemu/hw_accel.h&quot;</div>
<div>@@ -372,7 &#43;373,7 @@ static MemTxResult zpci_read_bar(S390PCIBusDev=
ice *pbdev, uint8_t pcias,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D pbdev-&gt;pdev-&gt;io_regions[pcias].memory=
;</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D s390_get_subregion(mr, offset, len);</div>
<div>&nbsp; &nbsp; &nbsp;offset -=3D mr-&gt;addr;</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_read(mr, offset, data, le=
n,</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_read(mr, offset, data=
, SIZE_MEMOP(len),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMTX=
ATTRS_UNSPECIFIED);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -471,7 &#43;472,7 @@ static MemTxResult zpci_write_bar(S390PCIBusDe=
vice *pbdev, uint8_t pcias,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D pbdev-&gt;pdev-&gt;io_regions[pcias].memory=
;</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D s390_get_subregion(mr, offset, len);</div>
<div>&nbsp; &nbsp; &nbsp;offset -=3D mr-&gt;addr;</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_write(mr, offset, data, l=
en,</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_write(mr, offset, dat=
a, SIZE_MEMOP(len),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -780,7 &#43;781,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t =
r1, uint8_t r3, uint64_t gaddr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; len / 8; i&#43;&#43;) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result =3D memory_region_dispatch_wr=
ite(mr, offset &#43; i * 8,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;ldq_p(buffer &#43; i * 8), 8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;ldq_p(buffer &#43; i * 8),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;SIZE_MEMOP(8),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (result !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_program_interrupt=
(env, PGM_OPERAND, 6, ra);</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_15640484016093262btcom_--

