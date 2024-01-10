Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB92C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 08:01:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNTWR-0000An-N3; Wed, 10 Jan 2024 03:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rNTWO-000089-Ag; Wed, 10 Jan 2024 03:01:08 -0500
Received: from mail-sh0chn02on20624.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::624]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rNTWG-000320-Fd; Wed, 10 Jan 2024 03:01:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpgdXF6FVGk0YJrQXgnQSFaqMXm/bFTsXklqHMFXaZF9sEhFhzqa1h7yllz59yj4+J9bpLeKz2NjXTv8yZ+FVVtkmUmv9DUMna6a/wPMVDwMIUAVxucPtj7KVCbuszaLOLNK4qR5nQwvY0ZZ6kqUuMRAWRlWvX7bLUtSJDHUR2Au1OQvTxs/WEPEgGrxmmB95yn6KE9p7VI5oHuMVZABl5XvXqol+p2ARUSc4SaRZ7RcbgKfKCnurNLTY2l5fiuAg4W1Pk2WTHq0w/0VeE9VYZjhVBHAW+3bBGkn2wlLyOJoECdendEu6xr2XCsu0QW+mvtmyYx8j0I4mb+0CIw/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2H3t0k1LAJMnGnQRKjykHm5ipSnYYUcR1qO+HcxDbk=;
 b=btRWmKiDPoTcKBbu92BZCc8NSTEs0dZmfWVeZivkoyG5R48V0zPGQoCmH4jB/xnmu3k4+FATgcbzLhNjppDt72vMEex0ekzztb5H1er8Wcr7QKyPFSqJpMZu6Iz8PB1G82bZDMRsZC9YF6izab8eBQ4yoaE01XIiIUJF6evPlCbFCHHnQAc1X5+dvA9sXObLGAzcHzvp+fk5xFkxfohaBypSjVdapN/agAMZbP2/IVjL7gCWrximxzjppDZlz7BTRGKcE19+UW5lw+CcmkHHgL5iyFkOXXobhIIr7yPIr+TFgqj96/SOH2saFy6xGLPPQW/K6bsaPOU4oM0WylbKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::14) by SHXPR01MB0621.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.32; Wed, 10 Jan
 2024 08:00:48 +0000
Received: from SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 ([fe80::535d:fb55:ed0:334f]) by SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 ([fe80::535d:fb55:ed0:334f%3]) with mapi id 15.20.7135.032; Wed, 10 Jan 2024
 08:00:48 +0000
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
CC: "mst@redhat.com" <mst@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "anisinha@redhat.com" <anisinha@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "sunilvl@ventanamicro.com" <sunilvl@ventanamicro.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>, "liwei1518@gmail.com"
 <liwei1518@gmail.com>, "zhiwei_liu@linux.alibaba.com"
 <zhiwei_liu@linux.alibaba.com>
Subject: RE: [RESEND RFC v1 2/2] hw/riscv/virt-acpi-build.c: Generate SPCR
 table
Thread-Topic: [RESEND RFC v1 2/2] hw/riscv/virt-acpi-build.c: Generate SPCR
 table
Thread-Index: AQHaP7Z4JAGSGYV8t02yA4Q90Z9warDLJZQAgAeP3AA=
Date: Wed, 10 Jan 2024 08:00:47 +0000
Message-ID: <SHXPR01MB05740B3922874949A41885979C69A@SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn>
References: <20240105090608.5745-1-jeeheng.sia@starfivetech.com>
 <20240105090608.5745-3-jeeheng.sia@starfivetech.com>
 <e7ee041b-4e71-458c-8a56-f0b91a3ace0f@ventanamicro.com>
In-Reply-To: <e7ee041b-4e71-458c-8a56-f0b91a3ace0f@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0574:EE_|SHXPR01MB0621:EE_
x-ms-office365-filtering-correlation-id: 508bd727-1bb0-4ff5-05f7-08dc11b24174
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NVbp9x0eg6IWuWVNDmi6Jt/S5FXgq/gv2VV84XfJWwdvBZB3zKEfge4HG2zO2eLp8+Gt/HUrzOg0PW+Dt8lQMN20dAlUZe8yVOTvYOQkbmnQUeg1OIKEk6MA3zsHWbRgE/HztUrvcmwjQ/r5uBi/D0QgShvh41JjicAUCUr/BmBtQkBqmhcDei5FJG08Sj2em9f6KnGQAh+9UcGqeW7jVez0UP+NyHP7VcBy8gAo3esBFzFNG1CyGEi14ZstVIsN4YKAthnSfw6mElKBK6YUemjpCttYXF7gg2GtBPo8lP0xHBQpAcSlJT2lwGU3q++SicLniJrCJ1I7d11M7UOEiRfQVk8OXG4rm0W2OkYxEVsq81Bfjal2sVuQNgLY2KVDXCpB2uNJeUCTOdF7H529Le42X8v4SQ/CVjkDUJH4FbfbYVBOjZxVEx0N2/ncA/FD/nhrS7NNS2iYedi0fc03LdTG4tSak+WZ4Wm8Tv6Uoo7hjpT4KBy1f8D2hJzc1eLRObbY1c4o5dvrTYkIzfWcRJ/5TXzoB5jj1qxbJRvMk2yG/CqyF1BoeU/TSXKd61oD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(39830400003)(396003)(346002)(136003)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(122000001)(7416002)(54906003)(8676002)(41300700001)(8936002)(110136005)(71200400001)(2906002)(64756008)(5660300002)(4326008)(66476007)(7696005)(66446008)(66946007)(9686003)(53546011)(76116006)(38070700009)(66556008)(86362001)(33656002)(508600001)(40160700002)(41320700001)(55016003)(40180700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2UyNWFITUlaa01OR1lEcEJKWmVaMnF6alFSelpIRUJDWG5OS1Z3YmlzNFRq?=
 =?utf-8?B?c0NoaHYrczR1SVJ1Wmt1cmJ4MDNxN1F3L1RtUkFwemNtL3F4RElTTjlYNjcz?=
 =?utf-8?B?TTI0ZHFMYUZjam1nSVJzejVRL0d5M1diYldxcnNBRy9JaVVhcjRtQ2tYT1FK?=
 =?utf-8?B?VlFhbWdmbGwwbzFFWGYyNzlyMXZSczdyaXJRcGRmN3pUM2I3dXhvdmhNNCtl?=
 =?utf-8?B?V3JCNkwzQlA3N29rZHhsOUw1UjhiYllJNFhocU9FOVZLeHMvWkFEa1M2eEVI?=
 =?utf-8?B?MmpmTEo4OXdyVmFCWjgrcVBQZGhIa2laMG9FQVlIb1J1RXFYZ2N2QTRBQXdz?=
 =?utf-8?B?NWdzVUNjSHdPeEJwRUYvaEtRSjYyd0llZnBKaWxiOTkzbE1EWG9CM0g5NWlm?=
 =?utf-8?B?Y1ZmenNsYVFRZmVkby9vY1Y4NlVYYXVzc1lOMEx2clo4OTdLUXJ4WjZsVm1U?=
 =?utf-8?B?VHAvSGd5N3BQcVhkcGpRd1lWdTBsUVRYQU83eWVvVWxEbW5RY00wTG9ITGdy?=
 =?utf-8?B?eHRQNjltVzA4bTk5bWlFbkRSR0lMc1h1d0ZXa2xWUHREaWpqQXBwZTFjWlFU?=
 =?utf-8?B?WUFoUnhRZm05U0hjaEx3a2dKQzZZbmJ2WTRkNk54KzRqOEc0MlNWTnBRL0xK?=
 =?utf-8?B?UzJDODVQaG5kV0Y5aDJpVjBJRHZGUGlhR254cHFta0x3NXB5bk1EUDJ4eWFZ?=
 =?utf-8?B?bDVYVkc2NjJEREhtUnZkakZtU2RyRnNHdjB5VXMvWTAzTmdlYWJpSG5vdm50?=
 =?utf-8?B?ZW1lRVhmWFpEOTBzZDkxZFYrcC9LMG40cjJaMGhXOFhVZm1uMzlKd3YrVG9C?=
 =?utf-8?B?V3VMdE9hQzhzWlhtWXo5V3FHZzdHTS9rU2Q1aTc2M29leHRzb0JRcmFDakR3?=
 =?utf-8?B?ZFBwc0FRU1J1NkxZY0xVNElMajczZUszdHdrM0syRDg5L0JiZGh4STllWE9z?=
 =?utf-8?B?T0FQdlpKN2QyNStVcXRoL3ArVkwvVmZXOUwrWUtVd1huVlh6SWVXV3JYOG0y?=
 =?utf-8?B?WXlGWkFnaFRnNi9jWitQeTRuS1dQSStva21jdXplR2ViY1M3TXhyTy9kdjA3?=
 =?utf-8?B?NjMySHNJaXJmQmdFUDk4dHEyd2JSVE04aHVNQk5zWGVFWnA0MkdMc1RDbzE5?=
 =?utf-8?B?eDZCM1dOcDFLa1hTWTVwN2tXM0lIcmcwYm5iVEgzUUh0cTZGa0s4Z1pxS1lv?=
 =?utf-8?B?MGd3UE1oNUdXZGFnYkVTeXk2RnhvK0dueC81TFdlSXJJTk1zQm1QMFl5QjNs?=
 =?utf-8?B?VzJaUWRvNWNFWGszblgvaEgwMHJJWWFuRUpYSCtWLzRBcG4zaVpXWFpKYUJQ?=
 =?utf-8?B?UmpKbHhWYkJpTU1sV3dPZEdRYzBncjJvd05aaDdRQlJCZUIwdDJncGRkTW9K?=
 =?utf-8?B?Rkd0dWwrRVFhM0JoK1B6NlpzS1o5RlNJYVZtbjc4c1FxUkM2SnorT2M3ekhX?=
 =?utf-8?B?S1p1bVI3QUc1MmhHYXZYNTMxamJHNFkzbHlCbTJEQlA4L0dHcjZQWGJkYjZt?=
 =?utf-8?B?OTlEZERRVmloWUd0UmgrUXVrRFJleEtyMjBseFIvY0hHdUlKSjRjUHZ6Umpt?=
 =?utf-8?B?clpjM3lRUnZ2elFpUmtUeHQzZWM5a3YwRWFwY2t0bTQwY0swYTRnVnFqWmlL?=
 =?utf-8?B?UTVvNjM1OUlxRTV3OGVzN0liMjI1dWtSR2NKYmw5WnZkdmI2K0l2bWxaMURK?=
 =?utf-8?B?K1hHU2RnaDNWKzBSVEhycHpVYTZJQjRuTTJzYWpqM3lDcjROUmhZelZtaWR3?=
 =?utf-8?B?V0dnRWxXZjBNaWcvb3I3YUFqL01raXNjK0JLTG16N1AyYUJXczc4S05xck83?=
 =?utf-8?B?T1lvZXowMjVlS2tzUWlzUzB3Qk1RQUZhRG9uR1FkTzMzWERMam9RQ2p1Wjlq?=
 =?utf-8?B?YUl2bmFFN3UwK3l5YlRxTkppQWxUOXJtQWNVQkRJbDl2Q2kyRjkrNnM0cDhh?=
 =?utf-8?B?Mk1KaE9KUjIreFhkUklRSGRDdml2eGFadW1CUXphMURqTURJQmVJeGd3WDN2?=
 =?utf-8?B?YlNiZkliQjRhR09JYytMSjJkcGZ4L010Rmdwcmd6cmwvS3U4M0VkVW5wTnNl?=
 =?utf-8?B?VmN0aDNEeldrV0VBTGV2WlNydGY2eUtldmZWS1pqMnRvUjVGZWh1NUxXMHpH?=
 =?utf-8?B?TnpsdzB6bGhvaHI2U2NjbEIwaUZFTVZEVjkwMkRlN2JNQmczREJmTVpJL3Fz?=
 =?utf-8?B?bkRUaXlkcHZaTCtPT0Z0cUJBUnNMaCtHNmJLb2tKTmFFSVBhZzgybUxqRzNB?=
 =?utf-8?B?K1htcUlET2F6VEpQc1pHaFp4OGdRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 508bd727-1bb0-4ff5-05f7-08dc11b24174
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 08:00:47.9304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lu6k+G15DtcQFSBe3mrbv6VJSOIqjXxQD+M8t/9mX7RWnENEZlDBXX65PbSAUSFE/BzvUCAb1hRaGNspFMZ5o9Ovka6dYiaSb/QOvKPr7LQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0621
Received-SPF: pass client-ip=2406:e500:4420:2::624;
 envelope-from=jeeheng.sia@starfivetech.com;
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIEhlbnJpcXVl
IEJhcmJvemEgPGRiYXJib3phQHZlbnRhbmFtaWNyby5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSmFu
dWFyeSA1LCAyMDI0IDg6MjcgUE0NCj4gVG86IEplZUhlbmcgU2lhIDxqZWVoZW5nLnNpYUBzdGFy
Zml2ZXRlY2guY29tPjsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3Jn
OyBxZW11LXJpc2N2QG5vbmdudS5vcmcNCj4gQ2M6IG1zdEByZWRoYXQuY29tOyBpbWFtbWVkb0By
ZWRoYXQuY29tOyBhbmlzaW5oYUByZWRoYXQuY29tOyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7
IHNoYW5ub24uemhhb3NsQGdtYWlsLmNvbTsNCj4gc3VuaWx2bEB2ZW50YW5hbWljcm8uY29tOyBw
YWxtZXJAZGFiYmVsdC5jb207IGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbTsgYmluLm1lbmdAd2lu
ZHJpdmVyLmNvbTsgbGl3ZWkxNTE4QGdtYWlsLmNvbTsNCj4gemhpd2VpX2xpdUBsaW51eC5hbGli
YWJhLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1JFU0VORCBSRkMgdjEgMi8yXSBody9yaXNjdi92aXJ0
LWFjcGktYnVpbGQuYzogR2VuZXJhdGUgU1BDUiB0YWJsZQ0KPiANCj4gDQo+IA0KPiBPbiAxLzUv
MjQgMDY6MDYsIFNpYSBKZWUgSGVuZyB3cm90ZToNCj4gPiBHZW5lcmF0ZSBTZXJpYWwgUG9ydCBD
b25zb2xlIFJlZGlyZWN0aW9uIFRhYmxlIChTUENSKSBmb3IgUklTQy1WDQo+ID4gdmlydHVhbCBt
YWNoaW5lLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2lhIEplZSBIZW5nIDxqZWVoZW5nLnNp
YUBzdGFyZml2ZXRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAgaHcvcmlzY3YvdmlydC1hY3BpLWJ1
aWxkLmMgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9o
dy9yaXNjdi92aXJ0LWFjcGktYnVpbGQuYyBiL2h3L3Jpc2N2L3ZpcnQtYWNwaS1idWlsZC5jDQo+
ID4gaW5kZXggZDRhMDI1NzlkNi4uMzg4YjNkMWE4NCAxMDA2NDQNCj4gPiAtLS0gYS9ody9yaXNj
di92aXJ0LWFjcGktYnVpbGQuYw0KPiA+ICsrKyBiL2h3L3Jpc2N2L3ZpcnQtYWNwaS1idWlsZC5j
DQo+ID4gQEAgLTE3NCw2ICsxNzQsNDIgQEAgYWNwaV9kc2R0X2FkZF91YXJ0KEFtbCAqc2NvcGUs
IGNvbnN0IE1lbU1hcEVudHJ5ICp1YXJ0X21lbW1hcCwNCj4gPiAgICAgICBhbWxfYXBwZW5kKHNj
b3BlLCBkZXYpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gKy8qDQo+ID4gKyAqIFNlcmlhbCBQb3J0IENv
bnNvbGUgUmVkaXJlY3Rpb24gVGFibGUgKFNQQ1IpDQo+ID4gKyAqIFJldjogMS4wNw0KPiANCj4g
U2hvdWxkbid0IGl0IGJlICJSZXY6IDIuMCI/IFRoZSBmdW5jdGlvbiBpcyBjYWxsaW5nIHRoZSBj
b21tb24gYnVpbGRfc3BjcigpIHRoYXQNCj4gc3BlY2lmaWVzDQpJIHdpbGwgZ2l2ZSB0aGVtIGEg
Z2VuZXJpYyBuYW1lIGZvciBib3RoIHRoZSBhcmNoIGJ1aWxkX3NwY3IoKSBhbmQgdGhlDQpjb21t
b24gYnVpbGRfc3BjcigpLiBUaGUgcmV2aXNpb24gaW5mbyBzaG91bGQgYmUgcGFzc2VkIHRvIHRo
ZSBjb21tb24NCmJ1aWxkX3NwY3IoKS4NCj4gDQo+ICsgICAgQWNwaVRhYmxlIHRhYmxlID0geyAu
c2lnID0gIlNQQ1IiLCAucmV2ID0gMiwgLm9lbV9pZCA9IG9lbV9pZCwNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIC5vZW1fdGFibGVfaWQgPSBvZW1fdGFibGVfaWQgfTsNCj4gDQo+IA0KPiAN
Cj4gQ29kZSBMR1RNIHJlZ2FyZGxlc3Mgb2YgdGhlICJSZXY6ICIgY29tbWVudCB2YWx1ZS4NCj4g
DQo+IA0KPiBSZXZpZXdlZC1ieTogRGFuaWVsIEhlbnJpcXVlIEJhcmJvemEgPGRiYXJib3phQHZl
bnRhbmFtaWNyby5jb20+DQo+IA0KPiANCj4gDQo+IA0KPiANCj4gPiArICovDQo+ID4gKw0KPiA+
ICtzdGF0aWMgdm9pZA0KPiA+ICtidWlsZF9zcGNyX3JldjIoR0FycmF5ICp0YWJsZV9kYXRhLCBC
SU9TTGlua2VyICpsaW5rZXIsIFJJU0NWVmlydFN0YXRlICpzKQ0KPiA+ICt7DQo+ID4gKyAgICBB
Y3BpU3BjckRhdGEgc2VyaWFsID0gew0KPiA+ICsgICAgICAgIC5pbnRlcmZhY2VfdHlwZSA9IDAs
ICAgICAgIC8qIDE2NTUwIGNvbXBhdGlibGUgKi8NCj4gPiArICAgICAgICAuYmFzZV9hZGRyLmlk
ID0gQU1MX0FTX1NZU1RFTV9NRU1PUlksDQo+ID4gKyAgICAgICAgLmJhc2VfYWRkci53aWR0aCA9
IDMyLA0KPiA+ICsgICAgICAgIC5iYXNlX2FkZHIub2Zmc2V0ID0gMCwNCj4gPiArICAgICAgICAu
YmFzZV9hZGRyLnNpemUgPSAxLA0KPiA+ICsgICAgICAgIC5iYXNlX2FkZHIuYWRkciA9IHMtPm1l
bW1hcFtWSVJUX1VBUlQwXS5iYXNlLA0KPiA+ICsgICAgICAgIC5pbnRlcnJ1cHRfdHlwZSA9ICgx
IDw8IDQpLC8qIEJpdFs0XSBSSVNDLVYgUExJQy9BUExJQyAqLw0KPiA+ICsgICAgICAgIC5wY19p
bnRlcnJ1cHQgPSAwLA0KPiA+ICsgICAgICAgIC5pbnRlcnJ1cHQgPSBVQVJUMF9JUlEsDQo+ID4g
KyAgICAgICAgLmJhdWRfcmF0ZSA9IDcsICAgICAgICAgICAgLyogMTUyMDAgKi8NCj4gPiArICAg
ICAgICAucGFyaXR5ID0gMCwNCj4gPiArICAgICAgICAuc3RvcF9iaXRzID0gMSwNCj4gPiArICAg
ICAgICAuZmxvd19jb250cm9sID0gMCwNCj4gPiArICAgICAgICAudGVybWluYWxfdHlwZSA9IDMs
ICAgICAgICAvKiBBTlNJICovDQo+ID4gKyAgICAgICAgLmxhbmd1YWdlID0gMCwgICAgICAgICAg
ICAgLyogTGFuZ3VhZ2UgKi8NCj4gPiArICAgICAgICAucGNpX2RldmljZV9pZCA9IDB4ZmZmZiwg
ICAvKiBub3QgYSBQQ0kgZGV2aWNlKi8NCj4gPiArICAgICAgICAucGNpX3ZlbmRvcl9pZCA9IDB4
ZmZmZiwgICAvKiBub3QgYSBQQ0kgZGV2aWNlKi8NCj4gPiArICAgICAgICAucGNpX2J1cyA9IDAs
DQo+ID4gKyAgICAgICAgLnBjaV9kZXZpY2UgPSAwLA0KPiA+ICsgICAgICAgIC5wY2lfZnVuY3Rp
b24gPSAwLA0KPiA+ICsgICAgICAgIC5wY2lfZmxhZ3MgPSAwLA0KPiA+ICsgICAgICAgIC5wY2lf
c2VnbWVudCA9IDAsDQo+ID4gKyAgICB9Ow0KPiA+ICsNCj4gPiArICAgIGJ1aWxkX3NwY3IodGFi
bGVfZGF0YSwgbGlua2VyLCAmc2VyaWFsLCBzLT5vZW1faWQsIHMtPm9lbV90YWJsZV9pZCk7DQo+
ID4gK30NCj4gPiArDQo+ID4gICAvKiBSSENUIE5vZGVbTl0gc3RhcnRzIGF0IG9mZnNldCA1NiAq
Lw0KPiA+ICAgI2RlZmluZSBSSENUX05PREVfQVJSQVlfT0ZGU0VUIDU2DQo+ID4NCj4gPiBAQCAt
NTU1LDYgKzU5MSw5IEBAIHN0YXRpYyB2b2lkIHZpcnRfYWNwaV9idWlsZChSSVNDVlZpcnRTdGF0
ZSAqcywgQWNwaUJ1aWxkVGFibGVzICp0YWJsZXMpDQo+ID4gICAgICAgYWNwaV9hZGRfdGFibGUo
dGFibGVfb2Zmc2V0cywgdGFibGVzX2Jsb2IpOw0KPiA+ICAgICAgIGJ1aWxkX3JoY3QodGFibGVz
X2Jsb2IsIHRhYmxlcy0+bGlua2VyLCBzKTsNCj4gPg0KPiA+ICsgICAgYWNwaV9hZGRfdGFibGUo
dGFibGVfb2Zmc2V0cywgdGFibGVzX2Jsb2IpOw0KPiA+ICsgICAgYnVpbGRfc3Bjcl9yZXYyKHRh
Ymxlc19ibG9iLCB0YWJsZXMtPmxpbmtlciwgcyk7DQo+ID4gKw0KPiA+ICAgICAgIGFjcGlfYWRk
X3RhYmxlKHRhYmxlX29mZnNldHMsIHRhYmxlc19ibG9iKTsNCj4gPiAgICAgICB7DQo+ID4gICAg
ICAgICAgIEFjcGlNY2ZnSW5mbyBtY2ZnID0gew0K

