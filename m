Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC71u-0002HB-6D
	for mharc-qemu-riscv@gnu.org; Thu, 04 Apr 2019 14:24:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=990829437=Alistair.Francis@wdc.com>)
	id 1hC71q-00025B-Ak
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 14:23:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=990829437=Alistair.Francis@wdc.com>)
	id 1hC6tx-0007zg-01
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 14:15:49 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28856)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=990829437=Alistair.Francis@wdc.com>)
	id 1hC6tv-0007x9-9B; Thu, 04 Apr 2019 14:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554401747; x=1585937747;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=Et928z5/Pkkajrx+6BIahBUKil/AKJwhi5dv5cM6fY0=;
	b=Qa7CfoRaEN0jAufeP97hrKeppLkzSXYLgggnE4cYpUrM+l7LiJjZzPO6
	GbhN5cXuae6W4/Q9f3pVv7zm2RbOUal44gyjGZ5IaaSYW/lZ3Xfr15o1o
	/1PbKRZA+9jPYy4DsnVR5OzdxN5BpXF83vjNqUpHkHjozI+mYnRgREHyX
	FlzwPZN2U2h4GHBk9hhjcjz4rmFIf588xPIX9VQ918zuLiESsV1Lhy0qX
	+/D0moo8pwXbveUgU73mkhhmrYSqoECn/Mrny6R52W1LagjaxU5nM9Wgu
	sM/aV5oy7r1sLBarhdPdpUNr1UmK0FDpdx2qEGZbulV2HeFP/G/nwvmyy w==;
X-IronPort-AV: E=Sophos;i="5.60,309,1549900800"; d="scan'208";a="106375664"
Received: from mail-cys01nam02lp2053.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.53])
	by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2019 02:15:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Et928z5/Pkkajrx+6BIahBUKil/AKJwhi5dv5cM6fY0=;
	b=YgkQL/vxjJvsf9WNcC5gqsut+oPq2VaAo1Gun5cuk7LJ4aM0W4BXRyhMmP7hXx4iieGQ5yA+IrGUKe1ayaifmAU6avrQcnIu8yUCBMYprhvLfcBzYpA4nJMngcZCTCIQD+cP+EhWyhu+ZwEpRq1RkeNcdOSAneYagtDuX3mu/2c=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5653.namprd04.prod.outlook.com (20.179.56.211) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.16; Thu, 4 Apr 2019 18:15:34 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Thu, 4 Apr 2019 18:15:34 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v3 2/2] riscv: plic: Log guest errors
Thread-Index: AQHU6xJl/qUPGmN15EuQUWtOuLCBlA==
Date: Thu, 4 Apr 2019 18:15:34 +0000
Message-ID: <5a5be6c3ae42d8c585f221eb60995310ffee4103.1554401615.git.alistair.francis@wdc.com>
References: <cover.1554401615.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1554401615.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR02CA0007.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::20) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.45.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b922f3e-71fa-4058-0bac-08d6b92987dd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5653; 
x-ms-traffictypediagnostic: BYAPR04MB5653:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB56535ACAE5050CF3D2BE10A790500@BYAPR04MB5653.namprd04.prod.outlook.com>
x-forefront-prvs: 0997523C40
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(366004)(346002)(376002)(39860400002)(189003)(199004)(5660300002)(6486002)(3846002)(6116002)(68736007)(50226002)(6436002)(2906002)(118296001)(316002)(54906003)(2616005)(110136005)(36756003)(8936002)(11346002)(446003)(486006)(476003)(14444005)(44832011)(256004)(305945005)(7736002)(105586002)(478600001)(106356001)(66066001)(25786009)(72206003)(8676002)(81166006)(81156014)(71200400001)(71190400001)(2501003)(97736004)(6506007)(102836004)(386003)(6512007)(52116002)(14454004)(53936002)(99286004)(76176011)(186003)(4326008)(86362001)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5653;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qw4gQCN0cbbwjiXViMRSqwOWHWMte/oKFHLUomvBVwzQQmQC38NXGcKpatq6xm3AbusuJxHL5OPR7+wlra+YT58VNWV4P/B9EbZ9CD4SydjljvJXHpLyTNOdl/PUcOabskq9keVnvpVVULqBEFrLwzRrutsHS7xpisplh8eYjNduvCh/MgeG7Sfy6uPpOFqfW0xL83TgsiJEMppRiv+VHOb6pt55gJAlJhMgBYqC6qXShcDM2fCiQC/2i1w/nIn1niq9Q8fEJNmTV85miJgmV3V0Goz5H9Jpj4fbKUNVIztbs4ORhUlZUAk0LkeH4f2TTO2xxCGcHvo7HCu207lrNptsHZXbvl22+A5o7QVSMcSuPA6SDtkxazkcyrlKkUo5TNxT9rFvCwIUkyS7/75RgfYjIZ94UMieexaKyU4BClk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b922f3e-71fa-4058-0bac-08d6b92987dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2019 18:15:34.6674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5653
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH for 4.0 v3 2/2] riscv: plic: Log guest errors
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
X-List-Received-Date: Thu, 04 Apr 2019 18:23:59 -0000

SW5zdGVhZCBvZiB1c2luZyBlcnJvcl9yZXBvcnQoKSB0byBwcmludCBndWVzdCBlcnJvcnMgbGV0
J3MgdXNlDQpxZW11X2xvZ19tYXNrKExPR19HVUVTVF9FUlJPUiwuLi4pIHRvIGxvZyB0aGUgZXJy
b3IuDQoNClNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNA
d2RjLmNvbT4NCi0tLQ0KIGh3L3Jpc2N2L3NpZml2ZV9wbGljLmMgfCAxMiArKysrKysrKystLS0N
CiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvaHcvcmlzY3Yvc2lmaXZlX3BsaWMuYyBiL2h3L3Jpc2N2L3NpZml2ZV9wbGljLmMN
CmluZGV4IDAzMTVlMDM1ZTUuLjA3YTAzMmQ5M2QgMTAwNjQ0DQotLS0gYS9ody9yaXNjdi9zaWZp
dmVfcGxpYy5jDQorKysgYi9ody9yaXNjdi9zaWZpdmVfcGxpYy5jDQpAQCAtMjYzLDcgKzI2Myw5
IEBAIHN0YXRpYyB1aW50NjRfdCBzaWZpdmVfcGxpY19yZWFkKHZvaWQgKm9wYXF1ZSwgaHdhZGRy
IGFkZHIsIHVuc2lnbmVkIHNpemUpDQogICAgIH0NCiANCiBlcnI6DQotICAgIGVycm9yX3JlcG9y
dCgicGxpYzogaW52YWxpZCByZWdpc3RlciByZWFkOiAlMDh4IiwgKHVpbnQzMl90KWFkZHIpOw0K
KyAgICBxZW11X2xvZ19tYXNrKExPR19HVUVTVF9FUlJPUiwNCisgICAgICAgICAgICAgICAgICAi
JXM6IEludmFsaWQgcmVnaXN0ZXIgcmVhZCAweCUiIEhXQUREUl9QUkl4ICJcbiIsDQorICAgICAg
ICAgICAgICAgICAgX19mdW5jX18sIGFkZHIpOw0KICAgICByZXR1cm4gMDsNCiB9DQogDQpAQCAt
MjkwLDcgKzI5Miw5IEBAIHN0YXRpYyB2b2lkIHNpZml2ZV9wbGljX3dyaXRlKHZvaWQgKm9wYXF1
ZSwgaHdhZGRyIGFkZHIsIHVpbnQ2NF90IHZhbHVlLA0KICAgICB9IGVsc2UgaWYgKGFkZHIgPj0g
cGxpYy0+cGVuZGluZ19iYXNlICYmIC8qIDEgYml0IHBlciBzb3VyY2UgKi8NCiAgICAgICAgICAg
ICAgICBhZGRyIDwgcGxpYy0+cGVuZGluZ19iYXNlICsgKHBsaWMtPm51bV9zb3VyY2VzID4+IDMp
KQ0KICAgICB7DQotICAgICAgICBlcnJvcl9yZXBvcnQoInBsaWM6IGludmFsaWQgcGVuZGluZyB3
cml0ZTogJTA4eCIsICh1aW50MzJfdClhZGRyKTsNCisgICAgICAgIHFlbXVfbG9nX21hc2soTE9H
X0dVRVNUX0VSUk9SLA0KKyAgICAgICAgICAgICAgICAgICAgICAiJXM6IGludmFsaWQgcGVuZGlu
ZyB3cml0ZTogMHglIiBIV0FERFJfUFJJeCAiIiwNCisgICAgICAgICAgICAgICAgICAgICAgX19m
dW5jX18sIGFkZHIpOw0KICAgICAgICAgcmV0dXJuOw0KICAgICB9IGVsc2UgaWYgKGFkZHIgPj0g
cGxpYy0+ZW5hYmxlX2Jhc2UgJiYgLyogMSBiaXQgcGVyIHNvdXJjZSAqLw0KICAgICAgICAgYWRk
ciA8IHBsaWMtPmVuYWJsZV9iYXNlICsgcGxpYy0+bnVtX2FkZHJzICogcGxpYy0+ZW5hYmxlX3N0
cmlkZSkNCkBAIC0zNDAsNyArMzQ0LDkgQEAgc3RhdGljIHZvaWQgc2lmaXZlX3BsaWNfd3JpdGUo
dm9pZCAqb3BhcXVlLCBod2FkZHIgYWRkciwgdWludDY0X3QgdmFsdWUsDQogICAgIH0NCiANCiBl
cnI6DQotICAgIGVycm9yX3JlcG9ydCgicGxpYzogaW52YWxpZCByZWdpc3RlciB3cml0ZTogJTA4
eCIsICh1aW50MzJfdClhZGRyKTsNCisgICAgcWVtdV9sb2dfbWFzayhMT0dfR1VFU1RfRVJST1Is
DQorICAgICAgICAgICAgICAgICAgIiVzOiBJbnZhbGlkIHJlZ2lzdGVyIHdyaXRlIDB4JSIgSFdB
RERSX1BSSXggIlxuIiwNCisgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgYWRkcik7DQogfQ0K
IA0KIHN0YXRpYyBjb25zdCBNZW1vcnlSZWdpb25PcHMgc2lmaXZlX3BsaWNfb3BzID0gew0KLS0g
DQoyLjIxLjANCg0K

