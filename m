Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1klYIH-0006p9-IJ
	for mharc-qemu-riscv@gnu.org; Sat, 05 Dec 2020 09:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jackieke724@hotmail.com>)
 id 1klSd3-0005NP-EE; Sat, 05 Dec 2020 03:09:17 -0500
Received: from mail-oln040092005026.outbound.protection.outlook.com
 ([40.92.5.26]:61376 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jackieke724@hotmail.com>)
 id 1klSd0-0004jK-VM; Sat, 05 Dec 2020 03:09:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaI11sasAcXa73GeYqgFSsMbE0zroQn405fvjaW3EienacZ0KeAGyZkPllVWJqqk75oBvNx8DhugNv7jKMyIN+N600ufZAvgSxDOexiR7ZPuk/NnB7246ODlpiBu3yTC/Jcxj2E0a2MUyZZN0jPSyxM8f1rwY+6BYpkL0LM33oDzsmqQGTDeSnyz9bgqSzMrkhXHiOGG2XDyyrmU4qHL3i2eJC9nAhZl90QnBhCipk7bNnJIER975QYgWR+62jmJWdUmF7Dc+k832U3fCBoc28eoWd3BEvXLln37RD4dtoGmiwP3Zvr/txtoBbV2jsfei32sb0BsJfkQwU08CBL2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaG5Mac8DTSLlyyVekZdPqosY4Ae2p0IHk8cwYIDDJ0=;
 b=V3pY4f1stmAJNPh1BVtCNjxW6/wVj+HpN6QEXpfDvohgMWBp/U9QCuHP4gnr7+/PfE4SfKU5nd9ABTU4ASFIj+guodSy6Waqm0/hBUih3IXP2+EBVKCi+G3+fuy8kcmfW0tyLdJflEncV123G89IXVuIlPy6v0XcaKC0UGecxFwWREhIFGUzxadBeOEnmjaoXS3bPKCkEepwu3/hcl4sGcvKk7c1J8Y0CT96BbDo+Gns+zyLvuc/mZr6Nk7TymmYHpkbJHL3RjLQmn6BpTufgFxHwyXWjGS5a0qzoXuy9ERcfn5NPq/E/ufnVCoVb7aGCfDKZQfA1knsudxciCgViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaG5Mac8DTSLlyyVekZdPqosY4Ae2p0IHk8cwYIDDJ0=;
 b=StLRNVRBNvhmzGw2bC3rzcXcHHYPhtxlJtG78Q/0A8W4UemztF7G97G55xV3eVFEB/qqItfiLJWglID8Z5KlWQCXu4pd3mxqa9ov50RNqU99PyIY81WNXs+3sJTvXl+CCZw7VSR/pnFqSVOC1IQHjTSWlB1df0B5wvWkC84IXAUab1Wn9qeGjqRp6Wy3Cy09LOu24c0+OrmqLItjQ3U7uFxW7zdzeO8KmGbuwqtcMZS95/xlORqq9NzkchwIjDANFMnw5rFwmDXPwHIrRaJy4yQ6iY0CqBpuOiusjWEwmDf3VHWnHR/4g9mKEaMVd51QaWJj4MF8Qh2wjzAEzH1nxA==
Received: from CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (10.152.74.52) by CY1NAM02HT197.eop-nam02.prod.protection.outlook.com
 (10.152.75.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Sat, 5 Dec
 2020 08:09:11 +0000
Received: from SN6PR02MB4751.namprd02.prod.outlook.com
 (2a01:111:e400:7e45::45) by CY1NAM02FT053.mail.protection.outlook.com
 (2a01:111:e400:7e45::165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21 via Frontend
 Transport; Sat, 5 Dec 2020 08:09:11 +0000
Received: from SN6PR02MB4751.namprd02.prod.outlook.com
 ([fe80::583d:7dc9:3fd2:abde]) by SN6PR02MB4751.namprd02.prod.outlook.com
 ([fe80::583d:7dc9:3fd2:abde%5]) with mapi id 15.20.3632.021; Sat, 5 Dec 2020
 08:09:11 +0000
From: Jackie Ke <jackieke724@hotmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
 <qemu-riscv@nongnu.org>, "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "alistair23@gmail.com"
 <alistair23@gmail.com>
Subject: Re: [PATCH v1 1/1] intc/ibex_plic: Clear interrupts that occur during
 claim process
Thread-Topic: [PATCH v1 1/1] intc/ibex_plic: Clear interrupts that occur
 during claim process
Thread-Index: AQHWyl0tnl9f08Dym06eYA+KkR/Bg6noJxS0
Date: Sat, 5 Dec 2020 08:09:11 +0000
Message-ID: <SN6PR02MB4751BE3EE25598B54D448336FFF00@SN6PR02MB4751.namprd02.prod.outlook.com>
References: <4e9786084a86f220689123cc8a7837af8fa071cf.1607100423.git.alistair.francis@wdc.com>
In-Reply-To: <4e9786084a86f220689123cc8a7837af8fa071cf.1607100423.git.alistair.francis@wdc.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:3AD57943BB7C5E7063FA22B6AC1F538199C74C20DA1E3DBDFB3B270EA948019C;
 UpperCasedChecksum:7F4A931543A3DC724B760F0AB485EA23C3DEDF12540DC646B184251A065918C5;
 SizeAsReceived:7213; Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [CziUQ5YKWqPkCZL2Kz2fRaR5u4Tg98/5]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: e8458e04-d6e7-4419-d829-08d898f50c4d
x-ms-traffictypediagnostic: CY1NAM02HT197:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: suUYLPD3s1TU4ZT5MwrOoWDRiwzc0E/Cv1bSCjiEK9a+uAUNmFVBCzKL2yMOY/YOIL9DedDBr9fPgEI9ChKQgR1iQ9y1XEdr4Ry5zGhUWkQ1s5ka/IrO53tbIgL9wJ+aAjJyfiqbW064XdLa1ig71bfrjvd4R/jQUISUDxvvTyPjVBuGPoIJmG7nwtSPocRBvhpJKwy+2GpuO/aONIs69g==
x-ms-exchange-antispam-messagedata: Qhlzqemten6/6fmqx5eYzR7mrwrkk2f9N5c2P+x4nOcoO11OCCXs8q2vYlgpR3HoBEL2T47hfs7UUXpcB15E7m9vnccsCO2AeKtZO6k6/aqzJDCoSQ9S900LuPDbdz7ZlO15kgfQFxvadOUUhi9rew==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e8458e04-d6e7-4419-d829-08d898f50c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2020 08:09:11.2213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT197
Received-SPF: pass client-ip=40.92.5.26; envelope-from=jackieke724@hotmail.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 05 Dec 2020 09:12:11 -0500
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
X-List-Received-Date: Sat, 05 Dec 2020 08:09:17 -0000

VGVzdGVkLWJ5OiBKYWNraWUgS2UgPGphY2tpZWtlNzI0QGhvdG1haWwuY29tPg0KDQoNCkJlc3Qg
UmVnYXJkcywNCkphY2tpZSBLZQ0KDQo+IE9uIERlYyA1LCAyMDIwLCBhdCAxMjo0NyBBTSwgQWxp
c3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPiB3cm90ZToNCj4gDQo+IO+7
v1ByZXZpb3VzbHkgaWYgYW4gaW50ZXJydXB0IG9jY3VyZWQgZHVyaW5nIHRoZSBjbGFpbSBwcm9j
ZXNzIChhZnRlciB0aGUNCj4gaW50ZXJydXB0IGlzIGNsYWltZWQgYnV0IGJlZm9yZSBpdCdzIGNv
bXBsZXRlZCkgaXQgd291bGQgbmV2ZXIgYmUNCj4gY2xlYXJlZC4NCj4gVGhpcyBwYXRjaCBlbnN1
cmVzIHRoYXQgd2UgYWxzbyBjbGVhciB0aGUgaGlkZGVuX3BlbmRpbmcgYml0cyBhcyB3ZWxsLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3
ZGMuY29tPg0KPiAtLS0NCj4gaHcvaW50Yy9pYmV4X3BsaWMuYyB8IDEzICsrKysrKysrKystLS0N
Cj4gMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvaHcvaW50Yy9pYmV4X3BsaWMuYyBiL2h3L2ludGMvaWJleF9wbGljLmMN
Cj4gaW5kZXggMzQxYzlkYjQwNS4uYzFiNzJmY2FiMCAxMDA2NDQNCj4gLS0tIGEvaHcvaW50Yy9p
YmV4X3BsaWMuYw0KPiArKysgYi9ody9pbnRjL2liZXhfcGxpYy5jDQo+IEBAIC00MywxNiArNDMs
MjMgQEAgc3RhdGljIHZvaWQgaWJleF9wbGljX2lycXNfc2V0X3BlbmRpbmcoSWJleFBsaWNTdGF0
ZSAqcywgaW50IGlycSwgYm9vbCBsZXZlbCkNCj4gew0KPiAgICAgaW50IHBlbmRpbmdfbnVtID0g
aXJxIC8gMzI7DQo+IA0KPiArICAgIGlmICghbGV2ZWwpIHsNCj4gKyAgICAgICAgLyoNCj4gKyAg
ICAgICAgICogSWYgdGhlIGxldmVsIGlzIGxvdyBtYWtlIHN1cmUgd2UgY2xlYXIgdGhlIGhpZGRl
bl9wZW5kaW5nLg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAgcy0+aGlkZGVuX3BlbmRpbmdb
cGVuZGluZ19udW1dICY9IH4oMSA8PCAoaXJxICUgMzIpKTsNCj4gKyAgICB9DQo+ICsNCj4gICAg
IGlmIChzLT5jbGFpbWVkW3BlbmRpbmdfbnVtXSAmIDEgPDwgKGlycSAlIDMyKSkgew0KPiAgICAg
ICAgIC8qDQo+ICAgICAgICAgICogVGhlIGludGVycnVwdCBoYXMgYmVlbiBjbGFpbWVkLCBidXQg
bm90IGNvbXBsZXRlZC4NCj4gICAgICAgICAgKiBUaGUgcGVuZGluZyBiaXQgY2FuJ3QgYmUgc2V0
Lg0KPiArICAgICAgICAgKiBTYXZlIHRoZSBwZW5kaW5nIGxldmVsIGZvciBhZnRlciB0aGUgaW50
ZXJydXB0IGlzIGNvbXBsZXRlZC4NCj4gICAgICAgICAgKi8NCj4gICAgICAgICBzLT5oaWRkZW5f
cGVuZGluZ1twZW5kaW5nX251bV0gfD0gbGV2ZWwgPDwgKGlycSAlIDMyKTsNCj4gLSAgICAgICAg
cmV0dXJuOw0KPiArICAgIH0gZWxzZSB7DQo+ICsgICAgICAgIHMtPnBlbmRpbmdbcGVuZGluZ19u
dW1dIHw9IGxldmVsIDw8IChpcnEgJSAzMik7DQo+ICAgICB9DQo+IC0NCj4gLSAgICBzLT5wZW5k
aW5nW3BlbmRpbmdfbnVtXSB8PSBsZXZlbCA8PCAoaXJxICUgMzIpOw0KPiB9DQo+IA0KPiBzdGF0
aWMgYm9vbCBpYmV4X3BsaWNfaXJxc19wZW5kaW5nKEliZXhQbGljU3RhdGUgKnMsIHVpbnQzMl90
IGNvbnRleHQpDQo+IC0tIA0KPiAyLjI5LjINCj4gDQo=

