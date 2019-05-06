Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNjfF-0000Hq-1w
	for mharc-qemu-riscv@gnu.org; Mon, 06 May 2019 15:52:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=0220d2d68=Alistair.Francis@wdc.com>)
	id 1hNjfC-0000FS-DO
	for qemu-riscv@nongnu.org; Mon, 06 May 2019 15:52:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=0220d2d68=Alistair.Francis@wdc.com>)
	id 1hNjfB-0006LV-Dp
	for qemu-riscv@nongnu.org; Mon, 06 May 2019 15:52:38 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:33502)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=0220d2d68=Alistair.Francis@wdc.com>)
	id 1hNjfA-0006Kb-Kn
	for qemu-riscv@nongnu.org; Mon, 06 May 2019 15:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1557172357; x=1588708357;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=PHSmuwjcqqnFGPFAzetDH3d5EHtAN4if0aYXUrUhB3o=;
	b=R0mHfRCIDFBSHiQNpH82TufPCfVTRx+tv9em5EhhFy3uaDFIJYwtxEdA
	jAQ31V3ycFdm0UcqQGYkMJsFTW59MhfVlG6Rue1X7KDsIe/+0HL9/46ex
	AQMpMs+xSG35rK/X3qYwAm0RcbuCX7JDgTIu7s/epNSuCh98qomlSmGMr
	kH+pp1/3i9LTomypIuLF8HJINDteZIyyxWiNpyeZ1vcdlKHv8Q9zix5Na
	yCQTU2mEZGEfTjvYhRvOTh7d3YtV1VNKasSWTaBpdhAQ+oUK/sVznmYn5
	FTpyMno4IUpP2teLi7/mV3wjCe7/Z9gGNqJzpyzTaTavd+pF81qlCzLzp w==;
X-IronPort-AV: E=Sophos;i="5.60,439,1549900800"; d="scan'208";a="109352865"
Received: from mail-dm3nam03lp2052.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.52])
	by ob1.hgst.iphmx.com with ESMTP; 07 May 2019 03:52:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PHSmuwjcqqnFGPFAzetDH3d5EHtAN4if0aYXUrUhB3o=;
	b=QSoqUlHfqfHcURc1ranqN2hQzFe8Y8lvc+iQe858WS350Q714tvETNBpFpR49evCZImlEE59HYMOclzgla87L3z1db1RPjqy2k1lcQIUbDYFSqB7KuvX0bpo5Q9pVdVwRWXEyqLuA7WUaG0K6qo1Z0sYOnSag3TX/IcQQHKIA8c=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4728.namprd04.prod.outlook.com (52.135.240.31) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1856.12; Mon, 6 May 2019 19:52:32 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::4d89:bbf8:952c:3d66]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::4d89:bbf8:952c:3d66%5]) with mapi id 15.20.1856.012;
	Mon, 6 May 2019 19:52:32 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "merker@debian.org" <merker@debian.org>
CC: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>, "palmer@sifive.com"
	<palmer@sifive.com>, "vagrant@debian.org" <vagrant@debian.org>
Thread-Topic: RISC-V: qemu should provide different "model" strings in DT for
	RV64 and RV32
Thread-Index: AQHVA4YM+/7LBHEmO0e4RFtEFlj326ZeKkoAgABIrYCAABAFgA==
Date: Mon, 6 May 2019 19:52:32 +0000
Message-ID: <8613364866adfb29aa32159f57448e3b8e0df734.camel@wdc.com>
References: <20190505210343.edgohqdc5vxvjepo@excalibur.cnev.de>
	<4e4866ac8d3952c2169edb47c72c4f88360d2a4a.camel@wdc.com>
	<20190506185335.urpkdoiwaugvd6kx@excalibur.cnev.de>
In-Reply-To: <20190506185335.urpkdoiwaugvd6kx@excalibur.cnev.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51fc79c8-a945-4e0d-2f9c-08d6d25c6110
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4728; 
x-ms-traffictypediagnostic: BYAPR04MB4728:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4728378CB3E113F2DFE1AD9A90300@BYAPR04MB4728.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(366004)(396003)(136003)(346002)(189003)(199004)(446003)(14454004)(72206003)(11346002)(478600001)(99286004)(6246003)(26005)(186003)(6506007)(6486002)(6916009)(256004)(6512007)(5640700003)(71200400001)(71190400001)(305945005)(5660300002)(6436002)(229853002)(86362001)(2906002)(6116002)(68736007)(3846002)(66066001)(118296001)(2351001)(102836004)(73956011)(66946007)(54906003)(66476007)(66556008)(76116006)(2616005)(64756008)(66446008)(76176011)(476003)(486006)(36756003)(2501003)(53936002)(7736002)(316002)(8936002)(4326008)(25786009)(1730700003)(81156014)(81166006)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4728;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WM+Ylhxzm+gbKdGkBwoAAm2j93n8QGcmOORblbik0oC8JAIXvSDvEtpXfnwmpe5I452tEaMnEZFM4MzmG+ZkBSPXv8eTBL/JPn2AL6xk5/NJ3I02ZiWcJRiCZuxAilvEkRy5Z9ujLKJYMkH+nx5DGSO33a2g/A4mRY5ZM1xX5DEzi1xwy66y8KtEKSaVJH99QCeSo+GCbfeB2AFVa/3M1oK3NIyNOVtTuSlob0WW4rKrW6693i+r9ChEmkngjjZ7OyBFpciyGvjVDK45RKdVn2FbnH6Uss6JFGWFtS9igi1trgVaSR1v2mrfbE+xRGXyQ7LbbkMAwoVOjVipzpb5V5b0XbW5NdoGHlbyPkb/td6HVstto4/wrQhpShykiw0Roxvg4BQCIEwp8lVboaEjtFO+WMjEd8We5r2BgQBztPg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EC8EE80F7FF5E4694C9210E551506E4@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fc79c8-a945-4e0d-2f9c-08d6d25c6110
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 19:52:32.5017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4728
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
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
X-List-Received-Date: Mon, 06 May 2019 19:52:39 -0000

T24gTW9uLCAyMDE5LTA1LTA2IGF0IDIwOjUzICswMjAwLCBLYXJzdGVuIE1lcmtlciB3cm90ZToN
Cj4gT24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDI6MzM6MjlQTSArMDAwMCwgQWxpc3RhaXIgRnJh
bmNpcyB3cm90ZToNCj4gPiBPbiBTdW4sIDIwMTktMDUtMDUgYXQgMjM6MDMgKzAyMDAsIEthcnN0
ZW4gTWVya2VyIHdyb3RlOg0KPiA+ID4gSGVsbG8sDQo+ID4gPiANCj4gPiA+IHdoaWxlIHdvcmtp
bmcgb24gUklTQy1WIHN1cHBvcnQgZm9yIHRoZSBEZWJpYW4gZmxhc2gta2VybmVsIHBhY2thDQo+
ID4gPiANCj4gPiA+IEkgaGF2ZSBzdHVtYmxlZCBvdmVyIGEgcG90ZW50aWFsIHByb2JsZW0gd2l0
aCB0aGUgIm1vZGVsIiBzdHJpbmcNCj4gPiA+IHRoYXQgcWVtdSBzZXRzIGluIHRoZSBEVCB0aGF0
IGl0IGdlbmVyYXRlcyBmb3IgdGhlICJ2aXJ0Ig0KPiA+ID4gbWFjaGluZSwNCj4gPiA+IG5hbWVs
eSAicmlzY3YtdmlydGlvLHFlbXUiLg0KPiA+ID4gDQo+ID4gPiBTb21lIHRvb2xzLCBhbW9uZyB0
aGVtIGZsYXNoLWtlcm5lbCwgdXNlIHRoZSAibW9kZWwiIHN0cmluZyB0bw0KPiA+ID4gZGV0ZXJt
aW5lIG9uIHdoaWNoIHNwZWNpZmljIHR5cGUgb2YgaGFyZHdhcmUgdGhleSBhcmUgcnVubmluZyBh
bmQNCj4gPiA+IHBlcmZvcm0gY29ycmVzcG9uZGluZyBoYXJkd2FyZS1zcGVjaWZpYyBhY3Rpb25z
LiAgSXQgbG9va3MgbGlrZQ0KPiA+ID4gcWVtdSB1c2VzIHRoZSBzYW1lIG1vZGVsIHN0cmluZyBm
b3IgYm90aCBSVjY0IGFuZCBSVjMyLCB3aGljaA0KPiA+ID4gbWFrZXMgaXQgaW1wb3NzaWJsZSB0
byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlIHR3by4gSSB3b3VsZA0KPiA+ID4gdGhlcmVmb3Jl
IGxpa2UgdG8gcHJvcG9zZSB0byBtYWtlIHRoZSBtb2RlbC1zdHJpbmcNCj4gPiA+IFhMRU4tZGVw
ZW5kZW50LCBpLmUuICJyaXNjdjY0LXZpcnRpbyxxZW11IiByZXNwZWN0aXZlbHkNCj4gPiA+ICJy
aXNjdjMyLXZpcnRpbyxxZW11Ii4NCj4gPiANCj4gPiBUaGlzIHNvdW5kcyBmaW5lIHRvIG1lLg0K
PiA+IA0KPiA+IElzIHRoZXJlIGFueXRoaW5nIHRoYXQgYWxyZWFkeSByZWxpZXMgb24gdGhlDQo+
ID4gInJpc2N2LXZpcnRpbyxxZW11IiBjb21wYXQgc3RyaW5nPw0KPiANCj4gQXQgbGVhc3Qgbm90
aGluZyB0aGF0IEkgYW0gYXdhcmUgb2YuDQo+IA0KPiA+IE1heWJlIHdlIGNhbiBrZWVwIHRoYXQg
YW5kIGFkZCBhIDMyLzY0IGJpdCBvbmUgc28gd2UgZG9uJ3QNCj4gPiBicmVhayBhbnl0aGluZyB0
aGF0IGlzIGFscmVhZHkgd29ya2luZy4NCj4gDQo+IEFGQUlDUyB0aGlzIGlzbid0IHBvc3NpYmxl
IGFzIGFjY29yZGluZyB0byB0aGUgZGV2aWNlLXRyZWUNCj4gc3BlY2lmaWNhdGlvbiB0aGUgIm1v
ZGVsIiBwcm9wZXJ0eSBpbiBEVCBjYW4gb25seSBoYXZlIGEgc2luZ2xlDQo+IHZhbHVlOg0KPiAN
Cj4gICBQcm9wZXJ0eSBuYW1lOiBtb2RlbA0KPiAgIFZhbHVlIHR5cGU6IDxzdHJpbmc+DQo+IA0K
PiBUbyBhbGxvdyBmb3IgbXVsdGlwbGUgdmFsdWVzIHRoYXQgd291bGQgaGF2ZSB0byBiZQ0KPiAN
Cj4gICBWYWx1ZSB0eXBlOiA8c3RyaW5nbGlzdD4NCg0KQWgsIG5vIHdvcnJpZXMuIEkgdGhpbmsg
aXQncyB3b3J0aCBzZW5kaW5nIHRoZSBwYXRjaC4gVGhlIDQuMQ0KZGV2ZWxvcG1lbnQgY3ljbGUg
aGFzIGp1c3Qgb3BlbmVkIHNvIG5vdyBzZWVtcyBsaWtlIGEgZ29vZCB0aW1lIHRvIHNlbmQNCml0
LiBXZSBjYW4gdGhlbiB0ZXN0IHRvIG1ha2Ugc3VyZSBub3RoaW5nIGlzIGJyb2tlbiBiZWZvcmUg
dGhlIG5leHQNCnJlbGVhc2UuDQoNCkFsaXN0YWlyDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEthcnN0
ZW4NCg==

