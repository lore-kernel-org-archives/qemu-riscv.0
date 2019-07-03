Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1higgO-0002gi-0r
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 10:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54909)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <georg.kotheimer@kernkonzept.com>) id 1higDl-0002mt-Pr
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 10:26:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <georg.kotheimer@kernkonzept.com>) id 1higDk-0004Bx-Nt
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 10:26:53 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:59405
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1higDf-00043R-MS; Wed, 03 Jul 2019 10:26:49 -0400
Received: from [95.90.166.246] (helo=tweek.dd1.int.kernkonzept.com)
 by mx.kernkonzept.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) id 1higDU-0003do-OA; Wed, 03 Jul 2019 16:26:36 +0200
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Date: Wed,  3 Jul 2019 16:26:17 +0200
Message-Id: <20190703142617.21073-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:1c1c:b490::2
X-Mailman-Approved-At: Wed, 03 Jul 2019 10:56:22 -0400
Subject: [Qemu-riscv] [PATCH] RISC-V: Select FPU gdb xml file based on the
 supported extensions
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
X-List-Received-Date: Wed, 03 Jul 2019 14:26:55 -0000

The size of the FPU registers depends solely on the floating point
extensions supported by the target architecture.
However, in the previous implementation the floating point register
size was derived from whether the target architecture is 32-bit or
64-bit.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
 configure                                        |  4 ++--
 gdb-xml/{riscv-64bit-fpu.xml => riscv-fpu-d.xml} |  0
 gdb-xml/{riscv-32bit-fpu.xml => riscv-fpu-f.xml} |  0
 target/riscv/gdbstub.c                           | 15 +++++++--------
 4 files changed, 9 insertions(+), 10 deletions(-)
 rename gdb-xml/{riscv-64bit-fpu.xml => riscv-fpu-d.xml} (100%)
 rename gdb-xml/{riscv-32bit-fpu.xml => riscv-fpu-f.xml} (100%)

diff --git a/configure b/configure
index f2cb9f3c66..462c5a4f1a 100755
--- a/configure
+++ b/configure
@@ -7581,14 +7581,14 @@ case "$target_name" in
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
diff --git a/gdb-xml/riscv-64bit-fpu.xml b/gdb-xml/riscv-fpu-d.xml
similarity index 100%
rename from gdb-xml/riscv-64bit-fpu.xml
rename to gdb-xml/riscv-fpu-d.xml
diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-fpu-f.xml
similarity index 100%
rename from gdb-xml/riscv-32bit-fpu.xml
rename to gdb-xml/riscv-fpu-f.xml
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 27be93279b..29fa468b28 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -375,20 +375,19 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-#if defined(TARGET_RISCV32)
-    if (env->misa & RVF) {
+
+    if (env->misa & RVD) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
-                                 36, "riscv-32bit-fpu.xml", 0);
+                                 36, "riscv-fpu-d.xml", 0);
+    } else if (env->misa & RVF) {
+        gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
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
2.19.1


