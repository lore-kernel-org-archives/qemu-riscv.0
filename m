Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkcJ-0006PO-7L
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:09:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkcH-0006NO-3A
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:09:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkcG-0005Ks-CE
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:09:57 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:36247)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkc9-0005HY-Ie; Tue, 27 Nov 2018 16:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352989; x=1574888989;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=yrSrE4qAUim+nOJj4KJyO/SejAJJqLQ6qEkpXfylgC8=;
	b=qdESDO5uLeKFqlLI9iL0abwQXLxy9nY4WPPdliCu0jiyjcYQd7j/7i3p
	QdX5xRGuzpKTXuxnBjP1b2ziY3fgZltZoH5KaUSWMXD+mYCGk2VZLEh1O
	yMXVqwgqOknE/Gh3ZEkJfZeKb6C1gn0Fm4V2s9E+qd/AqSocVdBwETNL6
	kwmtkQnjmBYdMIJIjma9TOHWtIJB6+XOuPt0kO705vQpjlTeYbi6n6S6Z
	4kgx7sssrMK42EHLq9eR9l3lBIqlJ8euh5scl1vah48VSX73MBmCuBvN/
	2ScuMSCNpGRC5kKZcPyqNdmwc4VC4lLUOwpmA3EgZv2bDWvvdYL5KJjyp Q==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="100064303"
Received: from mail-cys01nam02lp0055.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.55])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:09:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DAMb7CF6B0YzMBTKr1T44NtzDsWGjypJdpskH3i5Tpw=;
	b=Io5MSeRfNzUUNWh6zwC6g41sqnbYDn99AkR0WwMO2XaCkM9TWDXezDSvSBBFEjKZdDj/86bfZ2EescrhcGQcR1aj0FyyxNFEzFUps3Odx13AYkYcPxnC48QzMVK7debMb7LSdV+8IDqSg3qxBZ8x76PX83gPnrmw4yRrajmcd+s=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0639.namprd04.prod.outlook.com (10.172.166.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.15; Tue, 27 Nov 2018 21:09:47 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:09:47 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 21/24] dias: Add RISC-V support
Thread-Index: AQHUhpWGDiLJClrwj0aAmV9FBKES8A==
Date: Tue, 27 Nov 2018 21:09:47 +0000
Message-ID: <d3a9af95fcba77e4bcae1d65e95ee57eb22f4d6e.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR08CA0033.namprd08.prod.outlook.com
	(2603:10b6:a03:100::46) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0639;
	6:ylByPdxGNWvmF42nsHS6Ar1/voeVO4KbMLJc/iVYphGVa5v0Z/aVu6Ut10nGf2UGJHyOK2rEepdJT0r2LKe92hmlGQm8J7Yvla/vQgyKoHPYaydaLKilEQbSiMtdnCWZ8PlVtDDUDLIKYfoZL+5SxaF8MB8dWdTqsbfHUGKWNjwusqTM2qnf0CUfdOfowIMKDUIr/1DKtribm/nBWdFn7swHVsKfkts1DrlYQ/dGztGa0Io+NDAIMbU1aJGGZ1joYtIAM5tzoEBLXKgSQqs9cMMeMslaCO7qKZKnNO8NkwdRXSKt8FFY2PE+d5Ri1hgYhxUDxAedSzOEenOG1q8frkdM7NcbNl5k9WUS9X0rSD5GtSrrCMEG23O1I6tdVCbWNPKKRThNAwR8xfpw6Omt/T4Zk/glgW7ShcalrMOt4Olzh7WfJtPUlYj6zYDbajexUe8Hik6qtXn6DSI6hlB+7g==;
	5:y0jFA7KGRuXUIz6LW2e54DtAYkWDu9mnY445UGzEu+IhPg2x3YqH78nLj8mRJuvxanDIRt0VWluV8KDN/gg2Rjd+8KgMX0I1cRJev2sXvRlOryvJZvQfqOsx7LUTu/Uj0mfAjZS7SxWWcsycDJd+ntDugurcrVfkGvPzyRr3XRc=;
	7:MpeQhZuw5ekNwoM9dzSW9hQchoxDg/sdPgBdnEVSW3kgBoylQQ0n29p5GFaFDclhuP7xvW/7/zg5+c7UD7Rq10xGmqkPk0lzYGiJeDRBsB2K6KXjbIORZvsW8+2klDnJdu3jRwWgjPFFskIKG1GIgA==
x-ms-office365-filtering-correlation-id: 2368c5f6-1ad9-44e4-4021-08d654aca914
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0639; 
x-ms-traffictypediagnostic: MWHPR04MB0639:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB063935C2F22AADDEFFF2C06F90D00@MWHPR04MB0639.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231443)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0639; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0639; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(86362001)(6436002)(53936002)(97736004)(6512007)(2906002)(66066001)(8676002)(8936002)(81166006)(81156014)(50226002)(54906003)(110136005)(5660300001)(316002)(118296001)(7736002)(2501003)(6486002)(68736007)(305945005)(36756003)(478600001)(72206003)(71190400001)(71200400001)(52116002)(76176011)(6116002)(386003)(6506007)(102836004)(44832011)(2616005)(476003)(3846002)(26005)(186003)(486006)(14454004)(99286004)(446003)(25786009)(106356001)(39060400002)(105586002)(256004)(11346002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0639;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: ibHNhEFtXnrK3mhepbwWfK4ACitnYhlcsuNJk8dVgcvBRjkEvQZ8QGG6OwehFQI6Kn2LRhHzSBkcBD9Uzqv3HjwnUjRnl4mhAH4mA7SEkNWELD6WUDnwaE6HoAdq+c8OGtxgK4UGBgCZVEXMH/f8BWtmcw0ftZoNgOvfiCQDfKKMmH2ji6oU90V75C19mWg126IrxOrVXtKjDYFgkGbKc84/Q5Wl8SSmG8KwppNTKmZRS9sfKlLkhiqIDkWa10AA7Y4pI45TRKW7CkCPHxxmFamHufelJ77k4w3aSIKr85k4E4PyYGs/ijh7QlB+l25iQsi6puFtzmKOsZXFtzHrf5OmmxFt0pGQcSYwKLedPjk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2368c5f6-1ad9-44e4-4021-08d654aca914
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:09:47.0101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0639
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v2 21/24] dias: Add RISC-V support
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
X-List-Received-Date: Tue, 27 Nov 2018 21:09:58 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


