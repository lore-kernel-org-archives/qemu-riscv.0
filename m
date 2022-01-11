Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n78Cj-00021n-TM
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 22:52:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n78CX-0001t9-27; Mon, 10 Jan 2022 22:52:02 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:56276 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n78CK-0004OZ-Pt; Mon, 10 Jan 2022 22:51:52 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAD3_wPK_txh2Dz9BQ--.65038S7;
 Tue, 11 Jan 2022 11:51:42 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4 5/7] target/riscv: rvk: add CSR support for Zkr
Date: Tue, 11 Jan 2022 11:51:22 +0800
Message-Id: <20220111035124.9468-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
References: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowAD3_wPK_txh2Dz9BQ--.65038S7
X-Coremail-Antispam: 1UD129KBjvJXoWxCF15WF4DAFyrtw4kZF1UWrg_yoW7JFWkpr
 4kCay3GryFvFZ7Aw4ftF15WF15G34rGayfJ397uw4kAF13J3yrJrnxW39IqFn5Xas5CrW2
 9F4qyFn0kr47XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4U
 JVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 W8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
 F18BUUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 Jan 2022 03:52:02 -0000

   - add SEED CSR
   - add USEED, SSEED fields for MSECCFG CSR

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_bits.h |  9 +++++
 target/riscv/csr.c      | 74 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/pmp.h      |  8 +++--
 3 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5a6d49aa64..65c708622b 100644
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
@@ -628,4 +631,10 @@ typedef enum RISCVException {
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
index adb3d4381d..9d93e72f68 100644
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
@@ -222,6 +224,38 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 }
 #endif
 
+/* Predicates */
+static RISCVException seed(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    if (!cpu->cfg.ext_zkr) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
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
@@ -1785,6 +1819,39 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
 
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
@@ -1823,6 +1890,10 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (!write_mask && (csrno == CSR_SEED)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
     /* ensure the CSR extension is enabled. */
     if (!cpu->cfg.ext_icsr) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -2011,6 +2082,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


