Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjC7D-0003PC-17
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jan 2019 18:57:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC7A-0003NH-Ow
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:57:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC79-000080-OG
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:57:56 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37581)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC76-0008VI-Pc; Mon, 14 Jan 2019 18:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547510273; x=1579046273;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=IonCrrBwRjNJSQbOSqo9wYC/kkq/iniDOOLQwPr/BWU=;
	b=arKX/fuFv+ks2cakizXiaaJPuq7++4URkVorT2RmSt7oez2vf/wWz8wX
	eg4+7ZR3kOhp2+eT11mTtKFapWdiXGl2d6xzFey+jTlQIGe1p1D+WeN8q
	ao0AFdi36GyU5hce/TMu0gAgVlT2Q356tcErQQxADSAtyDTyD2MAtTArl
	Z2z8p7ZvP2IZnxO90jpx7W7pKC/wgIB++D3o8ZOOV0HmumMMKck1aRp6U
	I3XjUZnyWsvz3/F0p0gIfcOLyYnP27mO5YXdq9w//gmSWwUghvrJynDPY
	f/qh1ppcf8AQseeyXIlNxzHatKjggIHemPNqgU9XKOg/dgV8VEzXXfJ5O Q==;
X-IronPort-AV: E=Sophos;i="5.56,479,1539619200"; d="scan'208";a="100549138"
Received: from mail-by2nam03lp2058.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.58])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2019 07:57:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=l9H7475fvlAWvRjNGS8I0qnLM0kuBeL6F2Lf+C24AGA=;
	b=H0r6ZP4FT3NS1y4PFu2bxeJn0AHD3YOpYXtjHv7UhD7T0QICoeUlGBAvFI5OJUMBdY00QOIWASirWQyYk9pg5qxEYPvyhRBFb55K2suxlVrnm06WzUOKkn4qvSDZmeTIBtyH1uRiQ91aI3Lw0YiwOD1QKGS837/h7GFHvt+eSUE=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0895.namprd04.prod.outlook.com (10.174.174.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Mon, 14 Jan 2019 23:57:50 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Mon, 14 Jan 2019 23:57:50 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 1/8] RISC-V: Split out mstatus_fs from tb_flags
Thread-Index: AQHUrGT0FdAhRKkQwkqbBBZ1tlwNeQ==
Date: Mon, 14 Jan 2019 23:57:50 +0000
Message-ID: <c03e616f16ca91d5d6b6004949820109d8283791.1547510220.git.alistair.francis@wdc.com>
References: <cover.1547510220.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1547510220.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: MWHPR20CA0038.namprd20.prod.outlook.com
	(2603:10b6:300:ed::24) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0895;
	6:5vCwtVSpyRPGym9H6Emd6Nwd/nmmzDdNEQUIiCv7Q5o9FDYvDLTDSNRzWQc7OkB4LfpOsA/5eI8O4ZBWSePWjVDR4EmF5RRc6nydB5hWWNsoJjzDnwqPag0dAmT517gQNubbXb9Y+oZIfA7qkaUsjjTUg38mXo143q+dX91bGVCUDoZh/XqVvh7sz88aWzhspMt6xhkRg4T8bjwk4auxVMwBRUHWXW+xRofwcv4Av1S3Q8AtN8lrkMJvmmXevtVmlfHYJSZ3V0lJpGR/PrTgj2dvp2FYHf8JVYWSQAgrIkNFLIEitpeuGhsuGB3EUqdoZVUmz/2VyO1+vZa0dmQbdeeK/JTv59iyjNkpTYK3PyktqVMCxMr6W6B9hEb2T/s9764XP80WHWl+fkEA2tUPxSEBNFO/DwlXE3Hs9eu/AIOqT3bw8mt9swI793D/pOm3rww0XfmDhxG051lojCCjTw==;
	5:GkpnmMaqt258aUUrCvrTGCjf/4TH8K2MWL8yGS1kBLaRF1SSqkErNqMr5q32Y2LlLwMRyQ3jxqqHMykwOjqdSBuZmjSxwXQSFEOCElZhdIOf3Mcj7jpRpzdLzbaWf8Clan/a/Xbq3GaAsKTpPplHcotKBzXTu374JFQU82/W3UgV7mu5DcgfiT/4S/1PNAAs5TPSjV8aQ6qQlPD6npZmqQ==;
	7:TeR/yxeFoQZmuI2eTKtXena8EVxjUBJFxC/cXhhhoA1rLMcMmB5oqizD8L5LBEDfckUWJIx/DxhTF81UzHSGbuz151W1Z56f58Hr+XheF4/T1G5zX+fWiH5Jkx0mAJ2LJWfVsViO1RuQ2mNV21npiA==
x-ms-office365-filtering-correlation-id: f2347940-e678-4e19-5c1e-08d67a7c1706
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0895; 
x-ms-traffictypediagnostic: MWHPR04MB0895:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0895E5BACA3F04CE1DDDEB0F90800@MWHPR04MB0895.namprd04.prod.outlook.com>
x-forefront-prvs: 0917DFAC67
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(366004)(396003)(346002)(199004)(189003)(81156014)(118296001)(256004)(99286004)(72206003)(386003)(6506007)(68736007)(5660300001)(81166006)(4326008)(2501003)(8676002)(44832011)(105586002)(2906002)(8936002)(486006)(106356001)(71190400001)(7736002)(71200400001)(50226002)(110136005)(316002)(52116002)(54906003)(14454004)(53936002)(186003)(39060400002)(66066001)(6512007)(76176011)(6486002)(36756003)(478600001)(25786009)(2616005)(6436002)(6116002)(476003)(97736004)(3846002)(305945005)(102836004)(11346002)(26005)(446003)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0895;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /p6q+66dO6SSDD94fKYsAz6LoUtuMyZEirniKqQ53ZnezsDEtwJH3hhN3KcJ5FEg5iU7kjiIWmNVMi7kl7y68YsfyWhGi7eaGA2/b+Hzl6GN/iCMwTx1gPIO0bENvnqwG5frtZRUDz4sGAmsI4a4KOjH7Df67nPdmPw4nLRc5qVHjzbXC1FU9VxbeBrx1Buy9VleL6KbJVLGhT6XSE7MLxM96RwHf+X+7DUtu791MX2HF/nS6A/gAvZK5WTcsiLo6n4wDas17gfH8Q2H1XHqXbqXIq9p1MOasyJreLjHqbEyTqma8oEknDHlCsBMk6gjUlCvl5407ko/5Le4RhJlcAjWaWiLz3JXdh+J3pq3yaQiHnChqUoVDHVxKO1Y7GfaOahmHKVJH/hl3ANPpdQQEBGrH3aQA3i7ZQazlR5+NlA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2347940-e678-4e19-5c1e-08d67a7c1706
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2019 23:57:49.8818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0895
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v1 1/8] RISC-V: Split out mstatus_fs from
 tb_flags
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
X-List-Received-Date: Mon, 14 Jan 2019 23:57:57 -0000

From: Richard Henderson <richard.henderson@linaro.org>

Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       |  6 +++---
 target/riscv/translate.c | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 743f02c8b9..681341f5d5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -275,8 +275,8 @@ void QEMU_NORETURN do_raise_exception_err(CPURISCVState=
 *env,
 target_ulong cpu_riscv_get_fflags(CPURISCVState *env);
 void cpu_riscv_set_fflags(CPURISCVState *env, target_ulong);
=20
-#define TB_FLAGS_MMU_MASK  3
-#define TB_FLAGS_FP_ENABLE MSTATUS_FS
+#define TB_FLAGS_MMU_MASK   3
+#define TB_FLAGS_MSTATUS_FS MSTATUS_FS
=20
 static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *=
pc,
                                         target_ulong *cs_base, uint32_t *f=
lags)
@@ -284,7 +284,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *=
env, target_ulong *pc,
     *pc =3D env->pc;
     *cs_base =3D 0;
 #ifdef CONFIG_USER_ONLY
-    *flags =3D TB_FLAGS_FP_ENABLE;
+    *flags =3D TB_FLAGS_MSTATUS_FS;
 #else
     *flags =3D cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 312bf298b3..3d07d651b6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -44,7 +44,7 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     uint32_t opcode;
-    uint32_t flags;
+    uint32_t mstatus_fs;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -656,7 +656,7 @@ static void gen_fp_load(DisasContext *ctx, uint32_t opc=
, int rd,
 {
     TCGv t0;
=20
-    if (!(ctx->flags & TB_FLAGS_FP_ENABLE)) {
+    if (ctx->mstatus_fs =3D=3D 0) {
         gen_exception_illegal(ctx);
         return;
     }
@@ -686,7 +686,7 @@ static void gen_fp_store(DisasContext *ctx, uint32_t op=
c, int rs1,
 {
     TCGv t0;
=20
-    if (!(ctx->flags & TB_FLAGS_FP_ENABLE)) {
+    if (ctx->mstatus_fs =3D=3D 0) {
         gen_exception_illegal(ctx);
         return;
     }
@@ -945,7 +945,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t op=
c, int rd,
 {
     TCGv t0 =3D NULL;
=20
-    if (!(ctx->flags & TB_FLAGS_FP_ENABLE)) {
+    if (ctx->mstatus_fs =3D=3D 0) {
         goto do_illegal;
     }
=20
@@ -1818,8 +1818,8 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
=20
     ctx->pc_succ_insn =3D ctx->base.pc_first;
-    ctx->flags =3D ctx->base.tb->flags;
     ctx->mem_idx =3D ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
+    ctx->mstatus_fs =3D ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
     ctx->frm =3D -1;  /* unknown rounding mode */
 }
=20
--=20
2.19.1


