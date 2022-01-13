Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7pGp-0003A5-05
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 20:51:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n7pGm-00037b-Jy; Wed, 12 Jan 2022 20:51:16 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:48590 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n7pGj-0000iS-Qq; Wed, 12 Jan 2022 20:51:16 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowABXXwODhd9hljodBg--.33470S4;
 Thu, 13 Jan 2022 09:51:02 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4 2/6] target/riscv: hardwire mstatus.FS to zero when enable
 zfinx
Date: Thu, 13 Jan 2022 09:49:55 +0800
Message-Id: <20220113014959.21429-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113014959.21429-1-liweiwei@iscas.ac.cn>
References: <20220113014959.21429-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowABXXwODhd9hljodBg--.33470S4
X-Coremail-Antispam: 1UD129KBjvJXoWxAF48KFW5Cw13JF45ur4xCrg_yoWrGw4xpr
 WkC3y7u3srK39rta1fJF4qgr15JryUGa98Ca1kW39YyF4rJrWYkFZ8trZFvFyDXFy7Wryj
 9Fyj934kAF47ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPU
 UUUU=
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
X-List-Received-Date: Thu, 13 Jan 2022 01:51:16 -0000

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_helper.c |  6 +++++-
 target/riscv/csr.c        | 25 ++++++++++++++++++++-----
 target/riscv/translate.c  |  4 ++++
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 434a83e66a..3854acf7fe 100644
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
index adb3d4381d..f4466cba05 100644
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
@@ -564,10 +571,14 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
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
@@ -697,6 +708,10 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
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
index 9687fa3e7c..8f01063618 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -406,6 +406,10 @@ static void mark_fs_dirty(DisasContext *ctx)
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


