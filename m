Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXASp-000349-Fy
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:46:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXASi-00030Y-V9
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:46:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXASh-0003WU-82
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:46:28 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39292)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXASY-0003Rj-Tb; Wed, 12 Dec 2018 14:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643979; x=1576179979;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=G3S9Dt2dYVWGm7ZW7Y1T0WEiO5lLHciM/p5Y6OkVtko=;
	b=Oylw/Dj5MSO8qUDiA7zW5V6uzGB4Sz314BzgULHY6D5SA9xWzDbZ6jia
	cZeCU1bNN02ZLbl/eaxWJWXFO9tIqp95rco2UNpVvDo4ArvggWqiG1oQN
	lJ03sJlkGh3Z8CuOIMUwG5/bigDVJTE1N/mOuqCylZLSq3LOfaizOMxxk
	MemZRyn8naodxegIGhCpxi+G4GiJWi7PSaPgwMLMhuIVc0YUlcnGF0OVc
	9i5pM8TMZFybfpqqR8rgap7lcoqNALLEuVRTQ0aL60W50xdwB63JdWxB4
	Rkw168t2fwkoaw0RwRH1VEc5Nyj5FMfWwfRdeHqjSx6v5QjpOm+xGFN9F A==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="101342420"
Received: from mail-by2nam01lp2053.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.53])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:46:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Y4ucUXJN00cLhyglSRxKQiHDDBbJ2TVMusipIKPDFsw=;
	b=ViCeJWXWw/Xqs2usCQiHpshu/KpZtMW/Rf2cgVKWBPkwN7TEVh9MzPr5Crtv//295jnNp1hGyIPSsFL5QqDdGQWocCC9C090tWQriNvg74ll3XR4opLZXAoZT5LfAIA/LRU808cSuq6jXZjMj59O8RcjgPm6QTwJ+pF2Hwuoa4g=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0446.namprd04.prod.outlook.com (10.173.48.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Wed, 12 Dec 2018 19:46:16 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:46:16 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 22/23] dias: Add RISC-V support
Thread-Index: AQHUklNYqe7nYuJ6Sk+9YHdB0dsQYg==
Date: Wed, 12 Dec 2018 19:46:16 +0000
Message-ID: <97ab2db0d4eac20809f092a9d095ac03b8f7ff3c.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0055.namprd11.prod.outlook.com
	(2603:10b6:a03:80::32) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0446;
	6:03GZcalwRli2/bI4goB5v16j5VdXQ+Z4/UuMBtI8N0aZSPMsT4ewy0+EI/1YI/ewjkZf2QNa7lb8+VpwRvB59w8GWfb84p0fL65NWQwgRPQF6PgKO8t9uUbOocSG5OSxQRnpJOCPIwEld+PkCaJOoh9F4FY4mjl42grp7KjGVXcx6cOa8331N0rUy4A+tExcaFyh88usAv84zXCIsKBCKsvcN+U7fW7vfKlYS0sVihwedJ7TZuRDxeGQlqjsfiMObr+VEnaiN4xGVXo8XhE93bRAn1v/CV7CJhYLWGZ7CRgNjTD/Au+ho+wJCl0vqCBSTHklHXkHR880o4w6wOQT9/Qay7yL94TQcYLw/TAJ+Jd4ibHyZ1T6pPjMP3AxMvLqSAwt4W4ILwrvP/QTJ4/8Ue7LN4j2Ed9Ptsm5Huduaco91H/c62M7ERfxnvsPTm3Xu5FMGD4wXpO4cQWdvk76zw==;
	5:Mp0tzkKioFhUhy0YpXh+9HYiQrANA4Dmq+KS3xYZmQWJ5XY2j1NY0GM6+ELNpEi2jeM4ehdDzlSiqAFUH+TcRIdqMr9SuGjRGwziLHuLn/vRwqc7wTbvkjcdVQXzQuws4XbpnNADij0RzRynysgFnQoU1FfLbo7eHqX7h3nG4yo=;
	7:B6EmTF2ilq+PTjFsjpzxKFu1ixWULhpkBGY/Dco30EgxHWHO8zcEGCCY0Z5o/VfRvmTc/4CNL+gdP88cJ3eJwL9WmjOTQZCFQsdnEr6BGn08agNuCpvqeXm/sCOlZVyjrhlXENmNjfg+dDUgJ27uWg==
x-ms-office365-filtering-correlation-id: e87bcea4-8055-47b1-5bae-08d6606a7aa8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0446; 
x-ms-traffictypediagnostic: MWHPR04MB0446:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0446544CEC30D5E5EA308FB890A70@MWHPR04MB0446.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0446; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0446; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(366004)(346002)(396003)(376002)(189003)(199004)(3846002)(71190400001)(6512007)(97736004)(256004)(66066001)(2501003)(81166006)(50226002)(53936002)(6436002)(71200400001)(8676002)(106356001)(4326008)(6116002)(39060400002)(105586002)(478600001)(8936002)(6486002)(305945005)(386003)(6506007)(44832011)(110136005)(81156014)(186003)(72206003)(68736007)(7736002)(102836004)(486006)(316002)(54906003)(26005)(99286004)(76176011)(14454004)(86362001)(11346002)(476003)(5660300001)(2906002)(446003)(36756003)(52116002)(25786009)(118296001)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0446;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: 3ibi3rytDuaIfFhCqm2GIGOzqCdXDei0Rwzdvnq+qndbrMYdXomr0737LcWJWAVDLuwYDlQ6FUme6Nmd1DsyDnA0sSf4vM/Zci1ybvB1GbVfvE9Sexnvhry5jrgl+qyR3BdUUwY3XgPJeaWFWl8puIzY8/n9kIL9Uuh/cppM3x9rAYvtCekA7iA+s7h6QFw8MzqArT2QbPeY2xIJvIoahMw12h6EdlkKMdXqbNEI1OSiAs5DpeyCVeYrdfUHJrsb6082F4FWLv7QAsZF2BKOFqXlMKL/qxemflnFCPwp7zq9X6NEJoombTQHUNkpqf2P
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87bcea4-8055-47b1-5bae-08d6606a7aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:46:16.2813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0446
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 22/23] dias: Add RISC-V support
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
X-List-Received-Date: Wed, 12 Dec 2018 19:46:34 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/disas.c b/disas.c
index 5325b7e6be..e627fc74f9 100644
--- a/disas.c
+++ b/disas.c
@@ -522,8 +522,14 @@ void disas(FILE *out, void *code, unsigned long size)
 # ifdef _ARCH_PPC64
     s.info.cap_mode =3D CS_MODE_64;
 # endif
-#elif defined(__riscv__)
-    print_insn =3D print_insn_riscv;
+#elif defined(__riscv) && defined(CONFIG_RISCV_DIS)
+#if defined(_ILP32) || (__riscv_xlen =3D=3D 32)
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


