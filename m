Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwyL1-00065E-Sd
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jan 2021 21:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=633fb9080=Atish.Patra@wdc.com>)
 id 1kwyKz-000646-M0; Tue, 05 Jan 2021 21:14:13 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:41369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=633fb9080=Atish.Patra@wdc.com>)
 id 1kwyKw-00021m-Fh; Tue, 05 Jan 2021 21:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1609899250; x=1641435250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MefbS0IOXkupmLZP7iSuBYNYuXcmhnhNDiI5rn2YNHY=;
 b=IWoRByegoZ7sexuI/jQRG9nXPLaMNKFdjNH7lpc7/5cJEKFAZ6BFZYcv
 ALM6ddR2R+Nm2fJKAo3eAPh1K65bSDHFQ0rBYsBTPn6mqy4t82S1e0jnA
 HwWAz0YvMKPsWWnCjzIX7mxjm/z90nGQ6KPDJIZQzYgYK7C9IpOUCaeHZ
 G48WPNN9Tyl0qgSQnyB6hCFndFIkpF55Vz2/fyekEV4qk6p9b4RXdBUG4
 9AU6lY/PwwNz9SAX6zCIhRXrhYcfEMKRP5WqKn4iXvjg06a9gJ7VgLHzt
 67lOfFu/sOYhM5d6VLRvmZWaFLxUkZUoh6liso4qRQfIRuYecfc+CBV6G A==;
IronPort-SDR: jVHMX2K+sFBEDVNU0YVM//mbMd+YDNJ1l81sNdDkat8NcYb+x4IV1WQ1SUVT0mawoGgMysrBx0
 s5R3YfSEjSe9Mc08izzs03TGPXKbtAbmuFnfBpUZiNA59PhhypEL0QhbDEJf/eOlncmhwD+kJz
 dbAFFibK5YmsyuWujiaImWkCA6oNh7pXhG49O2vvNOPkxG24zWmXIGVK9y1zxDGXFHBtfLcEIg
 fIwQviJk1/zOA/Y1AYDuEp5lwDa+WfczZ+T1Reg93ykM5F//ir8py4T0Kx2GKGbC6D3oaoeFxf
 2MM=
X-IronPort-AV: E=Sophos;i="5.78,478,1599494400"; d="scan'208";a="156629738"
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2021 10:14:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ajp69c4EallcrFG4DT8cnItBQ332SSVy975o4JxDc4Hc4XxtAZJi8jXSgmHLioA9fBTOyJeUcL2p6pJ+3vS0Wr6TKgW8n73ncrdKutd0uKzQXPc57x4pEVvF1vipcrLkJrG26Ch4J41kOk/XUJ4p4ec5zU1EszrlWwnOQdeJpm8wz6kpZ0K4DjeaYDQmzgYceObb8078M9l3SeW/53SMa+GTKd0EuGMEiikgHw6za0VtHoDFyhUZ3XLJsZbgnafKVJVkBrrohzzTfMvrHYFuY6El3YzEfr/cmhkHkPyhSeiJwyVFbDbSiZ9m5VXgKRZP1TqjdWdvRYGds/faGM3ShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MefbS0IOXkupmLZP7iSuBYNYuXcmhnhNDiI5rn2YNHY=;
 b=FUkqcaErnz4dtsZCFYwwmmxus5j3i/0epiOirWx6GECchAdslH6H7O0ncFDLm+4AgK4aWMZ8gEBHO4idgiSv/KSaalZf1Yp08ls/6roAccC8idy3JnFfcaIxcHHvpAZwmvSMwY5YpvAeCD6KzeYNNFu6kROmgaTvOy5BaJKp4dbcioGCxZ9IqxD/MRaXyTMMknKwwtcZ4L1YxNecZPqhrWjP/75Qoml3L54SQFaHTVcIjQufbEKmHEVqf1ufLVZGK5vyOnBZBj9bMLmYkO057rml1JHJ9sSBk6eCZXnSuY0Vp8bh/eqywtMFa+IyjFuSIKQm6Lf4XAsXFJZlCnRlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MefbS0IOXkupmLZP7iSuBYNYuXcmhnhNDiI5rn2YNHY=;
 b=UXrneBE6vpSJE/Iv1NNMNil+eleslBhPbOswUS9Q4S2WiI0JdyE926rCqDbtTiRS0f8a7RlvvScmYfMonG7e2Ct7Dt1Xy6Wp0zzUhguQGqsiVdpdH3o8Wtm/QV6TNqkQ4J1quwsd56DbBRl06vJjNMCv7uQSr3vL0BHG/EQpCVU=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BYAPR04MB5672.namprd04.prod.outlook.com (2603:10b6:a03:106::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 02:14:02 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 02:14:02 +0000
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
Thread-Index: AQHW1L5ec6Y+NBO69E2DOYgTLRiUVaoYd1uAgAFYcACAAAWZAIAAJFGA
Date: Wed, 6 Jan 2021 02:14:02 +0000
Message-ID: <3511c4f25a6910213ee83f7c0b304c3dad8c0280.camel@wdc.com>
References: <20201217214826.2094617-1-atish.patra@wdc.com>
 <CAEUhbmVc_SABW_0PKgDMY8t3zTujo4xUnNW3fz1YuWhqXWnV2A@mail.gmail.com>
 <76741a2677ed1d7ae0fc4ff887e5eede58275734.camel@wdc.com>
 <CAEUhbmVgV3tm6V5HwEgt1Dmw6XKqU0NK5nCo7qxQvVNk_jwtKA@mail.gmail.com>
In-Reply-To: <CAEUhbmVgV3tm6V5HwEgt1Dmw6XKqU0NK5nCo7qxQvVNk_jwtKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [99.13.229.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41ffbe67-2425-4b9c-c77d-08d8b1e8bc44
x-ms-traffictypediagnostic: BYAPR04MB5672:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB56724BDA2E19A4F9D6EB5377FAD00@BYAPR04MB5672.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: veyzrBYGnUIZijDQBPYNfGrnOrnCoKdFIc3jxyfFERrORwlWnkrUCU3REFor1kC2YSkki1I6e3zGJtJs4See7MXj3I/5wHvv+Kf3z51YevyJb2E0LYQF06JfSla5qC31MoyJ2+UFyh+417VIGF2kDpeHbikwOFhA3xeK1DPSkxYdMsvFw/2P+kpJMGoOTcwTyqf00iucCHnHSG5fdojkr4RDXdk8iYSAK7H6ryMsNheVCHi/eikEve9unK8kNVUVAqR31Y1xWzEmlC/F2L7QTPuXsEVnXjvT6BxoOF+KalGDGClIoKt0wwFFx/lnh+cA6sY77NPBehT21+Iinb1ZRUjZr7EQNN4vJtTxtR6bctYM8a1DgA0CVGr8mk//NoWwF9t0LQyig8SV2IiWxPGMmNobKzHcON1tK6AfJkUbBPRtwbyjYM6Tqz6o8v9hYM/nJxIyzOmPz3hnbNYBtDkQpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6724.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(8676002)(6486002)(86362001)(5660300002)(966005)(66556008)(83380400001)(316002)(36756003)(66476007)(54906003)(6512007)(66946007)(4326008)(64756008)(76116006)(8936002)(2906002)(6916009)(26005)(186003)(478600001)(53546011)(66446008)(6506007)(71200400001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VUVteDVLZ0p1Yy9vN3QxYVRwNzJtRklySE9BdHFhOU9BMnM3OXN4RGwzM2NI?=
 =?utf-8?B?RncvdjdYUEdsYkpXYkUxSnBBRWFmdmRQajlVdWp0Vmd0RHF0eUxBR1ArV0Fh?=
 =?utf-8?B?dnQwb3JwZzZRNXZ1MU1iY3g2QWsrdXR2Nnl3dmJ6eitXTDBpK2crVnhCNnho?=
 =?utf-8?B?WGkxeUpvQ1Z3allybzg0eGdIMVIxSC9rMDFpOE1vOGx5UkpJYmVOVXdMd2Vj?=
 =?utf-8?B?UUQ4TUpxQXhJQ1VvQk5nYlNaNTZNeTVzNGlsanV4cVJrTm9MdkhBVFB6K0gr?=
 =?utf-8?B?Wkkwdi9SaDBhYkI5aVRFL1lFWjFBYUJ0eEt4L2dDQlEyeFovU2VWR2lHdG1u?=
 =?utf-8?B?MXFmTmV4M0c5VHl3Ni85c3VtL0hKMzZwc0U0YnMzZ3laNmxjcks1N3JxL0Ja?=
 =?utf-8?B?eGI4UXh3cE1Ea3A4bDBKS29FUjdPN2JMMlQyb3FOMmxWTThSYVNWUTJqTUM4?=
 =?utf-8?B?ZEFwZGphdVRFRDQ2aUtRejN2UWlMVlU5RDFtZldyc0x2NGdmVDh5Qnc4YkhU?=
 =?utf-8?B?ZGtxT1FrRitabTR4b2x1M1BVcndycXROUmR6anZsRHdQbm1uaUF5Q1hSTzVo?=
 =?utf-8?B?ZndJRDRoVVBVWXgyTC84MzhBc2xHazdoeGtFU0lFWENJTnJXeXpJTHA2THdQ?=
 =?utf-8?B?YkkrdUZBazA4Ukd2bUJXc1RYZ2pJTGxVOHQzVkZUVTlGMDYvVUZKcFZhSHRF?=
 =?utf-8?B?UVhLdWdsR3BlRnJxcE9FS21hdzVWRTdubERTcy9OS3FJNmNpZ0NCZXdYMHB0?=
 =?utf-8?B?REdOdTlmbGZtN0hHL0ZjS1lBcy9CZ3BSUldxMkUvV243cjJETVFvbXcveGFo?=
 =?utf-8?B?ZzhQNUVBeS8yaW9XcW1TWkRjSnU0WmpBYTFXOHBVbUJPM2pHUjBIWVJnTlFl?=
 =?utf-8?B?NndOZjNadUlQTVd4MmNGRVAzeHQ3Z0lITVMzRlNUUjkwbTlIMGI1Q210eEdH?=
 =?utf-8?B?ZXRTMjNGTHlrK2hSM3oyNERPUExKcnFaR1labmt0SUdwQy8zaFh4T0ZhMTdp?=
 =?utf-8?B?M3RES29pTXBsWmdhcFhUOC9oa3N1NnI3N05rUjE0WjV1VVVLK1BlSzREOUYy?=
 =?utf-8?B?RHRMb003Zi9CRU9EQmdnU3owZi96QitvelVvUzlrUi9pTUpkVW52TXhZamEy?=
 =?utf-8?B?bjZSODd2cHlzWWNPVC9qYi9FWGIwUUZHMUlBdnh3VXZKZVk1YmlTdGtWSlVm?=
 =?utf-8?B?UmRGcHJFUEVmS0pUZ1Fpejd0bHg2R1hSVmV1Ty80N1F3eVZnK3BwN1JHR0hh?=
 =?utf-8?B?eWdWWHgzeUhTSkJNQTA3eHIyc2Z3OTRQKzVQNWxtQTkxaVNEejloQjMyVlJO?=
 =?utf-8?Q?yzux11j7s348yZRgyZbgKiaIKtEo7+8Vlx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DA3ECCD396D7649A2D3CBDBF9417858@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ffbe67-2425-4b9c-c77d-08d8b1e8bc44
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 02:14:02.0594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EeGQTvRHcXaOz0UYN5UNSj4hjkODAHIoHI+gtCYEy5RiolsXzcTqX6VAuok+u4GI7prhmxpE8WOs82zUOo5OjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5672
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=633fb9080=Atish.Patra@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 06 Jan 2021 02:14:14 -0000

T24gV2VkLCAyMDIxLTAxLTA2IGF0IDA4OjA0ICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gSGkg
QXRpc2gsDQo+IA0KPiBPbiBXZWQsIEphbiA2LCAyMDIxIGF0IDc6NDQgQU0gQXRpc2ggUGF0cmEg
PEF0aXNoLlBhdHJhQHdkYy5jb20+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAyMS0w
MS0wNSBhdCAxMToxMSArMDgwMCwgQmluIE1lbmcgd3JvdGU6DQo+ID4gPiBPbiBGcmksIERlYyAx
OCwgMjAyMCBhdCA1OjQ4IEFNIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPg0KPiA+
ID4gd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBDdXJyZW50bHksIHdlIHBsYWNlIHRoZSBEVEIg
YXQgMk1CIGZyb20gNEdCIG9yIGVuZCBvZiBEUkFNDQo+ID4gPiA+IHdoaWNoDQo+ID4gPiA+IGV2
ZXIgaXMNCj4gPiA+ID4gbGVzc2VyLiBIb3dldmVyLCBMaW51eCBrZXJuZWwgY2FuIGFkZHJlc3Mg
b25seSAxR0Igb2YgbWVtb3J5DQo+ID4gPiA+IGZvcg0KPiA+ID4gPiBSVjMyLg0KPiA+ID4gPiBU
aHVzLCBpdCBjYW4gbm90IG1hcCBhbnl0aGluZyBiZXlvbmQgM0dCIChhc3N1bWluZyAyR0IgaXMg
dGhlDQo+ID4gPiA+IHN0YXJ0aW5nIGFkZHJlc3MpLg0KPiA+ID4gPiBBcyBhIHJlc3VsdCwgaXQg
Y2FuIG5vdCBwcm9jZXNzIERUIGFuZCBwYW5pYyBpZiBvcGVuc2JpIGR5bmFtaWMNCj4gPiA+ID4g
ZmlybXdhcmUNCj4gPiA+ID4gaXMgdXNlZC4NCj4gPiA+ID4gDQo+ID4gPiA+IEZpeCB0aGlzIGJ5
IHBsYWNpbmcgdGhlIERUQiBhdCAyTUIgZnJvbSAzR0Igb3IgZW5kIG9mIERSQU0NCj4gPiA+ID4g
d2hpY2hldmVyIGlzIGxvd2VyLg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gRml4ZXM6IDY2YjEy
MDViYzVhYiAoIlJJU0MtVjogQ29weSB0aGUgZmR0IGluIGRyYW0gaW5zdGVhZCBvZg0KPiA+ID4g
Uk9NIikNCj4gPiA+IA0KPiA+IA0KPiA+IEp1c3QgdG8gY2xhcmlmeSwgaXQgaXMgbm90IGEgYnVn
IGluIHRoZSBvcmlnaW5hbCBwYXRjaC4gVGhpcyBidWcNCj4gPiBhcHBlYXJlZCBpbiByZWNlbnQg
a2VybmVsIGJlY2F1c2Uga2VybmVsKGZyb20gdjUuMTApIGRvZXNuJ3QgdXNlDQo+ID4gZml4bWFw
DQo+ID4gZm9yIERUIHByb2Nlc3NpbmcgYW55bW9yZS4gVGh1cywgdGhlIERUIGhhcyB0byBiZSBw
bGFjZWQgYXQNCj4gPiBsb2NhdGlvbg0KPiA+IHRoYXQgY2FuIGJlIGFkZHJlc3NlZCBieSBrZXJu
ZWwuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLg0KPiANCj4gPiANCj4gPiBJ
IHdpbGwgYWRkIHRoZSBmaXhlcyB0YWcuDQo+ID4gDQo+IA0KPiBEaWQgeW91IGdldCBhIGNoYW5j
ZSB0byB0cmFjZSB0byBhbm90aGVyIHBvc3NpYmxlIGtlcm5lbCBidWc/DQo+IA0KDQpZZWFoLiBM
ZXQgbWUgZXhwbGFpbi4gQXBvbG9naWVzIGZvciBsb25nIGV4cGxhbmF0aW9uIGluIGFkdmFuY2Ug
OikNCg0KNS4xMCBrZXJuZWwgKyBtZW1ibG9ja19lbmZvcmNlX21lbW9yeV9saW1pdCBwYXRjaCBh
Y3R1YWxseSBib290cyBidXQNCmNyYXNoZXMgYWZ0ZXIgYSBwb2ludCB3aXRoIDJHQiBvZiBtZW1v
cnkuIFlvdSBkaWQgbm90IHNlZSBhbnkgYm9vdCBsb2dzDQphcyB5b3Ugd2VyZSBub3QgdXNpbmcg
ZWFybHljb24gYXJndW1lbnQuDQoNClRoZSBpc3N1ZSB3YXMgbWFza2VkIGJ5IHRoZSBhIGtlcm5l
bCBwYXRjaCBbM10gdGhhdCBnb3QgbWVyZ2VkIGluIDUuMTEtDQpyYzEuIFRoZSBwYXRjaFszXSBh
bHNvIHRocm93cyBhIHdhcm5pbmcgb24gUlYzMiBiZWNhdXNlIG9mIGEgYW5vdGhlcg0KYnVnWzFd
Lg0KDQpUaGUgcmVhbCBpc3N1ZSB3aXRoIDJHQiBtZW1vcnkgaW4gUlYzMiBpcyB0aGF0IExpbnV4
IGtlcm5lbCB0cmVhdHMgYW55DQpwb2ludGVycyB3aXRoaW4gbGFzdCA0SyBieXRlIG9mIGFkZHJl
c3NhYmxlIG1lbW9yeSBhcyBlcnJvciBbMl0uDQoNCkluIHRoZSBhYnNlbmNlIG9mIHRoZSBwYXRj
aFszXSwga2VybmVsIHVuZmxhdHRlbnMgdGhlIERUIHRvd2FyZHMgdGhlDQplbmQgb2YgdGhlIG1l
bW9yeS4gVGhlc2UgbWVtb3J5IHJlZ2lvbnMgYXJlIGFic29sdXRlbHkgZmluZSBhbmQNCmFkZHJl
c3NhYmxlLiBJIGV2ZW4gdmVyaWZpZWQgdGhlIG1lbW9yeSByZWdpb24gaW4gcWVtdSBhbmQgY2Fu
IHByaW50DQp0aGUgRFQgc3RyaW5ncyB1c2luZyBnZGIuIEhvd2V2ZXIsIGtlcm5lbCB0aGlua3Mg
YXMgZXJyb3IgYnkgbWlzdGFrZQ0KYmVjYXVzZSBvZiBbMl0uDQoNClRoZSBrZXJuZWwgcGF0Y2hb
M10gbWFza2VkIG9mZiB0aGUgMkdCIHByb2JsZW0gYmVjYXVzZSBpdCB0cmllZCB0bw0KYWxsb2Nh
dGUgYnVuY2ggb2YgbWVtYmxvY2tzIGFuZCBmYWlsZWQuIFRoYXQgbGVhZCBtZW1ibG9jayB0byBh
bGxvY2F0ZQ0KbWVtb3J5IGZvciB1bmZsYXR0ZW5kIERUIGF0IGEgZGlmZmVyZW50IHBsYWNlIHdo
aWNoIGhlbHBlZC4gDQoNCkkgaGF2ZSBhIGZpeCBzb2x2ZSB0aGUgYnVnIGludHJvZHVjZWQgYnkg
dGhhdCBwYXRjaFszXSBhbmQgY2FuDQpyZXByb2R1Y2UgdGhlIDJHQiBwcm9ibGVtIHdpdGggNS4x
MS1yYzIgYXMgd2VsbCB3aXRoIHRoZSBrZXJuZWwgZml4LiANCg0KVGhlIHNpbXBsZSBzb2x1dGlv
biBpcyBoZXJlIHRvIHBsYWNlIHRoZSBEVEIgYXQgYW4gYWRkcmVzcyBmYXJ0aGVyIGF3YXkNCmZy
b20gdGhlIGVuZCBvZiAzR0IuIEtlcm5lbCBwdXRzIHNvbWUgb3RoZXIgZGF0YSBzdHJ1Y3R1cmUg
dG93YXJkcyB0aGUNCmVuZCBvZiB0aGUgYWRkcmVzc2FibGUgbWVtb3J5IGJ1dCBuZXZlciBhY2Nl
c3NlcyB0aG9zZSBsYXN0IDRLIGJ5dGVzIG9mDQptZW1vcnkuIFRodXMgd2UgZG9uJ3Qgc2VlIGEg
cHJvYmxlbSBhbnltb3JlLiBUaGlzIHByb2JsZW0gbWFuaWZlc3RzDQpvbmx5IHdoZW4geW91IGhh
dmUgYSB2aXJ0dWFsIGFkZHJlc3Mgd2l0aGluIDRLIG9mIGFkZHJlc3NhYmxlIG1lbW9yeS4NCkl0
IGlzIG9ubHkgcG9zc2libGUgd2l0aCBSVjMyIGFuZCAyR0IgY29tYmluYXRpb24uDQoNCmZkdF9h
ZGRyID0gUUVNVV9BTElHTl9ET1dOKHRlbXAgLSBmZHRzaXplLCBYICogTWlCKTsgDQoNCndoZXJl
IFggbXVzdCBiZSA+IDQuDQoNCkkgdGVzdGVkIHdpdGggOC8xNi8zMiBNQiBhbGlnbmVkIGFkZHJl
c3MgYW5kIGl0IHdvcmtzIGZpbmUgZXZlcnkgdGltZS4NCkkgdGhpbmsgdGhlIHNhZmVzdCBvcHRp
b24gc2hvdWxkIGJlIDMyTUIgb2Zmc2V0Lg0KDQpLZXJuZWwgc2hvdWxkIGFsc28gYmUgZml4ZWQg
c28gdGhhdCBtZW1ibG9jayBhbGxvY2F0aW9uIGNvZGUgc2hvdWxkIG5vdA0KYWxsb2NhdGUgYW55
dGhpbmcgd2l0aGluIGxhc3QgNEsgb2YgYWRkcmVzc2FibGUgbWVtb3J5Lg0KDQpbMV0NCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1yaXNjdi8yMDIxLUphbnVhcnkv
MDA0MDg2Lmh0bWwNClsyXQ0KaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2Iv
bWFzdGVyL2luY2x1ZGUvbGludXgvZXJyLmgjTDIyDQoNClszXSAwZjUyMjU5MmFiOWYgUklTQy1W
OiBBZGQga2VybmVsIGltYWdlIHNlY3Rpb25zIHRvIHRoZSByZXNvdXJjZSB0cmVlDQoNCj4gUmVn
YXJkcywNCj4gQmluDQoNCi0tIA0KUmVnYXJkcywNCkF0aXNoDQo=

