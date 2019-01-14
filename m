Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjC8I-0004HI-TS
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jan 2019 18:59:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC8F-0004By-MR
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:59:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC8D-00019w-R1
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:59:03 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:59886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC89-000149-Sm; Mon, 14 Jan 2019 18:58:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547510338; x=1579046338;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=U57ej2EV16jeBMGHTlBMwvQO6MLx3MGdO57+fyJAVPc=;
	b=j/p/Nm1eh5jYgFLh2g1XGXenUWQht35q4BgMIUxgPOihYZ8+0lcvdalQ
	r6OhXNbDUcBA29utD2cgKAVtW9VwzU6tu3JpRrMTC8o3Se0Q8jcz1n3EC
	oJwemCpxoZu1FyZP16YjfMhyEGB4u2ou/gvVwdD4J9iYueY4Y80CoPe9N
	EBCg5cXpqUUX0IrTdVl+uVquTbGw5cEtZzWha76G0IYETL5Sg19EOfTzd
	wW0pJ09EPoiQ0aSYrSTL8scJRgWTWNAu36PwICi8Xrnq8SZF7I26ea/Ic
	dyzbgVnMFHJw2jQ/gupFFKy4GIvq3tKstcICNFZfl3440NGIcfAjSOfxk Q==;
X-IronPort-AV: E=Sophos;i="5.56,479,1539619200"; d="scan'208";a="98765708"
Received: from mail-by2nam03lp2057.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.57])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2019 07:58:54 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lAXWIF0dsaz+FRsaMV6pCIigXrjfnetwUwp0+J+yZBo=;
	b=IS8oPDYFQWcE4DCiV4cW54L28qKguJzBVny27xqj+lAFPpETWCEZwMXAFdpqw09lP1ibIRTNdmnP6IiSrlQzIwXyec2GlQzfYwGBH1gbWdeEjG/DeWgOT+WeLP8SgPDssFuuNmYDw1quAvwtv16MCP7fIsal12pG9Evb2+8Ek00=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0895.namprd04.prod.outlook.com (10.174.174.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Mon, 14 Jan 2019 23:58:51 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Mon, 14 Jan 2019 23:58:51 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 7/8] RISC-V: Add misa.MAFD checks to translate
Thread-Index: AQHUrGUZxXuSgjbK/UyW7FD8EZ+YYw==
Date: Mon, 14 Jan 2019 23:58:51 +0000
Message-ID: <f437442d547363c1d0c27dd30e1c428a83c02e50.1547510220.git.alistair.francis@wdc.com>
References: <cover.1547510220.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1547510220.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0030.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::43) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0895;
	6:6Fn5D0mUvQAdKngnbn+FDcMF+jKy5RJJ8SI7aNlYw8i1+fJtLH+Excel8AbHJxr+8jRAJ8As+HBJvDGpf/2OQUaJSf+y0P83fDrgbDmKrMqYrB/FZIBN1V8BK5g+ZfvDoFHjS1WdifOfZ87fo/I+ftZv8GgsxiWco+Skcqw37BU/yKIzkHq3nEBG+CPHABT5rlglA8baPEL7VIFANin+xCIwxuO4ZAZZJpiJYgh8faOTd2f1nSXUtxwky9DMohajo8YZHedvytuNhZFV0Bmxh+cpp1HdKRyLvqOS4QM6r8vu4s0Uf7pEdD1U1sBqT4ineRDVkwklX8YbLsSTCNU40rRllBZwluqXqa/+xwmS5OB+s7SvBGGqTCcH/OE1KxV4UXg3Imi5F1/x9LbeYjzJbAyduU63u+JiQfBj+vfb9raGVzmpUJOuQOaVSJEkX0b/HdqWg1VXWhJ4qctUh/gpvg==;
	5:+ht2Aio2M4pfiinRpTg5LZidyuEMqj94XaEPvroQKbpfk0HFH5p9bNfNC2qqMZR2I1KbTpTDKxukX6x8+gfomM6s61OWQjo4UxxrCeL/W1dWUwBkvmqFeiPYd4Xm1wvlR8E58JEg/gedhiDRNUJcqQ5Bc6EGuzi/kwYxDnvDVxo1HMOnuy7wkQKZdTojf0uIucgB5XB9lybCImPQQnducw==;
	7:CethL/f/A2E3tPMLfisXHHlQdwBel3rWgR43L22MTOszcWBhHwvEa1Z1abwK9D3m0FE9B2Kza4rFq4f593ashSVYYe9S/BaBZhdqmbUZ/psjt5/iPo71yLg5tyDpoEXP5Ji4jzSGi9OOA45SWRcVnA==
x-ms-office365-filtering-correlation-id: ceb137c1-a409-4a6e-63bb-08d67a7c3b85
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0895; 
x-ms-traffictypediagnostic: MWHPR04MB0895:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0895E4AF649A2DE3C9DBB37690800@MWHPR04MB0895.namprd04.prod.outlook.com>
x-forefront-prvs: 0917DFAC67
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(366004)(396003)(346002)(199004)(189003)(81156014)(118296001)(256004)(99286004)(72206003)(386003)(6506007)(68736007)(5660300001)(81166006)(4326008)(2501003)(8676002)(44832011)(105586002)(2906002)(8936002)(486006)(106356001)(71190400001)(7736002)(71200400001)(50226002)(110136005)(316002)(52116002)(54906003)(14454004)(53936002)(186003)(39060400002)(66066001)(6512007)(76176011)(6486002)(36756003)(478600001)(53946003)(25786009)(2616005)(6436002)(6116002)(476003)(97736004)(3846002)(305945005)(102836004)(11346002)(30864003)(26005)(446003)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0895;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: k+z74vlxkYGpsa8Q1s9usN8gT5T0X0mdcoP1i1fE5CNXU8syxjU4kxiC4cYi6KbovWCsu6TW6Jkq28UFOos4NuPJ7iZWRBWUi8CZV0/kKCb+uX+KEzAdLGOfILjHWExWw20OPqGgD47dLYjy+2GGq1IwsRmRm59ib9YjcRHQ4cBwd1Lyzqp0L7Udxiap13yVshoiwyRFSMtrMjmw3lHN8FDif4b/UtnJJ0RERIznDvZdTmnM9EJwiCoowAClcaW2xvKd9FlgkTEUFu+02quuV2P1rAsbQ/z3pr9smmEPTWlAhvCsowkwQXr9IEBc0Y3XzT7KA45ER3Xf/CNRzljZstdKAXbIOnu2pxLa0/yoroblSKpfZlJUjOEMiOryW49miHlDA8KLNZyMZwYGMedCpUccsB34SvZCEJj44TjB02Y=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb137c1-a409-4a6e-63bb-08d67a7c3b85
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2019 23:58:51.1043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0895
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 7/8] RISC-V: Add misa.MAFD checks to
 translate
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
X-List-Received-Date: Mon, 14 Jan 2019 23:59:05 -0000

From: Michael Clark <mjc@sifive.com>

Add misa checks for M, A, F and D extensions and if they are
not present generate illegal instructions. This improves
emulation accurary for harts with a limited set of extensions.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Emilio G. Cota <cota@braap.org>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 158 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7ebea308b4..8593c2170a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -291,24 +291,42 @@ static void gen_arith(DisasContext *ctx, uint32_t opc=
, int rd, int rs1,
         tcg_gen_and_tl(source1, source1, source2);
         break;
     CASE_OP_32_64(OPC_RISC_MUL):
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_mul_tl(source1, source1, source2);
         break;
     case OPC_RISC_MULH:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_muls2_tl(source2, source1, source1, source2);
         break;
     case OPC_RISC_MULHSU:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         gen_mulhsu(source1, source1, source2);
         break;
     case OPC_RISC_MULHU:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_mulu2_tl(source2, source1, source1, source2);
         break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_DIVW:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_ext32s_tl(source1, source1);
         tcg_gen_ext32s_tl(source2, source2);
         /* fall through to DIV */
 #endif
     case OPC_RISC_DIV:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         /* Handle by altering args to tcg_gen_div to produce req'd results=
:
          * For overflow: want source1 in source1 and 1 in source2
          * For div by zero: want -1 in source1 and 1 in source2 -> -1 resu=
lt */
@@ -340,11 +358,17 @@ static void gen_arith(DisasContext *ctx, uint32_t opc=
, int rd, int rs1,
         break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_DIVUW:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_ext32u_tl(source1, source1);
         tcg_gen_ext32u_tl(source2, source2);
         /* fall through to DIVU */
 #endif
     case OPC_RISC_DIVU:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         cond1 =3D tcg_temp_new();
         zeroreg =3D tcg_const_tl(0);
         resultopt1 =3D tcg_temp_new();
@@ -364,11 +388,17 @@ static void gen_arith(DisasContext *ctx, uint32_t opc=
, int rd, int rs1,
         break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_REMW:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_ext32s_tl(source1, source1);
         tcg_gen_ext32s_tl(source2, source2);
         /* fall through to REM */
 #endif
     case OPC_RISC_REM:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         cond1 =3D tcg_temp_new();
         cond2 =3D tcg_temp_new();
         zeroreg =3D tcg_const_tl(0);
@@ -396,11 +426,17 @@ static void gen_arith(DisasContext *ctx, uint32_t opc=
, int rd, int rs1,
         break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_REMUW:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_ext32u_tl(source1, source1);
         tcg_gen_ext32u_tl(source2, source2);
         /* fall through to REMU */
 #endif
     case OPC_RISC_REMU:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         cond1 =3D tcg_temp_new();
         zeroreg =3D tcg_const_tl(0);
         resultopt1 =3D tcg_temp_new();
@@ -418,6 +454,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, =
int rd, int rs1,
         tcg_temp_free(zeroreg);
         tcg_temp_free(resultopt1);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         return;
@@ -698,13 +735,20 @@ static void gen_fp_load(DisasContext *ctx, uint32_t o=
pc, int rd,
=20
     switch (opc) {
     case OPC_RISC_FLW:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         tcg_gen_qemu_ld_i64(cpu_fpr[rd], t0, ctx->mem_idx, MO_TEUL);
         /* RISC-V requires NaN-boxing of narrower width floating point val=
ues */
         tcg_gen_ori_i64(cpu_fpr[rd], cpu_fpr[rd], 0xffffffff00000000ULL);
         break;
     case OPC_RISC_FLD:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         tcg_gen_qemu_ld_i64(cpu_fpr[rd], t0, ctx->mem_idx, MO_TEQ);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -730,11 +774,18 @@ static void gen_fp_store(DisasContext *ctx, uint32_t =
opc, int rs1,
=20
     switch (opc) {
     case OPC_RISC_FSW:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         tcg_gen_qemu_st_i64(cpu_fpr[rs2], t0, ctx->mem_idx, MO_TEUL);
         break;
     case OPC_RISC_FSD:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         tcg_gen_qemu_st_i64(cpu_fpr[rs2], t0, ctx->mem_idx, MO_TEQ);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -898,15 +949,22 @@ static void gen_fp_fmadd(DisasContext *ctx, uint32_t =
opc, int rd,
 {
     switch (opc) {
     case OPC_RISC_FMADD_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmadd_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                            cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
     case OPC_RISC_FMADD_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmadd_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                            cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -918,15 +976,22 @@ static void gen_fp_fmsub(DisasContext *ctx, uint32_t =
opc, int rd,
 {
     switch (opc) {
     case OPC_RISC_FMSUB_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmsub_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                            cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
     case OPC_RISC_FMSUB_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmsub_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                            cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -938,15 +1003,22 @@ static void gen_fp_fnmsub(DisasContext *ctx, uint32_=
t opc, int rd,
 {
     switch (opc) {
     case OPC_RISC_FNMSUB_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fnmsub_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                             cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
     case OPC_RISC_FNMSUB_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fnmsub_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                             cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -958,15 +1030,22 @@ static void gen_fp_fnmadd(DisasContext *ctx, uint32_=
t opc, int rd,
 {
     switch (opc) {
     case OPC_RISC_FNMADD_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fnmadd_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                             cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
     case OPC_RISC_FNMADD_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fnmadd_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                             cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -985,30 +1064,51 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t=
 opc, int rd,
=20
     switch (opc) {
     case OPC_RISC_FADD_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fadd_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]=
);
         break;
     case OPC_RISC_FSUB_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fsub_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]=
);
         break;
     case OPC_RISC_FMUL_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmul_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]=
);
         break;
     case OPC_RISC_FDIV_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fdiv_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]=
);
         break;
     case OPC_RISC_FSQRT_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fsqrt_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1]);
         break;
     case OPC_RISC_FSGNJ_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_fsgnj(ctx, rd, rs1, rs2, rm, INT32_MIN);
         break;
=20
     case OPC_RISC_FMIN_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         /* also handles: OPC_RISC_FMAX_S */
         switch (rm) {
         case 0x0:
@@ -1024,6 +1124,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
=20
     case OPC_RISC_FEQ_S:
         /* also handles: OPC_RISC_FLT_S, OPC_RISC_FLE_S */
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         t0 =3D tcg_temp_new();
         switch (rm) {
         case 0x0:
@@ -1045,6 +1148,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
=20
     case OPC_RISC_FCVT_W_S:
         /* also OPC_RISC_FCVT_WU_S, OPC_RISC_FCVT_L_S, OPC_RISC_FCVT_LU_S =
*/
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         t0 =3D tcg_temp_new();
         switch (rs2) {
         case 0: /* FCVT_W_S */
@@ -1075,6 +1181,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
=20
     case OPC_RISC_FCVT_S_W:
         /* also OPC_RISC_FCVT_S_WU, OPC_RISC_FCVT_S_L, OPC_RISC_FCVT_S_LU =
*/
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         t0 =3D tcg_temp_new();
         gen_get_gpr(t0, rs1);
         switch (rs2) {
@@ -1104,6 +1213,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
=20
     case OPC_RISC_FMV_X_S:
         /* also OPC_RISC_FCLASS_S */
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         t0 =3D tcg_temp_new();
         switch (rm) {
         case 0: /* FMV */
@@ -1125,6 +1237,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
         break;
=20
     case OPC_RISC_FMV_S_X:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         t0 =3D tcg_temp_new();
         gen_get_gpr(t0, rs1);
 #if defined(TARGET_RISCV64)
@@ -1137,22 +1252,37 @@ static void gen_fp_arith(DisasContext *ctx, uint32_=
t opc, int rd,
=20
     /* double */
     case OPC_RISC_FADD_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fadd_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]=
);
         break;
     case OPC_RISC_FSUB_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fsub_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]=
);
         break;
     case OPC_RISC_FMUL_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmul_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]=
);
         break;
     case OPC_RISC_FDIV_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fdiv_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]=
);
         break;
     case OPC_RISC_FSQRT_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fsqrt_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1]);
         break;
@@ -1162,6 +1292,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
=20
     case OPC_RISC_FMIN_D:
         /* also OPC_RISC_FMAX_D */
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         switch (rm) {
         case 0:
             gen_helper_fmin_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[=
rs2]);
@@ -1175,6 +1308,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
         break;
=20
     case OPC_RISC_FCVT_S_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         switch (rs2) {
         case 1:
             gen_set_rm(ctx, rm);
@@ -1186,6 +1322,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
         break;
=20
     case OPC_RISC_FCVT_D_S:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         switch (rs2) {
         case 0:
             gen_set_rm(ctx, rm);
@@ -1198,6 +1337,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
=20
     case OPC_RISC_FEQ_D:
         /* also OPC_RISC_FLT_D, OPC_RISC_FLE_D */
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         t0 =3D tcg_temp_new();
         switch (rm) {
         case 0:
@@ -1219,6 +1361,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
=20
     case OPC_RISC_FCVT_W_D:
         /* also OPC_RISC_FCVT_WU_D, OPC_RISC_FCVT_L_D, OPC_RISC_FCVT_LU_D =
*/
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         t0 =3D tcg_temp_new();
         switch (rs2) {
         case 0:
@@ -1249,6 +1394,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
=20
     case OPC_RISC_FCVT_D_W:
         /* also OPC_RISC_FCVT_D_WU, OPC_RISC_FCVT_D_L, OPC_RISC_FCVT_D_LU =
*/
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         t0 =3D tcg_temp_new();
         gen_get_gpr(t0, rs1);
         switch (rs2) {
@@ -1278,6 +1426,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
=20
     case OPC_RISC_FMV_X_D:
         /* also OPC_RISC_FCLASS_D */
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         switch (rm) {
 #if defined(TARGET_RISCV64)
         case 0: /* FMV */
@@ -1298,6 +1449,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
=20
 #if defined(TARGET_RISCV64)
     case OPC_RISC_FMV_D_X:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         t0 =3D tcg_temp_new();
         gen_get_gpr(t0, rs1);
         tcg_gen_mov_tl(cpu_fpr[rd], t0);
@@ -1797,6 +1951,9 @@ static void decode_RV32_64G(DisasContext *ctx)
                      GET_STORE_IMM(ctx->opcode));
         break;
     case OPC_RISC_ATOMIC:
+        if (!has_ext(ctx, RVA)) {
+            goto do_illegal;
+        }
         gen_atomic(ctx, MASK_OP_ATOMIC(ctx->opcode), rd, rs1, rs2);
         break;
     case OPC_RISC_FMADD:
@@ -1835,6 +1992,7 @@ static void decode_RV32_64G(DisasContext *ctx)
         gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
                    (ctx->opcode & 0xFFF00000) >> 20);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
--=20
2.19.1


