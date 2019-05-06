Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNegY-0003AN-VE
	for mharc-qemu-riscv@gnu.org; Mon, 06 May 2019 10:33:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=0220d2d68=Alistair.Francis@wdc.com>)
	id 1hNegW-00038k-PB
	for qemu-riscv@nongnu.org; Mon, 06 May 2019 10:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=0220d2d68=Alistair.Francis@wdc.com>)
	id 1hNegV-0003fW-Ly
	for qemu-riscv@nongnu.org; Mon, 06 May 2019 10:33:40 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:18640)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=0220d2d68=Alistair.Francis@wdc.com>)
	id 1hNegU-0003c4-Hs
	for qemu-riscv@nongnu.org; Mon, 06 May 2019 10:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1557153226; x=1588689226;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=N8uVXPErakJA/t3HgsJ+U0pXhjIWCs6mrhj94xIKZ1Y=;
	b=b78iZ5G3I6wZIn1fOdVNUN/WF7TdlmQw7fUHL3KasuifWiaLavU2Z3xp
	bZRzMVbg95Qbihhc+8F5ulsAPPqb61vMhBWK4Z9UKyMVdMClFy3LEGfGy
	SGjoH7gJ+GjBNPCb/sEmKJmISq2KBs18WPvW7XsQjQvtgvTBlmbBf9LCx
	eUTeKponmrWTA+nCMjt1ivZK9If1dZC3M4d/FUMnWeXXwxGbctjOWKoa0
	4MiBn+3U4V+RGP0WubTmKjknRkpNmgp0QZNbA9vAQTY5agu7KAqjRtgfz
	PG79UL0sNCl1WtH4Lv99ZImSansCC/+dRsXJN3et3q6535kDnSY43yPeO w==;
X-IronPort-AV: E=Sophos;i="5.60,438,1549900800"; d="scan'208";a="206887599"
Received: from mail-dm3nam05lp2052.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.52])
	by ob1.hgst.iphmx.com with ESMTP; 06 May 2019 22:33:37 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=N8uVXPErakJA/t3HgsJ+U0pXhjIWCs6mrhj94xIKZ1Y=;
	b=CdLZgMUy177WMgVhCpjACzKDxaXt/zvvgKFchGBJKc5ql9nhLVAy7UoMOi0w1Kb0lWsAUa2nDL59kmJ28ZEUfdOWcGyjkM4wMJJHryGdLJgIIa3GeULWlw5ZEP2MKkgxvPbJXXgKH6rpoLpvcK9KifWQlWh9D9VmfnUWBWcL16U=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4677.namprd04.prod.outlook.com (52.135.240.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1856.12; Mon, 6 May 2019 14:33:29 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::4d89:bbf8:952c:3d66]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::4d89:bbf8:952c:3d66%5]) with mapi id 15.20.1856.012;
	Mon, 6 May 2019 14:33:29 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>, "palmer@sifive.com"
	<palmer@sifive.com>, "merker@debian.org" <merker@debian.org>
CC: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "vagrant@debian.org"
	<vagrant@debian.org>
Thread-Topic: RISC-V: qemu should provide different "model" strings in DT for
	RV64 and RV32
Thread-Index: AQHVA4YM+/7LBHEmO0e4RFtEFlj326ZeKkoA
Date: Mon, 6 May 2019 14:33:29 +0000
Message-ID: <4e4866ac8d3952c2169edb47c72c4f88360d2a4a.camel@wdc.com>
References: <20190505210343.edgohqdc5vxvjepo@excalibur.cnev.de>
In-Reply-To: <20190505210343.edgohqdc5vxvjepo@excalibur.cnev.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [2601:646:8e00:37b2:d3fd:11e9:7cc1:adaf]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6b3c9ca-2b71-42f2-fe58-08d6d22fcf04
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4677; 
x-ms-traffictypediagnostic: BYAPR04MB4677:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB46774626334AC29486506B1990300@BYAPR04MB4677.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(346002)(366004)(376002)(39860400002)(189003)(199004)(66946007)(54906003)(118296001)(2906002)(73956011)(5660300002)(256004)(6506007)(102836004)(316002)(486006)(46003)(71200400001)(71190400001)(478600001)(2171002)(99286004)(6246003)(76176011)(53936002)(72206003)(14454004)(6512007)(6116002)(25786009)(2501003)(476003)(2616005)(68736007)(8936002)(8676002)(81156014)(81166006)(76116006)(66446008)(64756008)(66556008)(66476007)(446003)(11346002)(110136005)(2201001)(229853002)(4326008)(36756003)(7736002)(305945005)(6436002)(86362001)(186003)(6486002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4677;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u3pCqaCpqxpbaCN/N1UFkKkAdFcFx59cO1dYt6sYv6R4JfSzRsJiHFhLXQbyUhEzYyKFgoiIDvZ6bRLkJ4WNR9ThK2/6C05wuhNOwwKbbxMQxUbSMxEwXDJmQohBdOh1Ew923Q6aFfznXl6RtPvhCOk5XPrplqAwDCI32UjAEFMDqyqZjww1zpUrHZjlsWwI5IgnX2aGFt3eAoMsz/9uCyvqT/EohjElKloR/h9shqoPPEccYcngyFMPj7q1kbOKTyUzt3gw+7bQesqhjOnftgmeov6kEFCbCFZH34Cj1q61Bpu8P3JNz3tmz8G5awaElKbEi/5fbeEErMQCF2V+6qP8R0fVLYD5xlBoYiiIJhnTbmV4/pAlLARwAe/P/iwzrklX50ZB2t9jDjl6FMjo50ugn8CkJe6xJnuc+YaRVa8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE3E0D797F1B584794DA49A0979099E9@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b3c9ca-2b71-42f2-fe58-08d6d22fcf04
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 14:33:29.5849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4677
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: Re: [Qemu-riscv] RISC-V: qemu should provide different "model"
 strings in DT for RV64 and RV32
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2019 14:33:41 -0000

T24gU3VuLCAyMDE5LTA1LTA1IGF0IDIzOjAzICswMjAwLCBLYXJzdGVuIE1lcmtlciB3cm90ZToN
Cj4gSGVsbG8sDQo+IA0KPiB3aGlsZSB3b3JraW5nIG9uIFJJU0MtViBzdXBwb3J0IGZvciB0aGUg
RGViaWFuIGZsYXNoLWtlcm5lbCBwYWNrYWdlDQo+IEkgaGF2ZSBzdHVtYmxlZCBvdmVyIGEgcG90
ZW50aWFsIHByb2JsZW0gd2l0aCB0aGUgIm1vZGVsIiBzdHJpbmcNCj4gdGhhdCBxZW11IHNldHMg
aW4gdGhlIERUIHRoYXQgaXQgZ2VuZXJhdGVzIGZvciB0aGUgInZpcnQiIG1hY2hpbmUsDQo+IG5h
bWVseSAicmlzY3YtdmlydGlvLHFlbXUiLg0KPiANCj4gU29tZSB0b29scywgYW1vbmcgdGhlbSBm
bGFzaC1rZXJuZWwsIHVzZSB0aGUgIm1vZGVsIiBzdHJpbmcgdG8NCj4gZGV0ZXJtaW5lIG9uIHdo
aWNoIHNwZWNpZmljIHR5cGUgb2YgaGFyZHdhcmUgdGhleSBhcmUgcnVubmluZyBhbmQNCj4gcGVy
Zm9ybSBjb3JyZXNwb25kaW5nIGhhcmR3YXJlLXNwZWNpZmljIGFjdGlvbnMuICBJdCBsb29rcyBs
aWtlDQo+IHFlbXUgdXNlcyB0aGUgc2FtZSBtb2RlbCBzdHJpbmcgZm9yIGJvdGggUlY2NCBhbmQg
UlYzMiwgd2hpY2gNCj4gbWFrZXMgaXQgaW1wb3NzaWJsZSB0byBkaWZmZXJlbnRpYXRlIGJldHdl
ZW4gdGhlIHR3by4gSSB3b3VsZA0KPiB0aGVyZWZvcmUgbGlrZSB0byBwcm9wb3NlIHRvIG1ha2Ug
dGhlIG1vZGVsLXN0cmluZw0KPiBYTEVOLWRlcGVuZGVudCwgaS5lLiAicmlzY3Y2NC12aXJ0aW8s
cWVtdSIgcmVzcGVjdGl2ZWx5DQo+ICJyaXNjdjMyLXZpcnRpbyxxZW11Ii4NCg0KVGhpcyBzb3Vu
ZHMgZmluZSB0byBtZS4NCg0KSXMgdGhlcmUgYW55dGhpbmcgdGhhdCBhbHJlYWR5IHJlbGllcyBv
biB0aGUgInJpc2N2LXZpcnRpbyxxZW11IiBjb21wYXQNCnN0cmluZz8gTWF5YmUgd2UgY2FuIGtl
ZXAgdGhhdCBhbmQgYWRkIGEgMzIvNjQgYml0IG9uZSBzbyB3ZSBkb24ndA0KYnJlYWsgYW55dGhp
bmcgdGhhdCBpcyBhbHJlYWR5IHdvcmtpbmcuDQoNCkFsaXN0YWlyDQoNCj4gDQo+IFJlZ2FyZHMs
DQo+IEthcnN0ZW4NCg==

