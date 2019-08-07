Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvLdd-0006Ot-K7
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 09:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52607)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLc2-0003gz-Ev
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 09:04:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvLc1-0006a6-El
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 09:04:18 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:17060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvLbr-0006Tn-1S; Wed, 07 Aug 2019 09:04:07 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 14:03:57 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 14:04:04 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 14:04:04 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <fam@euphon.net>, <peter.maydell@linaro.org>, <walling@linux.ibm.com>,
 <cohuck@redhat.com>, <sagark@eecs.berkeley.edu>, <david@redhat.com>,
 <jasowang@redhat.com>, <palmer@sifive.com>, <mark.cave-ayland@ilande.co.uk>,
 <i.mitsyanko@gmail.com>, <keith.busch@intel.com>, <jcmvbkbc@gmail.com>,
 <frederic.konrad@adacore.com>, <dmitry.fleytman@gmail.com>,
 <kraxel@redhat.com>, <edgar.iglesias@gmail.com>, <gxt@mprc.pku.edu.cn>,
 <pburton@wavecomp.com>, <xiaoguangrong.eric@gmail.com>,
 <peter.chubb@nicta.com.au>, <philmd@redhat.com>, <robh@kernel.org>,
 <hare@suse.com>, <sstabellini@kernel.org>, <berto@igalia.com>,
 <chouteau@adacore.com>, <qemu-block@nongnu.org>, <arikalo@wavecomp.com>,
 <jslaby@suse.cz>, <deller@gmx.de>, <mst@redhat.com>, <magnus.damm@gmail.com>, 
 <jcd@tribudubois.net>, <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>,
 <mreitz@redhat.com>, <hpoussin@reactos.org>, <joel@jms.id.au>,
 <anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>,
 <david@gibson.dropbear.id.au>, <lersek@redhat.com>, <green@moxielogic.com>,
 <atar4qemu@gmail.com>, <antonynpavlov@gmail.com>, <marex@denx.de>,
 <jiri@resnulli.us>, <ehabkost@redhat.com>, <minyard@acm.org>,
 <qemu-s390x@nongnu.org>, <sw@weilnetz.de>, <alistair@alistair23.me>,
 <yuval.shaia@oracle.com>, <b.galvani@gmail.com>, <eric.auger@redhat.com>,
 <alex.williamson@redhat.com>, <qemu-arm@nongnu.org>, <jan.kiszka@web.de>,
 <clg@kaod.org>, <stefanha@redhat.com>, <marcandre.lureau@redhat.com>,
 <shorne@gmail.com>, <jsnow@redhat.com>, <rth@twiddle.net>,
 <kwolf@redhat.com>, <qemu-riscv@nongnu.org>, <proljc@gmail.com>,
 <pbonzini@redhat.com>, <andrew@aj.id.au>, <kbastian@mail.uni-paderborn.de>,
 <crwulff@gmail.com>, <laurent@vivier.eu>, <Andrew.Baumann@microsoft.com>,
 <sundeep.lkml@gmail.com>, <andrew.smirnov@gmail.com>, <michael@walle.cc>,
 <paul.durrant@citrix.com>, <qemu-ppc@nongnu.org>, <huth@tuxfamily.org>,
 <amarkovic@wavecomp.com>, <imammedo@redhat.com>, <aurelien@aurel32.net>,
 <stefanb@linux.ibm.com>
Thread-Topic: [Qemu-devel] [PATCH v6 26/26] target/sparc: sun4u Invert Endian
 TTE bit
Thread-Index: AQHVTPt/lR9qsEqZQEWEZcnZpv0Fyabvpuwu
Date: Wed, 7 Aug 2019 13:04:04 +0000
Message-ID: <1565183043809.33207@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>,
 <1565166941186.41868@bt.com>
In-Reply-To: <1565166941186.41868@bt.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156518304380933207btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:05:48 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 26/26] target/sparc: sun4u
 Invert Endian TTE bit
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
X-List-Received-Date: Wed, 07 Aug 2019 13:04:19 -0000

--_000_156518304380933207btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry, I missed a tag.?


Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

--_000_156518304380933207btcom_
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
<p>Sorry, I missed a tag.&#8203;<br>
</p>
<p><br>
</p>
<p>Tested-by:&nbsp;<span style=3D"font-variant-ligatures: no-common-ligatur=
es; color: #000000; background-color: #e6e600"></span><span style=3D"font-v=
ariant-ligatures: no-common-ligatures">Mark Cave-Ayland &lt;mark.cave-aylan=
d@ilande.co.uk&gt;</span><br>
</p>
</body>
</html>

--_000_156518304380933207btcom_--

