Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hA11Z-0000w0-Ev
	for mharc-qemu-riscv@gnu.org; Fri, 29 Mar 2019 19:35:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA11H-0000kn-I5
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 19:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0AD-0007WA-Gf
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 18:39:54 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17103)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0AB-0007VH-S8; Fri, 29 Mar 2019 18:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553899191; x=1585435191;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=BPRFn2Nm69XGE0QMGTe+yW2wqre5n+KD3rRyClUnldA=;
	b=m7iGGGDNUd3mAWkmPPGm3eLK25mgbHrDuJn/kdfMWiPp8tOUoeCbOeS1
	RG+0miDgp78QRiWmGsTDaitQaL2b23b1u6AO5Z2K+xqk/6kR3Rfcpg1Av
	iqbyelL78GVMx5u7XWexZy9GMp+rOM+cJFhtUjj4NfAbMWjFm/J52ePpY
	HGFh7R+yQebFt57TmAgYeIwCIYqdqGemtakgveE/ev5k1iP1FajBpASsJ
	zFrJ8MwrTpjwD7Or9ssm2U7kJntSfmPyfrsnaaj9oheKaBOp5Ya4bPQoX
	tfP+mCpj/mFnnj+NB0ghR2kdVUPuWrqO4t5R9JqI+mXsSrkcKVqJ1vFmX g==;
X-IronPort-AV: E=Sophos;i="5.60,286,1549900800"; d="scan'208";a="210282012"
Received: from mail-co1nam05lp2054.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.54])
	by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2019 06:39:49 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nqeNvi97Rs4I1hUjBknZLLAdr+X0Q0mf6zENlmf5LXU=;
	b=b80cTgE4mp47X1L49gBReEvpXm6D25ESAUf2EEHv7xz4sXlhqGqAlhs4oFSt60GJj0sV6N28eDoO0dSkrBe9WIQqzFQz4/O0CIkM8AN/RuQJ8aUnsYF2zZTz5KQHfGSgUX9d+IP+EWQBuivPBQtE2CpfHWPuUD/JTZhe1CBsNMU=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5400.namprd04.prod.outlook.com (20.178.50.217) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Fri, 29 Mar 2019 22:39:48 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 29 Mar 2019 22:39:48 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v2 2/6] target/riscv: Fall back to generating a
	RISC-V CPU
Thread-Index: AQHU5oBQrhRDOkxR50WVG9AJ6XU2dA==
Date: Fri, 29 Mar 2019 22:39:48 +0000
Message-ID: <99590ce3f3572a2b02216a5d99cec03ccc3f35a8.1553899050.git.alistair.francis@wdc.com>
References: <cover.1553899050.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553899050.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
	To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3ab090d-bf71-4ed5-4b66-08d6b49772ef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5400; 
x-ms-traffictypediagnostic: BYAPR04MB5400:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5400EA66C94AB9E435B2DCCB905A0@BYAPR04MB5400.namprd04.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(6486002)(110136005)(118296001)(99286004)(3846002)(81166006)(8676002)(106356001)(102836004)(72206003)(4326008)(26005)(11346002)(2906002)(25786009)(66066001)(486006)(44832011)(105586002)(81156014)(186003)(2616005)(14444005)(8936002)(446003)(478600001)(476003)(14454004)(6116002)(256004)(2501003)(7736002)(6512007)(5660300002)(53936002)(6506007)(86362001)(71190400001)(305945005)(52116002)(6436002)(386003)(50226002)(54906003)(68736007)(97736004)(316002)(71200400001)(76176011)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5400;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 40EVJAdJsE71jHpBt+HLkEcVVTwzllW2qTS6NyE701LJq0BZ+SP3BFe382gMDZlm7OfRZ1rU4/517iFTv/rcYQa9p7JDkLfUsFIqwI8H3N17L81oMKF6QMIfJ08L2Bz7BoJ0KjPrFCyEViFEt7tFCunMLLQEg7vhvdfXdj3uVOB4MIaboyZlygCoo4FPf4aL8GFPnuJPNbyVfBr56abqDIUFhunYISaIR3t8SpOcrSEOzQGxGn7i409Z9beZXlXa5TnCQLZGI/1ePizkajlDl5MCC+z1BMlbbT9a25Ce9zmwFobznE2XfqONEQaMtcTopm7cQ0/dlHLbNwyW1599VIDRgMDHw0yhG+yMTatACX6KsXPYKiL9+zk2jA2uepFMdX1ZGyuyyR1U2A0+VmivgePSD2+3+HHdo6J7lztCcl0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ab090d-bf71-4ed5-4b66-08d6b49772ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 22:39:48.3281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5400
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH for 4.1 v2 2/6] target/riscv: Fall back to
 generating a RISC-V CPU
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
X-List-Received-Date: Fri, 29 Mar 2019 23:34:47 -0000

If a user specifies a CPU that we don't understand then we want to fall
back to a CPU generated from the ISA string.

At the moment the generated CPU is assumed to be a privledge spec
version 1.10 CPU with an MMU. This can be changed in the future.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 95 +++++++++++++++++++++++++++++++++++++++++++++-
 target/riscv/cpu.h |  2 +
 2 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d61bce6d55..31561c719f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -19,6 +19,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
@@ -103,6 +104,93 @@ static void set_resetvec(CPURISCVState *env, int reset=
vec)
 #endif
 }
=20
+static void riscv_generate_cpu_init(Object *obj)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(obj);
+    CPURISCVState *env =3D &cpu->env;
+    RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
+    const char *riscv_cpu =3D mcc->isa_str;
+    target_ulong target_misa =3D 0;
+    target_ulong rvxlen =3D 0;
+    int i;
+    bool valid =3D false;
+
+    for (i =3D 0; i < strlen(riscv_cpu); i++) {
+        if (i =3D=3D 0 && riscv_cpu[i] =3D=3D 'r' &&
+            riscv_cpu[i + 1] =3D=3D 'v') {
+            /* Starts with "rv" */
+            i +=3D 2;
+            if (riscv_cpu[i] =3D=3D '3' && riscv_cpu[i + 1] =3D=3D '2') {
+                i +=3D 2;
+                valid =3D true;
+                rvxlen =3D RV32;
+            }
+            if (riscv_cpu[i] =3D=3D '6' && riscv_cpu[i + 1] =3D=3D '4') {
+                i +=3D 2;
+                valid =3D true;
+                rvxlen =3D RV64;
+            }
+        }
+
+        switch (riscv_cpu[i]) {
+        case 'i':
+            if (target_misa & RVE) {
+                error_report("I and E extensions are incompatible");
+                exit(1);
+            }
+            target_misa |=3D RVI;
+            continue;
+        case 'e':
+            if (target_misa & RVI) {
+                error_report("I and E extensions are incompatible");
+                exit(1);
+            }
+            target_misa |=3D RVE;
+            continue;
+        case 'g':
+            target_misa |=3D RVI | RVM | RVA | RVF | RVD;
+            continue;
+        case 'm':
+            target_misa |=3D RVM;
+            continue;
+        case 'a':
+            target_misa |=3D RVA;
+            continue;
+        case 'f':
+            target_misa |=3D RVF;
+            continue;
+        case 'd':
+            target_misa |=3D RVD;
+            continue;
+        case 'c':
+            target_misa |=3D RVC;
+            continue;
+        case 's':
+            target_misa |=3D RVS;
+            continue;
+        case 'u':
+            target_misa |=3D RVU;
+            continue;
+        default:
+            warn_report("QEMU does not support the %c extension",
+                        riscv_cpu[i]);
+            continue;
+        }
+    }
+
+    if (!valid) {
+        error_report("'%s' does not appear to be a valid RISC-V CPU",
+                     riscv_cpu);
+        exit(1);
+    }
+
+    set_misa(env, rvxlen | target_misa);
+    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
+    set_resetvec(env, DEFAULT_RSTVEC);
+    set_feature(env, RISCV_FEATURE_MMU);
+    set_feature(env, RISCV_FEATURE_PMP);
+}
+
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
@@ -178,6 +266,7 @@ static void rv64imacu_nommu_cpu_init(Object *obj)
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
+    RISCVCPUClass *mcc;
     char *typename;
     char **cpuname;
=20
@@ -188,7 +277,10 @@ static ObjectClass *riscv_cpu_class_by_name(const char=
 *cpu_model)
     g_free(typename);
     if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU) ||
         object_class_is_abstract(oc)) {
-        return NULL;
+        /* No CPU found, try the generic CPU and pass in the ISA string */
+        oc =3D object_class_by_name(TYPE_RISCV_CPU_GEN);
+        mcc =3D RISCV_CPU_CLASS(oc);
+        mcc->isa_str =3D g_strdup(cpu_model);
     }
     return oc;
 }
@@ -440,6 +532,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
         .class_init =3D riscv_cpu_class_init,
     },
     DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_GEN,              riscv_generate_cpu_init),
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_RV32GCSU_V1_09_1, rv32gcsu_priv1_09_1_cpu_in=
it),
     DEFINE_CPU(TYPE_RISCV_CPU_RV32GCSU_V1_10_0, rv32gcsu_priv1_10_0_cpu_in=
it),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 20bce8742e..453108a855 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -48,6 +48,7 @@
 #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
=20
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
+#define TYPE_RISCV_CPU_GEN              RISCV_CPU_TYPE_NAME("rv*")
 #define TYPE_RISCV_CPU_RV32GCSU_V1_09_1 RISCV_CPU_TYPE_NAME("rv32gcsu-v1.9=
.1")
 #define TYPE_RISCV_CPU_RV32GCSU_V1_10_0 RISCV_CPU_TYPE_NAME("rv32gcsu-v1.1=
0.0")
 #define TYPE_RISCV_CPU_RV32IMACU_NOMMU  RISCV_CPU_TYPE_NAME("rv32imacu-nom=
mu")
@@ -211,6 +212,7 @@ typedef struct RISCVCPUClass {
     /*< public >*/
     DeviceRealize parent_realize;
     void (*parent_reset)(CPUState *cpu);
+    const char *isa_str;
 } RISCVCPUClass;
=20
 /**
--=20
2.21.0


