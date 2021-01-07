Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxaYU-00089k-5V
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jan 2021 14:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=634a5def5=Atish.Patra@wdc.com>)
 id 1kxaYT-00088T-1H; Thu, 07 Jan 2021 14:02:41 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:45560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=634a5def5=Atish.Patra@wdc.com>)
 id 1kxaYQ-000149-Ct; Thu, 07 Jan 2021 14:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610046158; x=1641582158;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ItcUampcdiiWcRJcTr+EtBFoSj3ZmL6oh+yJkbcx3u4=;
 b=Y27blxe9yNrGzAoMhWrsDTqIVViGtJj5HjmAT41qaXb6krX/au6g7u5N
 LNI7jjVebyX43h9UOFiQ8vVWdexu5jafDjcMIFzAJJ5dR1/k8Zx+5DdXI
 ChmPzuDvhsXsR/4LhrWUV59F1fIsdi8W91nlEwRRFy9uhHSO9hacjUW+m
 hkgdI0cYTjODOj8OvE375BQbO9kzGSaXprGd8DeR7QJIRDSD4NOX8SDGf
 p91fxPVCGTaiLQcoaSEqd877Hh583JpTIZjgfiCW/ATuY7xZoRyM1js1p
 2QUPDM+T115bCKxSbGvM3nVc86/4/qrbZ3p8LuYidcaIiFqGlBsGvaHtn A==;
IronPort-SDR: CGZ+CFeSqKk+MqKfwG/thkGLtWKa+x3brTOugaM/m3BA3hpiVI6NPL5s6CELXjUyNg+mgEI+Vr
 dqx4LmYngYfEXiOLB/szymFiu6n0rVIcJGmvAp+fghC1QgDCLKTyG61N5NRAbA5PtqrufmdZUG
 qg0RD5PrUeQe768kEcywaeY0nQIZszmiAkD0shJsO2DVamJ2ivPr5U6Y6nFswGgYM2tGAz5/17
 YJazYCN/zUuh3oys4xvwyRlvTn2YleUQTM5aRQyyzCGbAJBWzfoOAh0okYH5iWENYrkK6MTstj
 /ng=
X-IronPort-AV: E=Sophos;i="5.79,329,1602518400"; d="scan'208";a="161170289"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2021 03:02:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mph1l1YyiC+Tu+TqTDxpOWTORLCZYg7O+Qv3mXgU9jGyPWsqzfc1GQB7PPWgbwUC6plfCLequVSJjLP9kCrlFPY7IleSX4fN3QTHtllpirdXjPyMQrr+ybHToorpY/ul/Xz+PXhQZHJdWNiyqwV38sVMrlFTal8YE/NxJyLhCFqhJ/HdXN4HesODi7qHXdoE4wbU9e65OykgBVSoojq+YoxLenSUOK5M6MC5TxBF8lV0nHuW2pgvVKtiWm7oWymLYO598o/JDHjbU4Kb+0eUx1VqoDNt3EwcSZ8OX/rV8P1KBHuJIsjluICgUYe7+cQvfthyh5XfWBcQnHA4TYyXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItcUampcdiiWcRJcTr+EtBFoSj3ZmL6oh+yJkbcx3u4=;
 b=DVzcwbDBRKJRT24id5WQ5iOhGTuiDEdtYCUrfmsmsgTUybYnUebGj9R6pw3UpzzPD5WS2ymeHXID4RyBhJkJ9wJWzKhmJrebDSR30KgfQnaIp5Ln64eSWpcXmRwZHmjkF/Xe+y6vJNneBnjlxzrEeKvcqae5SJhD3vz6oWtQevA6w+5YuCMgNq++5hNDHDuvcSrrfBH9SyO4Ilf6sxCb660y7wLig8pltCmAoYZ25D76R+aK+MdvOhNtek1G/UmutEbDjOB4BnW0GBVByKg55in8OCHfcSaRZSE/L13MGAlGQQAGwrXtQYi1xVreJlxoORaHi5r8GZN/6EX1tcafow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItcUampcdiiWcRJcTr+EtBFoSj3ZmL6oh+yJkbcx3u4=;
 b=OQQ5IVWmTUrzSnyE3+UKY06m0SkMS25QfCAXuZAt+xIp3r2lwD/NlLY3HrzNqNhplqP+2rLuDsBp8vf0cyK3SBHtKG5OuCFXK+m9WG0BQVzqEvxPqguMIi0tf9Pu5s/E/Nbxul2T6P8K/Qy0NvOoV9RXFGDNUzSQ8piIYgsF4N8=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by SJ0PR04MB7309.namprd04.prod.outlook.com (2603:10b6:a03:291::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 19:02:32 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7%7]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 19:02:32 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "alistair23@gmail.com" <alistair23@gmail.com>
CC: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>, Alistair Francis
 <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Anup Patel <Anup.Patel@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>
Subject: Re: [PATCH v2] target/riscv/pmp: Raise exception if no PMP entry is
 configured
Thread-Topic: [PATCH v2] target/riscv/pmp: Raise exception if no PMP entry is
 configured
Thread-Index: AQHW2WFwrczTMmK+QEeImrqF35NeZ6ocf8eAgAAcwoA=
Date: Thu, 7 Jan 2021 19:02:32 +0000
Message-ID: <3542d26c042fd088114aa403612a58a643d45eaf.camel@wdc.com>
References: <20201223192553.332508-1-atish.patra@wdc.com>
 <CAKmqyKO7uRewgKZz9V5BP5Xnqw8HWaCruaQta1JK_HvzmhdR+Q@mail.gmail.com>
In-Reply-To: <CAKmqyKO7uRewgKZz9V5BP5Xnqw8HWaCruaQta1JK_HvzmhdR+Q@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: fbe6f871-132b-4d21-04eb-08d8b33ec9ae
x-ms-traffictypediagnostic: SJ0PR04MB7309:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR04MB73093CA33CF7AEB11DB718B8FAAF0@SJ0PR04MB7309.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +pNKB7wB7wvmhQYZMUtj9K6PxIlYWlltyu0+9yNmtgcYTqc8if7wSz9Xwgs7K9Gxxezi5JLxC8bqD6cbNrLEH1xuEyyDZ/IP0HPD6YrZ2ASfsL0PKdrzLuRc0QYzmOmRm1L98JtfeFMMASFM7scB6Ejlc3LE/l8lbsXKB3x0pZVCQ8N2bWqkfG45tPlNpoaFn55E1thWosL0HHm5Z64loJD4Maz3l4VoJ5KB0O3pQNCLOUuHNc8I4RNFG+7GlXxLjj0KVY88zKJyvZEBRz/HTfX5PfB0lolTBxBaaz9vhlIM7e9JF0AujizMoIKvqxIkpE2LW1JYXr/IHYlOjb9mbvVZh7F2+QbYkKnucvALwlot/KKUWn/t/yOnEEcY+nYqRYw+dOAuU3F4wA2BBZlBTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6724.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(86362001)(66556008)(26005)(8936002)(478600001)(5660300002)(2616005)(6486002)(53546011)(6506007)(36756003)(6916009)(4326008)(83380400001)(6512007)(66476007)(66946007)(66446008)(64756008)(76116006)(186003)(71200400001)(54906003)(2906002)(8676002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?R2x0UnZqc3VjZjJ6czZFRFRKa3E0YWtPQ1VPSjhZbm1xMlNqMFVCd1lESWli?=
 =?utf-8?B?ZjdBUHBDK0RIdEUyVzVJUG5uNk5raEhLUklZbUUwVFFRRW9KTFdaVWU1ZlJ4?=
 =?utf-8?B?MTNlWGgzU3hHKzFwRHN5eUlTZVlkMjY5ZEdHOC9NcjhZdzZDcXpGZGJPbVI0?=
 =?utf-8?B?SmI3K0FtaW9HNGFaTmtWakZKUXRRQmI3ZGJ1ZFZwRVZHSy9nbmJzelNuYytO?=
 =?utf-8?B?bFJaTjM3RkZDVlhPYzl1ZkZOVUloSG5kZXZ3VFM5MldqU3V2dlVPN29TQXpN?=
 =?utf-8?B?QVpTN3lGMXFTdmk2SjQrRDlENEMzY3g4MG1sVTMrZ1hWK3ZCTERVZm83TU1G?=
 =?utf-8?B?aklnblNBQUU5SWFTUFcxMUFvRTdPRm9jQmdZQzZhQnpvMmN1RHZ5TENhWEJn?=
 =?utf-8?B?VlpOazJnaGh1UmtIRkxUdzF3TURDV3pWYU1iK1RXeTQweFpYdjlRc1M0WUR6?=
 =?utf-8?B?djVEc1ZkeU9mZHhBTytBSy96ZG1nYW1wTk5tMzlxUEl0KzhVcWR3Z1QvQlRV?=
 =?utf-8?B?WFNnUFR1OVJwdnpjc0d5NGVGa3Y5T0l3UUg3SFlXT2RpbnEwNzZuNEJvaVcr?=
 =?utf-8?B?S0hQeldpcXU2djRRdkoyenZ6eE14MStBaTRJREZlNExSaHljVVhPOERuclo2?=
 =?utf-8?B?YzZXclVham1aS1ptT1Q0SnRuLyt2YUNSRTZ3QkF6N0dzbVhtM3lNeW44RUti?=
 =?utf-8?B?WTh0SU1Bd0dhM3ZIb0psTk0yN0NNNWc0R3o2emdBcmRUb0xyN1pRaUFzRXdj?=
 =?utf-8?B?S1ZkdExRQ3RQdzNCZFZCeWppb3Z0RGh0SmFXQ1ZFVE1PUXlyaDRWbDNVZVB6?=
 =?utf-8?B?SjlDUnZWK0tzNVBzc0pjb0VGVEpUSVV4QXF2QWN1M1pSdGJLeXppK0tFWGd6?=
 =?utf-8?B?N0FYb2xzaXBsMCtxaVB2d1JZMitCMFRmWkFOeGNrVktrTzB3ek9zZ05rdFQ5?=
 =?utf-8?B?NWtiR1lrV0tYeS9WQUdIUGN5TXpBTEJsNlA5ZW5aNFdib3hNckxqRDl1OFcv?=
 =?utf-8?B?QkdwL2tldExTNkRCU0VEUFJ0Vm5NZDZzVk5kRTBtOTZKSjJKdnpNckVQcm1Q?=
 =?utf-8?B?YU0rUXNMSnl3Y1VDLzJzSWNiUWFha01wL2lMUnlhRGhUYUJCWlQ2RHc5L0lS?=
 =?utf-8?B?dTNHVmcvZktCU3IyeHdLdDNqb3pZRkpTbGNKVy9WVWQreTBOWnQ2dzI2U1BK?=
 =?utf-8?B?V3kzanRtVVBhck92NFBWdldyK0tjUVdxcFl6aUwybExCcnRnMDFsdHlNMTZR?=
 =?utf-8?B?QThaZFlXcExWVHJIUFNVeGR4c0FwWVZoeGtvTWNIWE10VXNJWTJyY1F3Q3VC?=
 =?utf-8?Q?TYPlmJnJpg3bwZ2YK451XbPVl8+c2V4wqF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0142233ABF239C40868B518D5CF3B58E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe6f871-132b-4d21-04eb-08d8b33ec9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2021 19:02:32.4968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OJKVAVcNFF8v+6+szsZQTBDMH+jxtR7plU6qy920o68/mjjMg+wpmhl8y8vjWP2/mAt/RaWaJ/nWC1pyUWwqgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7309
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=634a5def5=Atish.Patra@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Thu, 07 Jan 2021 19:02:41 -0000

T24gVGh1LCAyMDIxLTAxLTA3IGF0IDA5OjE5IC0wODAwLCBBbGlzdGFpciBGcmFuY2lzIHdyb3Rl
Og0KPiBPbiBXZWQsIERlYyAyMywgMjAyMCBhdCAxMToyNiBBTSBBdGlzaCBQYXRyYSA8YXRpc2gu
cGF0cmFAd2RjLmNvbT4NCj4gd3JvdGU6DQo+ID4gDQo+ID4gQXMgcGVyIHRoZSBwcml2aWxlZ2Ug
c3BlY2lmaWNhdGlvbiwgYW55IGFjY2VzcyBmcm9tIFMvVSBtb2RlIHNob3VsZA0KPiA+IGZhaWwN
Cj4gPiBpZiBubyBwbXAgcmVnaW9uIGlzIGNvbmZpZ3VyZWQuDQo+IA0KPiBUaGlzIGRvZXNuJ3Qg
c291bmQgcmlnaHQsIHRoZSBzcGVjIHNheXM6DQo+IA0KPiAiSWYgbm8gUE1QIGVudHJ5IG1hdGNo
ZXMgYW4gUy1tb2RlIG9yIFUtbW9kZSBhY2Nlc3MsIGJ1dCBhdCBsZWFzdCBvbmUNCj4gUE1QIGVu
dHJ5IGlzIGltcGxlbWVudGVkLCB0aGUgYWNjZXNzIGZhaWxzLiINCj4gDQo+IEkgZG9uJ3Qgc2Vl
IGFueXRoaW5nIHNheWluZyB0aGF0IGFuIGFjY2VzcyB3aWxsIGZhaWwgaWYgdGhlcmUgYXJlIG5v
DQo+IFBNUCByZWdpb25zIGNvbmZpZ3JlZC4NCj4gDQoNCkl0IGFsc28gc2F5cw0KDQpJZiBhdCBs
ZWFzdCBvbmUgUE1QIGVudHJ5IGlzIGltcGxlbWVudGVkLCBidXQgYWxsIFBNUCBlbnRyaWVz4oCZ
IEEgZmllbGRzDQphcmUgc2V0IHRvIE9GRiwgdGhlbiBhbGwgUy1tb2RlIGFuZCBVLW1vZGUgbWVt
b3J5IGFjY2Vzc2VzIHdpbGwgZmFpbC4NCg0KTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGlmIFBN
UCBpcyBpbXBsZW1lbnRlZCBpbiBoYXJkd2FyZSwgYnV0IG5vdA0KY29uZmlndXJlZCwgUy9VLW1v
ZGUgbWVtb3J5IGFjY2VzcyBzaG91bGQgZmFpbC4gQXQgbGVhc3QgdGhhdCdzIGhvdw0KaGFyZHdh
cmUgYmVoYXZlLg0KDQo+IEFsaXN0YWlyDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEF0
aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgZnJv
bSB2Mi0+djENCj4gPiAxLiBSZW1vdmVkIHRoZSBzdGF0aWMgZnJvbSB0aGUgZnVuY3Rpb24gZGVm
aW5pdGlvbg0KPiA+IC0tLQ0KPiA+IMKgdGFyZ2V0L3Jpc2N2L29wX2hlbHBlci5jIHwgNSArKysr
Kw0KPiA+IMKgdGFyZ2V0L3Jpc2N2L3BtcC5jwqDCoMKgwqDCoMKgIHwgNCArKy0tDQo+ID4gwqB0
YXJnZXQvcmlzY3YvcG1wLmjCoMKgwqDCoMKgwqAgfCAxICsNCj4gPiDCoDMgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS90YXJnZXQvcmlzY3Yvb3BfaGVscGVyLmMgYi90YXJnZXQvcmlzY3Yvb3BfaGVscGVyLmMNCj4g
PiBpbmRleCBkNTVkZWY3NmNmZmQuLjFlZGRjYjk0ZGU3ZSAxMDA2NDQNCj4gPiAtLS0gYS90YXJn
ZXQvcmlzY3Yvb3BfaGVscGVyLmMNCj4gPiArKysgYi90YXJnZXQvcmlzY3Yvb3BfaGVscGVyLmMN
Cj4gPiBAQCAtMTUwLDYgKzE1MCwxMSBAQCB0YXJnZXRfdWxvbmcgaGVscGVyX21yZXQoQ1BVUklT
Q1ZTdGF0ZSAqZW52LA0KPiA+IHRhcmdldF91bG9uZyBjcHVfcGNfZGViKQ0KPiA+IA0KPiA+IMKg
wqDCoMKgIHVpbnQ2NF90IG1zdGF0dXMgPSBlbnYtPm1zdGF0dXM7DQo+ID4gwqDCoMKgwqAgdGFy
Z2V0X3Vsb25nIHByZXZfcHJpdiA9IGdldF9maWVsZChtc3RhdHVzLCBNU1RBVFVTX01QUCk7DQo+
ID4gKw0KPiA+ICvCoMKgwqAgaWYgKCFwbXBfZ2V0X251bV9ydWxlcyhlbnYpICYmIChwcmV2X3By
aXYgIT0gUFJWX00pKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgIHJpc2N2X3JhaXNlX2V4Y2VwdGlv
bihlbnYsIFJJU0NWX0VYQ1BfSUxMRUdBTF9JTlNULA0KPiA+IEdFVFBDKCkpOw0KPiA+ICvCoMKg
wqAgfQ0KPiA+ICsNCj4gPiDCoMKgwqDCoCB0YXJnZXRfdWxvbmcgcHJldl92aXJ0ID0gZ2V0X2Zp
ZWxkKGVudi0+bXN0YXR1cywgTVNUQVRVU19NUFYpOw0KPiA+IMKgwqDCoMKgIG1zdGF0dXMgPSBz
ZXRfZmllbGQobXN0YXR1cywgTVNUQVRVU19NSUUsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdldF9maWVsZChtc3RhdHVzLCBNU1RBVFVTX01Q
SUUpKTsNCj4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L3BtcC5jIGIvdGFyZ2V0L3Jpc2N2
L3BtcC5jDQo+ID4gaW5kZXggMmVkYThlMWUyZjA3Li44MGQwMzM0ZTFiZmMgMTAwNjQ0DQo+ID4g
LS0tIGEvdGFyZ2V0L3Jpc2N2L3BtcC5jDQo+ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L3BtcC5jDQo+
ID4gQEAgLTc0LDcgKzc0LDcgQEAgc3RhdGljIGlubGluZSBpbnQgcG1wX2lzX2xvY2tlZChDUFVS
SVNDVlN0YXRlDQo+ID4gKmVudiwgdWludDMyX3QgcG1wX2luZGV4KQ0KPiA+IMKgLyoNCj4gPiDC
oCAqIENvdW50IHRoZSBudW1iZXIgb2YgYWN0aXZlIHJ1bGVzLg0KPiA+IMKgICovDQo+ID4gLXN0
YXRpYyBpbmxpbmUgdWludDMyX3QgcG1wX2dldF9udW1fcnVsZXMoQ1BVUklTQ1ZTdGF0ZSAqZW52
KQ0KPiA+ICt1aW50MzJfdCBwbXBfZ2V0X251bV9ydWxlcyhDUFVSSVNDVlN0YXRlICplbnYpDQo+
ID4gwqB7DQo+ID4gwqDCoMKgwqDCoCByZXR1cm4gZW52LT5wbXBfc3RhdGUubnVtX3J1bGVzOw0K
PiA+IMKgfQ0KPiA+IEBAIC0yMzcsNyArMjM3LDcgQEAgYm9vbCBwbXBfaGFydF9oYXNfcHJpdnMo
Q1BVUklTQ1ZTdGF0ZSAqZW52LA0KPiA+IHRhcmdldF91bG9uZyBhZGRyLA0KPiA+IA0KPiA+IMKg
wqDCoMKgIC8qIFNob3J0IGN1dCBpZiBubyBydWxlcyAqLw0KPiA+IMKgwqDCoMKgIGlmICgwID09
IHBtcF9nZXRfbnVtX3J1bGVzKGVudikpIHsNCj4gPiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRy
dWU7DQo+ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAoZW52LT5wcml2ID09IFBSVl9NKSA/IHRy
dWUgOiBmYWxzZTsNCj4gPiDCoMKgwqDCoCB9DQo+ID4gDQo+ID4gwqDCoMKgwqAgaWYgKHNpemUg
PT0gMCkgew0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvcG1wLmggYi90YXJnZXQvcmlz
Y3YvcG1wLmgNCj4gPiBpbmRleCA2YzZiNGM5YmVmZTguLmM4ZDVlZjRhNjk0ZSAxMDA2NDQNCj4g
PiAtLS0gYS90YXJnZXQvcmlzY3YvcG1wLmgNCj4gPiArKysgYi90YXJnZXQvcmlzY3YvcG1wLmgN
Cj4gPiBAQCAtNjQsNSArNjQsNiBAQCBib29sIHBtcF9pc19yYW5nZV9pbl90bGIoQ1BVUklTQ1ZT
dGF0ZSAqZW52LA0KPiA+IGh3YWRkciB0bGJfc2EsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFyZ2V0X3Vsb25nICp0bGJfc2l6ZSk7DQo+
ID4gwqB2b2lkIHBtcF91cGRhdGVfcnVsZV9hZGRyKENQVVJJU0NWU3RhdGUgKmVudiwgdWludDMy
X3QgcG1wX2luZGV4KTsNCj4gPiDCoHZvaWQgcG1wX3VwZGF0ZV9ydWxlX251bXMoQ1BVUklTQ1ZT
dGF0ZSAqZW52KTsNCj4gPiArdWludDMyX3QgcG1wX2dldF9udW1fcnVsZXMoQ1BVUklTQ1ZTdGF0
ZSAqZW52KTsNCj4gPiANCj4gPiDCoCNlbmRpZg0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+ID4gDQo+
ID4gDQoNCi0tIA0KUmVnYXJkcywNCkF0aXNoDQo=

