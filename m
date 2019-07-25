Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqYjJ-0003mD-Po
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 04:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37830)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqYjG-0003kl-Ba
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 04:03:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqYjC-0002tW-9k
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 04:03:56 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.78]:42962)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqYj0-0002p0-3X; Thu, 25 Jul 2019 04:03:42 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926083.bt.com (10.36.82.114) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 09:03:36 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 09:03:39 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 09:03:39 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>, <mst@redhat.com>,
 <palmer@sifive.com>, <mark.cave-ayland@ilande.co.uk>,
 <Alistair.Francis@wdc.com>, <arikalo@wavecomp.com>, <david@redhat.com>,
 <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>, <rth@twiddle.net>,
 <atar4qemu@gmail.com>, <ehabkost@redhat.com>, <sw@weilnetz.de>,
 <alex.williamson@redhat.com>, <qemu-arm@nongnu.org>,
 <david@gibson.dropbear.id.au>, <qemu-riscv@nongnu.org>, <cohuck@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-ppc@nongnu.org>, <amarkovic@wavecomp.com>,
 <pbonzini@redhat.com>, <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v4 08/15] exec: Access MemoryRegion with
 MemOp
Thread-Index: AQHVQr93wxTSoWweskCQZqLM/PqTCA==
Date: Thu, 25 Jul 2019 08:03:39 +0000
Message-ID: <1564041819246.8955@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>, 
 <1563810716254.18886@bt.com>, <1564038073754.91133@bt.com>,
 <1564041524365.23360@bt.com>
In-Reply-To: <1564041524365.23360@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_15640418192468955btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.78
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v4 08/15] exec: Access
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
X-List-Received-Date: Thu, 25 Jul 2019 08:04:00 -0000

--_000_15640418192468955btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 exec.c            |  6 ++++--
 memory_ldst.inc.c | 18 +++++++++---------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/exec.c b/exec.c
index 3e78de3..5013864 100644
--- a/exec.c
+++ b/exec.c
@@ -3334,7 +3334,8 @@ static MemTxResult flatview_write_continue(FlatView *=
fv, hwaddr addr,
             /* XXX: could force current_cpu to NULL to avoid
                potential bugs */
             val =3D ldn_p(buf, l);
-            result |=3D memory_region_dispatch_write(mr, addr1, val, l, at=
trs);
+            result |=3D memory_region_dispatch_write(mr, addr1, val,
+                                                   SIZE_MEMOP(l), attrs);
         } else {
             /* RAM case */
             ptr =3D qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
@@ -3395,7 +3396,8 @@ MemTxResult flatview_read_continue(FlatView *fv, hwad=
dr addr,
             /* I/O case */
             release_lock |=3D prepare_mmio_access(mr);
             l =3D memory_access_size(mr, l, addr1);
-            result |=3D memory_region_dispatch_read(mr, addr1, &val, l, at=
trs);
+            result |=3D memory_region_dispatch_read(mr, addr1, &val,
+                                                  SIZE_MEMOP(l), attrs);
             stn_p(buf, l, val);
         } else {
             /* RAM case */
diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
index acf865b..e073cf9 100644
--- a/memory_ldst.inc.c
+++ b/memory_ldst.inc.c
@@ -38,7 +38,7 @@ static inline uint32_t glue(address_space_ldl_internal, S=
UFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 4, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(4), =
attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
             val =3D bswap32(val);
@@ -114,7 +114,7 @@ static inline uint64_t glue(address_space_ldq_internal,=
 SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 8, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(8), =
attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
             val =3D bswap64(val);
@@ -188,7 +188,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 1, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(1), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -224,7 +224,7 @@ static inline uint32_t glue(address_space_lduw_internal=
, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, 2, attrs);
+        r =3D memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(2), =
attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D DEVICE_LITTLE_ENDIAN) {
             val =3D bswap16(val);
@@ -300,7 +300,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL=
,
     if (l < 4 || !memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);

-        r =3D memory_region_dispatch_write(mr, addr1, val, 4, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(4), =
attrs);
     } else {
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
         stl_p(ptr, val);
@@ -346,7 +346,7 @@ static inline void glue(address_space_stl_internal, SUF=
FIX)(ARG1_DECL,
             val =3D bswap32(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, 4, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(4), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -408,7 +408,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
     mr =3D TRANSLATE(addr, &addr1, &l, true, attrs);
     if (!memory_access_is_direct(mr, true)) {
         release_lock |=3D prepare_mmio_access(mr);
-        r =3D memory_region_dispatch_write(mr, addr1, val, 1, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(1), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -451,7 +451,7 @@ static inline void glue(address_space_stw_internal, SUF=
FIX)(ARG1_DECL,
             val =3D bswap16(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, 2, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(2), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -524,7 +524,7 @@ static void glue(address_space_stq_internal, SUFFIX)(AR=
G1_DECL,
             val =3D bswap64(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, 8, attrs);
+        r =3D memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(8), =
attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
--
1.8.3.1




--_000_15640418192468955btcom_
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
<div>&nbsp;exec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;6 &#43;&=
#43;&#43;&#43;--</div>
<div>&nbsp;memory_ldst.inc.c | 18 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;---------</div>
<div>&nbsp;2 files changed, 13 insertions(&#43;), 11 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/exec.c b/exec.c</div>
<div>index 3e78de3..5013864 100644</div>
<div>--- a/exec.c</div>
<div>&#43;&#43;&#43; b/exec.c</div>
<div>@@ -3334,7 &#43;3334,8 @@ static MemTxResult flatview_write_continue(F=
latView *fv, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* XXX: could force cu=
rrent_cpu to NULL to avoid</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; potential bugs=
 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D ldn_p(buf, l);=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_region_d=
ispatch_write(mr, addr1, val, l, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_regi=
on_dispatch_write(mr, addr1, val,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SIZE_MEMOP(l), attrs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_ram_ptr_l=
ength(mr-&gt;ram_block, addr1, &amp;l, false);</div>
<div>@@ -3395,7 &#43;3396,8 @@ MemTxResult flatview_read_continue(FlatView =
*fv, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prep=
are_mmio_access(mr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;l =3D memory_access_si=
ze(mr, l, addr1);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_region_d=
ispatch_read(mr, addr1, &amp;val, l, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_regi=
on_dispatch_read(mr, addr1, &amp;val,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SIZE_MEMOP(l), attrs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stn_p(buf, l, val);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c</div>
<div>index acf865b..e073cf9 100644</div>
<div>--- a/memory_ldst.inc.c</div>
<div>&#43;&#43;&#43; b/memory_ldst.inc.c</div>
<div>@@ -38,7 &#43;38,7 @@ static inline uint32_t glue(address_space_ldl_in=
ternal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 4, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, SIZE_MEMOP(4), attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDI=
AN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>@@ -114,7 &#43;114,7 @@ static inline uint64_t glue(address_space_ldq_=
internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 8, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, SIZE_MEMOP(8), attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDI=
AN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>@@ -188,7 &#43;188,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1=
_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 1, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, SIZE_MEMOP(1), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -224,7 &#43;224,7 @@ static inline uint32_t glue(address_space_lduw=
_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, 2, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, SIZE_MEMOP(2), attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D DEVICE_LITTLE_ENDI=
AN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>@@ -300,7 &#43;300,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(=
ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp;if (l &lt; 4 || !memory_access_is_direct(mr, true)=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 4, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, SIZE_MEMOP(4), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stl_p(ptr, val);</div>
<div>@@ -346,7 &#43;346,7 @@ static inline void glue(address_space_stl_inte=
rnal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 4, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, SIZE_MEMOP(4), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -408,7 &#43;408,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL=
,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D TRANSLATE(addr, &amp;addr1, &amp;l, true, a=
ttrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_access_is_direct(mr, true)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 1, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, SIZE_MEMOP(1), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -451,7 &#43;451,7 @@ static inline void glue(address_space_stw_inte=
rnal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 2, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, SIZE_MEMOP(2), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -524,7 &#43;524,7 @@ static void glue(address_space_stq_internal, S=
UFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, 8, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, SIZE_MEMOP(8), attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_15640418192468955btcom_--

