Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXAQr-0001KW-Bf
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:44:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAQl-0001FG-N2
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:44:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAQk-0002Ht-T9
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:44:27 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAQb-00029x-0c; Wed, 12 Dec 2018 14:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643857; x=1576179857;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=ZOKOtV8+IzFZSdFtM8kg49hAziLkFSBQIROEtvwFlcM=;
	b=PaI7ShMGT1YZN+qV6Y+8WkfVe7OCa98zCUQVVv+n4MLmWUlcQYHE0lad
	PTwvIG2qKpZSSZ05BvXQEgbmg3mwpPiOwHI8I6BtaT84rmGffxiXGAcH3
	CZaZZSOv2qfAMNrI6fvLOnGDczIU8St6CGihSBqeO2OgGm+zFCjn0lBnL
	+SPYi9HD11eStDUn6kB2D4yMBFSO3H+H3uLXDzB26EVRMjSlZnx//ZH4P
	BT2s92ytnMDxyvdt4Ehybc0b4t+w7nDhKOJKzKgsJLb/ww3vsf35IwPGK
	OYyTH7XAa6BqEJlIvRKx6mJbZl7R/tu6iUnKn/p7h7PKmD/8Ba45cUEX5 A==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="96440860"
Received: from mail-by2nam05lp2051.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.51])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:44:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1YCpEkH3DVOoDa4Jvxqsa1PHfQ48fTq9DBKoU8N6nTQ=;
	b=BWKh3/Ly8q0AYEEj5bq6/0HogItK3FFQ+n69cIIubC+IwDZ3GgI5BgWoG3qh2aeytFa4pn5iQUBOMR/hke39VKzB7nfBFUxpUsb3RIsbBYZTAg0y/W/oVP0ZWSvBY6Spxaf1DqeVenqR8YvRin9rottxnCpdID3V2hIRu4pWS/k=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0784.namprd04.prod.outlook.com (10.172.168.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 12 Dec 2018 19:44:14 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:44:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 09/23] riscv: tcg-target: Add the instruction emitters
Thread-Index: AQHUklMPWE1yjZmXckOAPJcZwGslIg==
Date: Wed, 12 Dec 2018 19:44:14 +0000
Message-ID: <fd946eea626eee96056e9e33a7a85b46b9a21541.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0006.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::19) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0784;
	6:QdRR23xVyWxvtVMh+FCQa7BEbsBmkTX/RPsJncXKQ+n6oAu4IwnPRuJouyFaxqf9caJecfeQdKf9Ndln8tpjSW4Lb+Ge6n04250EsnM3PPAcJyS3VNsJiY/OkjaZakPY5BCLOcB+04XAWn4D62GUtNGNemjW8ORnUmorL6CywpM3jxyG6lZZBTTrpUzdnF+yNqwLbVQSlGvKSElpWsYbrLfV6oTZ/Bhub5dV3H1qO5q2dFWMwgfzpZA02cNEgvGqzAOhp+3HYmtEwFUKzZIruSflt5U6noVAEFzugUW8koWee9fk8Lr/PhlZxg7X4dDbGvTB7Q7gWJc/gXDggsZz8oBB2vomi+jz/sFwYLHcu3ZU8ebNDvrgPQhuBg4bWpW+IR8vjFAp3R9MMUceqlZO5PRy6FUQSwPIWm0xLQhRqlxR/KTA+lKA0TwqlZPPdmHhTWxXr4fr0tdotVAM567JIw==;
	5:Ri6OpvnLXitFlJfVM6PNHMqsCNYT2eSHP2gUEHghr9Bn9E5je4O1OcgJG32cfE4Ig7ac4AqB/vCfnpHLMYjdZocgR/XeIWrxqD3QvHEfpfEAvT86hyPE4YMAiS+hCGGrsHiHeZslSU+8gfwG21mCtjAnoGg3Hs8N3yg1JmkM2RM=;
	7:6AOLSuRN5CamvcERct0r0uck0qcvAN2ISp/2kPyAJ0rGSHOYEb0oxmKj+85X2hCHt5q1tRZLA5NH4TJmLwAB50UUWurstF78UNImXNj1/gswKKCURuC/pqvJNzkmQVOZebGZV7QNT/v5SQO5drdXZw==
x-ms-office365-filtering-correlation-id: 26075407-006a-43ea-4d86-08d6606a3203
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0784; 
x-ms-traffictypediagnostic: MWHPR04MB0784:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0784AD03ED991D880CBD45D790A70@MWHPR04MB0784.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0784; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0784; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(7736002)(2906002)(36756003)(5660300001)(81156014)(8676002)(81166006)(106356001)(8936002)(99286004)(305945005)(256004)(71190400001)(68736007)(105586002)(97736004)(71200400001)(86362001)(50226002)(118296001)(2501003)(6486002)(52116002)(44832011)(25786009)(6436002)(53936002)(486006)(386003)(4326008)(6506007)(6116002)(476003)(54906003)(76176011)(39060400002)(11346002)(3846002)(102836004)(2616005)(110136005)(26005)(478600001)(14454004)(446003)(6512007)(66066001)(316002)(186003)(72206003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0784;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: GdRNYDIPw4U7IwuC6aZrHJW+0MNLouWKSYmAqwdgbdYZ9bzntWIQGGRxE4J0rqfZ+6D6ULCtd8RhE7IXi90xBUu2zmga6gUMtp21iybnrkDWVUUt98zu0XV3CQEaZZQssDCAlESG2BH7YVxFkISyug0Ery+VRJcYfYgE6kJsmWTNccolC8KE6IbHwHEVW4cjimkc7S7Q7PxOXJoQk2WSMHVNGBegmOkaTrfEHE7zULfrf3cHmXalBh3O7BnNAFd74CDozyy/9oiMjMcqI1YGfcNX6WLNZV2GBeyARnFCtevW0DZBTPbNjXLhW3AzFSeo
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26075407-006a-43ea-4d86-08d6606a3203
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:44:14.3412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0784
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 09/23] riscv: tcg-target: Add the
 instruction emitters
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
X-List-Received-Date: Wed, 12 Dec 2018 19:44:31 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 08838027cd..d198cfd5f7 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -374,3 +374,51 @@ static int32_t encode_uj(RISCVInsn opc, TCGReg rd, uin=
t32_t imm)
 {
     return opc | (rd & 0x1f) << 7 | encode_ujimm20(imm);
 }
+
+/*
+ * RISC-V instruction emitters
+ */
+
+static void tcg_out_opc_reg(TCGContext *s, RISCVInsn opc,
+                            TCGReg rd, TCGReg rs1, TCGReg rs2)
+{
+    tcg_out32(s, encode_r(opc, rd, rs1, rs2));
+}
+
+static void tcg_out_opc_imm(TCGContext *s, RISCVInsn opc,
+                            TCGReg rd, TCGReg rs1, TCGArg imm)
+{
+    tcg_out32(s, encode_i(opc, rd, rs1, imm));
+}
+
+static void tcg_out_opc_store(TCGContext *s, RISCVInsn opc,
+                              TCGReg rs1, TCGReg rs2, uint32_t imm)
+{
+    tcg_out32(s, encode_s(opc, rs1, rs2, imm));
+}
+
+static void tcg_out_opc_branch(TCGContext *s, RISCVInsn opc,
+                               TCGReg rs1, TCGReg rs2, uint32_t imm)
+{
+    tcg_out32(s, encode_sb(opc, rs1, rs2, imm));
+}
+
+static void tcg_out_opc_upper(TCGContext *s, RISCVInsn opc,
+                              TCGReg rd, uint32_t imm)
+{
+    tcg_out32(s, encode_u(opc, rd, imm));
+}
+
+static void tcg_out_opc_jump(TCGContext *s, RISCVInsn opc,
+                             TCGReg rd, uint32_t imm)
+{
+    tcg_out32(s, encode_uj(opc, rd, imm));
+}
+
+static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
+{
+    int i;
+    for (i =3D 0; i < count; ++i) {
+        p[i] =3D encode_i(OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
+    }
+}
--=20
2.19.1


