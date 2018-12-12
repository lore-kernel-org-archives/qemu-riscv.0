Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXAQe-00018P-N1
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:44:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAQc-00016g-U8
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:44:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAQb-0002Ax-Pg
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:44:18 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAQU-00024X-Bg; Wed, 12 Dec 2018 14:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643850; x=1576179850;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=MTgOhhUMsT7aZraYP6giKW6HdnX3J1wQteJiYuppo6I=;
	b=k9kx6HIzsJppQ2xQuJVv47YcHJ3XjG5HHDT0bdkWbu8y09ZvI/YOVkPv
	jHE9+dAODAUo8jsyDsgm/Hark/UtP220Kv28jKKywxddl1CkARw6V6w6q
	Akm7jqEG+y6NGSs6Qda5p475ysJLFgiaYh4MI/hL95NE8guVXzwqqfDOB
	QExZlUl3cAOueEPyOkSSt35LzXWm1onMIphvCtQyUXleeWpB500P/Y/tY
	moxZsvBNev6nTIm6vZ1rhBgQOSPg35yLasoe/baZnaFxBnOeaX7E7lfAm
	t9pnghg6u0bcrSGEQswNdUkij5a258IwWHY4xqzS4nVQUjtoWsMH1KVji A==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="96440847"
Received: from mail-by2nam05lp2057.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.57])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:44:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QDpXuK5hgy3y2w3yrwwpoZTyy72ju0uVWl+Nz7aBGYE=;
	b=IYmqtYm+9NAbrrexCN7hjUY/qNkIK0tqw0L2rng3q3/s85invurTHpvwAIy0vHiLqo6rp1/NMLqAWLpb1IElry8mFXjgrw+7RQRAWR69D0PdVGqwMeOA0T11sDcUkm32l6dTbXE/cweelm+8/Gx8H79daX44xONkPmc2JfmDRO8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0784.namprd04.prod.outlook.com (10.172.168.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 12 Dec 2018 19:44:05 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:44:05 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 08/23] riscv: tcg-target: Add the immediate encoders
Thread-Index: AQHUklMKGdvgfeApiUWTDtbq6VRyFg==
Date: Wed, 12 Dec 2018 19:44:05 +0000
Message-ID: <9bfe565bb23718e4d7b534925275c2b2df8c2b48.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0022.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::35) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0784;
	6:948EEu3wRDz/ydhtMK9O0itEGC0KTmFqRfjCML82SmB4X3JGltAmeAjyB5F2uZB537Khtw/4Vyda+m0t2sd14FS9y4WsygYEA3jhST1D3B9ig1PcPiIWfNBjOFbSx7gjelkeb3Z52IgwkL2bXiT3c9gf6ZvVJLrfJOmwysGwdaUM+jMipi2t87lmqgbtnhsKZNdeJSd2DCQrX0MXl5mr8iXi61ygtDpDOyyzMve6Ki9eoi8DjWUiQPP9HkkwV/xpu2uMl/H08xnd9qufz1ZXI73xgApVJaiSaZze7KgbGOsRgLUm7ONELc/KUOyy8aX/LgIxMETq4Z07KqNSIop5Y4e3LcQjFJOiyHrkiJPEsdL9RnyD+SfJ1QP2fmEzngDqOphNV5LuFXzEJHT4Ir+TJEjAJiFD+jfHDOU0wNEVrhMb9c0Syr+pPMJQZSgmGBKL7kEXTve0L8d+fMmAxVm7pg==;
	5:WsA8k8CCzh/fi+bkLLPqJ9hdpO7EFBPiuSrmfa9QPld66/IpGUm/4VLbqs6N8/85P8sxgQx7xk/8X9BUnJvQXWx22tCst3Tut6TZARMqLu19rZZJ/3RTNEw2UDVWmGLwfFGW+ygZegcqhn9+sSp+4pXH7cVNHF42xr19XpAEKnY=;
	7:wzhgUouR0ANO6lJShjqZm5vEpq5bYgQO5jANsAm3i7SX0xu/iDfS9TgKuNHAh/c23jadvxqPFjcNV59uo/a73R/NkRK3FzdCVmLSSgR7NIMGYHiv+Ma9HmjdLDzAxLvQuPSr+Svs4bQ6Quz/+esQwg==
x-ms-office365-filtering-correlation-id: 75ea9b25-ed4a-447c-d670-08d6606a2c7f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0784; 
x-ms-traffictypediagnostic: MWHPR04MB0784:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB07847D80D8260FF117A24CC790A70@MWHPR04MB0784.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0784; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0784; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(7736002)(2906002)(36756003)(5660300001)(81156014)(8676002)(81166006)(106356001)(8936002)(99286004)(305945005)(256004)(71190400001)(68736007)(105586002)(97736004)(575784001)(71200400001)(86362001)(50226002)(118296001)(2501003)(6486002)(52116002)(44832011)(25786009)(6436002)(53936002)(486006)(386003)(4326008)(6506007)(6116002)(476003)(54906003)(76176011)(39060400002)(11346002)(3846002)(102836004)(2616005)(110136005)(26005)(478600001)(14454004)(446003)(6512007)(66066001)(316002)(186003)(72206003)(14773001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0784;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: izaNjg08M8452llvyjkrBC7leYYpW5CAR7KwuVQXIs4xgqHQk/+DM6ZBq5Dr7MdCK+fwkgzkiD6aOg4FpqsIOGaF3wCtS50v4IQNepib8jMSrXwJ1oP3Eg38ey2ZQkZH+l3CI3oeiAcynUu3GIuyJdmG+PTdVdBHNP6Spa3OQM4w73JtmGGCwuButQ5YW/QGAekEMqGWybctiQwiQK+TkGxGmJv8O9q2y3vKM1zX7RoUudAwSlpF8t6b/fubz3ahXoj4zrIYfUcfhDr2pG54zHO11xWMrDg8A9OTIJXSH7ayyoi7zjvPlgI2xTuuFx2i
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ea9b25-ed4a-447c-d670-08d6606a2c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:44:05.2004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0784
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 08/23] riscv: tcg-target: Add the immediate
 encoders
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
X-List-Received-Date: Wed, 12 Dec 2018 19:44:20 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 90 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index f853d01803..08838027cd 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -284,3 +284,93 @@ typedef enum {
=20
     OPC_FENCE =3D 0x0000000f,
 } RISCVInsn;
+
+/*
+ * RISC-V immediate and instruction encoders (excludes 16-bit RVC)
+ */
+
+/* Type-R */
+
+static int32_t encode_r(RISCVInsn opc, TCGReg rd, TCGReg rs1, TCGReg rs2)
+{
+    return opc | (rd & 0x1f) << 7 | (rs1 & 0x1f) << 15 | (rs2 & 0x1f) << 2=
0;
+}
+
+/* Type-I */
+
+static int32_t encode_imm12(uint32_t imm)
+{
+    return (imm & 0xfff) << 20;
+}
+
+static int32_t encode_i(RISCVInsn opc, TCGReg rd, TCGReg rs1, uint32_t imm=
)
+{
+    return opc | (rd & 0x1f) << 7 | (rs1 & 0x1f) << 15 | encode_imm12(imm)=
;
+}
+
+/* Type-S */
+
+static int32_t encode_simm12(uint32_t imm)
+{
+    int32_t ret =3D 0;
+
+    ret |=3D (imm & 0xFE0) << 20;
+    ret |=3D (imm & 0x1F) << 7;
+
+    return ret;
+}
+
+static int32_t encode_s(RISCVInsn opc, TCGReg rs1, TCGReg rs2, uint32_t im=
m)
+{
+    return opc | (rs1 & 0x1f) << 15 | (rs2 & 0x1f) << 20 | encode_simm12(i=
mm);
+}
+
+/* Type-SB */
+
+static int32_t encode_sbimm12(uint32_t imm)
+{
+    int32_t ret =3D 0;
+
+    ret |=3D (imm & 0x1000) << 19;
+    ret |=3D (imm & 0x7e0) << 20;
+    ret |=3D (imm & 0x1e) << 7;
+    ret |=3D (imm & 0x800) >> 4;
+
+    return ret;
+}
+
+static int32_t encode_sb(RISCVInsn opc, TCGReg rs1, TCGReg rs2, uint32_t i=
mm)
+{
+    return opc | (rs1 & 0x1f) << 15 | (rs2 & 0x1f) << 20 | encode_sbimm12(=
imm);
+}
+
+/* Type-U */
+
+static int32_t encode_uimm20(uint32_t imm)
+{
+    return imm & 0xfffff000;
+}
+
+static int32_t encode_u(RISCVInsn opc, TCGReg rd, uint32_t imm)
+{
+    return opc | (rd & 0x1f) << 7 | encode_uimm20(imm);
+}
+
+/* Type-UJ */
+
+static int32_t encode_ujimm20(uint32_t imm)
+{
+    int32_t ret =3D 0;
+
+    ret |=3D (imm & 0x0007fe) << (21 - 1);
+    ret |=3D (imm & 0x000800) << (20 - 11);
+    ret |=3D (imm & 0x0ff000) << (12 - 12);
+    ret |=3D (imm & 0x100000) << (31 - 20);
+
+    return ret;
+}
+
+static int32_t encode_uj(RISCVInsn opc, TCGReg rd, uint32_t imm)
+{
+    return opc | (rd & 0x1f) << 7 | encode_ujimm20(imm);
+}
--=20
2.19.1


