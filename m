Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUltk-0002UU-FX
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 03:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlth-0002M9-Ja; Fri, 09 Apr 2021 03:49:45 -0400
Received: from mail142-23.mail.alibaba.com ([198.11.142.23]:30036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUltb-0003iu-0J; Fri, 09 Apr 2021 03:49:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.35297-0.00215807-0.644872;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:26 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 10/11] target/riscv: Update interrupt handling in CLIC mode
Date: Fri,  9 Apr 2021 15:48:56 +0800
Message-Id: <20210409074857.166082-11-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.23; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-23.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Apr 2021 07:49:46 -0000

Decode CLIC interrupt information from exccode, includes interrupt
priviledge mode, interrupt level, and irq number.

Then update CSRs xcause, xstatus, xepc, xintstatus and jump to
correct PC according to the CLIC specification.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_bits.h   |   1 +
 target/riscv/cpu_helper.c | 117 +++++++++++++++++++++++++++++++++++---
 2 files changed, 111 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 494e41edc9..d8378d2384 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -557,6 +557,7 @@
 #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
 #define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
 
+#define RISCV_EXCP_INT_CLIC                0x40000000
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..998d1a2742 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -26,6 +26,10 @@
 #include "trace.h"
 #include "semihosting/common-semi.h"
 
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/intc/riscv_clic.h"
+#endif
+
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
 #ifdef CONFIG_USER_ONLY
@@ -36,6 +40,20 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 }
 
 #ifndef CONFIG_USER_ONLY
+static int riscv_cpu_local_irq_mode_enabled(CPURISCVState *env, int mode)
+{
+    switch (mode) {
+    case PRV_M:
+        return env->priv < PRV_M ||
+               (env->priv == PRV_M && get_field(env->mstatus, MSTATUS_MIE));
+    case PRV_S:
+        return env->priv < PRV_S ||
+               (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_SIE));
+    default:
+        return false;
+    }
+}
+
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
     target_ulong irqs;
@@ -90,6 +108,18 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             return true;
         }
     }
+    if (interrupt_request & CPU_INTERRUPT_CLIC) {
+        RISCVCPU *cpu = RISCV_CPU(cs);
+        CPURISCVState *env = &cpu->env;
+        int mode = (env->exccode >> 12) & 0b11;
+        int enabled = riscv_cpu_local_irq_mode_enabled(env, mode);
+        if (enabled) {
+            cs->exception_index = RISCV_EXCP_INT_CLIC | env->exccode;
+            cs->interrupt_request = cs->interrupt_request & ~CPU_INTERRUPT_CLIC;
+            riscv_cpu_do_interrupt(cs);
+            return true;
+        }
+    }
 #endif
     return false;
 }
@@ -884,6 +914,55 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 #endif
 }
 
+
+#if !defined(CONFIG_USER_ONLY)
+static target_ulong riscv_intr_pc(CPURISCVState *env, target_ulong tvec,
+                                  target_ulong tvt, bool async, bool clic,
+                                  int cause, int mode)
+{
+    int mode1 = tvec & 0b11, mode2 = tvec & 0b111111;
+    CPUState *cs = env_cpu(env);
+
+    if (!(async || clic)) {
+        return tvec & ~0b11;
+    }
+    /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >= reserved */
+    switch (mode1) {
+    case 0b00:
+        return tvec & ~0b11;
+    case 0b01:
+        return (tvec & ~0b11) + cause * 4;
+    default:
+        if (env->clic && (mode2 == 0b000011)) {
+            /* Non-vectored, clicintattr[i].shv = 0 || cliccfg.nvbits = 0 */
+            if (!riscv_clic_shv_interrupt(env->clic, mode, cs->cpu_index,
+                                          cause)) {
+                /* NBASE = mtvec[XLEN-1:6]<<6 */
+                return tvec & ~0b111111;
+            } else {
+                /*
+                 * pc := M[TBASE + XLEN/8 * exccode)] & ~1,
+                 * TBASE = mtvt[XLEN-1:6]<<6
+                 */
+                int size = TARGET_LONG_BITS / 8;
+                target_ulong tbase = (tvt & ~0b111111) + size * cause;
+                void *host = tlb_vaddr_to_host(env, tbase, MMU_DATA_LOAD, mode);
+                if (host != NULL) {
+                    target_ulong new_pc = ldn_p(host, size);
+                    if (tlb_vaddr_to_host(env, new_pc, MMU_INST_FETCH, mode)) {
+                        return new_pc;
+                    }
+                }
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "CLIC: load trap handler error!\n");
+                exit(1);
+            }
+        }
+        g_assert_not_reached();
+    }
+}
+#endif
+
 /*
  * Handle Traps
  *
@@ -898,11 +977,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     CPURISCVState *env = &cpu->env;
     bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
     uint64_t s;
+    int mode, level;
 
     /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
      * so we mask off the MSB and separate into trap type and cause.
      */
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
+    bool clic = !!(cs->exception_index & RISCV_EXCP_INT_CLIC);
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
     target_ulong deleg = async ? env->mideleg : env->medeleg;
     bool write_tval = false;
@@ -958,6 +1039,28 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
     }
 
+    if (clic) {
+        mode = (cause >> 12) & 3;
+        level = (cause >> 14) & 0xff;
+        cause &= 0xfff;
+        cause |= get_field(env->mstatus, MSTATUS_MPP) << 28;
+        switch (mode) {
+        case PRV_M:
+            cause |= get_field(env->mintstatus, MINTSTATUS_MIL) << 16;
+            cause |= get_field(env->mstatus, MSTATUS_MIE) << 27;
+            env->mintstatus = set_field(env->mintstatus, MINTSTATUS_MIL, level);
+            break;
+        case PRV_S:
+            cause |= get_field(env->mintstatus, MINTSTATUS_SIL) << 16;
+            cause |= get_field(env->mstatus, MSTATUS_SPIE) << 27;
+            env->mintstatus = set_field(env->mintstatus, MINTSTATUS_SIL, level);
+            break;
+        }
+    } else {
+        mode = env->priv <= PRV_S &&
+            cause < TARGET_LONG_BITS && ((deleg >> cause) & 1) ? PRV_S : PRV_M;
+    }
+
     trace_riscv_trap(env->mhartid, async, cause, env->pc, tval,
                      riscv_cpu_get_trap_name(cause, async));
 
@@ -967,8 +1070,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                   __func__, env->mhartid, async, cause, env->pc, tval,
                   riscv_cpu_get_trap_name(cause, async));
 
-    if (env->priv <= PRV_S &&
-            cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
+    if (mode == PRV_S) {
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
             target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
@@ -1021,12 +1123,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         s = set_field(s, MSTATUS_SPP, env->priv);
         s = set_field(s, MSTATUS_SIE, 0);
         env->mstatus = s;
-        env->scause = cause | ((target_ulong)async << (TARGET_LONG_BITS - 1));
+        env->scause = cause | ((target_ulong)(async | clic) <<
+                               (TARGET_LONG_BITS - 1));
         env->sepc = env->pc;
         env->sbadaddr = tval;
         env->htval = htval;
-        env->pc = (env->stvec >> 2 << 2) +
-            ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
+        env->pc = riscv_intr_pc(env, env->stvec, env->stvt, async,
+                                clic & 0xfff, cause, PRV_S);
         riscv_cpu_set_mode(env, PRV_S);
     } else {
         /* handle the trap in M-mode */
@@ -1056,8 +1159,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mepc = env->pc;
         env->mbadaddr = tval;
         env->mtval2 = mtval2;
-        env->pc = (env->mtvec >> 2 << 2) +
-            ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
+        env->pc = riscv_intr_pc(env, env->mtvec, env->mtvt, async,
+                                clic, cause & 0xfff, PRV_M);
         riscv_cpu_set_mode(env, PRV_M);
     }
 
-- 
2.25.1


