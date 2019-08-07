Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdc-0006OA-T9
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46389)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLFs-00048Z-Iw
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 08:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLFr-00081b-Bd
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 08:41:24 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.234]:21551)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvLFe-0007ic-D8; Wed, 07 Aug 2019 08:41:10 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 7 Aug 2019 13:40:45 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 13:41:06 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 13:41:06 +0100
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
 <berto@igalia.com>, <magnus.damm@gmail.com>, <minyard@acm.org>,
 <pburton@wavecomp.com>, <jslaby@suse.cz>, <jcd@tribudubois.net>,
 <andrew.smirnov@gmail.com>, <green@moxielogic.com>, <jasowang@redhat.com>,
 <dmitry.fleytman@gmail.com>, <sw@weilnetz.de>, <jiri@resnulli.us>,
 <crwulff@gmail.com>, <marex@denx.de>, <lersek@redhat.com>,
 <proljc@gmail.com>, <shorne@gmail.com>, <yuval.shaia@oracle.com>,
 <palmer@sifive.com>, <sagark@eecs.berkeley.edu>,
 <kbastian@mail.uni-paderborn.de>, <walling@linux.ibm.com>,
 <cohuck@redhat.com>, <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>,
 <david@redhat.com>, <fam@euphon.net>, <hare@suse.com>, <atar4qemu@gmail.com>, 
 <stefanb@linux.ibm.com>, <alex.williamson@redhat.com>, <jcmvbkbc@gmail.com>,
 <laurent@vivier.eu>, <stefanha@redhat.com>, <qemu-arm@nongnu.org>,
 <qemu-block@nongnu.org>, <qemu-ppc@nongnu.org>,
 <xen-devel@lists.xenproject.org>, <qemu-riscv@nongnu.org>,
 <qemu-s390x@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in SPARCv9 MMU
 TTE
Thread-Index: AQHVTPljpfwTk/sMkk++4xOSHxskc6bvbaGAgAAxHHw=
Date: Wed, 7 Aug 2019 12:41:06 +0000
Message-ID: <1565181666201.26324@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>,
 <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
In-Reply-To: <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156518166620126324btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.234
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:48 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in
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
X-List-Received-Date: Wed, 07 Aug 2019 12:41:25 -0000

--_000_156518166620126324btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 8/7/19 8:37 PM, Philippe Mathieu-Daud=E9 wrote:

> I'm confused I think I already reviewed various patches of your previous
?> series but don't see my Reviewed-by tags.?


Apologies Philippe! I am the confused one here =3D/


Will append.


Thank you very much for the reviews and qemu-devel newbie tips so far. I ha=
ve felt very welcome.


Tony

--_000_156518166620126324btcom_
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
<p><span style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); fon=
t-family: Calibri, Arial, Helvetica, sans-serif; font-size: 13.333333015441=
895px; background-color: rgb(255, 255, 255);">On 8/7/19
<span style=3D"font-family: Calibri, sans-serif; font-size: 14.666666984558=
105px; background-color: rgb(255, 255, 255);">
8:37 PM</span>, <span style=3D"font-family: Calibri, sans-serif; font-size:=
 14.666666984558105px; background-color: rgb(255, 255, 255);">
Philippe Mathieu-Daud=E9</span> wrote:</span></p>
<p><span style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); fon=
t-family: Calibri, Arial, Helvetica, sans-serif; font-size: 13.333333015441=
895px; background-color: rgb(255, 255, 255);">&gt;&nbsp;I'm confused I thin=
k I already reviewed various patches of your
 previous</span><br style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 3=
3, 33); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 13.3=
33333015441895px;">
<span style=3D"caret-color: rgb(33, 33, 33); color: rgb(33, 33, 33); font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 13.333333015441895=
px; background-color: rgb(255, 255, 255);">&#8203;&gt;&nbsp;series but don'=
t see my Reviewed-by tags.</span>&#8203;<br>
</p>
<p><br>
</p>
<p>Apologies Philippe!&nbsp;I am the confused one here =3D/</p>
<p><br>
</p>
<p>Will append.<br>
</p>
<p><br>
</p>
<p>Thank you very much for&nbsp;the reviews and qemu-devel newbie&nbsp;tips=
 so far. I have&nbsp;felt very welcome.<br>
</p>
<p><br>
</p>
<p>Tony<br>
</p>
<div style=3D"color: rgb(33, 33, 33);"></div>
</body>
</html>

--_000_156518166620126324btcom_--

