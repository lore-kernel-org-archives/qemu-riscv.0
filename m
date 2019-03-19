Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6JNl-0008Oo-T3
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 14:22:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNg-0008KK-LE
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:22:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNd-0000s7-KQ
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:22:32 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:47877)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNQ-0007iP-Ry; Tue, 19 Mar 2019 14:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553019736; x=1584555736;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=eW1pwuIkig5Ey4iZ0a4xc9Umj6cbZ6PEmRiZ2dRpwWk=;
	b=N3jsu3kMIPZHVSYGkpdX/+z1TjJtewVTTQG5wxQYjjViXgitPe2/hWFy
	l8F9/z0Y52S6JkajiDNUg3uroKxaU13KAIrQFEE0CfLwWX8Wb/HO/UGk1
	HBIreqRGx9eT7diCmFFTbohssyCOorT/wW51V32WQ8YAHzUWvN2ShQauE
	hFfN0IQIrHGdVAK7Gp76ykX62oHYKUP2xFoPtUuXJDU0IFMxnosB5Imdv
	/yB0Cy/4Nk8iv/js64UdmNuwcv2c2JymSulSiJfjAZWTmdgwGCkaDeFNT
	kkE8jQZMbH3QygwrOz/l+eBdpTzVLJRduU8xUo8u82rYgQdDYlNkK3SPo Q==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="209307027"
Received: from mail-bl2nam02lp2057.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.57])
	by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 02:21:17 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=F8HUl7CBwhbzsSD7kg1Ck9OWTw4KS8v3g2egWDeOZI0=;
	b=CLi221sE2mzYLCJM5jsBbnmZ2UEcZF4AOiLo+Wki2is66vz747xYdg/yfjAHsJt2/N0Bg9sP0uGE6NO/op4S+1xQ0Y8qCXx44Y9djY1vnumCtIK6P1cRzGYdA4DThiy0U0oZfcPCs9vlMA/NF11ItqWNf6fixXCa65WV84YSeBA=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4920.namprd04.prod.outlook.com (52.135.232.213) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.13; Tue, 19 Mar 2019 18:21:15 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.015;
	Tue, 19 Mar 2019 18:21:15 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v1 3/6] riscv: virt: Allow specifying a CPU via
	commandline
Thread-Index: AQHU3oCJ3HX/a3XSpkeEFUMrNyv5uQ==
Date: Tue, 19 Mar 2019 18:21:14 +0000
Message-ID: <ab6961a0893e75fb331d0346b3d70e8f26fcd800.1553019560.git.alistair.francis@wdc.com>
References: <cover.1553019560.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553019560.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR05CA0067.namprd05.prod.outlook.com
	(2603:10b6:a03:74::44) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 706f6586-bcb4-4b87-4f1e-08d6ac97ac0d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4920; 
x-ms-traffictypediagnostic: BYAPR04MB4920:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4920863E7E7E66A4290C6A3C90400@BYAPR04MB4920.namprd04.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(39860400002)(346002)(136003)(396003)(199004)(189003)(68736007)(14454004)(72206003)(66066001)(2501003)(2906002)(14444005)(54906003)(256004)(478600001)(7736002)(86362001)(305945005)(6116002)(81166006)(81156014)(8936002)(50226002)(97736004)(8676002)(36756003)(3846002)(106356001)(2616005)(11346002)(486006)(476003)(446003)(316002)(71190400001)(71200400001)(44832011)(6436002)(6512007)(4326008)(25786009)(110136005)(102836004)(6486002)(76176011)(186003)(4744005)(52116002)(53936002)(26005)(99286004)(118296001)(105586002)(5660300002)(6506007)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4920;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dj1/WgGOMMl0QRpT1PxcKzT0Y0wS85HEkUzhtPOkgp60ktYxC7BqundBG1zT/ZeWLO/K65dJiq1e3+V1REbCnhMb0NDEoSg/By+G8VKC2B+zfC17p0y9TmulSvBnnQOyxqjn9ofdDWEheS7UJwquwtDS6HN1YVauduacJ1HAHrXtZJwW28GV25aFHyNsFi/H/ypuPnWSeQAoh8rNCOGdSUv6q8b+md7O5spDzeM3z3DHp026Eg2N6JctqfMHY0MdRSL8oPAiLl3Y/S6Nj7Jh43KZinzGZn3lgea1fa53/iG/9WNYNkDtT802s70Itmlkad3crk4kwM4V37Y/pOrJkkfI+57AEULZCRmET6mvyXDUcfmYFZj80Z2E5+StBtN6qQnY19RQcRsTmEY9ru7rs8R0KnyEtavRcLMZWWNh1Gc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706f6586-bcb4-4b87-4f1e-08d6ac97ac0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 18:21:15.0039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4920
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH for 4.1 v1 3/6] riscv: virt: Allow specifying a
 CPU via commandline
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
X-List-Received-Date: Tue, 19 Mar 2019 18:22:35 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fc4c6b306e..5b25f028ad 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -400,7 +400,7 @@ static void riscv_virt_board_init(MachineState *machine=
)
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc=
),
                             TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
-    object_property_set_str(OBJECT(&s->soc), VIRT_CPU, "cpu-type",
+    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type"=
,
                             &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
                             &error_abort);
@@ -526,6 +526,7 @@ static void riscv_virt_board_machine_init(MachineClass =
*mc)
     mc->desc =3D "RISC-V VirtIO Board (Privileged ISA v1.10)";
     mc->init =3D riscv_virt_board_init;
     mc->max_cpus =3D 8; /* hardcoded limit in BBL */
+    mc->default_cpu_type =3D VIRT_CPU;
 }
=20
 DEFINE_MACHINE("virt", riscv_virt_board_machine_init)
--=20
2.21.0


