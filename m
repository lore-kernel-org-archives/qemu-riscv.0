Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n761s-0005qe-VB
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 20:32:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002e91a21=wilfred.mallawa@wdc.com>)
 id 1n741b-0008Sg-QB; Mon, 10 Jan 2022 18:24:29 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:8606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002e91a21=wilfred.mallawa@wdc.com>)
 id 1n741Y-0007Pg-5T; Mon, 10 Jan 2022 18:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641857063; x=1673393063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AocwxDLa6hjQjb/4EIFo6oKh108ggShoiUuunhghZmY=;
 b=cAL/hmROLJI6TpHdnTVOxfVcst0olY6g6YFEKei+6Li3f6Rpo81aV2mb
 aipoDSMci7Z8fRu+G5WhEbwvEJKbMZG16HMeyVqXN/PrPo24H7rzAIKQU
 H+aoQnU6PCDZVO6/poubgSa+BG+uKlD/jlyKCOR9jEeflVELYXVcmgjsv
 7ZTDahUpf5Fy3Zd4Gzq5gjPwB3DZZPn2Bsdg7P5iulENVW9ibhmGZy9ad
 siEfVoYok/uuJWQKn0BVDsm1Se0pJermKtAN/iyTSk37k969FAx/UHdhA
 WqosgPWQDOX7D9txp/33zF93WLwT9rEK5CVKbzUSdryQD1+lBoZjADQ2c Q==;
X-IronPort-AV: E=Sophos;i="5.88,278,1635177600"; d="scan'208";a="194931477"
Received: from mail-bn1nam07lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hgst.iphmx.com with ESMTP; 11 Jan 2022 07:24:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPDLYAKkf+Ppq16y/TXy46KKDXR7EfR5JW+4Pp5sSAuSKlbab5aMA8renMdMD2fyzwYHs6VMcV3uobubPxXtAypn1xFND+ZQo5VtrTySdBp8zt5AIsJ/ZCwe2OkYne3bT+dIFa0GiDDLki1Z85ermcTJgL0HLO4NUCui06SLZq31DZvpfT7JroZIH2Ra5RaFA3YLHUPH6Aw7rbmKvsahuh/pAOaCHAoZTRV9cRczPsp0AlfQb7fHkjwHz7gaAGA5xXBP5iCcXt2Sato0qziDlKE0q8xB2os1mMx20+PXGGeKTjwadwnM6mxRAKP2+XOp1lkQz1/9i4erGq1BOrnSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AocwxDLa6hjQjb/4EIFo6oKh108ggShoiUuunhghZmY=;
 b=ij+LHxTOEg5docGF+SzJ8aokZO5N8pJI8H+tTnlSH0sAw3IBE6D8TqE7QM6+15VXPyxzJYOhS+j6mjk5y+HqixQhm3xzQEYatln+v7Ysob02WgAsHFawAVVJFlzsorl2vLhobSOEG1bTQN/kdUBIGM5T6YMitLlCK1JGAa3kr3b9Cs4Av3HFlekb9NMJ6+t0ZvffDcWA0HImq6RGPFmaUPh/lYxGqdFaKgRvgpuveD3ReOYxAClOPW8vMra9lxT2PxnUXOn8O3nHWUTu2MCcdFQ7EFPGotog0uFRYIII5hX3V0DHn0q2mIWZYorWBWX7sR/GMh8BCKCTudD6CMg2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AocwxDLa6hjQjb/4EIFo6oKh108ggShoiUuunhghZmY=;
 b=P2tpTFDSgaBGWZfeAwZu2m+lIk6JqaJtKJ016jyVeV3XF9T6TJOuJkBidQS9apv5TBUj1PVnHbvztO3fPsGAXVkQ7uZxoOoJCufi21tL5fMJ9by3Jt3r24XPR4WRFcoNmIUkvybbB46Z4jJMWdcvnDHYnPlCij6f7prL9ZZD86g=
Received: from BL0PR04MB6546.namprd04.prod.outlook.com (2603:10b6:208:1c2::14)
 by BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 23:24:18 +0000
Received: from BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::ccf:15a3:37d3:ea7a]) by BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::ccf:15a3:37d3:ea7a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 23:24:18 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
 "alistair.francis@opensource.wdc.com" <alistair.francis@opensource.wdc.com>
CC: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "alistair23@gmail.com" <alistair23@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] riscv: opentitan: fixup plic stride len
Thread-Topic: [PATCH 1/2] riscv: opentitan: fixup plic stride len
Thread-Index: AQHYBek5KElT6VPQqEuulipDO8s+jaxb3QyAgAEJfwA=
Date: Mon, 10 Jan 2022 23:24:18 +0000
Message-ID: <e33362fcff50de117ded3470a6112cc718183b91.camel@wdc.com>
References: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmVjdMfF5G-xbjBCFWE13PGtVG9WveXfDSyAAO3Q0Fpukw@mail.gmail.com>
In-Reply-To: <CAEUhbmVjdMfF5G-xbjBCFWE13PGtVG9WveXfDSyAAO3Q0Fpukw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7fdb1a6-dae3-4ec5-5a64-08d9d4905338
x-ms-traffictypediagnostic: BL0PR04MB6514:EE_
x-microsoft-antispam-prvs: <BL0PR04MB6514695E2D4A011B2FA98279F7509@BL0PR04MB6514.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jZsUtg7NuH+ctA1ExeZdwQdCBfvJZjRUbjdQ0cbwGaU2jW1CcZsrlqMxfXl1d7FTcYsumd1mKK+gfzXFjchfxVVl1SaNvIcixOEdGuv0H3qXtMVTaBWWtR48hfqSalxeGDtRhlHaGXgKrmfa8lQqdLGHuFO9tj7zCEASU6Dld0FRIK0nSlKIGGiOdkewZwUon5P3PB3hKh7vPsaFTi8dkx1KstfK+yT2MH29m2bc/cYJETcY66d4MZOvQyBRjiJJOdmkJ24rV0w6jztUyXRE62T7rCAmUnsqp1+TaSyaOtmIk1pOilYLtq1Lmz7R3hXxXX/2SKJTHAy02l5Vzo+n4eTMKqiUi8z6rQLwz6Rr1HqRBFX2He/8VTqzGxSIlrFaOAS7ncf5+/DcrIKnsY+F6WyrtBYzFzvnce2yJeIdHEWH56WNlRH7EyO+n5U4aVN2IqsNgOiv41IxxwmBUoHF7+GFtlWQB1eiiNoWzKWDSW+qTBnkx53VTKiyRgysEWRWdbGz1hFShNIWc9BeeaU9boeGDy8vB/7AbCw4VCKFkq7W5st/pl3AgQWrmeb+GGHQCBg6bY4SHSb8qN5/c0N4AurWSj2dAy/tc5lAg9UzMcExkrDEpc3f1n0v2QGnjWg1JMPMEWUOASxnLqxDmnEbjRx3eR7hh9FwOre2wbscipdNZm1QCQEZbd5ucx/mq2pBV8IkSBXbEqWa0PUEoJ6HJ1WDGmvPdmAWfkQgV5p6fEM7cnIgkh4JmxOE/RhglLQ0Tq/BLfnbLb/7pKCWfgsdQvVD3+pC0PxMES3J9UdP+JU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6546.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(6486002)(66446008)(64756008)(66476007)(66556008)(122000001)(508600001)(86362001)(38070700005)(54906003)(76116006)(91956017)(110136005)(2906002)(53546011)(83380400001)(6512007)(38100700002)(2616005)(44832011)(66946007)(316002)(71200400001)(4326008)(26005)(186003)(82960400001)(966005)(5660300002)(8936002)(4744005)(8676002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVlwVFNxY2NvM0QyUGkrcHBQV2JYbUlzZVEwTFUrZkx2WEQvOUhKcHRRTFJU?=
 =?utf-8?B?c09obEJ0eERobWxkSVlsRWh4WXZUaDErYWV5ZWxDeGc3ZGpPVTdmMGpQUU1k?=
 =?utf-8?B?a3ppK0gxQ2hMYWw1Q2pjZGdJWjVVL3E2Mll6ckVjSDd3TitCaWFJSnNiSDFE?=
 =?utf-8?B?QzgxNnF5cnhsMHI3Y3RmWXNMZGFrOFZmZmRWb2ZoTGhPR05HRmhUaXNDbkxZ?=
 =?utf-8?B?dnBIbkpZRHBKREZwR0VNcXp2aHkxU3RtLzc2UXJJdGVZZithOWVyNU8ybFpC?=
 =?utf-8?B?dXYvSnF6TCs0UVF0KzZMa3lmb2RFTFROUWVYK3VoN2hVdER2d0RFTGl0cFpJ?=
 =?utf-8?B?NkJmcDBwdnhtU25HSjJkalhvNU04dWl6eENscmhySzh0a29LbkNWVW9OVnln?=
 =?utf-8?B?cEdGbm9MK2FIWldrT0ZEeWlwWnh6TmVXRjBUeHdLU291NkNQQkV0QUNUWG1m?=
 =?utf-8?B?b0ZhQXFMRW9DaERuZVFyWitzZTNrTWdEZFJMd1gzWmNsQVE2ZWozdjExSFhE?=
 =?utf-8?B?eTYrcUhhOVREZ3NWVFNBOC9RbEVzbzYvckFPNlhxYWMvaEwwWDEyRldVOHBH?=
 =?utf-8?B?Q2JMbzdMNEd6VmZuTEMvdDIxM3gwNFhtMndwTFc4SE96cndHSHRVQWxqSUJJ?=
 =?utf-8?B?L28wN1ZTTVFPaGVBZXNpT2ZvcWdLQTBRZkE2b3IzWitPd1RpbENXd1JyTnpm?=
 =?utf-8?B?Zlora215SE5EdEI5TThSUlV1MVNJWVhxSGhIVCtOaXdzYUZoMUxOU3pZaHQr?=
 =?utf-8?B?clRSR3BKb2VqRW8vL1VZUU5VZnpVWTlzR2JhcDhib2t6RGRpdDNxTjgvVGw2?=
 =?utf-8?B?bHEyU1UzS05YL1JZSkJ3SjVqYVcyTStEVnlQbmdoRWN6QmJ2UU5VZWw3VHdD?=
 =?utf-8?B?L3BqMjhIZWhCMWxtYVI4SzJKd3FKNVVpclZFMFRzMlpIWkJILzdTK2JLMVI2?=
 =?utf-8?B?VkptL1dPdjFlNFpIS2tFd3ZTTzBDL1JEdVl2Y1FrSzRoQ3RKdXZxN2RwbVpG?=
 =?utf-8?B?V2FKY3NNYVVBMHFGYTJTZHh1dm0xSldXVzBJbWdibHV3THhBc0hJM2JuMWc0?=
 =?utf-8?B?ZUJNNFBWcEhsWHpsY1BmNnl3U1RlV2t2Zmg0Z0NZYzB5YlFIdlZodnkxaUdO?=
 =?utf-8?B?Zy83Y2pGLy95WWx6SUhLNmpXbFRIMWU5NkY0NW9nUUx4aDBENUl5VWVoWlRi?=
 =?utf-8?B?TW5zaXdkWVdvS2lsNUhqQnlkcGllbWdpWlNzaVBjYXlsWEZML2xUbjE2cFh4?=
 =?utf-8?B?Qk16ZVdGVmlNTWlrd2hPbi9ORHhhWHRWSVdCSHhlNWttS1VUUDFPdFJ5NjI1?=
 =?utf-8?B?UW9pdVp1VTFvbGUrbDA2RDllZVk0UmlZOTZWang4V3RNSGFkWU81QmI2REZ4?=
 =?utf-8?B?cUxYcVZJZzI5UDJqUGkxUlhULzFnWHpzOUNPS3FWYU9HWmVZemN5M1dhNEdy?=
 =?utf-8?B?ZGZFUmVUQnNFdTNZeC9GSU5TUU16dnp6VlRFOFROeDVrSm9yLzRkL2tvZ2JF?=
 =?utf-8?B?U05OL0lpaFk0Uyt1eitiQko4Q3lzZVNvRXQraDUvSG9MaTVIRTBDd2xSeGMy?=
 =?utf-8?B?NmJMN2t5TUFpQ20wUCsxMjduSTM5cnlsZ0lVWmhxQnVxNDdkZXZLSFBuVWs4?=
 =?utf-8?B?ekh0dzRucEZaZm8zaGNCU3RMbzg2djFQU2tsL2NVVVBsYnZ5NTVpWCtDZjhn?=
 =?utf-8?B?TnFXUjdsdTc1ZVd0eHl6ZCt2aUtHRHJHbm1mcmFWZWdRUGlMMkVETGQrYWZO?=
 =?utf-8?B?T0Q0Y3lCMVY3dm50bHpaZG5hMU5keEJwVWtNSC9RblY4NXpRVjZDK0p2QVRY?=
 =?utf-8?B?QTBHQ2JFV0RkbnMrc1NvcENxeXRZeVFzajh2Q1NPQ0NVaUtLYmZhVUVqbXE4?=
 =?utf-8?B?T0Zaa3g0dlYzOTNONE5uWmlTNUdPZG9laXFIQ2JOY3JxdU9FWjJnaTFOZXJD?=
 =?utf-8?B?UnFqc3FZZFZoVmxqdVplVUJTd1IzUlYzck1NTVpicVhRMmJ0U0pBMFFYNnFS?=
 =?utf-8?B?SHdXT1IvMGpyZDNqWHAvb3Zna25oenBzQ2R6bjJXanVucUxaaWRaVkFWVjFj?=
 =?utf-8?B?ajE4TWNMaXp1NTJlRDVmUmJwVVNyMExqd2tQMEgrL3A4OTliNE4zbmZIeTl0?=
 =?utf-8?B?anhzTFZFZUdCWElNa0gvUjAzQi81MHhsZnJJTlhLU1pkQ3M0THIwMWdBd3Ar?=
 =?utf-8?Q?JDfmfaEGRepXuSrg4Izibms=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FF5E43EEAB55942A065C9030D94477B@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6546.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fdb1a6-dae3-4ec5-5a64-08d9d4905338
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 23:24:18.4030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y71wMG6cKiTCG3GBGmzd1Boc3blIOsgr3QXPgrrjvSQq4azBxGxr1ZHLWTw8iU4JF/NH7u1LTkXOssdH7eCbvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6514
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=002e91a21=wilfred.mallawa@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Jan 2022 20:32:52 -0500
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jan 2022 23:24:29 -0000

T24gTW9uLCAyMDIyLTAxLTEwIGF0IDE1OjM0ICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBXZXN0ZXJuIERpZ2l0
YWwuIERvDQo+IG5vdCBjbGljayBvbiBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3UgcmVjb2duaXplIHRoZQ0KPiBzZW5kZXIgYW5kIGtub3cgdGhhdCB0aGUgY29udGVudCBpcyBz
YWZlLg0KPiANCj4gDQo+IE9uIE1vbiwgSmFuIDEwLCAyMDIyIGF0IDI6MTMgUE0gQWxpc3RhaXIg
RnJhbmNpcw0KPiA8YWxpc3RhaXIuZnJhbmNpc0BvcGVuc291cmNlLndkYy5jb20+IHdyb3RlOg0K
PiA+IA0KPiA+IEZyb206IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+
DQo+ID4gDQo+ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2Ugd2FzIG1hZGUgdG8gcmVjdGlmeSBpbmNv
cnJlY3RseSBzZXQgc3RyaWRlDQo+ID4gbGVuZ3RoDQo+ID4gb24gdGhlIFBMSUMuIFdoZXJlIGl0
IHNob3VsZCBiZSAzMmJpdCBhbmQgbm90IDI0Yml0ICgweDE4KS4gVGhpcw0KPiA+IHdhcw0KPiAN
Cj4gUExJQyBbMV0NClRoYW5rcywgd2lsbCBhZGQgdGhpcyBpbi4NCj4gDQo+ID4gZGlzY292ZXJl
ZCB3aGlsc3QgYXR0ZW1wdGluZyB0byBmaXggYSBidWcgd2hlcmUgYSB0aW1lcl9pbnRlcnJ1cHQN
Cj4gPiB3YXMNCj4gPiBub3Qgc2VydmljZWQgb24gVG9ja09TLU9wZW5UaXRhbi4NCj4gPiANCj4g
DQo+IFsxXQ0KPiBodHRwczovL2RvY3Mub3BlbnRpdGFuLm9yZy9ody90b3BfZWFybGdyZXkvaXBf
YXV0b2dlbi9ydl9wbGljL2RvYy8NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogV2lsZnJlZCBNYWxs
YXdhIDx3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGh3L3Jpc2N2L29w
ZW50aXRhbi5jIHwgMiArLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4gDQo+IA0KPiBSZXZpZXdlZC1ieTogQmluIE1lbmcgPGJtZW5nLmNu
QGdtYWlsLmNvbT4NCg0K

