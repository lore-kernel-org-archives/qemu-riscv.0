Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqXsC-0004TA-4Q
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 03:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqXs8-0004Bi-Bw
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 03:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqXs7-0001o5-0m
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 03:09:04 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:14822)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqXs4-0001hh-JS; Thu, 25 Jul 2019 03:09:00 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 08:08:56 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 08:08:58 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 08:08:58 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>, <mst@redhat.com>,
 <palmer@sifive.com>, <mark.cave-ayland@ilande.co.uk>,
 <Alistair.Francis@wdc.com>, <arikalo@wavecomp.com>, <david@redhat.com>,
 <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>, <rth@twiddle.net>,
 <atar4qemu@gmail.com>, <ehabkost@redhat.com>, <sw@weilnetz.de>,
 <qemu-s390x@nongnu.org>, <qemu-arm@nongnu.org>,
 <david@gibson.dropbear.id.au>, <qemu-riscv@nongnu.org>, <cohuck@redhat.com>,
 <alex.williamson@redhat.com>, <qemu-ppc@nongnu.org>,
 <amarkovic@wavecomp.com>, <pbonzini@redhat.com>, <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v3 09/15] cputlb: Access MemoryRegion with
 MemOp
Thread-Index: AQHVQrfU8HaUqsQVREuQHVTkj4jEDg==
Date: Thu, 25 Jul 2019 07:08:58 +0000
Message-ID: <1564038538363.23583@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>, 
 <1563810716254.18886@bt.com>,<1564038073754.91133@bt.com>
In-Reply-To: <1564038073754.91133@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156403853836323583btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v3 09/15] cputlb: Access
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
X-List-Received-Date: Thu, 25 Jul 2019 07:09:06 -0000

--_000_156403853836323583btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 accel/tcg/cputlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 523be4c..a4a0bf7 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -906,8 +906,8 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEnt=
ry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_read(mr, mr_offset,
-                                    &val, size, iotlbentry->attrs);
+    r =3D memory_region_dispatch_read(mr, mr_offset, &val, SIZE_MEMOP(size=
),
+                                    iotlbentry->attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
             section->offset_within_address_space -
@@ -947,8 +947,8 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry =
*iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_write(mr, mr_offset,
-                                     val, size, iotlbentry->attrs);
+    r =3D memory_region_dispatch_write(mr, mr_offset, val, SIZE_MEMOP(size=
),
+                                    iotlbentry->attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
             section->offset_within_address_space -
--
1.8.3.1




--_000_156403853836323583btcom_
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
<div>&nbsp;accel/tcg/cputlb.c | 8 &#43;&#43;&#43;&#43;----</div>
<div>&nbsp;1 file changed, 4 insertions(&#43;), 4 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index 523be4c..a4a0bf7 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -906,8 &#43;906,8 @@ static uint64_t io_readx(CPUArchState *env, CP=
UIOTLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_lock_iothread();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;locked =3D true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, mr_offset,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;val, size, io=
tlbentry-&gt;attrs);</div>
<div>&#43; &nbsp; &nbsp;r =3D memory_region_dispatch_read(mr, mr_offset, &a=
mp;val, SIZE_MEMOP(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iotlbentry-&gt=
;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (r !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr physaddr =3D mr_offset &#43;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_address_space -</div>
<div>@@ -947,8 &#43;947,8 @@ static void io_writex(CPUArchState *env, CPUIO=
TLBEntry *iotlbentry,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_mutex_lock_iothread();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;locked =3D true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, mr_offset,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; val, size, iotlbe=
ntry-&gt;attrs);</div>
<div>&#43; &nbsp; &nbsp;r =3D memory_region_dispatch_write(mr, mr_offset, v=
al, SIZE_MEMOP(size),</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iotlbentry-&gt=
;attrs);</div>
<div>&nbsp; &nbsp; &nbsp;if (r !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hwaddr physaddr =3D mr_offset &#43;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;section-&gt;offset_wit=
hin_address_space -</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156403853836323583btcom_--

