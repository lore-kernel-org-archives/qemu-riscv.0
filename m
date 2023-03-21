Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peiS9-0007d5-TM
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 16:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afonsobordado@gmail.com>)
 id 1pegfX-0002Au-Fy; Tue, 21 Mar 2023 14:25:11 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <afonsobordado@gmail.com>)
 id 1pegfV-000602-Az; Tue, 21 Mar 2023 14:25:11 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so11617989wmb.5; 
 Tue, 21 Mar 2023 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679423106;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hahNSc6wPMOYSBlyv+I0peXw7RLn6s3h8fOcsyKpWeI=;
 b=dl6rUoFbNPXlUTLF1JrQfEpI9mN9q8iLfQ0EktHmEpJiNsFKXQKb5MH81IdObLeyfl
 DDQqVWb9BfZWgRPcgYO47C10WQ7EU4lYnG6jy9ZDyHFSteB4T2ptD47s4/4CFSjI1KlL
 yC4t8bHpMfNJ5vDtJPkY48G24ZBV3W+NTyNwaUs9PI7CQUK5oLXlvVIpECddfHsjD5Y2
 3O9/p61od5VRa3B60kgd/6AtiDI8C0jVluDLmcqNRQiwtgV77JIWvhRAu7bhgXQFhJEw
 NNo/ABgtJxDtXKx4Hu5y0ary0fMr4PvePWL1GHi5ZVX4F4Tl//LavuRmI7bCQWPwQg1v
 kSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679423106;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hahNSc6wPMOYSBlyv+I0peXw7RLn6s3h8fOcsyKpWeI=;
 b=F9AeBek/C/Qbp2dlHkBmCkZwCkSnHkoJV26/gUntAMq0VK5wJa2RiuboAPwca1tnAs
 2dx+StDiahzSlL9/aBFtREPICnXVQi6oUQ30aRzwwtpLu54jODYi0tS3CHgfyNVoZE9n
 H7VqLU4FGPIE0kI+k7ekeBdx0U3U48XIEgrk9/S0wdy2+BfuQDQgcCSk8mUD60TI5Eoq
 ahl8ChS+FpY30m9MU+UxXhX58STbB24eVNJPAgslm0Jw++R7ch0Hcj0UWPmuA87+5KKe
 DPb1kc1q0HK2Victy3VBezO5p5IV2Sg/Yuy1Nlw3l4g6fn9ohLoG9UKxPV5MjQmrgQ0E
 5kfA==
X-Gm-Message-State: AO0yUKUWZZr4nujjRFcZ1NwuHVv5iH5ORGlDT68bFeG3iEau1BhX68+/
 LO7lppb0uKI7cKbqpVWqfeSLZIG2A5C/PESD
X-Google-Smtp-Source: AK7set9G4i0FbJ78a+GYM08JIqfcxjuy3VpgwnbiJWpUHUvkrmAfIjOeRcYgboPaLGL2Nslpmmm1hg==
X-Received: by 2002:a7b:c409:0:b0:3ed:ca62:418e with SMTP id
 k9-20020a7bc409000000b003edca62418emr3181513wmi.9.1679423106620; 
 Tue, 21 Mar 2023 11:25:06 -0700 (PDT)
Received: from ?IPV6:2001:8a0:6c7b:b200:144b:f366:129e:e126?
 ([2001:8a0:6c7b:b200:144b:f366:129e:e126])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b003e9ded91c27sm20815161wms.4.2023.03.21.11.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 11:25:06 -0700 (PDT)
Message-ID: <324c2fd4-7044-0dd9-7ad9-b716fbefa5d9@gmail.com>
Date: Tue, 21 Mar 2023 18:25:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
From: Afonso Bordado <afonsobordado@gmail.com>
Subject: [PATCH qemu v3] linux-user: Emulate /proc/cpuinfo output for riscv
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=afonsobordado@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Mar 2023 16:19:27 -0400
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
X-List-Received-Date: Tue, 21 Mar 2023 18:25:11 -0000

RISC-V does not expose all extensions via hwcaps, thus some userspace
applications may want to query these via /proc/cpuinfo.

Currently when querying this file the host's file is shown instead
which is slightly confusing. Emulate a basic /proc/cpuinfo file
with mmu info and an ISA string.

Signed-off-by: Afonso Bordado <afonsobordado@gmail.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

Thanks everyone for reviewing! Should I resend this once the 8.0
freeze is over? Or does someone queue it for inclusion in the next
version?


Changes from V2:
- Update ChangeLog Location

Changes from V1:
- Call `g_free` on ISA string.
- Use `riscv_cpu_cfg` API.
- Query `cpu_env->xl` to check for RV32.


  linux-user/syscall.c              | 34 +++++++++++++++++++++++++++++--
  tests/tcg/riscv64/Makefile.target |  1 +
  tests/tcg/riscv64/cpuinfo.c       | 30 +++++++++++++++++++++++++++
  3 files changed, 63 insertions(+), 2 deletions(-)
  create mode 100644 tests/tcg/riscv64/cpuinfo.c

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24cea6fb6a..0388f8b0b0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8230,7 +8230,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
  }
  
  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
-    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
+    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
+    defined(TARGET_RISCV)
  static int is_proc(const char *filename, const char *entry)
  {
      return strcmp(filename, entry) == 0;
@@ -8308,6 +8309,35 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
  }
  #endif
  
+#if defined(TARGET_RISCV)
+static int open_cpuinfo(CPUArchState *cpu_env, int fd)
+{
+    int i;
+    int num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
+    RISCVCPU *cpu = env_archcpu(cpu_env);
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg((CPURISCVState *) cpu_env);
+    char *isa_string = riscv_isa_string(cpu);
+    const char *mmu;
+
+    if (cfg->mmu) {
+        mmu = (cpu_env->xl == MXL_RV32) ? "sv32"  : "sv48";
+    } else {
+        mmu = "none";
+    }
+
+    for (i = 0; i < num_cpus; i++) {
+        dprintf(fd, "processor\t: %d\n", i);
+        dprintf(fd, "hart\t\t: %d\n", i);
+        dprintf(fd, "isa\t\t: %s\n", isa_string);
+        dprintf(fd, "mmu\t\t: %s\n", mmu);
+        dprintf(fd, "uarch\t\t: qemu\n\n");
+    }
+
+    g_free(isa_string);
+    return 0;
+}
+#endif
+
  #if defined(TARGET_M68K)
  static int open_hardware(CPUArchState *cpu_env, int fd)
  {
@@ -8332,7 +8362,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
          { "/proc/net/route", open_net_route, is_proc },
  #endif
-#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
+#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
          { "/proc/cpuinfo", open_cpuinfo, is_proc },
  #endif
  #if defined(TARGET_M68K)
diff --git a/tests/tcg/riscv64/Makefile.target
b/tests/tcg/riscv64/Makefile.target
index cc3ed65ffd..df93a2ce1f 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -4,6 +4,7 @@
  VPATH += $(SRC_PATH)/tests/tcg/riscv64
  TESTS += test-div
  TESTS += noexec
+TESTS += cpuinfo
  
  # Disable compressed instructions for test-noc
  TESTS += test-noc
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
+    FILE *fp = fopen("/proc/cpuinfo", "r");
+    assert(fp != NULL);
+
+    while (fgets(buffer, BUFFER_SIZE, fp) != NULL) {
+        if (strstr(buffer, "processor") != NULL) {
+            assert(strstr(buffer, "processor\t: ") == buffer);
+        } else if (strstr(buffer, "hart") != NULL) {
+            assert(strstr(buffer, "hart\t\t: ") == buffer);
+        } else if (strstr(buffer, "isa") != NULL) {
+            assert(strcmp(buffer, "isa\t\t: rv64imafdc_zicsr_zifencei\n") == 0);
+        } else if (strstr(buffer, "mmu") != NULL) {
+            assert(strcmp(buffer, "mmu\t\t: sv48\n") == 0);
+        } else if (strstr(buffer, "uarch") != NULL) {
+            assert(strcmp(buffer, "uarch\t\t: qemu\n") == 0);
+        }
+    }
+
+    fclose(fp);
+    return 0;
+}
-- 
2.34.7


