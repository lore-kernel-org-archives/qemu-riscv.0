Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdY-0006D3-Pt
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43893)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHJN-0002LF-Ob
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:28:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHJL-0000Ql-HT
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:28:45 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.74]:54526)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvHJL-0000Q3-8m; Wed, 07 Aug 2019 04:28:43 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926079.bt.com (10.36.82.110) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:28:33 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:28:40 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:28:40 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v6 08/26] hw/vfio: Access MemoryRegion with
 MemOp
Thread-Index: AQHVTPodpOirbSsH2ke9flAJiOEFxA==
Date: Wed, 7 Aug 2019 08:28:40 +0000
Message-ID: <1565166520130.61317@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156516652013061317btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.74
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:47 -0400
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v6 08/26] hw/vfio: Access
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
X-List-Received-Date: Wed, 07 Aug 2019 08:28:48 -0000

--_000_156516652013061317btcom_
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
---
 hw/vfio/pci-quirks.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index b35a640..fb3cc33 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -11,6 +11,7 @@
  */

 #include "qemu/osdep.h"
+#include "exec/memop.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
@@ -1071,7 +1072,7 @@ static void vfio_rtl8168_quirk_address_write(void *op=
aque, hwaddr addr,

                 /* Write to the proper guest MSI-X table instead */
                 memory_region_dispatch_write(&vdev->pdev.msix_table_mmio,
-                                             offset, val, size,
+                                             offset, val, size_memop(size)=
,
                                              MEMTXATTRS_UNSPECIFIED);
             }
             return; /* Do not write guest MSI-X data to hardware */
@@ -1102,7 +1103,8 @@ static uint64_t vfio_rtl8168_quirk_data_read(void *op=
aque,
     if (rtl->enabled && (vdev->pdev.cap_present & QEMU_PCI_CAP_MSIX)) {
         hwaddr offset =3D rtl->addr & 0xfff;
         memory_region_dispatch_read(&vdev->pdev.msix_table_mmio, offset,
-                                    &data, size, MEMTXATTRS_UNSPECIFIED);
+                                    &data, size_memop(size),
+                                    MEMTXATTRS_UNSPECIFIED);
         trace_vfio_quirk_rtl8168_msix_read(vdev->vbasedev.name, offset, da=
ta);
     }

--
1.8.3.1

?


--_000_156516652013061317btcom_
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
<div>---</div>
<div>&nbsp;hw/vfio/pci-quirks.c | 6 &#43;&#43;&#43;&#43;--</div>
<div>&nbsp;1 file changed, 4 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c</div>
<div>index b35a640..fb3cc33 100644</div>
<div>--- a/hw/vfio/pci-quirks.c</div>
<div>&#43;&#43;&#43; b/hw/vfio/pci-quirks.c</div>
<div>@@ -11,6 &#43;11,7 @@</div>
<div>&nbsp; */</div>
<div>&nbsp;</div>
<div>&nbsp;#include &quot;qemu/osdep.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;qemu/units.h&quot;</div>
<div>&nbsp;#include &quot;qemu/error-report.h&quot;</div>
<div>&nbsp;#include &quot;qemu/main-loop.h&quot;</div>
<div>@@ -1071,7 &#43;1072,7 @@ static void vfio_rtl8168_quirk_address_write=
(void *opaque, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Write=
 to the proper guest MSI-X table instead */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_r=
egion_dispatch_write(&amp;vdev-&gt;pdev.msix_table_mmio,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; offset, val, size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; offset, val, size_memop(size),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return; /* Do not writ=
e guest MSI-X data to hardware */</div>
<div>@@ -1102,7 &#43;1103,8 @@ static uint64_t vfio_rtl8168_quirk_data_read=
(void *opaque,</div>
<div>&nbsp; &nbsp; &nbsp;if (rtl-&gt;enabled &amp;&amp; (vdev-&gt;pdev.cap_=
present &amp; QEMU_PCI_CAP_MSIX)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr offset =3D rtl-&gt;addr &amp;=
 0xfff;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_read(&amp;vde=
v-&gt;pdev.msix_table_mmio, offset,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;data, size, M=
EMTXATTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;data, siz=
e_memop(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNS=
PECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;trace_vfio_quirk_rtl8168_msix_read(v=
dev-&gt;vbasedev.name, offset, data);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156516652013061317btcom_--

