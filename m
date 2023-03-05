Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIFL-0000Vo-0s
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 16:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pZD1m-0001JD-5n; Mon, 06 Mar 2023 10:45:30 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pZD1k-0004Gl-JL; Mon, 06 Mar 2023 10:45:29 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 53A9111EF58;
 Mon,  6 Mar 2023 15:45:26 +0000 (UTC)
From: ~abordado <abordado@git.sr.ht>
Date: Sun, 05 Mar 2023 14:34:37 +0000
Subject: [PATCH qemu] linux-user: Emulate /proc/cpuinfo output for riscv
Message-ID: <167811752616.21558.7117682501860352029-0@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~abordado <afonsobordado@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 06 Mar 2023 16:19:50 -0500
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
X-List-Received-Date: Mon, 06 Mar 2023 15:45:30 -0000

From: Afonso Bordado <afonsobordado@gmail.com>

RISC-V does not expose all extensions via hwcaps, thus some userspace
applications may want to query these via /proc/cpuinfo.

Currently when querying this file the host's file is shown instead
which is slightly confusing. Emulate a basic /proc/cpuinfo file
with mmu info and an ISA sting.

Signed-off-by: Afonso Bordado <afonsobordado@gmail.com>
---
 linux-user/syscall.c              | 32 +++++++++++++++++++++++++++++--
 tests/tcg/riscv64/Makefile.target |  1 +
 tests/tcg/riscv64/cpuinfo.c       | 30 +++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/riscv64/cpuinfo.c

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a6c426d73c..eda2bc5df0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8183,7 +8183,8 @@ void target_exception_dump(CPUArchState *env, const cha=
r *fmt, int code)
 }
=20
 #if HOST_BIG_ENDIAN !=3D TARGET_BIG_ENDIAN || \
-    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
+    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) ||=
 \
+    defined(TARGET_RISCV)
 static int is_proc(const char *filename, const char *entry)
 {
     return strcmp(filename, entry) =3D=3D 0;
@@ -8261,6 +8262,33 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 }
 #endif
=20
+#if defined(TARGET_RISCV)
+static int open_cpuinfo(CPUArchState *cpu_env, int fd)
+{
+    int i;
+    int num_cpus =3D sysconf(_SC_NPROCESSORS_ONLN);
+    RISCVCPU *cpu =3D env_archcpu(cpu_env);
+    char *isa_string =3D riscv_isa_string(cpu);
+    bool is_32_bit =3D riscv_cpu_xlen(&cpu->env) =3D=3D 32;
+    const char *mmu;
+
+    if (cpu->cfg.mmu) {
+        mmu =3D (is_32_bit) ? "sv32" : "sv48";
+    } else {
+        mmu =3D "none";
+    }
+
+    for (i =3D 0; i < num_cpus; i++) {
+        dprintf(fd, "processor\t: %d\n", i);
+        dprintf(fd, "hart\t\t: %d\n", i);
+        dprintf(fd, "isa\t\t: %s\n", isa_string);
+        dprintf(fd, "mmu\t\t: %s\n", mmu);
+        dprintf(fd, "uarch\t\t: qemu\n\n");
+    }
+    return 0;
+}
+#endif
+
 #if defined(TARGET_M68K)
 static int open_hardware(CPUArchState *cpu_env, int fd)
 {
@@ -8285,7 +8313,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, =
const char *pathname, int
 #if HOST_BIG_ENDIAN !=3D TARGET_BIG_ENDIAN
         { "/proc/net/route", open_net_route, is_proc },
 #endif
-#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
+#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
         { "/proc/cpuinfo", open_cpuinfo, is_proc },
 #endif
 #if defined(TARGET_M68K)
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.t=
arget
index cc3ed65ffd..df93a2ce1f 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -4,6 +4,7 @@
 VPATH +=3D $(SRC_PATH)/tests/tcg/riscv64
 TESTS +=3D test-div
 TESTS +=3D noexec
+TESTS +=3D cpuinfo
=20
 # Disable compressed instructions for test-noc
 TESTS +=3D test-noc
diff --git a/tests/tcg/riscv64/cpuinfo.c b/tests/tcg/riscv64/cpuinfo.c
new file mode 100644
index 0000000000..296abd0a8c
--- /dev/null
+++ b/tests/tcg/riscv64/cpuinfo.c
@@ -0,0 +1,30 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <assert.h>
+
+#define BUFFER_SIZE 1024
+
+int main(void)
+{
+    char buffer[BUFFER_SIZE];
+    FILE *fp =3D fopen("/proc/cpuinfo", "r");
+    assert(fp !=3D NULL);
+
+    while (fgets(buffer, BUFFER_SIZE, fp) !=3D NULL) {
+        if (strstr(buffer, "processor") !=3D NULL) {
+            assert(strstr(buffer, "processor\t: ") =3D=3D buffer);
+        } else if (strstr(buffer, "hart") !=3D NULL) {
+            assert(strstr(buffer, "hart\t\t: ") =3D=3D buffer);
+        } else if (strstr(buffer, "isa") !=3D NULL) {
+            assert(strcmp(buffer, "isa\t\t: rv64imafdc_zicsr_zifencei\n") =
=3D=3D 0);
+        } else if (strstr(buffer, "mmu") !=3D NULL) {
+            assert(strcmp(buffer, "mmu\t\t: sv48\n") =3D=3D 0);
+        } else if (strstr(buffer, "uarch") !=3D NULL) {
+            assert(strcmp(buffer, "uarch\t\t: qemu\n") =3D=3D 0);
+        }
+    }
+
+    fclose(fp);
+    return 0;
+}
--=20
2.34.7

