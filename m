Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6JNw-00006z-Oz
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 14:22:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNs-0008Ur-UG
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:22:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNl-00018h-QC
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:22:44 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:47926)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNY-0000MN-Sq; Tue, 19 Mar 2019 14:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553019744; x=1584555744;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=tl+xYE2Ag76+rug00OyLCp+7ai/skmz4m8I3hOEHOsk=;
	b=GAk+By4BXtHGnlDS1KRixdlK+5KB/Ncp0Z5V6PhCuvYXAI2yXC0BnlgW
	5D93c2Y69kvhGjly2F4Rq/I/5RCfej+vCGFA5P6YUUAINVVk5mHo1y1yD
	+p9O1UvSzEg9QLjO7lJNTdTpJ53mTOry92AUHpue14rdff9Kucmehq9UN
	OBE2P6sPWUvhjBqIF21oItgyfqM9dwAzyjettj9tp3FnveA1n/QdQ0qTm
	rSWfdaNNBy8XNzqOrSZHTQfg3M+ccJQfcqk7NT1o3kKZIIOHEAHtYpRn7
	WO7wTvf9goIbC+yOqxya3jJn9PMvutbaBTAHi2IJ+hnWpvGFx0DYA0ISP g==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="209307023"
Received: from mail-bl2nam02lp2057.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.57])
	by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 02:21:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7uC/t8Ht0x7cgW30qFfYD7V9rWaIb0DAvLxpgoD0Dbo=;
	b=MVIhjs5g8qfTbV98BCXWAlora1cOL8+sIpHozOQ4+zpWfXr4gUChp2n6bcwZa/W77zVQzVGkpoCrdnjIVjyL/KkcQm+4jXRGwJHb8IVzoHwrK8cCXo2LgGWf+vhoolxXm7m9AS1ULDYmzv1Uj0XTwF6PeJy8VDBDHajidUA7Pb0=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4920.namprd04.prod.outlook.com (52.135.232.213) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.13; Tue, 19 Mar 2019 18:21:11 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.015;
	Tue, 19 Mar 2019 18:21:11 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v1 2/6] target/riscv: Create settable CPU
	properties
Thread-Index: AQHU3oCEG3n/sr6eE02Hxr2eXBDL2g==
Date: Tue, 19 Mar 2019 18:21:06 +0000
Message-ID: <81f94c7c3e29f0d3647685f22ea47f1d8917e0f0.1553019560.git.alistair.francis@wdc.com>
References: <cover.1553019560.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553019560.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR05CA0056.namprd05.prod.outlook.com
	(2603:10b6:a03:74::33) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97f3e19b-05ec-4b21-7d9e-08d6ac97a6c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4920; 
x-ms-traffictypediagnostic: BYAPR04MB4920:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB49203D8C1334563A704C1A7790400@BYAPR04MB4920.namprd04.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(39860400002)(346002)(136003)(396003)(199004)(189003)(68736007)(14454004)(72206003)(66066001)(2501003)(2906002)(54906003)(256004)(478600001)(7736002)(86362001)(305945005)(6116002)(81166006)(81156014)(8936002)(50226002)(97736004)(8676002)(36756003)(3846002)(106356001)(2616005)(11346002)(486006)(476003)(446003)(6666004)(316002)(71190400001)(71200400001)(44832011)(6436002)(6512007)(4326008)(25786009)(110136005)(102836004)(6486002)(76176011)(186003)(52116002)(53936002)(26005)(99286004)(118296001)(105586002)(5660300002)(6506007)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4920;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0qC7In768e+mK/Y/3hcae4VkSyNHzF52CSahL2qfcZvs+QiRCsNe6aoMNZVPumU5lFN+H6+nTlSDqGDJ8NhwjywEsWh0MB5H8mSEN1nI7ORuzaXDVLxyGi08VbJiUDHMnZmE6DkgaHMljxogTeWhzOGtJjdEI+zaDYS5oYVsUP3FGGgWmwTSYY64YQnLIDGbmOqO4dGO7idksSUUZiRujanBX77AuaiTpOS7e8byM0mzBDD79HI8JpFdlslrffkcd9wybi8YfNFplTtQ3havGmM5IWw7AF3GFC/ladNCjYCvvCE11aORXF8RpPl6rAUeygx6RLNhiO1lrCTHw2qOJfdTZ+pHstTpBUQQi5IIyLITXgdctxBFDmyFlhANRE9ycPOc32ujEADBsR14sBt8mytdh7LuKahLMfsxs14PDuo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f3e19b-05ec-4b21-7d9e-08d6ac97a6c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 18:21:06.1277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4920
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH for 4.1 v1 2/6] target/riscv: Create settable
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
X-List-Received-Date: Tue, 19 Mar 2019 18:22:47 -0000

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


