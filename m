Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCn4n-0001nZ-HL
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 11:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCn4j-0001eY-5P
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 11:50:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCn4h-0004ho-EE
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 11:50:00 -0400
Received: from mail-eopbgr20113.outbound.protection.outlook.com
 ([40.107.2.113]:38466 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCn4g-0004h4-Vl; Tue, 24 Sep 2019 11:49:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSEKDVbJ9Gki2pPgedTdaLiRygHNveSpVA25Qv2dVAUF9O1R32kghmdslsXVrPmPrgxxG7njhrCbrPabB5CoULSbkbkyK6y1AFGDvytvwVl+V/Y6xauOgLtA1kX+YbgPM4YjdK2hrjyedw6bzbmT9Q2aC98qFr52gPyMhSLbHEI1R/j+H7zjZ7EVxVIYzm5ngh4PE+Scg9p2gcRLLue/Sz9Ch+kMnXzInES5OG6xZxj5n2hlqONlaDjZPCYb1eETGbv9KFXxDUxyD1mou9kjQWRilW+6LKkWmEIqv22WN44Y2J4b0M7beMXgiSA/t4BtJiIZ6uHyQzbbGVo6ASeW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGNhE3FkOOtlmab3kukMvUO17pvR30awR56cKc61XxA=;
 b=Tpuq1Pfwp6BAWEUoJQtfjsSJtwJJNC/OBP0b4Qg1NButlFRiEomCdlCsyuJ7jIYQZG+q9tWOrYVYHYUuyIVsXJ/la1C4W4JqXXhb+ZgmsL1gLdywwbht3/Ri78XXF/gP0Uv1/H2W28cEnNy1wnsIo+DOm/yaSYmP79ABupSc9nd4pLnW3J7P1GIS7Q11joJ2r+kJJzYE/eM4/ySKyfsKcsiq5+WW9pUD+vAzeJZKPhGtqY9jpJZt+b7BueE5auhp0tGeQ20ZkT0cK5v/C+HVXPV2JUU09qMPGRjk46SAfI0OrTACiHKegerHKKJZ1pGJnh57oEv0GoOscRKEqhoB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGNhE3FkOOtlmab3kukMvUO17pvR30awR56cKc61XxA=;
 b=elq6M27e3p4cXyZXqGZ4NbZ0SLh7ZtccwkZA4rOp1XQ8MHRY4F8vqKifTNdRcInlbRst1lJ0HTdcusgj4c2QWW8i9uM7kPWm3UXkVrulSeI+eOKggYLXVAPsnL2Zv2pwdmOg861Ig/ppEDp4988972RviZCxmakBBKIe7VsXAms=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5001.eurprd08.prod.outlook.com (10.255.16.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 15:49:55 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 15:49:55 +0000
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
Subject: Re: [RFC v2 0/9] error: auto propagated local_err
Thread-Topic: [RFC v2 0/9] error: auto propagated local_err
Thread-Index: AQHVcioNiDMY2yo+Z0yF9jZaFGvJZ6c5qyCAgAFm+wD//+MaAIAANo8AgAAAnID//86sAA==
Date: Tue, 24 Sep 2019 15:49:55 +0000
Message-ID: <0bc76371-c667-3fa7-8fea-c3c3df84a7d6@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <d1527fdc-b5e8-093a-9206-6f7ceeece2ac@redhat.com>
 <84c9e5dd-3e0f-94e1-5da1-2c7baa594bf1@virtuozzo.com>
 <22191b09-822a-1f54-dcaa-3726c833805b@redhat.com>
 <97b77e48-b370-a596-0a06-9ceaaf6bc72e@virtuozzo.com>
 <824bb514-fc6f-7adc-4f4f-97dd758fb04d@virtuozzo.com>
In-Reply-To: <824bb514-fc6f-7adc-4f4f-97dd758fb04d@virtuozzo.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0263.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::15) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190924184945944
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46ee16db-2bd6-473a-2602-08d74106d828
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB8PR08MB5001; 
x-ms-traffictypediagnostic: DB8PR08MB5001:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB5001239B42BDD32C6D4F2DB6C1840@DB8PR08MB5001.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(396003)(136003)(346002)(366004)(376002)(189003)(199004)(6116002)(7366002)(186003)(7336002)(7406005)(486006)(316002)(110136005)(386003)(7416002)(45426003)(76176011)(52116002)(8676002)(229853002)(66066001)(53546011)(478600001)(99286004)(6512007)(71190400001)(71200400001)(66446008)(6506007)(81156014)(64756008)(476003)(446003)(54906003)(6436002)(31696002)(2906002)(7736002)(6486002)(11346002)(25786009)(305945005)(2501003)(66946007)(36756003)(81166006)(5660300002)(66476007)(8936002)(66556008)(86362001)(4326008)(102836004)(31686004)(7276002)(14454004)(3846002)(256004)(6246003)(26005)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB5001;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zExEZ2jJEKUDXgLfOvkABcELH2E6WbgGDJ0YwdHTAPETFLPHbGo6+ArElDjo3kOPAWSQuOxwSGeotSe8eNw9u4duIN5m3JhhnGa9PhgmUkyY3clgFQNq6Ra4UVmMhKiHm6k/0h9NYX3V+4cndk15xAvIkk8bf2KA+EYzB0+CSOWbWoEAFCo+vpjwYyneru88UBAj/24cwLa4xQ+nfDMOGVhrYtY8D/gahzhduPyw5KOPkB+uYHjeW/q4zvqwHUT91Ggz7RpoWHnIIYdtFeczGts4FQtT56ijkZ5DF0wCC/AujrzPP5qC3yDmELgHWUmmhFUO2TUkujhaSV2JS9ERh+8aOtOf0lmzgRtyqPl5ZiIpXLPo7SWlrhMmJVj2QoXMddKkXRBJqXiyyj9RGP4UfOTDXITwlCHnnuXhy1kByns=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39351F639149824DB65B3A4D7B2A1DCC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ee16db-2bd6-473a-2602-08d74106d828
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:49:55.4017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bynMqc7QWR4XEmJZUnUNKwLG76aZnCw0hjYAIQ4PqlkBlZijVham5WIs6eEv0jJxQ00wz4kKUHOnJ7AZftRI0y3xWS8bz6nU/j+8y73WHd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5001
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.2.113
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
X-List-Received-Date: Tue, 24 Sep 2019 15:50:04 -0000

MjQuMDkuMjAxOSAxODo0NiwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4g
MjQuMDkuMjAxOSAxODo0NCwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4+
IDI0LjA5LjIwMTkgMTg6MjgsIEVyaWMgQmxha2Ugd3JvdGU6DQo+Pj4gT24gOS8yNC8xOSA5OjEy
IEFNLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOg0KPj4+DQo+Pj4+Pj4gMy4g
V2hhdCB0byBkbyB3aXRoIGh1Z2UgYXV0by1nZW5lcmF0ZWQgY29tbWl0IDA3PyBTaG91bGQgSSBz
cGxpdCBpdA0KPj4+Pj4+IHBlci1tYWludGFpbmVyIG9yIHBlci1zdWJzeXN0ZW0sIG9yIGxlYXZl
IGl0IGFzLWlzPw0KPj4+Pj4NCj4+Pj4+IEl0J3MgYmlnLiBJJ2Qgc3BsaXQgaXQgaW50byBtdWx0
aXBsZSBwYXRjaGVzIChhbmQgcmVkdWNlIHRoZSBjYyAtIGV4Y2VwdA0KPj4+Pj4gZm9yIHRoZSBj
b3ZlciBsZXR0ZXIsIHRoZSByZXN0IG9mIHRoZSBwYXRjaGVzIGNhbiBiZSBsaW1pdGVkIHRvIHRo
ZQ0KPj4+Pj4gYWN0dWFsIG1haW50YWluZXIvc3Vic3lzdGVtIGFmZmVjdGVkIHJhdGhlciB0aGFu
IGV2ZXJ5b25lIGludm9sdmVkDQo+Pj4+PiBhbnl3aGVyZSBlbHNlIGluIHRoZSBzZXJpZXMuIFdp
dGggdGhlIGN1cnJlbnQgbGFyZ2UgY2MsIGFueW9uZSB0aGF0DQo+Pj4+PiByZXBsaWVzIGdldHMg
c2V2ZXJhbCBtYWlsIGJvdW5jZXMgYWJvdXQgInRvbyBtYW55IHJlY2lwaWVudHMiKS7CoCBJdCBt
YXkNCj4+Pj4+IGJlIGVhc2llciB0byBzcGxpdCBhbG9uZyBkaXJlY3RvcnkgYm91bmRhcmllcyB0
aGFuIGJ5IG1haW50YWluZXINCj4+Pj4+IGJvdW5kYXJpZXMuwqAgTWFya3VzIGhhcyBhcHBsaWVk
IGxhcmdlIHRyZWUtd2lkZSBDb2NjaW5lbGxlIGNsZWFudXBzDQo+Pj4+PiBiZWZvcmUsIG1heWJl
IGhlIGhhcyBzb21lIGFkdmljZS4NCj4+Pj4NCj4+Pj4NCj4+Pj4gSWYgc3BsaXQgYnkgc3Vic3lz
dGVtIGl0IHdvdWxkIGJlIDIwMCsgcGF0Y2hlczoNCj4+Pj4gZ2l0IGRpZmYgLS1uYW1lLW9ubHkg
fCB3aGlsZSByZWFkIGY7IGRvIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLWYgJGYgLS1zdWJz
eXN0ZW0gLS1uby1yb2xlc3RhdHMgMj4vZGV2L251bGwgfCBncmVwIC12IEAgfCBoZWFkIC0xOyBk
b25lIHwgc29ydCB8IHVuaXEgfCB3YyAtbA0KPj4+PiAyMDUNCj4+Pj4NCj4+Pj4NCj4+Pj4gVHJ5
IHRvIGxvb2sgYXQgbGFyZ2VyIHN1YnN5c3RlbToNCj4+Pj4gZ2l0IGRpZmYgLS1uYW1lLW9ubHkg
fCB3aGlsZSByZWFkIGY7IGRvIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLWYgJGYgLS1zdWJz
eXN0ZW0gLS1uby1yb2xlc3RhdHMgMj4vZGV2L251bGwgfCBncmVwIC12IEAgfCB0YWlsIC0yIHwg
aGVhZCAtMTsgZG9uZSB8IHNvcnQgfCB1bmlxIHwgd2MgLWwNCj4+Pj4gMTM5DQo+Pj4+DQo+Pj4+
IHN0aWxsIHRvbyBtYW55Li4gT3IgaXMgaXQgT0s/DQo+Pj4NCj4+PiBIbW0gLSB0aGF0IGJlY29t
ZXMgYSB0cmFkZW9mZiBpbiBsZW5ndGggb2YgdGhlIHNlcmllcyAod2hlcmUgaW5kaXZpZHVhbA0K
Pj4+IHBhdGNoZXMgbWF5IGJlIHJldmlld2VkIGZhc3QsIGJ1dCB3aGVyZSB0aGUgb3ZlcmFsbCBw
cm9jZXNzIG1heSBiZQ0KPj4+IGJvZ2dlZCBkb3duIGJ5IHNoZWVyIGxlbmd0aCksIHZzLiBsZW5n
dGggb2YgaW5kaXZpZHVhbCBlbWFpbHMgKHdoZXJlIHRoZQ0KPj4+IGVtYWlsIGl0c2VsZiBpcyBk
YXVudGluZywgYnV0IGFzIHRoZSByZXZpZXcgaXMgbWVjaGFuaWNhbCBhbmQgZG9uZSBieQ0KPj4+
IGF1dG9tYXRpb24sIGl0IGJlY29tZXMgYSBtYXR0ZXIgb2Ygc3BvdC1jaGVja2luZyBpZiB3ZSB0
cnVzdCB0aGF0IHRoZQ0KPj4+IGF1dG9tYXRpb24gd2FzIGRvbmUgY29ycmVjdGx5KS7CoCBZb3Ug
Y2FuIHByb2JhYmx5IGdyb3VwIGl0IGluIGZld2VyDQo+Pj4gcGF0Y2hlcywgYnkgam9pbmluZyBz
bWFsbGVyIHBhdGNoZXMgYWNyb3NzIGEgY291cGxlIG9mIHN1YnN5c3RlbXMuwqAgSXQncw0KPj4+
IGFuIGFydCBmb3JtLCB0aGVyZSdzIHByb2JhYmx5IHNldmVyYWwgd2F5cyB0byBkbyBpdCB0aGF0
IHdvdWxkIHdvcmssIGFuZA0KPj4+IGl0IGNvbWVzIGRvd24gdG8gYSBqdWRnbWVudCBjYWxsIG9u
IGhvdyBtdWNoIHdvcmsgeW91IHdhbnQgdG8gZG8gdG8gdHJ5DQo+Pj4gYW5kIHJlZHVjZSBvdGhl
cidzIHdvcmsgaW4gcmV2aWV3aW5nIGl0LsKgIE1heWJlIGV2ZW4gYW4gb2ZmLWhhbmQgc3BsaXQN
Cj4+PiBvZiBnYXRoZXJpbmcgZmlsZXMgdW50aWwgeW91IHJlYWNoIGFib3V0IDUwMCBvciBzbyBs
aW5lcyBwZXIgZGlmZi7CoCBJDQo+Pj4gd2lzaCBJIGhhZCBlYXNpZXIgYWR2aWNlIG9uIGhvdyB0
byB0YWNrbGUgdGhpcyBzb3J0IG9mIHByb2plY3QgaW4gdGhlDQo+Pj4gd2F5IHRoYXQgd2lsbCBn
ZXQgdGhlIGZhc3Rlc3QgcmVzcG9uc2UgdGltZS4NCg0KZ2l0IGRpZmYgfCB3YyAtbA0KNDg5NDEN
Cg0Kc28sIGJ5IDUwMCBsaW5lcyBpdCB3b3VsZCBiZSA5NyBwYXRjaGVzLg0KDQpTZWVtcywgd2Un
bGwgbmV2ZXIgYmUgYWJsZSB0byByZXZpZXcgdGhpcyB0aGluZyA6KA0KDQpBbnkgaWRlYXM/DQoN
Ck1heSBiZSwgc2VwYXJhdGUgYmlnIHBhdGNoLCB3aGljaCBqdXN0IGFkZCBFUlJQX0ZVTkNUSU9O
X0JFR0lOKCkgdG8gYWxsIGVycnAgZnVuY3Rpb25zPw0KDQo+Pj4NCj4+Pg0KPj4+Pj4+IMKgwqAg
dmwuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEzICstDQo+Pj4+Pj4gwqDCoCBzY3Jp
cHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgfMKgIDgyICsrKysrKysN
Cj4+Pj4+PiDCoMKgIDMxOSBmaWxlcyBjaGFuZ2VkLCAyNzI5IGluc2VydGlvbnMoKyksIDQyNDUg
ZGVsZXRpb25zKC0pDQo+Pj4+Pj4gwqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9jb2Nj
aW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpDQo+Pj4+Pg0KPj4+Pj4gVGhlIGRpZmZz
dGF0IGlzIGh1Z2UsIGJ1dCBwcm9taXNpbmcuDQo+Pj4NCj4+PiBXZSBhbHNvIGxlYXJuZWQgaW4g
cmV2aWV3cyBvZiA3LzkgdGhhdCB0aGUgZGlmZnN0YXQgaGVyZSBpcyBtaXNsZWFkaW5nLA0KPj4+
IHRoZSBudW1iZXIgb2YgaW5zZXJ0aW9ucyB3aWxsIGRlZmluaXRlbHkgYmUgaW5jcmVhc2luZyBv
bmNlIHRoZQ0KPj4+IENvY2NpbmVsbGUgc2NyaXB0IGlzIGZpeGVkIHRvIGluc2VydCB0aGUgbWFj
cm8gaW4gbW9yZSBmdW5jdGlvbnMsIGJ1dA0KPj4+IGhvcGVmdWxseSBpdCdzIHN0aWxsIGEgbmV0
IHJlZHVjdGlvbiBpbiBvdmVyYWxsIGxpbmVzLg0KPj4+DQo+Pg0KPj4gTm8gaG9wZSBmb3IgdXM6
IHdpdGggZml4ZWQgc2NyaXB0IEkgbm93IHNlZQ0KPj4NCj4+IDkxOSBmaWxlcyBjaGFuZ2VkLCA2
NDI1IGluc2VydGlvbnMoKyksIDQyMzQgZGVsZXRpb25zKC0pDQo+Pg0KPiANCj4gQWxzbywgSSBo
YXZlIGFkZCBpbmNsdWRlICJxYXBpL2Vycm9yLmgiIHRvIGZpbGVzLCB3aGVyZSBlcnJwIG9ubHkg
cGFzc2VkDQo+IHRvIGNhbGxlZCBmdW5jdGlvbnMgKG9yIGZvciBmdW5jdGlvbnMsIHdoaWNoIGFy
ZSBub3Qgc2ltcGxlIHN0dWJzKToNCj4gDQo+ICMgZ2l0IGRpZmYgfCBncmVwICcrI2luY2x1ZGUn
IHwgd2MgLWwNCj4gMjUzDQo+IA0KPiANCg0KDQotLSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWly
DQo=

