Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdb-0006JS-1h
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44335)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHKi-00047y-Rf
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:30:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHKh-0001Cd-9Q
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:30:08 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.80]:10548)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvHKg-0001CG-V7; Wed, 07 Aug 2019 04:30:07 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926085.bt.com (10.36.82.116) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:29:44 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:30:05 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:30:04 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v6 12/26] hw/s390x: Hard code size with
 MO_{8|16|32|64}
Thread-Index: AQHVTPpQM7LT8hhvO0OR23cGISCqIg==
Date: Wed, 7 Aug 2019 08:30:04 +0000
Message-ID: <1565166604452.72353@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156516660445272353btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.80
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:47 -0400
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v6 12/26] hw/s390x: Hard code size
 with MO_{8|16|32|64}
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
X-List-Received-Date: Wed, 07 Aug 2019 08:30:10 -0000

--_000_156516660445272353btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Temporarily no-op size_memop was introduced to aid the conversion of
memory_region_dispatch_{read|write} operand "unsigned size" into
"MemOp op".

Now size_memop is implemented, again hard coded size but with
MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/s390x/s390-pci-inst.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 0c958fc..0e92a37 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -782,8 +782,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8=
_t r3, uint64_t gaddr,
     for (i =3D 0; i < len / 8; i++) {
         result =3D memory_region_dispatch_write(mr, offset + i * 8,
                                               ldq_p(buffer + i * 8),
-                                              size_memop(8),
-                                              MEMTXATTRS_UNSPECIFIED);
+                                              MO_64, MEMTXATTRS_UNSPECIFIE=
D);
         if (result !=3D MEMTX_OK) {
             s390_program_interrupt(env, PGM_OPERAND, 6, ra);
             return 0;
--
1.8.3.1

?


--_000_156516660445272353btcom_
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
<div><span style=3D"font-size: 10pt;">Temporarily no-op size_memop was intr=
oduced to aid the conversion of</span><br>
</div>
<div>memory_region_dispatch_{read|write} operand &quot;unsigned size&quot; =
into</div>
<div>&quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Now size_memop is implemented, again hard coded size but with</div>
<div>MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.</=
div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/s390x/s390-pci-inst.c | 3 &#43;--</div>
<div>&nbsp;1 file changed, 1 insertion(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c</div>
<div>index 0c958fc..0e92a37 100644</div>
<div>--- a/hw/s390x/s390-pci-inst.c</div>
<div>&#43;&#43;&#43; b/hw/s390x/s390-pci-inst.c</div>
<div>@@ -782,8 &#43;782,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t =
r1, uint8_t r3, uint64_t gaddr,</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; len / 8; i&#43;&#43;) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;result =3D memory_region_dispatch_wr=
ite(mr, offset &#43; i * 8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;ldq_p(buffer &#43; i * 8),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;size_memop(8),</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;MEMTXATTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;MO_64, MEMTXATTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (result !=3D MEMTX_OK) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_program_interrupt=
(env, PGM_OPERAND, 6, ra);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;</div>
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

--_000_156516660445272353btcom_--

