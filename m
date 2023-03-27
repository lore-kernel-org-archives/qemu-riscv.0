Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pghv0-0007Mm-2n
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 04:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pghuv-0007JN-UO; Mon, 27 Mar 2023 04:09:25 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pghuq-00054e-8D; Mon, 27 Mar 2023 04:09:25 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowACnrWUkTyFksV29Cg--.4754S8;
 Mon, 27 Mar 2023 16:09:13 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 06/10] target/riscv: Remove riscv_cpu_virt_enabled()
Date: Mon, 27 Mar 2023 16:08:54 +0800
Message-Id: <20230327080858.39703-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrWUkTyFksV29Cg--.4754S8
X-Coremail-Antispam: 1UD129KBjvAXoWfWF1fXF4DCF47Cr45AF1UWrg_yoW8KrWrKo
 Z7Kr409an8Gw1S9w1vvr1UtryUXF1ktrsYqrsrKrZ3W3ZruF1rXr45Kr4UAa47tFWftFW8
 Xa4xGF12ga4xAa43n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUO07AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
 Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
 84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJV
 WxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4U
 JVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
 OBTYUUUUU
X-Originating-IP: [180.175.29.170]
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
X-List-Received-Date: Mon, 27 Mar 2023 08:09:26 -0000

Directly use env->virt_enabled instead.

Suggested-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu.h        |  1 -
 target/riscv/cpu_helper.c | 51 ++++++++++++++++++---------------------
 target/riscv/csr.c        | 46 +++++++++++++++++------------------
 target/riscv/debug.c      | 10 ++++----
 target/riscv/op_helper.c  | 18 +++++++-------
 target/riscv/pmu.c        |  4 +--
 target/riscv/translate.c  |  2 +-
 8 files changed, 64 insertions(+), 70 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16e465a0ab..e71b4d24a7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -549,7 +549,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s %d\n", "V      =  ", riscv_cpu_virt_enabled(env));
+        qemu_fprintf(f, " %s %d\n", "V      =  ", env->virt_enabled);
     }
 #endif
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 22dc5ddb95..dc9817b40d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -576,7 +576,6 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env);
 target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
-bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index c7bc3fc553..1ad39e7157 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -93,8 +93,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
     if (riscv_has_ext(env, RVH)) {
         if (env->priv == PRV_M ||
-            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
-            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
+            (env->priv == PRV_S && !env->virt_enabled) ||
+            (env->priv == PRV_U && !env->virt_enabled &&
                 get_field(env->hstatus, HSTATUS_HU))) {
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
@@ -391,7 +391,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     uint64_t irqs, pending, mie, hsie, vsie;
 
     /* Determine interrupt enable state of all privilege modes */
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         mie = 1;
         hsie = 1;
         vsie = (env->priv < PRV_S) ||
@@ -452,7 +452,7 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 bool riscv_cpu_fp_enabled(CPURISCVState *env)
 {
     if (env->mstatus & MSTATUS_FS) {
-        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_FS)) {
+        if (env->virt_enabled && !(env->mstatus_hs & MSTATUS_FS)) {
             return false;
         }
         return true;
@@ -465,7 +465,7 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
 bool riscv_cpu_vector_enabled(CPURISCVState *env)
 {
     if (env->mstatus & MSTATUS_VS) {
-        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_VS)) {
+        if (env->virt_enabled && !(env->mstatus_hs & MSTATUS_VS)) {
             return false;
         }
         return true;
@@ -483,7 +483,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
     if (riscv_has_ext(env, RVF)) {
         mstatus_mask |= MSTATUS_FS;
     }
-    bool current_virt = riscv_cpu_virt_enabled(env);
+    bool current_virt = env->virt_enabled;
 
     g_assert(riscv_has_ext(env, RVH));
 
@@ -558,11 +558,6 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)
     env->geilen = geilen;
 }
 
-bool riscv_cpu_virt_enabled(CPURISCVState *env)
-{
-    return env->virt_enabled;
-}
-
 /* This function can only be called to set virt when RVH is enabled */
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 {
@@ -609,7 +604,7 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
     CPUState *cs = env_cpu(env);
     uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         gein = get_field(env->hstatus, HSTATUS_VGEIN);
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     }
@@ -768,7 +763,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * was called. Background registers will be used if the guest has
      * forced a two stage translation to be on (in HS or M mode).
      */
-    if (!riscv_cpu_virt_enabled(env) && two_stage) {
+    if (!env->virt_enabled && two_stage) {
         use_background = true;
     }
 
@@ -931,7 +926,7 @@ restart:
         bool pbmte = env->menvcfg & MENVCFG_PBMTE;
         bool hade = env->menvcfg & MENVCFG_HADE;
 
-        if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
+        if (first_stage && two_stage && env->virt_enabled) {
             pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
             hade = hade && (env->henvcfg & HENVCFG_HADE);
         }
@@ -1091,7 +1086,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
 
     switch (access_type) {
     case MMU_INST_FETCH:
-        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+        if (env->virt_enabled && !first_stage) {
             cs->exception_index = RISCV_EXCP_INST_GUEST_PAGE_FAULT;
         } else {
             cs->exception_index = page_fault_exceptions ?
@@ -1131,11 +1126,11 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
     if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
-                             true, riscv_cpu_virt_enabled(env), true)) {
+                             true, env->virt_enabled, true)) {
         return -1;
     }
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
                                  0, mmu_idx, false, true, true)) {
             return -1;
@@ -1163,7 +1158,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 
     env->badaddr = addr;
-    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
+    env->two_stage_lookup = env->virt_enabled ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
@@ -1189,7 +1184,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
-    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
+    env->two_stage_lookup = env->virt_enabled ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
@@ -1253,7 +1248,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     pmu_tlb_fill_incr_ctr(cpu, access_type);
-    if (riscv_cpu_virt_enabled(env) ||
+    if (env->virt_enabled ||
         ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
          access_type != MMU_INST_FETCH)) {
         /* Two stage lookup */
@@ -1351,7 +1346,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         raise_mmu_exception(env, address, access_type, pmp_violation,
                             first_stage_error,
-                            riscv_cpu_virt_enabled(env) ||
+                            env->virt_enabled ||
                                 riscv_cpu_two_stage_lookup(mmu_idx),
                             two_stage_indirect_error);
         cpu_loop_exit_restore(cs, retaddr);
@@ -1658,9 +1653,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
             if (env->priv == PRV_M) {
                 cause = RISCV_EXCP_M_ECALL;
-            } else if (env->priv == PRV_S && riscv_cpu_virt_enabled(env)) {
+            } else if (env->priv == PRV_S && env->virt_enabled) {
                 cause = RISCV_EXCP_VS_ECALL;
-            } else if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) {
+            } else if (env->priv == PRV_S && !env->virt_enabled) {
                 cause = RISCV_EXCP_S_ECALL;
             } else if (env->priv == PRV_U) {
                 cause = RISCV_EXCP_U_ECALL;
@@ -1683,7 +1678,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         if (riscv_has_ext(env, RVH)) {
             uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
 
-            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
+            if (env->virt_enabled && ((hdeleg >> cause) & 1)) {
                 /* Trap to VS mode */
                 /*
                  * See if we need to adjust cause. Yes if its VS mode interrupt
@@ -1694,7 +1689,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                     cause = cause - 1;
                 }
                 write_gva = false;
-            } else if (riscv_cpu_virt_enabled(env)) {
+            } else if (env->virt_enabled) {
                 /* Trap into HS mode, from virt */
                 riscv_cpu_swap_hypervisor_regs(env);
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPVP,
@@ -1728,12 +1723,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     } else {
         /* handle the trap in M-mode */
         if (riscv_has_ext(env, RVH)) {
-            if (riscv_cpu_virt_enabled(env)) {
+            if (env->virt_enabled) {
                 riscv_cpu_swap_hypervisor_regs(env);
             }
             env->mstatus = set_field(env->mstatus, MSTATUS_MPV,
-                                     riscv_cpu_virt_enabled(env));
-            if (riscv_cpu_virt_enabled(env) && tval) {
+                                     env->virt_enabled);
+            if (env->virt_enabled && tval) {
                 env->mstatus = set_field(env->mstatus, MSTATUS_GVA, 1);
             }
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8f4d5eb13f..4ccd5dbfb5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -46,7 +46,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
                                        uint64_t bit)
 {
-    bool virt = riscv_cpu_virt_enabled(env);
+    bool virt = env->virt_enabled;
 
     if (env->priv == PRV_M || !riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_NONE;
@@ -136,7 +136,7 @@ skip_ext_pmu_check:
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (!get_field(env->hcounteren, ctr_mask) ||
             (env->priv == PRV_U && !get_field(env->scounteren, ctr_mask))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
@@ -350,7 +350,7 @@ static RISCVException hstateenh(CPURISCVState *env, int csrno)
 
 static RISCVException sstateen(CPURISCVState *env, int csrno)
 {
-    bool virt = riscv_cpu_virt_enabled(env);
+    bool virt = env->virt_enabled;
     int index = csrno - CSR_SSTATEEN0;
 
     if (!riscv_cpu_cfg(env)->ext_smstateen) {
@@ -415,7 +415,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
               get_field(env->henvcfg, HENVCFG_STCE))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
@@ -521,7 +521,7 @@ static RISCVException seed(CPURISCVState *env, int csrno)
      */
     if (env->priv == PRV_M) {
         return RISCV_EXCP_NONE;
-    } else if (riscv_cpu_virt_enabled(env)) {
+    } else if (env->virt_enabled) {
         if (env->mseccfg & MSECCFG_SSEED) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         } else {
@@ -949,7 +949,7 @@ static int read_scountovf(CPURISCVState *env, int csrno, target_ulong *val)
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-    uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
+    uint64_t delta = env->virt_enabled ? env->htimedelta : 0;
 
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -962,7 +962,7 @@ static RISCVException read_time(CPURISCVState *env, int csrno,
 static RISCVException read_timeh(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
+    uint64_t delta = env->virt_enabled ? env->htimedelta : 0;
 
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -1016,7 +1016,7 @@ static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
 static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         *val = env->vstimecmp;
     } else {
         *val = env->stimecmp;
@@ -1028,7 +1028,7 @@ static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
 static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         *val = env->vstimecmp >> 32;
     } else {
         *val = env->stimecmp >> 32;
@@ -1040,7 +1040,7 @@ static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
 static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
                                      target_ulong val)
 {
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
@@ -1061,7 +1061,7 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
 static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
                                       target_ulong val)
 {
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
@@ -1515,7 +1515,7 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
 {
-    if (!riscv_cpu_virt_enabled(env)) {
+    if (!env->virt_enabled) {
         return csrno;
     }
 
@@ -1672,7 +1672,7 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
 
 done:
     if (ret) {
-        return (riscv_cpu_virt_enabled(env) && virt) ?
+        return (env->virt_enabled && virt) ?
                RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
     }
     return RISCV_EXCP_NONE;
@@ -1726,7 +1726,7 @@ static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
 
 done:
     if (ret) {
-        return (riscv_cpu_virt_enabled(env) && virt) ?
+        return (env->virt_enabled && virt) ?
                RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
     }
     return RISCV_EXCP_NONE;
@@ -2156,7 +2156,7 @@ static RISCVException write_hstateenh_1_3(CPURISCVState *env, int csrno,
 static RISCVException read_sstateen(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
-    bool virt = riscv_cpu_virt_enabled(env);
+    bool virt = env->virt_enabled;
     int index = csrno - CSR_SSTATEEN0;
 
     *val = env->sstateen[index] & env->mstateen[index];
@@ -2170,7 +2170,7 @@ static RISCVException read_sstateen(CPURISCVState *env, int csrno,
 static RISCVException write_sstateen(CPURISCVState *env, int csrno,
                                      uint64_t mask, target_ulong new_val)
 {
-    bool virt = riscv_cpu_virt_enabled(env);
+    bool virt = env->virt_enabled;
     int index = csrno - CSR_SSTATEEN0;
     uint64_t wr_mask;
     uint64_t *reg;
@@ -2365,7 +2365,7 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
     RISCVException ret;
     uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
@@ -2575,7 +2575,7 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
     RISCVException ret;
     uint64_t mask = env->mideleg & sip_writable_mask;
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
@@ -2768,7 +2768,7 @@ static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
     int irq;
     uint8_t iprio;
 
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         return read_vstopi(env, CSR_VSTOPI, val);
     }
 
@@ -3113,7 +3113,7 @@ static int read_hvipriox(CPURISCVState *env, int first_index,
 
     /* First index has to be a multiple of number of irqs per register */
     if (first_index % num_irqs) {
-        return (riscv_cpu_virt_enabled(env)) ?
+        return (env->virt_enabled) ?
                RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -3139,7 +3139,7 @@ static int write_hvipriox(CPURISCVState *env, int first_index,
 
     /* First index has to be a multiple of number of irqs per register */
     if (first_index % num_irqs) {
-        return (riscv_cpu_virt_enabled(env)) ?
+        return (env->virt_enabled) ?
                RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -3794,7 +3794,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
     int csr_priv, effective_priv = env->priv;
 
     if (riscv_has_ext(env, RVH) && env->priv == PRV_S &&
-        !riscv_cpu_virt_enabled(env)) {
+        !env->virt_enabled) {
         /*
          * We are in HS mode. Add 1 to the effective privledge level to
          * allow us to access the Hypervisor CSRs.
@@ -3804,7 +3804,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 
     csr_priv = get_field(csrno, 0x300);
     if (!env->debugger && (effective_priv < csr_priv)) {
-        if (csr_priv == (PRV_S + 1) && riscv_cpu_virt_enabled(env)) {
+        if (csr_priv == (PRV_S + 1) && env->virt_enabled) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
         return RISCV_EXCP_ILLEGAL_INST;
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index b091293069..1f7aed23c9 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -515,7 +515,7 @@ itrigger_set_count(CPURISCVState *env, int index, int value)
 static bool check_itrigger_priv(CPURISCVState *env, int index)
 {
     target_ulong tdata1 = env->tdata1[index];
-    if (riscv_cpu_virt_enabled(env)) {
+    if (env->virt_enabled) {
         /* check VU/VS bit against current privilege level */
         return (get_field(tdata1, ITRIGGER_VS) == env->priv) ||
                (get_field(tdata1, ITRIGGER_VU) == env->priv);
@@ -787,7 +787,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
             switch (trigger_type) {
             case TRIGGER_TYPE_AD_MATCH:
                 /* type 2 trigger cannot be fired in VU/VS mode */
-                if (riscv_cpu_virt_enabled(env)) {
+                if (env->virt_enabled) {
                     return false;
                 }
 
@@ -806,7 +806,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
                 pc = env->tdata2[i];
 
                 if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
-                    if (riscv_cpu_virt_enabled(env)) {
+                    if (env->virt_enabled) {
                         /* check VU/VS bit against current privilege level */
                         if ((ctrl >> 23) & BIT(env->priv)) {
                             return true;
@@ -845,7 +845,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
         switch (trigger_type) {
         case TRIGGER_TYPE_AD_MATCH:
             /* type 2 trigger cannot be fired in VU/VS mode */
-            if (riscv_cpu_virt_enabled(env)) {
+            if (env->virt_enabled) {
                 return false;
             }
 
@@ -880,7 +880,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
             }
 
             if ((wp->flags & flags) && (wp->vaddr == addr)) {
-                if (riscv_cpu_virt_enabled(env)) {
+                if (env->virt_enabled) {
                     /* check VU/VS bit against current privilege level */
                     if ((ctrl >> 23) & BIT(env->priv)) {
                         return true;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1eecae9547..c0c4ced7f0 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -140,7 +140,7 @@ static void check_zicbo_envcfg(CPURISCVState *env, target_ulong envbits,
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    if (riscv_cpu_virt_enabled(env) &&
+    if (env->virt_enabled &&
         (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
          ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
@@ -278,7 +278,7 @@ target_ulong helper_sret(CPURISCVState *env)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
 
-    if (riscv_cpu_virt_enabled(env) && get_field(env->hstatus, HSTATUS_VTSR)) {
+    if (env->virt_enabled && get_field(env->hstatus, HSTATUS_VTSR)) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     }
 
@@ -293,7 +293,7 @@ target_ulong helper_sret(CPURISCVState *env)
     }
     env->mstatus = mstatus;
 
-    if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
+    if (riscv_has_ext(env, RVH) && !env->virt_enabled) {
         /* We support Hypervisor extensions and virtulisation is disabled */
         target_ulong hstatus = env->hstatus;
 
@@ -365,9 +365,9 @@ void helper_wfi(CPURISCVState *env)
     bool prv_s = env->priv == PRV_S;
 
     if (((prv_s || (!rvs && prv_u)) && get_field(env->mstatus, MSTATUS_TW)) ||
-        (rvs && prv_u && !riscv_cpu_virt_enabled(env))) {
+        (rvs && prv_u && !env->virt_enabled)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-    } else if (riscv_cpu_virt_enabled(env) && (prv_u ||
+    } else if (env->virt_enabled && (prv_u ||
         (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
@@ -384,7 +384,7 @@ void helper_tlb_flush(CPURISCVState *env)
         (env->priv == PRV_S &&
          get_field(env->mstatus, MSTATUS_TVM))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-    } else if (riscv_has_ext(env, RVH) && riscv_cpu_virt_enabled(env) &&
+    } else if (riscv_has_ext(env, RVH) && env->virt_enabled &&
                get_field(env->hstatus, HSTATUS_VTVM)) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
@@ -402,12 +402,12 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    if (env->priv == PRV_S && riscv_cpu_virt_enabled(env)) {
+    if (env->priv == PRV_S && env->virt_enabled) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     }
 
     if (env->priv == PRV_M ||
-        (env->priv == PRV_S && !riscv_cpu_virt_enabled(env))) {
+        (env->priv == PRV_S && !env->virt_enabled)) {
         tlb_flush(cs);
         return;
     }
@@ -417,7 +417,7 @@ void helper_hyp_tlb_flush(CPURISCVState *env)
 
 void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
 {
-    if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env) &&
+    if (env->priv == PRV_S && !env->virt_enabled &&
         get_field(env->mstatus, MSTATUS_TVM)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 22e2283c76..7ad85ab476 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -109,7 +109,7 @@ static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)
     CPURISCVState *env = &cpu->env;
     target_ulong max_val = UINT32_MAX;
     PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
-    bool virt_on = riscv_cpu_virt_enabled(env);
+    bool virt_on = env->virt_enabled;
 
     /* Privilege mode filtering */
     if ((env->priv == PRV_M &&
@@ -150,7 +150,7 @@ static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)
     CPURISCVState *env = &cpu->env;
     PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
     uint64_t max_val = UINT64_MAX;
-    bool virt_on = riscv_cpu_virt_enabled(env);
+    bool virt_on = env->virt_enabled;
 
     /* Privilege mode filtering */
     if ((env->priv == PRV_M &&
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c3adf30b54..5450efcce5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1158,7 +1158,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->priv_ver = env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
-        ctx->virt_enabled = riscv_cpu_virt_enabled(env);
+        ctx->virt_enabled = env->virt_enabled;
     } else {
         ctx->virt_enabled = false;
     }
-- 
2.25.1


