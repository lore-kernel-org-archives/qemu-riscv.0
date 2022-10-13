Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oirkc-0000a6-Hx
	for mharc-qemu-riscv@gnu.org; Thu, 13 Oct 2022 02:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oirkE-0000T2-Rg; Thu, 13 Oct 2022 02:31:05 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:49477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oirkC-0003cj-6g; Thu, 13 Oct 2022 02:31:02 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R221e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VS2Xqz._1665642651; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VS2Xqz._1665642651) by smtp.aliyun-inc.com;
 Thu, 13 Oct 2022 14:30:52 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 sergey.matyukevich@syntacore.com, vladimir.isaev@syntacore.com,
 anatoly.parshintsev@syntacore.com, philipp.tomsich@vrull.eu,
 zhiwei_liu@c-sky.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v1 2/4] target/riscv: Add itrigger support when icount is
 enabled
Date: Thu, 13 Oct 2022 14:29:44 +0800
Message-Id: <20221013062946.7530-3-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 13 Oct 2022 06:31:16 -0000

The max count in itrigger can be 0x3FFF, which will cause a no trivial
translation and execution overload.

When icount is enabled, QEMU provides API that can fetch guest
instruction number. Thus, we can set an timer for itrigger with
the count as deadline.

Only when timer expires or priviledge mode changes, do lazy update
to count.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c |  3 ++
 target/riscv/debug.c      | 59 +++++++++++++++++++++++++++++++++++++++
 target/riscv/debug.h      |  1 +
 4 files changed, 65 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 24bafda27d..13ca0f20ae 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -329,6 +329,8 @@ struct CPUArchState {
     target_ulong tdata3[RV_MAX_TRIGGERS];
     struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
     struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
+    QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
+    int64_t last_icount;
 
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(void *);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 263282f230..7d8089b218 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -676,6 +676,9 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     if (newpriv == PRV_H) {
         newpriv = PRV_U;
     }
+    if (icount_enabled() && newpriv != env->priv) {
+        riscv_itrigger_update_priv(env);
+    }
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
     env->xl = cpu_recompute_xl(env);
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 45a3537d5c..5ff70430a1 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -30,6 +30,7 @@
 #include "trace.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "sysemu/cpu-timers.h"
 
 /*
  * The following M-mode trigger CSRs are implemented:
@@ -569,6 +570,62 @@ void helper_itrigger_match(CPURISCVState *env)
     }
 }
 
+static void riscv_itrigger_update_count(CPURISCVState *env)
+{
+    int count, executed;
+    /*
+     * Record last icount, so that we can evaluate the executed instructions
+     * since last priviledge mode change or timer expire.
+     */
+    int64_t last_icount = env->last_icount, current_icount;
+    current_icount = env->last_icount = icount_get_raw();
+
+    for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
+        if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
+            continue;
+        }
+        count = itrigger_get_count(env, i);
+        if (!count) {
+            continue;
+        }
+        /*
+         * Only when priviledge is changed or itrigger timer expires,
+         * the count field in itrigger tdata1 register is updated.
+         * And the count field in itrigger only contains remaining value.
+         */
+        if (check_itrigger_priv(env, i)) {
+            /*
+             * If itrigger enabled in this priviledge mode, the number of
+             * executed instructions since last priviledge change
+             * should be reduced from current itrigger count.
+             */
+            executed = current_icount - last_icount;
+            itrigger_set_count(env, i, count - executed);
+            if (count == executed) {
+                do_trigger_action(env, i);
+            }
+        } else {
+            /*
+             * If itrigger is not enabled in this priviledge mode,
+             * the number of executed instructions will be discard and
+             * the count field in itrigger will not change.
+             */
+            timer_mod(env->itrigger_timer[i],
+                      current_icount + count);
+        }
+    }
+}
+
+static void riscv_itrigger_timer_cb(void *opaque)
+{
+    riscv_itrigger_update_count((CPURISCVState *)opaque);
+}
+
+void riscv_itrigger_update_priv(CPURISCVState *env)
+{
+    riscv_itrigger_update_count(env);
+}
+
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
     switch (tdata_index) {
@@ -798,5 +855,7 @@ void riscv_trigger_init(CPURISCVState *env)
         env->tdata3[i] = 0;
         env->cpu_breakpoint[i] = NULL;
         env->cpu_watchpoint[i] = NULL;
+        env->itrigger_timer[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                              riscv_itrigger_timer_cb, env);
     }
 }
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index cc3358e69b..c471748d5a 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -146,4 +146,5 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 void riscv_trigger_init(CPURISCVState *env);
 
 bool riscv_itrigger_enabled(CPURISCVState *env);
+void riscv_itrigger_update_priv(CPURISCVState *env);
 #endif /* RISCV_DEBUG_H */
-- 
2.17.1


