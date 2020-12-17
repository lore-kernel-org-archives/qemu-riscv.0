Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kq1sN-000250-U6
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 17:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6131d52cb=Atish.Patra@wdc.com>)
 id 1kq1sL-00023r-F9; Thu, 17 Dec 2020 17:35:57 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:6791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6131d52cb=Atish.Patra@wdc.com>)
 id 1kq1sG-0004zP-VH; Thu, 17 Dec 2020 17:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608244552; x=1639780552;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FudEyW6JL2KfSnNRXUAdGW9ZWusSDakBjxyLMnfjhDg=;
 b=m37OoI8Nu5WW7oFLeupNGL1kIUl9h70Yk4huFQcazPmNFZHDXcpZRbii
 +fvSA/1nCZWWiqy2oCUb+RvdEqTana3rBEd46875sxy9qJoTnyCGFlLD2
 hJ6HYOmX7dKCnjFXT2GreYdjq8+XAEg2c0JFNL3QdMX9TSEHmX6p69zHd
 jUnfoAUuZo/OKifnzbrJ6nZ5+bbWPSBgqdHb4xUoxPfdWSgCLoqOi+IoD
 3aoUyVqd53FoYnbYoL9VWwKvCN5VgO0Hv6UyHw3FJsyQaM+ajCLH3mXkD
 v9zHQXnxfG30dwmoh32itlr0u1ECuZEUQYynpNIIu4dW2Vy8jOKrSEcIi g==;
IronPort-SDR: sJfKPyjGKZNG+BFtl42idW/QjOqmC5aPwTLtQMenfkYHtNg56m26/XL1ALCQuaSExe1AbWgBkY
 DHpF8PMPcJMXcrWKnl97b2kU/DKRP+0HPOS271a3hqi4cf02J4u8jm3Tc9iN/m28qnKdHLB063
 2q3mxGGJ0H6BeDVOO7vnDJuuMbo1p7SZFtG/p4XviD35kHX67sygHpwG1n+/5+Wdhv6aScK54J
 0rkjCfGFygtx+OBBUdCt/zyG5bGbSl5NcBqpCTYwqjhf60TFssrNzfy+Xl8QIM6imb6YM0jNeE
 vxQ=
X-IronPort-AV: E=Sophos;i="5.78,428,1599494400"; d="scan'208";a="159860801"
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 06:35:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNo1lC28E/GUfl6V9urHbU++8KcwW/2nH67Kh0HJgaRLkcmcSIu+lOyStoPHcRdAM4DeOVsCfU2iCrr2f3FsT/StYc4mu/E3jI0/e7MG0Sn2x3MJtOExH60MNVQwZSPz9+bbzV2HMLxUe3r23LfBsjXNCvDh50umIuiTmQbknfXk+JwZbscdwbxx4cC3WmueZfw79HUbHSlz6RrabPOXvuRAYb6jfBvtuYDQR2noljG2AajGivs/bUMP089vUviI/vzecj7LASttqlIzFUtrC2/yszxGufnqagLUY65+03GOCH4Yr2Y/wdJJfcBEADzfGeizTpfvDdoPAUatSdXw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FudEyW6JL2KfSnNRXUAdGW9ZWusSDakBjxyLMnfjhDg=;
 b=aQpKxWLnfyh5k/qhawja1XIcIAAwq4XULakISDH3SwAzTXYi2nVj7pJ39lx780L0OiWBus5PPss5YOkj/MEKk1v31R6gXlZxAJBAYPIYTpFECho7u2PlONi2kxqnA2A31AYNAQb8OwWMrsFgF2u/dxTTQ+cF2Ua3SqpeBHLEUOOZ/ksBhny02kzYxEBS9q+B37nrZVDF6cUE4OYVQYql5/jsZ8SCIC5qqJAAo/a8dxhf/j5cYn7/HvuNp3UsW8aJMaSN35KSYJp4qfLdrkGP759fFLZ0Ny1hYys/xfnMw2Lvd2eIT9II/y8zO7L8C/dGeIbz1D2OPAZRO0DV3QQaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FudEyW6JL2KfSnNRXUAdGW9ZWusSDakBjxyLMnfjhDg=;
 b=hD/2dkIp54uKxEmInpXfwP59vprUvE3nq0KheX/Akz3CGaTRpS3M7vnU8RlnGONFiCmGprznGN+thi+CGqcTIkjPo9Pt3hC/U18emd7GcwhGo0XE6DC5SN9U+3wIlo85q4VdLU1rKGWZT3Y5h1YnIYSLsZ7p+hBtpoO+xrs93zE=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BY5PR04MB6948.namprd04.prod.outlook.com (2603:10b6:a03:220::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 17 Dec
 2020 22:35:10 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7%5]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 22:35:10 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "palmer@dabbelt.com" <palmer@dabbelt.com>
CC: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>, Alistair
 Francis <Alistair.Francis@wdc.com>, "sagark@eecs.berkeley.edu"
 <sagark@eecs.berkeley.edu>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Anup Patel <Anup.Patel@wdc.com>, "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
Thread-Topic: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
Thread-Index: AQHW1L5ec6Y+NBO69E2DOYgTLRiUVan730AAgAABA4A=
Date: Thu, 17 Dec 2020 22:35:10 +0000
Message-ID: <5b73f3cfc2c278acd4b0afc36c5d7fa764bcc9ae.camel@wdc.com>
References: <mhng-b0271174-4849-4bcd-a63d-b53fafb1ab89@palmerdabbelt-glaptop>
In-Reply-To: <mhng-b0271174-4849-4bcd-a63d-b53fafb1ab89@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bb142a57-45a0-48bb-1643-08d8a2dc0354
x-ms-traffictypediagnostic: BY5PR04MB6948:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR04MB6948AE84102D41C813ECCD94FAC40@BY5PR04MB6948.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ldhUOIJhPiguETd+US+J9rLMVJMKW3ieWNcuyo1D39Nb8LOgeRFeD0pnuqoBGwnsV2qJ9ewT5qfv/lZaAEx8WJgy97eGCUN+5GAHj5dTDDNnnQWazZe1cwhgP1GB3KFPAQxXNvqX9n+tsjNJ4Ja16K5sJ+Y6OSrHJApShV2HiiCvDmszpVFutQqLASXjTBLUe2EvPdtgz1rNqmJA9PNegrJFE4eu0TVppjRhc0l8LN1mdmAT+zPKg0faEeWIY8uNHSCyL+ETEcbvPdHm3H+qVVqxsTa4qEA6BS7qCmAhJcIK7KxicN1IraYq0w46oF06IZYCgEMGgSucSfkJ7PIVN4ACFTKzeWYlJocPhYuLuLD6E+r7QAD++5l8AzejEoRPHSP8kJKGi0yfb7mFVbmOYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6724.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(71200400001)(66446008)(4001150100001)(36756003)(8676002)(66556008)(2906002)(86362001)(6512007)(478600001)(966005)(66476007)(6486002)(26005)(2616005)(64756008)(76116006)(83380400001)(8936002)(316002)(54906003)(5660300002)(66946007)(6916009)(186003)(4326008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aFpLOGx0eHh4eDNpWmlaeGhJK1pUMVdzcDB6QXdUYzJrNDdWQWxvdlArTnV6?=
 =?utf-8?B?dHlxdHFtQXZtdTFxNysyVE5EMWxlbUdFVGdwMlZqenB4dU5ZdU5zZkhxd05B?=
 =?utf-8?B?eEU3RjJ5VUorUUJJeEFKcUxUb0VZUEdzVHN1MVp4VkppWjFsZU9qSS9mTGZC?=
 =?utf-8?B?NmZ2UWlDQnc3YzdxaE82d3F1bENTa3E0bFdET3JYY2hWTEJha3c4TlVMRFBG?=
 =?utf-8?B?eENwZzFrTXpiYWgxOEFrV3VrenNOOFJscCs3NmJVdklFZXM0RTNncmNWTGg3?=
 =?utf-8?B?R0ZsUC9Sbkc2bHdrelhXUU5yZFpqdFpQaGQ3U1RuY3JlYXhRdmlnNFFaTndi?=
 =?utf-8?B?T1FVMlN2ZFpYNVZHYlZXc2xLRGY5c1VuZi9UNEJGeFc2OWR4eFhVM1JmYjBG?=
 =?utf-8?B?dGhISHQzcjY4TjRXMmFCaE5icHFwTnphaXU2UE1lUXNWY2ZVcmZheG1vQjdV?=
 =?utf-8?B?QVdxK2ZNTXFlTjJrajVFMDZuMzg1WmtIZEk3OG1Od1VGTzJhMGFiVUpVeDU3?=
 =?utf-8?B?MDhzWXlBTE80bkw2NXJ0bmp0dEFmVll3QnNGOGo2ZWtwbkdJaDYrOHN1YW5O?=
 =?utf-8?B?TVhnSXBDR0Z5azhzM0ttK1g4QzdiLzh2UjA3Mk5RR2ZnR0o1bncvYXZnM3E1?=
 =?utf-8?B?QlVGMzZ2aFpRbk5uQk1qNk5nSHJoTkZZNFNyZThOdTkzRjhLaUNzczl2WitG?=
 =?utf-8?B?anViR1gzT3QzZ1FuVVdUL05UNHJrT1JEZnZlMG84cmd2Z0FIQWEyUnNHR3k0?=
 =?utf-8?B?MG5iaG9JaW54dExaMWM5UFRaZVVQQldaSS9rUW00V3BTSk1WUmQxRGdSeUdl?=
 =?utf-8?B?RmdxSFFNNGdCL05yZ2dYK1dtKzZIWUk3ZGNnM0Y3YXlmVHhmZWJyRW1TVXlk?=
 =?utf-8?B?VkVYVVE2YjgxMngycUhEZFNUOHJHRkErcU5tdWErRVZSU0Z2RVlaY255TExq?=
 =?utf-8?B?Vy9ZMEpMRTJEWFJwVWJKbHpjYTJPTTlSVXl4OGd0UnMzT1FYbDh2ZE5kN1dC?=
 =?utf-8?B?ejNIYnZQK0lNanBBd2VJMEhmN09Nc3Y2UlJwS1IrZXp6Z1FOT1BCM1kvVmxU?=
 =?utf-8?B?WnVpWFlZUXgybGx0N0NyQ2VSSXlIcko2djF1RUI2bWE2Nkkyczg4ZGFadzVI?=
 =?utf-8?B?R3l3QjEwcW1PU1VGZTBQWjhDNzA0NnR2OE1QSWNQNWduNHM5RnI4WVV1U1A5?=
 =?utf-8?B?THVSc3NWVVRWUWRteUtOeFppNlE3eFZWRWs1cVJtaGlHUHZHb1NiNXRHSGJY?=
 =?utf-8?B?ZStGUXpMTk1ZbzBkMVJTc3AyT1VWczR4VkVCUjF4WkF4RlF3R3BmTDdEOStZ?=
 =?utf-8?Q?gAvFBpQ0+wGtU4D8gqrkC+3/vE5s0G0a16?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1126FCFE6E3FBF41A38343C116D68888@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb142a57-45a0-48bb-1643-08d8a2dc0354
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 22:35:10.4147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iIfTr1fIwF/5SzIYqwcu+fq7NevoOKgBsVtwHsM2SIr0RM+OjvwHawVc412fEqhQ2uKdnaM8oWXPulezx5JUnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6948
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=6131d52cb=Atish.Patra@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Thu, 17 Dec 2020 22:35:57 -0000

T24gVGh1LCAyMDIwLTEyLTE3IGF0IDE0OjMxIC0wODAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToN
Cj4gT24gVGh1LCAxNyBEZWMgMjAyMCAxMzo0ODoyNiBQU1QgKC0wODAwKSwgQXRpc2ggUGF0cmEg
d3JvdGU6DQo+ID4gQ3VycmVudGx5LCB3ZSBwbGFjZSB0aGUgRFRCIGF0IDJNQiBmcm9tIDRHQiBv
ciBlbmQgb2YgRFJBTSB3aGljaA0KPiA+IGV2ZXIgaXMNCj4gPiBsZXNzZXIuIEhvd2V2ZXIsIExp
bnV4IGtlcm5lbCBjYW4gYWRkcmVzcyBvbmx5IDFHQiBvZiBtZW1vcnkgZm9yDQo+ID4gUlYzMi4N
Cj4gPiBUaHVzLCBpdCBjYW4gbm90IG1hcCBhbnl0aGluZyBiZXlvbmQgM0dCIChhc3N1bWluZyAy
R0IgaXMgdGhlDQo+ID4gc3RhcnRpbmcgYWRkcmVzcykuDQo+ID4gQXMgYSByZXN1bHQsIGl0IGNh
biBub3QgcHJvY2VzcyBEVCBhbmQgcGFuaWMgaWYgb3BlbnNiaSBkeW5hbWljDQo+ID4gZmlybXdh
cmUNCj4gPiBpcyB1c2VkLg0KPiA+IA0KPiA+IEZpeCB0aGlzIGJ5IHBsYWNpbmcgdGhlIERUQiBh
dCAyTUIgZnJvbSAzR0Igb3IgZW5kIG9mIERSQU0NCj4gPiB3aGljaGV2ZXIgaXMgbG93ZXIuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+
DQo+ID4gLS0tDQo+ID4gwqBody9yaXNjdi9ib290LmMgfCA0ICsrLS0NCj4gPiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL2h3L3Jpc2N2L2Jvb3QuYyBiL2h3L3Jpc2N2L2Jvb3QuYw0KPiA+IGluZGV4IGQ2MmYz
ZGM3NTgxZS4uOWU3N2IyMmU0ZDU2IDEwMDY0NA0KPiA+IC0tLSBhL2h3L3Jpc2N2L2Jvb3QuYw0K
PiA+ICsrKyBiL2h3L3Jpc2N2L2Jvb3QuYw0KPiA+IEBAIC0yMDMsOSArMjAzLDkgQEAgdWludDMy
X3QgcmlzY3ZfbG9hZF9mZHQoaHdhZGRyIGRyYW1fYmFzZSwNCj4gPiB1aW50NjRfdCBtZW1fc2l6
ZSwgdm9pZCAqZmR0KQ0KPiA+IMKgwqDCoMKgwqAgKiBXZSBzaG91bGQgcHV0IGZkdCBhcyBmYXIg
YXMgcG9zc2libGUgdG8gYXZvaWQga2VybmVsL2luaXRyZA0KPiA+IG92ZXJ3cml0aW5nDQo+ID4g
wqDCoMKgwqDCoCAqIGl0cyBjb250ZW50LiBCdXQgaXQgc2hvdWxkIGJlIGFkZHJlc3NhYmxlIGJ5
IDMyIGJpdCBzeXN0ZW0NCj4gPiBhcyB3ZWxsLg0KPiA+IMKgwqDCoMKgwqAgKiBUaHVzLCBwdXQg
aXQgYXQgYW4gYWxpZ25lZCBhZGRyZXNzIHRoYXQgbGVzcyB0aGFuIGZkdCBzaXplDQo+ID4gZnJv
bSBlbmQgb2YNCj4gPiAtwqDCoMKgwqAgKiBkcmFtIG9yIDRHQiB3aGljaGV2ZXIgaXMgbGVzc2Vy
Lg0KPiA+ICvCoMKgwqDCoCAqIGRyYW0gb3IgM0dCIHdoaWNoZXZlciBpcyBsZXNzZXIuDQo+ID4g
wqDCoMKgwqDCoCAqLw0KPiA+IC3CoMKgwqAgdGVtcCA9IE1JTihkcmFtX2VuZCwgNDA5NiAqIE1p
Qik7DQo+ID4gK8KgwqDCoCB0ZW1wID0gTUlOKGRyYW1fZW5kLCAzMDcyICogTWlCKTsNCj4gPiDC
oMKgwqDCoCBmZHRfYWRkciA9IFFFTVVfQUxJR05fRE9XTih0ZW1wIC0gZmR0c2l6ZSwgMiAqIE1p
Qik7DQo+ID4gDQo+ID4gwqDCoMKgwqAgZmR0X3BhY2soZmR0KTsNCj4gDQo+IFByZXN1bWFibHkg
dGhpcyB3YXMgdGhlIGNhdXNlIG9mIHRoYXQgMzItYml0IGJvb3QgaXNzdWU/DQoNCg0KVGhpcyBm
aXhlcyB0aGUgZndfZHluYW1pYyBjYXNlIGlmIHlvdSB1c2UgbW9yZSB0aGFuIDFHQiBvZiBtZW1v
cnkuDQpUaGUgb3RoZXIgaXNzdWUgd2FzIHdpdGggdGhlIGtlcm5lbC4gSSBzZW50IHRoZSBrZXJu
ZWwgZml4IHllc3RlcmRheS4NCg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjAxMjE3MDc0ODU1LjE5NDg3NDMtMS1hdGlzaC5wYXRyYUB3
ZGMuY29tLw0KDQpDYW4geW91IGluY2x1ZGUgdGhlIGtlcm5lbCBmaXggaW4geW91ciBuZXh0IFBS
ID8NCg0KLS0gDQpSZWdhcmRzLA0KQXRpc2gNCg==

