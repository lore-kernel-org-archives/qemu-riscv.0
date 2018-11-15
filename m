Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQEc-0006P2-9N
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:35:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEX-0006Kv-6C
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEP-0004Dc-Re
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:29 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:51923)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEH-0003xb-ED; Thu, 15 Nov 2018 17:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321318; x=1573857318;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=ZSsdoU2lbPlI7GUiv5UHJll85lnIehDrNOEs1PQ78mw=;
	b=oHG2ox+EQI4HHXPTH4UyNhHT8kuHxpITV3yVYtxr3Y+KaWcxzlAdo1xW
	j0j10t6FSqSRjvapnXFk+PPZRedPwnY37aF6ppaLaXS41j203TYYxB9FY
	m5pKB0wOtggQQr0Mdcttl4UHxdy663+vf2Ca/i45AHJdqu7P9Ini4DVlO
	HDI0jNBR5R2lQJfGRL2AkwUfUZIAWSbYtYUTy9+iOKFI306xNwIn49jrp
	BoXfMm3bEshSAumPHYGKA7QtbRGNRRuSJJJOS7RTf7qu/tIRyT4R+4n+D
	+e9qTf8hflyIo6nluuZq1KSrP7u0vf36sxlgRYeKwvlF69Zy49GNDR8Tq Q==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="99165974"
Received: from mail-cys01nam02lp0050.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.50])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:35:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DgZTp9SMB6/DBkuj3NuokSK7LbhdAwi8wccPghXpamM=;
	b=ITp18oPasrlPCMEd9Gb+408chwEXCvp0q9jjN9FQoW1wan/STZwGhvPERzRM5e1eTmGvStAApyRa96alP8tzkdCNBcL41L7NBzvD5D++cnkJSWDq/JbNFAa5uniLp45Z39IMQlydAlITtvc4RhFtSw83RLlTYd4fik32vAjrsjQ=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.27; Thu, 15 Nov 2018 22:35:14 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:35:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 09/23] riscv: tcg-target: Add the immediate encoders
Thread-Index: AQHUfTN5+YO0vG0XwUCWqBO4N+aQ7A==
Date: Thu, 15 Nov 2018 22:35:14 +0000
Message-ID: <2d6d038f9949b5b39feb48e322be881f31a7f4e1.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0065.prod.exchangelabs.com (2603:10b6:a03:94::42)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
	6:6TvHWpV6CbauxN1Lh58KDpnmTZKq++FvO0oF4HUEEmLy3isgus1umc1tY2K9sU99qH3tjvLLLV9xmPp5ovaQ5k9sncpjU2dFTmVMY99rJbUiFIq2fb/EoQEVWFDH/7YE7zgjFGQlxsDXGD2Bjz7oUDAPDbLszySGrlofqPPcaOjGYzlcVPj4TQrwU0kmtE1QQNTQUdj4saC/EA23qamfQUAn4EO6EoyxqUie+7qK+t7gCFHcQ3uUvU0UmdjYhwqAMht2+/dZmS8KjSG8p/fR9+Q790bUatqpA/sCZuV/8M4nAT3pxJOD/hyOKMsTsLNDrmHNiF1FRsDITEuNcKh0jxXjf0ZT4l2D4kuoaQm8+BKdJje0wqDNEPQY4dW+iZG7ccLpCV37ZRcb/u7F539rAYOsF+YjnYixCcB8323kcUoXM+7lz9GLiiQTso+0FxydjwPIz9vyxiQnJhJDHEvFOg==;
	5:FQKRq5HqQUnTDSn+S6k13msJmZCb0l23aJdQEufubETAQLOE0S1P2qJablGYxwwD4+cZ9/qZegJonaM34O34nzShk8dwCbxOcDFiWXxbbDEjZn/QIE60Xj6jWRqrtwBWCYdj6FPpDUooYU1/2gey8JghP+UuLjGUAcl4LhAQTW0=;
	7:wUZh7A1lFa/vt3zRv/q8SHTxo29arRnG/S1xHmNYNbNVhz4Jq1aKj3hTLyRHNZrrpTQizKU5jfRX4zZ47usaGIUBLwjzBOtNKVYB7IGKRyAUiSU3kGQJPeQlFpReCH8Tupbp4uLnSedmsnaJ58aP3w==
x-ms-office365-filtering-correlation-id: 46d7eac6-3179-48ae-f571-08d64b4a9c2d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB048158B61F76105C9A2E1A7F90DC0@MWHPR04MB0481.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(10201501046)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0481; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0481; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39860400002)(396003)(346002)(366004)(136003)(189003)(199004)(8936002)(81166006)(81156014)(54906003)(8676002)(76176011)(86362001)(386003)(71190400001)(6506007)(71200400001)(52116002)(97736004)(110136005)(26005)(446003)(50226002)(118296001)(99286004)(106356001)(2616005)(476003)(66066001)(11346002)(36756003)(39060400002)(72206003)(102836004)(14454004)(186003)(486006)(2501003)(44832011)(3846002)(6116002)(256004)(2900100001)(5660300001)(305945005)(6512007)(6486002)(25786009)(2906002)(478600001)(105586002)(4326008)(68736007)(7736002)(53936002)(316002)(6436002)(14773001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0481;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: RYe7vDxGcqi+E9bGX0px5YklBGYn7+DiGB7gK9JPQxYnICZmKYPkGTJlKG/OIzq4HC0lAcHlJZYbPIkxyeOspR6A6s94ZhBDCIGAwinbMnVRvLPi1YEBVRcT+JgeCmQg644/TzVDPrwGljj/AszGX6dlnAzeGI8rX+qi31ZyokxBBlQnud1Krh0bQJKZUlqVzjeVSD8gSraYzg/nVOR1oW/Osj3PjZ2/Lof0nIpJc3Ioe9lNGDAo6Nf24cSCrSsJJ7lZVJx2ARpNsqiagh7hJ/APP+5fmC0JkVa73f7gyqRnEgi07mJ9E8o7ddPZBB0Xi4BWDhgJd2u5GcMv9fksPQyfw0TYKJebsYffuUh4AYA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d7eac6-3179-48ae-f571-08d64b4a9c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:35:14.2847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v1 09/23] riscv: tcg-target: Add the immediate
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
X-List-Received-Date: Thu, 15 Nov 2018 22:35:36 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 81 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index e585740870..5319f7ade5 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -258,6 +258,87 @@ typedef enum {
     OPC_FENCE_RW_W =3D 0x0310000f,
 } RISCVInsn;
=20
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
+    return ((imm << 20) >> 25) << 25 | ((imm << 27) >> 27) << 7;
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
+    return ((imm << 19) >> 31) << 31 | ((imm << 21) >> 26) << 25 |
+           ((imm << 27) >> 28) << 8 | ((imm << 20) >> 31) << 7;
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
+    return (imm >> 12) << 12;
+}
+
+static int32_t encode_u(RISCVInsn opc, TCGReg rd, uint32_t imm)
+{
+    return opc | (rd & 0x1f) << 7 | encode_uimm20(imm);
+}
+
+/* Type-UJ */
+
+static int32_t encode_ujimm12(uint32_t imm)
+{
+    return ((imm << 11) >> 31) << 31 | ((imm << 21) >> 22) << 21 |
+           ((imm << 20) >> 31) << 20 | ((imm << 12) >> 24) << 12;
+}
+
+static int32_t encode_uj(RISCVInsn opc, TCGReg rd, uint32_t imm)
+{
+    return opc | (rd & 0x1f) << 7 | encode_ujimm12(imm);
+}
+
+void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
+                              uintptr_t addr)
+{
+    /* Note: jump target patching should be atomic */
+    reloc_call((tcg_insn_unit *)jmp_addr, (tcg_insn_unit*)addr);
+    flush_icache_range(jmp_addr, jmp_addr + 8);
+}
+
 typedef struct {
     DebugFrameHeader h;
     uint8_t fde_def_cfa[4];
--=20
2.19.1


