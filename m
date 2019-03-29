Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hA11W-0000sY-4H
	for mharc-qemu-riscv@gnu.org; Fri, 29 Mar 2019 19:34:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA11G-0000jn-OX
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 19:34:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0Ad-0007i1-I8
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 18:40:20 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:2086)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0Ac-0007g1-63; Fri, 29 Mar 2019 18:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553899233; x=1585435233;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=6h2pgvRwrM4rvkKa/CQLxhPJE1tgk/3hv2eo2WBR1a0=;
	b=Wd1ylOyRffPGq+C1M9RYg+/pqbum9WlOEg4RIa7ShbsRmtYEd7gtUHKn
	jyiTMSir2ieDN0Dzb+tix+5OuvIV8cQUCfQOo6MwEBW1nX00fl+6pDg4h
	29y649U6xVG/QOP+LKCr9qj/btT/zo2461BYwRaG7g7hHvzx/Ytpy5kTq
	Fbt1apuV/kdnrYcJHJ8bAq39DLwy2wZsHKWdw1JSPSf+8UwYee4I7+Yef
	lUgqCJeuSzSmU4RySPUBB+rvOulkr++QWdu9Q9KLH0WAOBTmlsnFfoeZ4
	/1mzhs5y3HFrXnr9krkLuZ2ZPratDYW13FmOYEW+qfcgWSMqIZcO7JSFf w==;
X-IronPort-AV: E=Sophos;i="5.60,286,1549900800"; d="scan'208";a="203406028"
Received: from mail-sn1nam02lp2054.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.54])
	by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2019 06:40:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yNiVaYFhIzAH8ajFqgWfw4ldOwuhIl0SJ0+MB2YcosA=;
	b=S+d36nJEIY2hExGlY/UBlmezDTAqeW+BkW7t+HaJ0YzFAqV0Y/h6Dn2KbZ+CuwCwZQn/rNDz+WXaRXQd6IIapDQFKYdfUOGdllgAS/ZLPQ6LMHLTFcxODVKjxRs+08aMNAP+vCgfrM/vMBl9YSLqAsXsut9kHlfyvcfZbSOuku0=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5400.namprd04.prod.outlook.com (20.178.50.217) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Fri, 29 Mar 2019 22:40:14 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 29 Mar 2019 22:40:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v2 5/6] target/riscv: Remove the generic no MMU
	CPUs
Thread-Index: AQHU5oBf/CsZVLHY7EG50dY3uAhmjA==
Date: Fri, 29 Mar 2019 22:40:14 +0000
Message-ID: <25d6ef1788eaff99a4e3e4f1b8e1c8505f4d298c.1553899050.git.alistair.francis@wdc.com>
References: <cover.1553899050.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553899050.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR07CA0088.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::29) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a50e83dc-3250-4084-92a1-08d6b497823e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5400; 
x-ms-traffictypediagnostic: BYAPR04MB5400:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5400CF003597C104F0B84A2D905A0@BYAPR04MB5400.namprd04.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(6486002)(110136005)(118296001)(99286004)(3846002)(81166006)(8676002)(106356001)(102836004)(72206003)(4326008)(26005)(11346002)(2906002)(25786009)(66066001)(486006)(44832011)(105586002)(81156014)(186003)(2616005)(8936002)(446003)(478600001)(476003)(14454004)(6116002)(256004)(2501003)(7736002)(6512007)(5660300002)(53936002)(6506007)(86362001)(71190400001)(305945005)(52116002)(6436002)(386003)(50226002)(54906003)(68736007)(97736004)(316002)(71200400001)(76176011)(36756003)(41533002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5400;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WOXETT7IoMYR4oRCIminR1CnyGWGbF1t4hu3TAlrHun73ZBeYcqhRhC9vY40WuTiVq8onM9c1a5tQk4XfDsKb2Z5qFGf/G8nwOkpn97MQy9drd+/NzsVX+Xu7hkQDd8sVT0CfHi/WkUy/zxahb3MNIkCBHk5Uf731wMOFaBaWRuMnoP8BQh8Zqex2CO2SED4L1f901s7aTcqmvzDzQ3BdUbvCsMqYuhV+MdTqj4m10ySaSv/SZ3n4cR/0o1dp8gnnn3bJdH+XOCSxlFEnVg6rtXJ0ZrWzOuq/IwrAao/4GHmGIkPCBv38f5sIK4Vz5KVbb2Jt0nDxr0IzAwvAatjbjtf8RkpQFYHkZ4M4LQOvcvhFgj5H9RYelz/ZZCbToVNuYI/emmG8fCb9dSWcbMu2cne/Y8QbWvDm+u8ubx1sos=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50e83dc-3250-4084-92a1-08d6b497823e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 22:40:14.0275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5400
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH for 4.1 v2 5/6] target/riscv: Remove the
 generic no MMU CPUs
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

These can now be specified via the command line so we no longer need
these.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 --
 target/riscv/cpu.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b6408e0a83..758201331c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -580,13 +580,11 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_RV32GCSU_V1_09_1, rv32gcsu_priv1_09_1_cpu_in=
it),
     DEFINE_CPU(TYPE_RISCV_CPU_RV32GCSU_V1_10_0, rv32gcsu_priv1_10_0_cpu_in=
it),
-    DEFINE_CPU(TYPE_RISCV_CPU_RV32IMACU_NOMMU,  rv32imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32gcsu_priv1_10_0_cpu_in=
it)
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_RV64GCSU_V1_09_1, rv64gcsu_priv1_09_1_cpu_in=
it),
     DEFINE_CPU(TYPE_RISCV_CPU_RV64GCSU_V1_10_0, rv64gcsu_priv1_10_0_cpu_in=
it),
-    DEFINE_CPU(TYPE_RISCV_CPU_RV64IMACU_NOMMU,  rv64imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64gcsu_priv1_10_0_cpu_in=
it)
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bc877d8107..6806f602b5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -51,10 +51,8 @@
 #define TYPE_RISCV_CPU_GEN              RISCV_CPU_TYPE_NAME("rv*")
 #define TYPE_RISCV_CPU_RV32GCSU_V1_09_1 RISCV_CPU_TYPE_NAME("rv32gcsu-v1.9=
.1")
 #define TYPE_RISCV_CPU_RV32GCSU_V1_10_0 RISCV_CPU_TYPE_NAME("rv32gcsu-v1.1=
0.0")
-#define TYPE_RISCV_CPU_RV32IMACU_NOMMU  RISCV_CPU_TYPE_NAME("rv32imacu-nom=
mu")
 #define TYPE_RISCV_CPU_RV64GCSU_V1_09_1 RISCV_CPU_TYPE_NAME("rv64gcsu-v1.9=
.1")
 #define TYPE_RISCV_CPU_RV64GCSU_V1_10_0 RISCV_CPU_TYPE_NAME("rv64gcsu-v1.1=
0.0")
-#define TYPE_RISCV_CPU_RV64IMACU_NOMMU  RISCV_CPU_TYPE_NAME("rv64imacu-nom=
mu")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
--=20
2.21.0


