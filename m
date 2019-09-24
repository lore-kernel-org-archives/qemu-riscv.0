Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCiB0-0000E9-6v
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 06:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCiAw-0000A8-Lr
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 06:36:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCiAv-0005TO-FU
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 06:36:06 -0400
Received: from mail-eopbgr50098.outbound.protection.outlook.com
 ([40.107.5.98]:38605 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCiAr-0005Ro-Tm; Tue, 24 Sep 2019 06:36:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8BjiU/bFwBYJLgmXN0go770DziO46oyObhfNcKLcPU8WRmpkq7OInQDABbdCjgCwkGoJMLq562WsQc0bS75efH6Y+1FD1lI3mi7Ui3kcwMFzln1rq3bvyZNAoIa+WxkBBxSSpcgUL3DR3BZYnmb7P86OXcDHVBh78qOKqN7XL8KAwhO+4m1w+ZvIRR8RxHMdIgPJJHmc3l4VHbpBnWIHVK1Tguxe0WQrsPCcxCMUWJnyahBSr7RWKWthQS4kBmI+oiAETA3URlvOSqVuMmAaThvo1DcB8dZC5VbCMDXjVfzojwKFv+dNQsQT+d/AHnXiXrhmTZFq6d/Ktx+ni25SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmvZlQ0ce7s+N8dBgVBHG3H0VsJezhsQxCEK1sAZW9U=;
 b=ESQWuWoLU+g8e2hu72PyqWus4WgnmBwVGR/MepEepVPn041b8msEUMiXI17LVkwfOSCvhvWj3Se6sIo1Rj9zWijHB9QF3spyDxSUkXpxePfvzral5q/S5754Vqq99NWcF/DUTW9rnaKWVaehkXliQZsDzZYAkK8RV6HjeR+aKjqaFElDlDit5NJzKtV26hmdvoKLE5JSARGdTRTsB51QM+59knICFWi0XfI0B7ZuhPasEqDRFTpxixZ8Fw9ZkkAlvEnsYVwKmvKv06IQ0Z58eNpJsfpkvdNpnUy0JIJducQtQwnp9mRrm318Hg270tOhx4+/d3fPSNDh23XKQQ2fTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmvZlQ0ce7s+N8dBgVBHG3H0VsJezhsQxCEK1sAZW9U=;
 b=LztEQmsHM2zI64UGMgH8UzJzvkIEvZ2O+Kny1fRVdI7/GF8IB6+7fkca0aMzcrKL6zr1mxWwuiCDP5fn8/4pulAwdUVSbxFY7aXgm22HkctJCbtRmEww10ONuQo9MH5nfJU3NMGo4fybNApmq11558QXm7r7P+ROfwE9wna1GM4=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB3947.eurprd08.prod.outlook.com (20.179.11.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 10:35:56 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 10:35:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "jan.kiszka@siemens.com"
 <jan.kiszka@siemens.com>, "zhang.zhanghailiang@huawei.com"
 <zhang.zhanghailiang@huawei.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "arikalo@wavecomp.com" <arikalo@wavecomp.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "hpoussin@reactos.org"
 <hpoussin@reactos.org>, "anthony.perard@citrix.com"
 <anthony.perard@citrix.com>, "samuel.thibault@ens-lyon.org"
 <samuel.thibault@ens-lyon.org>, "philmd@redhat.com" <philmd@redhat.com>,
 "green@moxielogic.com" <green@moxielogic.com>, "lvivier@redhat.com"
 <lvivier@redhat.com>, "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>, "pl@kamp.de"
 <pl@kamp.de>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>, "eric.auger@redhat.com"
 <eric.auger@redhat.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "ronniesahlberg@gmail.com"
 <ronniesahlberg@gmail.com>, "rth@twiddle.net" <rth@twiddle.net>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "crwulff@gmail.com" <crwulff@gmail.com>, "sundeep.lkml@gmail.com"
 <sundeep.lkml@gmail.com>, "michael@walle.cc" <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "kbastian@mail.uni-paderborn.de"
 <kbastian@mail.uni-paderborn.de>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>, "david@redhat.com"
 <david@redhat.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "jcmvbkbc@gmail.com"
 <jcmvbkbc@gmail.com>, Denis Lunev <den@virtuozzo.com>, "hare@suse.com"
 <hare@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "namei.unix@gmail.com" <namei.unix@gmail.com>, "atar4qemu@gmail.com"
 <atar4qemu@gmail.com>, "amit@kernel.org" <amit@kernel.org>, "sw@weilnetz.de"
 <sw@weilnetz.de>, "groug@kaod.org" <groug@kaod.org>, "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.chubb@nicta.com.au" <peter.chubb@nicta.com.au>, "clg@kaod.org"
 <clg@kaod.org>, "shorne@gmail.com" <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "cohuck@redhat.com"
 <cohuck@redhat.com>, "amarkovic@wavecomp.com" <amarkovic@wavecomp.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>, "pburton@wavecomp.com"
 <pburton@wavecomp.com>, "sagark@eecs.berkeley.edu"
 <sagark@eecs.berkeley.edu>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>, "edgar.iglesias@gmail.com"
 <edgar.iglesias@gmail.com>, "gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
 "quintela@redhat.com" <quintela@redhat.com>, "mdroth@linux.vnet.ibm.com"
 <mdroth@linux.vnet.ibm.com>, "lersek@redhat.com" <lersek@redhat.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "antonynpavlov@gmail.com"
 <antonynpavlov@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>, "balrogg@gmail.com"
 <balrogg@gmail.com>, "Andrew.Baumann@microsoft.com"
 <Andrew.Baumann@microsoft.com>, "mreitz@redhat.com" <mreitz@redhat.com>,
 "walling@linux.ibm.com" <walling@linux.ibm.com>, "mst@redhat.com"
 <mst@redhat.com>, "mark.cave-ayland@ilande.co.uk"
 <mark.cave-ayland@ilande.co.uk>, "v.maffione@gmail.com"
 <v.maffione@gmail.com>, "marex@denx.de" <marex@denx.de>, "armbru@redhat.com"
 <armbru@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "alistair@alistair23.me"
 <alistair@alistair23.me>, "paul.durrant@citrix.com"
 <paul.durrant@citrix.com>, "pavel.dovgaluk@ispras.ru"
 <pavel.dovgaluk@ispras.ru>, "g.lettieri@iet.unipi.it"
 <g.lettieri@iet.unipi.it>, "rizzo@iet.unipi.it" <rizzo@iet.unipi.it>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "xiaoguangrong.eric@gmail.com"
 <xiaoguangrong.eric@gmail.com>, "pmorel@linux.ibm.com"
 <pmorel@linux.ibm.com>, "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "jcd@tribudubois.net" <jcd@tribudubois.net>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "stefanb@linux.ibm.com" <stefanb@linux.ibm.com>
Subject: Re: [RFC v2 6/9] scripts: add coccinelle script to use auto
 propagated errp
Thread-Topic: [RFC v2 6/9] scripts: add coccinelle script to use auto
 propagated errp
Thread-Index: AQHVcin6p36e+6YlfEqQb7RcIZ1Pjqc5sEKAgAAXhICAANuNgA==
Date: Tue, 24 Sep 2019 10:35:56 +0000
Message-ID: <4fa70142-28e1-9e38-9786-2a66728a0265@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <20190923161231.22028-7-vsementsov@virtuozzo.com>
 <57e97ed0-b1a1-d209-fc23-cf41ec467157@redhat.com>
 <7cffb999-35e5-742e-7241-6da4777885bf@redhat.com>
In-Reply-To: <7cffb999-35e5-742e-7241-6da4777885bf@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::23) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190924133547109
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d50a5f5d-ff28-4323-3246-08d740dafb61
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB8PR08MB3947; 
x-ms-traffictypediagnostic: DB8PR08MB3947:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB39476333DFCA0CD4085D94A4C1840@DB8PR08MB3947.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39840400004)(136003)(366004)(396003)(376002)(199004)(189003)(71190400001)(66556008)(53546011)(486006)(229853002)(476003)(446003)(14454004)(3846002)(7406005)(54906003)(64756008)(6116002)(305945005)(11346002)(7336002)(81156014)(81166006)(4326008)(66476007)(386003)(186003)(8936002)(8676002)(6506007)(2501003)(102836004)(31686004)(2616005)(66946007)(71200400001)(478600001)(26005)(7416002)(7366002)(52116002)(99286004)(6436002)(6486002)(36756003)(5024004)(6512007)(256004)(25786009)(6246003)(31696002)(45426003)(110136005)(76176011)(7736002)(5660300002)(66066001)(66446008)(316002)(86362001)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB3947;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2j4owejUvnBhqD0hl3IIEePXxL7vBGcG8sa09LjXPVbWS8un2ApBTnDVI3VuhleaSuH90XKUF65mtFSbi1iXgGKHTfFTtmR7fLTMpGPLfayuhN7SVBSLFizMVTnFxUXnSAzKZoMgF5URb9GMoNzbSB/1F5yPu9dS8Qmasz83fSgRY6TFY7tcH/DHH4zkVnobz6E08bak9AurVZthuaaAl7BBo7lbkAYgmceOiEoyTwCjGph7S7KM9fLz2fK5HmxrvYgDc7hgSSrg89A5oou+V5cBxv34s+Yr1tGCPgeaSaae3afOAj2/3tCMwkrrBEznxGwJeaUW9KZsnWTNLW4yQ4ki222kz1rBXiyzGAC1rJRpzhtNtoHplpKj7w6Tv5E0v7ROtuB91dkeYUFOnGVjC+PnNxFySm/OtnALVRaixFg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4D82432CE417948B1B27BA21D43D7C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50a5f5d-ff28-4323-3246-08d740dafb61
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 10:35:56.4626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjCKb0rEsZOAoQIEwq7sBdB76S93P7StQcNZwZ3hADTK+zI6sSX5vJxjO4pzP7MNyPPhoXMKP1w03ywhx0yRqEH1IptTdk19ujtCxJ6LSBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3947
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.5.98
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
X-List-Received-Date: Tue, 24 Sep 2019 10:36:08 -0000

MjQuMDkuMjAxOSAwOjI5LCBFcmljIEJsYWtlIHdyb3RlOg0KPiBPbiA5LzIzLzE5IDM6MDUgUE0s
IEVyaWMgQmxha2Ugd3JvdGU6DQo+IA0KPj4gRG9lcyBydW5uaW5nIHRoaXMgQ29jY2luZWxsZSBz
Y3JpcHQgMiB0aW1lcyBpbiBhIHJvdyBhZGQgYSBzZWNvbmQNCj4+IEVSUlBfRlVOQ1RJT05fQkVH
SU4oKSBsaW5lPyAgV2Ugd2FudCBpdCB0byBiZSBpZGVtcG90ZW50IChubyBjaGFuZ2VzIG9uDQo+
PiBhIHNlY29uZCBydW4pLiAgKEFkbWl0dGVkbHksIEkgZGlkIG5vdCBhY3R1YWxseSB0ZXN0IHRo
YXQgeWV0KS4gIEFsc28sIEkNCj4+IGRvbid0IGtub3cgaWYgdGhpcyBjYW4gYmUgdHdlYWtlZCB0
byBhdm9pZCBhZGRpbmcgdGhlIGxpbmUgdG8gYSBmdW5jdGlvbg0KPj4gd2l0aCBhbiBlbXB0eSBi
b2R5LCBtYXliZToNCj4+DQo+PiAgIGZuKC4uLiwgRXJyb3IgKiplcnJwLCAuLi4pDQo+PiAgIHsN
Cj4+ICsgICAgRVJSUF9GVU5DVElPTl9CRUdJTigpOw0KPj4gICAgICAgLi4uDQo+PiAgIH0NCg0K
Tm8sIHdlIG5lZWQgZXhhY3RseSB0aGlzIHRvIG1hdGNoIG5vdCBvbmx5IGVtcHR5IGZ1bmN0aW9u
cy4gQnV0IHdpdGggLi4uIGl0IG1hdGNoZXMNCmVtcHR5IGZ1bmN0aW9ucyBhcyB3ZWxsLg0KDQo+
IA0KPiBBbHNvIHVudGVzdGVkOg0KPiANCj4gICBmbiguLi4sIEVycm9yICoqZXJycCwgLi4uKQ0K
PiAgIHsNCj4gKA0KPiB8DQo+ICAgICAgIEVSUlBfRlVOQ1RJT05fQkVHSU4oKTsNCj4gICAgICAg
Li4uDQo+IHwNCj4gKyAgICBFUlJQX0ZVTkNUSU9OX0JFR0lOKCkNCj4gICAgICAgLi4uDQo+ICkN
Cj4gICB9DQoNClNlZW1zLCB0aGF0IGRvZXNuJ3Qgd29yay4uDQoNCkl0IHNheXM6DQoxMjogbm8g
YXZhaWxhYmxlIHRva2VuIHRvIGF0dGFjaCB0bw0KDQp3aGVyZSAxMiBpcyBsaW5lICIrICAgIEVS
UlBfRlVOQ1RJT05fQkVHSU4oKSINCg0KDQpTbywgSSB0ZW5kIHRvIGp1c3QgYWRkIGNodW5rIHRv
IHJlbW92ZSBkdXBsaWNhdGVkIGludm9jYXRpb24gOikNCg0KPiANCj4gDQo+PiBPdmVyYWxsLCB0
aGUgc2NyaXB0IG1ha2VzIHNlbnNlIGluIG15IHJlYWRpbmcgKGJ1dCBubyBpZGVhIGlmIGl0DQo+
PiBhY3R1YWxseSBjYXRjaGVzIGV2ZXJ5dGhpbmcgd2Ugd2FudCwgb3IgaWYgaXQgbWlzc2VkIHNv
bWV0aGluZykuDQo+IA0KPiBIYXZpbmcgc3BvdC1jaGVja2VkIDcsIGl0IGRlZmluaXRlbHkgbWlz
c2VzIGNhc2VzIHdoZXJlIGl0IHdhcyBzdXBwb3NlZA0KPiB0byBhZGQgRVJSUF9GVU5DVElPTl9C
RUdJTigpLg0KPiANCg0KDQotLSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWlyDQo=

