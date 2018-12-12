Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXARY-0001zH-6K
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:45:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXARV-0001wZ-8p
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:45:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXART-0002j0-Fg
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:45:13 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:5210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXARN-0002er-7J; Wed, 12 Dec 2018 14:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643905; x=1576179905;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=eHFMdrQGsbm5bCRWozxtxGTOXfHdGfhd9rGDDpHy7Xc=;
	b=MZcOnE4w3UczvmcybejVN3zMzLiiEiVlX7mfXuylq4x0M9JOYHgGlstU
	42wht4E//G5OGcFSI1zflKkmMfNFqJ9uqWMSKh0PeVmj5VbRXh6Nrd+U6
	XOCRpILZfOvL8yCnR0NmkFQNq8giJZfqKeoSESDpSuMQwsDc0OqCvUioh
	rTcB79lecqROYegJmJPni3mYTUlJP7M3cKHBeS2GUoLkxJXG7VkQxVNHF
	w9VtMuV0qxCF/qZVKZr6LuxVC6cUh3ioP8AiOV9Y4TTK5xX6ciKRMQT60
	CWEYY1q7sD2uE42L/STMO+Zj7nDRtb0PEwT5WxhagzPj+g2srCmuxcLAc w==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="97665514"
Received: from mail-bn3nam01lp2055.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.55])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:45:02 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wu+T+hRonPCtKQc4NP7YBmkkqD0aNF5eDgcHVA4Q17w=;
	b=nbRnlbv7kZOLZY1MmvbkTp49QS44YmOL2CItHi1Cdx2zdmfgFVk7+39k0JCZNJn81hPib+6rqp2ZPUfewjiW4z4wUPXCYpF2PxajIH1N1uleXVSjK4s/vHo2wIY5fYWgiOCnp0iwhr71oiplGUOdE2rOQS2EdrLXse2dha6c6lI=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0512.namprd04.prod.outlook.com (10.173.49.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 12 Dec 2018 19:45:01 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:45:01 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 14/23] riscv: tcg-target: Add the add2 and sub2
	instructions
Thread-Index: AQHUklMrr/TIU+j+dEGp2QxeqqVmFg==
Date: Wed, 12 Dec 2018 19:45:01 +0000
Message-ID: <fc68dfb190490d351171183726d9c9234fff4cd3.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0030.prod.exchangelabs.com (2603:10b6:a02:80::43)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0512;
	6:U+46V/oIPStsn/0PTPvyw1S5+rK77jHE/YvZ+SwS9Lb+GX35hEkQ/v1Hk00DyMaWAk/g2ppIxlJUHNWMRsZRUiXlwCGVY4MNi6lrAaIVItddhcFpP6VOFment70FvKjM0Grr4/kvDtjhE7EtWmz4bd0ANerwH52yBZRdLhm1tdcDniDKhACkY9llZN79Um2BHfqn2SYV3rHYeG+0C4AMbzEdLjFjrt4IC/Mvgo3ncYyI2W8lbRfvJjrj94WYNiSAn3jzJV8Hg0BN/q7H9hOwmOybjZ2IZ/0ZyGD+VJ0PNUsLjtpU4c0u4vz4YWlC3yXLA4xhABugWlQ8kgrrE67yojhhX8wbVoKNcWaScVazb6FDfgCoiDZJY1ZiR/0JDU/EccJ18dGKjSgcvjlHHyoSjZxKiaDgVnHXSlidumoKdzt1PFcrkYRVKi1TpjPvU3srAbUCAcPQO4JXQg71vJLuYw==;
	5:Kcbb4eIbDKKk59vx+mxHv18BPsIF5jxFmf5CCdgiOh6bgODXpb3qymSf4z1B4WbK6nGhrrQYYMsqK8m6aK6FSV765ntTMXeaa4Qgq5sQwCAR5ypSgf052rC7d/51p6rfIdbyJ+zwopRrIsR+PGP8yvPkDptlhp8pAwp8BvIXN6E=;
	7:V5jhwVzR0z4GnNhw5xXV3pAQa4ZjAClunToP5GrX11VgOTq479NOwkdqmHSYnoLA5Qoc8F4FCJOn3ZwNFbniGHMtKJKL9dXNz+7Nb/WFTd9QrF8tgiktInD+Nw+OcIYxnYUl0YWZim3kJHFQm1/aVA==
x-ms-office365-filtering-correlation-id: 712ecedb-4b80-4de2-f289-08d6606a4dec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0512; 
x-ms-traffictypediagnostic: MWHPR04MB0512:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0512BDC7D335CBB584E6CD4990A70@MWHPR04MB0512.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(5005006)(8121501046)(3231472)(944501520)(52105112)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0512; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0512; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(346002)(39860400002)(396003)(366004)(136003)(376002)(199004)(189003)(316002)(66066001)(97736004)(71200400001)(2501003)(71190400001)(76176011)(486006)(8936002)(6506007)(386003)(102836004)(118296001)(3846002)(81166006)(44832011)(186003)(25786009)(26005)(11346002)(6436002)(14444005)(6486002)(99286004)(2616005)(105586002)(8676002)(6116002)(81156014)(52116002)(5660300001)(6512007)(478600001)(72206003)(53936002)(68736007)(256004)(50226002)(110136005)(446003)(54906003)(39060400002)(14454004)(36756003)(7736002)(2906002)(476003)(4326008)(86362001)(305945005)(106356001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0512;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: WavNP/22TwCKNJd2P80guyWhpCxtlaEhC2YgWWfGCn+Gf2adb7datJwAMqp8taPdnuHi2k+olHS88Vvj47az0epHloPPvoE9ha0O3Zq4wAGiPO2oD+IX24qQwnVYRej/wcHje3x8nrL4St7+6nQh9HV7uQsKo2keLEXHgoy+03IXtQS9r5uXk525pUpgPOrIN6NUT5qE1ZkvMhaPgdnM7mk11E4eQWVoBxt9Se7H32RTICxl5aFs+feeL3y1CjqmCGeZKpHqiumnaoKO6IywAsVB2CqdrVCMGOn8nPvaJWahgxPgGk4jEM65My3du9ju
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712ecedb-4b80-4de2-f289-08d6606a4dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:45:01.2177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0512
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 14/23] riscv: tcg-target: Add the add2 and
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
X-List-Received-Date: Wed, 12 Dec 2018 19:45:14 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 57084e747b..586a8917c7 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -681,3 +681,58 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, T=
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


