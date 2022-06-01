Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwDIP-0004u2-DH
	for mharc-qemu-riscv@gnu.org; Tue, 31 May 2022 21:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=144e506c5=alistair.francis@opensource.wdc.com>)
 id 1nwDIN-0004ov-Nd
 for qemu-riscv@nongnu.org; Tue, 31 May 2022 21:37:11 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:58711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=144e506c5=alistair.francis@opensource.wdc.com>)
 id 1nwDIL-0005fD-Kn
 for qemu-riscv@nongnu.org; Tue, 31 May 2022 21:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654047429; x=1685583429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MoMN5a+5Z45WDlR+td3uUDC50gkKJzMY+X8zjTOYaFM=;
 b=eZk/NovQuKdvd9/HQQm8HEsSPfkFu2UaJNOrQGgUTMHkz6FAU40GIfdq
 imnCU+O2roPVQisvLpxxVpoFNFApnJilfKK6t2/jpN7dLUAGg3CZsS2Io
 rfqi7kLyWyGD5Jr0AbVSZ48v6KOPsBbm9E3Mas81NNmUkPa1A28G280fI
 UJEhMUvowCNGopuOE8/hhqtd1S643dBiQfG4kVB66ycEkjBW6SPQgj5U6
 4FxNp+uVV1tr4NILiCGFN9ZfQQyGlfMvKBM5dzVmwx2x6SiYRmsBOeFNF
 /0pGREXgLcZi8Ayo8M1ObFf+coAQ3ubhyr6x3XmP0EoF2d6YkcXp8AvR9 w==;
X-IronPort-AV: E=Sophos;i="5.91,266,1647273600"; d="scan'208";a="313964949"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jun 2022 09:37:05 +0800
IronPort-SDR: sZJKt4ruDel84uq3rMlN1UXy8REl55A0cxbczxKQyyx+GrMU1CuDYSxFiZ3c5U+xPG9egJIDYY
 CEyw74y16sMw89PtSjC7+Che2y9apVVcGlX3e/lCaVc0DwaqCmGZvMfAINJzwIXqWv5fGFJJBW
 mL7VlgwQWda6VeJelCT3x6/UL6ikSZjKlzvUcYPP+iXx+FCNkNiVqInAWV7fdpxkUlalTk46Tr
 MIbzu6eW48hJ962rcUN4vhBySprjrUS3FKDgm0esr4/gzhn5GDHI0WE/ECp9NKi43Zo1BHqwH4
 2kyNasF/gYa+6st33JCQsGxs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 17:56:25 -0700
IronPort-SDR: b6ln8pZXG/7BoWXwEjGyXewcFF1MljMQbD6w2DBndmgzIeFqXy3uiSt6J530AYFHLcoV8Z5Wgz
 gbxlMrv6g57R1jvefvWMiVay6UsSMdiSOz/1lDSWGQaZ5CCdZtZh0jz7YfAgE+nWSII76OrwDF
 4KBBiIf+QywCBiwV1ZAS6eYdcV/F52vmNiIROoxtU7dImwCHSUni3IPq+fQfv11lb5eKdN83mp
 UXCOyTMh9JMAyKcq79+Pa9N6fXdlxDxN3pHDy+y1GGJUJwoeT1SpYdQ0Yc2MiadtTCKOoHxHdr
 rj4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 18:37:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LCWwJ3wWjz1SVp2
 for <qemu-riscv@nongnu.org>; Tue, 31 May 2022 18:37:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1654047423;
 x=1656639424; bh=MoMN5a+5Z45WDlR+td3uUDC50gkKJzMY+X8zjTOYaFM=; b=
 FSIEG0iAOEwaF1dk3F6pkEeNDy13+7Ei7xmB8iwv1nNI/p1rWjslAwUgm8TGt4CG
 kMMcfRaI8zOjkNEj/pbgBnLIbJbpmbQ4nkZDfTlsgGBmHr2b8upevIJJzrAgWj6t
 ZrlNwjyqvzfzertF/4OvZzhkrL0xYaSUJfyK+ARN09KaaLuhYTIQud3mw8TZyleM
 Ms5AQ0gavdUgfV0o8O3g18C1S/E8WM1760lPG5Hb3e5G7HC+9KxKyRgS6clfPjTE
 qA/uWkHGdqWRspAWo/HosriKJLrQxAKg37ScxLsJv5ak01f0ah4yTUi2ESscO3FP
 3Ak1juRH2vBooXsNkdNEFw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iBHS0P6BoII7 for <qemu-riscv@nongnu.org>;
 Tue, 31 May 2022 18:37:03 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LCWwD5Rb1z1Rvlc;
 Tue, 31 May 2022 18:37:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] target/riscv: Don't expose the CPU properties on names CPUs
Date: Wed,  1 Jun 2022 11:36:57 +1000
Message-Id: <20220601013657.197358-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=144e506c5=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2022 01:37:12 -0000

From: Alistair Francis <alistair.francis@wdc.com>

There are currently two types of RISC-V CPUs:
 - Generic CPUs (base or any) that allow complete custimisation
 - "Named" CPUs that match existing hardware

Users can use the base CPUs to custimise the extensions that they want, f=
or
example -cpu rv64,v=3Dtrue.

We originally exposed these as part of the named CPUs as well, but that w=
as
by accident.

Exposing the CPU properties to named CPUs means that we accidently
enable extensinos that don't exist on the CPUs by default. For example
the SiFive E CPU currently support the zba extension, which is a bug.

This patch instead only expose the CPU extensions to the generic CPUs.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 57 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a91253d4bd..c0c0f7e71f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -118,6 +118,8 @@ static const char * const riscv_intr_names[] =3D {
     "reserved"
 };
=20
+static void register_cpu_props(DeviceState *dev);
+
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
     if (async) {
@@ -161,6 +163,7 @@ static void riscv_any_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
     set_priv_version(env, PRIV_VERSION_1_12_0);
+    register_cpu_props(DEVICE(obj));
 }
=20
 #if defined(TARGET_RISCV64)
@@ -169,6 +172,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
+    register_cpu_props(DEVICE(obj));
 }
=20
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -181,9 +185,11 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 static void rv64_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu =3D RISCV_CPU(obj);
+
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    cpu->cfg.mmu =3D false;
 }
=20
 static void rv128_base_cpu_init(Object *obj)
@@ -197,6 +203,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
+    register_cpu_props(DEVICE(obj));
 }
 #else
 static void rv32_base_cpu_init(Object *obj)
@@ -204,6 +211,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
+    register_cpu_props(DEVICE(obj));
 }
=20
 static void rv32_sifive_u_cpu_init(Object *obj)
@@ -216,27 +224,33 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 static void rv32_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu =3D RISCV_CPU(obj);
+
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    cpu->cfg.mmu =3D false;
 }
=20
 static void rv32_ibex_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu =3D RISCV_CPU(obj);
+
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
-    qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
+    cpu->cfg.mmu =3D false;
+    cpu->cfg.epmp =3D true;
 }
=20
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu =3D RISCV_CPU(obj);
+
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
-    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    cpu->cfg.mmu =3D false;
 }
 #endif
=20
@@ -249,6 +263,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
+    register_cpu_props(DEVICE(obj));
 }
 #endif
=20
@@ -831,6 +846,12 @@ static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
+    cpu->cfg.ext_counters =3D true;
+    cpu->cfg.ext_ifencei =3D true;
+    cpu->cfg.ext_icsr =3D true;
+    cpu->cfg.mmu =3D true;
+    cpu->cfg.pmp =3D true;
+
     cpu_set_cpustate_pointers(cpu);
=20
 #ifndef CONFIG_USER_ONLY
@@ -839,7 +860,7 @@ static void riscv_cpu_init(Object *obj)
 #endif /* CONFIG_USER_ONLY */
 }
=20
-static Property riscv_cpu_properties[] =3D {
+static Property riscv_cpu_extensions[] =3D {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
@@ -862,17 +883,12 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
=20
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
=20
-    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
-    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
-    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID)=
,
-
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
@@ -909,6 +925,25 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
=20
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void register_cpu_props(DeviceState *dev)
+{
+    Property *prop;
+
+    for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
+}
+
+static Property riscv_cpu_properties[] =3D {
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
+
+    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
+    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
+    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID)=
,
+
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
=20
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string,=
 false),
--=20
2.35.3


