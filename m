Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNFuw-00006V-VR
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 10:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lNFuv-00005D-HM; Fri, 19 Mar 2021 10:15:57 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:47627
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lNFut-0007Cm-AW; Fri, 19 Mar 2021 10:15:57 -0400
Received: from [89.16.135.166] (helo=broc.lan)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1lNFuo-0001S2-K4; Fri, 19 Mar 2021 15:15:50 +0100
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Subject: [PATCH v2] target/riscv: Add proper two-stage lookup exception
 detection
Date: Fri, 19 Mar 2021 15:14:59 +0100
Message-Id: <20210319141459.1196741-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=georg.kotheimer@kernkonzept.com; helo=mx.kernkonzept.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 19 Mar 2021 14:15:58 -0000

The current two-stage lookup detection in riscv_cpu_do_interrupt falls
short of its purpose, as all it checks is whether two-stage address
translation either via the hypervisor-load store instructions or the
MPRV feature would be allowed.

What we really need instead is whether two-stage address translation was
active when the exception was raised. However, in riscv_cpu_do_interrupt
we do not have the information to reliably detect this. Therefore, when
we raise a memory fault exception we have to record whether two-stage
address translation is active.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
Unfortunately, I tested the previous version of the patch only against
the RISC-V softmmu target, not against the linux-user target.
I modified the patch, so that the two_stage_lookup is neither present
nor updated for the linux-user target.

 target/riscv/cpu.c        |  1 +
 target/riscv/cpu.h        |  4 ++++
 target/riscv/cpu_helper.c | 21 ++++++++-------------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddea8fbeeb..e8c4455525 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -356,6 +356,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
     env->mcause = 0;
     env->pc = env->resetvec;
+    env->two_stage_lookup = false;
 #endif
     cs->exception_index = EXCP_NONE;
     env->load_res = -1;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0edb2826a2..0a33d387ba 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -213,6 +213,10 @@ struct CPURISCVState {
     target_ulong satp_hs;
     uint64_t mstatus_hs;
 
+    /* Signals whether the current exception occurred with two-stage address
+       translation active. */
+    bool two_stage_lookup;
+
     target_ulong scounteren;
     target_ulong mcounteren;
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2f43939fb6..af00728829 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -605,6 +605,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
         g_assert_not_reached();
     }
     env->badaddr = address;
+    env->two_stage_lookup = two_stage;
 }
 
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
@@ -646,6 +647,8 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 
     env->badaddr = addr;
+    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
+                            riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
 }
 
@@ -669,6 +672,8 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
+    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
+                            riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(env, cs->exception_index, retaddr);
 }
 #endif /* !CONFIG_USER_ONLY */
@@ -910,16 +915,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
             target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
-            bool two_stage_lookup = false;
 
-            if (env->priv == PRV_M ||
-                (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
-                (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
-                    get_field(env->hstatus, HSTATUS_HU))) {
-                    two_stage_lookup = true;
-            }
-
-            if ((riscv_cpu_virt_enabled(env) || two_stage_lookup) && write_tval) {
+            if (env->two_stage_lookup && write_tval) {
                 /*
                  * If we are writing a guest virtual address to stval, set
                  * this to 1. If we are trapping to VS we will set this to 0
@@ -957,10 +954,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 riscv_cpu_set_force_hs_excep(env, 0);
             } else {
                 /* Trap into HS mode */
-                if (!two_stage_lookup) {
-                    env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
-                                             riscv_cpu_virt_enabled(env));
-                }
+                env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
                 htval = env->guest_phys_fault_addr;
             }
         }
@@ -1016,6 +1010,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      * RISC-V ISA Specification.
      */
 
+    env->two_stage_lookup = false;
 #endif
     cs->exception_index = EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.31.0


