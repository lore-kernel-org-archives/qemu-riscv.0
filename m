Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjC88-00044y-Hk
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jan 2019 18:58:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC86-00042E-Ks
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:58:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC85-00011j-Pf
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:58:54 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:59875)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC83-0000px-Mj; Mon, 14 Jan 2019 18:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547510332; x=1579046332;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=c3lyJ/gc57nf1eRT/PN/b9MIOi/YCRIibqg9bz587N8=;
	b=KJNqnCFhh/bInLqc8gYr6URadhI0r6lra+edPuPuQ023scCAjvdxjWrf
	w7zVC13JLT70vTt4QJ6Jpbr+1QtCpOTErUScHysGM2wiDMFQ64Ho31YGL
	NU1GSgspyuGKIOjiGcHTJwd9SYeT+vafeCvdf+xiAegz3NBrO97YBHR5q
	3JeppFhcZtY6CMkEoVseFRvTw/RheLGe59hfswUgD/JCZGrFiGKEo7G0y
	ET1GJLbLNNij1RrFS7na6YpzeC/P68kG5SuijxeNVotiqJQ7+uQsNBwjT
	Irp5GpCDb6MZ9rHGr4NoOzDqqt/DTvd5re/m2cppZU3+xo5fEkCo4bbvl A==;
X-IronPort-AV: E=Sophos;i="5.56,479,1539619200"; d="scan'208";a="98765701"
Received: from mail-by2nam03lp2050.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.50])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2019 07:58:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=K7YngWmC9bMswtFfX9dNO6ols6xIz894i6CpoCE42Es=;
	b=TgrfvgeZtlhgE4WlOXToG5z96rgpPNj1IV2F3swwjie95SFJyzAmx5Yahr8S3c/XfZ0WTlIS6e0RmSPutsKxTNhFeqc08nzRc7cM9Z1uNTOmN03ksff6SBFxBRYqWhA3KGa5lDpkmzCKOZqJw6f+akZdIsG2SHQlG1M/V4Zjs9A=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0895.namprd04.prod.outlook.com (10.174.174.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Mon, 14 Jan 2019 23:58:38 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Mon, 14 Jan 2019 23:58:38 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 5/8] RISC-V: Add priv_ver to DisasContext
Thread-Index: AQHUrGUO+jH3VkYhVk+duCHz9kzzew==
Date: Mon, 14 Jan 2019 23:58:32 +0000
Message-ID: <b17f45cb9053318f20ca2a5b2167afa96c1f933a.1547510220.git.alistair.francis@wdc.com>
References: <cover.1547510220.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1547510220.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: MWHPR20CA0037.namprd20.prod.outlook.com
	(2603:10b6:300:ed::23) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0895;
	6:3CTf25qQyE3WrivxnMmTAM6hCWJYKVvLdj6d205K2vevmmSQA9FLV5ahGl673BCgRo9u+eO4z7fbs0TFjm3WCRy5ZYnGimd3OyUxc4bRC4wacamHPWTSQNPqoY/ynchGaNATfWUHdIdQ+cnJ3XijXP8nmvXfjaCpOr6d/hA0DJ8zCEv/RCakzttVcGeeQGW0Y/rgoqreufXgScVgPymqBlT/p03oO37fdMd0UDIX4Fq+3KfSe9BPjutvu/+GbrUDLpy5LwpqGXIRnZZlHSzA4X6jh/OgLBdRV59ztcE6EItHTf1poG0Gd8D2Ry67vupT3otr7bNy6Q7TP6Y726XyRI9ABfUokgA1PYfnj3nnDJFvvL8etQVDSjG2Vla8ziReZ2jWD+psX9INljhtvU9+UKWVhkd4wRLgHYtrh6RtLCv5XOEOdkJRDjLbxACprz/vrUKHEHeCiiS/mUy+ESNH3Q==;
	5:SxNv6V+2bvwJTZSDaEIdVdoiRTE4rVqh7ToFx79e/4FaG58N60WtI1yPbQRgx7TuWpF9rT6WXjv96gyzhFKqv6tNA/byBo/6knQfkGTqmxFih2Sz8z1wJHzzdKLzNATsNl+vKEBNR4njL29iOEqYJVS+KQxW+2Uey0gAMSj+2z+xOhpxriL1idwWuV30veV5TKDNPF0kx5TO0T1mFc0K9Q==;
	7:0Il6KfecVEkEgISDvaidpKMCaOmICvJRH280rK+Av4JNOLPYzbXRPTGhM8sgJJhQlLuudJsm8twwPIJlC7p3MciLQ2xbsUH3MyL60RrbFKuB7TX0TEy2IfdU2JUi+CynYZP1SKSxZyEoQIXPw+1y/w==
x-ms-office365-filtering-correlation-id: a69aa210-4af8-48ca-59e8-08d67a7c306e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0895; 
x-ms-traffictypediagnostic: MWHPR04MB0895:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0895ABC61E201B9E449362BF90800@MWHPR04MB0895.namprd04.prod.outlook.com>
x-forefront-prvs: 0917DFAC67
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(366004)(396003)(346002)(199004)(189003)(81156014)(118296001)(256004)(99286004)(72206003)(14444005)(386003)(6506007)(68736007)(5660300001)(6666004)(81166006)(4326008)(2501003)(8676002)(44832011)(105586002)(2906002)(8936002)(486006)(106356001)(71190400001)(7736002)(71200400001)(50226002)(110136005)(316002)(52116002)(54906003)(14454004)(53936002)(186003)(39060400002)(66066001)(6512007)(76176011)(6486002)(36756003)(478600001)(25786009)(2616005)(6436002)(6116002)(476003)(97736004)(3846002)(305945005)(102836004)(11346002)(26005)(446003)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0895;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OK5hAHwyiuqpQ/17ec5W3KPTUS7ADO9biETyJ7pFrerOtEilxrDYHdaJNqrT/09R3SX6pYmWkFRHZLJx8f214fwewfomUGL5gCa9L9uLxRmhzdDCOcTQ2sHP/wouxgHv7+OitJhsqOvgo7J8v5J+AIdsT4aHimkgjIYF6CTLlqrAgwlIL0RYYdHMWXTaKYe+q3uNIKSqhpyAwWIgkAQXa9O60mUdYpln/16JTi/YFUueLhquv2I3IztLwFSRuOywLdejhzikKKM9g6FlxF/4MdkAF6yVYPXIJBh/c0YM5buJ1o4QICw9BjKpvfzy1Th1o+vzJvZrSMy+9tICRn2Z6vp+Ob6CsFdVr0TWmZlmD9B7gKLVgANl69vKLrtN/FzqjIQCIS6c0f0gd3WPQpC0Brm3vr95qQ4LLx1jGOmcx94=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69aa210-4af8-48ca-59e8-08d67a7c306e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2019 23:58:32.5064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0895
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 5/8] RISC-V: Add priv_ver to DisasContext
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
X-List-Received-Date: Mon, 14 Jan 2019 23:58:55 -0000

The gen methods should access state from DisasContext. Add priv_ver
field to the DisasContext struct.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0581b3c1f7..833adf1d6f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -43,6 +43,7 @@ typedef struct DisasContext {
     DisasContextBase base;
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
+    target_ulong priv_ver;
     uint32_t opcode;
     uint32_t mstatus_fs;
     uint32_t mem_idx;
@@ -1330,7 +1331,7 @@ static void gen_system(CPURISCVState *env, DisasConte=
xt *ctx, uint32_t opc,
 #ifndef CONFIG_USER_ONLY
     /* Extract funct7 value and check whether it matches SFENCE.VMA */
     if ((opc =3D=3D OPC_RISC_ECALL) && ((csr >> 5) =3D=3D 9)) {
-        if (env->priv_ver =3D=3D PRIV_VERSION_1_10_0) {
+        if (ctx->priv_ver =3D=3D PRIV_VERSION_1_10_0) {
             /* sfence.vma */
             /* TODO: handle ASID specific fences */
             gen_helper_tlb_flush(cpu_env);
@@ -1384,7 +1385,7 @@ static void gen_system(CPURISCVState *env, DisasConte=
xt *ctx, uint32_t opc,
             gen_helper_wfi(cpu_env);
             break;
         case 0x104: /* SFENCE.VM */
-            if (env->priv_ver <=3D PRIV_VERSION_1_09_1) {
+            if (ctx->priv_ver <=3D PRIV_VERSION_1_09_1) {
                 gen_helper_tlb_flush(cpu_env);
             } else {
                 gen_exception_illegal(ctx);
@@ -1851,13 +1852,15 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx)
     }
 }
=20
-static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState=
 *cs)
+static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState=
 *cpu)
 {
     DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
+    CPURISCVState *env =3D cpu->env_ptr;
=20
     ctx->pc_succ_insn =3D ctx->base.pc_first;
     ctx->mem_idx =3D ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
     ctx->mstatus_fs =3D ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
+    ctx->priv_ver =3D env->priv_ver;
     ctx->frm =3D -1;  /* unknown rounding mode */
 }
=20
--=20
2.19.1


