Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o7dOI-00010I-V9
	for mharc-qemu-riscv@gnu.org; Sat, 02 Jul 2022 09:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o7dOH-0000yU-3J; Sat, 02 Jul 2022 09:42:29 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:37248 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o7dOE-0006UE-Am; Sat, 02 Jul 2022 09:42:28 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAB3fw8zS8Bi19w0Cw--.61050S2;
 Sat, 02 Jul 2022 21:42:13 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH] target/riscv: fix csr check for cycle{h}, instret{h}, time{h},
 hpmcounter3~31{h}
Date: Sat,  2 Jul 2022 21:41:49 +0800
Message-Id: <20220702134149.14384-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAB3fw8zS8Bi19w0Cw--.61050S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWryUWFW3XFyfXw1rJF4kXrb_yoW5uw1kp3
 W3tay3KrWkZr9rCa9rJ3WUGr18Zr97Way5G3yrG3W0kw45XFs8Wa4Dur4Utas5tr98twsF
 gr1UWa93ZF4UWa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUym14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
 v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
 14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 02 Jul 2022 13:42:29 -0000

- improve the field extract progress
- add stand-alone check for mcuonteren when in less-privileged mode
- add check for scounteren when 'S' is enabled and current priv is PRV_U

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/csr.c | 76 ++++++++++++++--------------------------------
 1 file changed, 22 insertions(+), 54 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6dbe9b541f..a4719cbf35 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -72,66 +72,34 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
+    uint32_t field = 0;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    if (riscv_cpu_virt_enabled(env)) {
-        switch (csrno) {
-        case CSR_CYCLE:
-            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
-                get_field(env->mcounteren, COUNTEREN_CY)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_TIME:
-            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
-                get_field(env->mcounteren, COUNTEREN_TM)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_INSTRET:
-            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
-                get_field(env->mcounteren, COUNTEREN_IR)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        }
-        if (riscv_cpu_mxl(env) == MXL_RV32) {
-            switch (csrno) {
-            case CSR_CYCLEH:
-                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
-                    get_field(env->mcounteren, COUNTEREN_CY)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_TIMEH:
-                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
-                    get_field(env->mcounteren, COUNTEREN_TM)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_INSTRETH:
-                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
-                    get_field(env->mcounteren, COUNTEREN_IR)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            }
+    if (csrno <= CSR_HPMCOUNTER31 && csrno >= CSR_CYCLE) {
+        field = 1 << (csrno - CSR_CYCLE);
+    } else if (riscv_cpu_mxl(env) == MXL_RV32 && csrno <= CSR_HPMCOUNTER31H &&
+               csrno >= CSR_CYCLEH) {
+        field = 1 << (csrno - CSR_CYCLEH);
+    }
+
+    if (env->priv < PRV_M && !get_field(env->mcounteren, field)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (riscv_cpu_virt_enabled(env) && !get_field(env->hcounteren, field)) {
+        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+    }
+
+    if (riscv_has_ext(env, RVS) && env->priv == PRV_U &&
+        !get_field(env->scounteren, field)) {
+        if (riscv_cpu_virt_enabled(env)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        } else {
+            return RISCV_EXCP_ILLEGAL_INST;
         }
     }
 #endif
-- 
2.17.1


