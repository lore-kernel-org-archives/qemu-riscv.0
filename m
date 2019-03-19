Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6JNb-0008GR-Nu
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 14:22:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNX-0008DU-Rd
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:22:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNU-0000ZN-PX
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:22:23 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:47895)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNJ-0008FT-0c; Tue, 19 Mar 2019 14:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553019729; x=1584555729;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=BPRFn2Nm69XGE0QMGTe+yW2wqre5n+KD3rRyClUnldA=;
	b=oRdjLbYyLAURprocBpvp2QUXJbGS7gBvGaaCe94xsJvuRcoH/gqQAWKo
	iGU05i11m+GYAS7XVeGp1pT/CsS5lF3kjCby+bEQVgAXSvRmuSyNPpotZ
	f0d6+doVvU+LnTOQ/7pOhoL5zn+zOLVf3sddcQF0whhrdCZHHKDpBceJ5
	QvaVaKfkMufRsWOMXcV2oVvqXrNVNjMOcPlsgZamFZhuhe20ZkZ2aB5uY
	pjQGeKDw+CHG4IYZGT/qWntHZDZjZ9Yi1iQcxr9hWC3Zzr0p/T4KR22j6
	bBvVZoTy+EkJ5ENo5S3r/+30bDPiyiyTePLNBfW7+cq0kgHwzGC3JZehU Q==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="209307022"
Received: from mail-bl2nam02lp2057.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.57])
	by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 02:21:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nqeNvi97Rs4I1hUjBknZLLAdr+X0Q0mf6zENlmf5LXU=;
	b=dg0hLtsnHzXY8WcVgE0wPX55wFjnQH/20iZU2Ci6AMpjrrU0AyGxEjmyp60rswsqzbFyXD1zxySLLllHxskGCKo8TVJnVmY/QsKwOTCA92Wa49TC5eM9QE1Z39kqUTKD07osPyKmWRLFDAseOakXllU9XrQ1A6gwzz3Du3uoKJk=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4920.namprd04.prod.outlook.com (52.135.232.213) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.13; Tue, 19 Mar 2019 18:20:57 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.015;
	Tue, 19 Mar 2019 18:20:57 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v1 1/6] target/riscv: Fall back to generating a
	RISC-V CPU
Thread-Index: AQHU3oB/eT3KS//vn0a3705FukS/xw==
Date: Tue, 19 Mar 2019 18:20:57 +0000
Message-ID: <da94d6ff2576fa9c70b0f8d02ed07dc19927ea1e.1553019560.git.alistair.francis@wdc.com>
References: <cover.1553019560.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553019560.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR07CA0101.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::42) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd444c0a-ef3e-4255-c0d4-08d6ac97a16c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4920; 
x-ms-traffictypediagnostic: BYAPR04MB4920:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB49205281931B53C54128D01690400@BYAPR04MB4920.namprd04.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(39860400002)(346002)(136003)(396003)(199004)(189003)(68736007)(14454004)(72206003)(66066001)(2501003)(2906002)(14444005)(54906003)(256004)(478600001)(7736002)(86362001)(305945005)(6116002)(81166006)(81156014)(8936002)(50226002)(97736004)(8676002)(36756003)(3846002)(106356001)(2616005)(11346002)(486006)(476003)(446003)(316002)(71190400001)(71200400001)(44832011)(6436002)(6512007)(4326008)(25786009)(110136005)(102836004)(6486002)(76176011)(186003)(52116002)(53936002)(26005)(99286004)(118296001)(105586002)(5660300002)(6506007)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4920;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vTJoUxSRLOLzwSpscQplxh6VqI8NetlL3QhtoDmzKSO5fm6kw1/radsjKRMJUijV+ZVgj8qe2+22U3zTdLOJyqcwXI6XEisf/pTKa/CeAObooFw8LyfgvNK9qx5l+m2my6xFgcdU9VcxmK5ZpvjMvCQrB6wqHBtLgt0opui3aHO725pAawatxdRcfb2wHWMW3pH+4UamFiCCn2BxXFE4WQyb4cluZDOcrBDwT4ZG6FgYplK4p8DwdV0jjXXyDl2/cmLvvSUtK0uAxpwmkGBzc3osk12Ew8NGcDsXU79zRaO4dUZtcfqfkiyOaCpKjw6ivF7cGgKy4juLXGBe5BObhcXb0ewXJynNZ4Zk4oFt1zQyBCOnZmqszMoyYCb7IaCmiOgSLW2qruiSUlTfhNytrTGujRzEpkmbc74FBIno7CQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd444c0a-ef3e-4255-c0d4-08d6ac97a16c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 18:20:57.2975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4920
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH for 4.1 v1 1/6] target/riscv: Fall back to
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
X-List-Received-Date: Tue, 19 Mar 2019 18:22:26 -0000

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


