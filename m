Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyWho-00055J-6q
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 03:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38285)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWhi-00050A-F1
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:31:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWhe-0007rO-FR
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:31:18 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.237]:23503)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWh2-0007dD-5y; Fri, 16 Aug 2019 03:30:37 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 RDW083A010ED66.bt.com (10.187.98.36) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:29:38 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:30:34 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:30:34 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v7 11/42] memory: Access MemoryRegion with
 MemOp
Thread-Index: AQHVVAR9ZYg90QpGjUeRa3ureurxuw==
Date: Fri, 16 Aug 2019 07:30:34 +0000
Message-ID: <1565940633026.69822@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594063302669822btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.237
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v7 11/42] memory: Access
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
X-List-Received-Date: Fri, 16 Aug 2019 07:31:23 -0000

--_000_156594063302669822btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Convert memory_region_dispatch_{read|write} operand "unsigned size"
into a "MemOp op".

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h  | 20 ++++++++++++++------
 include/exec/memory.h |  9 +++++----
 memory.c              |  7 +++++--
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index dfd76a1..0a610b7 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -12,6 +12,8 @@
 #ifndef MEMOP_H
 #define MEMOP_H

+#include "qemu/host-utils.h"
+
 typedef enum MemOp {
     MO_8     =3D 0,
     MO_16    =3D 1,
@@ -107,14 +109,20 @@ typedef enum MemOp {
     MO_SSIZE =3D MO_SIZE | MO_SIGN,
 } MemOp;

+/* MemOp to size in bytes.  */
+static inline unsigned memop_size(MemOp op)
+{
+    return 1 << (op & MO_SIZE);
+}
+
 /* Size in bytes to MemOp.  */
-static inline unsigned size_memop(unsigned size)
+static inline MemOp size_memop(unsigned size)
 {
-    /*
-     * FIXME: No-op to aid conversion of memory_region_dispatch_{read|writ=
e}
-     * "unsigned size" operand into a "MemOp op".
-     */
-    return size;
+#ifdef CONFIG_DEBUG_TCG
+    /* Power of 2 up to 8.  */
+    assert((size & (size - 1)) =3D=3D 0 && size >=3D 1 && size <=3D 8);
+#endif
+    return ctz32(size);
 }

 #endif
diff --git a/include/exec/memory.h b/include/exec/memory.h
index bb0961d..975b86a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -19,6 +19,7 @@
 #include "exec/cpu-common.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
+#include "exec/memop.h"
 #include "exec/ramlist.h"
 #include "qemu/queue.h"
 #include "qemu/int128.h"
@@ -1731,13 +1732,13 @@ void mtree_info(bool flatview, bool dispatch_tree, =
bool owner);
  * @mr: #MemoryRegion to access
  * @addr: address within that region
  * @pval: pointer to uint64_t which the data is written to
- * @size: size of the access in bytes
+ * @op: size, sign, and endianness of the memory operation
  * @attrs: memory transaction attributes to use for the access
  */
 MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                         hwaddr addr,
                                         uint64_t *pval,
-                                        unsigned size,
+                                        MemOp op,
                                         MemTxAttrs attrs);
 /**
  * memory_region_dispatch_write: perform a write directly to the specified
@@ -1746,13 +1747,13 @@ MemTxResult memory_region_dispatch_read(MemoryRegio=
n *mr,
  * @mr: #MemoryRegion to access
  * @addr: address within that region
  * @data: data to write
- * @size: size of the access in bytes
+ * @op: size, sign, and endianness of the memory operation
  * @attrs: memory transaction attributes to use for the access
  */
 MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          hwaddr addr,
                                          uint64_t data,
-                                         unsigned size,
+                                         MemOp op,
                                          MemTxAttrs attrs);

 /**
diff --git a/memory.c b/memory.c
index 5d8c9a9..89ea4fb 100644
--- a/memory.c
+++ b/memory.c
@@ -1439,9 +1439,10 @@ static MemTxResult memory_region_dispatch_read1(Memo=
ryRegion *mr,
 MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
                                         hwaddr addr,
                                         uint64_t *pval,
-                                        unsigned size,
+                                        MemOp op,
                                         MemTxAttrs attrs)
 {
+    unsigned size =3D memop_size(op);
     MemTxResult r;

     if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
@@ -1483,9 +1484,11 @@ static bool memory_region_dispatch_write_eventfds(Me=
moryRegion *mr,
 MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          hwaddr addr,
                                          uint64_t data,
-                                         unsigned size,
+                                         MemOp op,
                                          MemTxAttrs attrs)
 {
+    unsigned size =3D memop_size(op);
+
     if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
         unassigned_mem_write(mr, addr, data, size);
         return MEMTX_DECODE_ERROR;
--
1.8.3.1

?


--_000_156594063302669822btcom_
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
<div><span style=3D"font-size: 12pt;">Convert memory_region_dispatch_{read|=
write} operand &quot;unsigned size&quot;</span><br>
</div>
<div>into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;include/exec/memop.h &nbsp;| 20 &#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------</div>
<div>&nbsp;include/exec/memory.h | &nbsp;9 &#43;&#43;&#43;&#43;&#43;----</d=
iv>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp=
;7 &#43;&#43;&#43;&#43;&#43;--</div>
<div>&nbsp;3 files changed, 24 insertions(&#43;), 12 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>index dfd76a1..0a610b7 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -12,6 &#43;12,8 @@</div>
<div>&nbsp;#ifndef MEMOP_H</div>
<div>&nbsp;#define MEMOP_H</div>
<div>&nbsp;</div>
<div>&#43;#include &quot;qemu/host-utils.h&quot;</div>
<div>&#43;</div>
<div>&nbsp;typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_8 &nbsp; &nbsp; =3D 0,</div>
<div>&nbsp; &nbsp; &nbsp;MO_16 &nbsp; &nbsp;=3D 1,</div>
<div>@@ -107,14 &#43;109,20 @@ typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>&nbsp;} MemOp;</div>
<div>&nbsp;</div>
<div>&#43;/* MemOp to size in bytes. &nbsp;*/</div>
<div>&#43;static inline unsigned memop_size(MemOp op)</div>
<div>&#43;{</div>
<div>&#43; &nbsp; &nbsp;return 1 &lt;&lt; (op &amp; MO_SIZE);</div>
<div>&#43;}</div>
<div>&#43;</div>
<div>&nbsp;/* Size in bytes to MemOp. &nbsp;*/</div>
<div>-static inline unsigned size_memop(unsigned size)</div>
<div>&#43;static inline MemOp size_memop(unsigned size)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;/*</div>
<div>- &nbsp; &nbsp; * FIXME: No-op to aid conversion of memory_region_disp=
atch_{read|write}</div>
<div>- &nbsp; &nbsp; * &quot;unsigned size&quot; operand into a &quot;MemOp=
 op&quot;.</div>
<div>- &nbsp; &nbsp; */</div>
<div>- &nbsp; &nbsp;return size;</div>
<div>&#43;#ifdef CONFIG_DEBUG_TCG</div>
<div>&#43; &nbsp; &nbsp;/* Power of 2 up to 8. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp;assert((size &amp; (size - 1)) =3D=3D 0 &amp;&amp; =
size &gt;=3D 1 &amp;&amp; size &lt;=3D 8);</div>
<div>&#43;#endif</div>
<div>&#43; &nbsp; &nbsp;return ctz32(size);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;#endif</div>
<div>diff --git a/include/exec/memory.h b/include/exec/memory.h</div>
<div>index bb0961d..975b86a 100644</div>
<div>--- a/include/exec/memory.h</div>
<div>&#43;&#43;&#43; b/include/exec/memory.h</div>
<div>@@ -19,6 &#43;19,7 @@</div>
<div>&nbsp;#include &quot;exec/cpu-common.h&quot;</div>
<div>&nbsp;#include &quot;exec/hwaddr.h&quot;</div>
<div>&nbsp;#include &quot;exec/memattrs.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;exec/ramlist.h&quot;</div>
<div>&nbsp;#include &quot;qemu/queue.h&quot;</div>
<div>&nbsp;#include &quot;qemu/int128.h&quot;</div>
<div>@@ -1731,13 &#43;1732,13 @@ void mtree_info(bool flatview, bool dispat=
ch_tree, bool owner);</div>
<div>&nbsp; * @mr: #MemoryRegion to access</div>
<div>&nbsp; * @addr: address within that region</div>
<div>&nbsp; * @pval: pointer to uint64_t which the data is written to</div>
<div>- * @size: size of the access in bytes</div>
<div>&#43; * @op: size, sign, and endianness of the memory operation</div>
<div>&nbsp; * @attrs: memory transaction attributes to use for the access</=
div>
<div>&nbsp; */</div>
<div>&nbsp;MemTxResult memory_region_dispatch_read(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;uint64_t *pval,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsi=
gned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;MemTxAttrs attrs);</div>
<div>&nbsp;/**</div>
<div>&nbsp; * memory_region_dispatch_write: perform a write directly to the=
 specified</div>
<div>@@ -1746,13 &#43;1747,13 @@ MemTxResult memory_region_dispatch_read(Me=
moryRegion *mr,</div>
<div>&nbsp; * @mr: #MemoryRegion to access</div>
<div>&nbsp; * @addr: address within that region</div>
<div>&nbsp; * @data: data to write</div>
<div>- * @size: size of the access in bytes</div>
<div>&#43; * @op: size, sign, and endianness of the memory operation</div>
<div>&nbsp; * @attrs: memory transaction attributes to use for the access</=
div>
<div>&nbsp; */</div>
<div>&nbsp;MemTxResult memory_region_dispatch_write(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; uint64_t data,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; uns=
igned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; MemTxAttrs attrs);</div>
<div>&nbsp;</div>
<div>&nbsp;/**</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 5d8c9a9..89ea4fb 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -1439,9 &#43;1439,10 @@ static MemTxResult memory_region_dispatch_r=
ead1(MemoryRegion *mr,</div>
<div>&nbsp;MemTxResult memory_region_dispatch_read(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;uint64_t *pval,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsi=
gned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;MemTxAttrs attrs)</div>
<div>&nbsp;{</div>
<div>&#43; &nbsp; &nbsp;unsigned size =3D memop_size(op);</div>
<div>&nbsp; &nbsp; &nbsp;MemTxResult r;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_access_valid(mr, addr, size, fa=
lse, attrs)) {</div>
<div>@@ -1483,9 &#43;1484,11 @@ static bool memory_region_dispatch_write_ev=
entfds(MemoryRegion *mr,</div>
<div>&nbsp;MemTxResult memory_region_dispatch_write(MemoryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; uint64_t data,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; uns=
igned size,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 MemOp op,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; MemTxAttrs attrs)</div>
<div>&nbsp;{</div>
<div>&#43; &nbsp; &nbsp;unsigned size =3D memop_size(op);</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_access_valid(mr, addr, size, tr=
ue, attrs)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unassigned_mem_write(mr, addr, data,=
 size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return MEMTX_DECODE_ERROR;</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594063302669822btcom_--

