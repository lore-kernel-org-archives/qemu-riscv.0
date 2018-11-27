Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkcb-0006jU-GG
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:10:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkcX-0006fp-Hx
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:10:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkcW-0005Xt-LY
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:10:13 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:12810)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkcR-0005RC-Vs; Tue, 27 Nov 2018 16:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543353009; x=1574889009;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=IsndXcf98N9AecauFztAnNmKZpPG0GGaJWujY/ofxGU=;
	b=LLlN+HkUmYsCrxfIxRYX5ASGAkEFji3cxaHEE4uCDloNDHhGDTIvNz9q
	uGcNXhCUe+8i2o5RCwVEhszG74lIJ/mA1mE4nKGLmSUvLiagNA7PizqNx
	dT+Woj4VHRzsldfHZbka5rWBb1PPZoDA/ntbw434A/Gw5O2g3sPmeNA22
	qhOgdZN5HYfLSQheVVRLaXKsgnx35Gh7oK+i5BZiBebkPEfXQ3ZuLamlz
	BAAN666x+TIFw/tNB16rvmlP8zYNcKQEDIQ/ZnZQWN5RoggU4f6TzDgh5
	dHEpgp6UIVW7ZQJBwYQjOWEdFrgE+IJ4zJV1XYTCWFccOnIkoAJuSlp3G Q==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="95245114"
Received: from mail-cys01nam02lp0047.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.47])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:10:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EpbkAQIFjMBaniYPvk9XCab82If7MVn9Kqxs2xSgllQ=;
	b=gKdDR45gDLD8bGgyeaGoeiMG92fLIPPvDYwnZjXc0VcWIxLTyR2Xe1vncQJOmheVSqcR2ZG5aqNG/drGkPB/z62a0shTX43g0Qrjdg7PdH+G5EEHooan14vX3SAaVqNawa9w0BU4IZLbG1EJgoLkzmWWCLTG3kwXZoM1GLAE0fA=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0639.namprd04.prod.outlook.com (10.172.166.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.15; Tue, 27 Nov 2018 21:10:05 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:10:05 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 23/24] WIP: Add missing instructions
Thread-Index: AQHUhpWRsL6s+JdvB0eLwjeD9gbEcg==
Date: Tue, 27 Nov 2018 21:10:05 +0000
Message-ID: <46fe7e6cef5c03c2165feaf400cca797ee1b10f9.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0097.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::38) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0639;
	6:+c5o1zJK1Lq1AKD4G1FCZrEjjh5kQg4rX4MPGYnJhZ1MV9PoAYtIA2yBdJbb166JFkc6YyEP1Yj6UCFNNzQLYZ54sVkElI5gfjbE4jNpPah9YREKkK9qbAUWe+mLzJs18XUlxyPC/SaB5ofiJr62HCTPEmze0b9xgwpO0MH6oRlzUGtVdaSu9FFbgOqz3B9INDYQSzcdVWosogPRxTImNRg60oZM44fIvY18M4Ce3kmTVtsEI76pd7YCB6TwOn7xb6fg/oTqsQPnnapKlePVqGh9D2xH+5Pk92YzN02Jeu5lOTauliW5rIHEi7V+J5mbmQGhip7sViaSrQ1vEG5x+q4xcM4PVK8Pv7tWANKO+o/pemykT458H2MH6Exe5Xrrq9QLfXuA86lTlaHk5PUbXQ0q8D9qBhRq/8p3lxSg9J1Tj5AuVDGuWxLEhthwFl8hOrWbjYh9cGrYORTJCScqkA==;
	5:rZPD87WQcL1+j2QlPljHMpfrBS6RPIKY1Yf2idq9wgZvK4TfZFz9151oyTYG+NIbWzN+/Sk/stzApFfn5GPpz9HurznUfkZKZ3IeJmfeUq37rwFnRdr8paAmn6fKesYofnk6gBFQpzSEmH4xoOMW2j8Q6jafLUrFF51IVBaO2TQ=;
	7:CQlVCaPX949cKk3CobchMVQrEokq0x3pOJp3Z6e0KZOABEEQnq3s87nUflMcuWqbg33S2KFpUzHSNJJDPlRxobMF01eoVfo5Fjy5QodaTSh9rbYa2dQVlV1RTWuurBT4/fZIx+vE5PcG88yNQ/Z6kA==
x-ms-office365-filtering-correlation-id: b6fcbc7d-f347-4e01-e28d-08d654acb3ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0639; 
x-ms-traffictypediagnostic: MWHPR04MB0639:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB063971BCD806F5FA8F3F10F490D00@MWHPR04MB0639.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231443)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0639; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0639; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(86362001)(6436002)(53936002)(97736004)(6512007)(2906002)(66066001)(8676002)(8936002)(81166006)(81156014)(50226002)(54906003)(110136005)(5660300001)(316002)(575784001)(118296001)(7736002)(2501003)(6486002)(68736007)(305945005)(36756003)(478600001)(72206003)(71190400001)(71200400001)(52116002)(76176011)(6116002)(386003)(6506007)(102836004)(44832011)(2616005)(476003)(3846002)(26005)(186003)(486006)(14454004)(99286004)(446003)(25786009)(106356001)(14444005)(39060400002)(105586002)(256004)(11346002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0639;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: OToH6bX6xgpmY3jtGA0wKiGPkGfkbQ5nALaVOYwkpaUlRcs40N/7GZvAkVb3s0zBhmChAPi6PGhtmJnDHJtrx79tmJ+Hh0P6XfDOGjahp5V80+SV/391FCYb2fOjAI6qEmaTTxfk1fFLLKujNrZmOg+256M06XZyAAdA6HlXVGgys9VlAzOnmuGgsniFO0X4do6Jk5dEj4TL076N7x4TwSfrcKkPvIFlFPuFD+7HEfVWj7M0Z+mXJyr1sx7V2WIg4nGocBs32wjowIaKLM69DvwcV6uYyzJKg+io1KsC+Kapw52CQMErdqmRAlavSNBMtgOFlGnTWnlGA3oWKMGHj03Or/C8e+tjdlBeeM2qQII=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fcbc7d-f347-4e01-e28d-08d654acb3ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:10:05.2604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0639
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [RFC v2 23/24] WIP: Add missing instructions
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
X-List-Received-Date: Tue, 27 Nov 2018 21:10:16 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tcg/riscv/tcg-target.inc.c | 77 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 13756f6d0d..b8e9c0e126 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -606,6 +606,57 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, T=
CGArg val,
     return false;
 }
=20
+static void tcg_out_addsub2(TCGContext *s,
+                            TCGReg rl, TCGReg rh,
+                            TCGReg al, TCGReg ah,
+                            TCGReg bl, TCGReg bh,
+                            bool cbl, bool cbh, bool is_sub)
+{
+    /* FIXME: This is just copied from MIPS */
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
+        tcg_out_opc_reg(s, (is_sub ? OPC_SUB : OPC_ADDI), th, ah, bh);
+    } else if (bh !=3D 0 || ah =3D=3D rl) {
+        tcg_out_opc_imm(s, OPC_ADDI, th, ah, (is_sub ? -bh : bh));
+    } else {
+        th =3D ah;
+    }
+
+    if (is_sub) {
+        if (cbl) {
+            tcg_out_opc_imm(s, OPC_SLLI, TCG_REG_TMP0, al, bl);
+            tcg_out_opc_imm(s, OPC_ADDI, rl, al, -bl);
+        } else {
+            tcg_out_opc_reg(s, OPC_SLLI, TCG_REG_TMP0, al, bl);
+            tcg_out_opc_reg(s, OPC_SUB, rl, al, bl);
+        }
+        tcg_out_opc_reg(s, OPC_SUB, rh, th, TCG_REG_TMP0);
+    } else {
+        if (cbl) {
+            tcg_out_opc_imm(s, OPC_ADDI, rl, al, bl);
+            tcg_out_opc_imm(s, OPC_SLLI, TCG_REG_TMP0, rl, bl);
+        } else if (rl =3D=3D al && rl =3D=3D bl) {
+            tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP0, al, 31);
+            tcg_out_opc_reg(s, OPC_ADDI, rl, al, bl);
+        } else {
+            tcg_out_opc_reg(s, OPC_ADDI, rl, al, bl);
+            tcg_out_opc_reg(s, OPC_SLLI, TCG_REG_TMP0, rl, (rl =3D=3D bl ?=
 al : bl));
+        }
+        tcg_out_opc_reg(s, OPC_ADDI, rh, th, TCG_REG_TMP0);
+    }
+}
+
 static const struct {
     RISCVInsn op;
     bool swap;
@@ -1384,6 +1435,18 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
=20
+    case INDEX_op_add2_i32:
+    case INDEX_op_add2_i64:
+        tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
+                        const_args[4], const_args[5], false);
+        break;
+
+    case INDEX_op_sub2_i32:
+    case INDEX_op_sub2_i64:
+        tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
+                        const_args[4], const_args[5], true);
+        break;
+
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
@@ -1439,6 +1502,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
=20
     case INDEX_op_ext32s_i64:
+    case INDEX_op_extrl_i64_i32:
+    case INDEX_op_extrh_i64_i32:
     case INDEX_op_ext_i32_i64:
         tcg_out_ext32s(s, a0, a1);
         break;
@@ -1505,6 +1570,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpc=
ode op)
         =3D { .args_ct_str =3D { "LZ", "LZ", "L" } };
     static const TCGTargetOpDef LZ_LZ_L_L
         =3D { .args_ct_str =3D { "LZ", "LZ", "L", "L" } };
+    static const TCGTargetOpDef rZ_rZ_rZ_rZ_rZ_rZ
+        =3D { .args_ct_str =3D { "rZ", "rZ", "rZ", "rZ", "rZ", "rZ" } };
=20
     switch (op) {
     case INDEX_op_goto_ptr:
@@ -1537,6 +1604,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpc=
ode op)
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext32s_i64:
+    case INDEX_op_extrl_i64_i32:
+    case INDEX_op_extrh_i64_i32:
     case INDEX_op_ext_i32_i64:
         return &r_r;
=20
@@ -1593,6 +1662,14 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOp=
code op)
     case INDEX_op_brcond_i64:
         return &rZ_rZ;
=20
+    case INDEX_op_add2_i32:
+    case INDEX_op_add2_i64:
+        return &rZ_rZ_rZ_rZ_rZ_rZ;
+
+    case INDEX_op_sub2_i32:
+    case INDEX_op_sub2_i64:
+        return &rZ_rZ_rZ_rZ_rZ_rZ;
+
     case INDEX_op_brcond2_i32:
         return &rZ_rZ_rZ_rZ;
=20
--=20
2.19.1


