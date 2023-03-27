Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgjex-0007yI-9W
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 06:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgjee-0007s6-GU; Mon, 27 Mar 2023 06:00:52 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgjeZ-0000hW-V2; Mon, 27 Mar 2023 06:00:43 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAD3_s4+aSFki8bGCg--.239S7;
 Mon, 27 Mar 2023 18:00:34 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 5/5] target/riscv: Add pointer mask support for instruction
 fetch
Date: Mon, 27 Mar 2023 18:00:27 +0800
Message-Id: <20230327100027.61160-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_s4+aSFki8bGCg--.239S7
X-Coremail-Antispam: 1UD129KBjvJXoWxAF48tr4UtF13KF18Ar1kXwb_yoWrCFWfpr
 Z5C3yfCw4DtFZrJayfJr1qyF15Jan8KF4UKwn7KasakayFq3yFvr1qkw17ZFn5WF48Zw1j
 9a1DAr15ZF47ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
 WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZ
 X7UUUUU==
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
X-List-Received-Date: Mon, 27 Mar 2023 10:00:58 -0000

Transform the fetch address before page walk when pointer mask is
enabled for instruction fetch.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++--
 target/riscv/csr.c        |  2 --
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..57bd9c3279 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -368,6 +368,7 @@ struct CPUArchState {
 #endif
     target_ulong cur_pmmask;
     target_ulong cur_pmbase;
+    bool cur_pminsn;
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..77132a3e0c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -124,6 +124,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 void riscv_cpu_update_mask(CPURISCVState *env)
 {
     target_ulong mask = -1, base = 0;
+    bool insn = false;
     /*
      * TODO: Current RVJ spec does not specify
      * how the extension interacts with XLEN.
@@ -135,18 +136,21 @@ void riscv_cpu_update_mask(CPURISCVState *env)
             if (env->mmte & M_PM_ENABLE) {
                 mask = env->mpmmask;
                 base = env->mpmbase;
+                insn = env->mmte & MMTE_M_PM_INSN;
             }
             break;
         case PRV_S:
             if (env->mmte & S_PM_ENABLE) {
                 mask = env->spmmask;
                 base = env->spmbase;
+                insn = env->mmte & MMTE_S_PM_INSN;
             }
             break;
         case PRV_U:
             if (env->mmte & U_PM_ENABLE) {
                 mask = env->upmmask;
                 base = env->upmbase;
+                insn = env->mmte & MMTE_U_PM_INSN;
             }
             break;
         default:
@@ -161,6 +165,7 @@ void riscv_cpu_update_mask(CPURISCVState *env)
         env->cur_pmmask = mask;
         env->cur_pmbase = base;
     }
+    env->cur_pminsn = insn;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1225,6 +1230,17 @@ static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
     riscv_pmu_incr_ctr(cpu, pmu_event_type);
 }
 
+static target_ulong adjust_pc_address(CPURISCVState *env, target_ulong pc)
+{
+    target_ulong adjust_pc = pc;
+
+    if (env->cur_pminsn) {
+        adjust_pc = (adjust_pc & ~env->cur_pmmask) | env->cur_pmbase;
+    }
+
+    return adjust_pc;
+}
+
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr)
@@ -1232,6 +1248,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     vaddr im_address;
+    vaddr orig_address = address;
     hwaddr pa = 0;
     int prot, prot2, prot_pmp;
     bool pmp_violation = false;
@@ -1248,6 +1265,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
+    if (access_type == MMU_INST_FETCH) {
+        address = adjust_pc_address(env, address);
+    }
+
     /* MPRV does not affect the virtual-machine load/store
        instructions, HLV, HLVX, and HSV. */
     if (riscv_cpu_two_stage_lookup(mmu_idx)) {
@@ -1351,13 +1372,13 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     if (ret == TRANSLATE_SUCCESS) {
-        tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
+        tlb_set_page(cs, orig_address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
                      prot, mmu_idx, tlb_size);
         return true;
     } else if (probe) {
         return false;
     } else {
-        raise_mmu_exception(env, address, access_type, pmp_violation,
+        raise_mmu_exception(env, orig_address, access_type, pmp_violation,
                             first_stage_error,
                             riscv_cpu_virt_enabled(env) ||
                                 riscv_cpu_two_stage_lookup(mmu_idx),
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..4544c9d934 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3511,8 +3511,6 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
     /* for machine mode pm.current is hardwired to 1 */
     wpri_val |= MMTE_M_PM_CURRENT;
 
-    /* hardwiring pm.instruction bit to 0, since it's not supported yet */
-    wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
     env->mmte = wpri_val | PM_EXT_DIRTY;
     riscv_cpu_update_mask(env);
 
-- 
2.25.1


