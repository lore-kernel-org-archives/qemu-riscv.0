Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7yYH-0000Os-1h
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 06:45:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7yYE-0000LD-C5; Thu, 13 Jan 2022 06:45:54 -0500
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:53787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7yYB-0003iz-Um; Thu, 13 Jan 2022 06:45:54 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436283|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0681822-0.00384799-0.92797;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.Mb1FThk_1642074345; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mb1FThk_1642074345)
 by smtp.aliyun-inc.com(10.147.44.129);
 Thu, 13 Jan 2022 19:45:45 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 11/22] target/riscv: Create current pm fields in env
Date: Thu, 13 Jan 2022 19:39:53 +0800
Message-Id: <20220113114004.286796-12-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.194; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-194.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 13 Jan 2022 11:45:55 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c        |  1 +
 target/riscv/cpu.h        |  4 ++++
 target/riscv/cpu_helper.c | 43 +++++++++++++++++++++++++++++++++++++++
 target/riscv/csr.c        | 19 +++++++++++++++++
 target/riscv/machine.c    |  1 +
 5 files changed, 68 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a21287253a..a4b9ab0d9c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -416,6 +416,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     env->xl = riscv_cpu_mxl(env);
+    riscv_cpu_update_mask(env);
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 65fd849bef..adb455cf09 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -265,6 +265,8 @@ struct CPURISCVState {
     target_ulong upmmask;
     target_ulong upmbase;
 #endif
+    target_ulong cur_pmmask;
+    target_ulong cur_pmbase;
 
     float_status fp_status;
 
@@ -502,6 +504,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags);
 
+void riscv_cpu_update_mask(CPURISCVState *env);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2c83eb1f05..e6c95edb18 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -119,6 +119,48 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
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
+    if (env->xl == MXL_RV32) {
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
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
     env->xl = cpu_recompute_xl(env);
+    riscv_cpu_update_mask(env);
 
     /*
      * Clear the load reservation - otherwise a reservation placed in one
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3f3afbed21..6e4b8cd56d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1603,6 +1603,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
     /* hardwiring pm.instruction bit to 0, since it's not supported yet */
     wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
     env->mmte = wpri_val | PM_EXT_DIRTY;
+    riscv_cpu_update_mask(env);
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -1678,6 +1679,9 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmmask = val;
+    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1703,6 +1707,9 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmmask = val;
+    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1728,6 +1735,9 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmmask = val;
+    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1749,6 +1759,9 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmbase = val;
+    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1774,6 +1787,9 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmbase = val;
+    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1799,6 +1815,9 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmbase = val;
+    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index e1d1029e88..58dd7c2fad 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -191,6 +191,7 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
     CPURISCVState *env = &cpu->env;
 
     env->xl = cpu_recompute_xl(env);
+    riscv_cpu_update_mask(env);
     return 0;
 }
 
-- 
2.25.1


