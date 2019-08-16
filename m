Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyWfC-0001fL-3H
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 03:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWf7-0001Yu-Js
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWf4-0006t2-V6
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:28:37 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.237]:58447)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWeg-0006lW-OO; Fri, 16 Aug 2019 03:28:11 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 RDW083A010ED66.bt.com (10.187.98.36) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:27:12 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:28:07 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:28:07 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v7 05/42] hw/s390x: Access MemoryRegion with
 MemOp
Thread-Index: AQHVVAQm4YOYr/5qT0mFs0jMdf+W7Q==
Date: Fri, 16 Aug 2019 07:28:07 +0000
Message-ID: <1565940486725.11895@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594048672511895btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.237
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v7 05/42] hw/s390x: Access
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
X-List-Received-Date: Fri, 16 Aug 2019 07:28:40 -0000

--_000_156594048672511895btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The memory_region_dispatch_{read|write} operand "unsigned size" is
being converted into a "MemOp op".

Convert interfaces by using no-op size_memop.

After all interfaces are converted, size_memop will be implemented
and the memory_region_dispatch_{read|write} operand "unsigned size"
will be converted into a "MemOp op".

As size_memop is a no-op, this patch does not change any behaviour.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-pci-inst.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 0023514..0c958fc 100644
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
+    return memory_region_dispatch_read(mr, offset, data, size_memop(len),
                                        MEMTXATTRS_UNSPECIFIED);
 }

@@ -471,7 +472,7 @@ static MemTxResult zpci_write_bar(S390PCIBusDevice *pbd=
ev, uint8_t pcias,
     mr =3D pbdev->pdev->io_regions[pcias].memory;
     mr =3D s390_get_subregion(mr, offset, len);
     offset -=3D mr->addr;
-    return memory_region_dispatch_write(mr, offset, data, len,
+    return memory_region_dispatch_write(mr, offset, data, size_memop(len),
                                         MEMTXATTRS_UNSPECIFIED);
 }

@@ -780,7 +781,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8=
_t r3, uint64_t gaddr,

     for (i =3D 0; i < len / 8; i++) {
         result =3D memory_region_dispatch_write(mr, offset + i * 8,
-                                              ldq_p(buffer + i * 8), 8,
+                                              ldq_p(buffer + i * 8),
+                                              size_memop(8),
                                               MEMTXATTRS_UNSPECIFIED);
         if (result !=3D MEMTX_OK) {
             s390_program_interrupt(env, PGM_OPERAND, 6, ra);
--
1.8.3.1

?


--_000_156594048672511895btcom_
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
<div><span style=3D"font-size: 12pt;">The memory_region_dispatch_{read|writ=
e} operand &quot;unsigned size&quot; is</span><br>
</div>
<div>being converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Convert interfaces by using no-op size_memop.</div>
<div><br>
</div>
<div>After all interfaces are converted, size_memop will be implemented</di=
v>
<div>and the memory_region_dispatch_{read|write} operand &quot;unsigned siz=
e&quot;</div>
<div>will be converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>As size_memop is a no-op, this patch does not change any behaviour.</d=
iv>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>Reviewed-by: Cornelia Huck &lt;cohuck@redhat.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/s390x/s390-pci-inst.c | 8 &#43;&#43;&#43;&#43;&#43;---</div>
<div>&nbsp;1 file changed, 5 insertions(&#43;), 3 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c</div>
<div>index 0023514..0c958fc 100644</div>
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
, size_memop(len),</div>
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
a, size_memop(len),</div>
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
 &nbsp; &nbsp; &nbsp;size_memop(8),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (result !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_program_interrupt=
(env, PGM_OPERAND, 6, ra);</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594048672511895btcom_--

