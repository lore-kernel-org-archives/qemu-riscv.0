Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ks9mK-0002qt-07
	for mharc-qemu-riscv@gnu.org; Wed, 23 Dec 2020 14:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61943049f=Atish.Patra@wdc.com>)
 id 1ks9mI-0002pK-JD; Wed, 23 Dec 2020 14:26:30 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:59603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61943049f=Atish.Patra@wdc.com>)
 id 1ks9mG-0003Wl-4l; Wed, 23 Dec 2020 14:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608752654; x=1640288654;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pRlQgXSA4RAvO/ZZEkzUtRhSXunLU4uvkNokHkL61Q0=;
 b=LWH+kEKcZo5GBvb8jO8RkcSHCLQKmjaUCoDt8HzZS7Ui1nJ3r7J2/cHK
 erDris3uvobwDcw4OdEG4KRQJ8gT4XEveGJQz/5OkklLhoxrg8j/wFLcN
 nmlK0u4GWzNNGft9W6L4VoiSBGuKmqV+zBMBMZRjkXN1OMjzdkaHtpXLT
 xAtqAZmeOGgchdhTMBF/DW41FG9/bDsxYr3Szy2FwM9f32PmMSiZYzQDQ
 CIUTMwaJlZYMqNw51HrdPr1Qg9WHNnqHxsQoI3KlB+nEv/lNJR2mwAOLJ
 ikk7WekwG7OayemCG5hdpS3aFUnoFowCqxIBDMCplkg+b+KPsVYQ9yYrm A==;
IronPort-SDR: NeFe74ToyuQ1/T0GJ4Ey+p8Wq1JqPDoLw/i6uQl+Oba2T1sYN9VpKteYVYubfkrcyS5YGZlV6+
 2egwtR5KaDjCgbeuorgSNOJLmrSuBnc4dW3L89MHgGO0qHf37x4664LPzg7lemAuly0YIHzPG7
 CGuHDrTclfln53+V2YMNs/NFBcCfPPcL1Rn4N6OOls4fuSQXcoa4osgg4FqwmwoLn73oxJ+6LS
 +M3pqdEg/IAqeTYCk0ns19z27uvEbtb9jweyQg8yvYYIw0dFsT0I4yllNZQZJFn4xDdz3rABPY
 MeA=
X-IronPort-AV: E=Sophos;i="5.78,442,1599494400"; d="scan'208";a="259736116"
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hgst.iphmx.com with ESMTP; 24 Dec 2020 03:44:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fICSdbdsGDvfHa92KT8Tgga3WO/smYOy9uk+A4iieTGmdcTlhMsGszl6+2sqxrwBD1f57c6wtcU2/2aDj12Ck9nBuauiYGX5bphMOqu0UpPwcHcq1tXOK4WFNM1LOdMXyCImGw0cAV0WevnfP2MB0LdKOlxUa5EoJpF7gJ74R003C5UOSSWHZBVC1J4lg0LxEMbS5FwaGadO3GdGHVi4X5oeZKOfTgVDaQJOAmNOc/ADXLqbJ1SBSwof7H0e3wJ/NsigmHxQ0hYuGQNrisKuUAvfL9v9fvv56r6GHa7j2IdyDXmK2oxzUc1NqNoSb5qMErdi/3kPvC2WNzpfILkR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRlQgXSA4RAvO/ZZEkzUtRhSXunLU4uvkNokHkL61Q0=;
 b=XeVwgrKom9mjaMkBVWfN+WsETt3zRaV3xege3PewszAaeyopDQo7u3m3R5faxnDneHXA+N4dnsfAWGTiG4Igrpik+UXS9+xpfze8ABembQj+HhGPnqQxU/6UjRJg64o7sWIZu6H+aiKZUY+6uo3+tJEa+XxcpxG/gb8VFjSCUSJAB2uWYLFtF0d8uflkOTShTWJMXIwkxxvGiGBAtCT0nTmA33jZL7TT/2VgN/oikMITLIjUlZQtDVYUgZZo8/CV7dkuag0AmcTQ7dX5n3AMBiVcIc+l4okoG5QptNoPX6JKKrPDgZWeLwFWKEJSdpsdw2sB1avms7P4fc0FaMDZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRlQgXSA4RAvO/ZZEkzUtRhSXunLU4uvkNokHkL61Q0=;
 b=dyqemBv61bmm6KpiHlAxkFOItIkpR4wbG+vSGmFBnKosmb9fkClby78Ly6RmyqYxn/dAhBQdtem7F1d9I/yEtm3lKhj5SH0SRl28LOtjhRagGiS/eddmhU8ZsR7o4Yp+Xs3ScuwNo3ABpyPFIy9HFkuNOdtgADrDHZrY15aNCoo=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BYAPR04MB3992.namprd04.prod.outlook.com (2603:10b6:a02:b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Wed, 23 Dec
 2020 19:26:24 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::6540:dbb1:548a:fc7%6]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 19:26:23 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>, Alistair Francis
 <Alistair.Francis@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH] target/riscv/pmp: Raise exception if no PMP entry is
 configured
Thread-Topic: [PATCH] target/riscv/pmp: Raise exception if no PMP entry is
 configured
Thread-Index: AQHW2MoJ8Xl14B3D6EG3P+iEPv/08qoD+wMAgAEWZgA=
Date: Wed, 23 Dec 2020 19:26:23 +0000
Message-ID: <f83f0478bb9bfce8906e65196dcd2d176ea3dee2.camel@wdc.com>
References: <20201223012158.4146439-1-atish.patra@wdc.com>
 <a8b4471a-dc22-2dba-a3fb-cc13c308c236@linaro.org>
In-Reply-To: <a8b4471a-dc22-2dba-a3fb-cc13c308c236@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [99.13.229.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 63b40ff5-0c03-4c93-5b2d-08d8a778a2a2
x-ms-traffictypediagnostic: BYAPR04MB3992:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB399239550425B8D9BAD0CD75FADE0@BYAPR04MB3992.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a4dRhXgM+eeI3dPghVhuiwkoIO/Jaxt30gE9Mhh3OUOL4JQFXMpNs8rXJRXiY+TnC5L38z1Omfg9wsMLLrsTNDSWL+ygLe77BR7vKtjhjqINc4B6Va8d0ujgC2kEWZF5xuuS9wLNwLvaT23XjNxmDfI4BRcn0oSVKfpmb0G95SLvgcpoWytwJNqc/mbUDUqSEIz34cLeLZWSl9n8WcTKxNDuZx7b8ivMl7JRVCUai7u7QxMjxjCZYidxUemhO/v6o63bWuyu1R8b0vemr6D6EknJkuosFLn6GjaDP6aNsQKtRBPhHUhAKKTDgOg4JLpajIgohKH6crFdhIeEnRgScA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6724.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(26005)(6506007)(83380400001)(53546011)(6486002)(76116006)(186003)(110136005)(6512007)(36756003)(66476007)(478600001)(54906003)(5660300002)(8676002)(64756008)(2906002)(66946007)(4001150100001)(4326008)(316002)(2616005)(66446008)(66556008)(71200400001)(8936002)(4744005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bTh1bzB5aS9Ra0NySzNtZHlwSVJmOWUvMEEwWHVTRkRJTXl2a0w3c3VIQ3NX?=
 =?utf-8?B?a3N5NWdFOW9QQWhIWXc2eHorN3MwSktRUUhaSjErbXhQT0xQeFBXaEIwVW42?=
 =?utf-8?B?UnQ1QUdubkR2UTFORTVlMzZ2TnNHMkdMaFROZnVTTGttemVzWUIzU3RPdjlG?=
 =?utf-8?B?VW84QTh5WituL0pBMWNaZzhpdFZzYWVFRWxxOG5zcTArVXRVMVRMS0Uyc0h3?=
 =?utf-8?B?cjFRcFgvYzRXSVFoM3I3aVVDUWNiV2g2RVk0YnNZOGZtN1Rra3RYSVFqWkkv?=
 =?utf-8?B?cUx6WFM1aEZJU0RDa1ptd2F0WW5PWFZTSnZOOXF2c0JmNmRYR0xtQVhmRytH?=
 =?utf-8?B?VzVpdzRWSmRlT3JTdlY1aUVLeHhhOU1MR2s4TnF4MjMxQ1JaTGlCWnlBS0NH?=
 =?utf-8?B?L0syT2E3RS9IOEd1WnorQkNDRzluRTg1RHYxUFBiVFlTMzVkMUxCNHp1K1g0?=
 =?utf-8?B?YkQxQzE0NGNiWkFPdFROc201UWR3cG9KMnhnY20vNUJiZ3o0cTBCQW5Ta0hz?=
 =?utf-8?B?aUMxTEtEa21ybXo2eG45TTM0Z0NNWkdzMnNmYnBIY2RDa201blpNMnkrZzhH?=
 =?utf-8?B?aXljUzZSTXZJd0RlMFA3NFZHVmFxMnVqb2pjVjBEaWxDTjZ5dlArYUlram05?=
 =?utf-8?B?VjUyZmE2UVBwdEladVdnREhPenFOWEhadFlwcGc5emk2TEJ3NDc2ZDlDSnJY?=
 =?utf-8?B?cEI1cEFBNm90U1l6QVZhZUZ1K3VRdk5Ob1lSOEZqRDFVeXlwSmEzU3ZhOHc5?=
 =?utf-8?B?T2FoVWZGbXA0V3VhbFhXTXNzWHRhVWtRMUk5QzR4cWdlbDJ4dzZlT01VQ1VV?=
 =?utf-8?B?dWFhYTIzS0dEQXk4anNaTUtvQlpla20xSlNCeWRQQnVLczdiTkRhWlFnYjlQ?=
 =?utf-8?B?SHRjT1lpSUJnZFlLbXJ0cnVvLyt5ZThQSkZ0dFdZaDB4SEZ6dVg3ZEZ0UmU4?=
 =?utf-8?B?dlpTY0pOK1R0YU00V29FeEs3VTN2akpvZk9UL1pRSURxT3ZqdG01aHErSWRO?=
 =?utf-8?B?Q3dPbWR2MStjUUVRTVB4VEFSK1huLzA1YUlrV0FrcXdnbFR2bGRzcVlURGNm?=
 =?utf-8?B?UjlYTU04cjRJODNSUUhoN01QbzdNU3M2cHIyR1JBU1VPWVRpbmNlOFlhdk5F?=
 =?utf-8?B?TVJ6RWY4dEsyanUyV011K2ttVENHUGl5c29zR04xZWx6TVVvSnZaVWhRSW9p?=
 =?utf-8?B?eVZCbGYrZGVmNnRZamhjN1BrdGtMN2RueENxNk41NHR1ckdWYitYMmttOVVS?=
 =?utf-8?B?bG5zM252Q1EvbmtOUkxYbTY5WHpRaWdDaFRUN0RRUEtPbmFjWjk4S2V1dWs4?=
 =?utf-8?Q?jjRBNJyjvBx/Wd3wpzHFPi3eT63UMWo8QM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4139FAED32420C4B9D73D0D1F8601342@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b40ff5-0c03-4c93-5b2d-08d8a778a2a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 19:26:23.8024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhaWMNZv2NwKFeXoqN5LzXV0N194sXX644J1+HOU/uxxLZwYZnrKD3aEoVl49cONbOuZa1mUyP/ia75ffYLGSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3992
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=61943049f=Atish.Patra@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 23 Dec 2020 19:26:30 -0000

T24gVHVlLCAyMDIwLTEyLTIyIGF0IDE4OjQ5IC0wODAwLCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90
ZToNCj4gT24gMTIvMjIvMjAgNToyMSBQTSwgQXRpc2ggUGF0cmEgd3JvdGU6DQo+ID4gKysrIGIv
dGFyZ2V0L3Jpc2N2L3BtcC5jDQo+ID4gQEAgLTc0LDcgKzc0LDcgQEAgc3RhdGljIGlubGluZSBp
bnQgcG1wX2lzX2xvY2tlZChDUFVSSVNDVlN0YXRlDQo+ID4gKmVudiwgdWludDMyX3QgcG1wX2lu
ZGV4KQ0KPiA+IMKgLyoNCj4gPiDCoCAqIENvdW50IHRoZSBudW1iZXIgb2YgYWN0aXZlIHJ1bGVz
Lg0KPiA+IMKgICovDQo+ID4gLXN0YXRpYyBpbmxpbmUgdWludDMyX3QgcG1wX2dldF9udW1fcnVs
ZXMoQ1BVUklTQ1ZTdGF0ZSAqZW52KQ0KPiA+ICtpbmxpbmUgdWludDMyX3QgcG1wX2dldF9udW1f
cnVsZXMoQ1BVUklTQ1ZTdGF0ZSAqZW52KQ0KPiA+IMKgew0KPiA+IMKgwqDCoMKgwqAgcmV0dXJu
IGVudi0+cG1wX3N0YXRlLm51bV9ydWxlczsNCj4gPiDCoH0NCj4gLi4uDQo+ID4gLS0tIGEvdGFy
Z2V0L3Jpc2N2L3BtcC5oDQo+ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L3BtcC5oDQo+ID4gQEAgLTY0
LDUgKzY0LDYgQEAgYm9vbCBwbXBfaXNfcmFuZ2VfaW5fdGxiKENQVVJJU0NWU3RhdGUgKmVudiwN
Cj4gPiBod2FkZHIgdGxiX3NhLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHRhcmdldF91bG9uZyAqdGxiX3NpemUpOw0KPiA+IMKgdm9pZCBw
bXBfdXBkYXRlX3J1bGVfYWRkcihDUFVSSVNDVlN0YXRlICplbnYsIHVpbnQzMl90IHBtcF9pbmRl
eCk7DQo+ID4gwqB2b2lkIHBtcF91cGRhdGVfcnVsZV9udW1zKENQVVJJU0NWU3RhdGUgKmVudik7
DQo+ID4gK3VpbnQzMl90IHBtcF9nZXRfbnVtX3J1bGVzKENQVVJJU0NWU3RhdGUgKmVudik7DQo+
IA0KPiBZb3UgbmVlZCB0byByZW1vdmUgdGhlIGlubGluZSBhcyB3ZWxsLg0KPiANCg0KT2YgY291
cnNlLiBGaXhlZCBpbiB2Mi4gVGhhbmtzLg0KDQo+IA0KPiByfg0KDQotLSANClJlZ2FyZHMsDQpB
dGlzaA0K

