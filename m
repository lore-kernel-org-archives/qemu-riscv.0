Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5nPz-0004uo-AJ
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 06:28:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n5nPx-0004oQ-8Z; Fri, 07 Jan 2022 06:28:21 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:54256 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n5nPu-0006V8-1l; Fri, 07 Jan 2022 06:28:20 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAB3fS3CI9hh_s5CBQ--.4982S4;
 Fri, 07 Jan 2022 19:28:04 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 2/6] target/riscv: hardwire mstatus.FS to zero when enable
 zfinx
Date: Fri,  7 Jan 2022 19:27:45 +0800
Message-Id: <20220107112749.981-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220107112749.981-1-liweiwei@iscas.ac.cn>
References: <20220107112749.981-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowAB3fS3CI9hh_s5CBQ--.4982S4
X-Coremail-Antispam: 1UD129KBjvJXoWxAF48Kw1UKFy8XrykGr45Wrg_yoWrJryrpr
 WkC3y7ur9rK39rta1fJF4jgr15JrWUG398Aa1kW3yYyF4rJrWYkFZ8trZFvFyDXFy7Wryj
 9Fy093s5AF4xZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
 v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
 Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
 AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjJKsUUUUUU=
 =
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 07 Jan 2022 11:28:21 -0000

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_helper.c |  6 +++++-
 target/riscv/csr.c        | 21 ++++++++++++++++-----
 target/riscv/translate.c  |  5 +++++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 10f3baba53..6105bc36d7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -222,9 +222,13 @@ bool riscv_cpu_vector_enabled(CPURISCVState *env)
 
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
-    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
+    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
                             MSTATUS64_UXL | MSTATUS_VS;
+
+    if (riscv_has_ext(env, RVF)) {
+        mstatus_mask |= MSTATUS_FS;
+    }
     bool current_virt = riscv_cpu_virt_enabled(env);
 
     g_assert(riscv_has_ext(env, RVH));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 146447eac5..037b169bfb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -38,7 +38,8 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
+    if (!env->debugger && !riscv_cpu_fp_enabled(env) &&
+        !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
@@ -234,7 +235,9 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    if (riscv_has_ext(env, RVF)) {
+        env->mstatus |= MSTATUS_FS;
+    }
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
     return RISCV_EXCP_NONE;
@@ -251,7 +254,9 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    if (riscv_has_ext(env, RVF)) {
+        env->mstatus |= MSTATUS_FS;
+    }
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
     return RISCV_EXCP_NONE;
@@ -269,7 +274,9 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    if (riscv_has_ext(env, RVF)) {
+        env->mstatus |= MSTATUS_FS;
+    }
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
@@ -562,10 +569,14 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
-        MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
+        MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW | MSTATUS_VS;
 
+    if (riscv_has_ext(env, RVF)) {
+        mask |= MSTATUS_FS;
+    }
+
     if (riscv_cpu_mxl(env) != MXL_RV32) {
         /*
          * RV32: MPV and GVA are not in mstatus. The current plan is to
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8b1cdacf50..17bf20a799 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -342,6 +342,11 @@ static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
 
+    /* hardwire mstatus.FS to zero when enable zfinx */
+    if (ctx->ext_zfinx) {
+        return;
+    }
+
     if (ctx->mstatus_fs != MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
         ctx->mstatus_fs = MSTATUS_FS;
-- 
2.17.1


