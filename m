Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC71w-0002IS-2h
	for mharc-qemu-riscv@gnu.org; Thu, 04 Apr 2019 14:24:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=990829437=Alistair.Francis@wdc.com>)
	id 1hC71r-00022r-Ag
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 14:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=990829437=Alistair.Francis@wdc.com>)
	id 1hC6td-0007fO-EE
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 14:15:30 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28835)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=990829437=Alistair.Francis@wdc.com>)
	id 1hC6tb-0007ZM-LS; Thu, 04 Apr 2019 14:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554401728; x=1585937728;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=79pbO0GbeBAVTnws1xxyh7pFWGBGiUs30qislFg0vv4=;
	b=qwUuTXTrBaBc5I0wk/WjA1q9VWNmsk8h69zeJ1zWwy1VCoPydqeePXvD
	9HGSLLeKQEjZZkOfksFdtd48xpEfZAtMCTZ2n0tudTJ+9+e+KLwTuq+7q
	XIKtGmd6+WLdhTjdvyaMmKdUnmNgrWQVB0BcUso1ROsPxLOUaFVy6+0vd
	fqzjk5Nq5ketGZGkytDsBYCvTMzuJP0fDgSkvnEsW9/+lqcB6oauJnZ6T
	0ikLWdkTHSw4xQNnNYoxYTG5/vxRbxHV1x5K88oauz73nmhdNmt32N2+H
	Mi8uV8rhT2uYSez4CSgHRbdeC0pyTKnLSihwoZ2hw3bmO/jsWxfGwNZn7 w==;
X-IronPort-AV: E=Sophos;i="5.60,309,1549900800"; d="scan'208";a="106375608"
Received: from mail-cys01nam02lp2059.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.59])
	by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2019 02:15:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=79pbO0GbeBAVTnws1xxyh7pFWGBGiUs30qislFg0vv4=;
	b=mzn6DW5lIJHFUI9/44PNMH5zzIq6Atf/0H8fVNfOqNPejJ+NGcVR+I6/r310RwbIYfznF18wzGkRI9T6Wz0eUUrlDJRrTS0RuvQW/cjnn2LdTOzwkuxempOH0pIBPnz2Sf7IGaYXR6r/4v+M60xj949uP9/JiyuaupgfrAC1r9s=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5653.namprd04.prod.outlook.com (20.179.56.211) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.16; Thu, 4 Apr 2019 18:15:23 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Thu, 4 Apr 2019 18:15:23 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v3 1/2] riscv: plic: Fix incorrect irq calculation
Thread-Index: AQHU6xJeGL9ISzjuS0aO7FKdCXPRVg==
Date: Thu, 4 Apr 2019 18:15:23 +0000
Message-ID: <6f18d167026f523a6dbfc74699abec62598f7c0b.1554401615.git.alistair.francis@wdc.com>
References: <cover.1554401615.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1554401615.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR21CA0012.namprd21.prod.outlook.com
	(2603:10b6:a03:114::22) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e8f4ff7-93d1-4e82-117a-08d6b929813b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5653; 
x-ms-traffictypediagnostic: BYAPR04MB5653:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB56531FE4C6295CDDF336546590500@BYAPR04MB5653.namprd04.prod.outlook.com>
x-forefront-prvs: 0997523C40
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(366004)(346002)(376002)(39860400002)(189003)(199004)(5660300002)(6486002)(3846002)(6116002)(68736007)(50226002)(6436002)(2906002)(118296001)(316002)(54906003)(2616005)(110136005)(36756003)(8936002)(11346002)(446003)(486006)(476003)(14444005)(44832011)(256004)(305945005)(7736002)(105586002)(478600001)(106356001)(66066001)(25786009)(72206003)(8676002)(81166006)(81156014)(71200400001)(71190400001)(2501003)(97736004)(6506007)(102836004)(386003)(6512007)(52116002)(14454004)(53936002)(99286004)(76176011)(186003)(4326008)(86362001)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5653;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fsc23pLel3svtZvqbe7zLQReh8k6OOwl4gqB8f9BDY+CCNBOZ2R9NqPA6IbQ6F55ddSQvjCNNjX+ZQqw82nUZ7MhXseiXFMnGcITOBOrHPWj8M4czG4BD+0oXEuIvzQsvBCsO+ve80G92lOaGKxJV+Y7NIySBUWTlXzRniHg3rqy6/xVjEn2cZ0ULKTVRb0xTkSFOQ1dgxNcL9hkSmJkmmayzTw9fxtbP3awRqyZKDrj1IFmnZ5mMLIqg1nlepJE/Mjn8E9EontlGelBjjscdXk+8Frb2/d/FeYbJfl50HeWE9e0aI97k2L49+g7jSXcaKoGoexg7nBG7AIjOz+pU+iEfISruZmp4rBLo5mo1tXYOHQ455ctmfAZMidQaeFlKgVQvU4zn7Vri/mPvQqhBrP1ExMvgImZhN/oiunuoes=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8f4ff7-93d1-4e82-117a-08d6b929813b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2019 18:15:23.4414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5653
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH for 4.0 v3 1/2] riscv: plic: Fix incorrect irq
 calculation
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
X-List-Received-Date: Thu, 04 Apr 2019 18:24:00 -0000

VGhpcyBwYXRjaCBmaXhlcyBmb3VyIGRpZmZlcmVudCB0aGluZ3MsIHRvIG1haW50YWluIGJpc2Vj
dGFiaWxpdHkgdGhleQ0KaGF2ZSBiZWVuIG1lcmdlZCBpbnRvIGEgc2luZ2xlIHBhdGNoLiBUaGUg
Zm9sbG93aW5nIGZpeGVzIGFyZSBiZWxvdzoNCg0Kc2lmaXZlX3BsaWM6IEZpeCBpbmNvcnJlY3Qg
aXJxIGNhbGN1bGF0aW9uDQpUaGUgaXJxIGlzIGluY29ycmVjdGx5IGNhbGN1bGF0ZWQgdG8gYmUg
b2ZmIGJ5IG9uZS4gSXQgaGFzIHdvcmtlZCBpbiB0aGUNCnBhc3QgYXMgdGhlIHByaW9yaXR5X2Jh
c2Ugb2Zmc2V0IGhhcyBhbHNvIGJlZW4gc2V0IGluY29ycmVjdGx5LiBXZSBhcmUNCmFib3V0IHRv
IGZpeCB0aGUgcHJpb3JpdHlfYmFzZSBvZmZzZXQgc28gZmlyc3QgZmlyc3QgdGhlIGlycQ0KY2Fs
Y3VsYXRpb24uDQoNCnNpZml2ZV91OiBGaXggUExJQyBwcmlvcml0eSBiYXNlIG9mZnNldCBhbmQg
bnVtYmVyaW5nDQpBY2NvcmRpbmcgdG8gdGhlIEZVNTQwIG1hbnVhbCB0aGUgUExJQyBzb3VyY2Ug
cHJpb3JpdHkgYWRkcmVzcyBzdGFydHMgYXQNCmFuIG9mZnNldCBvZiAweDA0IGFuZCBub3QgMHgw
MC4gVGhlIHNhbWUgbWFudWFsIGFsc28gc3BlY2lmaWVzIHRoYXQgdGhlDQpQTElDIG9ubHkgaGFz
IDUzIHNvdXJjZSBwcmlvcml0aWVzLiBGaXggdGhlc2UgdHdvIGluY29ycmVjdCBoZWFkZXINCmZp
bGVzLg0KDQpXZSBhbHNvIG5lZWQgdG8gb3ZlciBleHRlbmQgdGhlIHBsaWNfZ3Bpb3NbXSBhcnJh
eSBhcyB0aGUgUExJQyBzb3VyY2VzDQpjb3VudCBmcm9tIDEgYW5kIG5vdCAwLg0KDQpyaXNjdjog
c2lmaXZlX2U6IEZpeCBQTElDIHByaW9yaXR5IGJhc2Ugb2Zmc2V0DQpBY2NvcmRpbmcgdG8gdGhl
IEZFMzEgbWFudWFsIHRoZSBQTElDIHNvdXJjZSBwcmlvcml0eSBhZGRyZXNzIHN0YXJ0cyBhdA0K
YW4gb2Zmc2V0IG9mIDB4MDQgYW5kIG5vdCAweDAwLg0KDQpyaXNjdjogdmlydDogRml4IFBMSUMg
cHJpb3JpdHkgYmFzZSBvZmZzZXQNClVwZGF0ZSB0aGUgdmlydCBvZmZzZXRzIGJhc2VkIG9uIHRo
ZSBuZXdseSB1cGRhdGVkIFNpRml2ZSBVIGFuZCBTaUZpdmUgRQ0Kb2Zmc2V0cy4NCg0KU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPg0KLS0t
DQogaHcvcmlzY3Yvc2lmaXZlX3BsaWMuYyAgICAgIHwgNCArKy0tDQogaW5jbHVkZS9ody9yaXNj
di9zaWZpdmVfZS5oIHwgMiArLQ0KIGluY2x1ZGUvaHcvcmlzY3Yvc2lmaXZlX3UuaCB8IDQgKyst
LQ0KIGluY2x1ZGUvaHcvcmlzY3YvdmlydC5oICAgICB8IDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2h3L3Jpc2N2
L3NpZml2ZV9wbGljLmMgYi9ody9yaXNjdi9zaWZpdmVfcGxpYy5jDQppbmRleCBhYzc2OGU2YzI3
Li4wMzE1ZTAzNWU1IDEwMDY0NA0KLS0tIGEvaHcvcmlzY3Yvc2lmaXZlX3BsaWMuYw0KKysrIGIv
aHcvcmlzY3Yvc2lmaXZlX3BsaWMuYw0KQEAgLTIwNyw3ICsyMDcsNyBAQCBzdGF0aWMgdWludDY0
X3Qgc2lmaXZlX3BsaWNfcmVhZCh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1bnNpZ25lZCBz
aXplKQ0KICAgICBpZiAoYWRkciA+PSBwbGljLT5wcmlvcml0eV9iYXNlICYmIC8qIDQgYnl0ZXMg
cGVyIHNvdXJjZSAqLw0KICAgICAgICAgYWRkciA8IHBsaWMtPnByaW9yaXR5X2Jhc2UgKyAocGxp
Yy0+bnVtX3NvdXJjZXMgPDwgMikpDQogICAgIHsNCi0gICAgICAgIHVpbnQzMl90IGlycSA9IChh
ZGRyIC0gcGxpYy0+cHJpb3JpdHlfYmFzZSkgPj4gMjsNCisgICAgICAgIHVpbnQzMl90IGlycSA9
ICgoYWRkciAtIHBsaWMtPnByaW9yaXR5X2Jhc2UpID4+IDIpICsgMTsNCiAgICAgICAgIGlmIChS
SVNDVl9ERUJVR19QTElDKSB7DQogICAgICAgICAgICAgcWVtdV9sb2coInBsaWM6IHJlYWQgcHJp
b3JpdHk6IGlycT0lZCBwcmlvcml0eT0lZFxuIiwNCiAgICAgICAgICAgICAgICAgaXJxLCBwbGlj
LT5zb3VyY2VfcHJpb3JpdHlbaXJxXSk7DQpAQCAtMjgwLDcgKzI4MCw3IEBAIHN0YXRpYyB2b2lk
IHNpZml2ZV9wbGljX3dyaXRlKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIGFkZHIsIHVpbnQ2NF90IHZh
bHVlLA0KICAgICBpZiAoYWRkciA+PSBwbGljLT5wcmlvcml0eV9iYXNlICYmIC8qIDQgYnl0ZXMg
cGVyIHNvdXJjZSAqLw0KICAgICAgICAgYWRkciA8IHBsaWMtPnByaW9yaXR5X2Jhc2UgKyAocGxp
Yy0+bnVtX3NvdXJjZXMgPDwgMikpDQogICAgIHsNCi0gICAgICAgIHVpbnQzMl90IGlycSA9IChh
ZGRyIC0gcGxpYy0+cHJpb3JpdHlfYmFzZSkgPj4gMjsNCisgICAgICAgIHVpbnQzMl90IGlycSA9
ICgoYWRkciAtIHBsaWMtPnByaW9yaXR5X2Jhc2UpID4+IDIpICsgMTsNCiAgICAgICAgIHBsaWMt
PnNvdXJjZV9wcmlvcml0eVtpcnFdID0gdmFsdWUgJiA3Ow0KICAgICAgICAgaWYgKFJJU0NWX0RF
QlVHX1BMSUMpIHsNCiAgICAgICAgICAgICBxZW11X2xvZygicGxpYzogd3JpdGUgcHJpb3JpdHk6
IGlycT0lZCBwcmlvcml0eT0lZFxuIiwNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3Jpc2N2L3Np
Zml2ZV9lLmggYi9pbmNsdWRlL2h3L3Jpc2N2L3NpZml2ZV9lLmgNCmluZGV4IDdiNmQ4YWVkOTYu
LmY3MTVmODYwNmYgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2h3L3Jpc2N2L3NpZml2ZV9lLmgNCisr
KyBiL2luY2x1ZGUvaHcvcmlzY3Yvc2lmaXZlX2UuaA0KQEAgLTcwLDcgKzcwLDcgQEAgZW51bSB7
DQogI2RlZmluZSBTSUZJVkVfRV9QTElDX0hBUlRfQ09ORklHICJNIg0KICNkZWZpbmUgU0lGSVZF
X0VfUExJQ19OVU1fU09VUkNFUyAxMjcNCiAjZGVmaW5lIFNJRklWRV9FX1BMSUNfTlVNX1BSSU9S
SVRJRVMgNw0KLSNkZWZpbmUgU0lGSVZFX0VfUExJQ19QUklPUklUWV9CQVNFIDB4MA0KKyNkZWZp
bmUgU0lGSVZFX0VfUExJQ19QUklPUklUWV9CQVNFIDB4MDQNCiAjZGVmaW5lIFNJRklWRV9FX1BM
SUNfUEVORElOR19CQVNFIDB4MTAwMA0KICNkZWZpbmUgU0lGSVZFX0VfUExJQ19FTkFCTEVfQkFT
RSAweDIwMDANCiAjZGVmaW5lIFNJRklWRV9FX1BMSUNfRU5BQkxFX1NUUklERSAweDgwDQpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9ody9yaXNjdi9zaWZpdmVfdS5oIGIvaW5jbHVkZS9ody9yaXNjdi9z
aWZpdmVfdS5oDQppbmRleCBiZTEzY2MxMzA0Li44OTJmMGVlZTIxIDEwMDY0NA0KLS0tIGEvaW5j
bHVkZS9ody9yaXNjdi9zaWZpdmVfdS5oDQorKysgYi9pbmNsdWRlL2h3L3Jpc2N2L3NpZml2ZV91
LmgNCkBAIC02OCw5ICs2OCw5IEBAIGVudW0gew0KIH07DQogDQogI2RlZmluZSBTSUZJVkVfVV9Q
TElDX0hBUlRfQ09ORklHICJNUyINCi0jZGVmaW5lIFNJRklWRV9VX1BMSUNfTlVNX1NPVVJDRVMg
MTI3DQorI2RlZmluZSBTSUZJVkVfVV9QTElDX05VTV9TT1VSQ0VTIDU0DQogI2RlZmluZSBTSUZJ
VkVfVV9QTElDX05VTV9QUklPUklUSUVTIDcNCi0jZGVmaW5lIFNJRklWRV9VX1BMSUNfUFJJT1JJ
VFlfQkFTRSAweDANCisjZGVmaW5lIFNJRklWRV9VX1BMSUNfUFJJT1JJVFlfQkFTRSAweDA0DQog
I2RlZmluZSBTSUZJVkVfVV9QTElDX1BFTkRJTkdfQkFTRSAweDEwMDANCiAjZGVmaW5lIFNJRklW
RV9VX1BMSUNfRU5BQkxFX0JBU0UgMHgyMDAwDQogI2RlZmluZSBTSUZJVkVfVV9QTElDX0VOQUJM
RV9TVFJJREUgMHg4MA0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvcmlzY3YvdmlydC5oIGIvaW5j
bHVkZS9ody9yaXNjdi92aXJ0LmgNCmluZGV4IGYxMmRlYWViZDYuLjU2ODc2NGI1NzAgMTAwNjQ0
DQotLS0gYS9pbmNsdWRlL2h3L3Jpc2N2L3ZpcnQuaA0KKysrIGIvaW5jbHVkZS9ody9yaXNjdi92
aXJ0LmgNCkBAIC01OSw3ICs1OSw3IEBAIGVudW0gew0KICNkZWZpbmUgVklSVF9QTElDX0hBUlRf
Q09ORklHICJNUyINCiAjZGVmaW5lIFZJUlRfUExJQ19OVU1fU09VUkNFUyAxMjcNCiAjZGVmaW5l
IFZJUlRfUExJQ19OVU1fUFJJT1JJVElFUyA3DQotI2RlZmluZSBWSVJUX1BMSUNfUFJJT1JJVFlf
QkFTRSAweDANCisjZGVmaW5lIFZJUlRfUExJQ19QUklPUklUWV9CQVNFIDB4MDQNCiAjZGVmaW5l
IFZJUlRfUExJQ19QRU5ESU5HX0JBU0UgMHgxMDAwDQogI2RlZmluZSBWSVJUX1BMSUNfRU5BQkxF
X0JBU0UgMHgyMDAwDQogI2RlZmluZSBWSVJUX1BMSUNfRU5BQkxFX1NUUklERSAweDgwDQotLSAN
CjIuMjEuMA0KDQo=

