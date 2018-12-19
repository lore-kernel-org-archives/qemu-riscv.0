Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhN9-0002PY-J9
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:19:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhN3-0002Jp-SI
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:19:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMz-00018r-Jj
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:19:05 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:15922)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMq-0000za-Vt; Wed, 19 Dec 2018 14:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247133; x=1576783133;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=s3z5m6AUZR7AsVwduBIK4Ymvnttj1C/wfw10k1m0pWY=;
	b=GM9dg19juW9xnenVq+uaD0essXR2YF3YuSqXgcXselSm2E4AESSdcdhd
	EsNSSE9TfahlfkRhywY6+uFcVrizeWLS9qqEPUxfdy1gIBl17YE4sUP87
	XjximqmWnhddpdSkY1DJaonCNEl8pzwRTWjEVgLjosCeqKu9j6zh2YL8P
	vXNnBpOrJ5RmHbDLmrjsOKCDgjBaVkPty38CGTDw0Fhjx1EmSwbnmKfOP
	Me35azHmr2SPmYdyIgReA3BMVuxbD/KcQCqpmRAH+yMCOW4KFiY4LU1dR
	LH4mpwbu1YUwwJQWbZRQmlxWXxj0N7WzTqFNZt9um2SHn+/Gp2DWshWtF Q==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="101923937"
Received: from mail-bl2nam02lp2052.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.52])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:18:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NorqcLcrSzHCYtSJaYTguf6DoNP2ujHYKY7v+RrgHtw=;
	b=HlX0CWzYLrunXZwNLUS0lmppttYmUF+e9ObwAa5QORs8ILuFi21TCZV0YYdmcb2S17rDeufr0h0DvYW2uWDzbQ5pAZyoJp9D26hCGRKSv5Kn32Ux5QAyDSrAy9ovVl1YoGoa0vY3PNYhy6ZTuav7nQFQrvdS6BhtuU/Whl1ZdKU=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0848.namprd04.prod.outlook.com (10.172.168.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1446.19; Wed, 19 Dec 2018 19:18:49 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:18:49 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 14/23] riscv: tcg-target: Add the add2 and sub2
	instructions
Thread-Index: AQHUl8+rklGibwjCLkyd53SPuYSnSg==
Date: Wed, 19 Dec 2018 19:18:49 +0000
Message-ID: <5665a57809e32b35775e8e98fdab898853af37b8.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0032.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::45) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0848;
	6:cP99w3W+QujJbnxaPwKFvOfPHQNHwd5E4mA3wzveQWMfdFDv2Wm+asF8tt6Z3hCmZVw6J+JbqNhW7IEfAM+REO4bWAkN0FkvFphS4L/ydvCsflEMX0UyN9inTSt+bGKBCHzApGLaAmXp0Zh097uciVDltP5pXr9MTk2N87TFWr5uuKRnz+5hawVTj9xYzmDD/4EgCiY6YJwtiuGuYrrlVG52CwC/By6Qvm97WyTn+Zbb/boNPYdD+LYldibgnTLFjScSPT9+v1gKW11A6EaKVs18S4cVzqXG0FJWiaEeVlR4aQabSbHPbovPX4+9a/pdqpkssQrMJdJTLWGZ8odF0v7TvgICrc2JN6CAjQG3m0dNH3/vmiobxnXBATPOhnu80ALBfVT0JxCneE8LpzY7tsCPbJ+UEePncPoIOFJ4dKCETunaRdU9TwbVWDjqpZv5Ia0zMON6SoKnZHuavYa1VA==;
	5:QiIFbZeOEDrr54+na031ad4gJglwi248SWLdtqGdjyLmrAycS00LaOG9EncGqmCErP9ZSfXXWF3vrfQ1mKMQprXfwEWWMOhFubdgPuoe7DYn++AYe9ftIBaM0UF+Usem+zd03eZ0F7hbGaxfy3EeJMS7Kp9strJ1cUi/Stxq0Fc=;
	7:y3eyt/3an48OLIo++i+OoiZsmWWLr1DW1UcCLIo3TyYXEQmFMWOLt+GuzJtc2rCp8SPpIJYwTREgt9fXw68SktXIfavXvyApZps/vGf+5PwwfpME6cn+0Y0ln3Tr8pV3GyMey30viEONBnUIwxrRjg==
x-ms-office365-filtering-correlation-id: 7fcbdee0-b5d0-481c-6b86-08d665e6ce12
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0848; 
x-ms-traffictypediagnostic: MWHPR04MB0848:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB084891F33C06169A0B0290ED90BE0@MWHPR04MB0848.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0848; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0848; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(396003)(346002)(366004)(376002)(199004)(189003)(6486002)(14454004)(4326008)(72206003)(8936002)(86362001)(2501003)(50226002)(71190400001)(71200400001)(97736004)(6436002)(8676002)(81156014)(81166006)(36756003)(68736007)(25786009)(5660300001)(478600001)(118296001)(105586002)(53936002)(256004)(305945005)(14444005)(7736002)(6512007)(316002)(44832011)(39060400002)(66066001)(54906003)(110136005)(2906002)(52116002)(6116002)(76176011)(26005)(186003)(102836004)(99286004)(486006)(446003)(476003)(6506007)(11346002)(2616005)(3846002)(106356001)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0848;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: q3qOdSU//NaMDtV38qdLowZ7X20Xn1jyaOgM74yxk5k05LgSSR1Pbm/cpjc5Xc+b+xH5JZP1aYAeyxXqXnN0NZZeONWrxiwD+P1kXbNLXlb/8Szd9oUhAQ7kd55Z/2LDem9Kw4xwY3vh/OqW1Aqr+OABO+3pqWFnHd5804AD5eIicWkgsAc1SiS2cXg2HhXYpAX19ILj951VcM7MLTQtHisajhJ/DXXC4HYo50Y3qgtPoud07lMvXyeXJ37yO1EkFfBFxtRQo2J8JnSMGCW+n/gfV7QSgCihxuOXhPXxkU210nv2p/1GUOS3NaYOz24e
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcbdee0-b5d0-481c-6b86-08d665e6ce12
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:18:49.5682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0848
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v2 14/23] riscv: tcg-target: Add the add2 and
 sub2 instructions
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
X-List-Received-Date: Wed, 19 Dec 2018 19:19:10 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 65718df7ad..5da850b957 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -695,3 +695,58 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, T=
CGArg val,
     }
     return false;
 }
+
+static void tcg_out_addsub2(TCGContext *s,
+                            TCGReg rl, TCGReg rh,
+                            TCGReg al, TCGReg ah,
+                            TCGArg bl, TCGArg bh,
+                            bool cbl, bool cbh, bool is_sub, bool is32bit)
+{
+    const RISCVInsn opc_add =3D is32bit ? OPC_ADDW : OPC_ADD;
+    const RISCVInsn opc_addi =3D is32bit ? OPC_ADDIW : OPC_ADDI;
+    const RISCVInsn opc_sub =3D is32bit ? OPC_SUBW : OPC_SUB;
+    TCGReg th =3D TCG_REG_TMP1;
+
+    /* If we have a negative constant such that negating it would
+       make the high part zero, we can (usually) eliminate one insn.  */
+    if (cbl && cbh && bh =3D=3D -1 && bl !=3D 0) {
+        bl =3D -bl;
+        bh =3D 0;
+        is_sub =3D !is_sub;
+    }
+
+    /* By operating on the high part first, we get to use the final
+       carry operation to move back from the temporary.  */
+    if (!cbh) {
+        tcg_out_opc_reg(s, (is_sub ? opc_sub : opc_add), th, ah, bh);
+    } else if (bh !=3D 0 || ah =3D=3D rl) {
+        tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
+    } else {
+        th =3D ah;
+    }
+
+    /* Note that tcg optimization should eliminate the bl =3D=3D 0 case.  =
*/
+    if (is_sub) {
+        if (cbl) {
+            tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, al, bl);
+            tcg_out_opc_imm(s, opc_addi, rl, al, -bl);
+        } else {
+            tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0, al, bl);
+            tcg_out_opc_reg(s, opc_sub, rl, al, bl);
+        }
+        tcg_out_opc_reg(s, opc_sub, rh, th, TCG_REG_TMP0);
+    } else {
+        if (cbl) {
+            tcg_out_opc_imm(s, opc_addi, rl, al, bl);
+            tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, rl, bl);
+        } else if (rl =3D=3D al && rl =3D=3D bl) {
+            tcg_out_opc_imm(s, OPC_SLTI, TCG_REG_TMP0, al, 0);
+            tcg_out_opc_reg(s, opc_addi, rl, al, bl);
+        } else {
+            tcg_out_opc_reg(s, opc_add, rl, al, bl);
+            tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
+                            rl, (rl =3D=3D bl ? al : bl));
+        }
+        tcg_out_opc_reg(s, opc_add, rh, th, TCG_REG_TMP0);
+    }
+}
--=20
2.19.1


