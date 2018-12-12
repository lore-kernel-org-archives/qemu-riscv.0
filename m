Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXARG-0001iO-Bg
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:44:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXARA-0001dS-Se
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:44:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAR6-0002WO-Db
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:44:52 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:5174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAQu-0002PW-Ul; Wed, 12 Dec 2018 14:44:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643877; x=1576179877;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=ookweqeZLjeL2Lz7voqrc9DbCKjEM0E2+4wtuU2pn7I=;
	b=FMdJeJ20kqj+lvVJHyxigVyEanmn75NGMNfI5aRxkL4vNnHm8vB9r8fW
	LvyJEPz1e9IluaAs0RecEZMVRpiF3gzcsBfdgheFsEHrpkR1OuR6pmv/N
	OxODUE5l0xGYNGy/PltU+XkmC0WUl6vrmCG/5exHk9dJNkG8GX1Zdmv0L
	vYLLg8VmMVNVsBTLT6lxzS5z389u8Ecuf0qq5UP1qU/wt3dtDmxSYCc0e
	ZndpB8xgfKWmb7qZyLkUtzG/QLId2iC0ah0WdqN7WgF1wygNksCMHRDv1
	51KVr4VCqfzHQ7r8aIJNXgyumP8mmp17K2bKqh48kMj4rTm9UJ2eX+DpG g==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="97665492"
Received: from mail-bn3nam01lp2052.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.52])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:44:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VUghOF1seEr64l3rWn2OjydR/AZWutUqfs3IxJmNPxE=;
	b=fIAFFrKSeBIzdu/3JPb3oZd7yFWbEZdphJkKHeRdO74bEWJ3VbGkzIL/t75L8Naul2n4fx8t5e/7OMY4XhpbEXwHyDvEAT4w4l4VSIHfr5FTKGypQvBWXyWL+2tUi7V+CBm437d/gf+bR/ASdD7N/t27FrVS7DJFrwYN1tlbXUY=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0512.namprd04.prod.outlook.com (10.173.49.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 12 Dec 2018 19:44:33 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:44:33 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 11/23] riscv: tcg-target: Add the mov and movi
	instruction
Thread-Index: AQHUklMbUqUmdv9tdUatt/68+Omqbw==
Date: Wed, 12 Dec 2018 19:44:33 +0000
Message-ID: <0c8383b7652e682cd683a04f7e0660a26c1510af.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0027.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::40) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0512;
	6:E+BSqYLAD4eORCqROrBXuxNgHepspUlDcFBLCvs+i6aOyYRwV5DL4VEElELk4KKpwNL07EZJ/z1FIiGT6iEetWrFUV1mecOGpNAIgfmik899HXp5gPBPEU0l950vUkL8SOeXY9MKzYnSE+afljstJXlb0QX9Zk7/rj13lilRrV7qWM8f6VRtiXUzuzOzLoLz+FtGnwTLQDnVhZk4uwvZSOt8r+Zm6fPBXcUzaIqLgm2aDtgBYU19Hu0PfHeWiQBYeP8WnHlFKWa/DyJtcLteQyNxrna6/AZPYqI7tXX32Ae/rLvma+tqT2dvf9OwA9WBLdLS/t8oE9nwd9uAwrk23xBFf/vFOJ0q+QcSc6N92DMGKbSnDPdbyEA1huf1nRuPkDuvH5F2nU1yWUO8FKI9kIIO5fsssGYttptPtKGZroEO4m80dwoXTSRQZM5ynfTTsP5/1bYtki0H5v/l/Vaw7w==;
	5:VwSo5hzWHGeR4X2YnLoQhPPJZM6RbAy7ILlZ0+OEUaKS+PsvgxcHhaRkdb/A56ptwja8+F5Sq4edWYbyiPm7dvaTk1IgOPXZhEcOuDWdEstPXNqj/bhubNZZhEg426yoAC3R1/gSqkSSqdj4Q9s5P+wiuFUhhoHYXTAiD8ya8Kk=;
	7:9+Bj3bwVfi6e+aiCjFDERcwI6VupDjG8eVIkwmvEim4IzWlU6u49wE9+LihV0NjjlKpW2zo7DqkWWAfrGVfY8TMzf08aXzGp8V/wCPblhyVClCS+olb+IzSZgUYT77+QDV+QTfsKvt0o40ZXt7DQDQ==
x-ms-office365-filtering-correlation-id: 2404be85-371c-4bf6-a689-08d6606a3d56
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0512; 
x-ms-traffictypediagnostic: MWHPR04MB0512:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0512501FD7FEA89A31AEA20C90A70@MWHPR04MB0512.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(5005006)(8121501046)(3231472)(944501520)(52105112)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0512; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0512; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(396003)(366004)(136003)(376002)(199004)(189003)(316002)(66066001)(97736004)(71200400001)(2501003)(71190400001)(76176011)(486006)(8936002)(6506007)(386003)(102836004)(118296001)(3846002)(81166006)(44832011)(186003)(25786009)(26005)(11346002)(6436002)(6486002)(99286004)(2616005)(105586002)(8676002)(6116002)(81156014)(52116002)(5660300001)(6512007)(478600001)(72206003)(53936002)(68736007)(256004)(50226002)(110136005)(446003)(54906003)(39060400002)(14454004)(36756003)(7736002)(2906002)(476003)(4326008)(86362001)(305945005)(106356001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0512;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: FZnr0yBS7Jc/qGXLiGFV6brS4NSARmrj5FAopc49LwgiUJvrNoSIfiyV8yfl7gEhAzWGMwP1U3tIEF3+rr7f/IvvTMIOmvs52iSwFXoyo9D+4i2fpOZEemCiNveKYbGaaW17d9ShpOGBHqPnRbgJhMmdp0Mel2RClh7I7w32v9H1e2JGlxMrIbuBpzblaa/rbOVvWwoIgGkWoWgLTbwDLrsnf+8CFxklLcWVsI8nkPbqsAzwhf/6k3VWHBh8wbt9zEZczko7RkL8uQ+QAqJO+QRleQLjaV6nztIMEixPD9aHszMdTII2OmBMrRW+qrVO
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2404be85-371c-4bf6-a689-08d6606a3d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:44:33.5767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0512
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 11/23] riscv: tcg-target: Add the mov and
 movi instruction
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
X-List-Received-Date: Wed, 12 Dec 2018 19:44:57 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 85 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index e6ad5f8e4c..9baa8a19c4 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -497,3 +497,88 @@ static void patch_reloc(tcg_insn_unit *code_ptr, int t=
ype,
         tcg_abort();
     }
 }
+
+/*
+ * TCG intrinsics
+ */
+
+static void tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg ar=
g)
+{
+    if (ret =3D=3D arg) {
+        return;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+    case TCG_TYPE_I64:
+        tcg_out_opc_imm(s, OPC_ADDI, ret, arg, 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
+                         tcg_target_long val)
+{
+    tcg_target_long lo, hi, tmp;
+    int shift;
+
+    if (TCG_TARGET_REG_BITS =3D=3D 64 && type =3D=3D TCG_TYPE_I32) {
+        val =3D (int32_t)val;
+    }
+
+    lo =3D sextreg(val, 0, 12);
+    if (val =3D=3D lo) {
+        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, lo);
+        return;
+    }
+
+    hi =3D val - lo;
+    if (TCG_TARGET_REG_BITS =3D=3D 32 || val =3D=3D (int32_t)val) {
+        tcg_out_opc_upper(s, OPC_LUI, rd, hi);
+        if (lo !=3D 0) {
+            tcg_out_opc_imm(s, OPC_ADDIW, rd, rd, lo);
+        }
+        return;
+    }
+
+    /* We can only be here if TCG_TARGET_REG_BITS !=3D 32 */
+    tmp =3D tcg_pcrel_diff(s, (void *)val);
+    if (tmp =3D=3D (int32_t)tmp) {
+        tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
+        tcg_out_opc_imm(s, OPC_ADDI, rd, rd, 0);
+        reloc_call(s->code_ptr - 2, (tcg_insn_unit *)val);
+        return;
+    }
+
+    /* Look for a single 20-bit section.  */
+    shift =3D ctz64(val);
+    tmp =3D val >> shift;
+    if (tmp =3D=3D sextreg(tmp, 0, 20)) {
+        tcg_out_opc_upper(s, OPC_LUI, rd, tmp << 12);
+        if (shift > 12) {
+            tcg_out_opc_imm(s, OPC_SLLI, rd, rd, shift - 12);
+        } else {
+            tcg_out_opc_imm(s, OPC_SRAI, rd, rd, 12 - shift);
+        }
+        return;
+    }
+
+    /* Look for a few high zero bits, with lots of bits set in the middle.=
  */
+    shift =3D clz64(val);
+    tmp =3D val << shift;
+    if (tmp =3D=3D sextreg(tmp, 12, 20) << 12) {
+        tcg_out_opc_upper(s, OPC_LUI, rd, tmp);
+        tcg_out_opc_imm(s, OPC_SRLI, rd, rd, shift);
+        return;
+    } else if (tmp =3D=3D sextreg(tmp, 0, 12)) {
+        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, tmp);
+        tcg_out_opc_imm(s, OPC_SRLI, rd, rd, shift);
+        return;
+    }
+
+    /* Drop into the constant pool.  */
+    new_pool_label(s, val, R_RISCV_CALL, s->code_ptr, 0);
+    tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
+    tcg_out_opc_imm(s, OPC_LD, rd, rd, 0);
+}
--=20
2.19.1


