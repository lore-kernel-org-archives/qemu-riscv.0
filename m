Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQEO-00069i-3n
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:35:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEJ-00065M-RD
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEF-0003wT-8h
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:19 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26967)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQE7-0003su-RQ; Thu, 15 Nov 2018 17:35:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321309; x=1573857309;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=GB3HTiU4JkuRfLZWbWIv6tG7w0JROKgH1f9mad5QI3A=;
	b=H5tNry5TsoDESsE3i/URFgaA8Eu0752DIe6geapZENHcZ6dKSWZ2tqYI
	b6826ZC7EV0x2b+887fxONaWU9bX/sE1Wx8hGc/HA2mftScAJ3x/VGuMs
	XslFl/t5hMlpzzhP8ma3xGIXTUH8LOe4YH0XEkDllnPubSdeec7Rp+WX6
	A50VQDg4Y9SkOIDzHLaj8R6ObCPHhwUTLh0ZqiiOpF1pGUmx0uOVvfESc
	g4D82XuROstcbXGIy1Sw8TGFDxKv/79dhKshk2Bs8an+vAHDy9JR4x4Gw
	4iYrz3dHosMBFGQAyyogSbDzWjN/IDaJZuZxfT1SeU2o/XtTfGU9kpt8j Q==;
X-IronPort-AV: E=Sophos;i="5.54,499,1534780800"; d="scan'208";a="192154414"
Received: from mail-sn1nam04lp0088.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([216.32.180.88])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:35:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/cg1H4WHc+2/7buEUFOw11mRpl8DbpewUFkfFm95iss=;
	b=FUTw9jwu0lJ467FP92rBrRZzHZG4ofggWJNE7OaSky+sVNMtxgS3mve0CaBf+MWCJJMVlooGRrmRr4cG6O9unclWpXV3TIUkC5WYQOWJla1eRa1OhDhDOuwKfAyrHe/X1Wvh7AamH7p8bfTG7xVBe2Y2Dvj9yecBk3p0Q4tNics=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.27; Thu, 15 Nov 2018 22:35:05 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:35:05 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 08/23] riscv: tcg-target: Add support for the constraints
Thread-Index: AQHUfTN0WQRayW/gYEyR31SNLQMMvg==
Date: Thu, 15 Nov 2018 22:35:05 +0000
Message-ID: <1d5f88588063393fe28b689ce9501715022052ed.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
	6:oxJUUl0mOrpygfHMIfdQ5R3BXNuWWqo/66ZflAjXWRb4+PncTjM1kEkx55KuqUrPLjNcj3XNKg7P0qhLUR5t8BybTOS4Y1upqX4p6ABqJGaZf4TWXPUhrlMD7NA7jebLajqGQr293Kj7FcxGQyDgst4em3MZTK/CsyzEA/aq34NpMXH260ovRc0694xFD/sBzjKTXNlwrg1E2BC8ttUk1GXzP5aEWg0XL0BMm1PF4S+/4G+vJ9rT4puJQQcgen+oEbXvrwzuY1AR2z4awPt3WZ9DdIMaYRcrXdBjgKk5XQvUHmCGonAY1TKGWj1Xey4a2nxeWhFLmyT/tk1JVEmiOpF+0yMSw+B7yhi5yGDJsYc2io0h7p4pJLsykNX2XKQ6nSs9Bmc8dAGJCiqhV7TUHn1XyMCy/RPqX4Q7gGZYRaqFNaQO8ezehBp/hNaQ8aRtHHyNYT1dURvBCKpDVfQ+0A==;
	5:e0RG6QwTzarr5b+0/dmWqBlieeR/vdH0bL0ZvZkMi9+JXsatI+SeXxr+gkL0NDgCoDPVo1WLdUbk9Lxw5GC0ItQrqXIinj8NidpzWQKi8hockukHonDQykJ91hW+oNm472zk6wBnjSOQgHGW9jwHzgasJmZhGkWAPOCA92J7nHI=;
	7:81lNaiw2mXmZfXcXfIQpjAXnEap2/hRbSLaZZzN8haCZGKAg6e3FPs5L4xeNGMMyZZoXv6ssg5Q4XGVzU9EJGKxFTbmcruqUVOP1Q0Jg+Kz42DkzVMUykyYro5A5/KR5nmlNwcXvhiJrJjqAp0gIqQ==
x-ms-office365-filtering-correlation-id: d64ba57f-4d03-4e8f-d489-08d64b4a96d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0481F9C007B2E17260786DA990DC0@MWHPR04MB0481.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: XFITDSvPUeykI0wlmevUeAFgjBd/5uzWEUDrbZMVUNmqIF+SgsUSA8/QfG0bqi88H6OOzWEwqgodnoJWVg4SR5I5Oo27rgDRTGvul5CIOQJ22utMbNGJtQlT/ixMy7jspH668i3TiWgMFy2jZJqe6oqVMePqVtkVV2bwfI9RxBRqctsNR4OCVpxZmtlCx4bpOEYwxIJElM09hcSjAg7NMCgjUJyUMhvQ2eM5HatAQeQVud76UcmazMyKNfeORFRAuTZsuY1z20e8pZam91HpJ9R+eZmc4snveJGNuXEbeybUOA1GuR3mhws6992DvI5taIjlOkWc2qSg65VLveBKJbcz2vLvFmyfZxz73/b1mYk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64ba57f-4d03-4e8f-d489-08d64b4a96d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:35:05.3091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [RFC v1 08/23] riscv: tcg-target: Add support for the
 constraints
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
X-List-Received-Date: Thu, 15 Nov 2018 22:35:23 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 139 +++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index a9c57493a0..e585740870 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -119,6 +119,145 @@ static const int tcg_target_call_oarg_regs[] =3D {
 #define TCG_CT_CONST_S12   0x200
 #define TCG_CT_CONST_N12   0x400
=20
+/* parse target specific constraints */
+static const char *target_parse_constraint(TCGArgConstraint *ct,
+                                           const char *ct_str, TCGType typ=
e)
+{
+    switch (*ct_str++) {
+    case 'r':
+        ct->ct |=3D TCG_CT_REG;
+        ct->u.regs =3D 0xffffffff;
+        break;
+    case 'L':
+        /* qemu_ld/qemu_st constraint */
+        ct->ct |=3D TCG_CT_REG;
+        ct->u.regs =3D 0xffffffff;
+        /* qemu_ld/qemu_st uses TCG_REG_TMP0 */
+#if defined(CONFIG_SOFTMMU)
+        /* tcg_out_tlb_load uses TCG_REG_TMP0/TMP1 and TCG_REG_L0/L1 */
+        /* tcg_regset_reset_reg(ct->u.regs, TCG_REG_TMP0); */
+        /* tcg_regset_reset_reg(ct->u.regs, TCG_REG_TMP1); */
+        tcg_regset_reset_reg(ct->u.regs, TCG_REG_TMP2);
+
+        tcg_regset_reset_reg(ct->u.regs, tcg_target_call_iarg_regs[0]);
+        tcg_regset_reset_reg(ct->u.regs, tcg_target_call_iarg_regs[1]);
+        tcg_regset_reset_reg(ct->u.regs, tcg_target_call_iarg_regs[2]);
+        tcg_regset_reset_reg(ct->u.regs, tcg_target_call_iarg_regs[3]);
+        tcg_regset_reset_reg(ct->u.regs, tcg_target_call_iarg_regs[4]);
+#endif
+        break;
+    case 'I':
+        ct->ct |=3D TCG_CT_CONST_S12;
+        break;
+    case 'N':
+        ct->ct |=3D TCG_CT_CONST_N12;
+        break;
+    case 'Z':
+        /* we can use a zero immediate as a zero register argument. */
+        ct->ct |=3D TCG_CT_CONST_ZERO;
+        break;
+    default:
+        return NULL;
+    }
+    return ct_str;
+}
+
+/* test if a constant matches the constraint */
+static int tcg_target_const_match(tcg_target_long val, TCGType type,
+                                  const TCGArgConstraint *arg_ct)
+{
+    int ct =3D arg_ct->ct;
+    if (ct & TCG_CT_CONST) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_ZERO) && val =3D=3D 0) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_S12) && val >=3D -2048 && val <=3D 2047) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_N12) && val >=3D -2047 && val <=3D 2048) {
+        return 1;
+    }
+    return 0;
+}
+
+/*
+ * RISC-V Base ISA opcodes (IM)
+ */
+
+typedef enum {
+    OPC_ADD =3D 0x33,
+    OPC_ADDI =3D 0x13,
+    OPC_ADDIW =3D 0x1b,
+    OPC_ADDW =3D 0x3b,
+    OPC_AND =3D 0x7033,
+    OPC_ANDI =3D 0x7013,
+    OPC_AUIPC =3D 0x17,
+    OPC_BEQ =3D 0x63,
+    OPC_BGE =3D 0x5063,
+    OPC_BGEU =3D 0x7063,
+    OPC_BLT =3D 0x4063,
+    OPC_BLTU =3D 0x6063,
+    OPC_BNE =3D 0x1063,
+    OPC_DIV =3D 0x2004033,
+    OPC_DIVU =3D 0x2005033,
+    OPC_DIVUW =3D 0x200503b,
+    OPC_DIVW =3D 0x200403b,
+    OPC_JAL =3D 0x6f,
+    OPC_JALR =3D 0x67,
+    OPC_LB =3D 0x3,
+    OPC_LBU =3D 0x4003,
+    OPC_LD =3D 0x3003,
+    OPC_LH =3D 0x1003,
+    OPC_LHU =3D 0x5003,
+    OPC_LUI =3D 0x37,
+    OPC_LW =3D 0x2003,
+    OPC_LWU =3D 0x6003,
+    OPC_MUL =3D 0x2000033,
+    OPC_MULH =3D 0x2001033,
+    OPC_MULHSU =3D 0x2002033,
+    OPC_MULHU =3D 0x2003033,
+    OPC_MULW =3D 0x200003b,
+    OPC_OR =3D 0x6033,
+    OPC_ORI =3D 0x6013,
+    OPC_REM =3D 0x2006033,
+    OPC_REMU =3D 0x2007033,
+    OPC_REMUW =3D 0x200703b,
+    OPC_REMW =3D 0x200603b,
+    OPC_SB =3D 0x23,
+    OPC_SD =3D 0x3023,
+    OPC_SH =3D 0x1023,
+    OPC_SLL =3D 0x1033,
+    OPC_SLLI =3D 0x1013,
+    OPC_SLLIW =3D 0x101b,
+    OPC_SLLW =3D 0x103b,
+    OPC_SLT =3D 0x2033,
+    OPC_SLTI =3D 0x2013,
+    OPC_SLTIU =3D 0x3013,
+    OPC_SLTU =3D 0x3033,
+    OPC_SRA =3D 0x40005033,
+    OPC_SRAI =3D 0x40005013,
+    OPC_SRAIW =3D 0x4000501b,
+    OPC_SRAW =3D 0x4000503b,
+    OPC_SRL =3D 0x5033,
+    OPC_SRLI =3D 0x5013,
+    OPC_SRLIW =3D 0x501b,
+    OPC_SRLW =3D 0x503b,
+    OPC_SUB =3D 0x40000033,
+    OPC_SUBW =3D 0x4000003b,
+    OPC_SW =3D 0x2023,
+    OPC_XOR =3D 0x4033,
+    OPC_XORI =3D 0x4013,
+    OPC_FENCE_RW_RW =3D 0x0330000f,
+    OPC_FENCE_R_R =3D 0x0220000f,
+    OPC_FENCE_W_R =3D 0x0120000f,
+    OPC_FENCE_R_W =3D 0x0210000f,
+    OPC_FENCE_W_W =3D 0x0110000f,
+    OPC_FENCE_R_RW =3D 0x0230000f,
+    OPC_FENCE_RW_W =3D 0x0310000f,
+} RISCVInsn;
+
 typedef struct {
     DebugFrameHeader h;
     uint8_t fde_def_cfa[4];
--=20
2.19.1


