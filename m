Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwvzn-0000Ew-IJ
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jan 2021 18:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=632ae7187=Atish.Patra@wdc.com>)
 id 1kwvzm-0000DZ-9q; Tue, 05 Jan 2021 18:44:10 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:37193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=632ae7187=Atish.Patra@wdc.com>)
 id 1kwvzj-0001C5-DF; Tue, 05 Jan 2021 18:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1609890247; x=1641426247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=U4o+hvEejHgKToaqfVvWikZD0jo+nxX2hrg7TKe+/jc=;
 b=OhJJGLL2oLu9ffiuCZaXibYJ3VPiEssc9An+0yMlNGVy0qjVKQeeIS/K
 QCQ7InoMcUFWH/8XtaNB/S5ASv+6CnHGx5fRnWEwb7Z4fqqxV3z/1cwYa
 l190H0qI7MeJ/9EEWLV8Kv0JN2n9Rhxh+jYxyet/5wu+nLl7YfN7ERaH/
 ATqlGADzsXo0FnuhEsN6Pl7VYIW8y0EvufE1OGKVa/q1TGSSv9neKohCq
 FuxSzRt6xNbmBrQc0WHMn7DOZT7Vx6XaXt73nRCaFxAkNI/5+YfUgxFOg
 drR/wxFf4pMC0EgcKjgbCFUgnpKZZTJRBNk9xYdIsxX6Sdz3UaWNxbsHa g==;
IronPort-SDR: 0DmcNbykZ3YiG1iC7yJ897C3yZFp0fiPC7/0d/vnRSwyjrKlNTe+cv3aOqGCQNhZ8ujKPd0uFZ
 Vr+bo2CAQsNZvhFtIJ3n6LqbdE8AvWkMb9o/WWjgnIAEXkskFo5v3AaGTAzjRi+CD8XmpswPZ1
 G9qB4WjfCX6C28gllu0Qce9IllK0Fw/e5h/AZuB1OYwbS/GscMuUKVn7SH5J/OHMzsbkevnVa/
 lNVIAtewLtmJraBuF48t6XehBC64a8TRlgUbFG7dWbV/QDkRkgonSgFKTYkwRoWoEBGrSKwdDd
 rIs=
X-IronPort-AV: E=Sophos;i="5.78,478,1599494400"; d="scan'208";a="156572144"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2021 07:44:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLuZ8LmLZaOLSAfmATIMvoLi73LyI2wuR580kOCgLiyGpVVRngAxjEX3rDqyGBzvgl7M5uD951p5q5Zl43Q1g8kK/XlnXJY2uF9+6zZk47UBYTbAkTjQIdHRcMDrmxlWD21FCgEVIoYq5p+omz5OidG2UfeSkZSw/X5WkX5a6dV+9gY5zCE+AENBozGaVtmHC9fkjdJe98I9WM2HkWZhFebmS/L3q5+/Q9ugLmdzyTp5YLJmsXQKD2TC3dfp4nkCuuJDPdXtFrotsr2/TiQL2iTARw0lm5+o6hHEofOXCJiQxj9ss/pC5Vz1LhlBlWI6P/TDF6DoDgBn94iHQyZSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4o+hvEejHgKToaqfVvWikZD0jo+nxX2hrg7TKe+/jc=;
 b=Q0hxprPOgTKRsVaPwH+15GZS61Sa625xrtyi2SdXm7I3EEHnuewsMFQMpPHm+elAJP+lbspRVvGT8evhzLnZhNGG5PX+921sKErp1UDrhpEJgnNm3VHj9dTmW5QxHGVyMOvMed4Xwj5egO75SiQ8AKbNMWPPx0pfZy/U9zcozaWeisB8yqIOonA3O83637JmUD67eAh6ugPKen0uExKF0dk7A8hZXKUe/okiBUn/5jkL3C2fYqQAnplSM/jMVYK8iOVf6uIqdId7f+zZEkE85XYuNGT9jUKkUYCvX1w9mx1ftLgkx1+t8OwGAYJDKU+jDa3ZLfydgagB51xs5djXiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4o+hvEejHgKToaqfVvWikZD0jo+nxX2hrg7TKe+/jc=;
 b=loIvze7H6DIvnoq4pCVYEAMUZdHrKRAV/ZD1Q29jfyOfNKA22VD+f+XXkfJ2Ai6WPUkn0C3qrUcvHBe86+nS7tHtbpzMWlu7QSDvEB+Zul8HWE0aW+1IEarGfHc1glCtLbCP8apEjlMMXs/cqCre4Fh3RVzIPEA3UCVjA+HCDow=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BY5PR04MB6455.namprd04.prod.outlook.com (2603:10b6:a03:1ed::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Tue, 5 Jan
 2021 23:44:00 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7%7]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 23:44:00 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
CC: Anup Patel <Anup.Patel@wdc.com>, "qemu-riscv@nongnu.org"
 <qemu-riscv@nongnu.org>, "kbastian@mail.uni-paderborn.de"
 <kbastian@mail.uni-paderborn.de>, Alistair Francis
 <Alistair.Francis@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "sagark@eecs.berkeley.edu"
 <sagark@eecs.berkeley.edu>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
Thread-Topic: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
Thread-Index: AQHW1L5ec6Y+NBO69E2DOYgTLRiUVaoYd1uAgAFYcAA=
Date: Tue, 5 Jan 2021 23:44:00 +0000
Message-ID: <76741a2677ed1d7ae0fc4ff887e5eede58275734.camel@wdc.com>
References: <20201217214826.2094617-1-atish.patra@wdc.com>
 <CAEUhbmVc_SABW_0PKgDMY8t3zTujo4xUnNW3fz1YuWhqXWnV2A@mail.gmail.com>
In-Reply-To: <CAEUhbmVc_SABW_0PKgDMY8t3zTujo4xUnNW3fz1YuWhqXWnV2A@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 7ece031d-f403-446e-eb95-08d8b1d3c6f8
x-ms-traffictypediagnostic: BY5PR04MB6455:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR04MB6455AFFAD3C40CCA0CC7FEECFAD10@BY5PR04MB6455.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +lv0J6KFZcAv450mgEouGdGSZYOzaZmhfn79B1ymPUXBXTlukN5VyI4NiZ+5y7gC73JRZC0B1ttF9vdvWZ3Kv3D151pnqtvPxnfVs5HzvHBqPvIfBYbUHZHH3sbdPa2pfPDqqD5YfiW4qYmlIaPxz8I5JMLCTtFPTLx0K/eSgK+BC3RkI7YdQvtPYKdLBxk2Awc+9v8Tp8LnYQ4gfz4flDfz+kANHYEjsUKtjfV1pXoiDrBKl8WKK4ly0hTZiL+uBIh2y370bb4GGptvVZxt/xQLirmSXzwdqlvgp32IgM3WZ0T3m0MdCIdiHffPUL4+AzqZLEgNsy0ipg5RWN7iv0ign6cJ/1S2PlNt7+FvhBdYGhL9dBXsBZ19H7iBiiw2x9INgvwXH1el72UGfZ1FFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6724.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(86362001)(186003)(6486002)(66446008)(76116006)(8676002)(5660300002)(478600001)(66556008)(64756008)(66946007)(26005)(66476007)(36756003)(2616005)(53546011)(316002)(6512007)(6916009)(6506007)(83380400001)(8936002)(54906003)(2906002)(4326008)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RlgrdEExb3JlSS9kQXVCTjJHWmdTektaZGVMSlMwdGVSUHJsWnkwRllRd0N3?=
 =?utf-8?B?bXZMd0lCa0czSm80QXlpTkRnT2g1bXBNa1IxVHhCRm5jejZBTFAvWGJ1ZXMz?=
 =?utf-8?B?TThBUnRoSHlCVjB5VXNnK0lYS3IwbXk1TTZFalBVK2ZlTDE3ZDk4TnE1R1ht?=
 =?utf-8?B?SU8xNUdOOURFRDZzckgzMmZOUjNaSlNvS0t1MHFBazVTM2RYZnAvKzJiVTRF?=
 =?utf-8?B?NE5GdGR6N1J4LzBoREEyNXlVQWJVckZqRk40bC9Wc0pnVmdtSEFiVS9qZ0pW?=
 =?utf-8?B?dHczeUZkRXJIWUNWdEN5VjdNcTY4T1VPNE0vUEtkY1FtVU1OS3F6ZzhjQUoy?=
 =?utf-8?B?VFZZVDdiVkljVmVFeEdIaG5QUWplVk5STUJ4Mk1Edk95OWszTWtTeDlrcXgv?=
 =?utf-8?B?bFZ6N1JsVEF0NHRxZnVOVUh6V0hqSks3ZlFqR2Z6N3V4VEdBeWhLYk95UGZY?=
 =?utf-8?B?YzRSMWE1NTFiZ0JuTW5FWmpSNmh0eEdVOGRnUE5PYlljallHOXVWMEtOOVEv?=
 =?utf-8?B?Wmx2ek5FSW9JMmZtRklzTkdmQ2d6MFNjR01mRWhha1lPUGx6SVdoTlJVSTF2?=
 =?utf-8?B?VVdhNlFnbVhTY1kyYVdtNkZmYTlJMFpLblpJL0tJa3Q2ZWwzaVpROFZrRFhr?=
 =?utf-8?B?cVcrdUwrMTZQNEphdnpPMVF5cWJpQWpyT1V3MmdtVVgvaEt2Y2pSNGxuUHFN?=
 =?utf-8?B?TFp1LzBQQ2ZkL0U3bGIzUEIxNmpKRTNFYlB5V3UvVnEvdCsxN0F2RVFhRjFN?=
 =?utf-8?B?WU8zSlluV1Qzd2FsVFZYOEVTVnFoemFNalp3RTU4MmlDSDJRYlozNnhiNks4?=
 =?utf-8?B?anE0d256VGZXQmhrUnpBZGh2NXNadVBhaEpyTHVOdjhXb3FGaTF5WENQM1c4?=
 =?utf-8?B?emZFTjJ1WncxSXBBYzRGN0NMdzM0ZERJZWd5ZkxoLzhHTmltc2RmVDFFei93?=
 =?utf-8?B?YXJOaXUyenRDUFVPa2d0RndMaTQzRTVlelMwdWpVQThmcllWand3ZnN0Z0xq?=
 =?utf-8?B?dDhEcjhNSnpkOWtFOXdtbC92WFZzcGliTi82RW9XNmI2cHJoRjRFS1JnTCti?=
 =?utf-8?B?VU1SRDRVZkJ1NmRRLzd4UUdKYm96QnEzZ0FhNFJpOUZMdElGWWFBbktvdDdw?=
 =?utf-8?B?ajFmeUU2Sld4SzFWV0NWQzVCd1VyQ21zdWFDU0JUbjJyMi91U0lqWEQ2aENS?=
 =?utf-8?B?N21pcmhYR0x0Z1pncUQvdFE3WjJKcGJsdXVqbkxYS3kwaWdYOTQvYjU1QWMy?=
 =?utf-8?B?V2MzV09iUTR1Uk55WFBmV3AvRVhUQWdrTHplVzFSVXhNS2N2VzM5ZVdCVk1z?=
 =?utf-8?Q?DmG5o0zA9qvNU8JTmzGPRzgTKg+Pz3jDTM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF2FC6502B033647A12AAD5142C13EF1@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ece031d-f403-446e-eb95-08d8b1d3c6f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 23:44:00.6665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XTWxMPCn/2CPU1+dcJpu0p4kv3hi25phg2gtYzGLxYtEf66bK8jG9dmiObutdYUDDQa8aLInEFCrOmlKADZKug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6455
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=632ae7187=Atish.Patra@wdc.com; helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Tue, 05 Jan 2021 23:44:10 -0000

T24gVHVlLCAyMDIxLTAxLTA1IGF0IDExOjExICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gT24g
RnJpLCBEZWMgMTgsIDIwMjAgYXQgNTo0OCBBTSBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2Rj
LmNvbT4NCj4gd3JvdGU6DQo+ID4gDQo+ID4gQ3VycmVudGx5LCB3ZSBwbGFjZSB0aGUgRFRCIGF0
IDJNQiBmcm9tIDRHQiBvciBlbmQgb2YgRFJBTSB3aGljaA0KPiA+IGV2ZXIgaXMNCj4gPiBsZXNz
ZXIuIEhvd2V2ZXIsIExpbnV4IGtlcm5lbCBjYW4gYWRkcmVzcyBvbmx5IDFHQiBvZiBtZW1vcnkg
Zm9yDQo+ID4gUlYzMi4NCj4gPiBUaHVzLCBpdCBjYW4gbm90IG1hcCBhbnl0aGluZyBiZXlvbmQg
M0dCIChhc3N1bWluZyAyR0IgaXMgdGhlDQo+ID4gc3RhcnRpbmcgYWRkcmVzcykuDQo+ID4gQXMg
YSByZXN1bHQsIGl0IGNhbiBub3QgcHJvY2VzcyBEVCBhbmQgcGFuaWMgaWYgb3BlbnNiaSBkeW5h
bWljDQo+ID4gZmlybXdhcmUNCj4gPiBpcyB1c2VkLg0KPiA+IA0KPiA+IEZpeCB0aGlzIGJ5IHBs
YWNpbmcgdGhlIERUQiBhdCAyTUIgZnJvbSAzR0Igb3IgZW5kIG9mIERSQU0NCj4gPiB3aGljaGV2
ZXIgaXMgbG93ZXIuDQo+ID4gDQo+IA0KPiBGaXhlczogNjZiMTIwNWJjNWFiICgiUklTQy1WOiBD
b3B5IHRoZSBmZHQgaW4gZHJhbSBpbnN0ZWFkIG9mIFJPTSIpDQo+IA0KDQpKdXN0IHRvIGNsYXJp
ZnksIGl0IGlzIG5vdCBhIGJ1ZyBpbiB0aGUgb3JpZ2luYWwgcGF0Y2guIFRoaXMgYnVnDQphcHBl
YXJlZCBpbiByZWNlbnQga2VybmVsIGJlY2F1c2Uga2VybmVsKGZyb20gdjUuMTApIGRvZXNuJ3Qg
dXNlIGZpeG1hcA0KZm9yIERUIHByb2Nlc3NpbmcgYW55bW9yZS4gVGh1cywgdGhlIERUIGhhcyB0
byBiZSBwbGFjZWQgYXQgbG9jYXRpb24NCnRoYXQgY2FuIGJlIGFkZHJlc3NlZCBieSBrZXJuZWwu
wqANCg0KSSB3aWxsIGFkZCB0aGUgZml4ZXMgdGFnLg0KDQo+ID4gU2lnbmVkLW9mZi1ieTogQXRp
c2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+DQo+ID4gLS0tDQo+ID4gwqBody9yaXNjdi9i
b290LmMgfCA0ICsrLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4gDQo+IA0KPiBSZXZpZXdlZC1ieTogQmluIE1lbmcgPGJpbi5tZW5n
QHdpbmRyaXZlci5jb20+DQo+IFRlc3RlZC1ieTogQmluIE1lbmcgPGJpbi5tZW5nQHdpbmRyaXZl
ci5jb20+DQoNClRoYW5rcy4NCg0KLS0gDQpSZWdhcmRzLA0KQXRpc2gNCg==

