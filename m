Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlCR3-0001hI-NY
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 10:56:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCQx-0001dS-Rw; Thu, 11 Nov 2021 10:56:15 -0500
Received: from mail142-27.mail.alibaba.com ([198.11.142.27]:62899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCQt-0008Dd-AT; Thu, 11 Nov 2021 10:56:15 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436283|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_alarm|0.0897631-0.00291113-0.907326; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LrIuRAy_1636646161; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrIuRAy_1636646161)
 by smtp.aliyun-inc.com(10.147.44.129);
 Thu, 11 Nov 2021 23:56:02 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v4 08/20] target/riscv: Create current pm fields in env
Date: Thu, 11 Nov 2021 23:51:37 +0800
Message-Id: <20211111155149.58172-9-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.27; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-27.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 15:56:17 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.c        |  1 +
 target/riscv/cpu.h        |  4 ++++
 target/riscv/cpu_helper.c | 43 +++++++++++++++++++++++++++++++++++++++
 target/riscv/csr.c        | 19 +++++++++++++++++
 target/riscv/machine.c    | 10 +++++++++
 5 files changed, 77 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0d2d175fa2..4f01abc989 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -393,6 +393,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     /* mmte is supposed to have pm.current hardwired to 1 */
     env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
+    riscv_cpu_update_mask(env);
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8befff0166..fa5a6ba1c8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -250,6 +250,8 @@ struct CPURISCVState {
     target_ulong upmmask;
     target_ulong upmbase;
 #endif
+    target_ulong cur_pmmask;
+    target_ulong cur_pmbase;
 
     float_status fp_status;
 
@@ -441,6 +443,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags);
 
+void riscv_cpu_update_mask(CPURISCVState *env);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 79aba9c880..8320f56d9f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -133,6 +133,48 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pflags = flags;
 }
 
+void riscv_cpu_update_mask(CPURISCVState *env)
+{
+    target_ulong mask = -1, base = 0;
+    /*
+     * TODO: Current RVJ spec does not specify
+     * how the extension interacts with XLEN.
+     */
+#ifndef CONFIG_USER_ONLY
+    if (riscv_has_ext(env, RVJ)) {
+        switch (env->priv) {
+        case PRV_M:
+            if (env->mmte & M_PM_ENABLE) {
+                mask = env->mpmmask;
+                base = env->mpmbase;
+            }
+            break;
+        case PRV_S:
+            if (env->mmte & S_PM_ENABLE) {
+                mask = env->spmmask;
+                base = env->spmbase;
+            }
+            break;
+        case PRV_U:
+            if (env->mmte & U_PM_ENABLE) {
+                mask = env->upmmask;
+                base = env->upmbase;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+#endif
+    if (cpu_get_xl(env) == MXL_RV32) {
+        env->cur_pmmask = mask & UINT32_MAX;
+        env->cur_pmbase = base & UINT32_MAX;
+    } else {
+        env->cur_pmmask = mask;
+        env->cur_pmbase = base;
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
@@ -331,6 +373,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     }
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
+    riscv_cpu_update_mask(env);
 
     /*
      * Clear the load reservation - otherwise a reservation placed in one
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 74c0b788fd..6bb2d09519 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1496,6 +1496,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
     /* hardwiring pm.instruction bit to 0, since it's not supported yet */
     wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
     env->mmte = wpri_val | PM_EXT_DIRTY;
+    riscv_cpu_update_mask(env);
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -1571,6 +1572,9 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmmask = val;
+    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1596,6 +1600,9 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmmask = val;
+    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1621,6 +1628,9 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmmask = val;
+    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1642,6 +1652,9 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmbase = val;
+    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1667,6 +1680,9 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmbase = val;
+    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1692,6 +1708,9 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmbase = val;
+    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 7b4c739564..19e982d3f0 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -164,10 +164,20 @@ static const VMStateDescription vmstate_hyper = {
     }
 };
 
+static int riscv_cpu_post_load(void *opaque, int version_id)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    riscv_cpu_update_mask(env);
+    return 0;
+}
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
     .minimum_version_id = 3,
+    .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
-- 
2.25.1


