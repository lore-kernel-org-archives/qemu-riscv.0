Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paGpI-0004jx-Vz
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 09:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1paGpB-0004bp-Qz; Thu, 09 Mar 2023 09:00:55 -0500
Received: from forward106j.mail.yandex.net ([2a02:6b8:0:801:2::109])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1paGp9-0001Ip-K9; Thu, 09 Mar 2023 09:00:53 -0500
Received: from iva3-dd2bb2ff2b5f.qloud-c.yandex.net
 (iva3-dd2bb2ff2b5f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:7611:0:640:dd2b:b2ff])
 by forward106j.mail.yandex.net (Yandex) with ESMTP id 8480F6BD89B3;
 Thu,  9 Mar 2023 16:54:14 +0300 (MSK)
Received: by iva3-dd2bb2ff2b5f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id BsdJhR3bk8c1-0CWZd0hO; Thu, 09 Mar 2023 16:54:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1678370053; bh=eFm8VCL1PLveRB8WCNxZodpv/TMfY4YITyhE/ClC8l8=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=eXO6xgfKMVH5YttMDw5vTLPnIxHBmLWpblKXzD9jQ30CGZnGI92I+GrTjuqsdHsXj
 snax24S5RkL5ff+OufcZSkRz+yiD1qmpy/P8OtA++8A3UDJ/AVZorlUvQoU4RSsQGq
 g2Lm4Axy6olegjmWxv6pEr1EdTEhOrgdr531f+6I=
Authentication-Results: iva3-dd2bb2ff2b5f.qloud-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 liu@linux.alibaba.com, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH v2] target/riscv: Add RVV registers to log
Date: Thu,  9 Mar 2023 16:54:03 +0300
Message-Id: <20230309135403.102703-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:801:2::109;
 envelope-from=ivan.klokov@syntacore.com; helo=forward106j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Mar 2023 14:00:57 -0000

Added QEMU option 'rvv' to add RISC-V RVV registers to log like regular regs.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
v2:
   - fix option name
   - fix byte ordering
---
 accel/tcg/cpu-exec.c  |  3 +++
 include/hw/core/cpu.h |  2 ++
 include/qemu/log.h    |  1 +
 target/riscv/cpu.c    | 59 ++++++++++++++++++++++++++++++++++++++++++-
 util/log.c            |  2 ++
 5 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 56aaf58b9d..0dca69fccb 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -319,6 +319,9 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
 #if defined(TARGET_I386)
                 flags |= CPU_DUMP_CCOP;
 #endif
+                if (qemu_loglevel_mask(CPU_LOG_TB_VPU)) {
+                    flags |= CPU_DUMP_VPU;
+                }
                 cpu_dump_state(cpu, logfile, flags);
                 qemu_log_unlock(logfile);
             }
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 75689bff02..7c9d25ff45 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -545,11 +545,13 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu);
  * @CPU_DUMP_CODE:
  * @CPU_DUMP_FPU: dump FPU register state, not just integer
  * @CPU_DUMP_CCOP: dump info about TCG QEMU's condition code optimization state
+ * @CPU_DUMP_VPU: dump VPU registers
  */
 enum CPUDumpFlags {
     CPU_DUMP_CODE = 0x00010000,
     CPU_DUMP_FPU  = 0x00020000,
     CPU_DUMP_CCOP = 0x00040000,
+    CPU_DUMP_VPU  = 0x00080000,
 };
 
 /**
diff --git a/include/qemu/log.h b/include/qemu/log.h
index c5643d8dd5..df59bfabcd 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -35,6 +35,7 @@ bool qemu_log_separate(void);
 /* LOG_STRACE is used for user-mode strace logging. */
 #define LOG_STRACE         (1 << 19)
 #define LOG_PER_THREAD     (1 << 20)
+#define CPU_LOG_TB_VPU     (1 << 21)
 
 /* Lock/unlock output. */
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5bc0005cc7..0b16c9c8e3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -172,6 +172,14 @@ const char * const riscv_fpr_regnames[] = {
   "f30/ft10", "f31/ft11"
 };
 
+const char * const riscv_rvv_regnames[] = {
+  "v0",  "v1",  "v2",  "v3",  "v4",  "v5",  "v6",
+  "v7",  "v8",  "v9",  "v10", "v11", "v12", "v13",
+  "v14", "v15", "v16", "v17", "v18", "v19", "v20",
+  "v21", "v22", "v23", "v24", "v25", "v26", "v27",
+  "v28", "v29", "v30", "v31"
+};
+
 static const char * const riscv_excp_names[] = {
     "misaligned_fetch",
     "fault_fetch",
@@ -422,7 +430,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    int i;
+    int i, j;
+    uint8_t *p;
 
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
@@ -506,6 +515,54 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             }
         }
     }
+    if (riscv_has_ext(env, RVV)) {
+        if (flags & CPU_DUMP_VPU) {
+
+            static const int dump_rvv_csrs[] = {
+                        CSR_VSTART,
+                        CSR_VXSAT,
+                        CSR_VXRM,
+                        CSR_VCSR,
+                        CSR_VL,
+                        CSR_VTYPE,
+                        CSR_VLENB,
+                    };
+            for (int i = 0; i < ARRAY_SIZE(dump_rvv_csrs); ++i) {
+                int csrno = dump_rvv_csrs[i];
+                target_ulong val = 0;
+                RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
+
+                /*
+                 * Rely on the smode, hmode, etc, predicates within csr.c
+                 * to do the filtering of the registers that are present.
+                 */
+                if (res == RISCV_EXCP_NONE) {
+                    qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
+                                 csr_ops[csrno].name, val);
+                }
+            }
+            uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+
+/*
+ * From vector_helper.c
+ * Note that vector data is stored in host-endian 64-bit chunks,
+ * so addressing bytes needs a host-endian fixup.
+ */
+#if HOST_BIG_ENDIAN
+#define BYTE(x)   ((x) ^ 7)
+#else
+#define BYTE(x)   (x)
+#endif
+            for (i = 0; i < 32; i++) {
+                qemu_fprintf(f, " %-8s ", riscv_rvv_regnames[i]);
+                p = (uint8_t *)env->vreg;
+                for (j = vlenb - 1 ; j >= 0; j--) {
+                    qemu_fprintf(f, "%02x", *(p + i * vlenb + BYTE(j)));
+                }
+                qemu_fprintf(f, "\n");
+            }
+        }
+    }
 }
 
 static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
diff --git a/util/log.c b/util/log.c
index 7837ff9917..93dccee7b8 100644
--- a/util/log.c
+++ b/util/log.c
@@ -495,6 +495,8 @@ const QEMULogItem qemu_log_items[] = {
       "log every user-mode syscall, its input, and its result" },
     { LOG_PER_THREAD, "tid",
       "open a separate log file per thread; filename must contain '%d'" },
+    { CPU_LOG_TB_VPU, "vpu",
+      "include VPU registers in the 'cpu' logging" },
     { 0, NULL, NULL },
 };
 
-- 
2.34.1


