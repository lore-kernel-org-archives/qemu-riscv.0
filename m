Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqoYL-000177-NC
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 00:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=129fa4c84=alistair.francis@opensource.wdc.com>)
 id 1nqoYK-00014m-JT
 for qemu-riscv@nongnu.org; Tue, 17 May 2022 00:11:20 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=129fa4c84=alistair.francis@opensource.wdc.com>)
 id 1nqoYI-0001fr-Jz
 for qemu-riscv@nongnu.org; Tue, 17 May 2022 00:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1652760678; x=1684296678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hsvHkGB8EwizdqQZCof6yo+LXe/ZYyzfi4QeSTZ9b7k=;
 b=OECnqL2MrM6D8el3xD5oEMqFWjQW7M+cM+t3xEKnr3z0wHxRIyvpOvns
 rfgAKBr0YakRiZy2u3R82jJnSBRrAOhQ+LuUEfLSmk/TNRoFpQ1wWTGE2
 8ILlLVc+SCqiN0fME2jGeoSmbTXeFUsOGeiOeHEK04DG95MAYAmSizXlF
 mcpftt+nSjaVEhgVNDLP3VB+lrVL/MKRqvD4+COUgehU2h9mu7P08eF1E
 xOR62nx8BWBqLe2XpbHp5S9+5sa+RgQ9mytf6tCB8eSHYyFGnbBOOq5by
 2VJ0DygU2460nOBy9Oxo+HAji/dENNGw5cnzX+pOdqsvM31ps9RuHbjBg Q==;
X-IronPort-AV: E=Sophos;i="5.91,231,1647273600"; d="scan'208";a="205370375"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 May 2022 12:11:14 +0800
IronPort-SDR: UwBo5rXKizrQHXEmT9m4+pjvXVRUWzeG1nfsWMLz6nmfirmIZEsRdoBtOdtS8bxg9Yv3AkTZaf
 wwmL76ak9935Qw182vS3DPS4SnDCOYmr04xeYmzJdOJJbsBGQ/BcGzOxLyxfyNsRvncauau5L9
 bSu8ZCxkl0Sjo3TC86M63Jv4vmK8H3cjPwYOT6kCzOr9wQGgf9732Y/11l6krce2o6QrmhBtqr
 6dqyzGQiWi8hwovdGqVV4xed7jOljVL5z/K/jFTllU+k6LsvaKME7K0p28tA523lvO7EEVmNhQ
 6bSDatOJu6RNLW0NY2U6c3Te
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 20:36:54 -0700
IronPort-SDR: rth8PDRhpb6+w81F9H9b3cEDyajhdrVbbU0Knl+E+SZsXslJdRJr5LP3o7fPhVUcCaI8i96m4E
 2WeBVsp4DtFnizuPBdBDfQwNcgEMVcd88xjWbP62JkA+zNpBw0Z0SzBwu1bJ8f/Jr20ugu1vCY
 kiIuuxV7fHqGbrfrUvo3PbSd48PQgWhwm3LH+gnO2ecEAzSLB+a4tqVGGopuTIh0D0IuUDI0O0
 lsSLVyOIzWJW+bbFcBDCweHujFFK6ZxIBF8K/bR211x/EN6HcDzTj9XwQG9V1M126ymE1y1XGq
 cW8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 21:11:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L2N3568kmz1Rwrw
 for <qemu-riscv@nongnu.org>; Mon, 16 May 2022 21:11:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1652760673; x=1655352674; bh=hsvHkGB8EwizdqQZCo
 f6yo+LXe/ZYyzfi4QeSTZ9b7k=; b=uGU0MjYZusp0n1L4eYRBvLzeDmybAfG8Up
 pkuAzlKS/k1AUeVkLy5aTZagDxdrvnvveQ5WX8JKA1/0g06p8CHVahZTlXFxR5O6
 zlMgHdsEHzI9QBshp1/r7ZdHJsAMY1nSAGypZacn4aBwcBaZ1MOVPa+8Rdhij9Ik
 +DX7pF2MAJ4lffzywX1eX3r3hfZCfwI0mYQ6z/pZT12MWDv4XXgpwQ0/K7t4jB3y
 mpmoT5HFb/FAB2YUdKyVcLevbbMi579C6dKW6foVUfJm+s6Y/Opu8PUN4Ie8mTcp
 e1ZWBA1SOps8CVdO7grIWI9LUasvqTBIo/8wyjAZWtGzrb0aHZuw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id G47GfA8Fwbo3 for <qemu-riscv@nongnu.org>;
 Mon, 16 May 2022 21:11:13 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.2])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L2N326pBZz1Rvlc;
 Mon, 16 May 2022 21:11:10 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com,
	palmer@dabbelt.com,
	alistair23@gmail.com
Subject: [PATCH 1/2] target/riscv: Don't expose the CPU properties on names
 CPUs
Date: Tue, 17 May 2022 14:10:59 +1000
Message-Id: <20220517041100.93045-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517041100.93045-1-alistair.francis@opensource.wdc.com>
References: <20220517041100.93045-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=129fa4c84=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 May 2022 04:11:20 -0000

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
 target/riscv/cpu.c | 56 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6d01569cad..49b844535a 100644
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
@@ -829,6 +843,12 @@ static void riscv_cpu_init(Object *obj)
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
@@ -837,7 +857,7 @@ static void riscv_cpu_init(Object *obj)
 #endif /* CONFIG_USER_ONLY */
 }
=20
-static Property riscv_cpu_properties[] =3D {
+static Property riscv_cpu_extensions[] =3D {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
@@ -860,17 +880,12 @@ static Property riscv_cpu_properties[] =3D {
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
-    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, RISCV_CPU_MIPID),
-
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
@@ -907,6 +922,25 @@ static Property riscv_cpu_properties[] =3D {
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
+    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, RISCV_CPU_MIPID),
+
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
=20
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string,=
 false),
--=20
2.35.1


