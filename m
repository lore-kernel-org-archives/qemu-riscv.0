Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpabV-0004Y7-9S
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 11:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54873)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpabR-0004Xx-Kr
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:51:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpabP-0002BR-Bl
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:51:53 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.71]:17434)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpab1-0001fU-O5; Mon, 22 Jul 2019 11:51:29 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926076.bt.com (10.36.82.107) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 16:51:11 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:51:20 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:51:20 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v2 16/20] memory: Single byte swap along the
 I/O path
Thread-Index: AQHVQKVO0H+17st0okakbfi2+9jUgg==
Date: Mon, 22 Jul 2019 15:51:20 +0000
Message-ID: <1563810679138.99152@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381067913899152btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.71
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v2 16/20] memory: Single byte swap
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
X-List-Received-Date: Mon, 22 Jul 2019 15:51:56 -0000

--_000_156381067913899152btcom_
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
 accel/tcg/cputlb.c | 58 +++++++++++++++++++++++++-------------------------=
----
 memory.c           | 30 ++++++++++++++++------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 97d7a64..6f5262c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -881,7 +881,7 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, =
int size,

 static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                          int mmu_idx, target_ulong addr, uintptr_t retaddr=
,
-                         MMUAccessType access_type, int size)
+                         MMUAccessType access_type, MemOp op)
 {
     CPUState *cpu =3D env_cpu(env);
     hwaddr mr_offset;
@@ -906,14 +906,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBE=
ntry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_read(mr, mr_offset, &val, SIZE_MEMOP(size=
),
-                                    iotlbentry->attrs);
+    r =3D memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry-=
>attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;

-        cpu_transaction_failed(cpu, physaddr, addr, size, access_type,
+        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op), access=
_type,
                                mmu_idx, iotlbentry->attrs, r, retaddr);
     }
     if (locked) {
@@ -925,7 +924,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEnt=
ry *iotlbentry,

 static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                       int mmu_idx, uint64_t val, target_ulong addr,
-                      uintptr_t retaddr, int size)
+                      uintptr_t retaddr, MemOp op)
 {
     CPUState *cpu =3D env_cpu(env);
     hwaddr mr_offset;
@@ -947,15 +946,15 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntr=
y *iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_write(mr, mr_offset, val, SIZE_MEMOP(size=
),
-                                    iotlbentry->attrs);
+    r =3D memory_region_dispatch_write(mr, mr_offset, val, op, iotlbentry-=
>attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;

-        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_STORE,
-                               mmu_idx, iotlbentry->attrs, r, retaddr);
+        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op),
+                               MMU_DATA_STORE, mmu_idx, iotlbentry->attrs,=
 r,
+                               retaddr);
     }
     if (locked) {
         qemu_mutex_unlock_iothread();
@@ -1210,26 +1209,13 @@ static void *atomic_mmu_lookup(CPUArchState *env, t=
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
@@ -1260,6 +1246,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCG=
MemOpIdx oi,
     unsigned a_bits =3D get_alignment_bits(get_tcgmemop(oi));
     void *haddr;
     uint64_t res;
+    MemOp op;

     /* Handle CPU specific unaligned behaviour */
     if (addr & ((1 << a_bits) - 1)) {
@@ -1305,9 +1292,13 @@ load_helper(CPUArchState *env, target_ulong addr, TC=
GMemOpIdx oi,
             }
         }

-        res =3D io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
-                       mmu_idx, addr, retaddr, access_type, size);
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
@@ -1508,6 +1499,7 @@ store_helper(CPUArchState *env, target_ulong addr, ui=
nt64_t val,
     const size_t tlb_off =3D offsetof(CPUTLBEntry, addr_write);
     unsigned a_bits =3D get_alignment_bits(get_tcgmemop(oi));
     void *haddr;
+    MemOp op;

     /* Handle CPU specific unaligned behaviour */
     if (addr & ((1 << a_bits) - 1)) {
@@ -1553,9 +1545,13 @@ store_helper(CPUArchState *env, target_ulong addr, u=
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
-                  addr, retaddr, size);
+                  val, addr, retaddr, op);
         return;
     }

diff --git a/memory.c b/memory.c
index 73cb345..0aaa0a7 100644
--- a/memory.c
+++ b/memory.c
@@ -350,7 +350,7 @@ static bool memory_region_big_endian(MemoryRegion *mr)
 #endif
 }

-static bool memory_region_wrong_endianness(MemoryRegion *mr)
+static bool memory_region_endianness_inverted(MemoryRegion *mr)
 {
 #ifdef TARGET_WORDS_BIGENDIAN
     return mr->ops->endianness =3D=3D DEVICE_LITTLE_ENDIAN;
@@ -359,23 +359,27 @@ static bool memory_region_wrong_endianness(MemoryRegi=
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
@@ -1449,7 +1453,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion =
*mr,
     }

     r =3D memory_region_dispatch_read1(mr, addr, pval, size, attrs);
-    adjust_endianness(mr, pval, size);
+    adjust_endianness(mr, pval, op);
     return r;
 }

@@ -1492,7 +1496,7 @@ MemTxResult memory_region_dispatch_write(MemoryRegion=
 *mr,
         return MEMTX_DECODE_ERROR;
     }

-    adjust_endianness(mr, &data, size);
+    adjust_endianness(mr, &data, op);

     if ((!kvm_eventfds_enabled()) &&
         memory_region_dispatch_write_eventfds(mr, addr, data, size, attrs)=
) {
@@ -2338,7 +2342,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     }

     if (size) {
-        adjust_endianness(mr, &mrfd.data, size);
+        adjust_endianness(mr, &mrfd.data, SIZE_MEMOP(size));
     }
     memory_region_transaction_begin();
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
@@ -2373,7 +2377,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     unsigned i;

     if (size) {
-        adjust_endianness(mr, &mrfd.data, size);
+        adjust_endianness(mr, &mrfd.data, SIZE_MEMOP(size));
     }
     memory_region_transaction_begin();
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
--
1.8.3.1




--_000_156381067913899152btcom_
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
<div>&nbsp;accel/tcg/cputlb.c | 58 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;-----------------------------</div>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 30 &#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----------=
--</div>
<div>&nbsp;2 files changed, 44 insertions(&#43;), 44 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index 97d7a64..6f5262c 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -881,7 &#43;881,7 @@ static void tlb_fill(CPUState *cpu, target_ulo=
ng addr, int size,</div>
<div>&nbsp;</div>
<div>&nbsp;static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlb=
entry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; int mmu_idx, target_ulong addr, uintptr_t retaddr,</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; MMUAccessType access_type, int size)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; MMUAccessType access_type, MemOp op)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CPUState *cpu =3D env_cpu(env);</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr mr_offset;</div>
<div>@@ -906,14 &#43;906,13 @@ static uint64_t io_readx(CPUArchState *env, =
CPUIOTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_lock_iothread();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;locked =3D true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, mr_offset, &amp;v=
al, SIZE_MEMOP(size),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iotlbentry-&gt;att=
rs);</div>
<div>&#43; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, mr_offset, &a=
mp;val, op, iotlbentry-&gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (r !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr physaddr =3D mr_offset &#43;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_address_space -</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_region;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;cpu_transaction_failed(cpu, physaddr, add=
r, size, access_type,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;cpu_transaction_failed(cpu, physaddr,=
 addr, MEMOP_SIZE(op), access_type,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mmu_idx, iotlbentry-&gt;attrs, r,=
 retaddr);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (locked) {</div>
<div>@@ -925,7 &#43;924,7 @@ static uint64_t io_readx(CPUArchState *env, CP=
UIOTLBEntry *iotlbentry,</div>
<div>&nbsp;</div>
<div>&nbsp;static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbent=
ry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;int mmu_idx, uint64_t val, target_ulong addr,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;uintptr_t retaddr, int size)</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;uintptr_t retaddr, MemOp op)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CPUState *cpu =3D env_cpu(env);</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr mr_offset;</div>
<div>@@ -947,15 &#43;946,15 @@ static void io_writex(CPUArchState *env, CPU=
IOTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_lock_iothread();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;locked =3D true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, mr_offset, val, =
SIZE_MEMOP(size),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iotlbentry-&gt;att=
rs);</div>
<div>&#43; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, mr_offset, v=
al, op, iotlbentry-&gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (r !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr physaddr =3D mr_offset &#43;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_address_space -</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_region;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;cpu_transaction_failed(cpu, physaddr, add=
r, size, MMU_DATA_STORE,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mmu_idx, iotlbentry-&gt;attrs, r, reta=
ddr);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;cpu_transaction_failed(cpu, physaddr,=
 addr, MEMOP_SIZE(op),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MMU_DATA_STORE, mmu_idx, iotlbentr=
y-&gt;attrs, r,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; retaddr);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (locked) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_unlock_iothread();</div>
<div>@@ -1210,26 &#43;1209,13 @@ static void *atomic_mmu_lookup(CPUArchStat=
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
<div>@@ -1260,6 &#43;1246,7 @@ load_helper(CPUArchState *env, target_ulong =
addr, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(get_tcgmemo=
p(oi));</div>
<div>&nbsp; &nbsp; &nbsp;void *haddr;</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t res;</div>
<div>&#43; &nbsp; &nbsp;MemOp op;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Handle CPU specific unaligned behaviour */</div=
>
<div>&nbsp; &nbsp; &nbsp;if (addr &amp; ((1 &lt;&lt; a_bits) - 1)) {</div>
<div>@@ -1305,9 &#43;1292,13 @@ load_helper(CPUArchState *env, target_ulong=
 addr, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;res =3D io_readx(env, &amp;env_tlb(env)-&=
gt;d[mmu_idx].iotlb[index],</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; mmu_idx, addr, retaddr, access_type, size);</div>
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
<div>@@ -1508,6 &#43;1499,7 @@ store_helper(CPUArchState *env, target_ulong=
 addr, uint64_t val,</div>
<div>&nbsp; &nbsp; &nbsp;const size_t tlb_off =3D offsetof(CPUTLBEntry, add=
r_write);</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(get_tcgmemo=
p(oi));</div>
<div>&nbsp; &nbsp; &nbsp;void *haddr;</div>
<div>&#43; &nbsp; &nbsp;MemOp op;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Handle CPU specific unaligned behaviour */</div=
>
<div>&nbsp; &nbsp; &nbsp;if (addr &amp; ((1 &lt;&lt; a_bits) - 1)) {</div>
<div>@@ -1553,9 &#43;1545,13 @@ store_helper(CPUArchState *env, target_ulon=
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
retaddr, size);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;va=
l, addr, retaddr, op);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 73cb345..0aaa0a7 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -350,7 &#43;350,7 @@ static bool memory_region_big_endian(MemoryReg=
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
<div>@@ -359,23 &#43;359,27 @@ static bool memory_region_wrong_endianness(M=
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
<div>@@ -1449,7 &#43;1453,7 @@ MemTxResult memory_region_dispatch_read(Memo=
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
<div>@@ -1492,7 &#43;1496,7 @@ MemTxResult memory_region_dispatch_write(Mem=
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
<div>@@ -2338,7 &#43;2342,7 @@ void memory_region_add_eventfd(MemoryRegion =
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
<div>@@ -2373,7 &#43;2377,7 @@ void memory_region_del_eventfd(MemoryRegion =
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

--_000_156381067913899152btcom_--

