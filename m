Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkaS-0004Qh-96
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:08:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkaK-00042Y-W5
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkaG-00041m-3S
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:07:55 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:36108)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRka7-0003rl-GT; Tue, 27 Nov 2018 16:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352863; x=1574888863;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=Myg9gtTWqUSXFmM8elYUIAKJ+C2gtfPiur3HWAZEky4=;
	b=n1mx6hTg0kG5PjTN5hf8bV5/fBCU4r3uzZsTZQ3pPTW2IFkG1lAaGgDO
	0TkaYz7eP7CWyG68DWMnFe1zyZmsXs4jpjXUuHDpGhh0iFYOx1mFlsWNh
	DS/hb5P4Ts8ECZKjqqjJdMsSEUEBLMIisF6QRyV+bhyM1KcBEQUgsOZIZ
	6u+n4v0p3092FF2huKyjmrWD/8cEqDq0KorAkpv7o02zjEutWXA8rUYGv
	sOzUUdjNlHjv7qhbvqsIgS+8XIXuFI3zRumhReYD7InBbX3WTOzB6bjY2
	7Y15guXqUAzz7F1KZHOn5tEMk+f0dhn3vI/KbzmEb9tDMl0RsrQ2Z9y+8 g==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="100064193"
Received: from mail-by2nam05lp0248.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([216.32.181.248])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:07:42 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HXbvBmC1y3yd9T33qVgOeq1Oxbk48BW2SusKKajDNIQ=;
	b=IUgKQD9mB4eSxk7BQOB0E/U9rU8cwrvO/btI+Gm/DemDwE3XyZuBiqLN7z8vdayAEBZgST5iG61XYace49i6jR6IJqZP23nfm+O0fIzDC8QoM6hqHDhpAGCglTjP4C+MEgi/iw5CqUS3O2dBfr61Uzj+n9UkYNx3Z3Zmz126f5I=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0943.namprd04.prod.outlook.com (10.174.174.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 21:07:39 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:07:39 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 07/24] riscv: tcg-target: Add support for the constraints
Thread-Index: AQHUhpU6jZvKaoGksEiOj28Hgi38Ow==
Date: Tue, 27 Nov 2018 21:07:39 +0000
Message-ID: <67303db03721ef2e4d9737379312681543a0ba0c.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0943;
	6:mvYYTv7ArhWBvYXodc574LMGrLobCyxgSF12S+pkT6GDs7oVPK05CI6WXxV6yWrRtan0YQQSsV3GnckJc7STtUsyCUcFruuyrXPgvFX0fY4+L+wABO0znbXudp+Z6zsUx3ZcrZTmfeKTuM8RBoM7uKCVF3pEQ5CL8Wyn3faN5/J16oeXux+4bGkt3Tkq+ztGauqu7Sp2dw75/sT9yX1wvbgztAx/eG9aDkN7PoSs8ALXhGy0wjmXZgvt2BI7hjcbFMW4sl95Cwy2jIyFnrtrXMc2xC8ThUb7O5ZIz+XDMCGDPMR7aLk6bbwA/tuiw/cADyRRVbZBYYiGzLPq/lB2sP5nw/vQwC3VI9qnRvUjUG82bWRBp+jiI1wWZSHRvHTi94gFVZt1oajbUMfG22hxHZsklWGYwbWNV6jQZqclp6fM+IrtpE05ekJAjaBrIG0xrr5CvxrIXgbaBc1d5drZmQ==;
	5:dTCv0TjBMWix/LxfnM1iuW1Jsg/8Dbt/1vIm13/mvBLoFO5MDB8lU/5RNxvVqYPVY+ux9qke2Q/FSKGhxLF/Kut19HCPKLHtiWpeK4ca9tAvQdTh53a+lrdH/6orjZbmBLo14yreHTNP4fdqAk7jk5Xm43yYRyUDl5f5lLr4dZs=;
	7:x4Rem8M6iPCdxLxXkIQLGjMPebG88xMbI4uiCRPhOlwAs4aUxQtk5y+cyiE3Ho8fMiuLZZ2VEbI0gx5YGjtbVYxZpgDtx3oilP159zsxJvseTvmJoiiqM1QX/SOfy5BG4xKxw6GG6ol0yFrSK0X2eA==
x-ms-office365-filtering-correlation-id: 41dbab30-c366-483f-46ba-08d654ac5cf8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0943; 
x-ms-traffictypediagnostic: MWHPR04MB0943:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB09430199CDAC49E5C8F2C24190D00@MWHPR04MB0943.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0943; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0943; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(366004)(376002)(136003)(189003)(199004)(14454004)(97736004)(5660300001)(2501003)(4326008)(81156014)(81166006)(8936002)(256004)(6512007)(316002)(53936002)(8676002)(39060400002)(110136005)(7736002)(305945005)(118296001)(36756003)(3846002)(86362001)(6116002)(54906003)(11346002)(68736007)(99286004)(76176011)(52116002)(2616005)(446003)(72206003)(66066001)(26005)(486006)(44832011)(71200400001)(71190400001)(386003)(6486002)(50226002)(6436002)(25786009)(102836004)(186003)(476003)(105586002)(6506007)(2906002)(106356001)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0943;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: WDjx/gBEKh4vWZ8tfWhzwvYlIBCJ/XAy5zZS5TKDvp6LKtri8WyIPzSgYJHBzsle7FZUuBcL7fuH12cN5AROf64vIPBbTxQSRo/ukJWQfcHu0scXDZ4PA9yAsvxY0MGkn1jKtwPxJ7f5MMfqF0jBr33x5UwITDiqdlERDtM3CEwlg7e3rVQ8AxMUjklspbDV9AABNodBf3z835BXvSa1mxxGydN6YncaNa5YoSnITXXhhvEad45ozGbyUd+1wI6p55DE9BjZ3/fdHj1rW5BZUTRw0yJnd3D6tSb6prb0WPN/lj+OWaaT4puOEQXQMdoirlaD+rmu4ovibhW2TTYO9jUL+EBeEqR4Jg5oj16+fvI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41dbab30-c366-483f-46ba-08d654ac5cf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:07:39.4136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0943
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v2 07/24] riscv: tcg-target: Add support for the
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
X-List-Received-Date: Tue, 27 Nov 2018 21:08:00 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 138 +++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index a4a1579440..5719af3c08 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -114,3 +114,141 @@ static const int tcg_target_call_oarg_regs[] =3D {
     TCG_REG_A0,
     TCG_REG_A1,
 };
+
+#define TCG_CT_CONST_ZERO  0x100
+#define TCG_CT_CONST_S12   0x200
+#define TCG_CT_CONST_N12   0x400
+
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
+    if ((ct & TCG_CT_CONST_S12) && val =3D=3D sextract32(val, 0, 12)) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_N12) && val =3D=3D sextract32(-val, 0, 12)) {
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
--=20
2.19.1


