Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iGPKj-0000CX-V7
	for mharc-qemu-riscv@gnu.org; Fri, 04 Oct 2019 11:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iGPKe-00007f-1F
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2019 11:17:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iGPKX-0006Fv-RO
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2019 11:17:21 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:53886)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iGPKN-00067a-Or
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2019 11:17:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570202222; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
 Date: Subject: Cc: To: From: Sender;
 bh=tCetiAvXfVBrKyF+Aw4/cFWBZ2TuN7FeWmx69qUVE+g=;
 b=5fznc/skjXb/j+TbQdGCZCAh0wIwJwI66clvBZacXzZnwl3V2eh8o1v2wma73vHGKzdpyqWZ
 MGeCf9pqzn0Lt4bkhSFPt+/xlOa+mBXM0VTDZ27d1kjan8K8sKNRe+iw1VWjmjlQustmK10X
 5n88edcyJA/q+PrZRFdBPfxQomiYMtEMH1CsFkjXGWB8PnmALiTNmYFCnBSgfVRLAWhE8bT8
 VopHjtVRP6DqtDoWOrLQ6N6HvTH6JG8hp0scWPPqR2OUD7FdDqzKUD4jI3s7Jv8C2gmSx9F+
 07tzAdTrhfgSu3r5+spKbVE/IumC2jjexUBcoKt0UXVACEW7nviUuA==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
 (30-10-182.wireless.csail.mit.edu [128.30.10.182])
 by mxa.mailgun.org with ESMTP id 5d97626c.7f56c4139120-smtp-out-n01;
 Fri, 04 Oct 2019 15:17:00 -0000 (UTC)
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
Subject: [PATCH v2] target/riscv: Expose "priv" register for GDB
Date: Fri,  4 Oct 2019 11:16:14 -0400
Message-Id: <20191004151614.81516-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.23.0
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
X-List-Received-Date: Fri, 04 Oct 2019 15:17:26 -0000

This patch enables a debugger to read and write the current privilege level via
a special "priv" register. When compiled with CONFIG_USER_ONLY the register is
still visible but is hardwired to zero.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 gdb-xml/riscv-32bit-cpu.xml |  1 +
 gdb-xml/riscv-64bit-cpu.xml |  1 +
 target/riscv/cpu.c          |  2 +-
 target/riscv/gdbstub.c      | 14 ++++++++++++++
 4 files changed, 17 insertions(+), 1 deletion(-)
---
Changelog V2:
- Use PRV_H and PRV_S instead of integer literals

diff --git a/gdb-xml/riscv-32bit-cpu.xml b/gdb-xml/riscv-32bit-cpu.xml
index 0d07aaec85..d6d76aafd8 100644
--- a/gdb-xml/riscv-32bit-cpu.xml
+++ b/gdb-xml/riscv-32bit-cpu.xml
@@ -44,4 +44,5 @@
   <reg name="t5" bitsize="32" type="int"/>
   <reg name="t6" bitsize="32" type="int"/>
   <reg name="pc" bitsize="32" type="code_ptr"/>
+  <reg name="priv" bitsize="32" type="int"/>
 </feature>
diff --git a/gdb-xml/riscv-64bit-cpu.xml b/gdb-xml/riscv-64bit-cpu.xml
index b8aa424ae4..0758d1b5fe 100644
--- a/gdb-xml/riscv-64bit-cpu.xml
+++ b/gdb-xml/riscv-64bit-cpu.xml
@@ -44,4 +44,5 @@
   <reg name="t5" bitsize="64" type="int"/>
   <reg name="t6" bitsize="64" type="int"/>
   <reg name="pc" bitsize="64" type="code_ptr"/>
+  <reg name="priv" bitsize="64" type="int" />
 </feature>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f13e298a36..347989858f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -475,7 +475,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->synchronize_from_tb = riscv_cpu_synchronize_from_tb;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 33;
+    cc->gdb_num_core_regs = 34;
 #if defined(TARGET_RISCV32)
     cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
 #elif defined(TARGET_RISCV64)
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index ded140e8d8..7e0822145d 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -278,6 +278,12 @@ int riscv_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
         return gdb_get_regl(mem_buf, env->gpr[n]);
     } else if (n == 32) {
         return gdb_get_regl(mem_buf, env->pc);
+    } else if (n == 33) {
+#ifdef CONFIG_USER_ONLY
+        return gdb_get_regl(mem_buf, 0);
+#else
+        return gdb_get_regl(mem_buf, env->priv);
+#endif
     }
     return 0;
 }
@@ -296,6 +302,14 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     } else if (n == 32) {
         env->pc = ldtul_p(mem_buf);
         return sizeof(target_ulong);
+    } else if (n == 33) {
+#ifndef CONFIG_USER_ONLY
+        env->priv = ldtul_p(mem_buf) & 0x3;
+        if (env->priv == PRV_H) {
+            env->priv = PRV_S;
+        }
+#endif
+        return sizeof(target_ulong);
     }
     return 0;
 }
-- 
2.23.0

