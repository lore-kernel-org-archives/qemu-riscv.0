Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i05Kd-0007d5-Sb
	for mharc-qemu-riscv@gnu.org; Tue, 20 Aug 2019 10:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <georg.kotheimer@kernkonzept.com>) id 1i05Kb-0007ao-Fn
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2019 10:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <georg.kotheimer@kernkonzept.com>) id 1i05KZ-0008LQ-VI
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2019 10:41:53 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:39247
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1i05KW-0008IZ-Ka; Tue, 20 Aug 2019 10:41:48 -0400
Received: from [95.90.100.178] (helo=tweek.dd1.int.kernkonzept.com)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1i05KS-0004Kp-Df; Tue, 20 Aug 2019 16:41:44 +0200
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Date: Tue, 20 Aug 2019 16:39:42 +0200
Message-Id: <20190820143942.17371-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:1c1c:b490::2
Subject: [Qemu-riscv] [PATCH v2] RISC-V: Select FPU gdb xml file based on
 the supported extensions
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
X-List-Received-Date: Tue, 20 Aug 2019 14:41:55 -0000

The size of the FPU registers depends solely on the floating point
extensions supported by the target architecture.
However, in the previous implementation the floating point register
size was derived from whether the target architecture is 32-bit or
64-bit.

To allow RVF without RVD, changes to riscv_gdb_get_fpu() and
riscv_gdb_set_fpu() were necessary.

In addition fflags, frm and fcsr were removed from
riscv-XXbit-csr.xml, as the floating point csr registers are only
available, if a FPU is present.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
 configure                                     |  4 +-
 gdb-xml/riscv-32bit-csr.xml                   |  3 --
 gdb-xml/riscv-64bit-csr.xml                   |  3 --
 .../{riscv-64bit-fpu.xml => riscv-fpu-d.xml}  |  0
 .../{riscv-32bit-fpu.xml => riscv-fpu-f.xml}  |  0
 target/riscv/gdbstub.c                        | 50 ++++++++++---------
 6 files changed, 29 insertions(+), 31 deletions(-)
 rename gdb-xml/{riscv-64bit-fpu.xml => riscv-fpu-d.xml} (100%)
 rename gdb-xml/{riscv-32bit-fpu.xml => riscv-fpu-f.xml} (100%)

diff --git a/configure b/configure
index 714e7fb6a1..f9e2320586 100755
--- a/configure
+++ b/configure
@@ -7596,14 +7596,14 @@ case "$target_name" in
     TARGET_BASE_ARCH=riscv
     TARGET_ABI_DIR=riscv
     mttcg=yes
-    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-32bit-csr.xml"
+    gdb_xml_files="riscv-32bit-cpu.xml riscv-fpu-f.xml riscv-fpu-d.xml riscv-32bit-csr.xml"
     target_compiler=$cross_cc_riscv32
   ;;
   riscv64)
     TARGET_BASE_ARCH=riscv
     TARGET_ABI_DIR=riscv
     mttcg=yes
-    gdb_xml_files="riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit-csr.xml"
+    gdb_xml_files="riscv-64bit-cpu.xml riscv-fpu-f.xml riscv-fpu-d.xml riscv-64bit-csr.xml"
     target_compiler=$cross_cc_riscv64
   ;;
   sh4|sh4eb)
diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml
index da1bf19e2f..cb36f7050a 100644
--- a/gdb-xml/riscv-32bit-csr.xml
+++ b/gdb-xml/riscv-32bit-csr.xml
@@ -15,9 +15,6 @@
   <reg name="ucause" bitsize="32"/>
   <reg name="utval" bitsize="32"/>
   <reg name="uip" bitsize="32"/>
-  <reg name="fflags" bitsize="32"/>
-  <reg name="frm" bitsize="32"/>
-  <reg name="fcsr" bitsize="32"/>
   <reg name="cycle" bitsize="32"/>
   <reg name="time" bitsize="32"/>
   <reg name="instret" bitsize="32"/>
diff --git a/gdb-xml/riscv-64bit-csr.xml b/gdb-xml/riscv-64bit-csr.xml
index 6aa4bed9f5..34ffe1e426 100644
--- a/gdb-xml/riscv-64bit-csr.xml
+++ b/gdb-xml/riscv-64bit-csr.xml
@@ -15,9 +15,6 @@
   <reg name="ucause" bitsize="64"/>
   <reg name="utval" bitsize="64"/>
   <reg name="uip" bitsize="64"/>
-  <reg name="fflags" bitsize="64"/>
-  <reg name="frm" bitsize="64"/>
-  <reg name="fcsr" bitsize="64"/>
   <reg name="cycle" bitsize="64"/>
   <reg name="time" bitsize="64"/>
   <reg name="instret" bitsize="64"/>
diff --git a/gdb-xml/riscv-64bit-fpu.xml b/gdb-xml/riscv-fpu-d.xml
similarity index 100%
rename from gdb-xml/riscv-64bit-fpu.xml
rename to gdb-xml/riscv-fpu-d.xml
diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-fpu-f.xml
similarity index 100%
rename from gdb-xml/riscv-32bit-fpu.xml
rename to gdb-xml/riscv-fpu-f.xml
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 27be93279b..c6e530fdd2 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -35,9 +35,6 @@ static int csr_register_map[] = {
     CSR_UCAUSE,
     CSR_UTVAL,
     CSR_UIP,
-    CSR_FFLAGS,
-    CSR_FRM,
-    CSR_FCSR,
     CSR_CYCLE,
     CSR_TIME,
     CSR_INSTRET,
@@ -303,19 +300,22 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 static int riscv_gdb_get_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
     if (n < 32) {
-        return gdb_get_reg64(mem_buf, env->fpr[n]);
+        if (env->misa & RVD) {
+            return gdb_get_reg64(mem_buf, env->fpr[n]);
+        }
+        return gdb_get_reg32(mem_buf, env->fpr[n]);
     /* there is hole between ft11 and fflags in fpu.xml */
     } else if (n < 36 && n > 32) {
         target_ulong val = 0;
         int result;
         /*
-         * CSR_FFLAGS is at index 8 in csr_register, and gdb says it is FP
-         * register 33, so we recalculate the map index.
+         * CSR_FFLAGS is at index 1 in the csr space, and gdb says it is FP
+         * register 33, so we recalculate the csr index.
          * This also works for CSR_FRM and CSR_FCSR.
          */
-        result = riscv_csrrw_debug(env, n - 33 +  8, &val, 0, 0);
+        result = riscv_csrrw_debug(env, n - 33 + CSR_FFLAGS, &val, 0, 0);
         if (result == 0) {
-            return gdb_get_regl(mem_buf, val);
+            return gdb_get_reg32(mem_buf, val);
         }
     }
     return 0;
@@ -324,20 +324,25 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
 static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
 {
     if (n < 32) {
-        env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
-        return sizeof(uint64_t);
+        if (env->misa & RVD) {
+            env->fpr[n] = ldq_p(mem_buf);
+            return sizeof(uint64_t);
+        } else {
+            env->fpr[n] = ldl_p(mem_buf);
+            return sizeof(uint32_t);
+        }
     /* there is hole between ft11 and fflags in fpu.xml */
     } else if (n < 36 && n > 32) {
-        target_ulong val = ldtul_p(mem_buf);
+        target_ulong val = ldl_p(mem_buf);
         int result;
         /*
-         * CSR_FFLAGS is at index 8 in csr_register, and gdb says it is FP
-         * register 33, so we recalculate the map index.
+         * CSR_FFLAGS is at index 1 in the csr space, and gdb says it is FP
+         * register 33, so we recalculate the csr index.
          * This also works for CSR_FRM and CSR_FCSR.
          */
-        result = riscv_csrrw_debug(env, n - 33 + 8, NULL, val, -1);
+        result = riscv_csrrw_debug(env, n - 33 + CSR_FFLAGS, NULL, val, -1);
         if (result == 0) {
-            return sizeof(target_ulong);
+            return sizeof(uint32_t);
         }
     }
     return 0;
@@ -375,20 +380,19 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-#if defined(TARGET_RISCV32)
-    if (env->misa & RVF) {
+
+    if (env->misa & RVD) {
+        gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
+                                 36, "riscv-fpu-d.xml", 0);
+    } else if (env->misa & RVF) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
-                                 36, "riscv-32bit-fpu.xml", 0);
+                                 36, "riscv-fpu-f.xml", 0);
     }
 
+#if defined(TARGET_RISCV32)
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
                              4096, "riscv-32bit-csr.xml", 0);
 #elif defined(TARGET_RISCV64)
-    if (env->misa & RVF) {
-        gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
-                                 36, "riscv-64bit-fpu.xml", 0);
-    }
-
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
                              4096, "riscv-64bit-csr.xml", 0);
 #endif
-- 
2.20.1


