Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7yVH-00053b-BN
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 06:42:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7yVF-0004yT-NC; Thu, 13 Jan 2022 06:42:49 -0500
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:59269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1n7yVC-0003KA-Sq; Thu, 13 Jan 2022 06:42:49 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436284|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0449918-0.00112837-0.95388;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.Mb1CocH_1642074162; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mb1CocH_1642074162)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 13 Jan 2022 19:42:42 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 05/22] target/riscv: Create xl field in env
Date: Thu, 13 Jan 2022 19:39:47 +0800
Message-Id: <20220113114004.286796-6-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 13 Jan 2022 11:42:50 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.c        |  1 +
 target/riscv/cpu.h        | 31 +++++++++++++++++++++++++++++++
 target/riscv/cpu_helper.c | 34 ++--------------------------------
 target/riscv/csr.c        |  2 ++
 target/riscv/machine.c    | 10 ++++++++++
 5 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bc25d3055..54c1cf8ec5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -399,6 +399,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     /* mmte is supposed to have pm.current hardwired to 1 */
     env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
+    env->xl = riscv_cpu_mxl(env);
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d63086765..65fd849bef 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -145,6 +145,7 @@ struct CPURISCVState {
     uint32_t misa_mxl_max;  /* max mxl for this cpu */
     uint32_t misa_ext;      /* current extensions */
     uint32_t misa_ext_mask; /* max ext for this cpu */
+    uint32_t xl;            /* current xlen */
 
     /* 128-bit helpers upper part return value */
     target_ulong retxh;
@@ -443,6 +444,36 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 }
 #endif
 
+#if defined(TARGET_RISCV32)
+#define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
+#else
+static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
+{
+    RISCVMXL xl = env->misa_mxl;
+#if !defined(CONFIG_USER_ONLY)
+    /*
+     * When emulating a 32-bit-only cpu, use RV32.
+     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
+     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
+     * back to RV64 for lower privs.
+     */
+    if (xl != MXL_RV32) {
+        switch (env->priv) {
+        case PRV_M:
+            break;
+        case PRV_U:
+            xl = get_field(env->mstatus, MSTATUS64_UXL);
+            break;
+        default: /* PRV_S | PRV_H */
+            xl = get_field(env->mstatus, MSTATUS64_SXL);
+            break;
+        }
+    }
+#endif
+    return xl;
+}
+#endif
+
 /*
  * Encode LMUL to lmul as follows:
  *     LMUL    vlmul    lmul
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 434a83e66a..32ea066ef0 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,37 +35,6 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
-static RISCVMXL cpu_get_xl(CPURISCVState *env)
-{
-#if defined(TARGET_RISCV32)
-    return MXL_RV32;
-#elif defined(CONFIG_USER_ONLY)
-    return MXL_RV64;
-#else
-    RISCVMXL xl = riscv_cpu_mxl(env);
-
-    /*
-     * When emulating a 32-bit-only cpu, use RV32.
-     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
-     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
-     * back to RV64 for lower privs.
-     */
-    if (xl != MXL_RV32) {
-        switch (env->priv) {
-        case PRV_M:
-            break;
-        case PRV_U:
-            xl = get_field(env->mstatus, MSTATUS64_UXL);
-            break;
-        default: /* PRV_S | PRV_H */
-            xl = get_field(env->mstatus, MSTATUS64_SXL);
-            break;
-        }
-    }
-    return xl;
-#endif
-}
-
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -145,7 +114,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 #endif
 
-    flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
+    flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
 
     *pflags = flags;
 }
@@ -361,6 +330,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     }
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
+    env->xl = cpu_recompute_xl(env);
 
     /*
      * Clear the load reservation - otherwise a reservation placed in one
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e7578f3e0f..b282a642f5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -585,6 +585,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         mstatus = set_field(mstatus, MSTATUS64_UXL, xl);
     }
     env->mstatus = mstatus;
+    env->xl = cpu_recompute_xl(env);
 
     return RISCV_EXCP_NONE;
 }
@@ -700,6 +701,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     /* flush translation cache */
     tb_flush(env_cpu(env));
     env->misa_ext = val;
+    env->xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 13b9ab375b..e1d1029e88 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -185,10 +185,20 @@ static const VMStateDescription vmstate_rv128 = {
     }
 };
 
+static int riscv_cpu_post_load(void *opaque, int version_id)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    env->xl = cpu_recompute_xl(env);
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


