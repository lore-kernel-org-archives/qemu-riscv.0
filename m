Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjC8H-0004Fl-AU
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jan 2019 18:59:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC8E-0004BH-Ur
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:59:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC8D-00018g-BG
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:59:02 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:59886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC89-000149-9u; Mon, 14 Jan 2019 18:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547510338; x=1579046338;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=W9L5R39R0MQWtU0aHerpCKljBbajS3kTwbt5m4z4c1E=;
	b=nTlbXIqBkRXf4/++vl9+Dbwtm99xCXcbgYquUYAAxshPCdfLJICeMKz8
	y3yrjAKdAbBvuYmtjjQtx9kTgFwm4gCA2INU7h7RkV28fF8hMoYwHswPF
	RCqS198YX3AVhEqEEwNvIW+b+7cbZqUji6WlgRN3NNxZedjj74zynBugx
	Y+4m+obV8JR2FT9X/ZcGwC04iPte5nppbR73//4jq21kx6liFc50BR1yJ
	p7DQTdZMM8gOxfgqRtFiWnT/ZRGTH0t5dgN/+fY2i3de87Eet5gZf97/c
	1bOLol/9HbvNQvkeIqEK/BnrtCNFhggHqnHH5NBpBOvbrdD05pmCNW59d A==;
X-IronPort-AV: E=Sophos;i="5.56,479,1539619200"; d="scan'208";a="98765702"
Received: from mail-by2nam03lp2052.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.52])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2019 07:58:44 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jMLnnavIH/gWrIdauhL6v40BNi4I3RfAb62TC3oO/HA=;
	b=BRcISSa17hDc3f2GmajTHNVZ9BFjAWI/BfCIFnAwexKotYnFsUNMsAQ+++wDf1Fy7o/TuIII5ZTqi8iiIgHvHLGKrU5Uf0RTAjYj3N48bq5svzjPqjBZaZjWRBDX3F3pEcLgmDkc0SNqiPUdQ+bYfOFWd0HU0bjU22vVZ6F3g6M=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0895.namprd04.prod.outlook.com (10.174.174.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Mon, 14 Jan 2019 23:58:42 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Mon, 14 Jan 2019 23:58:42 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 6/8] RISC-V: Add misa to DisasContext
Thread-Index: AQHUrGUT1PMTupKzSUSZnY/bECbtaw==
Date: Mon, 14 Jan 2019 23:58:42 +0000
Message-ID: <2425e4ccd5ad76fa9dbedfc7c2b33918a222aabd.1547510220.git.alistair.francis@wdc.com>
References: <cover.1547510220.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1547510220.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0004.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::17) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0895;
	6:mA5PN5YhzTkt0cl97qHuCZC6M42Kxvof2QZ/TNhktxWxorby3bLRAIsT50o6SgdT1aMXIq5/0ZByv6b4uV35iujJlV/AJfUzI2nQzfs+viEjR+CssQ1e0/kt5e0BZ0vsjRGhIej3+4DSMlrll0cF8/JUXqn8xwEVdMW7BVL95aIRrmryq+4doVcQmkhTC0FL5SMjzhHNJ5I63gtpC3n6cw6NsktUP/jAzbj+zjwdmvBzlC7kFi2MZeax8ZEu00S2qll/m1TKAt0ZYevoXQdy/vrJi0J3xZmUWgzfcP+YuoUSNOfwaSV/K/tS9/ac1Tv8CVqgRUCK8RARyATc0tP8UQvQlwXAwlQaPj/wPZxlCP2GU7Y1qLy14MWqCi76uXp+liiOXmpdWaPZmQcNp3EF2DXR18+HzD8AyXKaYIPyL3oJBUV8tzilyGNTEbUUJcsieFNIUnEqS/DUncGxJe4rvg==;
	5:LjmI18DWfto/MiMVPpnnWyVH4V/yWRd0Ra9D/vUsZtxd6aK/R+4hofmB8teBMeiwuCEdqDs78yB7tPbukXiESoPwil9TRHEaK6VVMrr5VuU3HP0hGCKuz4YaR1Rzh6ZcS2KyP5zwDqO7KBA5FZvRfw6uZTXFvC22DNlSpBFm3jFynHkS3yLk9/iVeZVdsIfuhx3OVUbRXbkLFVJpnczTVQ==;
	7:D/kklJIsP79mC+urYVdY86vrq8qKdOmiDyjS2OKN54GEjzha8EiZ1FQO/jsKCFjpA2hLNZo/6+wLLWMOrgAjOVEENJ6taVH0dwKS6p2sgcDw64tpdPBRf1T744lwvWGF3J4PyK5KR3hdutR3cc262A==
x-ms-office365-filtering-correlation-id: 46e4170a-7731-4c3a-04ce-08d67a7c3605
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0895; 
x-ms-traffictypediagnostic: MWHPR04MB0895:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB089560A1C230F85F04550F0690800@MWHPR04MB0895.namprd04.prod.outlook.com>
x-forefront-prvs: 0917DFAC67
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(366004)(396003)(346002)(199004)(189003)(81156014)(118296001)(256004)(99286004)(72206003)(14444005)(386003)(6506007)(68736007)(5660300001)(81166006)(4326008)(2501003)(8676002)(44832011)(105586002)(2906002)(8936002)(486006)(106356001)(71190400001)(7736002)(71200400001)(50226002)(110136005)(316002)(52116002)(54906003)(14454004)(53936002)(186003)(39060400002)(66066001)(6512007)(76176011)(6486002)(36756003)(478600001)(25786009)(2616005)(6436002)(6116002)(476003)(97736004)(3846002)(305945005)(102836004)(11346002)(26005)(446003)(86362001)(357404004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0895;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ytw+fN2f1zUmzzetONC54B2O5YnkCPBZrec59WxdnFYE/y1Z7Ro9h1TLuqtAJn/IhY9HqF2rw0pnYR+ObxnFPO9lLpJ6vw8LKHV3sO82fVOm9iHazSDoP27mwc0a94MhQ3XD+ZBmDI57/PlDGRQRAwQjZ8EB3I36fnkelLydaox9QveFs3n+Lm4+CqycoYuVJzF+/ax8dRoLXnXk4w41cObjIaI4Kpr4YiGjmq6iULW+YAtmtT+KYA4iYZ4pBZFv10ZNAP42nsgdKkd7tWSaYfVMq2Rb+Hj/EwJS0jo0xeO8jYYtjfW7lJt4XGTcj/QisqCfGfjU+5BIBESgigB3NNiXRcSQNONxgkt9sOeTeYobt7tXb+qWMBwAPTJv4oc31Kjzg14ukh4tX/ReGVQ9//J4atRGJyC684r66ChNvcw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e4170a-7731-4c3a-04ce-08d67a7c3605
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2019 23:58:41.8714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0895
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 6/8] RISC-V: Add misa to DisasContext
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
X-List-Received-Date: Mon, 14 Jan 2019 23:59:04 -0000

From: Michael Clark <mjc@sifive.com>

gen methods should access state from DisasContext. Add misa
field to the DisasContext struct and remove CPURISCVState
argument from all gen methods.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Emilio G. Cota <cota@braap.org>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 75 +++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 35 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 833adf1d6f..7ebea308b4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -46,6 +46,7 @@ typedef struct DisasContext {
     target_ulong priv_ver;
     uint32_t opcode;
     uint32_t mstatus_fs;
+    uint32_t misa;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -75,6 +76,11 @@ static const int tcg_memop_lookup[8] =3D {
 #define CASE_OP_32_64(X) case X
 #endif
=20
+static inline bool has_ext(DisasContext *ctx, uint32_t ext)
+{
+    return ctx->misa & ext;
+}
+
 static void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
@@ -506,14 +512,13 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t=
 opc, int rd,
     tcg_temp_free(source1);
 }
=20
-static void gen_jal(CPURISCVState *env, DisasContext *ctx, int rd,
-                    target_ulong imm)
+static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
=20
     /* check misaligned: */
     next_pc =3D ctx->base.pc_next + imm;
-    if (!riscv_has_ext(env, RVC)) {
+    if (!has_ext(ctx, RVC)) {
         if ((next_pc & 0x3) !=3D 0) {
             gen_exception_inst_addr_mis(ctx);
             return;
@@ -527,8 +532,8 @@ static void gen_jal(CPURISCVState *env, DisasContext *c=
tx, int rd,
     ctx->base.is_jmp =3D DISAS_NORETURN;
 }
=20
-static void gen_jalr(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
-                     int rd, int rs1, target_long imm)
+static void gen_jalr(DisasContext *ctx, uint32_t opc, int rd, int rs1,
+                     target_long imm)
 {
     /* no chaining with JALR */
     TCGLabel *misaligned =3D NULL;
@@ -540,7 +545,7 @@ static void gen_jalr(CPURISCVState *env, DisasContext *=
ctx, uint32_t opc,
         tcg_gen_addi_tl(cpu_pc, cpu_pc, imm);
         tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
=20
-        if (!riscv_has_ext(env, RVC)) {
+        if (!has_ext(ctx, RVC)) {
             misaligned =3D gen_new_label();
             tcg_gen_andi_tl(t0, cpu_pc, 0x2);
             tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
@@ -565,8 +570,8 @@ static void gen_jalr(CPURISCVState *env, DisasContext *=
ctx, uint32_t opc,
     tcg_temp_free(t0);
 }
=20
-static void gen_branch(CPURISCVState *env, DisasContext *ctx, uint32_t opc=
,
-                       int rs1, int rs2, target_long bimm)
+static void gen_branch(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
+                       target_long bimm)
 {
     TCGLabel *l =3D gen_new_label();
     TCGv source1, source2;
@@ -603,7 +608,7 @@ static void gen_branch(CPURISCVState *env, DisasContext=
 *ctx, uint32_t opc,
=20
     gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
     gen_set_label(l); /* branch taken */
-    if (!riscv_has_ext(env, RVC) && ((ctx->base.pc_next + bimm) & 0x3)) {
+    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + bimm) & 0x3)) {
         /* misaligned */
         gen_exception_inst_addr_mis(ctx);
     } else {
@@ -1314,8 +1319,8 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
     }
 }
=20
-static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc=
,
-                      int rd, int rs1, int csr)
+static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
+                       int csr)
 {
     TCGv source1, csr_store, dest, rs1_pass, imm_rs1;
     source1 =3D tcg_temp_new();
@@ -1361,7 +1366,7 @@ static void gen_system(CPURISCVState *env, DisasConte=
xt *ctx, uint32_t opc,
             gen_exception_illegal(ctx);
             break;
         case 0x102: /* SRET */
-            if (riscv_has_ext(env, RVS)) {
+            if (has_ext(ctx, RVS)) {
                 gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
                 tcg_gen_exit_tb(NULL, 0); /* no chaining */
                 ctx->base.is_jmp =3D DISAS_NORETURN;
@@ -1506,7 +1511,7 @@ static void decode_RV32_64C0(DisasContext *ctx)
     }
 }
=20
-static void decode_RV32_64C1(CPURISCVState *env, DisasContext *ctx)
+static void decode_RV32_64C1(DisasContext *ctx)
 {
     uint8_t funct3 =3D extract32(ctx->opcode, 13, 3);
     uint8_t rd_rs1 =3D GET_C_RS1(ctx->opcode);
@@ -1526,7 +1531,7 @@ static void decode_RV32_64C1(CPURISCVState *env, Disa=
sContext *ctx)
                       GET_C_IMM(ctx->opcode));
 #else
         /* C.JAL(RV32) -> jal x1, offset[11:1] */
-        gen_jal(env, ctx, 1, GET_C_J_IMM(ctx->opcode));
+        gen_jal(ctx, 1, GET_C_J_IMM(ctx->opcode));
 #endif
         break;
     case 2:
@@ -1605,22 +1610,22 @@ static void decode_RV32_64C1(CPURISCVState *env, Di=
sasContext *ctx)
         break;
     case 5:
         /* C.J -> jal x0, offset[11:1]*/
-        gen_jal(env, ctx, 0, GET_C_J_IMM(ctx->opcode));
+        gen_jal(ctx, 0, GET_C_J_IMM(ctx->opcode));
         break;
     case 6:
         /* C.BEQZ -> beq rs1', x0, offset[8:1]*/
         rs1s =3D GET_C_RS1S(ctx->opcode);
-        gen_branch(env, ctx, OPC_RISC_BEQ, rs1s, 0, GET_C_B_IMM(ctx->opcod=
e));
+        gen_branch(ctx, OPC_RISC_BEQ, rs1s, 0, GET_C_B_IMM(ctx->opcode));
         break;
     case 7:
         /* C.BNEZ -> bne rs1', x0, offset[8:1]*/
         rs1s =3D GET_C_RS1S(ctx->opcode);
-        gen_branch(env, ctx, OPC_RISC_BNE, rs1s, 0, GET_C_B_IMM(ctx->opcod=
e));
+        gen_branch(ctx, OPC_RISC_BNE, rs1s, 0, GET_C_B_IMM(ctx->opcode));
         break;
     }
 }
=20
-static void decode_RV32_64C2(CPURISCVState *env, DisasContext *ctx)
+static void decode_RV32_64C2(DisasContext *ctx)
 {
     uint8_t rd, rs2;
     uint8_t funct3 =3D extract32(ctx->opcode, 13, 3);
@@ -1654,7 +1659,7 @@ static void decode_RV32_64C2(CPURISCVState *env, Disa=
sContext *ctx)
         if (extract32(ctx->opcode, 12, 1) =3D=3D 0) {
             if (rs2 =3D=3D 0) {
                 /* C.JR -> jalr x0, rs1, 0*/
-                gen_jalr(env, ctx, OPC_RISC_JALR, 0, rd, 0);
+                gen_jalr(ctx, OPC_RISC_JALR, 0, rd, 0);
             } else {
                 /* C.MV -> add rd, x0, rs2 */
                 gen_arith(ctx, OPC_RISC_ADD, rd, 0, rs2);
@@ -1662,11 +1667,11 @@ static void decode_RV32_64C2(CPURISCVState *env, Di=
sasContext *ctx)
         } else {
             if (rd =3D=3D 0) {
                 /* C.EBREAK -> ebreak*/
-                gen_system(env, ctx, OPC_RISC_ECALL, 0, 0, 0x1);
+                gen_system(ctx, OPC_RISC_ECALL, 0, 0, 0x1);
             } else {
                 if (rs2 =3D=3D 0) {
                     /* C.JALR -> jalr x1, rs1, 0*/
-                    gen_jalr(env, ctx, OPC_RISC_JALR, 1, rd, 0);
+                    gen_jalr(ctx, OPC_RISC_JALR, 1, rd, 0);
                 } else {
                     /* C.ADD -> add rd, rd, rs2 */
                     gen_arith(ctx, OPC_RISC_ADD, rd, rd, rs2);
@@ -1698,7 +1703,7 @@ static void decode_RV32_64C2(CPURISCVState *env, Disa=
sContext *ctx)
     }
 }
=20
-static void decode_RV32_64C(CPURISCVState *env, DisasContext *ctx)
+static void decode_RV32_64C(DisasContext *ctx)
 {
     uint8_t op =3D extract32(ctx->opcode, 0, 2);
=20
@@ -1707,15 +1712,15 @@ static void decode_RV32_64C(CPURISCVState *env, Dis=
asContext *ctx)
         decode_RV32_64C0(ctx);
         break;
     case 1:
-        decode_RV32_64C1(env, ctx);
+        decode_RV32_64C1(ctx);
         break;
     case 2:
-        decode_RV32_64C2(env, ctx);
+        decode_RV32_64C2(ctx);
         break;
     }
 }
=20
-static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
+static void decode_RV32_64G(DisasContext *ctx)
 {
     int rs1;
     int rs2;
@@ -1750,13 +1755,13 @@ static void decode_RV32_64G(CPURISCVState *env, Dis=
asContext *ctx)
         break;
     case OPC_RISC_JAL:
         imm =3D GET_JAL_IMM(ctx->opcode);
-        gen_jal(env, ctx, rd, imm);
+        gen_jal(ctx, rd, imm);
         break;
     case OPC_RISC_JALR:
-        gen_jalr(env, ctx, MASK_OP_JALR(ctx->opcode), rd, rs1, imm);
+        gen_jalr(ctx, MASK_OP_JALR(ctx->opcode), rd, rs1, imm);
         break;
     case OPC_RISC_BRANCH:
-        gen_branch(env, ctx, MASK_OP_BRANCH(ctx->opcode), rs1, rs2,
+        gen_branch(ctx, MASK_OP_BRANCH(ctx->opcode), rs1, rs2,
                    GET_B_IMM(ctx->opcode));
         break;
     case OPC_RISC_LOAD:
@@ -1827,7 +1832,7 @@ static void decode_RV32_64G(CPURISCVState *env, Disas=
Context *ctx)
         }
         break;
     case OPC_RISC_SYSTEM:
-        gen_system(env, ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
+        gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
                    (ctx->opcode & 0xFFF00000) >> 20);
         break;
     default:
@@ -1836,19 +1841,19 @@ static void decode_RV32_64G(CPURISCVState *env, Dis=
asContext *ctx)
     }
 }
=20
-static void decode_opc(CPURISCVState *env, DisasContext *ctx)
+static void decode_opc(DisasContext *ctx)
 {
     /* check for compressed insn */
     if (extract32(ctx->opcode, 0, 2) !=3D 3) {
-        if (!riscv_has_ext(env, RVC)) {
+        if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
             ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
-            decode_RV32_64C(env, ctx);
+            decode_RV32_64C(ctx);
         }
     } else {
         ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
-        decode_RV32_64G(env, ctx);
+        decode_RV32_64G(ctx);
     }
 }
=20
@@ -1861,6 +1866,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cpu)
     ctx->mem_idx =3D ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
     ctx->mstatus_fs =3D ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
     ctx->priv_ver =3D env->priv_ver;
+    ctx->misa =3D env->misa;
     ctx->frm =3D -1;  /* unknown rounding mode */
 }
=20
@@ -1891,14 +1897,13 @@ static bool riscv_tr_breakpoint_check(DisasContextB=
ase *dcbase, CPUState *cpu,
     return true;
 }
=20
-
 static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cp=
u)
 {
     DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
     CPURISCVState *env =3D cpu->env_ptr;
=20
     ctx->opcode =3D cpu_ldl_code(env, ctx->base.pc_next);
-    decode_opc(env, ctx);
+    decode_opc(ctx);
     ctx->base.pc_next =3D ctx->pc_succ_insn;
=20
     if (ctx->base.is_jmp =3D=3D DISAS_NEXT) {
--=20
2.19.1


