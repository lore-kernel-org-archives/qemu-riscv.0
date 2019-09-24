Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCfer-0002HM-P0
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 03:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCfeh-0002Bx-Qf
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 03:54:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCfef-0002Bt-Kl
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 03:54:39 -0400
Received: from mail-ve1eur01on0711.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::711]:51012
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCfeb-00029k-Vy; Tue, 24 Sep 2019 03:54:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMc8xDdVkp+WVfIzWQORB8tXJsVdk+w3YDBx5hLqCE3/puY869BboqAuxLcskVyWF9cSlfHL3QaLCBs1klrUj4/ZXfeATB+CxW3W9H0duQ6K/cVQcrzu4wKIzcfxEx9evf/h2GDM35hwps49cy4O87sXwCa9FYmEV33+T/8qSafS66WelaEff2Aw2X4Cxch2JMZvytTc/Cg/AyAfZVuimG/sF7LKvSt4rNRqJBwMtKuzHy3DN5yXu5WCUFgB+z+2hJN70I0cQRK1w8vXkc37Mz5Xy9IKbMVT5pkiNiuGWgTYu/xmH3ri3pEJYf6xo6E2dLfWw+UlHaIzN6AlzNLohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIgeirNZhwVWWSOFwVPvSYLwY9tTAKHHrb+6pw3Vvzc=;
 b=gIC3ReIKD5w8Ke6m4O3Gmw1YBsTvCExSQwskqCdpYz9ENbUFDLy/FTmcPhqvqL8rHP1rLF1MZG4wVnWs0P9LSPFwf+XD919P2DbVmmHxcjSsZce+2qyswt6pedoNqwGCxYpJzVgdmaoXbLd4ETd9I1ZrSMNZx62fza+WO6xh0/LZ8Dn0YFbNtYFK+nL9HyZ5c9ycDOWQ/y5KF6G55I6u2/the8KWMudRF8ji64ejbgvAP1J8NvHH3rJa5l85eLrkZ9vqgGZUnBdBrA5o2O9kXt+DGhNYUX/mMI9EcrdKGWvwx3czA9RmTnOIk1MJYqBCCwFDbyos+gORFmivrXYdyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIgeirNZhwVWWSOFwVPvSYLwY9tTAKHHrb+6pw3Vvzc=;
 b=qjxIo/UzN6G9zwbSFHMmQzv70vPHyOggOKsr5+a35UE8VWHaO/WsZzJ4Zafe2FS3HjDPYHYVA5JygTqdDbLWR4wOP8tpcfCPr/eL3jviPnvX7DcRPg3x+hCLYUCMG/xTsyDT+ZMqNqun4MDw1Q6cSmFJmi3UFiIueDVpztXtxBc=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5001.eurprd08.prod.outlook.com (10.255.16.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 07:54:30 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 07:54:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "kraxel@redhat.com" <kraxel@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "lvivier@redhat.com" <lvivier@redhat.com>,
 "amit@kernel.org" <amit@kernel.org>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>, "ari@tuxera.com" <ari@tuxera.com>,
 "pavel.dovgaluk@ispras.ru" <pavel.dovgaluk@ispras.ru>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>, "sw@weilnetz.de" <sw@weilnetz.de>,
 "fam@euphon.net" <fam@euphon.net>, "ronniesahlberg@gmail.com"
 <ronniesahlberg@gmail.com>, "pl@kamp.de" <pl@kamp.de>, Denis Lunev
 <den@virtuozzo.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "berto@igalia.com" <berto@igalia.com>, "dillaman@redhat.com"
 <dillaman@redhat.com>, "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>, "namei.unix@gmail.com"
 <namei.unix@gmail.com>, "rjones@redhat.com" <rjones@redhat.com>,
 "codyprime@gmail.com" <codyprime@gmail.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "rth@twiddle.net" <rth@twiddle.net>,
 "groug@kaod.org" <groug@kaod.org>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "Andrew.Baumann@microsoft.com"
 <Andrew.Baumann@microsoft.com>, "philmd@redhat.com" <philmd@redhat.com>,
 "antonynpavlov@gmail.com" <antonynpavlov@gmail.com>, "jcd@tribudubois.net"
 <jcd@tribudubois.net>, "peter.chubb@nicta.com.au" <peter.chubb@nicta.com.au>, 
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>, "joel@jms.id.au"
 <joel@jms.id.au>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>, "balrogg@gmail.com"
 <balrogg@gmail.com>, "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "pburton@wavecomp.com"
 <pburton@wavecomp.com>, "arikalo@wavecomp.com" <arikalo@wavecomp.com>,
 "clg@kaod.org" <clg@kaod.org>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "crwulff@gmail.com" <crwulff@gmail.com>, "marex@denx.de" <marex@denx.de>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "cohuck@redhat.com"
 <cohuck@redhat.com>, "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "hpoussin@reactos.org" <hpoussin@reactos.org>, "xiaoguangrong.eric@gmail.com"
 <xiaoguangrong.eric@gmail.com>, "aurelien@aurel32.net"
 <aurelien@aurel32.net>, "amarkovic@wavecomp.com" <amarkovic@wavecomp.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "lersek@redhat.com"
 <lersek@redhat.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "david@redhat.com" <david@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>, 
 "farman@linux.ibm.com" <farman@linux.ibm.com>, "walling@linux.ibm.com"
 <walling@linux.ibm.com>, "hare@suse.com" <hare@suse.com>, "michael@walle.cc"
 <michael@walle.cc>, "atar4qemu@gmail.com" <atar4qemu@gmail.com>,
 "stefanb@linux.ibm.com" <stefanb@linux.ibm.com>,
 "samuel.thibault@ens-lyon.org" <samuel.thibault@ens-lyon.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>, "pmorel@linux.ibm.com"
 <pmorel@linux.ibm.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "mdroth@linux.vnet.ibm.com"
 <mdroth@linux.vnet.ibm.com>, "zhang.zhanghailiang@huawei.com"
 <zhang.zhanghailiang@huawei.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "rizzo@iet.unipi.it" <rizzo@iet.unipi.it>, "g.lettieri@iet.unipi.it"
 <g.lettieri@iet.unipi.it>, "v.maffione@gmail.com" <v.maffione@gmail.com>,
 "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>, "green@moxielogic.com"
 <green@moxielogic.com>, "shorne@gmail.com" <shorne@gmail.com>,
 "gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>, "jcmvbkbc@gmail.com"
 <jcmvbkbc@gmail.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "integration@gluster.org" <integration@gluster.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [RFC v2 7/9] Use auto-propagated errp
Thread-Topic: [RFC v2 7/9] Use auto-propagated errp
Thread-Index: AQHVcio2QQn2PPiLskGYHg6Pi8bE8Kc5tyiAgAC/DgA=
Date: Tue, 24 Sep 2019 07:54:29 +0000
Message-ID: <6191a8ae-983a-ebc2-98bd-14c6b351b00e@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <20190923161231.22028-8-vsementsov@virtuozzo.com>
 <59c5ccc7-3d4c-9613-fcd3-97642c1394cd@redhat.com>
In-Reply-To: <59c5ccc7-3d4c-9613-fcd3-97642c1394cd@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0901CA0055.eurprd09.prod.outlook.com
 (2603:10a6:3:45::23) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190924105420756
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08e2405c-5c6b-4ee4-a9aa-08d740c46d70
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB8PR08MB5001; 
x-ms-traffictypediagnostic: DB8PR08MB5001:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB50018935B6CCD604EA296315C1840@DB8PR08MB5001.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:457;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39840400004)(366004)(346002)(396003)(376002)(136003)(189003)(199004)(2501003)(25786009)(36756003)(66946007)(305945005)(66476007)(476003)(66556008)(81166006)(5660300002)(8936002)(446003)(2616005)(31696002)(54906003)(6436002)(2906002)(7736002)(6486002)(11346002)(7276002)(256004)(3846002)(14454004)(31686004)(6246003)(26005)(4326008)(102836004)(86362001)(6506007)(7416002)(52116002)(76176011)(45426003)(110136005)(386003)(7336002)(186003)(7406005)(7366002)(6116002)(316002)(486006)(6512007)(99286004)(71200400001)(71190400001)(64756008)(66446008)(81156014)(229853002)(8676002)(478600001)(53546011)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB5001;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DgTMU3Cno4BBcv9hyvyNQ2DGCflxF8AbeIrinOSnnd/vP1pRcbEzXnfnzuY8Zx0uRFWvnlRBVtnXESosftMO6tEq5LCUfGLhV4a3vtbkhrc7ZZ7DP44MgH4wAM0iKSoeeXBwwMed0LmhhGaogcvrjOzBTEl/Fowdawk+qaVfhz9OVxTiJAGJaEycFcRMYAP49E2q8CDhaiK497nT2JJPKBeP821idhCcb5NBdeBuF9bCefZNiq+uAu+a8cVipVYXn52QNSWhJ1jMLFw8lKwnc/vA/8RsVxmnLJnsyf80fWz3Mr7UCM709hMn+h7ilEGnohUTebvM/c3ZiXBHl6mH0G4cvtzDPyTcPQaEEpmGIhbyZGyXOaahIi82Hrd7M/3NdGwzsXODQwZhR8EGyzhU5BcFnk4SCIqqMOZmsF0dl3s=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2B0EC06FDE38E48A415580333DB3103@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e2405c-5c6b-4ee4-a9aa-08d740c46d70
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 07:54:29.4735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqX4zlHD8Ryipw7oe81+uLMbsiyEy428psN5yjRKuJCSXgyYMWTJJ3Fg427KKwyF1tW0H7ZsnAf+l9CoMKfSf98zjaG2O19Zn5eLeZUdc3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5001
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe1f::711
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
X-List-Received-Date: Tue, 24 Sep 2019 07:54:43 -0000

MjMuMDkuMjAxOSAyMzozMCwgRXJpYyBCbGFrZSB3cm90ZToNCj4gT24gOS8yMy8xOSAxMToxMiBB
TSwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4+IFRoaXMgY29tbWl0IGlz
IGdlbmVyYXRlZCBieSBjb21tYW5kDQo+Pg0KPj4gZ2l0IGdyZXAgLWwgJ0Vycm9yIFwqXCplcnJw
JyB8IHdoaWxlIHJlYWQgZjsgXA0KPj4gZG8gc3BhdGNoIC0tc3AtZmlsZSBcDQo+PiBzY3JpcHRz
L2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgLS1pbi1wbGFjZSAkZjsgZG9u
ZQ0KPj4NCj4gDQo+IEFzIG1lbnRpb25lZCBpbiB5b3VyIGNvdmVyIGxldHRlciwgdGhpcyBmYWls
cyBzeW50YXgtY2hlY2sgYW5kDQo+IGNvbXBpbGF0aW9uIHdpdGhvdXQgc3F1YXNoaW5nIGluIHNv
bWUgZm9sbG93dXBzOyBpZiB3ZSBjYW4ndCBpbXByb3ZlIHRoZQ0KPiAuY29jY2kgc2NyaXB0IHRv
IGRvIGl0IGF1dG9tYXRpY2FsbHksIHRoZW4gbWFudWFsbHkgc3F1YXNoaW5nIGluDQo+IGNsZWFu
dXBzIChhbmQgZG9jdW1lbnRpbmcgd2hhdCB0eXBlcyBvZiBjbGVhbnVwcyB0aGV5IHdlcmUpIGlz
IGZpbmUuDQo+IChUaGUgZ29hbCBmb3IgYSBtZWNoYW5pY2FsIHBhdGNoIGxpa2UgdGhpcyBpcyB0
byBtYWtlIGl0IGVhc3kgZW5vdWdoIHRvDQo+IGF1dG9tYXRlIGRvd25zdHJlYW0sIGV2ZW4gd2hl
cmUgdGhlIGZpbGUgY29udGVudHMgYXJlIGNoYW5nZWQsIGJ1dCB3aGVyZQ0KPiB0aGUgcHJvY2Vz
cyBmb3IgY3JlYXRpbmcgdGhvc2UgY2hhbmdlcyBhcmUgdGhlIHNhbWUpLg0KPiANCj4+IFNpZ25l
ZC1vZmYtYnk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVv
enpvLmNvbT4NCj4+IC0tLQ0KPiANCj4gU3BvdC1jaGVja2luZw0KPiANCj4+ICAgYmxvY2svaW8u
YyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKy0NCj4gDQo+PiAgIGJsb2NrL25iZC5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQ0ICsrKy0tLQ0KPiANCj4+ICAgcWFwaS9xYXBp
LXZpc2l0LWNvcmUuYyAgICAgICAgICAgICAgfCAgNTMgKystLS0tLQ0KPiANCj4ganVzdCB0byBz
ZWUgaG93IGl0IGxvb2tzLg0KPiANCj4+ICsrKyBiL2Jsb2NrL2lvLmMNCj4+IEBAIC0xMzYsNyAr
MTM2LDYgQEAgc3RhdGljIHZvaWQgYmRydl9tZXJnZV9saW1pdHMoQmxvY2tMaW1pdHMgKmRzdCwg
Y29uc3QgQmxvY2tMaW1pdHMgKnNyYykNCj4+ICAgdm9pZCBiZHJ2X3JlZnJlc2hfbGltaXRzKEJs
b2NrRHJpdmVyU3RhdGUgKmJzLCBFcnJvciAqKmVycnApDQo+PiAgIHsNCj4+ICAgICAgIEJsb2Nr
RHJpdmVyICpkcnYgPSBicy0+ZHJ2Ow0KPj4gLSAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsN
Cj4+ICAgDQo+IA0KPiBVbW0sIG5vIGluc2VydGlvbiBvZiBFUlJfRlVOQ1RJT05fQkVHSU4oKS4g
IE9vcHMuDQoNCg0KT29wcy4gU2VlbXMgSSBpbmplY3RlZCBpdCBfb25seV8gdG8gZW1wdHkgZnVu
Y3Rpb25zLiBJdCdzIGJlY2F1c2UgSSBtaXNzZWQgJy4uLicgaW4gZmlyc3QgaHVuay4NCg0KLS0g
DQpCZXN0IHJlZ2FyZHMsDQpWbGFkaW1pcg0K

