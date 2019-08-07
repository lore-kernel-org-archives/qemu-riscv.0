Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdc-0006Mm-FG
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45690)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHOr-0004m1-4u
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:34:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHOp-0003aO-0H
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:34:25 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.80]:56674)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvHOo-0003ZO-Mp; Wed, 07 Aug 2019 04:34:22 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926085.bt.com (10.36.82.116) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:34:00 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:34:20 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:34:20 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <frederic.konrad@adacore.com>, <berto@igalia.com>,
 <qemu-block@nongnu.org>, <arikalo@wavecomp.com>, <pasic@linux.ibm.com>,
 <hpoussin@reactos.org>, <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>, <lersek@redhat.com>, <jasowang@redhat.com>, 
 <jiri@resnulli.us>, <ehabkost@redhat.com>, <b.galvani@gmail.com>,
 <eric.auger@redhat.com>, <alex.williamson@redhat.com>, <stefanha@redhat.com>, 
 <jsnow@redhat.com>, <rth@twiddle.net>, <kwolf@redhat.com>, <andrew@aj.id.au>, 
 <crwulff@gmail.com>, <laurent@vivier.eu>, <sundeep.lkml@gmail.com>,
 <michael@walle.cc>, <qemu-ppc@nongnu.org>, <kbastian@mail.uni-paderborn.de>,
 <imammedo@redhat.com>, <fam@euphon.net>, <peter.maydell@linaro.org>,
 <david@redhat.com>, <palmer@sifive.com>, <keith.busch@intel.com>,
 <jcmvbkbc@gmail.com>, <hare@suse.com>, <sstabellini@kernel.org>,
 <andrew.smirnov@gmail.com>, <deller@gmx.de>, <magnus.damm@gmail.com>,
 <atar4qemu@gmail.com>, <minyard@acm.org>, <sw@weilnetz.de>,
 <yuval.shaia@oracle.com>, <qemu-s390x@nongnu.org>, <qemu-arm@nongnu.org>,
 <jan.kiszka@web.de>, <clg@kaod.org>, <shorne@gmail.com>,
 <qemu-riscv@nongnu.org>, <i.mitsyanko@gmail.com>, <cohuck@redhat.com>,
 <philmd@redhat.com>, <amarkovic@wavecomp.com>, <peter.chubb@nicta.com.au>,
 <aurelien@aurel32.net>, <pburton@wavecomp.com>, <sagark@eecs.berkeley.edu>,
 <green@moxielogic.com>, <kraxel@redhat.com>, <edgar.iglesias@gmail.com>,
 <gxt@mprc.pku.edu.cn>, <robh@kernel.org>, <borntraeger@de.ibm.com>,
 <joel@jms.id.au>, <antonynpavlov@gmail.com>, <chouteau@adacore.com>,
 <Andrew.Baumann@microsoft.com>, <mreitz@redhat.com>, <walling@linux.ibm.com>, 
 <dmitry.fleytman@gmail.com>, <mst@redhat.com>,
 <mark.cave-ayland@ilande.co.uk>, <jslaby@suse.cz>, <marex@denx.de>,
 <proljc@gmail.com>, <marcandre.lureau@redhat.com>, <alistair@alistair23.me>,
 <paul.durrant@citrix.com>, <david@gibson.dropbear.id.au>,
 <xiaoguangrong.eric@gmail.com>, <huth@tuxfamily.org>, <jcd@tribudubois.net>,
 <pbonzini@redhat.com>, <stefanb@linux.ibm.com>
Thread-Topic: [Qemu-devel] [PATCH v6 23/26] cpu: TLB_FLAGS_MASK bit to force
 memory slow path
Thread-Index: AQHVTPro0vQvufbzNk2MLG7d+V6v7w==
Date: Wed, 7 Aug 2019 08:34:20 +0000
Message-ID: <1565166860242.78427@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156516686024278427btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.80
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:48 -0400
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v6 23/26] cpu: TLB_FLAGS_MASK bit
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
X-List-Received-Date: Wed, 07 Aug 2019 08:34:27 -0000

--_000_156516686024278427btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The fast path is taken when TLB_FLAGS_MASK is all zero.

TLB_FORCE_SLOW is simply a TLB_FLAGS_MASK bit to force the slow path,
there are no other side effects.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

?


--_000_156516686024278427btcom_
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
<div><span style=3D"font-size: 10pt;">The fast path is taken when TLB_FLAGS=
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
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
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
&#8203;<br>
</div>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_156516686024278427btcom_--

