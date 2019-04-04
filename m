Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC71t-0002G4-68
	for mharc-qemu-riscv@gnu.org; Thu, 04 Apr 2019 14:24:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=990829437=Alistair.Francis@wdc.com>)
	id 1hC71r-00025B-IJ
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 14:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=990829437=Alistair.Francis@wdc.com>)
	id 1hC6tW-0007NK-9G
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 14:15:23 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:10065)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=990829437=Alistair.Francis@wdc.com>)
	id 1hC6tU-0007Cg-9W; Thu, 04 Apr 2019 14:15:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554401720; x=1585937720;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=ntDYytxxmCS8aXoBaVppe6Vwu6HQ6S+RK4/iGg3/p2E=;
	b=IFY2r/208S2fb6c1HhU5mhl7IAeebsflRAXnCpryQEAwfhdKwBqeO9dI
	kbhIBWFUVxB0LpKaRjrKLftO8MIY6Py2i+9u+1NGXknUWh9wRKBYdc4Rd
	ehLTFDIP6HisG174N2BOVbVqbdBqZgSIpPU9LTZbXc9ZLv256RwQYs0Eg
	JT8bmQeWo5ABZd7AHMQxYMwRxeycs65h8eZjA/9W4sN3V+DM//bAEppb/
	7MmB/Ck3jdCdHEV9su4y3G+QDe2nWu2Tra1JmucdYiH4S9m+1VrSJ6/rW
	pU56lrE2CB+kHUYcvXT/fSJGqUFQRItjQ7+wrL2yrsBLLEewWS5uuvF8e g==;
X-IronPort-AV: E=Sophos;i="5.60,309,1549900800"; d="scan'208";a="106752786"
Received: from mail-dm3nam03lp2050.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.50])
	by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2019 02:15:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ntDYytxxmCS8aXoBaVppe6Vwu6HQ6S+RK4/iGg3/p2E=;
	b=NhfY1KxBSQbeop1YAfc9ADyizyUASodyxFYY+fAGDhKvGFF5P2BcS1PdTrnahB9pyWb9XluqbiE3G3n5oPuOwAD/5LJd8n4ezFm/f9Gg73oRU1lXLjJy57QGfgP7H967qB2oULhg045IHIZNxvDmvTqRCdxMMDG1GMg90xFqGIY=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB6263.namprd04.prod.outlook.com (20.178.235.161) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.15; Thu, 4 Apr 2019 18:15:14 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Thu, 4 Apr 2019 18:15:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v3 0/2]  Update the QEMU PLIC addresses
Thread-Index: AQHU6xJZ4dAQ6wbnS0qRLm4zbljaNQ==
Date: Thu, 4 Apr 2019 18:15:14 +0000
Message-ID: <cover.1554401615.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR05CA0101.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::42) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28bebb9b-e355-475f-461c-08d6b9297bb3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB6263; 
x-ms-traffictypediagnostic: BYAPR04MB6263:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB6263140CC50159683E833F4D90500@BYAPR04MB6263.namprd04.prod.outlook.com>
x-forefront-prvs: 0997523C40
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(346002)(376002)(366004)(396003)(189003)(199004)(6306002)(7736002)(25786009)(4326008)(6512007)(53936002)(256004)(305945005)(2501003)(5660300002)(44832011)(6436002)(2906002)(15650500001)(3846002)(6116002)(316002)(4744005)(110136005)(54906003)(86362001)(966005)(14454004)(71200400001)(71190400001)(478600001)(186003)(386003)(6506007)(50226002)(66066001)(105586002)(68736007)(106356001)(26005)(8676002)(486006)(102836004)(476003)(8936002)(81166006)(6486002)(81156014)(97736004)(36756003)(2616005)(52116002)(99286004)(72206003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB6263;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lLyxYxlYBGVPi7LvjzmAe3f+YUsmavt+R0+PYJrj0Ei0pASQQifAWLwaT5eZDnm0AJCGow21T6Oe3Uk+avOQhsJoVyPqHJRuMFuft7z9IT6h73COHVzHca2zWoS+cd8LfQJiXl612htmJaQfiDXmSC1Zgp2EeL9I1xCO3qufV3Pk83jLwEpu2XMEelizuIHGnRS7g04HbfUURbQ7JEtP4ODWoQU8Vv5nk6plrrYAuSoiAUvv8pjEsyAEa9xDG3fE/QY68bMu5qNaDdxftowYYC71YvxvGIgVQoycBRQQzovod9sz6AnDxtoz6rYBl31ZTV24Xi+c/2kdtu1XQtO0MVQlu7h/7rtfWt00fS4EFonkZk0EfuB4MS8jWsihq//phCm5JavRyYB0SUPPICR2+q8qGbmF+AYfkN+YbMlVQ0k=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bebb9b-e355-475f-461c-08d6b9297bb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2019 18:15:14.2089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6263
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH for 4.0 v3 0/2] Update the QEMU PLIC addresses
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

VGhpcyBzZXJpZXMgdXBkYXRlcyB0aGUgUExJQyBhZGRyZXNzIHRvIG1hdGNoIHRoZSBkb2N1bWVu
dGF0aW9uLg0KVGhpcyBmaXhlczogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L29wZW5zYmkvaXNz
dWVzLzk3DQpWMzoNCiAtIEZpeCBTaUZpdmUgVSBjcmFzaA0KVjI6DQogLSBTcXVhc2ggcGF0Y2hl
cyB0byBlbnN1cmUgYmllc2N0YWJpbGl0eQ0KDQpBbGlzdGFpciBGcmFuY2lzICgyKToNCiAgcmlz
Y3Y6IHBsaWM6IEZpeCBpbmNvcnJlY3QgaXJxIGNhbGN1bGF0aW9uDQogIHJpc2N2OiBwbGljOiBM
b2cgZ3Vlc3QgZXJyb3JzDQoNCiBody9yaXNjdi9zaWZpdmVfcGxpYy5jICAgICAgfCAxNiArKysr
KysrKysrKy0tLS0tDQogaW5jbHVkZS9ody9yaXNjdi9zaWZpdmVfZS5oIHwgIDIgKy0NCiBpbmNs
dWRlL2h3L3Jpc2N2L3NpZml2ZV91LmggfCAgNCArKy0tDQogaW5jbHVkZS9ody9yaXNjdi92aXJ0
LmggICAgIHwgIDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pDQoNCi0tIA0KMi4yMS4wDQoNCg==

