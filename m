Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gfYpV-0002py-9i
	for mharc-qemu-riscv@gnu.org; Fri, 04 Jan 2019 18:24:41 -0500
Received: from eggsout.gnu.org ([209.51.188.92]:39467 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=90010c98c=Alistair.Francis@wdc.com>)
	id 1gfYpS-0002kf-9m
	for qemu-riscv@nongnu.org; Fri, 04 Jan 2019 18:24:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=90010c98c=Alistair.Francis@wdc.com>)
	id 1gfYpP-000467-43
	for qemu-riscv@nongnu.org; Fri, 04 Jan 2019 18:24:38 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:29866)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=90010c98c=Alistair.Francis@wdc.com>)
	id 1gfYpC-0003yz-9K; Fri, 04 Jan 2019 18:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1546644262; x=1578180262;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=d8u/kqKkENQz2lTFRT10+jXynUM1pSnYhY/s1uNprOs=;
	b=cazoju67eGonLIUkw28u8vANfK2PNZ7Pc/rU6JmsTbEFqufKiERNmL2v
	M2u/YvEB9D1+pd4DWIv1WlzwcdJrdSWrE79EpwO9ykaOrUGU8gqD824vA
	RotBdrahpCrHYCX9W54T9uQNuD0wgnd+iL2HAZ+FinL3y79hh4PvIOBfO
	jaJ29Hbgy2C/tf56YJjhavdfJs9bm7SqgfM09KngfQyjdiHICGIXPM6Ve
	3R8xRFNe6SPgstIB/POgXlnfWYuNRk17C/kM/X9PDXl79piPqVjnij/dG
	L4j1Ldhe6eryA2iRcAiPFlmJKg1H9t7Orr3dOKV1T/NI6Kpq3cQDl7h2F g==;
X-IronPort-AV: E=Sophos;i="5.56,440,1539619200"; d="scan'208";a="202843134"
Received: from mail-sn1nam01lp2058.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.58])
	by ob1.hgst.iphmx.com with ESMTP; 05 Jan 2019 07:24:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=j7Y7Cl1Xu0+fIzKMDsOfA7KDPswMeNpDBvSpu7y+KaE=;
	b=iGoaofenTfBH4Kqq9zUxG/5P9P2oID7xkhIuMLImQiTkRrpmdvRQcdhkPGCkMS4gCmxl5L3yOqRnOb820N9XfaA1CoKL4f0GbPsWnuaiuwrII6eYzZE50n0NHSdwWMpnOwnj+cX4PVyoIG9bFD8C9x/AwX88wFiK69RPWViczzk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0848.namprd04.prod.outlook.com (10.172.168.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.7; Fri, 4 Jan 2019 23:24:14 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%6]) with mapi id 15.20.1495.005;
	Fri, 4 Jan 2019 23:24:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 3/3] RISC-V: Implement existential predicates for CSRs
Thread-Index: AQHUpISaXgZ3DSSGOkC++WY7OlIOgA==
Date: Fri, 4 Jan 2019 23:24:14 +0000
Message-ID: <d736544130389f0222d7087f9325060beb0cf5e7.1546644177.git.alistair.francis@wdc.com>
References: <cover.1546644177.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1546644177.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0089.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::30) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0848;
	6:Z4afkUwh4X4V6ocRvQutoWahsD3C9G/nZI8nOQ4E6dkdI1LCkAh4eZMRqEOqal6lamarFFCNNDK6mM3smkMDfslgLIgt6DkWXj9Z59tt20Gz5CF3LqKfl0gcf/ntUNehCZ5Xz013yaryj3ZYul5e5ZSv2f2t9MVqn7WQzKCm4nhVSG/be83N6GW4klxwDs05x4MsYBPvr5X808bfX9GW5CQDYlC+aWvHh/EVwm6r08PQ9BdTzV2mFyZGuftt+lCoNsm/ICHM0UDLpYtVTvrdb/gZk3KlfM+EPZKEpKc8qWuZBZX0QSIOeZ65SnoplacMAbhZ5N4Ihi58kf0XKHF39Z0DizuvIm9h8jSxMrxGvLj/q18BuuPfKfpWnHsWJ26YMqbbROYlrZuNNy/k2nH3EbiYCUvm2Y4j3ZeUzDrKIRuGzwik5vB9OFywSlGiSm16rF54ILLCu3Njy8d7/Far1w==;
	5:Cd4Q1KdYP95FowDQyIWoMcAsdEpXgMZaIm3fAOFk3Env5Mjnj1zQgWTWX34bDs4NhleESYYS1eNXwyTrJQQitQ8ohV41/n0W4RMNGqiITNflag7/Gsx0B85V1ExCmdywfMG+1NWjy+/TfWeR3M31oVZRsWdE4DC64O6DXJ8Msv3NKne9d+Cx9mv1MEJ9sTwOMZaGXMWMkqGQX1d04c8KFw==;
	7:C8Q0c50k2UJxODWqHBueVBk/r2/UiPgL/+W7i4usnCkWyQle/Qf4cH7trg2wCdiDC8jozOCX4OC4kgOVfS7ugKycLbWWUvbr9ZwVo2Jf0KKyXmfUFLdDnyJ+JHz0xV65V9XMYXmpj/zo77/5rA/AvQ==
x-ms-office365-filtering-correlation-id: 2160d1e8-b098-40fd-00ea-08d6729bbd25
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0848; 
x-ms-traffictypediagnostic: MWHPR04MB0848:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0848987759AEDC7118640D52908E0@MWHPR04MB0848.namprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231475)(944501520)(52105112)(6055026)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0848; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0848; 
x-forefront-prvs: 0907F58A24
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(376002)(136003)(346002)(396003)(199004)(189003)(5660300001)(68736007)(446003)(11346002)(71190400001)(71200400001)(97736004)(4744004)(2906002)(25786009)(2501003)(4326008)(476003)(486006)(2616005)(44832011)(66066001)(316002)(186003)(39060400002)(72206003)(478600001)(106356001)(105586002)(99286004)(118296001)(54906003)(86362001)(110136005)(52116002)(36756003)(14454004)(6506007)(386003)(6486002)(26005)(102836004)(81156014)(81166006)(50226002)(8936002)(256004)(14444005)(305945005)(7736002)(53936002)(6436002)(76176011)(6116002)(8676002)(6512007)(3846002)(53946003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0848;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RndaQdjwaT7AwSQ59Kmw7YE1uiGpqKT5znSw0UvTi8quPU48iPFTXV3ILM0M9ojAhwR+CMwdlVghQ64s8Q2YhYlXd2eeiO8mB8+PjcXPpdFnvTrnH2Sf0CB8qnodJf+qEvZfZu9W5pWKGr4TuCuPaf52vdHdWWmTZDI/2PG+xjgmu3b5VnT4G5ymATmFpC7QE1PS06EfaoI/OY3LqJ9cuve4YG8TsF9vpzFSLRsUrjnZNPKaI5T0gRxTUvT94OUAeCWzTmjBttcyWWSzpQpo9+pTFGZLc4kgpxGlnyHMYew+hzdL34VUznYDext+yReD
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2160d1e8-b098-40fd-00ea-08d6729bbd25
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2019 23:24:14.1601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0848
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v1 3/3] RISC-V: Implement existential
 predicates for CSRs
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
X-List-Received-Date: Fri, 04 Jan 2019 23:24:40 -0000

From: Michael Clark <mjc@sifive.com>

CSR predicate functions are added to the CSR table.
mstatus.FS and counter enable checks are moved
to predicate functions and two new predicates are
added to check misa.S for s* CSRs and a new PMP
CPU feature for pmp* CSRs.

Processors that don't implement S-mode will trap
on access to s* CSRs and processors that don't
implement PMP will trap on accesses to pmp* CSRs.

PMP checks are disabled in riscv_cpu_handle_mmu_fault
when the PMP CPU feature is not present.

Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        |   6 ++
 target/riscv/cpu.h        |   6 +-
 target/riscv/cpu_helper.c |   3 +-
 target/riscv/csr.c        | 169 +++++++++++++++++++++-----------------
 4 files changed, 105 insertions(+), 79 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5e8a2cb2ba..28d7e5302f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -126,6 +126,7 @@ static void rv32gcsu_priv1_09_1_cpu_init(Object *obj)
     set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_09_1);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
+    set_feature(env, RISCV_FEATURE_PMP);
 }
=20
 static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
@@ -135,6 +136,7 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
     set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
+    set_feature(env, RISCV_FEATURE_PMP);
 }
=20
 static void rv32imacu_nommu_cpu_init(Object *obj)
@@ -143,6 +145,7 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
     set_misa(env, RV32 | RVI | RVM | RVA | RVC | RVU);
     set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
+    set_feature(env, RISCV_FEATURE_PMP);
 }
=20
 #elif defined(TARGET_RISCV64)
@@ -154,6 +157,7 @@ static void rv64gcsu_priv1_09_1_cpu_init(Object *obj)
     set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_09_1);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
+    set_feature(env, RISCV_FEATURE_PMP);
 }
=20
 static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
@@ -163,6 +167,7 @@ static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
     set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
+    set_feature(env, RISCV_FEATURE_PMP);
 }
=20
 static void rv64imacu_nommu_cpu_init(Object *obj)
@@ -171,6 +176,7 @@ static void rv64imacu_nommu_cpu_init(Object *obj)
     set_misa(env, RV64 | RVI | RVM | RVA | RVC | RVU);
     set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
+    set_feature(env, RISCV_FEATURE_PMP);
 }
=20
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4aeaa32049..743f02c8b9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -83,9 +83,10 @@
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
    is currently no bit in misa to indicate whether an MMU exists or not
-   so a cpu features bitfield is required */
+   so a cpu features bitfield is required, likewise for optional PMP suppo=
rt */
 enum {
-    RISCV_FEATURE_MMU
+    RISCV_FEATURE_MMU,
+    RISCV_FEATURE_PMP
 };
=20
 #define USER_VERSION_2_02_0 0x00020200
@@ -314,6 +315,7 @@ typedef int (*riscv_csr_op_fn)(CPURISCVState *env, int =
csrno,
     target_ulong *ret_value, target_ulong new_value, target_ulong write_ma=
sk);
=20
 typedef struct {
+    riscv_csr_predicate_fn predicate;
     riscv_csr_read_fn read;
     riscv_csr_write_fn write;
     riscv_csr_op_fn op;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4ef7f5c1f9..f257050f12 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -404,7 +404,8 @@ int riscv_cpu_handle_mmu_fault(CPUState *cs, vaddr addr=
ess, int size,
     qemu_log_mask(CPU_LOG_MMU,
             "%s address=3D%" VADDR_PRIx " ret %d physical " TARGET_FMT_plx
              " prot %d\n", __func__, address, ret, pa, prot);
-    if (!pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << rw)) {
+    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << rw)) {
         ret =3D TRANSLATE_FAIL;
     }
     if (ret =3D=3D TRANSLATE_SUCCESS) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 44ea8b7cb6..5e7e7d16b8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -42,6 +42,46 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *=
ops)
     csr_ops[csrno & (CSR_TABLE_SIZE - 1)] =3D *ops;
 }
=20
+/* Predicates */
+static int fs(CPURISCVState *env, int csrno)
+{
+#if !defined(CONFIG_USER_ONLY)
+    if (!(env->mstatus & MSTATUS_FS)) {
+        return -1;
+    }
+#endif
+    return 0;
+}
+
+static int ctr(CPURISCVState *env, int csrno)
+{
+#if !defined(CONFIG_USER_ONLY)
+    target_ulong ctr_en =3D env->priv =3D=3D PRV_U ? env->scounteren :
+                          env->priv =3D=3D PRV_S ? env->mcounteren : -1U;
+    if (!(ctr_en & (1 << (csrno & 31)))) {
+        return -1;
+    }
+#endif
+    return 0;
+}
+
+#if !defined(CONFIG_USER_ONLY)
+static int any(CPURISCVState *env, int csrno)
+{
+    return 0;
+}
+
+static int smode(CPURISCVState *env, int csrno)
+{
+    return -!riscv_has_ext(env, RVS);
+}
+
+static int pmp(CPURISCVState *env, int csrno)
+{
+    return -!riscv_feature(env, RISCV_FEATURE_PMP);
+}
+#endif
+
 /* User Floating-Point CSRs */
 static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -115,33 +155,8 @@ static int write_fcsr(CPURISCVState *env, int csrno, t=
arget_ulong val)
 }
=20
 /* User Timers and Counters */
-static int counter_enabled(CPURISCVState *env, int csrno)
-{
-#ifndef CONFIG_USER_ONLY
-    target_ulong ctr_en =3D env->priv =3D=3D PRV_U ? env->scounteren :
-                          env->priv =3D=3D PRV_S ? env->mcounteren : -1U;
-#else
-    target_ulong ctr_en =3D -1;
-#endif
-    return (ctr_en >> (csrno & 31)) & 1;
-}
-
-#if !defined(CONFIG_USER_ONLY)
-static int read_zero_counter(CPURISCVState *env, int csrno, target_ulong *=
val)
-{
-    if (!counter_enabled(env, csrno)) {
-        return -1;
-    }
-    *val =3D 0;
-    return 0;
-}
-#endif
-
 static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    if (!counter_enabled(env, csrno)) {
-        return -1;
-    }
 #if !defined(CONFIG_USER_ONLY)
     if (use_icount) {
         *val =3D cpu_get_icount();
@@ -157,9 +172,6 @@ static int read_instret(CPURISCVState *env, int csrno, =
target_ulong *val)
 #if defined(TARGET_RISCV32)
 static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    if (!counter_enabled(env, csrno)) {
-        return -1;
-    }
 #if !defined(CONFIG_USER_ONLY)
     if (use_icount) {
         *val =3D cpu_get_icount() >> 32;
@@ -720,6 +732,11 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_=
ulong *ret_value,
     }
 #endif
=20
+    /* check predicate */
+    if (!csr_ops[csrno].predicate || csr_ops[csrno].predicate(env, csrno) =
< 0) {
+        return -1;
+    }
+
     /* execute combined read/write operation if it exists */
     if (csr_ops[csrno].op) {
         return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_m=
ask);
@@ -758,89 +775,89 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target=
_ulong *ret_value,
 /* Control and Status Register function table */
 static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     /* User Floating-Point CSRs */
-    [CSR_FFLAGS] =3D              { read_fflags,      write_fflags      },
-    [CSR_FRM] =3D                 { read_frm,         write_frm         },
-    [CSR_FCSR] =3D                { read_fcsr,        write_fcsr        },
+    [CSR_FFLAGS] =3D              { fs,   read_fflags,      write_fflags  =
    },
+    [CSR_FRM] =3D                 { fs,   read_frm,         write_frm     =
    },
+    [CSR_FCSR] =3D                { fs,   read_fcsr,        write_fcsr    =
    },
=20
     /* User Timers and Counters */
-    [CSR_CYCLE] =3D               { read_instret                        },
-    [CSR_INSTRET] =3D             { read_instret                        },
+    [CSR_CYCLE] =3D               { ctr,  read_instret                    =
    },
+    [CSR_INSTRET] =3D             { ctr,  read_instret                    =
    },
 #if defined(TARGET_RISCV32)
-    [CSR_CYCLEH] =3D              { read_instreth                       },
-    [CSR_INSTRETH] =3D            { read_instreth                       },
+    [CSR_CYCLEH] =3D              { ctr,  read_instreth                   =
    },
+    [CSR_INSTRETH] =3D            { ctr,  read_instreth                   =
    },
 #endif
=20
     /* User-level time CSRs are only available in linux-user
      * In privileged mode, the monitor emulates these CSRs */
 #if defined(CONFIG_USER_ONLY)
-    [CSR_TIME] =3D                { read_time                           },
+    [CSR_TIME] =3D                { ctr,  read_time                       =
    },
 #if defined(TARGET_RISCV32)
-    [CSR_TIMEH] =3D               { read_timeh                          },
+    [CSR_TIMEH] =3D               { ctr,  read_timeh                      =
    },
 #endif
 #endif
=20
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
-    [CSR_MCYCLE] =3D              { read_instret                        },
-    [CSR_MINSTRET] =3D            { read_instret                        },
+    [CSR_MCYCLE] =3D              { any,  read_instret                    =
    },
+    [CSR_MINSTRET] =3D            { any,  read_instret                    =
    },
 #if defined(TARGET_RISCV32)
-    [CSR_MCYCLEH] =3D             { read_instreth                       },
-    [CSR_MINSTRETH] =3D           { read_instreth                       },
+    [CSR_MCYCLEH] =3D             { any,  read_instreth                   =
    },
+    [CSR_MINSTRETH] =3D           { any,  read_instreth                   =
    },
 #endif
=20
     /* Machine Information Registers */
-    [CSR_MVENDORID] =3D           { read_zero                           },
-    [CSR_MARCHID] =3D             { read_zero                           },
-    [CSR_MIMPID] =3D              { read_zero                           },
-    [CSR_MHARTID] =3D             { read_mhartid                        },
+    [CSR_MVENDORID] =3D           { any,  read_zero                       =
    },
+    [CSR_MARCHID] =3D             { any,  read_zero                       =
    },
+    [CSR_MIMPID] =3D              { any,  read_zero                       =
    },
+    [CSR_MHARTID] =3D             { any,  read_mhartid                    =
    },
=20
     /* Machine Trap Setup */
-    [CSR_MSTATUS] =3D             { read_mstatus,     write_mstatus     },
-    [CSR_MISA] =3D                { read_misa                           },
-    [CSR_MIDELEG] =3D             { read_mideleg,     write_mideleg     },
-    [CSR_MEDELEG] =3D             { read_medeleg,     write_medeleg     },
-    [CSR_MIE] =3D                 { read_mie,         write_mie         },
-    [CSR_MTVEC] =3D               { read_mtvec,       write_mtvec       },
-    [CSR_MCOUNTEREN] =3D          { read_mcounteren,  write_mcounteren  },
+    [CSR_MSTATUS] =3D             { any,  read_mstatus,     write_mstatus =
    },
+    [CSR_MISA] =3D                { any,  read_misa                       =
    },
+    [CSR_MIDELEG] =3D             { any,  read_mideleg,     write_mideleg =
    },
+    [CSR_MEDELEG] =3D             { any,  read_medeleg,     write_medeleg =
    },
+    [CSR_MIE] =3D                 { any,  read_mie,         write_mie     =
    },
+    [CSR_MTVEC] =3D               { any,  read_mtvec,       write_mtvec   =
    },
+    [CSR_MCOUNTEREN] =3D          { any,  read_mcounteren,  write_mcounter=
en  },
=20
     /* Legacy Counter Setup (priv v1.9.1) */
-    [CSR_MUCOUNTEREN] =3D         { read_mucounteren, write_mucounteren },
-    [CSR_MSCOUNTEREN] =3D         { read_mscounteren, write_mscounteren },
+    [CSR_MUCOUNTEREN] =3D         { any,  read_mucounteren, write_mucounte=
ren },
+    [CSR_MSCOUNTEREN] =3D         { any,  read_mscounteren, write_mscounte=
ren },
=20
     /* Machine Trap Handling */
-    [CSR_MSCRATCH] =3D            { read_mscratch,    write_mscratch    },
-    [CSR_MEPC] =3D                { read_mepc,        write_mepc        },
-    [CSR_MCAUSE] =3D              { read_mcause,      write_mcause      },
-    [CSR_MBADADDR] =3D            { read_mbadaddr,    write_mbadaddr    },
-    [CSR_MIP] =3D                 { NULL,     NULL,     rmw_mip         },
+    [CSR_MSCRATCH] =3D            { any,  read_mscratch,    write_mscratch=
    },
+    [CSR_MEPC] =3D                { any,  read_mepc,        write_mepc    =
    },
+    [CSR_MCAUSE] =3D              { any,  read_mcause,      write_mcause  =
    },
+    [CSR_MBADADDR] =3D            { any,  read_mbadaddr,    write_mbadaddr=
    },
+    [CSR_MIP] =3D                 { any,  NULL,     NULL,     rmw_mip     =
    },
=20
     /* Supervisor Trap Setup */
-    [CSR_SSTATUS] =3D             { read_sstatus,     write_sstatus     },
-    [CSR_SIE] =3D                 { read_sie,         write_sie         },
-    [CSR_STVEC] =3D               { read_stvec,       write_stvec       },
-    [CSR_SCOUNTEREN] =3D          { read_scounteren,  write_scounteren  },
+    [CSR_SSTATUS] =3D             { smode, read_sstatus,     write_sstatus=
     },
+    [CSR_SIE] =3D                 { smode, read_sie,         write_sie    =
     },
+    [CSR_STVEC] =3D               { smode, read_stvec,       write_stvec  =
     },
+    [CSR_SCOUNTEREN] =3D          { smode, read_scounteren,  write_scounte=
ren  },
=20
     /* Supervisor Trap Handling */
-    [CSR_SSCRATCH] =3D            { read_sscratch,    write_sscratch    },
-    [CSR_SEPC] =3D                { read_sepc,        write_sepc        },
-    [CSR_SCAUSE] =3D              { read_scause,      write_scause      },
-    [CSR_SBADADDR] =3D            { read_sbadaddr,    write_sbadaddr    },
-    [CSR_SIP] =3D                 { NULL,     NULL,     rmw_sip         },
+    [CSR_SSCRATCH] =3D            { smode, read_sscratch,    write_sscratc=
h    },
+    [CSR_SEPC] =3D                { smode, read_sepc,        write_sepc   =
     },
+    [CSR_SCAUSE] =3D              { smode, read_scause,      write_scause =
     },
+    [CSR_SBADADDR] =3D            { smode, read_sbadaddr,    write_sbadadd=
r    },
+    [CSR_SIP] =3D                 { smode, NULL,     NULL,     rmw_sip    =
     },
=20
     /* Supervisor Protection and Translation */
-    [CSR_SATP] =3D                { read_satp,        write_satp        },
+    [CSR_SATP] =3D                { smode, read_satp,        write_satp   =
     },
=20
     /* Physical Memory Protection */
-    [CSR_PMPCFG0  ... CSR_PMPADDR9] =3D  { read_pmpcfg,  write_pmpcfg   },
-    [CSR_PMPADDR0 ... CSR_PMPADDR15] =3D { read_pmpaddr, write_pmpaddr  },
+    [CSR_PMPCFG0  ... CSR_PMPADDR9] =3D  { pmp,   read_pmpcfg,  write_pmpc=
fg   },
+    [CSR_PMPADDR0 ... CSR_PMPADDR15] =3D { pmp,   read_pmpaddr, write_pmpa=
ddr  },
=20
     /* Performance Counters */
-    [CSR_HPMCOUNTER3   ... CSR_HPMCOUNTER31] =3D    { read_zero_counter },
-    [CSR_MHPMCOUNTER3  ... CSR_MHPMCOUNTER31] =3D   { read_zero         },
-    [CSR_MHPMEVENT3    ... CSR_MHPMEVENT31] =3D     { read_zero         },
+    [CSR_HPMCOUNTER3   ... CSR_HPMCOUNTER31] =3D    { ctr,  read_zero     =
     },
+    [CSR_MHPMCOUNTER3  ... CSR_MHPMCOUNTER31] =3D   { any,  read_zero     =
     },
+    [CSR_MHPMEVENT3    ... CSR_MHPMEVENT31] =3D     { any,  read_zero     =
     },
 #if defined(TARGET_RISCV32)
-    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =3D   { read_zero_counter },
-    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =3D  { read_zero         },
+    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =3D   { ctr,  read_zero     =
     },
+    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =3D  { any,  read_zero     =
     },
 #endif
 #endif /* !CONFIG_USER_ONLY */
 };
--=20
2.19.1


