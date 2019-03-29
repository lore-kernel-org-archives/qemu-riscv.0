Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hA11W-0000t1-F8
	for mharc-qemu-riscv@gnu.org; Fri, 29 Mar 2019 19:34:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA11G-0000YU-SP
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 19:34:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0AU-0007d7-Tv
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 18:40:11 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:2076)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0AR-0007bS-VW; Fri, 29 Mar 2019 18:40:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553899218; x=1585435218;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=eW1pwuIkig5Ey4iZ0a4xc9Umj6cbZ6PEmRiZ2dRpwWk=;
	b=eWx0Cv0G35t3L4CFcMgK/sAreLWcwJAfBY16sexHLYbI9cmgJIuw1YaF
	Xnz4GjiTD/cd5QapJe2kxRH0NMFkjKQmviF8GQrXx4YVCKzp6vFqRWGfP
	3MnfTUE8qWDVd1YcGU9J6n92hmmcLSURORNfBMsh6aVO3yYVLQ9Gc5U9+
	8COqWbLicEmF0231RikeaVm8YEtkdNFl6nrTbAdGhx0sD/a/uRc+scTiD
	Yj3A9hyeJVOhfYMHi5TS2yAyRxP4YDs5Lr2F5yPGwDtPDsJEV1VaOz2xg
	U7IXOUx6zluWzi6Nicmz0NEHinqBEXvzRjW34BMPHhJvsLrzZgMPrcUTA Q==;
X-IronPort-AV: E=Sophos;i="5.60,286,1549900800"; d="scan'208";a="203406019"
Received: from mail-co1nam04lp2057.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.57])
	by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2019 06:40:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=F8HUl7CBwhbzsSD7kg1Ck9OWTw4KS8v3g2egWDeOZI0=;
	b=N+pPwWrv9menfHkP4/+JoxC+nHI9LV87sN8RT9f6twiVH+XHxi62L2t+svcyYvNj90r0Hg1gCjICRmbHS70XmmLjILp7Z0v0WAU9gx12gt8dJKW8WVkTsdgBGquspMBfzACjJesOprjMNajUiik10JcAyl+yXJMbYV6ypU5e5NA=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5400.namprd04.prod.outlook.com (20.178.50.217) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Fri, 29 Mar 2019 22:40:05 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 29 Mar 2019 22:40:05 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v2 4/6] riscv: virt: Allow specifying a CPU via
	commandline
Thread-Index: AQHU5oBaiKvYEDv9E0eLAtSF7Zweow==
Date: Fri, 29 Mar 2019 22:40:05 +0000
Message-ID: <2ed844108a9e7b3c9f99d2c80d2487d6e549883e.1553899050.git.alistair.francis@wdc.com>
References: <cover.1553899050.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553899050.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR04CA0021.namprd04.prod.outlook.com
	(2603:10b6:a03:40::34) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f073f7b-3679-4dc0-4b82-08d6b4977d24
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5400; 
x-ms-traffictypediagnostic: BYAPR04MB5400:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB540062B2994202948CA288F2905A0@BYAPR04MB5400.namprd04.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(6486002)(110136005)(4744005)(118296001)(99286004)(3846002)(81166006)(8676002)(106356001)(102836004)(72206003)(4326008)(26005)(11346002)(2906002)(25786009)(66066001)(486006)(44832011)(105586002)(81156014)(186003)(2616005)(14444005)(8936002)(446003)(478600001)(476003)(14454004)(6116002)(256004)(2501003)(7736002)(6512007)(5660300002)(53936002)(6506007)(86362001)(71190400001)(305945005)(52116002)(6436002)(386003)(50226002)(54906003)(68736007)(97736004)(316002)(71200400001)(76176011)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5400;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fDywxGG7cVHjoOSEmEOc37bfUXRKCu2Mofe/J9r0AXGvomfvj6eJn/sSeFFVauMUZK+MjHxxxq56QNwqfvZ+stT7HwtYvSaEXZE6NGgjMuNKTX4V89t39HSqWq04QbBKC8AqR8WP7fBPcSo+kc2WDmXQUsx30VSfe7oJAe8ttPgGQyvKIzqWojnR7F+CyLFI77ZKUaeIrf6h1JPb+A4qo3oGzCphZwx00zbbXbikvqOUnRC07T7IF689VcuATUj92UgwBS8R6wN2QaznNUjDG/Tea4LTr3q/2RKnL2ES0vu7c4BA2F9hE5bQxzyt+Xtf2hh+udZyOJTf/9RkisJEEFkUUSY3ADg2FS3QGcikakVio2/YfRvrPOHyaGvIO1RTJsPWTUHAffOgTS9R1rqsMcEEAo5HgN/0Cez87z011cg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f073f7b-3679-4dc0-4b82-08d6b4977d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 22:40:05.4867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5400
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH for 4.1 v2 4/6] riscv: virt: Allow specifying a
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
X-List-Received-Date: Fri, 29 Mar 2019 23:34:48 -0000

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


