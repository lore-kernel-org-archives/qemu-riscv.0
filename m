Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyWps-0005Eq-8V
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 03:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWpn-000570-8e
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:39:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWpj-0003v3-1q
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 03:39:39 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:36421)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWph-0003qH-3W; Fri, 16 Aug 2019 03:39:34 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:39:02 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:39:23 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:39:23 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v7 40/42] cputlb: Byte swap memory
 transaction attribute
Thread-Index: AQHVVAW5pu5EejPFoUWEW5e4cLePWw==
Date: Fri, 16 Aug 2019 07:39:23 +0000
Message-ID: <1565941162664.30993@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594116266430993btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v7 40/42] cputlb: Byte swap memory
 transaction attribute
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
X-List-Received-Date: Fri, 16 Aug 2019 07:39:42 -0000

--_000_156594116266430993btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Notice new attribute, byte swap, and force the transaction through the
memory slow path.

Required by architectures that can invert endianness of memory
transaction, e.g. SPARC64 has the Invert Endian TTE bit.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c      | 11 +++++++++++
 include/exec/memattrs.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index bb2f55d..adfa4f2 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -738,6 +738,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulon=
g vaddr,
          */
         address |=3D TLB_RECHECK;
     }
+    if (attrs.byte_swap) {
+        address |=3D TLB_FORCE_SLOW;
+    }
     if (!memory_region_is_ram(section->mr) &&
         !memory_region_is_romd(section->mr)) {
         /* IO memory case */
@@ -891,6 +894,10 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEn=
try *iotlbentry,
     bool locked =3D false;
     MemTxResult r;

+    if (iotlbentry->attrs.byte_swap) {
+        op ^=3D MO_BSWAP;
+    }
+
     section =3D iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs)=
;
     mr =3D section->mr;
     mr_offset =3D (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
@@ -933,6 +940,10 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry=
 *iotlbentry,
     bool locked =3D false;
     MemTxResult r;

+    if (iotlbentry->attrs.byte_swap) {
+        op ^=3D MO_BSWAP;
+    }
+
     section =3D iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs)=
;
     mr =3D section->mr;
     mr_offset =3D (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index d4a3477..95f2d20 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -37,6 +37,8 @@ typedef struct MemTxAttrs {
     unsigned int user:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+    /* Invert endianness for this page */
+    unsigned int byte_swap:1;
     /*
      * The following are target-specific page-table bits.  These are not
      * related to actual memory transactions at all.  However, this struct=
ure
--
1.8.3.1

?


--_000_156594116266430993btcom_
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
<div><span style=3D"font-size: 12pt;">Notice new attribute, byte swap, and =
force the transaction through the</span><br>
</div>
<div>memory slow path.</div>
<div><br>
</div>
<div>Required by architectures that can invert endianness of memory</div>
<div>transaction, e.g. SPARC64 has the Invert Endian TTE bit.</div>
<div><br>
</div>
<div>Suggested-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</=
div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;accel/tcg/cputlb.c &nbsp; &nbsp; &nbsp;| 11 &#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;</div>
<div>&nbsp;include/exec/memattrs.h | &nbsp;2 &#43;&#43;</div>
<div>&nbsp;2 files changed, 13 insertions(&#43;)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index bb2f55d..adfa4f2 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -738,6 &#43;738,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, ta=
rget_ulong vaddr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;address |=3D TLB_RECHECK;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&#43; &nbsp; &nbsp;if (attrs.byte_swap) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;address |=3D TLB_FORCE_SLOW;</div>
<div>&#43; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (!memory_region_is_ram(section-&gt;mr) &amp;&am=
p;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!memory_region_is_romd(section-&gt;m=
r)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* IO memory case */</div>
<div>@@ -891,6 &#43;894,10 @@ static uint64_t io_readx(CPUArchState *env, C=
PUIOTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp;bool locked =3D false;</div>
<div>&nbsp; &nbsp; &nbsp;MemTxResult r;</div>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp;if (iotlbentry-&gt;attrs.byte_swap) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;op ^=3D MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp;section =3D iotlb_to_section(cpu, iotlbentry-&gt;a=
ddr, iotlbentry-&gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D section-&gt;mr;</div>
<div>&nbsp; &nbsp; &nbsp;mr_offset =3D (iotlbentry-&gt;addr &amp; TARGET_PA=
GE_MASK) &#43; addr;</div>
<div>@@ -933,6 &#43;940,10 @@ static void io_writex(CPUArchState *env, CPUI=
OTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp;bool locked =3D false;</div>
<div>&nbsp; &nbsp; &nbsp;MemTxResult r;</div>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp;if (iotlbentry-&gt;attrs.byte_swap) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;op ^=3D MO_BSWAP;</div>
<div>&#43; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp;section =3D iotlb_to_section(cpu, iotlbentry-&gt;a=
ddr, iotlbentry-&gt;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;mr =3D section-&gt;mr;</div>
<div>&nbsp; &nbsp; &nbsp;mr_offset =3D (iotlbentry-&gt;addr &amp; TARGET_PA=
GE_MASK) &#43; addr;</div>
<div>diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h</div>
<div>index d4a3477..95f2d20 100644</div>
<div>--- a/include/exec/memattrs.h</div>
<div>&#43;&#43;&#43; b/include/exec/memattrs.h</div>
<div>@@ -37,6 &#43;37,8 @@ typedef struct MemTxAttrs {</div>
<div>&nbsp; &nbsp; &nbsp;unsigned int user:1;</div>
<div>&nbsp; &nbsp; &nbsp;/* Requester ID (for MSI for example) */</div>
<div>&nbsp; &nbsp; &nbsp;unsigned int requester_id:16;</div>
<div>&#43; &nbsp; &nbsp;/* Invert endianness for this page */</div>
<div>&#43; &nbsp; &nbsp;unsigned int byte_swap:1;</div>
<div>&nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; * The following are target-specific page-table bi=
ts. &nbsp;These are not</div>
<div>&nbsp; &nbsp; &nbsp; * related to actual memory transactions at all. &=
nbsp;However, this structure</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594116266430993btcom_--

