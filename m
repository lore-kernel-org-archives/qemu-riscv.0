Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQGo-0008Jy-B9
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:37:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQGk-0008GI-3R
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:37:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQGV-00053s-7i
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:37:40 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:52061)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQGD-00051d-8I; Thu, 15 Nov 2018 17:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321438; x=1573857438;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=Xl4JWw9lDIkcmyLyDGSzdZNzbsGImJzxLnNhIpReGcs=;
	b=ch/0c1IYAVMMCZ1oHg+r1Vmgg3Mr8asHuTmz24+KCh9FxevTrAyfHGoc
	cLsJ1PqtHx7ZDCiBfbJC7QzqWTFJDOkChW8JAL4qoVgLDsAtEc6W1i/xk
	ynxUu22Au8sG5/HtXwID94+9stH1VroncY+DmtoC6k+BLmtH+4VMEn2Ao
	nQxL8pZzeI7hRALhmpr0xRi2AKxU1eeRgGKTcmGcNlt1UV4aGL2fNwbKB
	1kYPwoBlGy39ilr7+XnAJv++F4SPmOmHEatdr5zE7TeqduQWWIWfcw9I+
	M5dSSAF6T5FZjJskVy2gNUE3V9PxPTFJeT2CiQ7kUCQg5xwyp+60UuT32 Q==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="99166069"
Received: from mail-bn3nam01lp0178.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([216.32.180.178])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:37:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+je7nAaBJndhfAMUEdOnXbK/PrzUW6fnYZdTN+2thhc=;
	b=DvAcrZ3Wh+Is5qL1VfUX7zWv1uB0aaNC7IFQ4p1Rr6PiEPhenxeVasEtGpDbEhSJK/FfIzr7/vtA/9cctVu3eVYrrprvCszrC0CeYD4EXXchxkKSnNuIvTmBA08yWFmMFaezqa/ea2hqeeGB1x5PltQoEh/cvASUIKoI+10gTfc=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0865.namprd04.prod.outlook.com (10.172.169.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.36; Thu, 15 Nov 2018 22:37:13 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:37:13 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 22/23] dias: Add RISC-V support
Thread-Index: AQHUfTPA/tUGnnEISECwiutuJlLLUw==
Date: Thu, 15 Nov 2018 22:37:13 +0000
Message-ID: <84be65cc6caa8421b04ac381f4623e21f80ee39f.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0093.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::34) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0865;
	6:BsA/LNQt8zjxw6DMLHw4XRfAA/s1oYH0Ehzm4l8z7o4C3SiNsRUgic/KrGVCkeZspIziXEPbP+KZy+lh7wQ2OzfAHAx9nRroWLvSIA9XDkLFrUWJ8qXtaGx6G8zQ5uG0qO/nF3eEy2HaTpW4yJF/ZNIhewwc7ZkLQq5biXPEhTho1MAM3DBjpjL8o41iBdbd20+8qkhDV3R0AW50UZRajfnTqyWaLoC5ZB7WU4k4m9RSuoFUzae3WKbAocI6gxjts4WR+5xfTVaV1gR6ur8cb/l8yhQ1nuCzKiMSfR9cMfeb3QbasfrTGkY7s540PY1mxRGuCioczhYfhXRxWn4OyYHzG4QxNKKYggkL5Lhdzy//5+kSXbZCouhTB8yr5d96zc3CZ81r6lzk9hhHr4zJ5KRaUPVm7gYL0POy6IgMcan0Pg9TaGsM+HSsgUy5vYMuEY3+8CwV6sYsWQO5JehZlw==;
	5:pTiXTecweLh1QZwKiKVDPjXuR1u6P9l/icbb8EsC2GvoSVA4wPyPhSLfVoCrBP5V1HyHS3mj2/44ti+irdcPrt/lj0LI8TrkTUKZdZTqY0NvLYVuqNQXYchyZqd4BImIA0iInEXjUZ4rh+QChzHrkQp5qcAnJ8SzY+9xE2MhiWY=;
	7:Q7lAeMqpj68iKeR3bDMrhSMqJg3oErv3tTelBsOvppVK9KM06o1NDf8XgP1iDy49BEuG6g2QbwJutaR9mKxVSY4L2KAu/KuX/bHkUvuFhWCi19dwZAzzHbgINECRwpH6yPB9LbbBq0gEMXadx2q7MA==
x-ms-office365-filtering-correlation-id: 02fe60ba-1f9f-49ca-3979-08d64b4ae33c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0865; 
x-ms-traffictypediagnostic: MWHPR04MB0865:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0865815F24DD02E61FA6B03090DC0@MWHPR04MB0865.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231415)(944501410)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0865; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0865; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(376002)(39860400002)(346002)(396003)(189003)(199004)(81156014)(81166006)(8676002)(118296001)(8936002)(256004)(6486002)(25786009)(86362001)(2501003)(72206003)(105586002)(106356001)(2906002)(97736004)(478600001)(66066001)(186003)(99286004)(54906003)(386003)(11346002)(2616005)(446003)(36756003)(2900100001)(486006)(6512007)(476003)(6506007)(26005)(39060400002)(102836004)(5660300001)(305945005)(50226002)(71190400001)(71200400001)(110136005)(6436002)(68736007)(53936002)(3846002)(316002)(4326008)(6116002)(7736002)(14454004)(44832011)(52116002)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0865;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: xu2FDf4dyCEaekcVYOvh+pkjxZwOzIs5nQ6CfDSjG7YoIFLxO5FLzSbHVwIgyxToVDbOYO55iLQwPmuvUnSvSwi3TnoloN1k/hUgasfVygze/t4+JtWat3NBFmxnA/k2GUEvITMun2flORTsQNXKeTsocfv27MAYH3GnhQ9JfbqHSiNFtwsd4yEHDJgTh0Ei4kjOaFkYAjFPEH9AogBHTFwlwK5izu7psGSpXnTJfSzlGsqFd5MnTJK9lZt54cHJkVKgnGHztsBhvhaX8tEgHhxN068V/9PEsEiMoRMxhNurrElvgIlD775jFQHv+5w2bksLzgZI/qFsNUGUsqQ/EdxCs+e64EHo2wcGH89LVZY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fe60ba-1f9f-49ca-3979-08d64b4ae33c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:37:13.5014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0865
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v1 22/23] dias: Add RISC-V support
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
X-List-Received-Date: Thu, 15 Nov 2018 22:37:53 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 disas.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/disas.c b/disas.c
index 5325b7e6be..82a408f272 100644
--- a/disas.c
+++ b/disas.c
@@ -522,8 +522,14 @@ void disas(FILE *out, void *code, unsigned long size)
 # ifdef _ARCH_PPC64
     s.info.cap_mode =3D CS_MODE_64;
 # endif
-#elif defined(__riscv__)
-    print_insn =3D print_insn_riscv;
+#elif defined(__riscv) && defined(CONFIG_RISCV_DIS)
+#if defined(_ILP32)
+    print_insn =3D print_insn_riscv32;
+#elif defined(_LP64)
+    print_insn =3D print_insn_riscv64;
+#else
+#error unsupported RISC-V ABI
+#endif
 #elif defined(__aarch64__) && defined(CONFIG_ARM_A64_DIS)
     print_insn =3D print_insn_arm_a64;
     s.info.cap_arch =3D CS_ARCH_ARM64;
--=20
2.19.1


