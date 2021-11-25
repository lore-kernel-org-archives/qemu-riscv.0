Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mq9Om-0002gi-KS
	for mharc-qemu-riscv@gnu.org; Thu, 25 Nov 2021 02:42:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9OY-0002eU-78; Thu, 25 Nov 2021 02:42:15 -0500
Received: from out28-169.mail.aliyun.com ([115.124.28.169]:49541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9OV-0001Hj-CP; Thu, 25 Nov 2021 02:42:13 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436731|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0150952-0.000473662-0.984431;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lz-2.4X_1637826124; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lz-2.4X_1637826124)
 by smtp.aliyun-inc.com(10.147.44.118);
 Thu, 25 Nov 2021 15:42:05 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v5 04/22] target/riscv: Create xl field in env
Date: Thu, 25 Nov 2021 15:39:33 +0800
Message-Id: <20211125073951.57678-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.169; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-169.mail.aliyun.com
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
X-List-Received-Date: Thu, 25 Nov 2021 07:42:22 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.c        | 1 +
 target/riscv/cpu.h        | 3 +++
 target/riscv/cpu_helper.c | 3 ++-
 target/riscv/csr.c        | 2 ++
 target/riscv/machine.c    | 5 +++--
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..5c757ce33a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -377,6 +377,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     /* mmte is supposed to have pm.current hardwired to 1 */
     env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
+    env->xl = riscv_cpu_mxl(env);
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..412339dbad 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -138,6 +138,7 @@ struct CPURISCVState {
     uint32_t misa_mxl_max;  /* max mxl for this cpu */
     uint32_t misa_ext;      /* current extensions */
     uint32_t misa_ext_mask; /* max ext for this cpu */
+    uint32_t xl;            /* current xlen */
 
     uint32_t features;
 
@@ -420,6 +421,8 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 }
 #endif
 
+RISCVMXL cpu_get_xl(CPURISCVState *env);
+
 /*
  * A simplification for VLMAX
  * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9eeed38c7e..b6cddf8648 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,7 +35,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
-static RISCVMXL cpu_get_xl(CPURISCVState *env)
+RISCVMXL cpu_get_xl(CPURISCVState *env)
 {
 #if defined(TARGET_RISCV32)
     return MXL_RV32;
@@ -330,6 +330,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     }
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
+    env->xl = cpu_get_xl(env);
 
     /*
      * Clear the load reservation - otherwise a reservation placed in one
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ce20c3a970..d4ee897be2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -553,6 +553,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
     }
     env->mstatus = mstatus;
+    env->xl = cpu_get_xl(env);
 
     return RISCV_EXCP_NONE;
 }
@@ -654,6 +655,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     /* flush translation cache */
     tb_flush(env_cpu(env));
     env->misa_ext = val;
+    env->xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ad8248ebfd..08ed603626 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -166,8 +166,8 @@ static const VMStateDescription vmstate_pointermasking = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 3,
-    .minimum_version_id = 3,
+    .version_id = 4,
+    .minimum_version_id = 4,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
@@ -183,6 +183,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT32(env.misa_ext, RISCVCPU),
         VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
         VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
+        VMSTATE_UINT32(env.xl, RISCVCPU),
         VMSTATE_UINT32(env.features, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
         VMSTATE_UINTTL(env.virt, RISCVCPU),
-- 
2.25.1


