Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXARL-0001nE-BS
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:45:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXARH-0001jd-H9
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:45:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXARF-0002bY-Jc
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:44:59 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:5191)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAR6-0002V8-OH; Wed, 12 Dec 2018 14:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643889; x=1576179889;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=sOqf/6FAWgmTTeqIztojf6eWR7E2llv4rVEW+VDEj2c=;
	b=l1CaC4GWL2ODERLDXv5AIS+aJyDv1wEkbG4QqEPY1w0SfZmNxZTOJib2
	kyAv+hyEDPbUkHYuljfG4xm+zCeMO9c2zHLURr5LJlWcj+O93ZDCCL1lP
	Eokw+ZpRykEBg6ETPzi4bx+VF/qbULowHqioYLsMyD+OHx9OycmptqJX+
	A5WA4ibBFfO4yhMRP8ZnAbvfilbSNEZxtK1wTVnuxdg2PIXnh10w4OVY+
	V3L/A+S6YBOfZ/fPtmbJZWdxjUVpJ2knIxKUg7idik73fIg30dT9FxHRL
	pGzi7xNXhMR03wdCh4z045k9rIhDokDtIPKR9y+/OfPlQonkaP4RZ5mz9 w==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="97665499"
Received: from mail-bn3nam01lp2055.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.55])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:44:44 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OLnS7SYOjNlvKzEfcDQHAwixJVmzHxujZR/twjVJJ3A=;
	b=RbGBZqVoFkAPRpQz3ivTJPY4rMQVch62kKyMHn7/TJKT3GnxiceCM24q98nwziqW8wOzgRkmbLEKSOwCNCPdi5JkY8u2NK7HMoOzkFsSLhU+EoWZfb9rGeS2g+r2Wjf0rGpytp9xWGKtPYlLNs9Rho6Fvqasc2wu6rBT1MYOwfM=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0512.namprd04.prod.outlook.com (10.173.49.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 12 Dec 2018 19:44:42 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:44:42 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 12/23] riscv: tcg-target: Add the extract instructions
Thread-Index: AQHUklMgWSVy+h7Cr0uKkEpTIR0RhQ==
Date: Wed, 12 Dec 2018 19:44:42 +0000
Message-ID: <3e6d49cc45e66c02130153ea818bedeae9995776.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR08CA0036.namprd08.prod.outlook.com
	(2603:10b6:a03:100::49) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0512;
	6:1+Tj0cMfet7lvsXS/C4moSVpXlIsGVBltLWzmfLO3zNosiUf1RyvL4SPKLxIxJwdPCIHvWC62Doz1GIuL6lQHBkgPVD3XF0KP+tjKZ+aL3HGxZA3RjdP5iRm18DGJJ92tjrITllB823orfdexRfBPwYPzJwJY5FHGhlTFAc055zORpSDWeqVN1/WKECGfkwpLMDEo2SaACdXyz8+W9yku+iD0KQLkkTxp2RoYXVVSODcxM4tDLKLeCV2Y/wm/XLLqrJnO7+F+rLCCPB8Y7+GRoOEEfLy8xOCcWXGqy4FuFf433FtPJnHeauBKTTzA/SNk2N8XvUG3dLAk8ru3oMiNIPCKNCtJ2QY+75EP2GKu4OL0YcsJoEmi58/D64qo4P90UP9ldtIbYNw+9T3vSdgtZuVKPd8xSBkdRCvJcthrjb/pyeFlU1yMyMwWEFy3GM4+kPCKbImhi7m7Q91uy+bgg==;
	5:vR8hTIUIxDMyzD5nMHR15Jmcmji/cZiFsTmjo4Hb4sf/sQ+IqRjnL/bCv1bvi/qXtHueyPezO+esY3fCQfoDKRMZdD1qoAbnbS59XQ8WRa6yg+EX8AAVOtPgcdTg/V6EYao0o7LMkxzidddo7Ym6MMPBKhbYMu+ypRiFx1or540=;
	7:AGYiQIWGANKbHKEcoyXUVxqvu4ggKfH4upcujG8PSDQlzyz1hei2hF1E0eqWvyCY8ocSlcXASP46rzHyDsjWR7u8w9y13lFCz5tFqRzqjdM1pMvskROE8UawMQEaTg/Htj6Ri315GAg8OICbWqviVw==
x-ms-office365-filtering-correlation-id: 22c059dc-801e-461d-b84e-08d6606a42f6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0512; 
x-ms-traffictypediagnostic: MWHPR04MB0512:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB05125A28A30D25C48DC88DFA90A70@MWHPR04MB0512.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(5005006)(8121501046)(3231472)(944501520)(52105112)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0512; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0512; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(396003)(366004)(136003)(376002)(199004)(189003)(316002)(66066001)(97736004)(71200400001)(2501003)(71190400001)(76176011)(486006)(8936002)(6506007)(386003)(102836004)(118296001)(3846002)(81166006)(44832011)(186003)(25786009)(26005)(11346002)(6436002)(6486002)(99286004)(2616005)(105586002)(8676002)(6116002)(81156014)(52116002)(5660300001)(6512007)(478600001)(72206003)(53936002)(68736007)(256004)(50226002)(110136005)(446003)(54906003)(39060400002)(14454004)(36756003)(7736002)(2906002)(476003)(4326008)(86362001)(305945005)(106356001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0512;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: bNXaR90eXt3U0m0NL4a2bPqfxsq2BYHvueT2k5NMOcAA8U5cbBJuG7JDydoGraFDzJpVyXRpGqVBMz8cGNLPb/myS60NoGSRv5pzDva7WqzKz4fKO9am1PriUUqtjKXqgTc8XXKDUvOpBfJg3iJcOsPEKhbJum9Mh2WdAvpDUcRi/D6Jvvmg66wN1FXVtFs2sJlMLbqvS45xZzTMBNMO1sGa3Ao9FN1IfcuDexj+Wa7JLsIYXmg1Uu7UXsVACFZ2AxGHR3gFSWhCSkfcyy4+o/Fz1TD9vmaX9S5LsTSCBS3kUVBDg847FSUPYy03BtF+
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c059dc-801e-461d-b84e-08d6606a42f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:44:42.8269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0512
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 12/23] riscv: tcg-target: Add the extract
 instructions
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
X-List-Received-Date: Wed, 12 Dec 2018 19:45:01 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 9baa8a19c4..6d63541da0 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -582,3 +582,37 @@ static void tcg_out_movi(TCGContext *s, TCGType type, =
TCGReg rd,
     tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
     tcg_out_opc_imm(s, OPC_LD, rd, rd, 0);
 }
+
+static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_ANDI, ret, arg, 0xff);
+}
+
+static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
+    tcg_out_opc_imm(s, OPC_SRLIW, ret, ret, 16);
+}
+
+static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, 32);
+    tcg_out_opc_imm(s, OPC_SRLI, ret, ret, 32);
+}
+
+static void tcg_out_ext8s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 24);
+    tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 24);
+}
+
+static void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
+    tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 16);
+}
+
+static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_ADDIW, ret, arg, 0);
+}
--=20
2.19.1


