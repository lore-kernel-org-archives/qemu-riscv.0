Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n38Wi-0002sK-6w
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 22:24:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n38WY-0002gB-3E; Thu, 30 Dec 2021 22:24:13 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:34154 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n38WS-0000ms-FS; Thu, 30 Dec 2021 22:24:08 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAD3_i7Id85hSArwBA--.31043S4;
 Fri, 31 Dec 2021 11:23:55 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 liweiwei <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 2/6] target/riscv: hardwire mstatus.FS to zero when enable
 zfinx
Date: Fri, 31 Dec 2021 11:23:33 +0800
Message-Id: <20211231032337.15579-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowAD3_i7Id85hSArwBA--.31043S4
X-Coremail-Antispam: 1UD129KBjvJXoWxAF48GF1kXrWftr4rJrWDJwb_yoWrtr43pr
 WkG3y7Gry7G39rta1fJF4jgr15Jr1UGrWDC3WkWw43AF4rJrWYkF4Dtr9rZrnrXF17Wryj
 9Fy8A34kAF42yFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
 owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
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
X-List-Received-Date: Fri, 31 Dec 2021 03:24:13 -0000

From: liweiwei <liweiwei@iscas.ac.cn>

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c        |  4 ++++
 target/riscv/cpu_helper.c |  6 +++++-
 target/riscv/csr.c        | 24 +++++++++++++++++++-----
 target/riscv/translate.c  |  5 +++++
 4 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d9ea005724..cc7da446f1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -363,6 +363,10 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->misa_mxl = env->misa_mxl_max;
     env->priv = PRV_M;
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
+    /* hardwire mstatus.FS to zero when enable zfinx */
+    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        env->mstatus &= ~MSTATUS_FS;
+    }
     if (env->misa_mxl > MXL_RV32) {
         /*
          * The reset status of SXL/UXL is undefined, but mstatus is WARL
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 10f3baba53..a71edee44c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -222,9 +222,13 @@ bool riscv_cpu_vector_enabled(CPURISCVState *env)
 
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
-    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
+    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM|
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
                             MSTATUS64_UXL | MSTATUS_VS;
+    /* hardwire mstatus.FS to zero when enable zfinx */
+    if (!RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        mstatus_mask |= MSTATUS_FS;
+    }
     bool current_virt = riscv_cpu_virt_enabled(env);
 
     g_assert(riscv_has_ext(env, RVH));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 146447eac5..de20206b73 100644
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
@@ -234,7 +235,10 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    /* hardwire mstatus.FS to zero when enable zfinx */
+    if (!RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        env->mstatus |= MSTATUS_FS;
+    }
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
     return RISCV_EXCP_NONE;
@@ -251,7 +255,10 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    /* hardwire mstatus.FS to zero when enable zfinx */
+    if (!RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        env->mstatus |= MSTATUS_FS;
+    }
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
     return RISCV_EXCP_NONE;
@@ -269,7 +276,10 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    /* hardwire mstatus.FS to zero when enable zfinx */
+    if (!RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        env->mstatus |= MSTATUS_FS;
+    }
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
@@ -562,9 +572,13 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
-        MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
+        MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW | MSTATUS_VS;
+    /* hardwire mstatus.FS to zero when enable zfinx */
+    if (!RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        mask |= MSTATUS_FS;
+    }
 
     if (riscv_cpu_mxl(env) != MXL_RV32) {
         /*
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


