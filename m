Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2wTJ-0000Oi-Ge
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 09:32:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n2wTE-0000Gm-SJ; Thu, 30 Dec 2021 09:31:56 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:55296 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n2wTA-0004Ar-Nl; Thu, 30 Dec 2021 09:31:56 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADHzFjJws1h4_TqBA--.24839S7;
 Thu, 30 Dec 2021 22:31:42 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, liweiwei <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 5/7] target/riscv: rvk: add CSR support for Zkr
Date: Thu, 30 Dec 2021 22:30:56 +0800
Message-Id: <20211230143058.7352-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
References: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowADHzFjJws1h4_TqBA--.24839S7
X-Coremail-Antispam: 1UD129KBjvJXoWxAF48uF4UZrW8ur4kKFykXwb_yoWrKw18pr
 4kCay5GrWFvFZ2yw1ftF15WF13G34rGay7J397W3yDJF13J3yrJrnxW39IqFn5Xas5CrW2
 9F4qkFnY9r47ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQSdkU
 UUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 14:31:57 -0000

   - add SEED CSR
   - add USEED, SSEED fields for MSECCFG CSR

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_bits.h |  9 +++++
 target/riscv/csr.c      | 73 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/pmp.h      |  8 +++--
 3 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 1e31f4d35f..cf4a59dda0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -374,6 +374,9 @@
 #define CSR_VSPMMASK        0x2c1
 #define CSR_VSPMBASE        0x2c2
 
+/* Crypto Extension */
+#define CSR_SEED           0x015
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -625,4 +628,10 @@ typedef enum RISCVException {
 #define UMTE_U_PM_INSN      U_PM_INSN
 #define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
 
+/* seed CSR bits */
+#define SEED_OPST                        (0b11 << 30)
+#define SEED_OPST_BIST                   (0b00 << 30)
+#define SEED_OPST_WAIT                   (0b01 << 30)
+#define SEED_OPST_ES16                   (0b10 << 30)
+#define SEED_OPST_DEAD                   (0b11 << 30)
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 146447eac5..44f8afe616 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -22,6 +22,8 @@
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "qemu/guest-random.h"
+#include "qapi/error.h"
 
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
@@ -222,6 +224,37 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 }
 #endif
 
+/* Predicates */
+static RISCVException seed(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    if (!cpu->cfg.ext_zkr)
+        return RISCV_EXCP_ILLEGAL_INST;
+#if !defined(CONFIG_USER_ONLY)
+    if (riscv_has_ext(env, RVS) && riscv_has_ext(env, RVH)) {
+        /* Hypervisor extension is supported */
+        if (riscv_cpu_virt_enabled(env) && (env->priv != PRV_M)) {
+            if (env->mseccfg & MSECCFG_SSEED) {
+                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+            } else {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+        }
+    }
+    if (env->priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    } else if (env->priv == PRV_S && (env->mseccfg & MSECCFG_SSEED)) {
+        return RISCV_EXCP_NONE;
+    } else if (env->priv == PRV_U && (env->mseccfg & MSECCFG_USEED)) {
+        return RISCV_EXCP_NONE;
+    } else {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+#else
+    return RISCV_EXCP_NONE;
+#endif
+}
+
 /* User Floating-Point CSRs */
 static RISCVException read_fflags(CPURISCVState *env, int csrno,
                                   target_ulong *val)
@@ -1728,6 +1761,39 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
 
 #endif
 
+/* Crypto Extension */
+static int read_seed(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = 0;
+    uint32_t return_status =  SEED_OPST_ES16;
+    *val = (*val) | return_status;
+    if (return_status == SEED_OPST_ES16) {
+        uint16_t random_number;
+        Error *err = NULL;
+        if (qemu_guest_getrandom(&random_number, sizeof(random_number),
+                                 &err) < 0) {
+            qemu_log_mask(LOG_UNIMP, "Seed: Crypto failure: %s",
+                          error_get_pretty(err));
+            error_free(err);
+            return -1;
+        }
+        *val = (*val) | random_number;
+    } else if (return_status == SEED_OPST_BIST) {
+        /* Do nothing */
+    } else if (return_status == SEED_OPST_WAIT) {
+        /* Do nothing */
+    } else if (return_status == SEED_OPST_DEAD) {
+        /* Do nothing */
+    }
+    return 0;
+}
+
+static RISCVException write_seed(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * riscv_csrrw - read and/or update control and status register
  *
@@ -1769,6 +1835,10 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (!write_mask && (csrno == CSR_SEED)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
     /* ensure the CSR extension is enabled. */
     if (!cpu->cfg.ext_icsr) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -1864,6 +1934,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_TIME]  = { "time",  ctr,   read_time  },
     [CSR_TIMEH] = { "timeh", ctr32, read_timeh },
 
+    /* Crypto Extension */
+    [CSR_SEED] = { "seed", seed, read_seed, write_seed},
+
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
     [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index a9a0b363a7..83135849bb 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -37,9 +37,11 @@ typedef enum {
 } pmp_am_t;
 
 typedef enum {
-    MSECCFG_MML  = 1 << 0,
-    MSECCFG_MMWP = 1 << 1,
-    MSECCFG_RLB  = 1 << 2
+    MSECCFG_MML   = 1 << 0,
+    MSECCFG_MMWP  = 1 << 1,
+    MSECCFG_RLB   = 1 << 2,
+    MSECCFG_USEED = 1 << 8,
+    MSECCFG_SSEED = 1 << 9
 } mseccfg_field_t;
 
 typedef struct {
-- 
2.17.1


