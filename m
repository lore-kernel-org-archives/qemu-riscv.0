Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyWpz-0005M3-Tl
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 03:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWps-0005Fy-Sl
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:39:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWpo-0003xz-RE
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:39:44 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:36484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWpo-0003xR-FG; Fri, 16 Aug 2019 03:39:40 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:39:17 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:39:38 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:39:38 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v7 41/42] target/sparc: Add TLB entry with
 attributes
Thread-Index: AQHVVAXCWvmw8IlXtEyhXVZLY/cOBA==
Date: Fri, 16 Aug 2019 07:39:38 +0000
Message-ID: <1565941177600.7672@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_15659411776007672btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v7 41/42] target/sparc: Add TLB
 entry with attributes
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
X-List-Received-Date: Fri, 16 Aug 2019 07:39:49 -0000

--_000_15659411776007672btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Append MemTxAttrs to interfaces so we can pass along up coming Invert
Endian TTE bit on SPARC64.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/mmu_helper.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index cbd1e91..826e14b 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -88,7 +88,7 @@ static const int perm_table[2][8] =3D {
 };

 static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
-                                int *prot, int *access_index,
+                                int *prot, int *access_index, MemTxAttrs *=
attrs,
                                 target_ulong address, int rw, int mmu_idx,
                                 target_ulong *page_size)
 {
@@ -219,6 +219,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
     target_ulong vaddr;
     target_ulong page_size;
     int error_code =3D 0, prot, access_index;
+    MemTxAttrs attrs =3D {};

     /*
      * TODO: If we ever need tlb_vaddr_to_host for this target,
@@ -229,7 +230,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
     assert(!probe);

     address &=3D TARGET_PAGE_MASK;
-    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,
+    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,=
 &attrs,
                                       address, access_type,
                                       mmu_idx, &page_size);
     vaddr =3D address;
@@ -490,8 +491,8 @@ static inline int ultrasparc_tag_match(SparcTLBEntry *t=
lb,
     return 0;
 }

-static int get_physical_address_data(CPUSPARCState *env,
-                                     hwaddr *physical, int *prot,
+static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
+                                     int *prot, MemTxAttrs *attrs,
                                      target_ulong address, int rw, int mmu=
_idx)
 {
     CPUState *cs =3D env_cpu(env);
@@ -608,8 +609,8 @@ static int get_physical_address_data(CPUSPARCState *env=
,
     return 1;
 }

-static int get_physical_address_code(CPUSPARCState *env,
-                                     hwaddr *physical, int *prot,
+static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
+                                     int *prot, MemTxAttrs *attrs,
                                      target_ulong address, int mmu_idx)
 {
     CPUState *cs =3D env_cpu(env);
@@ -686,7 +687,7 @@ static int get_physical_address_code(CPUSPARCState *env=
,
 }

 static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
-                                int *prot, int *access_index,
+                                int *prot, int *access_index, MemTxAttrs *=
attrs,
                                 target_ulong address, int rw, int mmu_idx,
                                 target_ulong *page_size)
 {
@@ -716,11 +717,11 @@ static int get_physical_address(CPUSPARCState *env, h=
waddr *physical,
     }

     if (rw =3D=3D 2) {
-        return get_physical_address_code(env, physical, prot, address,
+        return get_physical_address_code(env, physical, prot, attrs, addre=
ss,
                                          mmu_idx);
     } else {
-        return get_physical_address_data(env, physical, prot, address, rw,
-                                         mmu_idx);
+        return get_physical_address_data(env, physical, prot, attrs, addre=
ss,
+                                         rw, mmu_idx);
     }
 }

@@ -734,10 +735,11 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
     target_ulong vaddr;
     hwaddr paddr;
     target_ulong page_size;
+    MemTxAttrs attrs =3D {};
     int error_code =3D 0, prot, access_index;

     address &=3D TARGET_PAGE_MASK;
-    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,
+    error_code =3D get_physical_address(env, &paddr, &prot, &access_index,=
 &attrs,
                                       address, access_type,
                                       mmu_idx, &page_size);
     if (likely(error_code =3D=3D 0)) {
@@ -747,7 +749,8 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
                                    env->dmmu.mmu_primary_context,
                                    env->dmmu.mmu_secondary_context);

-        tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, page_size);
+        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, prot, mmu_idx,
+                                page_size);
         return true;
     }
     if (probe) {
@@ -849,9 +852,10 @@ static int cpu_sparc_get_phys_page(CPUSPARCState *env,=
 hwaddr *phys,
 {
     target_ulong page_size;
     int prot, access_index;
+    MemTxAttrs attrs =3D {};

-    return get_physical_address(env, phys, &prot, &access_index, addr, rw,
-                                mmu_idx, &page_size);
+    return get_physical_address(env, phys, &prot, &access_index, &attrs, a=
ddr,
+                                rw, mmu_idx, &page_size);
 }

 #if defined(TARGET_SPARC64)
--
1.8.3.1

?


--_000_15659411776007672btcom_
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
<div><span style=3D"font-size: 10pt;">Append MemTxAttrs to interfaces so we=
 can pass along up coming Invert</span><br>
</div>
<div>Endian TTE bit on SPARC64.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;target/sparc/mmu_helper.c | 32 &#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------------</di=
v>
<div>&nbsp;1 file changed, 18 insertions(&#43;), 14 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c</di=
v>
<div>index cbd1e91..826e14b 100644</div>
<div>--- a/target/sparc/mmu_helper.c</div>
<div>&#43;&#43;&#43; b/target/sparc/mmu_helper.c</div>
<div>@@ -88,7 &#43;88,7 @@ static const int perm_table[2][8] =3D {</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int get_physical_address(CPUSPARCState *env, hwaddr *phys=
ical,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index,</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index=
, MemTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong address, int r=
w, int mmu_idx,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong *page_size)</d=
iv>
<div>&nbsp;{</div>
<div>@@ -219,6 &#43;219,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr ad=
dress, int size,</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong vaddr;</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong page_size;</div>
<div>&nbsp; &nbsp; &nbsp;int error_code =3D 0, prot, access_index;</div>
<div>&#43; &nbsp; &nbsp;MemTxAttrs attrs =3D {};</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; * TODO: If we ever need tlb_vaddr_to_host for thi=
s target,</div>
<div>@@ -229,7 &#43;230,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr ad=
dress, int size,</div>
<div>&nbsp; &nbsp; &nbsp;assert(!probe);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;address &amp;=3D TARGET_PAGE_MASK;</div>
<div>- &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr, &a=
mp;prot, &amp;access_index,</div>
<div>&#43; &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr=
, &amp;prot, &amp;access_index, &amp;attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addres=
s, access_type,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mmu_id=
x, &amp;page_size);</div>
<div>&nbsp; &nbsp; &nbsp;vaddr =3D address;</div>
<div>@@ -490,8 &#43;491,8 @@ static inline int ultrasparc_tag_match(SparcTL=
BEntry *tlb,</div>
<div>&nbsp; &nbsp; &nbsp;return 0;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static int get_physical_address_data(CPUSPARCState *env,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwaddr *physical,=
 int *prot,</div>
<div>&#43;static int get_physical_address_data(CPUSPARCState *env, hwaddr *=
physical,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int *prot, Me=
mTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; target_ulong=
 address, int rw, int mmu_idx)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CPUState *cs =3D env_cpu(env);</div>
<div>@@ -608,8 &#43;609,8 @@ static int get_physical_address_data(CPUSPARCS=
tate *env,</div>
<div>&nbsp; &nbsp; &nbsp;return 1;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-static int get_physical_address_code(CPUSPARCState *env,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; hwaddr *physical,=
 int *prot,</div>
<div>&#43;static int get_physical_address_code(CPUSPARCState *env, hwaddr *=
physical,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int *prot, Me=
mTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; target_ulong=
 address, int mmu_idx)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;CPUState *cs =3D env_cpu(env);</div>
<div>@@ -686,7 &#43;687,7 @@ static int get_physical_address_code(CPUSPARCS=
tate *env,</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static int get_physical_address(CPUSPARCState *env, hwaddr *phys=
ical,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index,</d=
iv>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int *prot, int *access_index=
, MemTxAttrs *attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong address, int r=
w, int mmu_idx,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;target_ulong *page_size)</d=
iv>
<div>&nbsp;{</div>
<div>@@ -716,11 &#43;717,11 @@ static int get_physical_address(CPUSPARCStat=
e *env, hwaddr *physical,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (rw =3D=3D 2) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_code(env, phy=
sical, prot, address,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_code(env,=
 physical, prot, attrs, address,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; mmu_idx);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_data(env, phy=
sical, prot, address, rw,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mmu=
_idx);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return get_physical_address_data(env,=
 physical, prot, attrs, address,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 rw, mmu_idx);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -734,10 &#43;735,11 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr =
address, int size,</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong vaddr;</div>
<div>&nbsp; &nbsp; &nbsp;hwaddr paddr;</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong page_size;</div>
<div>&#43; &nbsp; &nbsp;MemTxAttrs attrs =3D {};</div>
<div>&nbsp; &nbsp; &nbsp;int error_code =3D 0, prot, access_index;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;address &amp;=3D TARGET_PAGE_MASK;</div>
<div>- &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr, &a=
mp;prot, &amp;access_index,</div>
<div>&#43; &nbsp; &nbsp;error_code =3D get_physical_address(env, &amp;paddr=
, &amp;prot, &amp;access_index, &amp;attrs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addres=
s, access_type,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mmu_id=
x, &amp;page_size);</div>
<div>&nbsp; &nbsp; &nbsp;if (likely(error_code =3D=3D 0)) {</div>
<div>@@ -747,7 &#43;749,8 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr ad=
dress, int size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; env-&gt;dmmu.mmu_pr=
imary_context,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; env-&gt;dmmu.mmu_se=
condary_context);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tlb_set_page(cs, vaddr, paddr, prot, mmu_=
idx, page_size);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tlb_set_page_with_attrs(cs, vaddr, pa=
ddr, attrs, prot, mmu_idx,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;page_size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (probe) {</div>
<div>@@ -849,9 &#43;852,10 @@ static int cpu_sparc_get_phys_page(CPUSPARCSt=
ate *env, hwaddr *phys,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong page_size;</div>
<div>&nbsp; &nbsp; &nbsp;int prot, access_index;</div>
<div>&#43; &nbsp; &nbsp;MemTxAttrs attrs =3D {};</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;return get_physical_address(env, phys, &amp;prot, &amp;=
access_index, addr, rw,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mmu_idx, &amp;page_size);</div>
<div>&#43; &nbsp; &nbsp;return get_physical_address(env, phys, &amp;prot, &=
amp;access_index, &amp;attrs, addr,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rw, mmu_idx, &amp;page_size)=
;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(TARGET_SPARC64)</div>
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

--_000_15659411776007672btcom_--

