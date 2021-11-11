Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlCOy-0005yC-Oc
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 10:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCOt-0005up-5Q; Thu, 11 Nov 2021 10:54:07 -0500
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:46914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCOq-0007uA-4s; Thu, 11 Nov 2021 10:54:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07464757|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.081855-0.000518238-0.917627;
 FP=12843677974803809611|2|2|6|0|-1|-1|-1; HT=ay29a033018047211;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LrJ31DW_1636646037; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrJ31DW_1636646037)
 by smtp.aliyun-inc.com(10.147.41.158);
 Thu, 11 Nov 2021 23:53:59 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v4 04/20] target/riscv: Extend pc for runtime pc write
Date: Thu, 11 Nov 2021 23:51:33 +0800
Message-Id: <20211111155149.58172-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.148; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-148.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 15:54:09 -0000

In some cases, we must restore the guest PC to the address of the start of
the TB, such as when the instruction counter hits zero. So extend pc register
according to current xlen for these cases.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c        | 22 +++++++++++++++++++---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c |  2 +-
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..0d2d175fa2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -319,7 +319,12 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    env->pc = value;
+
+    if (cpu_get_xl(env) == MXL_RV32) {
+        env->pc = (int32_t)value;
+    } else {
+        env->pc = value;
+    }
 }
 
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
@@ -327,7 +332,13 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    env->pc = tb->pc;
+    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+
+    if (xl == MXL_RV32) {
+        env->pc = (int32_t)tb->pc;
+    } else {
+        env->pc = tb->pc;
+    }
 }
 
 static bool riscv_cpu_has_work(CPUState *cs)
@@ -348,7 +359,12 @@ static bool riscv_cpu_has_work(CPUState *cs)
 void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
-    env->pc = data[0];
+    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+    if (xl == MXL_RV32) {
+        env->pc = (int32_t)data[0];
+    } else {
+        env->pc = data[0];
+    }
 }
 
 static void riscv_cpu_reset(DeviceState *dev)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..8befff0166 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -420,6 +420,8 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 }
 #endif
 
+RISCVMXL cpu_get_xl(CPURISCVState *env);
+
 /*
  * A simplification for VLMAX
  * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4c048cc266..79aba9c880 100644
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
-- 
2.25.1


