Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyWpl-000547-HV
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 03:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWpY-0004vx-T4
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:39:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWpO-0003nJ-H8
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:39:22 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.236]:32936)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWoJ-0003L4-43; Fri, 16 Aug 2019 03:38:07 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 RDW083A009ED65.bt.com (10.187.98.35) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:34:11 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:38:04 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:38:04 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v7 36/42] memory: Access MemoryRegion with
 endianness
Thread-Index: AQHVVAWJ7BwJCpYh+06Xhz6iL6kqLw==
Date: Fri, 16 Aug 2019 07:38:04 +0000
Message-ID: <1565941083234.39909@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594108323439909btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.236
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v7 36/42] memory: Access
 MemoryRegion with endianness
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
X-List-Received-Date: Fri, 16 Aug 2019 07:39:32 -0000

--_000_156594108323439909btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation for collapsing the two byte swaps adjust_endianness and
handle_bswap into the former.

Call memory_region_dispatch_{read|write} with endianness encoded into
the "MemOp op" operand.

This patch does not change any behaviour as
memory_region_dispatch_{read|write} is yet to handle the endianness.

Once it does handle endianness, callers with byte swaps can collapse
them into adjust_endianness.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 accel/tcg/cputlb.c       |  6 ++++--
 exec.c                   |  5 +++--
 hw/intc/armv7m_nvic.c    | 15 ++++++++-------
 hw/s390x/s390-pci-inst.c |  6 ++++--
 hw/vfio/pci-quirks.c     |  5 +++--
 hw/virtio/virtio-pci.c   |  6 ++++--
 memory_ldst.inc.c        | 18 ++++++++++++------
 7 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 6c83878..0aff6a3 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -906,7 +906,8 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEnt=
ry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_read(mr, mr_offset, &val, size_memop(size=
),
+    r =3D memory_region_dispatch_read(mr, mr_offset, &val,
+                                    size_memop(size) | MO_TE,
                                     iotlbentry->attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
@@ -947,7 +948,8 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry =
*iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_write(mr, mr_offset, val, size_memop(size=
),
+    r =3D memory_region_dispatch_write(mr, mr_offset, val,
+                                     size_memop(size) | MO_TE,
                                      iotlbentry->attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
diff --git a/exec.c b/exec.c
index 303f9a7..562fb5b 100644
--- a/exec.c
+++ b/exec.c
@@ -3335,7 +3335,8 @@ static MemTxResult flatview_write_continue(FlatView *=
fv, hwaddr addr,
                potential bugs */
             val =3D ldn_p(buf, l);
             result |=3D memory_region_dispatch_write(mr, addr1, val,
-                                                   size_memop(l), attrs);
+                                                   size_memop(l) | MO_TE,
+                                                   attrs);
         } else {
             /* RAM case */
             ptr =3D qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
@@ -3397,7 +3398,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hwad=
dr addr,
             release_lock |=3D prepare_mmio_access(mr);
             l =3D memory_access_size(mr, l, addr1);
             result |=3D memory_region_dispatch_read(mr, addr1, &val,
-                                                  size_memop(l), attrs);
+                                                  size_memop(l) | MO_TE, a=
ttrs);
             stn_p(buf, l, val);
         } else {
             /* RAM case */
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 975d7cc..e150f9a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2346,8 +2346,8 @@ static MemTxResult nvic_sysreg_ns_write(void *opaque,=
 hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region=
 */
         attrs.secure =3D 0;
-        return memory_region_dispatch_write(mr, addr, value, size_memop(si=
ze),
-                                            attrs);
+        return memory_region_dispatch_write(mr, addr, value,
+                                            size_memop(size) | MO_TE, attr=
s);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2366,8 +2366,8 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, =
hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region=
 */
         attrs.secure =3D 0;
-        return memory_region_dispatch_read(mr, addr, data, size_memop(size=
),
-                                           attrs);
+        return memory_region_dispatch_read(mr, addr, data,
+                                           size_memop(size) | MO_TE, attrs=
);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2393,8 +2393,8 @@ static MemTxResult nvic_systick_write(void *opaque, h=
waddr addr,

     /* Direct the access to the correct systick */
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]=
), 0);
-    return memory_region_dispatch_write(mr, addr, value, size_memop(size),
-                                        attrs);
+    return memory_region_dispatch_write(mr, addr, value,
+                                        size_memop(size) | MO_TE, attrs);
 }

 static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
@@ -2406,7 +2406,8 @@ static MemTxResult nvic_systick_read(void *opaque, hw=
addr addr,

     /* Direct the access to the correct systick */
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]=
), 0);
-    return memory_region_dispatch_read(mr, addr, data, size_memop(size), a=
ttrs);
+    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | =
MO_TE,
+                                       attrs);
 }

 static const MemoryRegionOps nvic_systick_ops =3D {
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 0e92a37..272cb28 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -373,7 +373,8 @@ static MemTxResult zpci_read_bar(S390PCIBusDevice *pbde=
v, uint8_t pcias,
     mr =3D pbdev->pdev->io_regions[pcias].memory;
     mr =3D s390_get_subregion(mr, offset, len);
     offset -=3D mr->addr;
-    return memory_region_dispatch_read(mr, offset, data, size_memop(len),
+    return memory_region_dispatch_read(mr, offset, data,
+                                       size_memop(len) | MO_LE,
                                        MEMTXATTRS_UNSPECIFIED);
 }

@@ -472,7 +473,8 @@ static MemTxResult zpci_write_bar(S390PCIBusDevice *pbd=
ev, uint8_t pcias,
     mr =3D pbdev->pdev->io_regions[pcias].memory;
     mr =3D s390_get_subregion(mr, offset, len);
     offset -=3D mr->addr;
-    return memory_region_dispatch_write(mr, offset, data, size_memop(len),
+    return memory_region_dispatch_write(mr, offset, data,
+                                        size_memop(len) | MO_LE,
                                         MEMTXATTRS_UNSPECIFIED);
 }

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index d5c0268..53db1c3 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1072,7 +1072,8 @@ static void vfio_rtl8168_quirk_address_write(void *op=
aque, hwaddr addr,

                 /* Write to the proper guest MSI-X table instead */
                 memory_region_dispatch_write(&vdev->pdev.msix_table_mmio,
-                                             offset, val, size_memop(size)=
,
+                                             offset, val,
+                                             size_memop(size) | MO_LE,
                                              MEMTXATTRS_UNSPECIFIED);
             }
             return; /* Do not write guest MSI-X data to hardware */
@@ -1103,7 +1104,7 @@ static uint64_t vfio_rtl8168_quirk_data_read(void *op=
aque,
     if (rtl->enabled && (vdev->pdev.cap_present & QEMU_PCI_CAP_MSIX)) {
         hwaddr offset =3D rtl->addr & 0xfff;
         memory_region_dispatch_read(&vdev->pdev.msix_table_mmio, offset,
-                                    &data, size_memop(size),
+                                    &data, size_memop(size) | MO_LE,
                                     MEMTXATTRS_UNSPECIFIED);
         trace_vfio_quirk_rtl8168_msix_read(vdev->vbasedev.name, offset, da=
ta);
     }
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index b929e44..ad06c12 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -551,7 +551,8 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, =
hwaddr addr,
         /* As length is under guest control, handle illegal values. */
         return;
     }
-    memory_region_dispatch_write(mr, addr, val, size_memop(len),
+    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
+    memory_region_dispatch_write(mr, addr, val, size_memop(len) | MO_LE,
                                  MEMTXATTRS_UNSPECIFIED);
 }

@@ -575,7 +576,8 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr=
 addr,
     /* Make sure caller aligned buf properly */
     assert(!(((uintptr_t)buf) & (len - 1)));

-    memory_region_dispatch_read(mr, addr, &val, size_memop(len),
+    /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
+    memory_region_dispatch_read(mr, addr, &val, size_memop(len) | MO_LE,
                                 MEMTXATTRS_UNSPECIFIED);
     switch (len) {
     case 1:
diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
index d08fc79..482e4b3 100644
--- a/memory_ldst.inc.c
+++ b/memory_ldst.inc.c
@@ -37,7 +37,8 @@ static inline uint32_t glue(address_space_ldl_internal, S=
UFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_32, attrs);
+        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_32 | endian,=
 attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D MO_LE) {
             val =3D bswap32(val);
@@ -112,7 +113,8 @@ static inline uint64_t glue(address_space_ldq_internal,=
 SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_64, attrs);
+        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_64 | endian,=
 attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D MO_LE) {
             val =3D bswap64(val);
@@ -221,7 +223,8 @@ static inline uint32_t glue(address_space_lduw_internal=
, SUFFIX)(ARG1_DECL,
         release_lock |=3D prepare_mmio_access(mr);

         /* I/O case */
-        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_16, attrs);
+        /* FIXME: memory_region_dispatch_read ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_read(mr, addr1, &val, MO_16 | endian,=
 attrs);
 #if defined(TARGET_WORDS_BIGENDIAN)
         if (endian =3D=3D MO_LE) {
             val =3D bswap16(val);
@@ -342,7 +345,8 @@ static inline void glue(address_space_stl_internal, SUF=
FIX)(ARG1_DECL,
             val =3D bswap32(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, MO_32, attrs);
+        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_write(mr, addr1, val, MO_32 | endian,=
 attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -447,7 +451,8 @@ static inline void glue(address_space_stw_internal, SUF=
FIX)(ARG1_DECL,
             val =3D bswap16(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, MO_16, attrs);
+        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_write(mr, addr1, val, MO_16 | endian,=
 attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -520,7 +525,8 @@ static void glue(address_space_stq_internal, SUFFIX)(AR=
G1_DECL,
             val =3D bswap64(val);
         }
 #endif
-        r =3D memory_region_dispatch_write(mr, addr1, val, MO_64, attrs);
+        /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
+        r =3D memory_region_dispatch_write(mr, addr1, val, MO_64 | endian,=
 attrs);
     } else {
         /* RAM case */
         ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
--
1.8.3.1

?


--_000_156594108323439909btcom_
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
<div><span style=3D"font-size: 10pt;">Preparation for collapsing the two by=
te swaps adjust_endianness and</span><br>
</div>
<div>handle_bswap into the former.</div>
<div><br>
</div>
<div>Call memory_region_dispatch_{read|write} with endianness encoded into<=
/div>
<div>the &quot;MemOp op&quot; operand.</div>
<div><br>
</div>
<div>This patch does not change any behaviour as</div>
<div>memory_region_dispatch_{read|write} is yet to handle the endianness.</=
div>
<div><br>
</div>
<div>Once it does handle endianness, callers with byte swaps can collapse</=
div>
<div>them into adjust_endianness.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;accel/tcg/cputlb.c &nbsp; &nbsp; &nbsp; | &nbsp;6 &#43;&#43;&#43=
;&#43;--</div>
<div>&nbsp;exec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; | &nbsp;5 &#43;&#43;&#43;--</div>
<div>&nbsp;hw/intc/armv7m_nvic.c &nbsp; &nbsp;| 15 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;-------</div>
<div>&nbsp;hw/s390x/s390-pci-inst.c | &nbsp;6 &#43;&#43;&#43;&#43;--</div>
<div>&nbsp;hw/vfio/pci-quirks.c &nbsp; &nbsp; | &nbsp;5 &#43;&#43;&#43;--</=
div>
<div>&nbsp;hw/virtio/virtio-pci.c &nbsp; | &nbsp;6 &#43;&#43;&#43;&#43;--</=
div>
<div>&nbsp;memory_ldst.inc.c &nbsp; &nbsp; &nbsp; &nbsp;| 18 &#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------</div>
<div>&nbsp;7 files changed, 38 insertions(&#43;), 23 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index 6c83878..0aff6a3 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -906,7 &#43;906,8 @@ static uint64_t io_readx(CPUArchState *env, CP=
UIOTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_lock_iothread();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;locked =3D true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, mr_offset, &amp;v=
al, size_memop(size),</div>
<div>&#43; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, mr_offset, &a=
mp;val,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size_memop(siz=
e) | MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iotlbentry-&g=
t;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (r !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr physaddr =3D mr_offset &#43;<=
/div>
<div>@@ -947,7 &#43;948,8 @@ static void io_writex(CPUArchState *env, CPUIO=
TLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_lock_iothread();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;locked =3D true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, mr_offset, val, =
size_memop(size),</div>
<div>&#43; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, mr_offset, v=
al,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_memop(si=
ze) | MO_TE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; iotlbentry-&=
gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (r !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr physaddr =3D mr_offset &#43;<=
/div>
<div>diff --git a/exec.c b/exec.c</div>
<div>index 303f9a7..562fb5b 100644</div>
<div>--- a/exec.c</div>
<div>&#43;&#43;&#43; b/exec.c</div>
<div>@@ -3335,7 &#43;3335,8 @@ static MemTxResult flatview_write_continue(F=
latView *fv, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; potential bugs=
 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D ldn_p(buf, l);=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_reg=
ion_dispatch_write(mr, addr1, val,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; size_memop(l), attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_memop(l) | MO_TE,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; attrs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_ram_ptr_l=
ength(mr-&gt;ram_block, addr1, &amp;l, false);</div>
<div>@@ -3397,7 &#43;3398,7 @@ MemTxResult flatview_read_continue(FlatView =
*fv, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prep=
are_mmio_access(mr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;l =3D memory_access_si=
ze(mr, l, addr1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result |=3D memory_reg=
ion_dispatch_read(mr, addr1, &amp;val,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;size_memop(l), attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size_memop(l) | MO_TE, attrs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stn_p(buf, l, val);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c</div>
<div>index 975d7cc..e150f9a 100644</div>
<div>--- a/hw/intc/armv7m_nvic.c</div>
<div>&#43;&#43;&#43; b/hw/intc/armv7m_nvic.c</div>
<div>@@ -2346,8 &#43;2346,8 @@ static MemTxResult nvic_sysreg_ns_write(void=
 *opaque, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;if (attrs.secure) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* S accesses to the alias act like =
NS accesses to the real region */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;attrs.secure =3D 0;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_write(mr, a=
ddr, value, size_memop(size),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_write(m=
r, addr, value,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;size_memop(size) | MO_TE, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* NS attrs are RAZ/WI for privilege=
d, and BusFault for user */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (attrs.user) {</div>
<div>@@ -2366,8 &#43;2366,8 @@ static MemTxResult nvic_sysreg_ns_read(void =
*opaque, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;if (attrs.secure) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* S accesses to the alias act like =
NS accesses to the real region */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;attrs.secure =3D 0;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_read(mr, ad=
dr, data, size_memop(size),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return memory_region_dispatch_read(mr=
, addr, data,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; size_memop(size) | MO_TE, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* NS attrs are RAZ/WI for privilege=
d, and BusFault for user */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (attrs.user) {</div>
<div>@@ -2393,8 &#43;2393,8 @@ static MemTxResult nvic_systick_write(void *=
opaque, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Direct the access to the correct systick */</di=
v>
<div>&nbsp; &nbsp; &nbsp;mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&amp;=
s-&gt;systick[attrs.secure]), 0);</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_write(mr, addr, value, si=
ze_memop(size),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;attr=
s);</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_write(mr, addr, value=
,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
size_memop(size) | MO_TE, attrs);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,<=
/div>
<div>@@ -2406,7 &#43;2406,8 @@ static MemTxResult nvic_systick_read(void *o=
paque, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Direct the access to the correct systick */</di=
v>
<div>&nbsp; &nbsp; &nbsp;mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&amp;=
s-&gt;systick[attrs.secure]), 0);</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_read(mr, addr, data, size=
_memop(size), attrs);</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_read(mr, addr, data, =
size_memop(size) | MO_TE,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; attrs)=
;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static const MemoryRegionOps nvic_systick_ops =3D {</div>
<div>diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c</div>
<div>index 0e92a37..272cb28 100644</div>
<div>--- a/hw/s390x/s390-pci-inst.c</div>
<div>&#43;&#43;&#43; b/hw/s390x/s390-pci-inst.c</div>
<div>@@ -373,7 &#43;373,8 @@ static MemTxResult zpci_read_bar(S390PCIBusDev=
ice *pbdev, uint8_t pcias,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D pbdev-&gt;pdev-&gt;io_regions[pcias].memory=
;</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D s390_get_subregion(mr, offset, len);</div>
<div>&nbsp; &nbsp; &nbsp;offset -=3D mr-&gt;addr;</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_read(mr, offset, data, si=
ze_memop(len),</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_read(mr, offset, data=
,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_m=
emop(len) | MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMTX=
ATTRS_UNSPECIFIED);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -472,7 &#43;473,8 @@ static MemTxResult zpci_write_bar(S390PCIBusDe=
vice *pbdev, uint8_t pcias,</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D pbdev-&gt;pdev-&gt;io_regions[pcias].memory=
;</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D s390_get_subregion(mr, offset, len);</div>
<div>&nbsp; &nbsp; &nbsp;offset -=3D mr-&gt;addr;</div>
<div>- &nbsp; &nbsp;return memory_region_dispatch_write(mr, offset, data, s=
ize_memop(len),</div>
<div>&#43; &nbsp; &nbsp;return memory_region_dispatch_write(mr, offset, dat=
a,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
size_memop(len) | MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c</div>
<div>index d5c0268..53db1c3 100644</div>
<div>--- a/hw/vfio/pci-quirks.c</div>
<div>&#43;&#43;&#43; b/hw/vfio/pci-quirks.c</div>
<div>@@ -1072,7 &#43;1072,8 @@ static void vfio_rtl8168_quirk_address_write=
(void *opaque, hwaddr addr,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Write=
 to the proper guest MSI-X table instead */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_r=
egion_dispatch_write(&amp;vdev-&gt;pdev.msix_table_mmio,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; offset, val, size_memop(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; offset, val,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; size_memop(size) | MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return; /* Do not writ=
e guest MSI-X data to hardware */</div>
<div>@@ -1103,7 &#43;1104,7 @@ static uint64_t vfio_rtl8168_quirk_data_read=
(void *opaque,</div>
<div>&nbsp; &nbsp; &nbsp;if (rtl-&gt;enabled &amp;&amp; (vdev-&gt;pdev.cap_=
present &amp; QEMU_PCI_CAP_MSIX)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr offset =3D rtl-&gt;addr &amp;=
 0xfff;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_read(&amp;vde=
v-&gt;pdev.msix_table_mmio, offset,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;data, size_me=
mop(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;data, siz=
e_memop(size) | MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UN=
SPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;trace_vfio_quirk_rtl8168_msix_read(v=
dev-&gt;vbasedev.name, offset, data);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c</div>
<div>index b929e44..ad06c12 100644</div>
<div>--- a/hw/virtio/virtio-pci.c</div>
<div>&#43;&#43;&#43; b/hw/virtio/virtio-pci.c</div>
<div>@@ -551,7 &#43;551,8 @@ void virtio_address_space_write(VirtIOPCIProxy=
 *proxy, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* As length is under guest control,=
 handle illegal values. */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, size_memop(=
len),</div>
<div>&#43; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_write ignores MO_B=
SWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp;memory_region_dispatch_write(mr, addr, val, size_me=
mop(len) | MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MEMTXATTRS_UNSPECIFIED);</=
div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -575,7 &#43;576,8 @@ virtio_address_space_read(VirtIOPCIProxy *prox=
y, hwaddr addr,</div>
<div>&nbsp; &nbsp; &nbsp;/* Make sure caller aligned buf properly */</div>
<div>&nbsp; &nbsp; &nbsp;assert(!(((uintptr_t)buf) &amp; (len - 1)));</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;memory_region_dispatch_read(mr, addr, &amp;val, size_me=
mop(len),</div>
<div>&#43; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read ignores MO_BS=
WAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp;memory_region_dispatch_read(mr, addr, &amp;val, siz=
e_memop(len) | MO_LE,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</d=
iv>
<div>&nbsp; &nbsp; &nbsp;switch (len) {</div>
<div>&nbsp; &nbsp; &nbsp;case 1:</div>
<div>diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c</div>
<div>index d08fc79..482e4b3 100644</div>
<div>--- a/memory_ldst.inc.c</div>
<div>&#43;&#43;&#43; b/memory_ldst.inc.c</div>
<div>@@ -37,7 &#43;37,8 @@ static inline uint32_t glue(address_space_ldl_in=
ternal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, MO_32, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read=
 ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, MO_32 | endian, attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>@@ -112,7 &#43;113,8 @@ static inline uint64_t glue(address_space_ldq_=
internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, MO_64, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read=
 ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, MO_64 | endian, attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>@@ -221,7 &#43;223,8 @@ static inline uint32_t glue(address_space_lduw=
_internal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;release_lock |=3D prepare_mmio_acces=
s(mr);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* I/O case */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, add=
r1, &amp;val, MO_16, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_read=
 ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr,=
 addr1, &amp;val, MO_16 | endian, attrs);</div>
<div>&nbsp;#if defined(TARGET_WORDS_BIGENDIAN)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (endian =3D=3D MO_LE) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>@@ -342,7 &#43;345,8 @@ static inline void glue(address_space_stl_inte=
rnal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap32(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, MO_32, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_writ=
e ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, MO_32 | endian, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -447,7 &#43;451,8 @@ static inline void glue(address_space_stw_inte=
rnal, SUFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap16(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, MO_16, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_writ=
e ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, MO_16 | endian, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
<div>@@ -520,7 &#43;525,8 @@ static void glue(address_space_stq_internal, S=
UFFIX)(ARG1_DECL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D bswap64(val);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, ad=
dr1, val, MO_64, attrs);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: memory_region_dispatch_writ=
e ignores MO_BSWAP. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr=
, addr1, val, MO_64 | endian, attrs);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* RAM case */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ptr =3D qemu_map_ram_ptr(mr-&gt;ram_=
block, addr1);</div>
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

--_000_156594108323439909btcom_--

