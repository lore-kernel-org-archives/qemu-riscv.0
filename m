Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpabb-0004g2-PO
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 11:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54966)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpabY-0004a2-NX
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:52:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpabX-0002IL-I4
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:52:00 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.234]:8997)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpabX-0002Gw-9U; Mon, 22 Jul 2019 11:51:59 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 22 Jul 2019 16:51:42 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:51:56 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:51:56 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v2 17/20] cpu: TLB_FLAGS_MASK bit to force
 memory slow path
Thread-Index: AQHVQKVjDC9KxC3sRk6QAmZwUx7EEw==
Date: Mon, 22 Jul 2019 15:51:56 +0000
Message-ID: <1563810716254.18886@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381071625418886btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.234
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v2 17/20] cpu: TLB_FLAGS_MASK bit
 to force memory slow path
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
X-List-Received-Date: Mon, 22 Jul 2019 15:52:02 -0000

--_000_156381071625418886btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The fast path is taken when TLB_FLAGS_MASK is all zero.

TLB_FORCE_SLOW is simply a TLB_FLAGS_MASK bit to force the slow path,
there are no other side effects.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/cpu-all.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 536ea58..e496f99 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -331,12 +331,18 @@ CPUArchState *cpu_copy(CPUArchState *env);
 #define TLB_MMIO            (1 << (TARGET_PAGE_BITS - 3))
 /* Set if TLB entry must have MMU lookup repeated for every access */
 #define TLB_RECHECK         (1 << (TARGET_PAGE_BITS - 4))
+/* Set if TLB entry must take the slow path.  */
+#define TLB_FORCE_SLOW      (1 << (TARGET_PAGE_BITS - 5))

 /* Use this mask to check interception with an alignment mask
  * in a TCG backend.
  */
-#define TLB_FLAGS_MASK  (TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_MMIO \
-                         | TLB_RECHECK)
+#define TLB_FLAGS_MASK \
+    (TLB_INVALID_MASK  \
+     | TLB_NOTDIRTY    \
+     | TLB_MMIO        \
+     | TLB_RECHECK     \
+     | TLB_FORCE_SLOW)

 /**
  * tlb_hit_page: return true if page aligned @addr is a hit against the
--
1.8.3.1




--_000_156381071625418886btcom_
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
<div><span style=3D"font-size: 12pt;">The fast path is taken when TLB_FLAGS=
_MASK is all zero.</span><br>
</div>
<div><br>
</div>
<div>TLB_FORCE_SLOW is simply a TLB_FLAGS_MASK bit to force the slow path,<=
/div>
<div>there are no other side effects.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/cpu-all.h | 10 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;--</div>
<div>&nbsp;1 file changed, 8 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h</div>
<div>index 536ea58..e496f99 100644</div>
<div>--- a/include/exec/cpu-all.h</div>
<div>&#43;&#43;&#43; b/include/exec/cpu-all.h</div>
<div>@@ -331,12 &#43;331,18 @@ CPUArchState *cpu_copy(CPUArchState *env);</=
div>
<div>&nbsp;#define TLB_MMIO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt=
;&lt; (TARGET_PAGE_BITS - 3))</div>
<div>&nbsp;/* Set if TLB entry must have MMU lookup repeated for every acce=
ss */</div>
<div>&nbsp;#define TLB_RECHECK &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; (TAR=
GET_PAGE_BITS - 4))</div>
<div>&#43;/* Set if TLB entry must take the slow path. &nbsp;*/</div>
<div>&#43;#define TLB_FORCE_SLOW &nbsp; &nbsp; &nbsp;(1 &lt;&lt; (TARGET_PA=
GE_BITS - 5))</div>
<div>&nbsp;</div>
<div>&nbsp;/* Use this mask to check interception with an alignment mask</d=
iv>
<div>&nbsp; * in a TCG backend.</div>
<div>&nbsp; */</div>
<div>-#define TLB_FLAGS_MASK &nbsp;(TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_M=
MIO \</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | TLB_RECHECK)</div>
<div>&#43;#define TLB_FLAGS_MASK \</div>
<div>&#43; &nbsp; &nbsp;(TLB_INVALID_MASK &nbsp;\</div>
<div>&#43; &nbsp; &nbsp; | TLB_NOTDIRTY &nbsp; &nbsp;\</div>
<div>&#43; &nbsp; &nbsp; | TLB_MMIO &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&#43; &nbsp; &nbsp; | TLB_RECHECK &nbsp; &nbsp; \</div>
<div>&#43; &nbsp; &nbsp; | TLB_FORCE_SLOW)</div>
<div>&nbsp;</div>
<div>&nbsp;/**</div>
<div>&nbsp; * tlb_hit_page: return true if page aligned @addr is a hit agai=
nst the</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156381071625418886btcom_--

