Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpbBv-0004WL-DB
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 12:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36787)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpbBZ-0004Va-JA
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 12:29:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpbBF-0007QH-87
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 12:29:13 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.76]:18659)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpbAa-0007Ar-TI; Mon, 22 Jul 2019 12:28:13 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926081.bt.com (10.36.82.112) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 17:28:09 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 17:28:10 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 17:28:10 +0100
From: <tony.nguyen@bt.com>
To: <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>, <mst@redhat.com>,
 <palmer@sifive.com>, <mark.cave-ayland@ilande.co.uk>,
 <Alistair.Francis@wdc.com>, <arikalo@wavecomp.com>, <david@redhat.com>,
 <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>, <rth@twiddle.net>,
 <atar4qemu@gmail.com>, <ehabkost@redhat.com>, <sw@weilnetz.de>,
 <qemu-s390x@nongnu.org>, <qemu-arm@nongnu.org>,
 <david@gibson.dropbear.id.au>, <qemu-riscv@nongnu.org>, <cohuck@redhat.com>,
 <claudio.fontana@huawei.com>, <alex.williamson@redhat.com>,
 <qemu-ppc@nongnu.org>, <amarkovic@wavecomp.com>, <pbonzini@redhat.com>,
 <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v2 00/20] Invert Endian bit in SPARCv9 MMU
 TTE
Thread-Index: AQHVQKLzQYdvLYhbLUSW1HY6Ut95kabWuu6AgAAS8LY=
Date: Mon, 22 Jul 2019 16:28:10 +0000
Message-ID: <1563812889499.73128@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>,
 <2b6eb033-4b6e-4d64-c57e-a3257088d0dd@linaro.org>
In-Reply-To: <2b6eb033-4b6e-4d64-c57e-a3257088d0dd@linaro.org>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381288949973128btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.76
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 00/20] Invert Endian bit in
 SPARCv9 MMU TTE
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
X-List-Received-Date: Mon, 22 Jul 2019 16:29:33 -0000

--_000_156381288949973128btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 7/22/19 8:59 AM, Richard Henderson wrote:

>On 7/22/19 8:34 AM, tony.nguyen@bt.com wrote:
>> Tony Nguyen (20):
>>   tcg: Replace MO_8 with MO_UB alias
>>   tcg: Replace MO_16 with MO_UW alias
>>   tcg: Replace MO_32 with MO_UL alias
>>   tcg: Replace MO_64 with MO_UQ alias
>>   tcg: Move size+sign+endian from TCGMemOp to MemOp
>
>I don't like any of these first 5 patches.
>I don't understand your motivation here.  Why?

The motivation is to only move the attributes required by the memory API
from TCGMemOp into accelerator independent MemOp.

Once I moved MO_{8|16|32|64} into MemOp, there arose many -Wenum-compare an=
d
-Wenum-conversion as a TCGMemOp and a MemOp are being compared and implicit=
ly
coerced.

Thus the idea to replace MO_{8|16|32|64} with MO_{UB|UW|UL|UQ} so we remain
comparing and coercing the same enum type, both TCGMemOps.

Do you prefer the v1 implementation of making TCGMemOp -> MemOp?

Tony.

--_000_156381288949973128btcom_
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
<p><span style=3D"font-size: 10pt; color: rgb(33, 33, 33);">On 7/22/19 8:59=
 AM, Richard Henderson wrote:</span><br>
</p>
<div style=3D"color: rgb(33, 33, 33);"><font size=3D"2"><span style=3D"font=
-size:10pt;">
<div class=3D"PlainText">
<div><br>
</div>
<div>&gt;On 7/22/19 8:34 AM, tony.nguyen@bt.com wrote:</div>
<div>&gt;&gt; Tony Nguyen (20):</div>
<div>&gt;&gt; &nbsp; tcg: Replace MO_8 with MO_UB alias</div>
<div>&gt;&gt; &nbsp; tcg: Replace MO_16 with MO_UW alias</div>
<div>&gt;&gt; &nbsp; tcg: Replace MO_32 with MO_UL alias</div>
<div>&gt;&gt; &nbsp; tcg: Replace MO_64 with MO_UQ alias</div>
<div>&gt;&gt; &nbsp; tcg: Move size&#43;sign&#43;endian from TCGMemOp to Me=
mOp</div>
<div>&gt;</div>
<div>&gt;I don't like any of these first 5 patches.</div>
<div>&gt;I don't understand your motivation here. &nbsp;Why?</div>
<div><br>
</div>
<div>The motivation is to only move the attributes required by the memory A=
PI</div>
<div>from TCGMemOp into accelerator independent MemOp.</div>
<div><br>
</div>
<div>Once I moved MO_{8|16|32|64} into MemOp, there&nbsp;arose&nbsp;many -W=
enum-compare and</div>
<div>-Wenum-conversion as a TCGMemOp and a MemOp are&nbsp;being compared an=
d&nbsp;<span style=3D"font-size: 10pt;">implicitly</span></div>
<div><span style=3D"font-size: 10pt;">coerced.</span></div>
<div><br>
</div>
<div>Thus the idea to replace MO_{8|16|32|64} with MO_{UB|UW|UL|UQ} so we r=
emain<br>
</div>
<div>comparing and coercing the same enum type, both TCGMemOps.</div>
<div><br>
</div>
<div><span style=3D"font-size: 10pt;">Do you prefer the v1 implementation o=
f making TCGMemOp -&gt; MemOp?</span><br>
</div>
<div><br>
</div>
<div>Tony.<br>
</div>
</div>
</span></font></div>
</body>
</html>

--_000_156381288949973128btcom_--

