Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpaZt-0000Xw-8A
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 11:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53531)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaXo-0001rG-8H
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:48:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaXm-0007YV-M4
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:48:08 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.234]:43242)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaXl-0007WK-Pe; Mon, 22 Jul 2019 11:48:06 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 22 Jul 2019 16:47:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:48:01 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:48:00 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>, <david@redhat.com>,
 <palmer@sifive.com>, <mark.cave-ayland@ilande.co.uk>,
 <Alistair.Francis@wdc.com>, <arikalo@wavecomp.com>, <mst@redhat.com>,
 <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>, <rth@twiddle.net>,
 <atar4qemu@gmail.com>, <ehabkost@redhat.com>, <sw@weilnetz.de>,
 <alex.williamson@redhat.com>, <qemu-arm@nongnu.org>,
 <david@gibson.dropbear.id.au>, <qemu-riscv@nongnu.org>, <cohuck@redhat.com>,
 <claudio.fontana@huawei.com>, <qemu-s390x@nongnu.org>, <qemu-ppc@nongnu.org>, 
 <amarkovic@wavecomp.com>, <pbonzini@redhat.com>, <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v2 11/20] hw/virtio: Access MemoryRegion
 with MemOp
Thread-Index: AQHVQKTX+Ks5rP6+AkSy2PJ+oMCFiQ==
Date: Mon, 22 Jul 2019 15:48:00 +0000
Message-ID: <1563810480347.95681@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381048034795681btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.234
X-Mailman-Approved-At: Mon, 22 Jul 2019 11:50:10 -0400
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v2 11/20] hw/virtio: Access
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
X-List-Received-Date: Mon, 22 Jul 2019 15:48:10 -0000

--_000_156381048034795681btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 17/07/19 08:06, Paolo Bonzini wrote:

> My main concern is that MO_BE/MO_LE/MO_TE do not really apply to the
> memory.c paths.  MO_BSWAP is never passed into the MemOp, even if target
> endianness !=3D host endianness.
>
> Therefore, you could return MO_TE | MO_{8,16,32,64} from this function,
> and change memory_region_endianness_inverted to test
> HOST_WORDS_BIGENDIAN instead of TARGET_WORDS_BIGENDIAN.  Then the two
> MO_BSWAPs (one from MO_TE, one from adjust_endianness because
> memory_region_endianness_inverted returns true) cancel out if the
> memory region's endianness is the same as the host's but different
> from the target's.
>
> Some care is needed in virtio_address_space_write and zpci_write_bar.  I
> think the latter is okay, while the former could do something like this:
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index ce928f2429..61885f020c 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -541,16 +541,16 @@ void virtio_address_space_write(VirtIOPCIProxy *pro=
xy,
> hwaddr addr,
>          val =3D pci_get_byte(buf);
>          break;
>      case 2:
> -        val =3D cpu_to_le16(pci_get_word(buf));
> +        val =3D pci_get_word(buf);
>          break;
>      case 4:
> -        val =3D cpu_to_le32(pci_get_long(buf));
> +        val =3D pci_get_long(buf);
>          break;
>      default:
>          /* As length is under guest control, handle illegal values. */
>          return;
>      }
> -    memory_region_dispatch_write(mr, addr, val, len, MEMTXATTRS_UNSPECIF=
IED);
> +    memory_region_dispatch_write(mr, addr, val, size_memop(len) & ~MO_BS=
WAP,
> MEMTXATTRS_UNSPECIFIED);
>  }
>
>  static void

Sorry Paolo, I noted the need to take care in virtio_address_space_write an=
d
zpci_write_bar but did not understand.

> Some care is needed in virtio_address_space_write and zpci_write_bar.
Is this advice for my v1 implementation, or in the case of the
MO_TE | MO_{8,16,32,64} idead suggested in the paragraph before?

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/virtio/virtio-pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index ce928f2..265f066 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -17,6 +17,7 @@

 #include "qemu/osdep.h"

+#include "exec/memop.h"
 #include "standard-headers/linux/virtio_pci.h"
 #include "hw/virtio/virtio.h"
 #include "hw/pci/pci.h"
@@ -550,7 +551,8 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, =
hwaddr addr,
         /* As length is under guest control, handle illegal values. */
         return;
     }
-    memory_region_dispatch_write(mr, addr, val, len, MEMTXATTRS_UNSPECIFIE=
D);
+    memory_region_dispatch_write(mr, addr, val, SIZE_MEMOP(len),
+                                 MEMTXATTRS_UNSPECIFIED);
 }

 static void
@@ -573,7 +575,8 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr=
 addr,
     /* Make sure caller aligned buf properly */
     assert(!(((uintptr_t)buf) & (len - 1)));

-    memory_region_dispatch_read(mr, addr, &val, len, MEMTXATTRS_UNSPECIFIE=
D);
+    memory_region_dispatch_read(mr, addr, &val, SIZE_MEMOP(len),
+                                MEMTXATTRS_UNSPECIFIED);
     switch (len) {
     case 1:
         pci_set_byte(buf, val);
--
1.8.3.1




--_000_156381048034795681btcom_
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
<div><span style=3D"font-size: 12pt;">On 17/07/19 08:06, Paolo Bonzini wrot=
e:</span><br>
</div>
<div><br>
</div>
<div>&gt; My main concern is that MO_BE/MO_LE/MO_TE do not really apply to =
the&nbsp;</div>
<div>&gt; memory.c paths. &nbsp;MO_BSWAP is never passed into the MemOp, ev=
en if target&nbsp;</div>
<div>&gt; endianness !=3D host endianness.</div>
<div>&gt;&nbsp;</div>
<div>&gt; Therefore, you could return MO_TE | MO_{8,16,32,64} from this fun=
ction,&nbsp;</div>
<div>&gt; and change memory_region_endianness_inverted to test&nbsp;</div>
<div>&gt; HOST_WORDS_BIGENDIAN instead of TARGET_WORDS_BIGENDIAN. &nbsp;The=
n the two</div>
<div>&gt; MO_BSWAPs (one from MO_TE, one from adjust_endianness because</di=
v>
<div>&gt; memory_region_endianness_inverted returns true) cancel out if the=
</div>
<div>&gt; memory region's endianness is the same as the host's but differen=
t</div>
<div>&gt; from the target's.</div>
<div>&gt;&nbsp;</div>
<div>&gt; Some care is needed in virtio_address_space_write and zpci_write_=
bar. &nbsp;I&nbsp;</div>
<div>&gt; think the latter is okay, while the former could do something lik=
e this:</div>
<div>&gt;&nbsp;</div>
<div>&gt; diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c</div=
>
<div>&gt; index ce928f2429..61885f020c 100644</div>
<div>&gt; --- a/hw/virtio/virtio-pci.c</div>
<div>&gt; &#43;&#43;&#43; b/hw/virtio/virtio-pci.c</div>
<div>&gt; @@ -541,16 &#43;541,16 @@ void virtio_address_space_write(VirtIOP=
CIProxy *proxy,&nbsp;</div>
<div>&gt; hwaddr addr,</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D pci_get_byte(buf);</div=
>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&gt; &nbsp; &nbsp; &nbsp;case 2:</div>
<div>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;val =3D cpu_to_le16(pci_get_word(buf=
));</div>
<div>&gt; &#43; &nbsp; &nbsp; &nbsp; &nbsp;val =3D pci_get_word(buf);</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&gt; &nbsp; &nbsp; &nbsp;case 4:</div>
<div>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;val =3D cpu_to_le32(pci_get_long(buf=
));</div>
<div>&gt; &#43; &nbsp; &nbsp; &nbsp; &nbsp;val =3D pci_get_long(buf);</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&gt; &nbsp; &nbsp; &nbsp;default:</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* As length is under guest con=
trol, handle illegal values. */</div>
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&gt; &nbsp; &nbsp; &nbsp;}</div>
<div>&gt; - &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, len, M=
EMTXATTRS_UNSPECIFIED);</div>
<div>&gt; &#43; &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, si=
ze_memop(len) &amp; ~MO_BSWAP,&nbsp;</div>
<div>&gt; MEMTXATTRS_UNSPECIFIED);</div>
<div>&gt; &nbsp;}</div>
<div>&gt; &nbsp;</div>
<div>&gt; &nbsp;static void</div>
<div><br>
</div>
<div>Sorry Paolo, I noted the need to take care in virtio_address_space_wri=
te and</div>
<div>zpci_write_bar but did not understand.</div>
<div><br>
</div>
<div>&gt; Some care is needed in virtio_address_space_write and zpci_write_=
bar.</div>
<div>Is this advice for my v1 implementation, or in the case of the</div>
<div>MO_TE | MO_{8,16,32,64} idead suggested in the paragraph before?</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/virtio/virtio-pci.c | 7 &#43;&#43;&#43;&#43;&#43;--</div>
<div>&nbsp;1 file changed, 5 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c</div>
<div>index ce928f2..265f066 100644</div>
<div>--- a/hw/virtio/virtio-pci.c</div>
<div>&#43;&#43;&#43; b/hw/virtio/virtio-pci.c</div>
<div>@@ -17,6 &#43;17,7 @@</div>
<div>&nbsp;</div>
<div>&nbsp;#include &quot;qemu/osdep.h&quot;</div>
<div>&nbsp;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;standard-headers/linux/virtio_pci.h&quot;</div>
<div>&nbsp;#include &quot;hw/virtio/virtio.h&quot;</div>
<div>&nbsp;#include &quot;hw/pci/pci.h&quot;</div>
<div>@@ -550,7 &#43;551,8 @@ void virtio_address_space_write(VirtIOPCIProxy=
 *proxy, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* As length is under guest control,=
 handle illegal values. */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, len, MEMTXA=
TTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, SIZE_ME=
MOP(len),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMTXATTRS_UNSPECIFIED);</d=
iv>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void</div>
<div>@@ -573,7 &#43;575,8 @@ virtio_address_space_read(VirtIOPCIProxy *prox=
y, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;/* Make sure caller aligned buf properly */</div>
<div>&nbsp; &nbsp; &nbsp;assert(!(((uintptr_t)buf) &amp; (len - 1)));</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;memory_region_dispatch_read(mr, addr, &amp;val, len, ME=
MTXATTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp;memory_region_dispatch_read(mr, addr, &amp;val, SIZ=
E_MEMOP(len),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</di=
v>
<div>&nbsp; &nbsp; &nbsp;switch (len) {</div>
<div>&nbsp; &nbsp; &nbsp;case 1:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pci_set_byte(buf, val);</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156381048034795681btcom_--

