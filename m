Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyaY5-0004OH-4c
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 07:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyaY2-0004Mx-B9
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 07:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyaY0-0003YW-OG
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 07:37:34 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:23919)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyaXx-0003IB-Ir; Fri, 16 Aug 2019 07:37:29 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 12:37:05 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 12:37:26 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 12:37:26 +0100
From: <tony.nguyen@bt.com>
To: <philmd@redhat.com>, <qemu-devel@nongnu.org>
CC: <rth@twiddle.net>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <imammedo@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <xiaoguangrong.eric@gmail.com>, <alistair@alistair23.me>,
 <peter.maydell@linaro.org>, <b.galvani@gmail.com>, <clg@kaod.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <i.mitsyanko@gmail.com>,
 <robh@kernel.org>, <peter.chubb@nicta.com.au>, <sundeep.lkml@gmail.com>,
 <jan.kiszka@web.de>, <balrogg@gmail.com>, <eric.auger@redhat.com>,
 <kraxel@redhat.com>, <michael@walle.cc>, <kwolf@redhat.com>,
 <mreitz@redhat.com>, <jsnow@redhat.com>, <keith.busch@intel.com>,
 <marcandre.lureau@redhat.com>, <Andrew.Baumann@microsoft.com>,
 <edgar.iglesias@gmail.com>, <antonynpavlov@gmail.com>,
 <chouteau@adacore.com>, <frederic.konrad@adacore.com>, <huth@tuxfamily.org>,
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
Thread-Topic: [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in SPARCv9 MMU
 TTE
Thread-Index: AQHVU/vc8DdfhK3ulkmWv148s0Uozqb9eXeAgAAr/BQ=
Date: Fri, 16 Aug 2019 11:37:26 +0000
Message-ID: <1565955445398.83897@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>,
 <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
In-Reply-To: <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156595544539883897btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
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
X-List-Received-Date: Fri, 16 Aug 2019 11:37:35 -0000

--_000_156595544539883897btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Phillippe,

On 8/16/19 7:58 PM, Philippe Mathieu-Daud=E9 wrote:
>On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:
>> This patchset implements the IE (Invert Endian) bit in SPARCv9 MMU TTE.
>>
>> v7:
>[...]
>> - Re-declared many native endian devices as little or big endian. This i=
s why
>>   v7 has +16 patches.
>
>Why are you doing that? What is the rational?

While collapsing the byte swaps, it was suggested in patch #11 of v5 that
consistent use of MemOp simplified endian comparisons. This lead to the
deprecation of enum device_endian by MemOp.

As MO_TE is conditional upon NEED_CPU_H, the s/DEVICE_NATIVE_ENDIAN/MO_TE/
required changing some device object files from common-obj-* to obj-*. In p=
atch
#15 of v6 Paolo noted that most devices should not of been DEVICE_NATIVE_EN=
DIAN
and hinted at a clean up.

The +16 patches in v7 is the clean up effort.

>Anyhow if this not required by your series, you should split it out of
>it, and send it on your principal changes are merged.
>I'm worried because this these new patches involve many subsystems (thus
>maintainers) and reviewing them will now take a fair amount of time.

Yes, lets split these patches out. They are very much a tangent to the seri=
es
purpose.

>> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
>> targets from the set of target/hw/*/device.o.
>>
>> If the set of targets are all little or all big endian, re-declare
>> the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
>> respectively.
>
>If only little endian targets use a device, that doesn't mean the device
>is designed in little endian...
>
>Then if a big endian target plan to use this device, it will require
>more work and you might have introduced regressions...
>
>I'm not sure this is a safe move.
>
>> This *naive* deduction may result in genuinely native endian devices
>> being incorrectly declared as little or big endian, but should not
>> introduce regressions for current targets.
>

Roger. Evidently too naive. TBH, most devices I've never heard of...

Regards,
Tony

--_000_156595544539883897btcom_
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
<div>Hi Phillippe,<br>
</div>
<div><br>
</div>
<div>On 8/16/19 7:58 PM, Philippe Mathieu-Daud=E9 wrote:</div>
<div>&gt;On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:</div>
<div>&gt;&gt; This patchset implements the IE (Invert Endian) bit in SPARCv=
9 MMU TTE.</div>
<div>&gt;&gt;&nbsp;</div>
<div>&gt;&gt; v7:</div>
<div>&gt;[...]</div>
<div>&gt;&gt; - Re-declared many native endian devices as little or big end=
ian. This is why</div>
<div>&gt;&gt; &nbsp; v7 has &#43;16 patches.<br>
</div>
<div>&gt;</div>
<div>&gt;Why are you doing that? What is the rational?</div>
<div><br>
</div>
<div>While collapsing the byte swaps, it was suggested in patch #11 of v5 t=
hat</div>
<div>consistent use of MemOp simplified endian comparisons. This lead to th=
e</div>
<div>deprecation of enum device_endian by MemOp.</div>
<div><br>
</div>
<div>As MO_TE is conditional upon NEED_CPU_H, the s/DEVICE_NATIVE_ENDIAN/MO=
_TE/</div>
<div>required changing some device object files from common-obj-* to obj-*.=
 In patch</div>
<div>#15 of v6 Paolo noted that most devices should not of been DEVICE_NATI=
VE_ENDIAN</div>
<div>and hinted at a clean up.</div>
<div><br>
</div>
<div>The &#43;16 patches in v7 is the clean up effort.<br>
</div>
<div><br>
</div>
<div>&gt;Anyhow if this not required by your series, you should split it ou=
t of</div>
<div>&gt;it, and send it on your principal changes are merged.</div>
<div>&gt;I'm worried because this these new patches involve many subsystems=
 (thus</div>
<div>&gt;maintainers) and reviewing them will now take a fair amount of tim=
e.</div>
<div><br>
</div>
<div>Yes, lets split these patches out. They are very much a tangent to the=
 series<br>
</div>
<div>purpose.<br>
</div>
<div><br>
</div>
<div>&gt;&gt; For each device declared with DEVICE_NATIVE_ENDIAN, find the =
set of</div>
<div>&gt;&gt; targets from the set of target/hw/*/device.o.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; If the set of targets are all little or all big endian, re-de=
clare</div>
<div>&gt;&gt; the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_E=
NDIAN</div>
<div>&gt;&gt; respectively.</div>
<div>&gt;</div>
<div>&gt;If only little endian targets use a device, that doesn't mean the =
device</div>
<div>&gt;is designed in little endian...</div>
<div>&gt;</div>
<div>&gt;Then if a big endian target plan to use this device, it will requi=
re</div>
<div>&gt;more work and you might have introduced regressions...</div>
<div>&gt;</div>
<div>&gt;I'm not sure this is a safe move.</div>
<div>&gt;</div>
<div>&gt;&gt; This *naive* deduction may result in genuinely native endian =
devices<br>
</div>
<div>&gt;&gt; being incorrectly declared as little or big endian, but shoul=
d not</div>
<div>&gt;&gt; introduce regressions for current targets.</div>
<div>&gt;<br>
</div>
<div><br>
</div>
<div>Roger. Evidently too naive. TBH, most devices I've never heard of...</=
div>
<div><br>
Regards,<br>
</div>
<div>Tony<br>
</div>
</body>
</html>

--_000_156595544539883897btcom_--

