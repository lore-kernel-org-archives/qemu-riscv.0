Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHd97-0002Zw-HQ
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 20:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHd92-0002Va-Sb
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:14:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHd91-0005Li-9w
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:14:28 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:44356)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHd91-0005K4-55
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:14:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570493667; h=Content-Transfer-Encoding: MIME-Version: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=oBPZgEFOLKTVX1RbYFPu/Z2W49S8279uUe0qDuElOXM=;
 b=VAANlhLXCgdh92g/nuTRgMYD4I3Dhh+8JxrZY7+CEbSJizqhAFn4pH5Dz9xrpJg/8MgoMydS
 FRMhKRErgs7px4FRrrq+d0JwNojd7DwjbKBwHVpPKz/wkO5iby5EFGYoULoXH+QdmruIKgQC
 OlCJj9Rgo4L02wOY2MPazYpQuxifyr3uhujIIynsWGrHRev9iiFDPeksugK0ZWgtCi+OK+eI
 1NYVa1eOQ7erANcYd5VLP6QNWjaxyJdfyhM0rIUGRnlQxkooOLUIMYwPMKiJA9JjkrUxt1N4
 O3qPAqaUXtEqTmuATYH1Kvoi+S+EaWm0lzDEqEeA0o8+fPXRubnghQ==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5d9bd4e1.7f51c380ba28-smtp-out-n01;
 Tue, 08 Oct 2019 00:14:25 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jonathan Behrens <jonathan@fintelia.io>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v3 2/3] target/riscv: Expose priv register for GDB for reads
Date: Mon,  7 Oct 2019 20:13:17 -0400
Message-Id: <20191008001318.219367-3-jonathan@fintelia.io>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008001318.219367-1-jonathan@fintelia.io>
References: <20191008001318.219367-1-jonathan@fintelia.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.61.151.224
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
X-List-Received-Date: Tue, 08 Oct 2019 00:14:30 -0000

This patch enables a debugger to read the current privilege level via a virtual
"priv" register. When compiled with CONFIG_USER_ONLY the register is still
visible but always reports the value zero.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 configure                       |  4 ++--
 gdb-xml/riscv-32bit-virtual.xml | 11 +++++++++++
 gdb-xml/riscv-64bit-virtual.xml | 11 +++++++++++
 target/riscv/gdbstub.c          | 23 +++++++++++++++++++++++
 4 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 gdb-xml/riscv-32bit-virtual.xml
 create mode 100644 gdb-xml/riscv-64bit-virtual.xml

diff --git a/configure b/configure
index 30544f52e6..6118a6a045 100755
--- a/configure
+++ b/configure
@@ -7520,13 +7520,13 @@ case "$target_name" in
     TARGET_BASE_ARCH=riscv
     TARGET_ABI_DIR=riscv
     mttcg=yes
-    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-32bit-csr.xml"
+    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-32bit-csr.xml riscv-32bit-virtual.xml"
   ;;
   riscv64)
     TARGET_BASE_ARCH=riscv
     TARGET_ABI_DIR=riscv
     mttcg=yes
-    gdb_xml_files="riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit-csr.xml"
+    gdb_xml_files="riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit-csr.xml riscv-64bit-virtual.xml"
   ;;
   sh4|sh4eb)
     TARGET_ARCH=sh4
diff --git a/gdb-xml/riscv-32bit-virtual.xml b/gdb-xml/riscv-32bit-virtual.xml
new file mode 100644
index 0000000000..905f1c555d
--- /dev/null
+++ b/gdb-xml/riscv-32bit-virtual.xml
@@ -0,0 +1,11 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.riscv.virtual">
+  <reg name="priv" bitsize="32"/>
+</feature>
diff --git a/gdb-xml/riscv-64bit-virtual.xml b/gdb-xml/riscv-64bit-virtual.xml
new file mode 100644
index 0000000000..62d86c237b
--- /dev/null
+++ b/gdb-xml/riscv-64bit-virtual.xml
@@ -0,0 +1,11 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.riscv.virtual">
+  <reg name="priv" bitsize="64"/>
+</feature>
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index cb5bfd3d50..33cf7c4c7d 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -373,6 +373,23 @@ static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
+static int riscv_gdb_get_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
+{
+    if (n == 0) {
+#ifdef CONFIG_USER_ONLY
+        return gdb_get_regl(mem_buf, 0);
+#else
+        return gdb_get_regl(mem_buf, cs->priv);
+#endif
+    }
+    return 0;
+}
+
+static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
+{
+    return 0;
+}
+
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -385,6 +402,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
                              240, "riscv-32bit-csr.xml", 0);
+
+    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
+                             1, "riscv-32bit-csr.xml", 0);
 #elif defined(TARGET_RISCV64)
     if (env->misa & RVF) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
@@ -393,5 +413,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
                              240, "riscv-64bit-csr.xml", 0);
+
+    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
+                             1, "riscv-64bit-virtual.xml", 0);
 #endif
 }
-- 
2.23.0

