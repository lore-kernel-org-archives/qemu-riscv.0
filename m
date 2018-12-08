Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQmU-0000Jc-6y
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:47:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQmR-0000Gn-O6
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:47:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQmQ-0000jg-4R
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:47:39 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:52386)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQmJ-0000bj-21; Fri, 07 Dec 2018 19:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230056; x=1575766056;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=reKoOHriVE6sM/G8Fkk56nl1k9/wgAdX5pMLmBk9O6I=;
	b=DjP1HaCbu244pXpVwbzVCg88XVCZaK99bYWvRFmineoluKphF/foqkXz
	HyJ/9WdwqoV2mcC2v4BO6TD61rg54rHKgM/QsAW3OudjQjjcsNramYuCN
	I4Ygu0JEDr+nCsN8N/h7LJCk4VRKm0TqYzbsq63f28k0SCXHGgeStptlD
	XJw+knzxWYnbtTh1DYswlm+ZT/aXd7G3uTapsQnI6ZCWozJA7ALRgJrWf
	3HLLAHyrTn9Q1uB47YDRP8Sf4A3sgQnrvTpmiwuRuv5dEyqPVQ+oqzhd2
	yTX2NevG+KZQJ5kpgNtGZ4tTM/vzjgYlnlGDMpJmuMnXVogsrpMVBRpdy Q==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="194003402"
Received: from mail-sn1nam04lp2051.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.51])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:47:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=saBe9NHewzpzR35RzPQlaBdbpAL5JHJSRUf2RN0zr3g=;
	b=FvZ2LhLAq+cATAlqmkUe33GbyK++6WEQyWnyzRB2TIqi8MZ/8knhiZV58zwoq7wJIsCF4Y4AJyuT99W11BR1wcpOWP2yDTOMZDy/9zfcqF7k8ij/a58vZnJGZ0fdNaoMk6UiWgYTBidf/5JkTyfWgQgCETAGWX5CkYKUPJ3Cnno=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB3725.namprd04.prod.outlook.com (10.172.169.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.18; Sat, 8 Dec 2018 00:47:26 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:47:26 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 08/24] riscv: tcg-target: Add support for the constraints
Thread-Index: AQHUjo+WZP4vJ7bHqEy8V6YtlfP0Yg==
Date: Sat, 8 Dec 2018 00:47:25 +0000
Message-ID: <ae344632ba0e63f0e80ef4dfe76d224c915796a3.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0009.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::22) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB3725;
	6:fbTYCzg/RSkGzlB/6xGEMmNqQTVANJPTa+kOU+Gs9Zw7PSwPHi8qA188KritkAumdP9bbtHXdAYnF7Yn9G5TKgDBfAefnKdaaYPK8aJUEovuH2kS1oaYoVNVW4N/9VpqlH9Ripf7qC2e+lyY+xRosBrEe1MaRMUhIqwE4e06vv7qqKwMb6v4Rv/k65vJlzPyVTJbhkFI9ONBw6sfIvQ4leFvFwReMdn4SvGMCKrf80clP0RZsf3Uv6zqNnqqZZt3xTk5vFV2m4ECjziABmeVbuLADWl+8NKXRN6hgRyAJFezK4NpIh9XPBwKDZw351Ca/nbKEkr7fh11HwyCPv9XbQic3eFvItqDQhB1UXuCu95Sg7gBXj6u2uwbpNR03I/bslCraGl+QUsytJ80OIyh4WBYJJ1YV3nRrkcAnlcYXOhMJQAl0/YhyUaqtQ7vXh6SmbrfYta4BAp700OpULKNxw==;
	5:FboxbGCk98MgXIH/l/cI+VaX2x4VlTv19gRZT29y5VJ6ESxFt8BY1PBTcYSdasHDOTk5hDcd24NvXZxZ7EdgXmFlqvIQ3F3+yL5mH5fjezmoWNYSEXCgygv67cWzakoZmfFkfraPYmf6ll4S55M91z88BTWs2K47GKciHaG3xZM=;
	7:37wRbtr+rfBZ6VVNj/1pFlQwuRNgaAcqGIN6ToqX1Fq8jPEY+1xsjuJiBviZcRI98rjP+elTyDwN2jvb8UPhTPlDeCPiH6Qq9CUlmOgf5/7Zrxlsm0ygI+qiX9F4FZwo2F2ngV/r7ZFOo/kX75O2lw==
x-ms-office365-filtering-correlation-id: 2edd068a-0835-4211-83bb-08d65ca6b8be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB3725; 
x-ms-traffictypediagnostic: MWHPR04MB3725:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB37254F8AE1540CFBC478552D90AB0@MWHPR04MB3725.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB3725; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB3725; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(68736007)(476003)(53936002)(71200400001)(8676002)(71190400001)(11346002)(44832011)(446003)(2616005)(106356001)(486006)(4326008)(66066001)(6512007)(39060400002)(5660300001)(86362001)(81156014)(118296001)(81166006)(386003)(2906002)(8936002)(6506007)(14454004)(99286004)(3846002)(52116002)(478600001)(6116002)(25786009)(72206003)(305945005)(97736004)(6436002)(6486002)(76176011)(26005)(7736002)(186003)(36756003)(110136005)(105586002)(2501003)(50226002)(102836004)(54906003)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB3725;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: VlBJRdbCxYogfZL8ggpM1UzQOsCmXfwl1bMwvVT2S02ieY9zaGYEklc0qG/PLhY/zvkGfvvu+azdzJnt9ePERWc9Efw7IZL4Q4TQUju6oqI4PdceB8sAP4BhdXD6fDJ7tmhu9FvLMbm5MtdvV/xP+mdmBN4sdVCvsiD87QWn+MLjFyrEhfkGf463F+iC8wL0YYR2UQUUclN5Y4d1f16f1LDzto5a7ecRnuopxBXI5862KKmAMmJm+/aJ8U3bHD1taLmmDkhfSiSD63DIIUB7ogftbkpk8EMs7Lwo1ls7XNC6UEulzhcJ3Mhe5k2U6751jINRc18GC+4TYur9YnVM1XjDjsuWAlqJyq0sc2QC94o=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edd068a-0835-4211-83bb-08d65ca6b8be
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:47:25.7887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB3725
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [RFC v3 08/24] riscv: tcg-target: Add support for the
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
X-List-Received-Date: Sat, 08 Dec 2018 00:47:40 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 168 +++++++++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 6c969e3973..af1d2c235a 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -116,3 +116,171 @@ static const int tcg_target_call_oarg_regs[] =3D {
     TCG_REG_A0,
     TCG_REG_A1,
 };
+
+#define TCG_CT_CONST_ZERO  0x100
+#define TCG_CT_CONST_S12   0x200
+#define TCG_CT_CONST_N12   0x400
+#define TCG_CT_CONST_M12   0x800
+
+static inline tcg_target_long sextreg(tcg_target_long val, int pos, int le=
n)
+{
+    if (TCG_TARGET_REG_BITS =3D=3D 32) {
+        return sextract32(val, pos, len);
+    } else {
+        return sextract64(val, pos, len);
+    }
+}
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
+    case 'M':
+        ct->ct |=3D TCG_CT_CONST_M12;
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
+    if ((ct & TCG_CT_CONST_S12) && val =3D=3D sextreg(val, 0, 12)) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_N12) && val =3D=3D sextreg(-val, 0, 12)) {
+        return 1;
+    }
+    if ((ct & TCG_CT_CONST_M12) && val >=3D -0xfff && val <=3D 0xfff) {
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
+    OPC_OR =3D 0x6033,
+    OPC_ORI =3D 0x6013,
+    OPC_REM =3D 0x2006033,
+    OPC_REMU =3D 0x2007033,
+    OPC_SB =3D 0x23,
+    OPC_SD =3D 0x3023,
+    OPC_SH =3D 0x1023,
+    OPC_SLL =3D 0x1033,
+    OPC_SLLI =3D 0x1013,
+    OPC_SLT =3D 0x2033,
+    OPC_SLTI =3D 0x2013,
+    OPC_SLTIU =3D 0x3013,
+    OPC_SLTU =3D 0x3033,
+    OPC_SRA =3D 0x40005033,
+    OPC_SRAI =3D 0x40005013,
+    OPC_SRL =3D 0x5033,
+    OPC_SRLI =3D 0x5013,
+    OPC_SUB =3D 0x40000033,
+    OPC_SW =3D 0x2023,
+    OPC_XOR =3D 0x4033,
+    OPC_XORI =3D 0x4013,
+
+#if TCG_TARGET_REG_BITS =3D=3D 64
+    OPC_ADDIW =3D 0x1b,
+    OPC_ADDW =3D 0x3b,
+    OPC_DIVUW =3D 0x200503b,
+    OPC_DIVW =3D 0x200403b,
+    OPC_MULW =3D 0x200003b,
+    OPC_REMUW =3D 0x200703b,
+    OPC_REMW =3D 0x200603b,
+    OPC_SLLIW =3D 0x101b,
+    OPC_SLLW =3D 0x103b,
+    OPC_SRAIW =3D 0x4000501b,
+    OPC_SRAW =3D 0x4000503b,
+    OPC_SRLIW =3D 0x501b,
+    OPC_SRLW =3D 0x503b,
+    OPC_SUBW =3D 0x4000003b,
+#else
+    /* Simplify code throughout by defining aliases for RV32.  */
+    OPC_ADDIW =3D OPC_ADDI,
+    OPC_ADDW =3D OPC_ADD,
+    OPC_DIVUW =3D OPC_DIVU,
+    OPC_DIVW =3D OPC_DIV,
+    OPC_MULW =3D OPC_MUL,
+    OPC_REMUW =3D OPC_REMU,
+    OPC_REMW =3D OPC_REM,
+    OPC_SLLIW =3D OPC_SLLI,
+    OPC_SLLW =3D OPC_SLL,
+    OPC_SRAIW =3D OPC_SRAI,
+    OPC_SRAW =3D OPC_SRA,
+    OPC_SRLIW =3D OPC_SRLI,
+    OPC_SRLW =3D OPC_SRL,
+    OPC_SUBW =3D OPC_SUB,
+#endif
+
+    OPC_FENCE =3D 0x0000000f,
+} RISCVInsn;
--=20
2.19.1


