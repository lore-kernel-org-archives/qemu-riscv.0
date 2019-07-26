Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqu1w-00064g-0D
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 02:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56324)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqu1r-0005n3-LM
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 02:48:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqu1n-00062j-Dx
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 02:48:34 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.77]:51296)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqu1G-0005Rv-G8; Fri, 26 Jul 2019 02:48:00 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926082.bt.com (10.36.82.113) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 26
 Jul 2019 07:47:46 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 26 Jul 2019 07:47:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 26 Jul
 2019 07:47:47 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>,
 <sagark@eecs.berkeley.edu>, <david@redhat.com>, <palmer@sifive.com>,
 <mark.cave-ayland@ilande.co.uk>, <Alistair.Francis@wdc.com>,
 <edgar.iglesias@gmail.com>, <arikalo@wavecomp.com>, <mst@redhat.com>,
 <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>, <rth@twiddle.net>,
 <atar4qemu@gmail.com>, <ehabkost@redhat.com>, <alex.williamson@redhat.com>,
 <qemu-arm@nongnu.org>, <stefanha@redhat.com>, <shorne@gmail.com>,
 <david@gibson.dropbear.id.au>, <qemu-riscv@nongnu.org>,
 <qemu-s390x@nongnu.org>, <kbastian@mail.uni-paderborn.de>,
 <cohuck@redhat.com>, <laurent@vivier.eu>, <qemu-ppc@nongnu.org>,
 <amarkovic@wavecomp.com>, <pbonzini@redhat.com>, <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v5 11/15] memory: Single byte swap along the
 I/O path
Thread-Index: AQHVQ34JFcVl51mE9EO/EnEfwkEv1Q==
Date: Fri, 26 Jul 2019 06:47:47 +0000
Message-ID: <1564123667210.66446@bt.com>
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156412366721066446btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.77
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v5 11/15] memory: Single byte swap
 along the I/O path
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
X-List-Received-Date: Fri, 26 Jul 2019 06:48:38 -0000

--_000_156412366721066446btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Now that MemOp has been pushed down into the memory API, we can
collapse the two byte swaps adjust_endianness and handle_bswap into
the former.

Collapsing byte swaps along the I/O path enables additional endian
inversion logic, e.g. SPARC64 Invert Endian TTE bit, with redundant
byte swaps cancelling out.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 accel/tcg/cputlb.c | 41 +++++++++++++++++++----------------------
 memory.c           | 30 +++++++++++++++++-------------
 2 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5d88cec..e61b1eb 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1209,26 +1209,13 @@ static void *atomic_mmu_lookup(CPUArchState *env, t=
arget_ulong addr,
 #endif

 /*
- * Byte Swap Helper
+ * Byte Swap Checker
  *
- * This should all dead code away depending on the build host and
- * access type.
+ * Dead code should all go away depending on the build host and access typ=
e.
  */
-
-static inline uint64_t handle_bswap(uint64_t val, int size, bool big_endia=
n)
+static inline bool need_bswap(bool big_endian)
 {
-    if ((big_endian && NEED_BE_BSWAP) || (!big_endian && NEED_LE_BSWAP)) {
-        switch (size) {
-        case 1: return val;
-        case 2: return bswap16(val);
-        case 4: return bswap32(val);
-        case 8: return bswap64(val);
-        default:
-            g_assert_not_reached();
-        }
-    } else {
-        return val;
-    }
+    return (big_endian && NEED_BE_BSWAP) || (!big_endian && NEED_LE_BSWAP)=
;
 }

 /*
@@ -1259,6 +1246,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCG=
MemOpIdx oi,
     unsigned a_bits =3D get_alignment_bits(get_memop(oi));
     void *haddr;
     uint64_t res;
+    MemOp op;

     /* Handle CPU specific unaligned behaviour */
     if (addr & ((1 << a_bits) - 1)) {
@@ -1304,9 +1292,13 @@ load_helper(CPUArchState *env, target_ulong addr, TC=
GMemOpIdx oi,
             }
         }

-        res =3D io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
-                       mmu_idx, addr, retaddr, access_type, SIZE_MEMOP(siz=
e));
-        return handle_bswap(res, size, big_endian);
+        op =3D SIZE_MEMOP(size);
+        if (need_bswap(big_endian)) {
+            op ^=3D MO_BSWAP;
+        }
+
+        return io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
+                       mmu_idx, addr, retaddr, access_type, op);
     }

     /* Handle slow unaligned access (it spans two pages or IO).  */
@@ -1507,6 +1499,7 @@ store_helper(CPUArchState *env, target_ulong addr, ui=
nt64_t val,
     const size_t tlb_off =3D offsetof(CPUTLBEntry, addr_write);
     unsigned a_bits =3D get_alignment_bits(get_memop(oi));
     void *haddr;
+    MemOp op;

     /* Handle CPU specific unaligned behaviour */
     if (addr & ((1 << a_bits) - 1)) {
@@ -1552,9 +1545,13 @@ store_helper(CPUArchState *env, target_ulong addr, u=
int64_t val,
             }
         }

+        op =3D SIZE_MEMOP(size);
+        if (need_bswap(big_endian)) {
+            op ^=3D MO_BSWAP;
+        }
+
         io_writex(env, &env_tlb(env)->d[mmu_idx].iotlb[index], mmu_idx,
-                  handle_bswap(val, size, big_endian),
-                  addr, retaddr, SIZE_MEMOP(size));
+                  val, addr, retaddr, op);
         return;
     }

diff --git a/memory.c b/memory.c
index 6982e19..0277d3d 100644
--- a/memory.c
+++ b/memory.c
@@ -352,7 +352,7 @@ static bool memory_region_big_endian(MemoryRegion *mr)
 #endif
 }

-static bool memory_region_wrong_endianness(MemoryRegion *mr)
+static bool memory_region_endianness_inverted(MemoryRegion *mr)
 {
 #ifdef TARGET_WORDS_BIGENDIAN
     return mr->ops->endianness =3D=3D DEVICE_LITTLE_ENDIAN;
@@ -361,23 +361,27 @@ static bool memory_region_wrong_endianness(MemoryRegi=
on *mr)
 #endif
 }

-static void adjust_endianness(MemoryRegion *mr, uint64_t *data, unsigned s=
ize)
+static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
 {
-    if (memory_region_wrong_endianness(mr)) {
-        switch (size) {
-        case 1:
+    if (memory_region_endianness_inverted(mr)) {
+        op ^=3D MO_BSWAP;
+    }
+
+    if (op & MO_BSWAP) {
+        switch (op & MO_SIZE) {
+        case MO_8:
             break;
-        case 2:
+        case MO_16:
             *data =3D bswap16(*data);
             break;
-        case 4:
+        case MO_32:
             *data =3D bswap32(*data);
             break;
-        case 8:
+        case MO_64:
             *data =3D bswap64(*data);
             break;
         default:
-            abort();
+            g_assert_not_reached();
         }
     }
 }
@@ -1451,7 +1455,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion =
*mr,
     }

     r =3D memory_region_dispatch_read1(mr, addr, pval, size, attrs);
-    adjust_endianness(mr, pval, size);
+    adjust_endianness(mr, pval, op);
     return r;
 }

@@ -1494,7 +1498,7 @@ MemTxResult memory_region_dispatch_write(MemoryRegion=
 *mr,
         return MEMTX_DECODE_ERROR;
     }

-    adjust_endianness(mr, &data, size);
+    adjust_endianness(mr, &data, op);

     if ((!kvm_eventfds_enabled()) &&
         memory_region_dispatch_write_eventfds(mr, addr, data, size, attrs)=
) {
@@ -2340,7 +2344,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     }

     if (size) {
-        adjust_endianness(mr, &mrfd.data, size);
+        adjust_endianness(mr, &mrfd.data, SIZE_MEMOP(size));
     }
     memory_region_transaction_begin();
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
@@ -2375,7 +2379,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     unsigned i;

     if (size) {
-        adjust_endianness(mr, &mrfd.data, size);
+        adjust_endianness(mr, &mrfd.data, SIZE_MEMOP(size));
     }
     memory_region_transaction_begin();
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
--
1.8.3.1




--_000_156412366721066446btcom_
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
<div><span style=3D"font-size: 12pt;">Now that MemOp has been pushed down i=
nto the memory API, we can</span><br>
</div>
<div>collapse the two byte swaps adjust_endianness and handle_bswap into</d=
iv>
<div>the former.</div>
<div><br>
</div>
<div>Collapsing byte swaps along the I/O path enables additional endian</di=
v>
<div>inversion logic, e.g. SPARC64 Invert Endian TTE bit, with redundant</d=
iv>
<div>byte swaps cancelling out.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;accel/tcg/cputlb.c | 41 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------------------=
--</div>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 30 &#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----=
--------</div>
<div>&nbsp;2 files changed, 36 insertions(&#43;), 35 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index 5d88cec..e61b1eb 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -1209,26 &#43;1209,13 @@ static void *atomic_mmu_lookup(CPUArchStat=
e *env, target_ulong addr,</div>
<div>&nbsp;#endif</div>
<div>&nbsp;</div>
<div>&nbsp;/*</div>
<div>- * Byte Swap Helper</div>
<div>&#43; * Byte Swap Checker</div>
<div>&nbsp; *</div>
<div>- * This should all dead code away depending on the build host and</di=
v>
<div>- * access type.</div>
<div>&#43; * Dead code should all go away depending on the build host and a=
ccess type.</div>
<div>&nbsp; */</div>
<div>-</div>
<div>-static inline uint64_t handle_bswap(uint64_t val, int size, bool big_=
endian)</div>
<div>&#43;static inline bool need_bswap(bool big_endian)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;if ((big_endian &amp;&amp; NEED_BE_BSWAP) || (!big_endi=
an &amp;&amp; NEED_LE_BSWAP)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 1: return val;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 2: return bswap16(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 4: return bswap32(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 8: return bswap64(val);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert_not_reached();</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return val;</div>
<div>- &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;return (big_endian &amp;&amp; NEED_BE_BSWAP) || (!b=
ig_endian &amp;&amp; NEED_LE_BSWAP);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/*</div>
<div>@@ -1259,6 &#43;1246,7 @@ load_helper(CPUArchState *env, target_ulong =
addr, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(get_memop(o=
i));</div>
<div>&nbsp; &nbsp; &nbsp;void *haddr;</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t res;</div>
<div>&#43; &nbsp; &nbsp;MemOp op;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Handle CPU specific unaligned behaviour */</div=
>
<div>&nbsp; &nbsp; &nbsp;if (addr &amp; ((1 &lt;&lt; a_bits) - 1)) {</div>
<div>@@ -1304,9 &#43;1292,13 @@ load_helper(CPUArchState *env, target_ulong=
 addr, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;res =3D io_readx(env, &amp;env_tlb(env)-&=
gt;d[mmu_idx].iotlb[index],</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; mmu_idx, addr, retaddr, access_type, SIZE_MEMOP(size));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return handle_bswap(res, size, big_endian=
);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;op =3D SIZE_MEMOP(size);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (need_bswap(big_endian)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op ^=3D MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return io_readx(env, &amp;env_tlb(env=
)-&gt;d[mmu_idx].iotlb[index],</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; mmu_idx, addr, retaddr, access_type, op);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Handle slow unaligned access (it spans two page=
s or IO). &nbsp;*/</div>
<div>@@ -1507,6 &#43;1499,7 @@ store_helper(CPUArchState *env, target_ulong=
 addr, uint64_t val,</div>
<div>&nbsp; &nbsp; &nbsp;const size_t tlb_off =3D offsetof(CPUTLBEntry, add=
r_write);</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(get_memop(o=
i));</div>
<div>&nbsp; &nbsp; &nbsp;void *haddr;</div>
<div>&#43; &nbsp; &nbsp;MemOp op;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Handle CPU specific unaligned behaviour */</div=
>
<div>&nbsp; &nbsp; &nbsp;if (addr &amp; ((1 &lt;&lt; a_bits) - 1)) {</div>
<div>@@ -1552,9 &#43;1545,13 @@ store_helper(CPUArchState *env, target_ulon=
g addr, uint64_t val,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;op =3D SIZE_MEMOP(size);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (need_bswap(big_endian)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op ^=3D MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;io_writex(env, &amp;env_tlb(env)-&gt=
;d[mmu_idx].iotlb[index], mmu_idx,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;handle=
_bswap(val, size, big_endian),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addr, =
retaddr, SIZE_MEMOP(size));</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;va=
l, addr, retaddr, op);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 6982e19..0277d3d 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -352,7 &#43;352,7 @@ static bool memory_region_big_endian(MemoryReg=
ion *mr)</div>
<div>&nbsp;#endif</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static bool memory_region_wrong_endianness(MemoryRegion *mr)</div>
<div>&#43;static bool memory_region_endianness_inverted(MemoryRegion *mr)</=
div>
<div>&nbsp;{</div>
<div>&nbsp;#ifdef TARGET_WORDS_BIGENDIAN</div>
<div>&nbsp; &nbsp; &nbsp;return mr-&gt;ops-&gt;endianness =3D=3D DEVICE_LIT=
TLE_ENDIAN;</div>
<div>@@ -361,23 &#43;361,27 @@ static bool memory_region_wrong_endianness(M=
emoryRegion *mr)</div>
<div>&nbsp;#endif</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static void adjust_endianness(MemoryRegion *mr, uint64_t *data, unsig=
ned size)</div>
<div>&#43;static void adjust_endianness(MemoryRegion *mr, uint64_t *data, M=
emOp op)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;if (memory_region_wrong_endianness(mr)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 1:</div>
<div>&#43; &nbsp; &nbsp;if (memory_region_endianness_inverted(mr)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;op ^=3D MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;if (op &amp; MO_BSWAP) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;switch (op &amp; MO_SIZE) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 2:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*data =3D bswap16(*dat=
a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 4:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*data =3D bswap32(*dat=
a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case 8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*data =3D bswap64(*dat=
a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;abort();</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert_not_reached();=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>@@ -1451,7 &#43;1455,7 @@ MemTxResult memory_region_dispatch_read(Memo=
ryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read1(mr, addr, pval,=
 size, attrs);</div>
<div>- &nbsp; &nbsp;adjust_endianness(mr, pval, size);</div>
<div>&#43; &nbsp; &nbsp;adjust_endianness(mr, pval, op);</div>
<div>&nbsp; &nbsp; &nbsp;return r;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1494,7 &#43;1498,7 @@ MemTxResult memory_region_dispatch_write(Mem=
oryRegion *mr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return MEMTX_DECODE_ERROR;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;adjust_endianness(mr, &amp;data, size);</div>
<div>&#43; &nbsp; &nbsp;adjust_endianness(mr, &amp;data, op);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if ((!kvm_eventfds_enabled()) &amp;&amp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_write_eventfd=
s(mr, addr, data, size, attrs)) {</div>
<div>@@ -2340,7 &#43;2344,7 @@ void memory_region_add_eventfd(MemoryRegion =
*mr,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;adjust_endianness(mr, &amp;mrfd.data, siz=
e);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;adjust_endianness(mr, &amp;mrfd.data,=
 SIZE_MEMOP(size));</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;memory_region_transaction_begin();</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; mr-&gt;ioeventfd_nb; &#43;&#4=
3;i) {</div>
<div>@@ -2375,7 &#43;2379,7 @@ void memory_region_del_eventfd(MemoryRegion =
*mr,</div>
<div>&nbsp; &nbsp; &nbsp;unsigned i;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;adjust_endianness(mr, &amp;mrfd.data, siz=
e);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;adjust_endianness(mr, &amp;mrfd.data,=
 SIZE_MEMOP(size));</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;memory_region_transaction_begin();</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; mr-&gt;ioeventfd_nb; &#43;&#4=
3;i) {</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156412366721066446btcom_--

