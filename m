Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKmvM-0007vU-Tx
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 15:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKkts-00057T-GV; Mon, 30 Aug 2021 13:16:48 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:50032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKktp-00078k-Df; Mon, 30 Aug 2021 13:16:48 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D9481418FA;
 Mon, 30 Aug 2021 19:16:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630343803;
 bh=QAZjJ3T00edFgc9X+6Gt6qT9TAiFXsqcD9Orp0odjBE=;
 h=From:To:Cc:Subject:Date:From;
 b=O0Kn7SFxrgoV/J/q9HXy4owwMFBQoj+bLU2NTCzqJV27Zeln+NE5GUjtO2171Y4v6
 2JUOf/hyvNHqGjtzd1yExakhq768qAbRUy17L2QzrAdCzqYp+gZlyEFRj3Xg23fD2d
 6sBs8DqM+9+BncrFMlFCjxDlQV52rjQgdFmytzh9mjfq9XKJ8hIXjMNP2YUkfmR5nY
 BJ+C9Zxoc7p2WNZ4Zx3VEvILWKCeynHZMUyQLk7fDnKQU1QlK6ewm8iiqKGkv6Mhbi
 N7JSGihMh3NQB/4teNOI6zf147MZN6NdP8cnDFh7iZCn2Fr3WQoNFRrGpzM3jWoZLb
 7zFeaO/UnP0IA==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id D3D1C80137;
 Mon, 30 Aug 2021 19:16:43 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 7F2BD187E12;
 Mon, 30 Aug 2021 19:16:43 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 1/8] target/riscv: Settings for 128-bit extension support
Date: Mon, 30 Aug 2021 19:16:31 +0200
Message-Id: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (110)
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Aug 2021 15:26:27 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Aug 2021 17:16:54 -0000

Starting 128-bit extension support implies a few modifications in the
existing sources because checking for 32-bit is done by checking that
it is not 64-bit and vice-versa.
We now consider the 3 possible xlen values so as to allow correct
compilation for both existing targets while setting the compilation
framework so that it can also handle the riscv128-softmmu target.
This includes gdb configuration files, that are just the bare copy of the
64-bit ones as gdb does not honor, yet, 128-bit CPUs.
To consider the 3 xlen values, we had to add a misah field, representing the
upper 64 bits of the misa register.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 configs/devices/riscv128-softmmu/default.mak | 16 ++++++
 configs/targets/riscv128-softmmu.mak         |  5 ++
 gdb-xml/riscv-128bit-cpu.xml                 | 48 ++++++++++++++++++
 gdb-xml/riscv-128bit-virtual.xml             | 12 +++++
 include/hw/riscv/sifive_cpu.h                |  4 ++
 target/riscv/Kconfig                         |  3 ++
 target/riscv/arch_dump.c                     |  3 +-
 target/riscv/cpu-param.h                     |  3 +-
 target/riscv/cpu.c                           | 51 +++++++++++++++++---
 target/riscv/cpu.h                           | 19 ++++++++
 target/riscv/gdbstub.c                       |  3 ++
 target/riscv/insn_trans/trans_rvd.c.inc      | 10 ++--
 target/riscv/insn_trans/trans_rvf.c.inc      |  2 +-
 target/riscv/translate.c                     | 45 ++++++++++++++++-
 14 files changed, 209 insertions(+), 15 deletions(-)
 create mode 100644 configs/devices/riscv128-softmmu/default.mak
 create mode 100644 configs/targets/riscv128-softmmu.mak
 create mode 100644 gdb-xml/riscv-128bit-cpu.xml
 create mode 100644 gdb-xml/riscv-128bit-virtual.xml

diff --git a/configs/devices/riscv128-softmmu/default.mak b/configs/devices/riscv128-softmmu/default.mak
new file mode 100644
index 0000000000..31439dbcfe
--- /dev/null
+++ b/configs/devices/riscv128-softmmu/default.mak
@@ -0,0 +1,16 @@
+# Default configuration for riscv128-softmmu
+
+# Uncomment the following lines to disable these optional devices:
+#
+#CONFIG_PCI_DEVICES=n
+CONFIG_SEMIHOSTING=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
+
+# Boards:
+#
+CONFIG_SPIKE=n
+CONFIG_SIFIVE_E=n
+CONFIG_SIFIVE_U=n
+CONFIG_RISCV_VIRT=y
+CONFIG_MICROCHIP_PFSOC=n
+CONFIG_SHAKTI_C=n
diff --git a/configs/targets/riscv128-softmmu.mak b/configs/targets/riscv128-softmmu.mak
new file mode 100644
index 0000000000..e300c43c8e
--- /dev/null
+++ b/configs/targets/riscv128-softmmu.mak
@@ -0,0 +1,5 @@
+TARGET_ARCH=riscv128
+TARGET_BASE_ARCH=riscv
+TARGET_SUPPORTS_MTTCG=y
+TARGET_XML_FILES= gdb-xml/riscv-128bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-128bit-virtual.xml
+TARGET_NEED_FDT=y
diff --git a/gdb-xml/riscv-128bit-cpu.xml b/gdb-xml/riscv-128bit-cpu.xml
new file mode 100644
index 0000000000..c98168148f
--- /dev/null
+++ b/gdb-xml/riscv-128bit-cpu.xml
@@ -0,0 +1,48 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!-- Register numbers are hard-coded in order to maintain backward
+     compatibility with older versions of tools that didn't use xml
+     register descriptions.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<!-- FIXME : All GPRs are marked as 64-bits since gdb doesn't like 128-bit registers for now. -->
+<feature name="org.gnu.gdb.riscv.cpu">
+  <reg name="zero" bitsize="64" type="int" regnum="0"/>
+  <reg name="ra" bitsize="64" type="code_ptr"/>
+  <reg name="sp" bitsize="64" type="data_ptr"/>
+  <reg name="gp" bitsize="64" type="data_ptr"/>
+  <reg name="tp" bitsize="64" type="data_ptr"/>
+  <reg name="t0" bitsize="64" type="int"/>
+  <reg name="t1" bitsize="64" type="int"/>
+  <reg name="t2" bitsize="64" type="int"/>
+  <reg name="fp" bitsize="64" type="data_ptr"/>
+  <reg name="s1" bitsize="64" type="int"/>
+  <reg name="a0" bitsize="64" type="int"/>
+  <reg name="a1" bitsize="64" type="int"/>
+  <reg name="a2" bitsize="64" type="int"/>
+  <reg name="a3" bitsize="64" type="int"/>
+  <reg name="a4" bitsize="64" type="int"/>
+  <reg name="a5" bitsize="64" type="int"/>
+  <reg name="a6" bitsize="64" type="int"/>
+  <reg name="a7" bitsize="64" type="int"/>
+  <reg name="s2" bitsize="64" type="int"/>
+  <reg name="s3" bitsize="64" type="int"/>
+  <reg name="s4" bitsize="64" type="int"/>
+  <reg name="s5" bitsize="64" type="int"/>
+  <reg name="s6" bitsize="64" type="int"/>
+  <reg name="s7" bitsize="64" type="int"/>
+  <reg name="s8" bitsize="64" type="int"/>
+  <reg name="s9" bitsize="64" type="int"/>
+  <reg name="s10" bitsize="64" type="int"/>
+  <reg name="s11" bitsize="64" type="int"/>
+  <reg name="t3" bitsize="64" type="int"/>
+  <reg name="t4" bitsize="64" type="int"/>
+  <reg name="t5" bitsize="64" type="int"/>
+  <reg name="t6" bitsize="64" type="int"/>
+  <reg name="pc" bitsize="64" type="code_ptr"/>
+</feature>
diff --git a/gdb-xml/riscv-128bit-virtual.xml b/gdb-xml/riscv-128bit-virtual.xml
new file mode 100644
index 0000000000..db9a0ff677
--- /dev/null
+++ b/gdb-xml/riscv-128bit-virtual.xml
@@ -0,0 +1,12 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<!-- FIXME : priv marked as 64-bits since gdb doesn't like 128-bit registers for now. -->
+<feature name="org.gnu.gdb.riscv.virtual">
+  <reg name="priv" bitsize="64"/>
+</feature>
diff --git a/include/hw/riscv/sifive_cpu.h b/include/hw/riscv/sifive_cpu.h
index 136799633a..2fd441664f 100644
--- a/include/hw/riscv/sifive_cpu.h
+++ b/include/hw/riscv/sifive_cpu.h
@@ -26,6 +26,10 @@
 #elif defined(TARGET_RISCV64)
 #define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
 #define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
+#elif defined(TARGET_RISCV128)
+/* 128-bit uses 64-bit CPU for now, since no cpu implements RV128 */
+#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
+#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
 #endif
 
 #endif /* HW_SIFIVE_CPU_H */
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
index b9e5932f13..f9ea52a59a 100644
--- a/target/riscv/Kconfig
+++ b/target/riscv/Kconfig
@@ -3,3 +3,6 @@ config RISCV32
 
 config RISCV64
     bool
+
+config RISCV128
+    bool
diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
index 709f621d82..f756ed2988 100644
--- a/target/riscv/arch_dump.c
+++ b/target/riscv/arch_dump.c
@@ -176,7 +176,8 @@ int cpu_get_dump_info(ArchDumpInfo *info,
 
     info->d_machine = EM_RISCV;
 
-#if defined(TARGET_RISCV64)
+#if defined(TARGET_RISCV64) || defined(TARGET_RISCV128)
+    /* FIXME : No 128-bit ELF class exists (for now), use 64-bit one. */
     info->d_class = ELFCLASS64;
 #else
     info->d_class = ELFCLASS32;
diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index 80eb615f93..e6d0651f60 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -8,7 +8,8 @@
 #ifndef RISCV_CPU_PARAM_H
 #define RISCV_CPU_PARAM_H 1
 
-#if defined(TARGET_RISCV64)
+/* 64-bit target, since QEMU isn't built to have TARGET_LONG_BITS over 64 */
+#if defined(TARGET_RISCV64) || defined(TARGET_RISCV128)
 # define TARGET_LONG_BITS 64
 # define TARGET_PHYS_ADDR_SPACE_BITS 56 /* 44-bit PPN */
 # define TARGET_VIRT_ADDR_SPACE_BITS 48 /* sv48 */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..1f15026e9c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,18 +110,38 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env)
 {
-    if (env->misa & RV64) {
-        return false;
-    }
+    return (env->misa & MXLEN_MASK) == RV32;
+}
 
-    return true;
+bool riscv_cpu_is_64bit(CPURISCVState *env)
+{
+    return (env->misa & MXLEN_MASK) == RV64;
 }
 
+#if defined(TARGET_RISCV128)
+bool riscv_cpu_is_128bit(CPURISCVState *env)
+{
+    return (env->misah & MXLEN_MASK) == RV128;
+}
+#else
+bool __attribute__((const)) riscv_cpu_is_128bit(CPURISCVState *env)
+{
+    return false;
+}
+#endif
+
 static void set_misa(CPURISCVState *env, target_ulong misa)
 {
     env->misa_mask = env->misa = misa;
 }
 
+#if defined(TARGET_RISCV128)
+static void set_misah(CPURISCVState *env, target_ulong misah)
+{
+    env->misah_mask = env->misah = misah;
+}
+#endif
+
 static void set_priv_version(CPURISCVState *env, int priv_ver)
 {
     env->priv_ver = priv_ver;
@@ -156,11 +176,22 @@ static void riscv_any_cpu_init(Object *obj)
     set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #elif defined(TARGET_RISCV64)
     set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#elif defined(TARGET_RISCV128)
+    set_misa(env, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_misah(env, RV128);
 #endif
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
 
-#if defined(TARGET_RISCV64)
+#if defined(TARGET_RISCV128)
+static void rv128_base_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    /* We set this in the realise function */
+    set_misa(env, 0);
+    set_misah(env, RV128);
+}
+#elif defined(TARGET_RISCV64)
 static void rv64_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -440,7 +471,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* If only XLEN is set for misa, then set misa from properties */
-    if (env->misa == RV32 || env->misa == RV64) {
+    if (env->misa == RV32 || env->misa == RV64
+#if defined(TARGET_RISCV128)
+            || (env->misah == RV128 && env->misa == 0)
+#endif
+            ) {
         /* Do some ISA extension error checking */
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
@@ -674,6 +709,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
 #elif defined(TARGET_RISCV64)
     cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+#elif defined(TARGET_RISCV128)
+    cc->gdb_core_xml_file = "riscv-128bit-cpu.xml";
 #endif
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
@@ -761,6 +798,8 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
+#elif defined(TARGET_RISCV128)
+    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..d1a73276fb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -37,6 +37,7 @@
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("rv128")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
@@ -49,10 +50,16 @@
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
 #elif defined(TARGET_RISCV64)
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
+#elif defined(TARGET_RISCV128)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE128
 #endif
 
+/* Mask for the MXLEN flag in the misa CSR */
+#define MXLEN_MASK ((target_ulong)3 << (TARGET_LONG_BITS - 2))
 #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
+/* To be used on misah, the upper part of misa */
+#define RV128 ((target_ulong)3 << (TARGET_LONG_BITS - 2))
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
@@ -187,6 +194,12 @@ struct CPURISCVState {
     target_ulong hgatp;
     uint64_t htimedelta;
 
+#if defined(TARGET_RISCV128)
+    /* Upper 64-bits of 128-bit CSRs */
+    uint64_t misah;
+    uint64_t misah_mask;
+#endif
+
     /* Virtual CSRs */
     /*
      * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
@@ -396,6 +409,12 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 FIELD(TB_FLAGS, HLSX, 9, 1)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
+bool riscv_cpu_is_64bit(CPURISCVState *env);
+#if defined(TARGET_RISCV128)
+bool riscv_cpu_is_128bit(CPURISCVState *env);
+#else
+bool riscv_cpu_is_128bit(CPURISCVState *env) __attribute__ ((const));
+#endif
 
 /*
  * A simplification for VLMAX
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a7a9c0b1fe..9f75d23b16 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -204,6 +204,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 #elif defined(TARGET_RISCV64)
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-64bit-virtual.xml", 0);
+#elif defined(TARGET_RISCV128)
+    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
+                             1, "riscv-128bit-virtual.xml", 0);
 #endif
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 7e45538ae0..4d430960b9 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -22,6 +22,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
+    REQUIRE_32_OR_64BIT(ctx);
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
@@ -37,6 +38,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
+    REQUIRE_32_OR_64BIT(ctx);
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
@@ -388,11 +390,11 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
 
 static bool trans_fmv_x_d(DisasContext *ctx, arg_fmv_x_d *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-#ifdef TARGET_RISCV64
+#if defined(TARGET_RISCV64) || defined(TARGET_RISCV128)
     gen_set_gpr(a->rd, cpu_fpr[a->rs1]);
     return true;
 #else
@@ -434,11 +436,11 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
 
 static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
 {
-    REQUIRE_64BIT(ctx);
+    REQUIRE_64_OR_128BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-#ifdef TARGET_RISCV64
+#if defined(TARGET_RISCV64) || defined(TARGET_RISCV128)
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index db1c0c9974..47efa7284d 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -303,7 +303,7 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
 
     TCGv t0 = tcg_temp_new();
 
-#if defined(TARGET_RISCV64)
+#if defined(TARGET_RISCV64) || defined(TARGET_RISCV128)
     tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
 #else
     tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6983be5723..713b14da8b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -47,7 +47,9 @@ typedef struct DisasContext {
     bool virt_enabled;
     uint32_t opcode;
     uint32_t mstatus_fs;
+    /* Type of csrs should be MXLEN, that might be dynamically settable */
     target_ulong misa;
+    uint64_t misah;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -74,13 +76,30 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 
 #ifdef TARGET_RISCV32
 # define is_32bit(ctx)  true
+# define is_64bit(ctx)  false
+# define is_128bit(ctx) false
 #elif defined(CONFIG_USER_ONLY)
 # define is_32bit(ctx)  false
+# define is_64_bit(ctx) true
+# define is_128_bit(ctx) false
 #else
 static inline bool is_32bit(DisasContext *ctx)
 {
-    return (ctx->misa & RV32) == RV32;
+    return (ctx->misa & MXLEN_MASK) == RV32;
 }
+
+static inline bool is_64bit(DisasContext *ctx)
+{
+    return (ctx->misa & MXLEN_MASK) == RV64;
+}
+#if defined(TARGET_RISCV128)
+static inline bool is_128bit(DisasContext *ctx)
+{
+    return (ctx->misah & MXLEN_MASK) == RV128;
+}
+#else
+# define is_128bit(ctx) false
+#endif
 #endif
 
 /*
@@ -418,11 +437,30 @@ EX_SH(12)
 } while (0)
 
 #define REQUIRE_64BIT(ctx) do { \
-    if (is_32bit(ctx)) {        \
+    if (!is_64bit(ctx)) {       \
         return false;           \
     }                           \
 } while (0)
 
+#define REQUIRE_128BIT(ctx) do { \
+    if (!is_128bit(ctx)) {         \
+        return false;            \
+    }                            \
+} while (0)
+
+#define REQUIRE_32_OR_64BIT(ctx) do {  \
+    if (is_128bit(ctx)) {               \
+        return false;                  \
+    }                                  \
+} while (0)
+
+#define REQUIRE_64_OR_128BIT(ctx) do { \
+    if (is_32bit(ctx)) {               \
+        return false;                  \
+    }                                  \
+} while (0)
+
+
 static int ex_rvc_register(DisasContext *ctx, int reg)
 {
     return 8 + reg;
@@ -938,6 +976,9 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->virt_enabled = false;
 #endif
     ctx->misa = env->misa;
+#if defined(TARGET_RISCV128)
+    ctx->misah = env->misah;
+#endif
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->vlen = cpu->cfg.vlen;
-- 
2.33.0


