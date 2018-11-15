Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQG1-0007YN-VX
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:37:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFv-0007Ux-TA
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:37:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFu-0004rR-CD
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:36:59 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:52017)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFl-0004hI-T7; Thu, 15 Nov 2018 17:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321410; x=1573857410;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=kIdqu2kkg67Wx3dVEOBFmxRmyTvhjS95vH1dBbhiCCI=;
	b=ZfchZwkJyka1yPO3rdEuSjz+dheiUYqzO97UAJ1dg6jLg7jMNchyReW5
	A4a/nBIkncYslbjTe0nNvBGSfEVaE8ALO3te0IQ6ivP/owaiU3dJ8JaRS
	RoRF1/brgHof+cHEcmPOQ2STH9dTB3aeq2b8aOcvDZG0Enw2DAy4MdJ5b
	NN/Ph2HUY5GWFLdHcD8cT3Mj1RyfWBI7dZ5cG8MIw+nX4Gf+Ikb3BReDV
	aup2nGV3u3Ua2nOGUnQSgQ4XUVfWYzvsiD4sBIWKZyj/clVadXjR5jTYP
	cxeq1lCSzLh18hnxMigKhsbMcZPqfglq+B0400EvpkQw4oeXHpN9ACSib w==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="99166035"
Received: from mail-cys01nam02lp0048.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.48])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:36:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9VQWfU0fHasFt5zLQTglPmL5AvE+l+x6tVoUoKlnRcw=;
	b=Gi/eCtu6K+16/XPKm5MnbqxVp+fEdO80t9u1Mcfn+Xksp8M4PrY+wUmcAscpMUZZveHv7GYWZ03nd5xvMkq2s3w0XFlvPeDYaAvNwLOhd4mN4cow5Av0scn0+C5vPyChPKyNYiL5LNwGr34Jtf4Z5dtq5Rs3F9hcyAH328Ww5c0=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.27; Thu, 15 Nov 2018 22:36:37 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:36:37 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 18/23] riscv: tcg-target: Add the out op decoder
Thread-Index: AQHUfTOrQQ6FYFM2KEeFJq+9h2FdrA==
Date: Thu, 15 Nov 2018 22:36:37 +0000
Message-ID: <4e25322ab80efb351d006d50672048fea2c71a03.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0102.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::43) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
	6:pNb0hu09fawVHCqGb5ca+nWSpvLB//73Rq/VuVTUKdlF5SfbzUG3da5zzRn20sfLJ8YrUHUTPqPFsrXDezCJ4SFfOH00XJ6+azi4SQlitPbfzW1mqOb3PPUXVY1HHK6SVGLsu9SK/RCqFvw1DGQxx1b4sjssrdDovXLlXP3B5+8LYOJRC8+ZtlcNur6mAXQy3AD3RpB3vTgdIDhVTFOI3mUJd1a6tqO8kzV2CCMcRcFrecuyVXZraXk1kQ/5p9UARWk9T5GnT1rl16yheyJyX65TIgvBe1eOHx6n/00ojX3oTq4SY+0LonBVN0l5taQcSPzKTCN9h/lBXqvAgWjDHHM/gcytS1QNdiYCBTTaLHIUo2B4RHo6xhCZ9CYUiJ7ndd588hbns1v1nMY1egfXJYzekafVCPloU48PR/GbGKW27LqObJOOBZr0lemuOj+tiSMZGxwcvwe0MycuCX6pjw==;
	5:IzxzsnxeWtsAIaN30YP/sOElqJ5ClxQICvZXZBYYzA2RL8ij5bWoeCYf5fXwnMbnSCKjQcn+JkGogGgOlOwpwZ1bm3xhjXca2VxuzLdwr3hy2mlBcYveN4TpuaB9B9t/g1SqPXEHQQsriS30hvbhOSJXIU221J08lj/YWsLSnuQ=;
	7:tHSULGXk0pS64WzaVcOpDM81o/tyb2JKgbFdHA9OYlM2EexYXXDYwiV6wsB56SuM3ZptpRdryZeb9b5toMCyLuOO5ncf/neFE0Lbzx2JLMPf/H49NNkBCWOWfwUMKw5GYH/Qy1/36oQ6kbahsx+Wng==
x-ms-office365-filtering-correlation-id: acb91ba3-b20b-42ca-1275-08d64b4acd93
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0481E602779879F1ABD5EB3F90DC0@MWHPR04MB0481.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(10201501046)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0481; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0481; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39860400002)(396003)(346002)(366004)(136003)(189003)(199004)(8936002)(81166006)(81156014)(54906003)(4744004)(8676002)(76176011)(86362001)(386003)(71190400001)(6506007)(71200400001)(52116002)(97736004)(110136005)(26005)(446003)(50226002)(118296001)(99286004)(106356001)(2616005)(476003)(66066001)(11346002)(36756003)(39060400002)(72206003)(102836004)(14454004)(186003)(486006)(2501003)(44832011)(3846002)(6116002)(256004)(2900100001)(5660300001)(53946003)(305945005)(6512007)(6486002)(25786009)(2906002)(478600001)(105586002)(4326008)(68736007)(7736002)(53936002)(316002)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0481;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: g8J7OC+dz1NYbwm8wn8xzdm8TV8EH5+TDaJOm324/iiGopScPrf0Vr0VYWw448sEiS8eL8f9hc2fc9RwxAyqVqEmksp4VRrLGjw6j+AhCi+kSD5YvmqShpCEQRrPyVLvs78WNaEChN60AgBC9w/fQOoREBhzTwFCRm+SABryzn2bLXp1cwpRiFgZc5+w444ySPY/X4hMDM+Ey5nGetU9mW6Qq6akzKZ0+uDdoN1rGuhGXPparZn56SDy30EKpyK7bRRuCHDoOkk1tv4y+mOryc9UtUaaelCHuO76D9ZNKN8Vm7fkfRWizNXvmgj+Vnv2Co3iinGGX9ECMu2u0X1yJuJB6IYjwlMsF2mvgOjO8Bc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb91ba3-b20b-42ca-1275-08d64b4acd93
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:36:37.1317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v1 18/23] riscv: tcg-target: Add the out op
 decoder
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
X-List-Received-Date: Thu, 15 Nov 2018 22:37:04 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 472 +++++++++++++++++++++++++++++++++++++
 1 file changed, 472 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index c4a013a962..bf3b04f7dc 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1103,6 +1103,478 @@ static void tcg_out_qemu_st(TCGContext *s, const TC=
GArg *args, bool is_64)
 #endif
 }
=20
+static tcg_insn_unit *tb_ret_addr;
+
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg *args, const int *const_args)
+{
+    TCGArg a0 =3D args[0];
+    TCGArg a1 =3D args[1];
+    TCGArg a2 =3D args[2];
+    int c2 =3D const_args[2];
+    const bool is32bit =3D TCG_TARGET_REG_BITS =3D=3D 32;
+
+    switch (opc) {
+    case INDEX_op_exit_tb:
+        /* Reuse the zeroing that exists for goto_ptr.  */
+        if (a0 =3D=3D 0) {
+            tcg_out_goto_long(s, s->code_gen_epilogue);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A0, a0);
+            tcg_out_goto_long(s, tb_ret_addr);
+        }
+        break;
+
+    case INDEX_op_goto_tb:
+        if (s->tb_jmp_insn_offset) {
+            /* direct jump method */
+            s->tb_jmp_insn_offset[a0] =3D tcg_current_code_size(s);
+            /* should align on 64-bit boundary for atomic patching */
+            tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP0, 0);
+            tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+        } else {
+            /* indirect jump method */
+            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
+                       (uintptr_t)(s->tb_jmp_target_addr + a0));
+            tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+        }
+        s->tb_jmp_reset_offset[a0] =3D tcg_current_code_size(s);
+        break;
+
+    case INDEX_op_goto_ptr:
+        tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, a0, 0);
+        break;
+
+    case INDEX_op_br:
+        tcg_out_reloc(s, s->code_ptr, R_RISCV_JAL, arg_label(a0), 0);
+        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
+        break;
+
+    case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8u_i64:
+        tcg_out_ldst(s, OPC_LBU, a0, a1, a2);
+        break;
+    case INDEX_op_ld8s_i32:
+    case INDEX_op_ld8s_i64:
+        tcg_out_ldst(s, OPC_LB, a0, a1, a2);
+        break;
+    case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16u_i64:
+        tcg_out_ldst(s, OPC_LHU, a0, a1, a2);
+        break;
+    case INDEX_op_ld16s_i32:
+    case INDEX_op_ld16s_i64:
+        tcg_out_ldst(s, OPC_LH, a0, a1, a2);
+        break;
+    case INDEX_op_ld32u_i64:
+        tcg_out_ldst(s, OPC_LWU, a0, a1, a2);
+        break;
+    case INDEX_op_ld_i32:
+    case INDEX_op_ld32s_i64:
+        tcg_out_ldst(s, OPC_LW, a0, a1, a2);
+        break;
+    case INDEX_op_ld_i64:
+        tcg_out_ldst(s, OPC_LD, a0, a1, a2);
+        break;
+
+    case INDEX_op_st8_i32:
+    case INDEX_op_st8_i64:
+        tcg_out_ldst(s, OPC_SB, a0, a1, a2);
+        break;
+    case INDEX_op_st16_i32:
+    case INDEX_op_st16_i64:
+        tcg_out_ldst(s, OPC_SH, a0, a1, a2);
+        break;
+    case INDEX_op_st_i32:
+    case INDEX_op_st32_i64:
+        tcg_out_ldst(s, OPC_SW, a0, a1, a2);
+        break;
+    case INDEX_op_st_i64:
+        tcg_out_ldst(s, OPC_SD, a0, a1, a2);
+        break;
+
+    case INDEX_op_add_i32:
+        if (c2) {
+            tcg_out_opc_imm(s, is32bit ? OPC_ADDI : OPC_ADDIW, a0, a1, a2)=
;
+        } else {
+            tcg_out_opc_reg(s, is32bit ? OPC_ADD : OPC_ADDW, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_add_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_ADDI, a0, a1, a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_ADD, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_sub_i32:
+        if (c2) {
+            tcg_out_opc_imm(s, is32bit ? OPC_ADDI : OPC_ADDIW, a0, a1, -a2=
);
+        } else {
+            tcg_out_opc_reg(s, is32bit ? OPC_SUB : OPC_SUBW, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_sub_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_ADDI, a0, a1, -a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_SUB, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_and_i32:
+    case INDEX_op_and_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_ANDI, a0, a1, a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_AND, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_or_i32:
+    case INDEX_op_or_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_ORI, a0, a1, a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_OR, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_xor_i32:
+    case INDEX_op_xor_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_XORI, a0, a1, a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_XOR, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
+        tcg_out_opc_imm(s, OPC_XORI, a0, a1, -1);
+        break;
+
+    case INDEX_op_neg_i32:
+        tcg_out_opc_reg(s, is32bit ? OPC_SUB : OPC_SUBW, a0, TCG_REG_ZERO,=
 a1);
+        break;
+    case INDEX_op_neg_i64:
+        tcg_out_opc_imm(s, OPC_SUB, a0, TCG_REG_ZERO, a1);
+        break;
+
+    case INDEX_op_mul_i32:
+        tcg_out_opc_reg(s, is32bit ? OPC_MUL : OPC_MULW, a0, a1, a2);
+        break;
+    case INDEX_op_mul_i64:
+        tcg_out_opc_reg(s, OPC_MUL, a0, a1, a2);
+        break;
+
+    case INDEX_op_div_i32:
+        tcg_out_opc_reg(s, is32bit ? OPC_DIV : OPC_DIVW, a0, a1, a2);
+        break;
+    case INDEX_op_div_i64:
+        tcg_out_opc_reg(s, OPC_DIV, a0, a1, a2);
+        break;
+
+    case INDEX_op_divu_i32:
+        tcg_out_opc_reg(s, is32bit ? OPC_DIVU : OPC_DIVUW, a0, a1, a2);
+        break;
+    case INDEX_op_divu_i64:
+        tcg_out_opc_reg(s, OPC_DIVU, a0, a1, a2);
+        break;
+
+    case INDEX_op_rem_i32:
+        tcg_out_opc_reg(s, is32bit ? OPC_REM : OPC_REMW, a0, a1, a2);
+        break;
+    case INDEX_op_rem_i64:
+        tcg_out_opc_reg(s, OPC_REM, a0, a1, a2);
+        break;
+
+    case INDEX_op_remu_i32:
+        tcg_out_opc_reg(s, is32bit ? OPC_REMU : OPC_REMUW, a0, a1, a2);
+        break;
+    case INDEX_op_remu_i64:
+        tcg_out_opc_reg(s, OPC_REMU, a0, a1, a2);
+        break;
+
+    case INDEX_op_shl_i32:
+        if (c2) {
+            tcg_out_opc_imm(s, is32bit ? OPC_SLLI : OPC_SLLIW, a0, a1, a2)=
;
+        } else {
+            tcg_out_opc_reg(s, is32bit ? OPC_SLL : OPC_SLLW, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_shl_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_SLLI, a0, a1, a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_SLL, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_shr_i32:
+        if (c2) {
+            tcg_out_opc_imm(s, is32bit ? OPC_SRLI : OPC_SRLIW, a0, a1, a2)=
;
+        } else {
+            tcg_out_opc_reg(s, is32bit ? OPC_SRL : OPC_SRLW, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_shr_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_SRLI, a0, a1, a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_SRL, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_sar_i32:
+        if (c2) {
+            tcg_out_opc_imm(s, is32bit ? OPC_SRAI : OPC_SRAIW, a0, a1, a2)=
;
+        } else {
+            tcg_out_opc_reg(s, is32bit ? OPC_SRA : OPC_SRAW, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_sar_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_SRAI, a0, a1, a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_SRA, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
+        break;
+    case INDEX_op_brcond2_i32:
+        tcg_out_brcond2(s, args[4], a0, a1, a2, args[3], arg_label(args[5]=
));
+        break;
+
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        tcg_out_setcond(s, args[3], a0, a1, a2);
+        break;
+    case INDEX_op_setcond2_i32:
+        tcg_out_setcond2(s, args[5], a0, a1, a2, args[3], args[4]);
+        break;
+
+    case INDEX_op_qemu_ld_i32:
+        tcg_out_qemu_ld(s, args, false);
+        break;
+    case INDEX_op_qemu_ld_i64:
+        tcg_out_qemu_ld(s, args, true);
+        break;
+    case INDEX_op_qemu_st_i32:
+        tcg_out_qemu_st(s, args, false);
+        break;
+    case INDEX_op_qemu_st_i64:
+        tcg_out_qemu_st(s, args, true);
+        break;
+
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
+        tcg_out_ext8u(s, a0, a1);
+        break;
+
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
+        tcg_out_ext16u(s, a0, a1);
+        break;
+
+    case INDEX_op_ext32u_i64:
+    case INDEX_op_extu_i32_i64:
+        tcg_out_ext32u(s, a0, a1);
+        break;
+
+    case INDEX_op_ext8s_i32:
+    case INDEX_op_ext8s_i64:
+        tcg_out_ext8s(s, a0, a1);
+        break;
+
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
+        tcg_out_ext16s(s, a0, a1);
+        break;
+
+    case INDEX_op_ext32s_i64:
+    case INDEX_op_ext_i32_i64:
+        tcg_out_ext32s(s, a0, a1);
+        break;
+
+    case INDEX_op_mulsh_i32:
+    case INDEX_op_mulsh_i64:
+        tcg_out_opc_imm(s, OPC_MULH, a0, a1, a2);
+        break;
+
+    case INDEX_op_muluh_i32:
+    case INDEX_op_muluh_i64:
+        tcg_out_opc_imm(s, OPC_MULHU, a0, a1, a2);
+        break;
+
+    case INDEX_op_mb:
+        tcg_out_mb(s, a0);
+        break;
+
+    case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
+    case INDEX_op_mov_i64:
+    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
+    case INDEX_op_movi_i64:
+    case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+{
+    static const TCGTargetOpDef r
+        =3D { .args_ct_str =3D { "r" } };
+    static const TCGTargetOpDef r_r
+        =3D { .args_ct_str =3D { "r", "r" } };
+    static const TCGTargetOpDef rZ_r
+        =3D { .args_ct_str =3D { "rZ", "r" } };
+    static const TCGTargetOpDef rZ_rZ
+        =3D { .args_ct_str =3D { "rZ", "rZ" } };
+    static const TCGTargetOpDef rZ_rZ_rZ_rZ
+        =3D { .args_ct_str =3D { "rZ", "rZ", "rZ", "rZ" } };
+    static const TCGTargetOpDef r_r_ri
+        =3D { .args_ct_str =3D { "r", "r", "ri" } };
+    static const TCGTargetOpDef r_r_rI
+        =3D { .args_ct_str =3D { "r", "r", "rI" } };
+    static const TCGTargetOpDef r_rZ_rN
+        =3D { .args_ct_str =3D { "r", "rZ", "rN" } };
+    static const TCGTargetOpDef r_rZ_rZ
+        =3D { .args_ct_str =3D { "r", "rZ", "rZ" } };
+    static const TCGTargetOpDef r_rZ_rZ_rZ_rZ
+        =3D { .args_ct_str =3D { "r", "rZ", "rZ", "rZ", "rZ" } };
+    static const TCGTargetOpDef r_L
+        =3D { .args_ct_str =3D { "r", "L" } };
+    static const TCGTargetOpDef r_r_L
+        =3D { .args_ct_str =3D { "r", "r", "L" } };
+    static const TCGTargetOpDef r_L_L
+        =3D { .args_ct_str =3D { "r", "L", "L" } };
+    static const TCGTargetOpDef r_r_L_L
+        =3D { .args_ct_str =3D { "r", "r", "L", "L" } };
+    static const TCGTargetOpDef LZ_L
+        =3D { .args_ct_str =3D { "LZ", "L" } };
+    static const TCGTargetOpDef LZ_L_L
+        =3D { .args_ct_str =3D { "LZ", "L", "L" } };
+    static const TCGTargetOpDef LZ_LZ_L
+        =3D { .args_ct_str =3D { "LZ", "LZ", "L" } };
+    static const TCGTargetOpDef LZ_LZ_L_L
+        =3D { .args_ct_str =3D { "LZ", "LZ", "L", "L" } };
+
+    switch (op) {
+    case INDEX_op_goto_ptr:
+        return &r;
+
+    case INDEX_op_ld8u_i32:
+    case INDEX_op_ld8s_i32:
+    case INDEX_op_ld16u_i32:
+    case INDEX_op_ld16s_i32:
+    case INDEX_op_ld_i32:
+    case INDEX_op_not_i32:
+    case INDEX_op_neg_i32:
+    case INDEX_op_ld8u_i64:
+    case INDEX_op_ld8s_i64:
+    case INDEX_op_ld16u_i64:
+    case INDEX_op_ld16s_i64:
+    case INDEX_op_ld32s_i64:
+    case INDEX_op_ld32u_i64:
+    case INDEX_op_ld_i64:
+    case INDEX_op_not_i64:
+    case INDEX_op_neg_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32u_i64:
+    case INDEX_op_extu_i32_i64:
+    case INDEX_op_ext8s_i32:
+    case INDEX_op_ext8s_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
+    case INDEX_op_ext32s_i64:
+    case INDEX_op_ext_i32_i64:
+        return &r_r;
+
+    case INDEX_op_st8_i32:
+    case INDEX_op_st16_i32:
+    case INDEX_op_st_i32:
+    case INDEX_op_st8_i64:
+    case INDEX_op_st16_i64:
+    case INDEX_op_st32_i64:
+    case INDEX_op_st_i64:
+        return &rZ_r;
+
+    case INDEX_op_add_i32:
+    case INDEX_op_and_i32:
+    case INDEX_op_or_i32:
+    case INDEX_op_xor_i32:
+    case INDEX_op_add_i64:
+    case INDEX_op_and_i64:
+    case INDEX_op_or_i64:
+    case INDEX_op_xor_i64:
+        return &r_r_rI;
+
+    case INDEX_op_sub_i32:
+    case INDEX_op_sub_i64:
+        return &r_rZ_rN;
+
+    case INDEX_op_mul_i32:
+    case INDEX_op_mulsh_i32:
+    case INDEX_op_muluh_i32:
+    case INDEX_op_div_i32:
+    case INDEX_op_divu_i32:
+    case INDEX_op_rem_i32:
+    case INDEX_op_remu_i32:
+    case INDEX_op_setcond_i32:
+    case INDEX_op_mul_i64:
+    case INDEX_op_mulsh_i64:
+    case INDEX_op_muluh_i64:
+    case INDEX_op_div_i64:
+    case INDEX_op_divu_i64:
+    case INDEX_op_rem_i64:
+    case INDEX_op_remu_i64:
+    case INDEX_op_setcond_i64:
+        return &r_rZ_rZ;
+
+    case INDEX_op_shl_i32:
+    case INDEX_op_shr_i32:
+    case INDEX_op_sar_i32:
+    case INDEX_op_shl_i64:
+    case INDEX_op_shr_i64:
+    case INDEX_op_sar_i64:
+        return &r_r_ri;
+
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        return &rZ_rZ;
+
+    case INDEX_op_brcond2_i32:
+        return &rZ_rZ_rZ_rZ;
+
+    case INDEX_op_setcond2_i32:
+        return &r_rZ_rZ_rZ_rZ;
+
+    case INDEX_op_qemu_ld_i32:
+        return TARGET_LONG_BITS <=3D TCG_TARGET_REG_BITS ? &r_L : &r_L_L;
+    case INDEX_op_qemu_st_i32:
+        return TARGET_LONG_BITS <=3D TCG_TARGET_REG_BITS ? &LZ_L : &LZ_L_L=
;
+    case INDEX_op_qemu_ld_i64:
+        return TCG_TARGET_REG_BITS =3D=3D 64 ? &r_L
+               : TARGET_LONG_BITS <=3D TCG_TARGET_REG_BITS ? &r_r_L
+               : &r_r_L_L;
+    case INDEX_op_qemu_st_i64:
+        return TCG_TARGET_REG_BITS =3D=3D 64 ? &LZ_L
+               : TARGET_LONG_BITS <=3D TCG_TARGET_REG_BITS ? &LZ_LZ_L
+               : &LZ_LZ_L_L;
+
+    default:
+        return NULL;
+    }
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


