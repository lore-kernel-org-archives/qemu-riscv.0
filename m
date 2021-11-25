Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mq9Rc-0004M9-GX
	for mharc-qemu-riscv@gnu.org; Thu, 25 Nov 2021 02:45:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9Ra-0004JO-OR; Thu, 25 Nov 2021 02:45:22 -0500
Received: from out28-5.mail.aliyun.com ([115.124.28.5]:33075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9RX-0002DJ-Sw; Thu, 25 Nov 2021 02:45:22 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.087123-0.00284615-0.910031;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.LyzDZqT_1637826314; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LyzDZqT_1637826314)
 by smtp.aliyun-inc.com(10.147.41.158);
 Thu, 25 Nov 2021 15:45:15 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 10/22] target/riscv: Create current pm fields in env
Date: Thu, 25 Nov 2021 15:39:39 +0800
Message-Id: <20211125073951.57678-11-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.5; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-5.mail.aliyun.com
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
X-List-Received-Date: Thu, 25 Nov 2021 07:45:23 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        |  1 +
 target/riscv/cpu.h        |  4 ++++
 target/riscv/cpu_helper.c | 43 +++++++++++++++++++++++++++++++++++++++
 target/riscv/csr.c        | 19 +++++++++++++++++
 target/riscv/machine.c    | 10 +++++++++
 5 files changed, 77 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b6ca3fb883..61ef88752c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -394,6 +394,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     env->xl = riscv_cpu_mxl(env);
+    riscv_cpu_update_mask(env);
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 412339dbad..28006b782f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -251,6 +251,8 @@ struct CPURISCVState {
     target_ulong upmmask;
     target_ulong upmbase;
 #endif
+    target_ulong cur_pmmask;
+    target_ulong cur_pmbase;
 
     float_status fp_status;
 
@@ -442,6 +444,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags);
 
+void riscv_cpu_update_mask(CPURISCVState *env);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9c3838bddf..d74199b49b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -132,6 +132,48 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
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
     env->xl = cpu_get_xl(env);
+    riscv_cpu_update_mask(env);
 
     /*
      * Clear the load reservation - otherwise a reservation placed in one
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bfafd3bd96..68da5d2173 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1516,6 +1516,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
     /* hardwiring pm.instruction bit to 0, since it's not supported yet */
     wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
     env->mmte = wpri_val | PM_EXT_DIRTY;
+    riscv_cpu_update_mask(env);
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -1591,6 +1592,9 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmmask = val;
+    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1616,6 +1620,9 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmmask = val;
+    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1641,6 +1648,9 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmmask = val;
+    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->cur_pmmask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1662,6 +1672,9 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmbase = val;
+    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1687,6 +1700,9 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmbase = val;
+    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1712,6 +1728,9 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmbase = val;
+    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->cur_pmbase = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 08ed603626..10a0f34f37 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -164,10 +164,20 @@ static const VMStateDescription vmstate_pointermasking = {
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
     .version_id = 4,
     .minimum_version_id = 4,
+    .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
-- 
2.25.1


