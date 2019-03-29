Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hA11P-0000pm-Lu
	for mharc-qemu-riscv@gnu.org; Fri, 29 Mar 2019 19:34:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA11H-0000cW-4B
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 19:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0AK-0007Xy-RD
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 18:40:01 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:55816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0AJ-0007XK-DI; Fri, 29 Mar 2019 18:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553899205; x=1585435205;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=tl+xYE2Ag76+rug00OyLCp+7ai/skmz4m8I3hOEHOsk=;
	b=N+o4Wwq4WsO70n6akf4NNRANBwsZlIkIbuzM7wI6nA1kQd3K7ChKHx7V
	zJVrHdRWVVLaU+UgMPKC0oumff2jwFl1YopsEE9g76BzdSDks9HnXrhbH
	7l8Jb1j93xB1/TVDaQKj+u0yRvHB+sWJhUiheNzRHRn/aIdTZcBnMDyvU
	AaWFbp8t/2bpS1QtDBca0zox2YjT+oFbK7SFyP2oUa+/I87Xif7FasPkK
	kXi9pkBwhHXJ3c8BRFKVR79WI1TtDGrzRJI5O5lbSe7m+LdVs1u4oRIdl
	kpDZu4WOIi8tNvoeWspihNoQrDd1QEKmqitQKt3w0gwUt1a40pHTPNWOK Q==;
X-IronPort-AV: E=Sophos;i="5.60,286,1549900800"; d="scan'208";a="203406008"
Received: from mail-co1nam04lp2050.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.50])
	by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2019 06:40:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7uC/t8Ht0x7cgW30qFfYD7V9rWaIb0DAvLxpgoD0Dbo=;
	b=D4JfSTzH4IVx0kse7x9xFOEmHBSl0eoYGgdfduhdDUXa/GmQR+Vp8J8nb0Be0brglD8AR/bKwOmWgxLlkgGX3h6XCrCXvv4zeBFJw5a7mDIBDw/vyQ9UWpnjRdFHNmWTaEd/GzOUUDrIursroEUlcPZ4M9FwJ0moIw+geC4Dln8=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5400.namprd04.prod.outlook.com (20.178.50.217) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Fri, 29 Mar 2019 22:39:57 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 29 Mar 2019 22:39:57 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v2 3/6] target/riscv: Create settable CPU
	properties
Thread-Index: AQHU5oBVS6xsMd6xUkq1wDezuX3MBw==
Date: Fri, 29 Mar 2019 22:39:56 +0000
Message-ID: <1bb1dbb8a5509131be161b08585421b7bd731541.1553899050.git.alistair.francis@wdc.com>
References: <cover.1553899050.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553899050.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR07CA0104.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::45) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48719856-6f4f-40c9-bb5a-08d6b4977807
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5400; 
x-ms-traffictypediagnostic: BYAPR04MB5400:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5400EE8A2A61CADCF8249C65905A0@BYAPR04MB5400.namprd04.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(6486002)(110136005)(118296001)(99286004)(3846002)(81166006)(8676002)(106356001)(102836004)(72206003)(4326008)(26005)(11346002)(2906002)(25786009)(66066001)(486006)(44832011)(105586002)(81156014)(186003)(2616005)(8936002)(446003)(478600001)(476003)(14454004)(6116002)(256004)(2501003)(7736002)(6512007)(5660300002)(53936002)(6506007)(86362001)(71190400001)(305945005)(52116002)(6436002)(386003)(50226002)(54906003)(68736007)(97736004)(316002)(71200400001)(76176011)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5400;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: imb9SnvSRjQKaV58czRKxYUrvHpFvsNA5oe650wUQ2EAx2w4An19O1cpHQoY4uWI649k/LI9/beG9JrZ9I4xZGfF+5SIdGv6/9r5Vx6ancmI0dyJcRE82WoceqCJHL0I2U/Xn//uh7alhN+ZESq5xWS+PkFg7S4dJR6+47T7fWB0rI7LIz6a/gz4priP2rg3jjxDR6nGDP1lATa7Q64FG7yS0DbsLtd98zVH58n2gVU2mxrW21w2qBYwN/9Ya5JYnpA9oDda59XH+BHkFRRuzozgiyJpix5WzswgmTKxZ9m+j/LY+9HXhbCph2xw7xXbeEstX/e5nK7j8CKbDElYlYfFWiUSZMQ9Kq0aspq3rSS5SoiZ21tNVIuMq2WsfmZHAsQDCQ7Gj2QMTWBGzZv2XDoVlLtfp205Lxpa2eW3gSc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48719856-6f4f-40c9-bb5a-08d6b4977807
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 22:39:56.9279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5400
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH for 4.1 v2 3/6] target/riscv: Create settable
 CPU properties
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 52 ++++++++++++++++++++++++++++++++++++++++++----
 target/riscv/cpu.h |  8 +++++++
 2 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 31561c719f..b6408e0a83 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
=20
 /* RISC-V CPU definitions */
@@ -185,12 +186,9 @@ static void riscv_generate_cpu_init(Object *obj)
     }
=20
     set_misa(env, rvxlen | target_misa);
-    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
-    set_resetvec(env, DEFAULT_RSTVEC);
-    set_feature(env, RISCV_FEATURE_MMU);
-    set_feature(env, RISCV_FEATURE_PMP);
 }
=20
+
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
@@ -388,7 +386,11 @@ static void riscv_cpu_disas_set_info(CPUState *s, disa=
ssemble_info *info)
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs =3D CPU(dev);
+    RISCVCPU *cpu =3D RISCV_CPU(dev);
+    CPURISCVState *env =3D &cpu->env;
     RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
+    int priv_version =3D PRIV_VERSION_1_10_0;
+    int user_version =3D USER_VERSION_2_02_0;
     Error *local_err =3D NULL;
=20
     cpu_exec_realizefn(cs, &local_err);
@@ -397,6 +399,39 @@ static void riscv_cpu_realize(DeviceState *dev, Error =
**errp)
         return;
     }
=20
+    if (cpu->cfg.priv_spec) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
+            priv_version =3D PRIV_VERSION_1_10_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.9.1")) {
+            priv_version =3D PRIV_VERSION_1_09_1;
+        } else {
+            error_report("Unsupported privilege spec version '%s'",
+                         cpu->cfg.priv_spec);
+            exit(1);
+        }
+    }
+
+    if (cpu->cfg.user_spec) {
+        if (!g_strcmp0(cpu->cfg.user_spec, "v2.02.0")) {
+            user_version =3D USER_VERSION_2_02_0;
+        } else {
+            error_report("Unsupported user spec version '%s'",
+                         cpu->cfg.user_spec);
+            exit(1);
+        }
+    }
+
+    set_versions(env, user_version, priv_version);
+    set_resetvec(env, DEFAULT_RSTVEC);
+
+    if (cpu->cfg.mmu) {
+        set_feature(env, RISCV_FEATURE_MMU);
+    }
+
+    if (cpu->cfg.pmp) {
+        set_feature(env, RISCV_FEATURE_PMP);
+    }
+
     riscv_cpu_register_gdb_regs_for_features(cs);
=20
     qemu_init_vcpu(cs);
@@ -418,6 +453,14 @@ static const VMStateDescription vmstate_riscv_cpu =3D =
{
     .unmigratable =3D 1,
 };
=20
+static Property riscv_cpu_properties[] =3D {
+    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+    DEFINE_PROP_STRING("user_spec", RISCVCPU, cfg.user_spec),
+    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
+    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
@@ -458,6 +501,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *=
data)
 #endif
     /* For now, mark unmigratable: */
     cc->vmsd =3D &vmstate_riscv_cpu;
+    dc->props =3D riscv_cpu_properties;
 }
=20
 char *riscv_isa_string(RISCVCPU *cpu)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 453108a855..bc877d8107 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -226,6 +226,14 @@ typedef struct RISCVCPU {
     CPUState parent_obj;
     /*< public >*/
     CPURISCVState env;
+
+    /* Configuration Settings */
+    struct {
+        char *priv_spec;
+        char *user_spec;
+        bool mmu;
+        bool pmp;
+    } cfg;
 } RISCVCPU;
=20
 static inline RISCVCPU *riscv_env_get_cpu(CPURISCVState *env)
--=20
2.21.0


