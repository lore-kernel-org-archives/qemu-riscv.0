Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqXou-0006M9-IJ
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 03:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51614)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqXos-0006Lx-7P
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 03:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqXon-0005rd-VR
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 03:05:42 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.80]:29330)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqXol-0005mC-DH; Thu, 25 Jul 2019 03:05:35 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926085.bt.com (10.36.82.116) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 08:05:31 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 08:05:33 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 08:05:33 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v3 03/15] target/mips: Access MemoryRegion
 with MemOp
Thread-Index: AQHVQrdahba4Zld70EaSPy9ddsFb+w==
Date: Thu, 25 Jul 2019 07:05:33 +0000
Message-ID: <1564038332257.23273@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>, 
 <1563810716254.18886@bt.com>,<1564038073754.91133@bt.com>
In-Reply-To: <1564038073754.91133@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156403833225723273btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.80
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v3 03/15] target/mips: Access
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
X-List-Received-Date: Thu, 25 Jul 2019 07:05:43 -0000

--_000_156403833225723273btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 target/mips/op_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 9e2e02f..dccb8df 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "exec/memop.h"
 #include "sysemu/kvm.h"

 /*************************************************************************=
****/
@@ -4740,11 +4741,11 @@ void helper_cache(CPUMIPSState *env, target_ulong a=
ddr, uint32_t op)
     if (op =3D=3D 9) {
         /* Index Store Tag */
         memory_region_dispatch_write(env->itc_tag, index, env->CP0_TagLo,
-                                     8, MEMTXATTRS_UNSPECIFIED);
+                                     SIZE_MEMOP(8), MEMTXATTRS_UNSPECIFIED=
);
     } else if (op =3D=3D 5) {
         /* Index Load Tag */
         memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
-                                    8, MEMTXATTRS_UNSPECIFIED);
+                                    SIZE_MEMOP(8), MEMTXATTRS_UNSPECIFIED)=
;
     }
 #endif
 }
--
1.8.3.1




--_000_156403833225723273btcom_
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
<div><span style=3D"font-size: 10pt;">Signed-off-by: Tony Nguyen &lt;tony.n=
guyen@bt.com&gt;</span><br>
</div>
<div>---</div>
<div>&nbsp;target/mips/op_helper.c | 5 &#43;&#43;&#43;--</div>
<div>&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c</div>
<div>index 9e2e02f..dccb8df 100644</div>
<div>--- a/target/mips/op_helper.c</div>
<div>&#43;&#43;&#43; b/target/mips/op_helper.c</div>
<div>@@ -24,6 &#43;24,7 @@</div>
<div>&nbsp;#include &quot;exec/helper-proto.h&quot;</div>
<div>&nbsp;#include &quot;exec/exec-all.h&quot;</div>
<div>&nbsp;#include &quot;exec/cpu_ldst.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;sysemu/kvm.h&quot;</div>
<div>&nbsp;</div>
<div>&nbsp;/***************************************************************=
**************/</div>
<div>@@ -4740,11 &#43;4741,11 @@ void helper_cache(CPUMIPSState *env, targe=
t_ulong addr, uint32_t op)</div>
<div>&nbsp; &nbsp; &nbsp;if (op =3D=3D 9) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Index Store Tag */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_write(env-&gt=
;itc_tag, index, env-&gt;CP0_TagLo,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8, MEMTXATTRS_UNS=
PECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SIZE_MEMOP(8)=
, MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp;} else if (op =3D=3D 5) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Index Load Tag */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_read(env-&gt;=
itc_tag, index, &amp;env-&gt;CP0_TagLo,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8, MEMTXATTRS_UNSP=
ECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SIZE_MEMOP(8),=
 MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>&nbsp;}</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_156403833225723273btcom_--

