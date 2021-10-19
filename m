Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcljt-00011B-3X
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mclji-0000dq-Qr; Tue, 19 Oct 2021 05:48:47 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljS-0006Ve-DL; Tue, 19 Oct 2021 05:48:46 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 1A84741BB2;
 Tue, 19 Oct 2021 11:48:28 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 02C2F601D5;
 Tue, 19 Oct 2021 11:48:27 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id C9B7A14005A;
 Tue, 19 Oct 2021 11:48:22 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v3 07/21] target/riscv: setup everything so that
 riscv128-softmmu compiles
Date: Tue, 19 Oct 2021 11:47:58 +0200
Message-Id: <20211019094812.614056-8-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 19 Oct 2021 09:48:47 -0000

This patch is kind of a mess because several files have to be slightly
modified to allow for a new target. Most of these modifications have to deal
with changing what was a binary choice into a ternary one.  Although we did
our best to avoid testing for TARGET_RISCV128 (which we did), it is
implicitly there in '#else' statements.
Most added infrastructure files are no far from being copies of the 64-bit
version.
Once this patch applied, adding risc128-sofmmu to --target-list produces
a (no so useful yet) executable.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 configs/devices/riscv128-softmmu/default.mak | 17 +++++++
 configs/targets/riscv128-softmmu.mak         |  6 +++
 include/disas/dis-asm.h                      |  1 +
 include/hw/riscv/sifive_cpu.h                |  3 ++
 target/riscv/cpu-param.h                     |  5 ++
 target/riscv/cpu.h                           |  3 ++
 disas/riscv.c                                |  5 ++
 target/riscv/cpu.c                           | 23 +++++++++-
 target/riscv/gdbstub.c                       |  3 ++
 target/riscv/insn_trans/trans_rvd.c.inc      | 12 ++---
 target/riscv/insn_trans/trans_rvf.c.inc      |  6 +--
 gdb-xml/riscv-128bit-cpu.xml                 | 48 ++++++++++++++++++++
 gdb-xml/riscv-128bit-virtual.xml             | 12 +++++
 target/riscv/Kconfig                         |  3 ++
 14 files changed, 137 insertions(+), 10 deletions(-)
 create mode 100644 configs/devices/riscv128-softmmu/default.mak
 create mode 100644 configs/targets/riscv128-softmmu.mak
 create mode 100644 gdb-xml/riscv-128bit-cpu.xml
 create mode 100644 gdb-xml/riscv-128bit-virtual.xml

diff --git a/configs/devices/riscv128-softmmu/default.mak b/configs/devices/riscv128-softmmu/default.mak
new file mode 100644
index 0000000000..e838f35785
--- /dev/null
+++ b/configs/devices/riscv128-softmmu/default.mak
@@ -0,0 +1,17 @@
+# Default configuration for riscv128-softmmu
+
+# Uncomment the following lines to disable these optional devices:
+#
+#CONFIG_PCI_DEVICES=n
+# No does not seem to be an option for these two parameters
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
index 0000000000..7e5976bbf3
--- /dev/null
+++ b/configs/targets/riscv128-softmmu.mak
@@ -0,0 +1,6 @@
+#For now a raw copy of the riscv64 version as changing TARGET_ARCH to riscv64 might trigger to much stuff for now
+TARGET_ARCH=riscv128
+TARGET_BASE_ARCH=riscv
+TARGET_SUPPORTS_MTTCG=y
+TARGET_XML_FILES=gdb-xml/riscv-128bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-128bit-virtual.xml
+TARGET_NEED_FDT=y
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 524f29196d..d9c725adae 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -460,6 +460,7 @@ int print_insn_little_nios2     (bfd_vma, disassemble_info*);
 int print_insn_xtensa           (bfd_vma, disassemble_info*);
 int print_insn_riscv32          (bfd_vma, disassemble_info*);
 int print_insn_riscv64          (bfd_vma, disassemble_info*);
+int print_insn_riscv128         (bfd_vma, disassemble_info*);
 int print_insn_rx(bfd_vma, disassemble_info *);
 int print_insn_hexagon(bfd_vma, disassemble_info *);
 
diff --git a/include/hw/riscv/sifive_cpu.h b/include/hw/riscv/sifive_cpu.h
index 136799633a..64078feba8 100644
--- a/include/hw/riscv/sifive_cpu.h
+++ b/include/hw/riscv/sifive_cpu.h
@@ -26,6 +26,9 @@
 #elif defined(TARGET_RISCV64)
 #define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
 #define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
+#else
+#define SIFIVE_E_CPU TYPE_RISCV_CPU_SIFIVE_E51
+#define SIFIVE_U_CPU TYPE_RISCV_CPU_SIFIVE_U54
 #endif
 
 #endif /* HW_SIFIVE_CPU_H */
diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index 80eb615f93..c10459b56f 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -16,6 +16,11 @@
 # define TARGET_LONG_BITS 32
 # define TARGET_PHYS_ADDR_SPACE_BITS 34 /* 22-bit PPN */
 # define TARGET_VIRT_ADDR_SPACE_BITS 32 /* sv32 */
+#else
+/* 64-bit target, since QEMU isn't built to have TARGET_LONG_BITS over 64 */
+# define TARGET_LONG_BITS 64
+# define TARGET_PHYS_ADDR_SPACE_BITS 56 /* 44-bit PPN */
+# define TARGET_VIRT_ADDR_SPACE_BITS 48 /* sv48 */
 #endif
 #define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
 /*
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c8b98f1b70..5d21128865 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -38,6 +38,7 @@
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("rv128")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
@@ -50,6 +51,8 @@
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
 #elif defined(TARGET_RISCV64)
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
+#else
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE128
 #endif
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
diff --git a/disas/riscv.c b/disas/riscv.c
index 793ad14c27..03c8dc9961 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3090,3 +3090,8 @@ int print_insn_riscv64(bfd_vma memaddr, struct disassemble_info *info)
 {
     return print_insn_riscv(memaddr, info, rv64);
 }
+
+int print_insn_riscv128(bfd_vma memaddr, struct disassemble_info *info)
+{
+    return print_insn_riscv(memaddr, info, rv128);
+}
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b81b880900..d5a87f57e9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -143,6 +143,8 @@ static void riscv_any_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#else
+    set_misa(env, MXL_RV128, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
@@ -169,7 +171,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
-#else
+#elif defined(TARGET_RISCV32)
 static void rv32_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -209,6 +211,13 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
+#else
+static void rv128_base_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    /* We set this in the realise function */
+    set_misa(env, MXL_RV128, 0);
+}
 #endif
 
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
@@ -395,6 +404,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     case MXL_RV64:
         info->print_insn = print_insn_riscv64;
         break;
+    case MXL_RV128:
+        info->print_insn = print_insn_riscv128;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -457,6 +469,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 #ifdef TARGET_RISCV64
     case MXL_RV64:
         break;
+#elif !defined(TARGET_RISCV32)
+    case MXL_RV128:
+        break;
 #endif
     case MXL_RV32:
         break;
@@ -657,6 +672,8 @@ static gchar *riscv_gdb_arch_name(CPUState *cs)
         return g_strdup("riscv:rv32");
     case MXL_RV64:
         return g_strdup("riscv:rv64");
+    case MXL_RV128:
+        return g_strdup("riscv:rv128");
     default:
         g_assert_not_reached();
     }
@@ -721,6 +738,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
 #elif defined(TARGET_RISCV64)
     cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+#else
+    cc->gdb_core_xml_file = "riscv-128bit-cpu.xml";
 #endif
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
@@ -808,6 +827,8 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
+#else
+    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
 
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 23429179e2..f840a309e2 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -204,6 +204,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 #elif defined(TARGET_RISCV64)
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-64bit-virtual.xml", 0);
+#else
+    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
+                             1, "riscv-128bit-virtual.xml", 0);
 #endif
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index db9ae15755..41da696ec4 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -393,11 +393,11 @@ static bool trans_fmv_x_d(DisasContext *ctx, arg_fmv_x_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-#ifdef TARGET_RISCV64
+#ifdef TARGET_RISCV32
+    qemu_build_not_reached();
+#else
     gen_set_gpr(ctx, a->rd, cpu_fpr[a->rs1]);
     return true;
-#else
-    qemu_build_not_reached();
 #endif
 }
 
@@ -437,11 +437,11 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-#ifdef TARGET_RISCV64
+#ifdef TARGET_RISCV32
+    qemu_build_not_reached();
+#else
     tcg_gen_mov_tl(cpu_fpr[a->rd], get_gpr(ctx, a->rs1, EXT_NONE));
     mark_fs_dirty(ctx);
     return true;
-#else
-    qemu_build_not_reached();
 #endif
 }
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index bddbd418d9..90cc51e5d6 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -311,10 +311,10 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
 
     TCGv dest = dest_gpr(ctx, a->rd);
 
-#if defined(TARGET_RISCV64)
-    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
-#else
+#if defined(TARGET_RISCV32)
     tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
+#else
+    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
 #endif
 
     gen_set_gpr(ctx, a->rd, dest);
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
-- 
2.33.0


