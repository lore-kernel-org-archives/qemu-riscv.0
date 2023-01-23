Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJxmD-0007PA-8h
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 09:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1pJvQZ-0007iO-CK
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 06:55:55 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1pJvQX-0007t3-MB
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 06:55:55 -0500
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1pJvQO-009V47-IO; Mon, 23 Jan 2023 11:55:45 +0000
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1pJvQP-000hSe-08;
 Mon, 23 Jan 2023 11:55:45 +0000
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, jude.onyenegecha@sifive.com,
 sudip.mukherjee@sifive.com, Ben Dooks <ben.dooks@sifive.com>
Subject: [RFC] riscv: add config for asid size
Date: Mon, 23 Jan 2023 11:55:37 +0000
Message-Id: <20230123115537.167054-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 23 Jan 2023 09:26:24 -0500
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
X-List-Received-Date: Mon, 23 Jan 2023 11:55:55 -0000

Add a config to the cpu state to control the size
of the ASID area in the SATP CSR to enable testing
with smaller than the default (which is currently
maximum for both rv32 and rv64) or 0 to disable
the ASID altogether.

For example, an rv64 with only 8 asid bits:
	-cpu rv64,asid-bits=8

or no asids
	-cpu rv64,asid-bits=0

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
There are still a question of do we update the config
if we use the default, and do we need to have any way
of runtime changing this?
---
 target/riscv/cpu.c      | 33 +++++++++++++++++++++++++++++++++
 target/riscv/cpu.h      |  2 ++
 target/riscv/cpu_bits.h |  6 ++++--
 target/riscv/csr.c      |  5 +++--
 4 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc75ca7667..a752b60251 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -917,6 +917,38 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                                           riscv_pmu_timer_cb, cpu);
         }
      }
+
+    if (cpu->cfg.mmu) {
+        target_ulong asid_mask, asid_shift;
+
+        if (riscv_cpu_mxl(&cpu->env) == MXL_RV32) {
+            asid_mask = SATP32_ASID_MASK;
+            asid_shift = SATP32_ASID_SHIFT;
+        } else {
+            asid_mask = SATP64_ASID_MASK;
+            asid_shift = SATP64_ASID_SHIFT;
+        }
+
+        if (cpu->cfg.asid_bits < 0) {
+            // todo - do we update cpu->cfg.asid_bits here?
+            env->asid_clear = 0x0;
+        } else {
+            target_ulong calc_mask;
+
+            calc_mask = ((target_ulong)1 << cpu->cfg.asid_bits) - 1;
+            calc_mask <<= asid_shift;
+
+            if (calc_mask > asid_mask) {
+                error_setg(errp, "too many ASID bits [-1 %d]",
+                           __builtin_clz(asid_mask >> asid_shift));
+                return;
+            } else {
+                env->asid_clear = calc_mask ^ asid_mask;
+            }
+        }
+        printf("calc_mask = %lx, normal %lx, diff %lx\n",
+               env->asid_clear, asid_mask, asid_mask ^ env->asid_clear);
+    }
 #endif
 
     riscv_cpu_register_gdb_regs_for_features(cs);
@@ -1022,6 +1054,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
+    DEFINE_PROP_INT32("asid-bits", RISCVCPU, cfg.asid_bits, -1),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5609b62a2..a756d5be32 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -215,6 +215,7 @@ struct CPUArchState {
     uint64_t mideleg;
 
     target_ulong satp;   /* since: priv-1.10.0 */
+    target_ulong asid_clear;  /* clear these asid bits in satp */
     target_ulong stval;
     target_ulong medeleg;
 
@@ -475,6 +476,7 @@ struct RISCVCPUConfig {
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
 
+    int32_t asid_bits;
     uint8_t pmu_num;
     char *priv_spec;
     char *user_spec;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8b0d7e20ea..173616aedc 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -612,12 +612,14 @@ typedef enum {
 
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
-#define SATP32_ASID         0x7fc00000
+#define SATP32_ASID_MASK    0x7fc00000
+#define SATP32_ASID_SHIFT   22
 #define SATP32_PPN          0x003fffff
 
 /* RV64 satp CSR field masks */
 #define SATP64_MODE         0xF000000000000000ULL
-#define SATP64_ASID         0x0FFFF00000000000ULL
+#define SATP64_ASID_MASK    0x0FFFF00000000000ULL
+#define SATP64_ASID_SHIFT   44
 #define SATP64_PPN          0x00000FFFFFFFFFFFULL
 
 /* VM modes (satp.mode) privileged ISA 1.10 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0db2c233e5..8313cd3b43 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2654,12 +2654,13 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
+    val &= ~env->asid_clear;
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         vm = validate_vm(env, get_field(val, SATP32_MODE));
-        mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
+        mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID_MASK | SATP32_PPN);
     } else {
         vm = validate_vm(env, get_field(val, SATP64_MODE));
-        mask = (val ^ env->satp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN);
+        mask = (val ^ env->satp) & (SATP64_MODE | SATP64_ASID_MASK | SATP64_PPN);
     }
 
     if (vm && mask) {
-- 
2.39.0


