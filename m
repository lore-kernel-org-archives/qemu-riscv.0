Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQEq-0006Ya-FA
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:35:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEn-0006WP-3V
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEm-0004N0-8b
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:49 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:51936)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEg-0004DQ-Eq; Thu, 15 Nov 2018 17:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321343; x=1573857343;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=BhyV9lNqqRilJEUZhvwqAReSPB5cixjLgz7ilsbS8/k=;
	b=qkxArqeqY6Lajcv1ApE0U0VRqJO/lQ7u9ZXdeQMJKChNrvGrC1aLByAA
	GXdDwHxKoiU7f0fjfvSru+UsmmVlxkEkqoA6PnqSxFrVl40jIlpOtrKQa
	KKzUYcHxkymzYM3ht74bc5+5iMP+OWOGZri5YmMeaxM6VOgmEOXR9AK48
	+b4wED0d3L6JQnG19PbJ9LAn7XXp+7ZQksZrPDAd1cChJaLRdAI77n6y3
	FXhTMI5OK2uRw1VqEDjQdxz2vizsFIdVtKsMlHKdImGR7urKAJ1vuvYrO
	g5hssVpni75MxAwypbsyDrINidaKbpaBsXCx5kTVTqTGcAV/11idyviCZ g==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="99165978"
Received: from mail-cys01nam02lp0049.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.49])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:35:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xSWx3Fj05GOAU/fJ3C+QpBnlwDbMjpAjdRi2lx4jWmw=;
	b=ItkntzRkwAnDk/ubWs4r5nltZV5FXiCnCCu4RO3k0xpaqasirwweqAtfTTuAbHFdhreWm8XPYW8x9Ke8GDoXEbJzgCgv028ehGewhpe0OhA/QBvXMk+MvBJ6iQfiEosnDhyzY24PV9TgaAutGTCItn5sh+fR2cZEWvFjWNWYWhM=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.27; Thu, 15 Nov 2018 22:35:23 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:35:23 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 10/23] riscv: tcg-target: Add the instruction emitters
Thread-Index: AQHUfTN/CP7mr4nG70ueoLUfKOBFFQ==
Date: Thu, 15 Nov 2018 22:35:23 +0000
Message-ID: <94fae434261439eed18b5ecffd2e8c959f80cdc0.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
	6:EU8mOpjGWYUO+RSsNiuFzidXHk8GUdcuY5RHP4Mb7Oj0enqWpfPICmVDdlal4qsfAoM0dVqB6/VcClD3B8g5O2FXPjgbXa4kg5TS7y/ZuGwSFedJT+xOKibvZTSM/tTEH4woaQ7fEAYVD1syxfk3CpVvh/VVxckkx1LoC3xXV5/1UwRgfvn29MWXuDL+WFuHSnOH2Qo0A9deXIxRcQOsaQt9wXkVBr631eJHEtpIetv/9ev6EwMWBDyRYmwFDIWOARxdnroYpzDeo+CRB06AcASoQvSr/QOuktjLfONokL8kQ8R81mdVROR4w2oKqDP3VQwwfLH1celOJ1YFIk+mkvGM1IHZcaj71tViKIaE/gxVYJpC1DrBT0D4LhrB6QiZdINP7HhyDU6Mcjp5lfqp4wHHxQWgC72g/UKXLO511rsGGxLZquim0CdzgZhgO0lwsQivMUSMWVsJr+elRLv07Q==;
	5:amIIAwpF+vfdxPXTkPNyYKGgyeEOxtOA3LG/bwCakOQprEF8QXs2efzrKSCtnymomMwmEQRdqHkAooMzFWk38Z8Cp2GzO/1SOkfitHI3FsaWkZG00lW0C6Rnf5pi5D5YfN9G9GzN3F68QvutsEcOq/1byjVaCBGSsO7bPmv01/k=;
	7:5eVwrv9BxOq7jM0TenKvgDQuDxf2enON5XBv+m0ZvHhvkJiaIaHjWyHBPcI0SgSKlu9V/ZDh5hjzsvILrrKBVCScG1quOLHWOa2Q8U9zRYYC8/ipuWT1fwo91PrdT4+wvf5HElk27bYTHdTHRaRCzA==
x-ms-office365-filtering-correlation-id: bf1cb600-6dce-4a58-fb62-08d64b4aa1bc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB048153D1E60613E6DEC3E88A90DC0@MWHPR04MB0481.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(10201501046)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0481; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0481; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39860400002)(396003)(346002)(366004)(136003)(189003)(199004)(8936002)(81166006)(81156014)(54906003)(8676002)(76176011)(86362001)(386003)(71190400001)(6506007)(71200400001)(52116002)(97736004)(110136005)(26005)(446003)(50226002)(118296001)(99286004)(106356001)(2616005)(476003)(66066001)(11346002)(36756003)(39060400002)(72206003)(102836004)(14454004)(186003)(486006)(2501003)(44832011)(3846002)(6116002)(256004)(2900100001)(5660300001)(305945005)(6512007)(6486002)(25786009)(2906002)(478600001)(105586002)(4326008)(68736007)(7736002)(53936002)(316002)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0481;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: us6RIFIsYRLry7qLE25srUvCknACCAtxmP179fnXSiyUDRaG8PfKf4+5ZmO+UXPBgL9w6mHZhoE+Sd5HOp0AIcBejJAH6ePgAUhJKJxGFoNB/Q93oKCagHXY+GVJ7zXQ/IjrHd6xrkFcKzoZK859wPyfU41740aclArAGZD1VKZzTi26rGWvMlKg8OouWF2FEFT16eVu5GnuGw5BiTtq12ri4B4qBnwK8IEyMrKQaBs4NY0MTDN0UvbUbJ7bGPlYYnQwYh1LIYrjzkJCCuZpxYQsjIy49yW2KUdB7YY0ImLQ2cKjBME0s9R43Zjdp6jKFZv0svb2+C6S/kWG0tAQ4fY/wzdQR3Tih16GzytqhmM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1cb600-6dce-4a58-fb62-08d64b4aa1bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:35:23.5866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v1 10/23] riscv: tcg-target: Add the instruction
 emitters
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
X-List-Received-Date: Thu, 15 Nov 2018 22:35:51 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 5319f7ade5..d402e48cbf 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -331,6 +331,46 @@ static int32_t encode_uj(RISCVInsn opc, TCGReg rd, uin=
t32_t imm)
     return opc | (rd & 0x1f) << 7 | encode_ujimm12(imm);
 }
=20
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
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


