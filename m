Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyoyC-0006tV-8g
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 02:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=15114fb85=alistair.francis@opensource.wdc.com>)
 id 1nyoy1-0006sk-Jp
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 02:14:58 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=15114fb85=alistair.francis@opensource.wdc.com>)
 id 1nyoxx-0001uq-Cn
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 02:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654668892; x=1686204892;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qXNuMMwNjJ68EGrPzpVVw85WaeaO0G072QEBAzxE+10=;
 b=dAO89HUWqzILJgoO/B8CAxaXIgvRFc+gVjw8wVdWg2G8WmmwSpWhl+XM
 jGodrfiAxuTRDMjyyc6fnMCx/jlgR5TOmbjvnkHuZV72sph3F22kvA/1p
 JO2d3IQ6NYr5oah8yLZ0eHVFTlXe3V5w7TK62R/+pHyMrf7iOLfNLdXL9
 4GNllfesM/T8L329Kg6Uzbm8HAVrpz+m2mga9jTnHT3/aCwcKH65NO+9O
 LC2fKFRn5QMyVLVEEh/Yn085Fum1tW/MVBXO79Ml/WoFlsjjGIdEI9ZJz
 VwQqv/OeXYYEmItYgj6x47UsJ/PID5mKvrcdkqtQjVbNSGYFNkGsq9poV A==;
X-IronPort-AV: E=Sophos;i="5.91,285,1647273600"; d="scan'208";a="202567311"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2022 14:14:48 +0800
IronPort-SDR: cwOYOv0U4WHeVuBP3sII0QScuSl5UjMp8JVlewabiZKvKcbQb7urFOIp1kjMi64/8SQT4uVZoV
 drM+LlYcnNOs4luAhsQXWMbPFnceM/8ZkCIwOrBwJ8PvCOt0xcDUluN5/oHJ/itG/crqiWe4Ps
 mESnXvP6exrOTRAPIImS+tUifPuQ7ebo7BnSyZrw6ASpnZryMPY2jqkEGd8tkwI0AuJI8TImjr
 Fn6Kjwdi5vaLu6QLTa6jgv5AAqZNW106HMpMKH0Mkt/x9aE1+j5dHFy+ysL0oYcjky7PDEs1+R
 b966xNy/eKP1+MHYUeO8scVn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 22:38:03 -0700
IronPort-SDR: pwA8jetCoHLavu7m7W9XI5Mc1ilnEnuhviBONyX+OMtK91+QhKcI6QVwHq7KEVFQO6PhryzV2h
 Df5qAIB2sXPy40fIQ0wwb9m8Vh8bhkqtKa299C6M3UzOgFnJP2V87dOIGnJLMZxpRQNt3dNA0V
 L2ehPNjfyVcFeHpRuvMwzP5UCzzBlsXigajPN/qOLDF228xI25Uc/jHapLWrsNG9OAY3mBqD+v
 qDfDf2/8RG5TY9gwvPkpcenojGcyRlliC9WaGqDd31+wQPvLMTgm3PFi44u5Xs4s1eYXr1Ug1C
 tWA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 23:14:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LHxlX6JSYz1Rwrw
 for <qemu-riscv@nongnu.org>; Tue,  7 Jun 2022 23:14:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1654668887;
 x=1657260888; bh=qXNuMMwNjJ68EGrPzpVVw85WaeaO0G072QEBAzxE+10=; b=
 Tc+7RCvk5K7R/dZI9VHyi8t827IuM5ZuLhm0G79LFnau8//3wbN7wRFz8KYlhZF5
 7IRKUkZHaOHfgOEak/JYXH+5+85QtpeJypsxCvbLKBzisXl4VroWGHj6jOK4593Z
 2B8IMwKUhlHluSG8sHVRY3YPAWzaHi4e8lc5vg+VOLQ4nht6EyV3PBsiCIJira+c
 wPwjwddW6k/DwTDFhuRup/+sBPlsVm7kWrdkTogqD62+hCmBhUWpzCTTOO5KSP68
 wSDVJ355A3Awy+HxSbh5pJ65JCHYZejW4rQADWFv5wiH4OZbyvzU5bP05rYgDOM6
 2xWzrebcmDbtL45wyZ7YuQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XUCr7ceQIbMF for <qemu-riscv@nongnu.org>;
 Tue,  7 Jun 2022 23:14:47 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LHxlQ4dlnz1Rvlc;
 Tue,  7 Jun 2022 23:14:42 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3] target/riscv: Don't expose the CPU properties on names CPUs
Date: Wed,  8 Jun 2022 16:14:37 +1000
Message-Id: <20220608061437.314434-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=15114fb85=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Wed, 08 Jun 2022 06:15:01 -0000

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
enable extensions that don't exist on the CPUs by default. For example
the SiFive E CPU currently support the zba extension, which is a bug.

This patch instead only exposes the CPU extensions to the generic CPUs.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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
2.36.1


