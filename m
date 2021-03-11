Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKIZa-0006Xg-IS
	for mharc-qemu-riscv@gnu.org; Thu, 11 Mar 2021 05:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lKIZZ-0006VE-BN; Thu, 11 Mar 2021 05:29:41 -0500
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:48619
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lKIZX-0003P0-Hu; Thu, 11 Mar 2021 05:29:41 -0500
Received: from [86.56.46.35] (helo=broc.lan)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1lKIZU-0005uH-CU; Thu, 11 Mar 2021 11:29:36 +0100
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Subject: [PATCH] target/riscv: Add proper two-stage lookup exception detection
Date: Thu, 11 Mar 2021 11:29:24 +0100
Message-Id: <20210311102924.1400371-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=georg.kotheimer@kernkonzept.com; helo=mx.kernkonzept.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.02,
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
X-List-Received-Date: Thu, 11 Mar 2021 10:29:41 -0000

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
 target/riscv/cpu.c        |  1 +
 target/riscv/cpu.h        |  3 +++
 target/riscv/cpu_helper.c | 21 ++++++++-------------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddea8fbeeb..865caddb06 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -358,6 +358,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->pc = env->resetvec;
 #endif
     cs->exception_index = EXCP_NONE;
+    env->two_stage_lookup = false;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
 }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0edb2826a2..1288ff5981 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -131,6 +131,9 @@ struct CPURISCVState {
 
     target_ulong badaddr;
     target_ulong guest_phys_fault_addr;
+    /* Signals whether the current exception occurred with two-stage address
+       translation active. */
+    bool two_stage_lookup;
 
     target_ulong priv_ver;
     target_ulong vext_ver;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2f43939fb6..2de870d3a3 100644
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
@@ -1018,4 +1012,5 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
 #endif
     cs->exception_index = EXCP_NONE; /* mark handled to qemu */
+    env->two_stage_lookup = false;
 }
-- 
2.30.1


