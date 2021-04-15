Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lXATK-0007TH-M4
	for mharc-qemu-riscv@gnu.org; Thu, 15 Apr 2021 18:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=732514de9=Alistair.Francis@wdc.com>)
 id 1lXATI-0007TA-Ib
 for qemu-riscv@nongnu.org; Thu, 15 Apr 2021 18:28:24 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:6789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=732514de9=Alistair.Francis@wdc.com>)
 id 1lXATF-0006xf-JK
 for qemu-riscv@nongnu.org; Thu, 15 Apr 2021 18:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618525701; x=1650061701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xylpUo/KVrEPN5LU+IM444K4PINx+qFUV3twOjQrzS0=;
 b=p9Kr3qahFtrVLSAnbDgkjVcqncVBrJjstOpvPyMwKtWq5YK/hIzMEUiW
 Xb88OnPeJOQcY3dzTBUPoa0jxUHa/owbdtO8paHqeCCMiOJ+iFTHTlj9a
 CM69YesOyOAaMnYvIzPg/igl86mbrngeKpzr6z9ZwKdjxNR9pONKoyQdc
 HKB52B+WivlSDYfb16diIeLRkGdNpoUJEizDkoqi3a2vLkl2UxYB9wKvM
 eb5L22A04DHlfmc39haDqlaWrakB0tpCU4PoXTb+ahbdr9hAW94ILyXCF
 6Uso+cpfpE2+6AfIBD3TXGUc2Ay9Y9qwgjZY/+U/7+Ar8HHD3k9NpSH65 g==;
IronPort-SDR: kvq8L+BEMG1PGnAPWNDhQozDQm3rrHaGV95Mfhp3VhrdVjzX8kwKuygT9h/uX+heZj7aCX+TtI
 YCR0We6uuY3Q4jsgyzfp1YPPL/zNj1A2HFGG4S2oWL48jeoi0XBNyxURiCOJVQR4bpnXRLeMZT
 JKmTETa0jCPjR71PbPBV7DhceGQN/VgPMSJ/4bj6/ue8rQkzyzrekp1iAoyTRay73Eyqy17tkI
 7bONpusdpnw/BRMPCpJ2+4lQ6pAOmZEmUNyp0QgNTgjPRD0xPANTs760pjmuSvVCrriFQiHEZs
 LHY=
X-IronPort-AV: E=Sophos;i="5.82,226,1613404800"; d="scan'208";a="165587238"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hgst.iphmx.com with ESMTP; 16 Apr 2021 06:27:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eT3dghNS4bk/5CVgkqcrOSKfiBrPPHbm2Ax1WnfI22pAxlEWVymWSTEQLXMlDs6t0rMkoqCnlOSYHrY25NmdfoXcXunMUD3h+RJvQP5BArmRf1pLGq6r0it6NVgFBL4vyW84nwAnGGA9L6Cui9vx+V8UFRbFDsdh5QnucpqiJDwRSpAoisl8HblXFpK7sfjmJVLhHiou/c5dMmVjzm7l+VjFq5cjj/Z/KT34nADWofYla7uKUXK4ybO+8z74dx/NTPD7vEzzzMiQxu2E1187tu+dvZDAeoqGA5uEpeq5LmQGuUNoVKCxrH8/6P4PZ4UDtbY6oiE+PxnhOmw8WvP75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xylpUo/KVrEPN5LU+IM444K4PINx+qFUV3twOjQrzS0=;
 b=YXfLv3RHFnVgUncAtFxQSNTERdVlF4sB/tx8XekmFNsXLjVViYa5fsxeKSIzUl4Q0E63Fv7ZEuKYOqqiCrXbenotwa9Bkj99Dn+iB6nPxAaK06+4IAqDNJc5QB92v1tmgo2YR+//A9/nLWp5eT9qxTGYODtygOjmfGMsdcAy2FOZMAPKasc7Mwwf7OA+jaaS9/cIhlJnMnUGvWsOjGdBoi24n1q+4idm+cgklsZ32FHWx8cJYqrQH4KcpDGiFVyQzu2yTT77SQyXL1vFx6HaCSgm7R93AGGQLA2zAD7g5Ds0W6ecD1YHZ3jfb0erlNV+IYIOxXp3trd5gSbrdap8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xylpUo/KVrEPN5LU+IM444K4PINx+qFUV3twOjQrzS0=;
 b=ve82zgwuZxq5TJ46gn28ZoKTWt/31ZQ3wXg8jS0HjHDtEreWga7R680jW3a8Wcu9GQPKXCYaszY6dBMlU8PtmmAhAQ0x+en9QQB0ZiX+tSk80tkwWP8eYTvE4XCFOnUC4dJiIO3aUXo2wOqDNxTJMU3eyxhnETXvfaExqUshH3k=
Received: from BY5PR04MB6882.namprd04.prod.outlook.com (2603:10b6:a03:21b::19)
 by BYAPR04MB5111.namprd04.prod.outlook.com (2603:10b6:a03:44::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 15 Apr
 2021 22:27:27 +0000
Received: from BY5PR04MB6882.namprd04.prod.outlook.com
 ([fe80::e072:747b:c4a7:282]) by BY5PR04MB6882.namprd04.prod.outlook.com
 ([fe80::e072:747b:c4a7:282%8]) with mapi id 15.20.4042.018; Thu, 15 Apr 2021
 22:27:26 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "emmanuel.blot@sifive.com" <emmanuel.blot@sifive.com>
CC: "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>
Subject: Re:
Thread-Topic: Re:
Thread-Index: AQHXMf0jZq7u2paPuUaRA9Gy+mb1Paq2KQqA
Date: Thu, 15 Apr 2021 22:27:26 +0000
Message-ID: <a482cb01544d09b738b00a855f657de731a313ed.camel@wdc.com>
References: <20210415134128.32670-1-emmanuel.blot@sifive.com>
In-Reply-To: <20210415134128.32670-1-emmanuel.blot@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.4 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.180.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 092910bd-47cb-4e01-0385-08d9005da610
x-ms-traffictypediagnostic: BYAPR04MB5111:
x-microsoft-antispam-prvs: <BYAPR04MB51112B3B1AC7C98F34C8547F904D9@BYAPR04MB5111.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eT03FfkGDSyiQPOmoQdbJKrzWCVySKecGX/4Gm8jpGQC6dfzoINFzUYQqFBSHoIdAVTOMqKrJzsDPF+UsLKmv+3kBJLu29mjE7kAqqiTzgt+UJu7M4KaQn9NxwligpJhfc8OYmSQ1cy/PLfzNH5vSKnhqGzPUP8TrOMBLgFrHfVfJqQXRtlsAOd1bfiP1Xg9z0PUrZCpC7chI9m7epM7ajhgbyGG1QUPv3Ds2qG5yFDl9KS7d3fdjgWcPte7UbVGIAuJS093uvYJlLhk+v6gtoFyUJfvTdv3MLgpTPLOIO7RDwjD5I1jBCgFuo1GyKYRfZ09UUAMUG5VAiIlt0pipKheb4XrMQKc3KKEARKpQytkfZw+pPmuHmIzb5SFylXJ4qAQgt3vRxEzMU+hC7SOrOXx4gAhS0m5Ch0rRyt0diyZnztq7aogWWCTMsHXCUsToceEV1JXXlfR139hA5t4CCSiQALcozoJZb2A9TKa6pPFmILHIRXasdF1PyTbpwWQIcqWdGsvpGE7OkpGRee1AXbeC82S6mxSplQi9lnpDOJ3sf2dBlqIz5zUaz+BbPTU8Sr5ld+/dJzVYKSNh1Lwl9zmyOzreRPBctfZRBcdThU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6882.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(136003)(376002)(366004)(396003)(36756003)(6506007)(6486002)(186003)(3480700007)(5660300002)(64756008)(83380400001)(66476007)(66556008)(66946007)(38100700002)(122000001)(76116006)(91956017)(86362001)(4326008)(6512007)(71200400001)(8936002)(8676002)(66446008)(478600001)(26005)(2616005)(110136005)(54906003)(7116003)(316002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eDBKOWhFNEJXNi95NVdUcllZRHNxdEJBa3RRbWk1d1V3K3FXMUNwdm5UN0FY?=
 =?utf-8?B?c1B5cytORzk4eTNheGRrWmV2dzlWdjFoTDVZMGdhWmpBVWZNaHU0Sk9zQWla?=
 =?utf-8?B?ZUtRWUpvRDkvdjA0TVlNNWVKc2RidWI1dFZkaUJOUFRrYWNNZDBYRktvc0xJ?=
 =?utf-8?B?Y3M4YndCWGh1R0RIUWlzSi9QQ2h3dG1tZXVSYTJrT0ZLUW5vOUhyckx5WGJJ?=
 =?utf-8?B?UkFTTk12ZFJxNmhGQU9TekxNWGs0K0NPcE5OSmtTeHdFcnNKVis0UGVlQmdS?=
 =?utf-8?B?VkhWeVFIODRhZDFKT09rZnU1ZU9TNTF4Q0VDWXUvMktBQ2FDYVJnRnJ4T3Zx?=
 =?utf-8?B?R2VSVEdrODJtSGt3bFkrelVxRU95M3NDdjQvKzduWGt6NzZxeG9tdEJCODVU?=
 =?utf-8?B?VXhFMmF6cE1rQVo2TEl1cFJGNjVzL1VpR01qMUVpTkhIT09EdHh1ZmRmZlor?=
 =?utf-8?B?ckVPejBKbGViZCtVV1UzMVBaNmZSQlAzSEp6OHN6dmZ2dzBsREthTXRMNGl0?=
 =?utf-8?B?QzRmakZaNHpDcEZRUUFvbHl3cCs3UWVubXBPV25tRVNPK0hsNndxMnBtbWxM?=
 =?utf-8?B?a2VTazB3a1l2Uk5UNXdkSFpkeHJHc1hiWGJ5ODRXVjE5dzl6MUtjMmx3OFJB?=
 =?utf-8?B?eTViZFBzU1o0dGZCVVVyb1RkaVFJUHFEM2pQMXdPZUkxTmUxdmJGdUJKald2?=
 =?utf-8?B?aXNUT3pQcDlYSUpVUGx6QXBuc2NzcUVZWkRvRGwzaktVQXBnWXVGWWw5Tk5C?=
 =?utf-8?B?RHlWZXVhbTB5WGU1RVpBMFk2YjBQblJBOWpML1Z1SEZad2tvUkhLSGVSVDNQ?=
 =?utf-8?B?ZmFucnU2cEZVdkxrbFFVYTBKNWhQa1FscDNZWld5Y3ZKNkR2Q0ttaTdrWWRt?=
 =?utf-8?B?NnhhbkNKUlErd2YzZ2pVaUMvWFUrMjNITmlseGlvWXhxMWlybjhDSENYem1v?=
 =?utf-8?B?TytpV2ZXNjloek1aZVhRRFByRlBnVS9adWpiZDA4cnNvcG5PU1NzYllldUNS?=
 =?utf-8?B?NWsrOGwwNEl3TGk2cHhyYStHY2FCanVaWW1ER083QTMwY0FKVWJvelprclNE?=
 =?utf-8?B?dXlpYmNiemp2aDloUnlwOW0vNmNrRSsrTzlYNmR4U3N5Y2I2WVJ2SHZ2c2Ex?=
 =?utf-8?B?OUhuQWNJazdEZnBjL1NkRTNJTG54L0VYdU01QnJ3RzQ4Y2lNR1dkNDJJMXpu?=
 =?utf-8?B?ZC9FWUlZV1h5Nzh1MEpLR1lnbEp5VXI3MmFoTmxTRXhOSUlSaWVKWVF3VzZx?=
 =?utf-8?B?L1l6L2RKM21JaERNVVJ4UW50eXp5UFE2U29RQmFhK3pwLzVESlhzU01IOFZ4?=
 =?utf-8?B?SXp3REpSeUNzSWh1aUFXMTltcjlZcnRUVEhDY1NXaHB6QVAvNUpYRG9VNkNs?=
 =?utf-8?B?SWJoY3RhNFhHbDlGSW56VGRTVG05R05LS2VIL1hiNUcrNjdiZnYrd2ZVTmJM?=
 =?utf-8?B?VC9wT1JkZE9tL28vMVF4VkRsTXdlREpvT3VYaHMzRjg3NjB1NlJ1aWoxRkcw?=
 =?utf-8?B?RmQ2MGQ2cnlHNnBVY0hFOHFDRHVOWno2L25kb1BVUU1FOTR1dGV4NGYyTGJo?=
 =?utf-8?B?NzVLV2VacURlTjF5eVIrQjd3SWppcHkzL3hJSHhaSXQrZFJ6TVFQNkJWejdr?=
 =?utf-8?B?bFI5NlVyUzM3RTFjTUp2Zy9ON1NKYkUyclViTm5QZVZOVzNaa3NoM1NHcHdV?=
 =?utf-8?B?T0lLdXdFalFycnpTWVhqdnYwUFNkWEFtczJKdS94S1U0Ti8xOHd4b09vRnJE?=
 =?utf-8?B?MmhzNnV2ZzdLOVQ5WmZQWnpETW9JZWs4K05uOE96TkNmc3l1NkVDT2dmNk9l?=
 =?utf-8?B?VmRSMTRyOVVDWWkycld5UT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <12D4C7F305A3EA4BB2A167552930291D@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6882.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092910bd-47cb-4e01-0385-08d9005da610
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 22:27:26.5944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JpolVBtbXNFAUaKxGvp2hof8+E/5QWktAfwSoaK8qHfkwHZDMFCVITPd+MAYP7190C2GbGIVO5GtmQRTKtxvkuBcrKjFxkih8ic+pvdIurY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5111
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=732514de9=Alistair.Francis@wdc.com;
 helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Thu, 15 Apr 2021 22:28:24 -0000

T24gVGh1LCAyMDIxLTA0LTE1IGF0IDE1OjQxICswMjAwLCBFbW1hbnVlbCBCbG90IHdyb3RlOg0K
PiBEYXRlOiBUdWUsIDEzIEFwciAyMDIxIDE4OjAxOjUyICswMjAwDQo+IFN1YmplY3Q6IFtQQVRD
SF0gdGFyZ2V0L3Jpc2N2OiBmaXggZXhjZXB0aW9uIGluZGV4IG9uIGluc3RydWN0aW9uDQo+IGFj
Y2VzcyBmYXVsdA0KPiANCj4gV2hlbiBubyBNTVUgaXMgdXNlZCBhbmQgdGhlIGd1ZXN0IGNvZGUg
YXR0ZW1wdHMgdG8gZmV0Y2ggYW4gaW5zdHJ1Y3Rpb24NCj4gZnJvbSBhbiBpbnZhbGlkIG1lbW9y
eSBsb2NhdGlvbiwgdGhlIGV4Y2VwdGlvbiBpbmRleCBkZWZhdWx0cyB0byBhIGRhdGENCj4gbG9h
ZCBhY2Nlc3MgZmF1bHQsIHJhdGhlciBhbiBpbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBFbW1hbnVlbCBCbG90IDxlbW1hbnVlbC5ibG90QHNpZml2ZS5jb20+
DQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBDYW4geW91IHNlbmQgdGhlIHBhdGNoIHRvIHRoZSBR
RU1VIG1haWxsaW5nIGxpc3Q/DQpxZW11LWRldmVsQG5vbmdudS5vcmcNCg0KQWxpc3RhaXINCg0K
PiANCj4gLS0tDQo+IMKgdGFyZ2V0L3Jpc2N2L2NwdV9oZWxwZXIuYyB8IDQgKysrLQ0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS90YXJnZXQvcmlzY3YvY3B1X2hlbHBlci5jIGIvdGFyZ2V0L3Jpc2N2L2NwdV9oZWxw
ZXIuYw0KPiBpbmRleCAyMWM1NGVmNTYxMy4uNGUxMDdiMWJkMjMgMTAwNjQ0DQo+IC0tLSBhL3Rh
cmdldC9yaXNjdi9jcHVfaGVscGVyLmMNCj4gKysrIGIvdGFyZ2V0L3Jpc2N2L2NwdV9oZWxwZXIu
Yw0KPiBAQCAtNjkxLDggKzY5MSwxMCBAQCB2b2lkIHJpc2N2X2NwdV9kb190cmFuc2FjdGlvbl9m
YWlsZWQoQ1BVU3RhdGUgKmNzLA0KPiBod2FkZHIgcGh5c2FkZHIsDQo+IMKgDQo+IMKgwqDCoMKg
IGlmIChhY2Nlc3NfdHlwZSA9PSBNTVVfREFUQV9TVE9SRSkgew0KPiDCoMKgwqDCoMKgwqDCoMKg
IGNzLT5leGNlcHRpb25faW5kZXggPSBSSVNDVl9FWENQX1NUT1JFX0FNT19BQ0NFU1NfRkFVTFQ7
DQo+IC3CoMKgwqAgfSBlbHNlIHsNCj4gK8KgwqDCoCB9IGVsc2UgaWYgKGFjY2Vzc190eXBlID09
IE1NVV9EQVRBX0xPQUQpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoCBjcy0+ZXhjZXB0aW9uX2luZGV4
ID0gUklTQ1ZfRVhDUF9MT0FEX0FDQ0VTU19GQVVMVDsNCj4gK8KgwqDCoCB9IGVsc2Ugew0KPiAr
wqDCoMKgwqDCoMKgwqAgY3MtPmV4Y2VwdGlvbl9pbmRleCA9IFJJU0NWX0VYQ1BfSU5TVF9BQ0NF
U1NfRkFVTFQ7DQo+IMKgwqDCoMKgIH0NCj4gwqANCj4gwqDCoMKgwqAgZW52LT5iYWRhZGRyID0g
YWRkcjsNCg0K

