Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Pw-0005yP-Mi
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7Pq-0005jo-BB
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7Po-00042o-VW
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:46 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35216)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7Po-000427-P2
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:44 -0400
Received: by mail-pg1-x531.google.com with SMTP id c8so7173938pgb.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=PTy3sG1Wabo8cInblQzF3n4m9xQd4ThxU4ey9KR/Tjw=;
 b=GYFru5K/YUokoTPbQ5w3pNJuHDimW3SLfQviXB4EJUIWR5hIMwXvk9XsxV9Pq5qFd8
 ixmGgEZLOh5eMCHOQao+fNp2gP3WbwlzJfKjLtVm42BQ06x4DePMb78u2r7aycUdAiG3
 fE6NL4CWBACS59kAv9RPqZZdGUkBWB4esgHZ4TKHLpw12RSdQbw0j19E9YEMh0twXCVt
 k1Iq9S9mtRN+/7/96g+eGB4yNLLluEjm3piYgxz8mixpLEr2V5LGHH9k3aP6yWQ2zb98
 J+L/2w5d0cf5LFQXoPwEMoOuOf2rNozq/3hl/Is5hsa3iPUBN3QWG8g02Nw14XvMDaHZ
 5rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=PTy3sG1Wabo8cInblQzF3n4m9xQd4ThxU4ey9KR/Tjw=;
 b=XBZ0lygZM0onfYPzxXol3u5QPnkmMsJj1TRNfyr+/QdHw2vy1WodtYwuArgR9MsrZ+
 8zAM82VnaaQ0U5M/z0SbO+sbCUgTInu8N7FhSgMode1ISbP1WRuDyI2vRm66HsjqCyi8
 UbvgDMShZcApVKDxgUT6biu4u3MwWEW9p6668nMXJxMHa++7rF45sI4CfkAcUIK6sGAH
 YfAxf9AvA4DFPXTanXO8q5UdYE+tUpBJTvR/e2w92CALH0c5g/x52xe4DVZQGRFhz2Ss
 NJ+HCNPBbHKTBJIw3y8i7PMg1B+zVIj3RBXTihSkYIdYq74x0Z0nUE+yaDJgSIKHr1a5
 Sytw==
X-Gm-Message-State: APjAAAWjpEOumngUHl4SgeJPNu+CXDtn6V0HFOZ6JnJKjv3HyAWbifuI
 O7by1u1F2Lbkno7BuASMbh/EBA==
X-Google-Smtp-Source: APXvYqwsYQwvNtBvTahr+DwNE5pgjmCA3ZceiPYOMqk2v8nJ38Z3A3Sis7R+wfx/gTvpZUEFwS1cMQ==
X-Received: by 2002:a63:3108:: with SMTP id x8mr21438209pgx.339.1572278323168; 
 Mon, 28 Oct 2019 08:58:43 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f26sm5171621pgf.22.2019.10.28.08.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:42 -0700 (PDT)
Subject: [PULL 15/18] target/riscv: Expose "priv" register for GDB for reads
Date: Mon, 28 Oct 2019 08:48:59 -0700
Message-Id: <20191028154902.32491-16-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Jonathan Behrens <jonathan@fintelia.io>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::531
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:49 -0000

From: Jonathan Behrens <jonathan@fintelia.io>

This patch enables a debugger to read the current privilege level via a virtual
"priv" register. When compiled with CONFIG_USER_ONLY the register is still
visible but always reports the value zero.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 configure                       |  4 ++--
 gdb-xml/riscv-32bit-virtual.xml | 11 +++++++++++
 gdb-xml/riscv-64bit-virtual.xml | 11 +++++++++++
 target/riscv/gdbstub.c          | 23 +++++++++++++++++++++++
 4 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 gdb-xml/riscv-32bit-virtual.xml
 create mode 100644 gdb-xml/riscv-64bit-virtual.xml

diff --git a/configure b/configure
index 145fcabbb3..dc94026a3c 100755
--- a/configure
+++ b/configure
@@ -7526,13 +7526,13 @@ case "$target_name" in
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
index cb5bfd3d50..1f71604b78 100644
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
+                             1, "riscv-32bit-virtual.xml", 0);
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
2.21.0


