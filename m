Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni5d2-0000ey-RI
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 22:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5ct-0000Vo-9x; Fri, 22 Apr 2022 22:35:59 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:39898 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5cq-00058s-TU; Fri, 22 Apr 2022 22:35:58 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABX0+DqZWNiSogjAA--.1876S14;
 Sat, 23 Apr 2022 10:35:32 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v12 12/14] target/riscv: rvk: add CSR support for Zkr
Date: Sat, 23 Apr 2022 10:35:08 +0800
Message-Id: <20220423023510.30794-13-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
References: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABX0+DqZWNiSogjAA--.1876S14
X-Coremail-Antispam: 1UD129KBjvJXoWxuw18Wr1DGry8Cw1ftr43KFg_yoW7KryUpr
 4UCay3GrWrXFZ3ua1ftr45XF15Gw4rWa15Jws7u3y8Ar43J3yrJFnYq39IqFn8Xa1vkr1j
 9F4jkF1Fkr4UZa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
 0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
 0JUQSdkUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Sat, 23 Apr 2022 02:35:59 -0000

 - add SEED CSR which must be accessed with a read-write instruction:
   A read-only instruction such as CSRRS/CSRRC with rs1=x0 or CSRRSI/CSRRCI
with uimm=0 will raise an illegal instruction exception.
 - add USEED, SSEED fields for MSECCFG CSR

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h  |  9 +++++
 target/riscv/csr.c       | 80 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/op_helper.c |  9 +++++
 target/riscv/pmp.h       |  8 ++--
 4 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4a9e4f7d09..4d04b20d06 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -458,6 +458,9 @@
 #define CSR_VSPMMASK        0x2c1
 #define CSR_VSPMBASE        0x2c2
 
+/* Crypto Extension */
+#define CSR_SEED            0x015
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -800,4 +803,10 @@ typedef enum RISCVException {
 #define HVICTL_VALID_MASK                  \
     (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
 
+/* seed CSR bits */
+#define SEED_OPST                        (0b11 << 30)
+#define SEED_OPST_BIST                   (0b00 << 30)
+#define SEED_OPST_WAIT                   (0b01 << 30)
+#define SEED_OPST_ES16                   (0b10 << 30)
+#define SEED_OPST_DEAD                   (0b11 << 30)
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1c2d3f7193..3500e07f92 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -24,6 +24,8 @@
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "sysemu/cpu-timers.h"
+#include "qemu/guest-random.h"
+#include "qapi/error.h"
 
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
@@ -301,6 +303,46 @@ static RISCVException debug(CPURISCVState *env, int csrno)
 }
 #endif
 
+static RISCVException seed(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_zkr) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+#if !defined(CONFIG_USER_ONLY)
+    /*
+     * With a CSR read-write instruction:
+     * 1) The seed CSR is always available in machine mode as normal.
+     * 2) Attempted access to seed from virtual modes VS and VU always raises
+     * an exception(virtual instruction exception only if mseccfg.sseed=1).
+     * 3) Without the corresponding access control bit set to 1, any attempted
+     * access to seed from U, S or HS modes will raise an illegal instruction
+     * exception.
+     */
+    if (env->priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    } else if (riscv_cpu_virt_enabled(env)) {
+        if (env->mseccfg & MSECCFG_SSEED) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        } else {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    } else {
+        if (env->priv == PRV_S && (env->mseccfg & MSECCFG_SSEED)) {
+            return RISCV_EXCP_NONE;
+        } else if (env->priv == PRV_U && (env->mseccfg & MSECCFG_USEED)) {
+            return RISCV_EXCP_NONE;
+        } else {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+#else
+    return RISCV_EXCP_NONE;
+#endif
+}
+
 /* User Floating-Point CSRs */
 static RISCVException read_fflags(CPURISCVState *env, int csrno,
                                   target_ulong *val)
@@ -3044,6 +3086,41 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
 
 #endif
 
+/* Crypto Extension */
+static RISCVException rmw_seed(CPURISCVState *env, int csrno,
+                               target_ulong *ret_value,
+                               target_ulong new_value,
+                               target_ulong write_mask)
+{
+    uint16_t random_v;
+    Error *random_e = NULL;
+    int random_r;
+    target_ulong rval;
+
+    random_r = qemu_guest_getrandom(&random_v, 2, &random_e);
+    if (unlikely(random_r < 0)) {
+        /*
+         * Failed, for unknown reasons in the crypto subsystem.
+         * The best we can do is log the reason and return a
+         * failure indication to the guest.  There is no reason
+         * we know to expect the failure to be transitory, so
+         * indicate DEAD to avoid having the guest spin on WAIT.
+         */
+        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
+                      __func__, error_get_pretty(random_e));
+        error_free(random_e);
+        rval = SEED_OPST_DEAD;
+    } else {
+        rval = random_v | SEED_OPST_ES16;
+    }
+
+    if (ret_value) {
+        *ret_value = rval;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * riscv_csrrw - read and/or update control and status register
  *
@@ -3282,6 +3359,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_TIME]  = { "time",  ctr,   read_time  },
     [CSR_TIMEH] = { "timeh", ctr32, read_timeh },
 
+    /* Crypto Extension */
+    [CSR_SEED] = { "seed", seed, NULL, NULL, rmw_seed },
+
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
     [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index df35736883..09f1f5185d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -39,6 +39,15 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
 
 target_ulong helper_csrr(CPURISCVState *env, int csr)
 {
+    /*
+     * The seed CSR must be accessed with a read-write instruction. A
+     * read-only instruction such as CSRRS/CSRRC with rs1=x0 or CSRRSI/
+     * CSRRCI with uimm=0 will raise an illegal instruction exception.
+     */
+    if (csr == CSR_SEED) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
     target_ulong val = 0;
     RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0);
 
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index fcb6b7c467..a8dd797476 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -39,9 +39,11 @@ typedef enum {
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


