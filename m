Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iJvqp-0007nh-75
	for mharc-qemu-riscv@gnu.org; Mon, 14 Oct 2019 04:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iJvql-0007hi-Mu
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 04:37:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iJvqk-0002Tp-1n
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 04:37:07 -0400
Received: from mail-eopbgr140131.outbound.protection.outlook.com
 ([40.107.14.131]:19269 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iJvqj-0002SI-Ap; Mon, 14 Oct 2019 04:37:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKcqxpqKJLDx075hAA+k8JHrUW6SvV87nmi+a+w0WcVdCZXUih0fkCw97xdzOdsz7SLvjo3gyVdp1zxc/mSquBfzDosshZOS9fgNsmiKCIKEI7Vl3Q9546Xu+NzycDJqc4gVOT0y6MHOtVFxybrOK+2UbV0Qy+5UlX+TYQ6AR0LR607P+O0WjN6p/9cWpGQqkgLvuQhDMC921hBm+aVW1WyLx0tleORrhXao/2vaYAmrj1pwvDyxvy/pJgA5AuYQVYcInxLCqNlW49BSnbkgvD6zqwu8n05Oo5lxnR/TIngYmpI7QRTnrz65Xu6/9HmNociNm6TcwCXgsHOB+8apWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iqNKY1/GMzgMCBaOMKfrkCbnTPLvLlnM/sLwEsP4Zc=;
 b=ZU2/MU42VAtPATvptTzHCxzlyRD51foVuaRkTSeyVclReCtJgaiRAhcVh02iMxWKPuVIM72DZf8IDSPW3cakRtxe1bU1UsJlEAiGkrVuzSuZlyr0iiAkAcYWUmyc99nx5AVnIo1Zdi2B7snWp4rVltBom8iIF0lIblK6MdblCbHQvEBxnQlnlkJrgfkDJP0T74XSUjfXLLbiJyJmsE6oxBNODXceTUrqo4ZonQW4z/y9jgzaXgegFV5j7D0C/iDSkWzlATibUCVSq9+BSxtOtvU53lIbz5AeHCvuh0IuA3iGzIsiRgpLlxw7yLutDJw2si/Yz/jTSGwKuQyn4x1uLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iqNKY1/GMzgMCBaOMKfrkCbnTPLvLlnM/sLwEsP4Zc=;
 b=F+n1Wm7L1Gke/3dfc8E5SygGxPcYdhHgYbw/38qoiNb5dP1U+h7fgkveWVRRHOzqi7C0KgwjNKJ25dyfvbGsdnMdKtgaltsrWnkEF043bGVnp9stWCZ9WfbvHjDv8sv3gVETCIvzVfJwHJPGF1tPkNDtZk1ZgZSZLU3fHoomizg=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5339.eurprd08.prod.outlook.com (52.133.240.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 14 Oct 2019 08:37:02 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::2856:990a:197a:288f]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::2856:990a:197a:288f%2]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 08:37:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "armbru@redhat.com" <armbru@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, John Snow
 <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Paolo Bonzini <pbonzini@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Stefan Weil
 <sw@weilnetz.de>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven
 <pl@kamp.de>, Denis Lunev <den@virtuozzo.com>, Alberto Garcia
 <berto@igalia.com>, Jason Dillaman <dillaman@redhat.com>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>, Liu Yuan
 <namei.unix@gmail.com>, "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody
 <codyprime@gmail.com>, =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?=
 <marcandre.lureau@redhat.com>, =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?=
 <berrange@redhat.com>, Richard Henderson <rth@twiddle.net>, Greg Kurz
 <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Beniamino Galvani <b.galvani@gmail.com>, Peter
 Maydell <peter.maydell@linaro.org>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Antony
 Pavlov <antonynpavlov@gmail.com>, Jean-Christophe Dubois
 <jcd@tribudubois.net>, Peter Chubb <peter.chubb@nicta.com.au>, Subbaraya
 Sundeep <sundeep.lkml@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Paul
 Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, David Gibson
 <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>, Xiao Guangrong
 <xiaoguangrong.eric@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jason Wang <jasowang@redhat.com>, Laszlo
 Ersek <lersek@redhat.com>, Yuval Shaia <yuval.shaia@oracle.com>, Palmer
 Dabbelt <palmer@sifive.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Farman
 <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Hannes
 Reinecke <hare@suse.com>, Michael Walle <michael@walle.cc>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Alex Williamson <alex.williamson@redhat.com>, 
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Hailiang Zhang
 <zhang.zhanghailiang@huawei.com>, Juan Quintela <quintela@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Luigi Rizzo <rizzo@iet.unipi.it>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Vincenzo Maffione
 <v.maffione@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Anthony Green
 <green@moxielogic.com>, Stafford Horne <shorne@gmail.com>, Guan Xuetao
 <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "integration@gluster.org"
 <integration@gluster.org>, "sheepdog@lists.wpkg.org"
 <sheepdog@lists.wpkg.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [RFC v5 000/126] error: auto propagated local_err
Thread-Topic: [RFC v5 000/126] error: auto propagated local_err
Thread-Index: AQHVgE3dlsNxBDOk202dFu/C5nZLkadVqtKAgAQpoAA=
Date: Mon, 14 Oct 2019 08:37:01 +0000
Message-ID: <83b75543-9bb7-f090-db59-3402aff7fa42@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <b4195e1b-c78d-a58e-d34c-eddbd8d1f438@redhat.com>
In-Reply-To: <b4195e1b-c78d-a58e-d34c-eddbd8d1f438@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0502CA0010.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::20) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191014113652697
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43fc669a-a3d9-41ad-2f9b-08d75081aed2
x-ms-traffictypediagnostic: DB8PR08MB5339:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB533967A66E873853763FEBA5C1900@DB8PR08MB5339.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(39840400004)(376002)(136003)(346002)(396003)(366004)(53754006)(189003)(199004)(31686004)(64756008)(66556008)(66476007)(66946007)(11346002)(7416002)(7366002)(7406005)(7336002)(7276002)(71200400001)(71190400001)(66446008)(7736002)(305945005)(81166006)(8676002)(8936002)(81156014)(66066001)(186003)(476003)(102836004)(486006)(26005)(2906002)(446003)(86362001)(2616005)(5660300002)(110136005)(99286004)(54906003)(316002)(76176011)(53546011)(386003)(36756003)(6506007)(6116002)(52116002)(31696002)(6486002)(3846002)(14444005)(2501003)(229853002)(25786009)(6512007)(6306002)(256004)(4326008)(6436002)(966005)(6246003)(14454004)(478600001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB5339;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gk1BEf3Or4bjp193XOLfAz5boGQ5K2Yr+UmwwgKTeJK9lsxmB0OiR6kBojgEACalGS5BnOJUpdNg3fK26cZesmUs6TA1PAFlg/q5erduxwnyvypTzQIPXpP3z8d5N9bg+ziO7UBhgazbbTJt+Xkfm4cweTrbORoJRvH2g+Y43B02aINMnNO1aCFIt11P2H7Y/rnU1x+oycNoJaqRNcywR3hKHDF63lhTZ6tZhdNgjq/Z0e0R35zKoGWDm1siUzXo5uUXW22JghxkZlZ+7NmdqjDIcP9PWUyqO4S0NISG6EMqDvLpeLQ3ltHeK1WCV2Q5qsEyH9u4ixp/lxJ+Hd0Jskp0cEbnmnFPMlh4yJ3cyMmsj7Z4qSoGWYuqrv919UZIQpuuFolp+q4VA4BV6tS0nDQDSfq/HUf3KgCPJuwIAnkdeYUA4w7zmXItxO+Ve3Ft/eyWdaqroJV3vAC0rV/7rA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8115239075DDB45867AEAB0D73FECF5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43fc669a-a3d9-41ad-2f9b-08d75081aed2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 08:37:01.7914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6ZzF0P08em5jmzrClGNRULqfk1ZBCPfgNnn3qH7AJJdGPADDXkLN3CnK3pm3cNnNF5isMt6skpLbyDuIlnrrlhyX2HNTkMYUXLa6s4fS9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5339
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.14.131
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
X-List-Received-Date: Mon, 14 Oct 2019 08:37:09 -0000

MTEuMTAuMjAxOSAyMDowMiwgRXJpYyBCbGFrZSB3cm90ZToNCj4gT24gMTAvMTEvMTkgMTE6MDMg
QU0sIFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgd3JvdGU6DQo+PiBIaSBhbGwhDQo+Pg0K
Pj4gQXQgdGhlIHJlcXVlc3Qgb2YgTWFya3VzOiBmdWxsIHZlcnNpb24gb2YgZXJycCBwcm9wYWdh
dGlvbi4gTGV0J3MgbG9vaw0KPj4gYXQgaXQuIENvdmVyIGFzIG11Y2ggYXMgcG9zc2libGUsIGV4
Y2VwdCBpbnNlcnRpbmcgbWFjcm8gaW52b2NhdGlvbg0KPj4gd2hlcmUgaXQncyBub3QgbmVjZXNz
YXJ5Lg0KPj4NCj4+IEl0J3MgaHVnZSwgYW5kIHNvIGl0J3MgYW4gUkZDLg0KPiANCj4gSXMgdGhl
cmUgYSByZXBvIGNvbnRhaW5pbmcgdGhlc2UgcGF0Y2hlcywgdG8gbWFrZSBpdCBlYXNpZXIgdG8g
cGxheSB3aXRoIHRoZW0gbG9jYWxseSB3aXRob3V0IGhhdmluZyB0byAnZ2l0IGFtJyB0aGUgZW50
aXJlIDEyNiBtZXNzYWdlcz8NCg0KRG9uZToNCg0KaHR0cHM6Ly9zcmMub3BlbnZ6Lm9yZy91c2Vy
cy92c2VtZW50c292L3JlcG9zL3FlbXUvYnJvd3NlDQoNCmh0dHBzOi8vc3JjLm9wZW52ei5vcmcv
c2NtL352c2VtZW50c292L3FlbXUuZ2l0ICN0YWcgdXAtYXV0by1sb2NhbC1lcnItdjUNCg0KPiAN
Cj4gDQo+PiDCoCB1dGlsL3FlbXUtc29ja2V0cy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMzEgKy0tDQo+PiDCoCB2bC5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMTQgKy0NCj4+IMKgIHB5dGhvbi9jb21taXQtcGVyLXN1YnN5
c3RlbS5wecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIwNCArKysrKysrKysrKysr
Kw0KPj4gwqAgc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpIHwg
MTE4ICsrKysrKysrDQo+PiDCoCAzNDEgZmlsZXMgY2hhbmdlZCwgMzg1MSBpbnNlcnRpb25zKCsp
LCA0NDU1IGRlbGV0aW9ucygtKQ0KPj4gwqAgY3JlYXRlIG1vZGUgMTAwNzU1IHB5dGhvbi9jb21t
aXQtcGVyLXN1YnN5c3RlbS5weQ0KPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMvY29j
Y2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaQ0KPiANCj4gU28sIHdoZXRoZXIgb3Ig
bm90IHdlIHRha2UgY29tbWl0LXBlci1zdWJzeXN0ZW0ucHksIHRoZSBvdmVyYWxsIHNlcmllcyBh
cHBlYXJzIHRvIGJlIGEgbmljZSByZWR1Y3Rpb24gaW4gbGluZXMgb2YgY29kZS4NCj4gDQoNCg0K
LS0gDQpCZXN0IHJlZ2FyZHMsDQpWbGFkaW1pcg0K

