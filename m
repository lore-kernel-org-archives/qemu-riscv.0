Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDR8T-0006Ir-Om
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 08:17:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nDR8D-00068F-FV; Fri, 28 Jan 2022 08:17:39 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:53802 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nDR88-0000dl-AF; Fri, 28 Jan 2022 08:17:36 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABXd5jL7PNhJ3MVAA--.49965S4;
 Fri, 28 Jan 2022 21:17:02 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v5 2/6] target/riscv: hardwire mstatus.FS to zero when enable
 zfinx
Date: Fri, 28 Jan 2022 21:16:39 +0800
Message-Id: <20220128131643.13938-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220128131643.13938-1-liweiwei@iscas.ac.cn>
References: <20220128131643.13938-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABXd5jL7PNhJ3MVAA--.49965S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4fJw1rKryDZrWDZr4fZrb_yoWrXF1fpr
 WkC3y7u347K397t3WfJF4qgr15Jry8G398Aa1ku39YyF4rJrWYkF98tr9FvFyDXFy7Wryj
 9Fyj934kAF47ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
 v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
 Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIx
 AIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU
 =
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
X-List-Received-Date: Fri, 28 Jan 2022 13:17:42 -0000

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c |  6 +++++-
 target/riscv/csr.c        | 25 ++++++++++++++++++++-----
 target/riscv/translate.c  |  4 ++++
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 327a2c4f1d..023e011923 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -223,9 +223,13 @@ bool riscv_cpu_vector_enabled(CPURISCVState *env)
 
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
index e5f9d4ef93..238e1d1858 100644
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
@@ -238,7 +239,9 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
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
@@ -255,7 +258,9 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
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
@@ -273,7 +278,9 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
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
@@ -580,10 +587,14 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
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
     if (xl != MXL_RV32 || env->debugger) {
         /*
          * RV32: MPV and GVA are not in mstatus. The current plan is to
@@ -715,6 +726,10 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
+    if (!(val & RVF)) {
+        env->mstatus &= ~MSTATUS_FS;
+    }
+
     /* flush translation cache */
     tb_flush(env_cpu(env));
     env->misa_ext = val;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1484586fe7..c9baf2a87a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -423,6 +423,10 @@ static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
 
+    if (!has_ext(ctx, RVF)) {
+        return;
+    }
+
     if (ctx->mstatus_fs != MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
         ctx->mstatus_fs = MSTATUS_FS;
-- 
2.17.1


