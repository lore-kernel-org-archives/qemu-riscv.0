Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kqAgv-0002Qb-1V
	for mharc-qemu-riscv@gnu.org; Fri, 18 Dec 2020 03:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61438633b=Atish.Patra@wdc.com>)
 id 1kqAgt-0002QK-LP; Fri, 18 Dec 2020 03:00:43 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:51595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61438633b=Atish.Patra@wdc.com>)
 id 1kqAgn-0007aM-3i; Fri, 18 Dec 2020 03:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608278437; x=1639814437;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=l0aDr+p0mPSADc+0f9su0/6PP5tykBQj8EopFxVJT1A=;
 b=Mr8VQgIWoD4Mq4zsON3kNuQz2uWry9mBBGsusyd5LC48OgWQrLxVAwI1
 ZQ6/n2MLZzj06UTQevpJcptG4eq78EgRasZoyZcOrwLNz2ISQH1rukE2H
 0j1Sh0/sI4y+bhmWQqvSB1QHf+MxIY0n7KtN0Z3gVhYNtTzyHlU5pfxMn
 is/ZiNXDeOQIbuDhDstFKKeNS9ZSV5/Cyew0c+RZCiloEHGpr9I7U/P3m
 bP6DnYb8H8vHMjyh/ghvCz1Wx8izOIU3kjlm58GI63TLNxGyi16MABtil
 0QoqQKx/PThMoXw/mVjEEJ1q6shQYNwh2Q/61ylvbnzw61c3PshXyWIrL A==;
IronPort-SDR: mcujYP/NSFlmlb3TMLfzIWnSa/gRTT0qm4kJ4GjC3l+K/Z5p7xH1+6sMMtiZGO4ggrWI+zeqMv
 uvMJ5dzyH2f2caK+xFEVVtaOJO2th+Ddx50X6vDcwf9GTvjLKHlpkZfYcB58Rk9Pu7Pr2aFmFt
 TC9KgEHXpwU+ewDalToHD0W2Un0Ziwn07JLkMgqzcIRZXgX0tuIQLPZ2GQjAMKO9i3tN0pafa5
 6i3ebtE60bEcO/nD1m25232BnUBo4X8BY09JTiCNQxAjwBRFjZU99RB2kZ3D771P8uyybg+U9g
 yrM=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="155475302"
Received: from mail-bn3nam04lp2058.outbound.protection.outlook.com (HELO
 NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.58])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 16:00:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnbcNe1SnOrtZPsLKIU5IT0jk7PjI+VD3P8kHtybw8Qsm6Y2DWGh8bJw2CUCJCIjND527iTOqBICzPXEI033vkbIFbj2DYFqSuRBvlehKTIGtmnLVr9IswDwUvQANUCP6MIgS6jMHbdMj3norA4Kyj0+bZ+FUsepk/O4Z5CCogT5Jb8pNpEuA5Vo3YcJq2OOuZDHpnQ4w3vHATnqAYLSzT3ZsDQE+NGPKfZsWe8wLUkJ2tx62JPRrdVWA1JDp9QFRUNBuduXuJ+Fuw7w6rzBtIl4g87/tBM2eZR6gTuGJP2Myq+qCHgb2FHO02ikMhuIjpyISennrCk0mpy8PesrqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0aDr+p0mPSADc+0f9su0/6PP5tykBQj8EopFxVJT1A=;
 b=X/UIHr0/9wieYerq8lnvfmQA2/DE0wSgzHI5h/AmZY1jhvvBdsh4fgpUYrTiQUt9lcP7RhjF9wd6WFwK5CStSUmVebkwrI+u5GB0m6buVlwMiKrRO37GpU0q7jNayjiSoRLpj+X9P58kw6Vgw8cQC2W/eV+hy1QOZ9nuYM9Wh683MOxyK42kRxahwyX68VqXPmHw9JQvgHqb5axyBL1GeouILpUsYXk56Jy6fsHAXPOXphP1QcmY542bvzAW8KRsFpcXjdRgkaQ5GX0wBGJWuK4BvKH9YnfT2wWnZivNni2mOSuwSmSpawqDpV0X+89qCPnpCeGBpcouKKll04BgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0aDr+p0mPSADc+0f9su0/6PP5tykBQj8EopFxVJT1A=;
 b=jk2+tRpZbfeuG98DrZK8+akLOTowClghD+hDtY0kdB1+XRu/UVicEef9g/9t6Qy1HFkHJxc2tq1/auKBKaRKjpfQ70Qv0+g93IDYZ/etlPqUuaUsVXIxBuZfzIBAnWrqrXcwnsbR7SpdfehLX/Ram3IiMAZaNxxEavBOeaZZGEo=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BYAPR04MB3991.namprd04.prod.outlook.com (2603:10b6:a02:b1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18; Fri, 18 Dec
 2020 08:00:32 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7%6]) with mapi id 15.20.3676.025; Fri, 18 Dec 2020
 08:00:32 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
CC: "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>, Alistair
 Francis <Alistair.Francis@wdc.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, Anup Patel <Anup.Patel@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
Thread-Topic: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
Thread-Index: AQHW1L5ec6Y+NBO69E2DOYgTLRiUVan8c1OAgAABxYCAAAGkgIAAB32A
Date: Fri, 18 Dec 2020 08:00:32 +0000
Message-ID: <67cbbde886c3ae6e57e837e79f466f4156a910f8.camel@wdc.com>
References: <20201217214826.2094617-1-atish.patra@wdc.com>
 <CAEUhbmUqJdpuqvZ6V3s9eeW=EUVXrnjbF5GRmygwaZhMGG-6sA@mail.gmail.com>
 <4f09804c0e35a45fcf3fa78b3f3ed55276d6e10f.camel@wdc.com>
 <CAEUhbmX16h5S5Y0kFsnDv6t2cnn6we-b-9U_cbnEQkrrckYy0w@mail.gmail.com>
In-Reply-To: <CAEUhbmX16h5S5Y0kFsnDv6t2cnn6we-b-9U_cbnEQkrrckYy0w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e5fc483f-f794-4678-9a12-08d8a32afe3c
x-ms-traffictypediagnostic: BYAPR04MB3991:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB399156DA8C56107FA98DD39CFAC30@BYAPR04MB3991.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kWKlnJjwOOlbtQ+dJ92lZKnHtGohPvQNEpYuYl6pb05sYjh10YolA5bDZDtgX82EEuZT+ZGUEYxdvIccmhlbgLX4iEjIxTvM+eGD5+rMYMTv/bOxS0E/onJEMLirwF8A9op1orkzJrTW/tP1cWnaDfp+W9gMLKqdk0fv5z8YvGYKBrOPysG4Q5gDzegCL5g/FDTrWj2ICFJ7R3dBHE+EsJBG2RVWu20wghwgzSzSe7xsLAClntM7upMyHuM5x2XmyPUo6r3/hVCn/eiMNNEH4W2/OXR2JjSlL68g5W/zn/4HYw7n19PXcIjthYJjxLuV9+im0OIZYdKzsk9XmWQYvf07Im7AhhdQLreQadMziCFEuE7tYpWNy3gVn2xFxYxilrSTeFDjkE/uaEzTwdyk4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6724.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(186003)(86362001)(4001150100001)(966005)(64756008)(478600001)(54906003)(6506007)(26005)(316002)(2616005)(8676002)(83380400001)(53546011)(71200400001)(2906002)(66946007)(66446008)(36756003)(6486002)(6916009)(8936002)(4326008)(66476007)(76116006)(6512007)(66556008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TG5PSll1bmdldjVpaHREcVZIUXFBRjJGZ1M4OHZwaVZ5MzJpZ1hvRlp2dkxw?=
 =?utf-8?B?YzdtTmlnVDhTU0RuTlNoMmczOGpVbmNFbkwvZlFCb2ptdDVuVEpuWEVsRWtm?=
 =?utf-8?B?czZGNDNkOThnWDBReHU0cnE3U0hHS3JsUkp5KzhZSmVJQjNiUjNrTUQyZE9T?=
 =?utf-8?B?eUM3RXRlVm1tQXFWUG8wNU8ySnFxay9ZbnR2RTUzM0w3QlprbThmQ2JZbEt5?=
 =?utf-8?B?MnJqdnMybFovY2FLdml4TkhGL3lOZVRiazgvc0dwWTNTOGNtc2RSdk9jSGZt?=
 =?utf-8?B?dWlyWnAvRFRCbittY0F0RC9XbFdwaFBDZzgvS3VBdFh1OEZUNDNacjFINGZF?=
 =?utf-8?B?bDhDMzRrRDhXVnAxNWNPN2J3S2RiR3crNDI1clFtcStwc2xGcGlWMytyWmtX?=
 =?utf-8?B?NlduOUhMalhHcmcvVmIyd1kzVkh5NnRoTWoxR2N6bnZqc005dXRhcnFsb0xo?=
 =?utf-8?B?azN5bURvYzJ5OEVwaVVVNzhjZm4yMk5heUtxS0pOdDVoTGVNbS83SVpJQ1NC?=
 =?utf-8?B?U0k2T01oOUpWVkhKekZoTFk3dVo2T0RNSkt1Mm9MejREK3g2UTRxalZsMEo2?=
 =?utf-8?B?NWRLTG11ZHNJb21PeWcrNW1NR2xMaTM5aEQ0Qm9iYTMzOE52bHRFR2JWcGZC?=
 =?utf-8?B?bVpnVzlZYTR0MFdZTVNyNG9XUmRJdFVQNG9uWGNSVHE1eEhUKzM2RVpCR2ta?=
 =?utf-8?B?anprSXFJTWdrVHpsNG43Tzhlc085OVU5UW5YRWR4Yi9FbXZmc0d4SjA5alNH?=
 =?utf-8?B?RjVRVkkyNU9RNDZvaVlTaUNxczUyV0YrNkUzZVNtRWxUcU16Z3RJeGZqdEFG?=
 =?utf-8?B?OHZlR2hENkN3KzB6cnRsTnR2dEVRQVN6M3lieE8reU0xcUhFcFc5ZHRVQWxN?=
 =?utf-8?B?dVVLaEhNTTF5Zkw2OGR0V1pqSGRoTUVCVVhxSkNxN3BUbWRsUTA0OHgzZ1ZH?=
 =?utf-8?B?TUhUbmhoQ0ZrTTQwMUpKaytkOUgyKzgvdTJSVGRxOXhSSnhmNlhGeFdQbTV2?=
 =?utf-8?B?RVZYVnRWeC9FTlExaXFvMmw5dVVBejkwUzdoYWFXbmpYRHRPZzg2dFIrUU1o?=
 =?utf-8?B?WDhDdkxjRWQ0aHI0QVh4cEhlc1FCMXNLRW53eWxNdzMyd2EzSko5dnptVlp1?=
 =?utf-8?B?a1JiNFFoc0xjbUp2TXBKRXpaZi9SdHExdVpDYWVQK2RLc3lHWDBxVXpteWpL?=
 =?utf-8?B?MFNrVlBIdXowTTNPTkVYcEpGVUtxRjh2K01OYno3WElsUWFLUXdlOVZrNnEr?=
 =?utf-8?B?cWp0eWpBYTRhOHJGM0hRUWNpYmplbGcxQ05JblQxQTRGbGRTQiszdDBxb2FB?=
 =?utf-8?Q?ZJ1glhR1IK4qd0pgqhM+j3Ugq7PWDSmqeR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <995FA2223EB4CC42B99C05641F9BC626@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fc483f-f794-4678-9a12-08d8a32afe3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2020 08:00:32.1108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ka+XmXofI6Y9j2IZW5D3nUreeIl8KxPv+Nmn+ib8Ba4+4OdzcYUx0AzC7E9K/ybETWHiWsjHRT0QPcX5nxW9xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3991
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=61438633b=Atish.Patra@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 18 Dec 2020 08:00:43 -0000

T24gRnJpLCAyMDIwLTEyLTE4IGF0IDE1OjMzICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gSGkg
QXRpc2gsDQo+IA0KPiBPbiBGcmksIERlYyAxOCwgMjAyMCBhdCAzOjI3IFBNIEF0aXNoIFBhdHJh
IDxBdGlzaC5QYXRyYUB3ZGMuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBPbiBGcmksIDIwMjAt
MTItMTggYXQgMTU6MjEgKzA4MDAsIEJpbiBNZW5nIHdyb3RlOg0KPiA+ID4gSGkgQXRpc2gsDQo+
ID4gPiANCj4gPiA+IE9uIEZyaSwgRGVjIDE4LCAyMDIwIGF0IDU6NDggQU0gQXRpc2ggUGF0cmEg
PGF0aXNoLnBhdHJhQHdkYy5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IEN1
cnJlbnRseSwgd2UgcGxhY2UgdGhlIERUQiBhdCAyTUIgZnJvbSA0R0Igb3IgZW5kIG9mIERSQU0N
Cj4gPiA+ID4gd2hpY2gNCj4gPiA+ID4gZXZlciBpcw0KPiA+ID4gPiBsZXNzZXIuIEhvd2V2ZXIs
IExpbnV4IGtlcm5lbCBjYW4gYWRkcmVzcyBvbmx5IDFHQiBvZiBtZW1vcnkNCj4gPiA+ID4gZm9y
DQo+ID4gPiA+IFJWMzIuDQo+ID4gPiA+IFRodXMsIGl0IGNhbiBub3QgbWFwIGFueXRoaW5nIGJl
eW9uZCAzR0IgKGFzc3VtaW5nIDJHQiBpcyB0aGUNCj4gPiA+ID4gc3RhcnRpbmcgYWRkcmVzcyku
DQo+ID4gPiA+IEFzIGEgcmVzdWx0LCBpdCBjYW4gbm90IHByb2Nlc3MgRFQgYW5kIHBhbmljIGlm
IG9wZW5zYmkgZHluYW1pYw0KPiA+ID4gPiBmaXJtd2FyZQ0KPiA+ID4gPiBpcyB1c2VkLg0KPiA+
ID4gPiANCj4gPiA+ID4gRml4IHRoaXMgYnkgcGxhY2luZyB0aGUgRFRCIGF0IDJNQiBmcm9tIDNH
QiBvciBlbmQgb2YgRFJBTQ0KPiA+ID4gPiB3aGljaGV2ZXIgaXMgbG93ZXIuDQo+ID4gPiA+IA0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNvbT4N
Cj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgaHcvcmlzY3YvYm9vdC5jIHwgNCArKy0tDQo+ID4gPiA+
IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+
ID4gDQo+ID4gPiANCj4gPiA+IFdpdGggdGhpcyBwYXRjaCwgMzItYml0IHNpZml2ZV91IHN0aWxs
IGRvZXMgbm90IGJvb3Qga2VybmVsIHdpdGgNCj4gPiA+IHRoZQ0KPiA+ID4gZm9sbG93aW5nIHBh
dGNoIGFwcGxpZWQgb24gNS4xMDoNCj4gPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIwMTIxNzA3NDg1NS4xOTQ4NzQzLTEtYXRpc2gu
cGF0cmFAd2RjLmNvbS8NCj4gPiA+IA0KPiA+ID4gQ29tbWFuZCBJIHVzZWQ6DQo+ID4gPiAkIHFl
bXUtc3lzdGVtLXJpc2N2MzIgLW5vZ3JhcGhpYyAtTSBzaWZpdmVfdSAtbSAxRyAtc21wIDUgLWtl
cm5lbA0KPiA+ID4gYXJjaC9yaXNjdi9ib290L0ltYWdlDQo+ID4gPiANCj4gPiA+IDMyLWJpdCB2
aXJ0IGNhbm5vdCBib290IHRoZSBzYW1lIGtlcm5lbCBpbWFnZSB3aXRoIG1lbW9yeSBzZXQgdG8N
Cj4gPiA+IDJHDQo+ID4gPiBlaXRoZXI6DQo+ID4gPiAkIHFlbXUtc3lzdGVtLXJpc2N2MzIgLW5v
Z3JhcGhpYyAtTSB2aXJ0IC1tIDJHIC1zbXAgNCAta2VybmVsDQo+ID4gPiBhcmNoL3Jpc2N2L2Jv
b3QvSW1hZ2UNCj4gPiA+IA0KPiA+IA0KPiA+IEhpIEJpbiwNCj4gPiBBcyBtZW50aW9uZWQgaW4g
dGhlIGVtYWlsIG9uIHRoZSBsaW51eCBtYWlsaW5nIGxpc3QsIHRoaXMgcGF0Y2gNCj4gPiBvbmx5
DQo+ID4gc29sdmVzIDJHQiBwcm9ibGVtLiBzaWZpdmVfdSBwcm9ibGVtIGlzIHNvbHZlZCBieSBB
bGlzdGFpcidzDQo+ID4gcGF0Y2hbMV0uDQo+ID4gDQo+ID4gSGUgaXMgcGxhbm5pbmcgdG8gc2Vu
ZCB0aGUgUFIgc29vbi4gVGhlIGlzc3VlIHdpdGggc2lmaXZlX3UgYm9vdA0KPiA+IHdhcyBpdA0K
PiA+IHdhcyBmYWlsaW5nIHRoZSAzMiBiaXQgdGVzdCBlYXJsaWVyIHJlc3VsdGluZyBhIDJNQiBh
bGlnbmVkIGFkZHJlc3MNCj4gPiBpbnN0ZWFkIG9mIDRNQi4NCj4gDQo+IEFoLCBJIHNlZS4gSG93
ZXZlciBteSB0ZXN0aW5nIHNob3dzIHRoYXQgdmlydCB3aXRoIDJHIHN0aWxsIGRvZXMgbm90DQo+
IGJvb3Qgd2l0aCB0aGlzIHBhdGNoLg0KPiANCg0KU3RyYW5nZS4gSSB2ZXJpZmllZCBhZ2FpbiB3
aXRoIGZvbGxvd2luZyBjb21iaW5hdGlvbiB3aXRoIC1iaW9zIGFuZA0Kd2l0aG91dCBiaW9zIHBh
cmFtZXRlci4NCg0KMS4gdmlydCAzMi82NCB3aXRoIDFHQi8yR0IgbWVtb3J5DQoyLiBzaWZpdmVf
dSAzMi82NCBiaXQgd2l0aCAxR0IvMkdCIG1lbW9yeSAoQWxpc3RhaXIncyBwYXRjaCBpbmNsdWRl
ZCkNCg0KQ2FuIHlvdSBzaGFyZSB0aGUgYm9vdCBsb2cgYWxvbmcgd2l0aCB0aGUgaGVhZCBjb21t
aXQgb2YgUWVtdSBhbmQNCmNvbW1hbmRsaW5lID8gSSBhbSB1c2luZyA1LjEwIGtlcm5lbCB3aXRo
IG15IGtlcm5lbCBmaXguDQoNCj4gPiANCj4gPiBbMV0gDQo+ID4gaHR0cHM6Ly93d3cubWFpbC1h
cmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNzY3ODg2Lmh0bWwNCj4gPiANCj4g
DQo+IFJlZ2FyZHMsDQo+IEJpbg0KDQotLSANClJlZ2FyZHMsDQpBdGlzaA0K

