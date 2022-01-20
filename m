Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAWYH-0007xe-Gl
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 07:28:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWYF-0007qJ-9x; Thu, 20 Jan 2022 07:28:27 -0500
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:32823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWYB-0000Bs-MT; Thu, 20 Jan 2022 07:28:26 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436283|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0680127-0.00242263-0.929565;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfwHrrd_1642681656; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfwHrrd_1642681656)
 by smtp.aliyun-inc.com(10.147.40.233);
 Thu, 20 Jan 2022 20:27:36 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 11/23] target/riscv: Create current pm fields in env
Date: Thu, 20 Jan 2022 20:20:38 +0800
Message-Id: <20220120122050.41546-12-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
References: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.123; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-123.mail.aliyun.com
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
X-List-Received-Date: Thu, 20 Jan 2022 12:28:27 -0000

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
index 690c879901..a120d474df 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -430,6 +430,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     env->xl = riscv_cpu_mxl(env);
+    riscv_cpu_update_mask(env);
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7657e22a56..6fe842edfd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -266,6 +266,8 @@ struct CPURISCVState {
     target_ulong upmmask;
     target_ulong upmbase;
 #endif
+    target_ulong cur_pmmask;
+    target_ulong cur_pmbase;
 
     float_status fp_status;
 
@@ -515,6 +517,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags);
 
+void riscv_cpu_update_mask(CPURISCVState *env);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d73925a823..b239d721f4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -122,6 +122,48 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
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
@@ -334,6 +376,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
     env->xl = cpu_recompute_xl(env);
+    riscv_cpu_update_mask(env);
 
     /*
      * Clear the load reservation - otherwise a reservation placed in one
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c00a82022e..292f7e1624 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1607,6 +1607,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
     /* hardwiring pm.instruction bit to 0, since it's not supported yet */
     wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
     env->mmte = wpri_val | PM_EXT_DIRTY;
+    riscv_cpu_update_mask(env);
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -1682,6 +1683,9 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmmask = val;
+    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1707,6 +1711,9 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmmask = val;
+    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1732,6 +1739,9 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmmask = val;
+    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1753,6 +1763,9 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmbase = val;
+    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1778,6 +1791,9 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmbase = val;
+    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1803,6 +1819,9 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmbase = val;
+    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index b76e4db99c..a4b7859c2a 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -220,6 +220,7 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
     CPURISCVState *env = &cpu->env;
 
     env->xl = cpu_recompute_xl(env);
+    riscv_cpu_update_mask(env);
     return 0;
 }
 
-- 
2.25.1


