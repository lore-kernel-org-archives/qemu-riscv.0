Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqaV1-0002KG-8H
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 05:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46193)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaUy-0002HJ-HO
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 05:57:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaUx-0001xk-Bo
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 05:57:20 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.77]:45331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqaUq-0001r1-SK; Thu, 25 Jul 2019 05:57:13 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926082.bt.com (10.36.82.113) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 10:57:10 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 10:57:10 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 10:57:10 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>,
 <sagark@eecs.berkeley.edu>, <david@redhat.com>, <palmer@sifive.com>,
 <mark.cave-ayland@ilande.co.uk>, <Alistair.Francis@wdc.com>,
 <edgar.iglesias@gmail.com>, <arikalo@wavecomp.com>, <pasic@linux.ibm.com>,
 <borntraeger@de.ibm.com>, <rth@twiddle.net>, <atar4qemu@gmail.com>,
 <ehabkost@redhat.com>, <alex.williamson@redhat.com>, <qemu-arm@nongnu.org>,
 <stefanha@redhat.com>, <shorne@gmail.com>, <david@gibson.dropbear.id.au>,
 <qemu-riscv@nongnu.org>, <qemu-s390x@nongnu.org>,
 <kbastian@mail.uni-paderborn.de>, <cohuck@redhat.com>, <laurent@vivier.eu>,
 <qemu-ppc@nongnu.org>, <amarkovic@wavecomp.com>, <pbonzini@redhat.com>,
 <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v4 13/15] cputlb: Byte swap memory
 transaction attribute
Thread-Index: AQHVQs9TV3Ksh5mCZEubSX87RH7OKg==
Date: Thu, 25 Jul 2019 09:57:10 +0000
Message-ID: <1564048630378.78008@bt.com>
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156404863037878008btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.77
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v4 13/15] cputlb: Byte swap memory
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
X-List-Received-Date: Thu, 25 Jul 2019 09:57:21 -0000

--_000_156404863037878008btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Notice new attribute, byte swap, and force the transaction through the
memory slow path.

Required by architectures that can invert endianness of memory
transaction, e.g. SPARC64 has the Invert Endian TTE bit.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 accel/tcg/cputlb.c      | 11 +++++++++++
 include/exec/memattrs.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e61b1eb..f292a87 100644
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
index d4a3477..a0644eb 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -37,6 +37,8 @@ typedef struct MemTxAttrs {
     unsigned int user:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+    /* SPARC64: TTE invert endianness */
+    unsigned int byte_swap:1;
     /*
      * The following are target-specific page-table bits.  These are not
      * related to actual memory transactions at all.  However, this struct=
ure
--
1.8.3.1




--_000_156404863037878008btcom_
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
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;accel/tcg/cputlb.c &nbsp; &nbsp; &nbsp;| 11 &#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;</div>
<div>&nbsp;include/exec/memattrs.h | &nbsp;2 &#43;&#43;</div>
<div>&nbsp;2 files changed, 13 insertions(&#43;)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index e61b1eb..f292a87 100644</div>
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
<div>index d4a3477..a0644eb 100644</div>
<div>--- a/include/exec/memattrs.h</div>
<div>&#43;&#43;&#43; b/include/exec/memattrs.h</div>
<div>@@ -37,6 &#43;37,8 @@ typedef struct MemTxAttrs {</div>
<div>&nbsp; &nbsp; &nbsp;unsigned int user:1;</div>
<div>&nbsp; &nbsp; &nbsp;/* Requester ID (for MSI for example) */</div>
<div>&nbsp; &nbsp; &nbsp;unsigned int requester_id:16;</div>
<div>&#43; &nbsp; &nbsp;/* SPARC64: TTE invert endianness */</div>
<div>&#43; &nbsp; &nbsp;unsigned int byte_swap:1;</div>
<div>&nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; * The following are target-specific page-table bi=
ts. &nbsp;These are not</div>
<div>&nbsp; &nbsp; &nbsp; * related to actual memory transactions at all. &=
nbsp;However, this structure</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156404863037878008btcom_--

