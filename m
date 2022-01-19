Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA3QI-0001a1-Ej
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 00:22:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3QB-0001TD-NG; Wed, 19 Jan 2022 00:22:11 -0500
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3Q9-0001Uk-B8; Wed, 19 Jan 2022 00:22:11 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07922138|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.35604-0.000583857-0.643376;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfCgb6._1642569724; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfCgb6._1642569724)
 by smtp.aliyun-inc.com(10.147.41.199);
 Wed, 19 Jan 2022 13:22:04 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 07/22] target/riscv: Extend pc for runtime pc write
Date: Wed, 19 Jan 2022 13:18:09 +0800
Message-Id: <20220119051824.17494-8-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.195; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-195.mail.aliyun.com
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
X-List-Received-Date: Wed, 19 Jan 2022 05:22:12 -0000

In some cases, we must restore the guest PC to the address of the start of
the TB, such as when the instruction counter hits zero. So extend pc register
according to current xlen for these cases.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 736cf1d4e7..eac5f7bf03 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -355,7 +355,12 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    env->pc = value;
+
+    if (env->xl == MXL_RV32) {
+        env->pc = (int32_t)value;
+    } else {
+        env->pc = value;
+    }
 }
 
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
@@ -363,7 +368,13 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
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
@@ -384,7 +395,12 @@ static bool riscv_cpu_has_work(CPUState *cs)
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
-- 
2.25.1


