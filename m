Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhOX-0003cr-5V
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:20:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhOU-0003aL-Pq
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:20:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhOQ-0002m7-3l
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:20:34 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:23477)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhOA-0002NO-4U; Wed, 19 Dec 2018 14:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247214; x=1576783214;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=dZyIXaB23ol9DPb8iJaaW8AfzMrq5ZbzM2reXdDor2g=;
	b=Rg/rI3hDZtsGmbw4vmb+lIuwIdNffhyTPzHPl6GkF7oZjBz7gARl+hCL
	jJhKVrx8eG9+CBATYJtZDO3oyZMgeudP8RkJaPVn0lLrhPS5a8N+MXSX0
	yHw4amReBhIaL+csGLSuuc1IEg1OWTzsattQc5kmXH/2W5dtFITo76jbw
	LxfuX325A8/2UyjqUYC5a/Vt2xGBqYlx9GTZTSW+vekKcN/OAFEZFcGMu
	Nu237VbGpuKSv3E+W2smAvj9QHYwMY0u2zlUbxoqBWqlgqB9yK1aO08Td
	ClCmHJOyA53CbyFSPql8Ir5wv/hGE97IlBVx9Dqls3YMgItBBWJOd9Xvh Q==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="201718538"
Received: from mail-sn1nam02lp2053.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.53])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:20:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8FVwTkJOpMmudwtXo3e2FtfvebHWPYIt57WwLmoO1GU=;
	b=gWOE+S3YRyn/ZH5oJLkoRai5zGLBbq/L7U05nQpGHwApk5Nb3BKHEFu6jB2Mit5aKVYwwzjPgxBn3EuwlgcM45/E7c5xUPO5jk6i848bLEVaYO5kJv2AfUaRtNMrvVy6LBf/pS4ohtwqF3WUt3VZR/SXG6hozXSdKSa0vtp4A5o=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0848.namprd04.prod.outlook.com (10.172.168.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1446.19; Wed, 19 Dec 2018 19:20:09 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:20:09 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 22/23] dias: Add RISC-V support
Thread-Index: AQHUl8/b1SDF76zm30ybsLvCas49QQ==
Date: Wed, 19 Dec 2018 19:20:09 +0000
Message-ID: <caa478c8987d6042434bb9582017cdf0ea192208.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR02CA0016.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::29) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0848;
	6:SCFfBO2+PdCrC9CiTo9pid9+knbPCB074n2q8/Av5HpY70ExpQyBNuBhx/GTkdU3DRvmvBzqVMd6gBf+c1UgI0qfxq+xu+OFqSDXPAfNFWLQ3B6ntwPzoGkfGYiEsA6HxrF1CNS+VmvHYVBkoVK1sV17Mf9Z/GpZ6NTcsdOJR+Otwz7hwsIxZ81XKZBXeoI4FENSpiT1uPQzswdQqSpglC5wj1kutSDaIf552XnvylO8WeyGg4vPaQW0IzC/lcw0OMwv13RBv3GGYC+WCPMY/WA/FFIw/OGcfALRHAtUduCMuVlnk/GOk3AGdAbli2D0ywM5VdQwABqPh28Cfv+oOjPHgRmqNPevoJifwsTGplkSDywEd+L45Ff/tl8i8vtbq+NH7Ula1vD58jShD7OnJf38gDXUujnt/+b5QMlN5cAwzgFxvLkyzCE2AiKAD2k80k/lzUZwj+OnfKAjM6SQEw==;
	5:G/ZVTyCd2WLFldZ9YMxM+syuy9XghszzJvOh231XMfwfIBGwS0qvJixn0rytGEbEZk5MsihK6jRymjte9XOZovNBKRo4JxuJ9a3r3Ssu1+MPZ7kobftlSlPS8BHPaZGZ+cXvBRtwtWj0HKV7iul2Xg+8o/TOeBofEjnHWauwZiA=;
	7:miEw3J4ateO5du/+JnI7i13N1tX5ZIdM3pN2s2CxMHAo5gmx1xm4e5cBl+PTwkp0+ZzYmlIkyIaRW1Vo2iL9q47miexY1oxtD/sF8M1IH9ta9XvUk9FnRTyD5UhmfwJ8XQf8sbMRLpotV+AlVe2V1A==
x-ms-office365-filtering-correlation-id: 3e1793cf-838d-4130-4e09-08d665e6fdc9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0848; 
x-ms-traffictypediagnostic: MWHPR04MB0848:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB084830B35995C0C09CF9898190BE0@MWHPR04MB0848.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0848; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0848; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(396003)(346002)(366004)(376002)(199004)(189003)(6486002)(14454004)(4326008)(72206003)(8936002)(86362001)(2501003)(50226002)(71190400001)(71200400001)(97736004)(6436002)(8676002)(81156014)(81166006)(36756003)(68736007)(25786009)(5660300001)(478600001)(118296001)(105586002)(53936002)(256004)(305945005)(7736002)(6512007)(316002)(44832011)(39060400002)(66066001)(54906003)(110136005)(2906002)(52116002)(6116002)(76176011)(26005)(186003)(102836004)(99286004)(486006)(446003)(476003)(6506007)(11346002)(2616005)(3846002)(106356001)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0848;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: JqRXrhWqgz2LiozpYPfELGYdKPWZ67Q5dFgYxcPiAtXB8+JibK7kZ14ax05OGwbHMMRyK+Cq7021D6cd4LiWnyy0uww3GrMHoHl6EO4+fTXRwBM4NbPlX/FU3EBAsC/S7JMEeORiwNRS0X/q9yKNVIQaVKN1r1rb83WcAZcHWArgVcLqRd6+cUU83o7/eM65nQqTdGeZez1IB+lfFRFA0z6/WACvZXjXsVra8bWIPwCHVNKRyiKAN0MV+PRUt4iX5/pM7x/mvM/qrJrsE/blF0c34HO9QZpTE9CI6jjXOh1+ANO22UlmLX1B2fXXwF0t
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1793cf-838d-4130-4e09-08d665e6fdc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:20:09.7188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0848
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v2 22/23] dias: Add RISC-V support
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
X-List-Received-Date: Wed, 19 Dec 2018 19:20:35 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/disas.c b/disas.c
index f9c517b358..d9aa713a40 100644
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


