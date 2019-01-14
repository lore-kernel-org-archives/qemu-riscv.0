Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjC8O-0004M9-5E
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jan 2019 18:59:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC8M-0004KT-6w
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:59:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC8K-0001El-0g
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:59:10 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:63316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC8H-0001BK-1X; Mon, 14 Jan 2019 18:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547510345; x=1579046345;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=joXh3drRDsTOwGAsL9gR9z4Qal2LJiFZ37ieDgxbQAs=;
	b=FgFoM+sGWuX3Msi54irIAn0W1SdgTRmygBiVaSQGiclfAtmqjj9awxUb
	rnOEg9/tX71VSqtUkAtqmjtl/RDDwL0TSSUy3o0H8gxz8xfJjQCyoVBR+
	JTrd31k2F3glWr7f8L0UvAfh5zDkOeXBnrxySti5QAjPJSMiYtuQaQChq
	5Jc0FEt/ryz86G3KN+8GfyAZRItc5d2PwECT/J1BQVjKCDhWJ79gwgh8w
	Huioby3/d2R9Ck7SfkfIwMbqqYjy7Ul9xgIlTDJ5dEEt1BpRIjxZhLJK7
	2zmjLDIqRsLu7We/bMJv+DJYNvpxSmLs2Dd3ZmxX+AvbsPrYzNz2sA+LE A==;
X-IronPort-AV: E=Sophos;i="5.56,479,1539619200"; d="scan'208";a="103705301"
Received: from mail-bn3nam04lp2054.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.54])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2019 07:59:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tKwr9XkSU1jGyi83rA9Fj4Nkve83qEa3RWeGvrIuElo=;
	b=hk2cv2rJ7g2LJqwb3hOviOecW0x2OK+14HDlzqpcJIR9pcaYmxel3XmkSSDrNqlao/Gt6JPFFTo8ju+6Vwnka8HkURQQ4pOeXLX6bs9QEsjXKBFPbp8E8FMQljV7FHtX68tp4wuB+RNN39S8By5bhAxJ2hhqMqaChsm1MctcnVY=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1024.namprd04.prod.outlook.com (10.174.250.19) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Mon, 14 Jan 2019 23:59:01 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Mon, 14 Jan 2019 23:59:01 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 8/8] RISC-V: Add misa runtime write support
Thread-Index: AQHUrGUeBB1wDhZlAU2feZRCNUR/qQ==
Date: Mon, 14 Jan 2019 23:59:00 +0000
Message-ID: <f7184f107ba99dab6b85da6916fc09663ffd3e21.1547510220.git.alistair.francis@wdc.com>
References: <cover.1547510220.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1547510220.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0015.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::28) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1024;
	6:NMxCI+APpyGZqJvSmkQhrBBIFNFgDLqyYvShJbq2XGYkZHxynt5xcCW7A6xRUmUxo3ZLYRx4KCAfmBzwfrygqw+490vWCRERU3lktVd4YSAqqUsIei+tdICkkCxJY4EnieiP8i9+GTejGtxSPxZFCsEwduH3xuyZzcu/viSaMsMCHlSrC1ZWg22UuGmXBBFVD2QrhORlnLqws9a5cGYk7HI8qKWbFu4P5JzdQ0Y/eASHWvTMq/8h6TR/DSfAQpey4p0RVVAeiXIZkYPB5/mHTIxvDZe4l+I8TqIiCOxskknK4a4UpcFagMDRP4oHiNeZTdaTpO8BcuAPWR5lUcFbK1kRZZ/iN/MLPDgUdLbEy9OQSlcnNfmjCgiqziYwNVeI9PxHcPt2Gel3QriZdzJCagrl6v+D57bWAifcwUUC8bWv1OT0MlyYL8+RVjjFbhtqQIU82KcgouKmtzkU8TRSgw==;
	5:umJ0qInNxrXloV9743hDx4o9wgOzd8c8/dwBbdfNT4mzn9OT+fpBl2iV++cca0NSkiGVMFdacuzbt5p92UelLBLNsFcZ5vrVpt0gfmdOIY+ivwoOUKL2X+fvIsU8cOcA/89M1bExcmkhHvnhueyayOPVeH5VvWzgg598oFfsQbrgRirKfaaXj0tdoPD1YYXY+79zHl4alH4VLm0tl9TJqQ==;
	7:2MNIYi8um9p2Lzz/Ac9MGrRZQ4Jq1eoBOmFgOY1jWVl3bL7IqArpEJM4BtgwHZkKedu8IpqNMR14QigcXBVcykiyC1QWcReBhGcPo+PAfslAqyi7A6w92NplAIlAHEKwP2eGvzWllCVnUQSJ3bjWSg==
x-ms-office365-filtering-correlation-id: 07579fc3-7ece-4a55-126a-08d67a7c411a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1024; 
x-ms-traffictypediagnostic: MWHPR04MB1024:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB10240935293CC5EA2287DAEB90800@MWHPR04MB1024.namprd04.prod.outlook.com>
x-forefront-prvs: 0917DFAC67
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(396003)(346002)(136003)(39860400002)(189003)(199004)(97736004)(6506007)(186003)(26005)(3846002)(316002)(102836004)(6116002)(386003)(14454004)(36756003)(72206003)(99286004)(50226002)(2906002)(81156014)(81166006)(478600001)(305945005)(76176011)(66066001)(8936002)(8676002)(54906003)(110136005)(7736002)(52116002)(106356001)(71200400001)(105586002)(53936002)(6512007)(71190400001)(6436002)(256004)(14444005)(68736007)(6486002)(39060400002)(5660300001)(4326008)(86362001)(11346002)(486006)(446003)(44832011)(25786009)(2501003)(2616005)(118296001)(476003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1024;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UzXTCvXnuDLRGijoIS+lVALXEbD8UGeJABLz5YQm+sf5yE3gnKBrzmMc3eSznipUm+ePIJKHCM7KfOdqGXH2aVufqusuTu8XrQSA63qWctIt2PbSQyVGpqsM3kRCXMYXoQdXWHud5Mh0v4N8Ay1EJ4k5nlcqyyUyZl9Gb0K0SMkTRlLBAzGB0+93Vm2ekbS5gOJh6r7c60O8gTfB2XFsZuU6VJo9OVugPciKmglx95xEBB3QSpKvacoCSjqM69oeaNG6vxVjV1MDrDU8DwdwR9Hny7sLCOPIGGB+v31u7hd5LsH/aAxQAohS1A0s0Ks4fb95JnaMXBHl1siRp7638TLXKd5qsmsXonPwx4P19FUVhWcerBbLVUmZKVY+I+xeF8L4fwdvrcyZehb4D1Jy8jRfIGUB6yurOJljRPbhHL4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07579fc3-7ece-4a55-126a-08d67a7c411a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2019 23:59:00.4663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1024
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 8/8] RISC-V: Add misa runtime write support
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
X-List-Received-Date: Mon, 14 Jan 2019 23:59:11 -0000

From: Michael Clark <mjc@sifive.com>

This patch adds support for writing misa. misa is validated based
on rules in the ISA specification. 'E' is mutually exclusive with
all other extensions. 'D' depends on 'F' so 'D' bit is dropped
if 'F' is not present. A conservative approach to consistency is
taken by flushing the translation cache on misa writes. misa_mask
is added to the CPU struct to store the original set of extensions.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c      |  2 +-
 target/riscv/cpu.h      |  4 ++-
 target/riscv/cpu_bits.h | 11 +++++++++
 target/riscv/csr.c      | 54 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 28d7e5302f..cc3ddc0ae4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -88,7 +88,7 @@ typedef struct RISCVCPUInfo {
=20
 static void set_misa(CPURISCVState *env, target_ulong misa)
 {
-    env->misa =3D misa;
+    env->misa_mask =3D env->misa =3D misa;
 }
=20
 static void set_versions(CPURISCVState *env, int user_ver, int priv_ver)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a97435bd7b..5c2aebf132 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,7 +86,8 @@
    so a cpu features bitfield is required, likewise for optional PMP suppo=
rt */
 enum {
     RISCV_FEATURE_MMU,
-    RISCV_FEATURE_PMP
+    RISCV_FEATURE_PMP,
+    RISCV_FEATURE_MISA
 };
=20
 #define USER_VERSION_2_02_0 0x00020200
@@ -118,6 +119,7 @@ struct CPURISCVState {
     target_ulong user_ver;
     target_ulong priv_ver;
     target_ulong misa;
+    target_ulong misa_mask;
=20
     uint32_t features;
=20
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5439f4719e..7afcb2468d 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -311,10 +311,21 @@
 #define MSTATUS32_SD        0x80000000
 #define MSTATUS64_SD        0x8000000000000000ULL
=20
+#define MISA32_MXL          0xC0000000
+#define MISA64_MXL          0xC000000000000000ULL
+
+#define MXL_RV32            1
+#define MXL_RV64            2
+#define MXL_RV128           3
+
 #if defined(TARGET_RISCV32)
 #define MSTATUS_SD MSTATUS32_SD
+#define MISA_MXL MISA32_MXL
+#define MXL_VAL MXL_RV32
 #elif defined(TARGET_RISCV64)
 #define MSTATUS_SD MSTATUS64_SD
+#define MISA_MXL MISA64_MXL
+#define MXL_VAL MXL_RV64
 #endif
=20
 /* sstatus CSR bits */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e2bd374f09..e72fcf1265 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -332,6 +332,58 @@ static int read_misa(CPURISCVState *env, int csrno, ta=
rget_ulong *val)
     return 0;
 }
=20
+static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
+        /* drop write to misa */
+        return 0;
+    }
+
+    /* 'I' or 'E' must be present */
+    if (!(val & (RVI | RVE))) {
+        /* It is not, drop write to misa */
+        return 0;
+    }
+
+    /* 'E' excludes all other extensions */
+    if (val & RVE) {
+        /* when we support 'E' we can do "val =3D RVE;" however
+         * for now we just drop writes if 'E' is present.
+         */
+        return 0;
+    }
+
+    /* Mask extensions that are not supported by this hart */
+    val &=3D env->misa_mask;
+
+    /* Mask extensions that are not supported by QEMU */
+    val &=3D (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+
+    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
+    if ((val & RVD) && !(val & RVF)) {
+        val &=3D ~RVD;
+    }
+
+    /* Suppress 'C' if next instruction is not aligned
+     * TODO: this should check next_pc
+     */
+    if ((val & RVC) && (GETPC() & ~3) !=3D 0) {
+        val &=3D ~RVC;
+    }
+
+    /* misa.MXL writes are not supported by QEMU */
+    val =3D (env->misa & MISA_MXL) | (val & ~MISA_MXL);
+
+    /* flush translation cache */
+    if (val !=3D env->misa) {
+        tb_flush(CPU(riscv_env_get_cpu(env)));
+    }
+
+    env->misa =3D val;
+
+    return 0;
+}
+
 static int read_medeleg(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val =3D env->medeleg;
@@ -810,7 +862,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
=20
     /* Machine Trap Setup */
     [CSR_MSTATUS] =3D             { any,  read_mstatus,     write_mstatus =
    },
-    [CSR_MISA] =3D                { any,  read_misa                       =
    },
+    [CSR_MISA] =3D                { any,  read_misa,        write_misa    =
    },
     [CSR_MIDELEG] =3D             { any,  read_mideleg,     write_mideleg =
    },
     [CSR_MEDELEG] =3D             { any,  read_medeleg,     write_medeleg =
    },
     [CSR_MIE] =3D                 { any,  read_mie,         write_mie     =
    },
--=20
2.19.1


