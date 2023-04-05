Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjyyQ-0000hP-3y
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 04:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjyyO-0000gK-El; Wed, 05 Apr 2023 04:58:32 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjyyI-0003DL-Rq; Wed, 05 Apr 2023 04:58:32 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAH+BQoOC1kWY5GDg--.24854S5;
 Wed, 05 Apr 2023 16:58:20 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 3/4] target/riscv: Fix format for comments
Date: Wed,  5 Apr 2023 16:58:12 +0800
Message-Id: <20230405085813.40643-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
References: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAH+BQoOC1kWY5GDg--.24854S5
X-Coremail-Antispam: 1UD129KBjvAXoWfuw15uryftFyrJryfAFW3Awb_yoW5Jw15to
 WxCFs5Zws5Ww1fKF98CF1xtry7Ww4vkr4rXF4DKwsYgas5Xr4Ygay7twsxA3ZxXr4rWFW5
 Ja97tayUZas7GFy3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUOU7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r1rM28IrcIa0x
 kI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
 jcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM2
 8EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbJ73DUU
 UUU==
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
X-List-Received-Date: Wed, 05 Apr 2023 08:58:32 -0000

Fix formats for multi-lines comments.
Add spaces around single line comments(after "/*" and before "*/").

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/arch_dump.c                |  3 +-
 target/riscv/cpu.c                      |  2 +-
 target/riscv/cpu.h                      | 26 ++++----
 target/riscv/cpu_bits.h                 |  2 +-
 target/riscv/cpu_helper.c               | 57 +++++++++++------
 target/riscv/csr.c                      |  6 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  8 ++-
 target/riscv/pmp.c                      | 41 +++++++------
 target/riscv/sbi_ecall_interface.h      |  8 +--
 target/riscv/translate.c                | 20 +++---
 target/riscv/vector_helper.c            | 82 +++++++++++++++----------
 11 files changed, 151 insertions(+), 104 deletions(-)

diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
index 573587810e..434c8a3dbb 100644
--- a/target/riscv/arch_dump.c
+++ b/target/riscv/arch_dump.c
@@ -1,4 +1,5 @@
-/* Support for writing ELF notes for RISC-V architectures
+/*
+ * Support for writing ELF notes for RISC-V architectures
  *
  * Copyright (C) 2021 Huawei Technologies Co., Ltd
  *
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8ed8601399..2e45b1f076 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -56,7 +56,7 @@ struct isa_ext_data {
 #define ISA_EXT_DATA_ENTRY(_name, _m_letter, _min_ver, _prop) \
     {#_name, _m_letter, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
 
-/**
+/*
  * Here are the ordering rules of extension naming defined by RISC-V
  * specification :
  * 1. All extensions should be separated from other multi-letter extensions
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 995192757a..5018a3b1b2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -124,7 +124,7 @@ FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
 typedef struct PMUCTRState {
     /* Current value of a counter */
     target_ulong mhpmcounter_val;
-    /* Current value of a counter in RV32*/
+    /* Current value of a counter in RV32 */
     target_ulong mhpmcounterh_val;
     /* Snapshot values of counter */
     target_ulong mhpmcounter_prev;
@@ -280,8 +280,10 @@ struct CPUArchState {
     target_ulong satp_hs;
     uint64_t mstatus_hs;
 
-    /* Signals whether the current exception occurred with two-stage address
-       translation active. */
+    /*
+     * Signals whether the current exception occurred with two-stage address
+     * translation active.
+     */
     bool two_stage_lookup;
     /*
      * Signals whether the current exception occurred while doing two-stage
@@ -297,10 +299,10 @@ struct CPUArchState {
     /* PMU counter state */
     PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];
 
-    /* PMU event selector configured values. First three are unused*/
+    /* PMU event selector configured values. First three are unused */
     target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
 
-    /* PMU event selector configured values for RV32*/
+    /* PMU event selector configured values for RV32 */
     target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
 
     target_ulong sscratch;
@@ -389,7 +391,7 @@ struct CPUArchState {
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
 
-/**
+/*
  * RISCVCPUClass:
  * @parent_realize: The parent class' realize handler.
  * @parent_phases: The parent class' reset phase handlers.
@@ -397,9 +399,9 @@ OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
  * A RISCV CPU model.
  */
 struct RISCVCPUClass {
-    /*< private >*/
+    /* < private > */
     CPUClass parent_class;
-    /*< public >*/
+    /* < public > */
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
 };
@@ -530,16 +532,16 @@ struct RISCVCPUConfig {
 
 typedef struct RISCVCPUConfig RISCVCPUConfig;
 
-/**
+/*
  * RISCVCPU:
  * @env: #CPURISCVState
  *
  * A RISCV CPU.
  */
 struct ArchCPU {
-    /*< private >*/
+    /* < private > */
     CPUState parent_obj;
-    /*< public >*/
+    /* < public > */
     CPUNegativeOffsetState neg;
     CPURISCVState env;
 
@@ -813,7 +815,7 @@ enum {
     CSR_TABLE_SIZE = 0x1000
 };
 
-/**
+/*
  * The event id are encoded based on the encoding specified in the
  * SBI specification v0.3
  */
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 190e517862..101702cb4a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -731,7 +731,7 @@ typedef enum RISCVException {
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
 
-/* General PointerMasking CSR bits*/
+/* General PointerMasking CSR bits */
 #define PM_ENABLE       0x00000001ULL
 #define PM_CURRENT      0x00000002ULL
 #define PM_INSN         0x00000004ULL
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8d2547a164..445ffe691a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -717,7 +717,8 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
     return TRANSLATE_SUCCESS;
 }
 
-/* get_physical_address - get the physical address for this virtual address
+/*
+ * get_physical_address - get the physical address for this virtual address
  *
  * Do a page table walk to obtain the physical address corresponding to a
  * virtual address. Returns 0 if the translation was successful
@@ -745,9 +746,11 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
                                 bool first_stage, bool two_stage,
                                 bool is_debug)
 {
-    /* NOTE: the env->pc value visible here will not be
+    /*
+     * NOTE: the env->pc value visible here will not be
      * correct, but the value visible to the exception handler
-     * (riscv_cpu_do_interrupt) is correct */
+     * (riscv_cpu_do_interrupt) is correct
+     */
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
@@ -767,8 +770,10 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         use_background = true;
     }
 
-    /* MPRV does not affect the virtual-machine load/store
-       instructions, HLV, HLVX, and HSV. */
+    /*
+     * MPRV does not affect the virtual-machine load/store
+     * instructions, HLV, HLVX, and HSV.
+     */
     if (riscv_cpu_two_stage_lookup(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
@@ -778,8 +783,10 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     if (first_stage == false) {
-        /* We are in stage 2 translation, this is similar to stage 1. */
-        /* Stage 2 is always taken as U-mode */
+        /*
+         * We are in stage 2 translation, this is similar to stage 1.
+         * Stage 2 is always taken as U-mode
+         */
         mode = PRV_U;
     }
 
@@ -1007,8 +1014,10 @@ restart:
                     target_ulong *pte_pa =
                         qemu_map_ram_ptr(mr->ram_block, addr1);
 #if TCG_OVERSIZED_GUEST
-                    /* MTTCG is not enabled on oversized TCG guests so
-                     * page table updates do not need to be atomic */
+                    /*
+                     * MTTCG is not enabled on oversized TCG guests so
+                     * page table updates do not need to be atomic
+                     */
                     *pte_pa = pte = updated_pte;
 #else
                     target_ulong old_pte =
@@ -1020,14 +1029,18 @@ restart:
                     }
 #endif
                 } else {
-                    /* misconfigured PTE in ROM (AD bits are not preset) or
-                     * PTE is in IO space and can't be updated atomically */
+                    /*
+                     * misconfigured PTE in ROM (AD bits are not preset) or
+                     * PTE is in IO space and can't be updated atomically
+                     */
                     return TRANSLATE_FAIL;
                 }
             }
 
-            /* for superpage mappings, make a fake leaf PTE for the TLB's
-               benefit. */
+            /*
+             * for superpage mappings, make a fake leaf PTE for the TLB's
+             * benefit.
+             */
             target_ulong vpn = addr >> PGSHIFT;
 
             if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
@@ -1049,8 +1062,10 @@ restart:
             if (pte & PTE_X) {
                 *prot |= PAGE_EXEC;
             }
-            /* add write permission on stores or if the page is already dirty,
-               so that we TLB miss on later writes to update the dirty bit */
+            /*
+             * add write permission on stores or if the page is already dirty,
+             * so that we TLB miss on later writes to update the dirty bit
+             */
             if ((pte & PTE_W) &&
                 (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
                 *prot |= PAGE_WRITE;
@@ -1235,8 +1250,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
-    /* MPRV does not affect the virtual-machine load/store
-       instructions, HLV, HLVX, and HSV. */
+    /*
+     * MPRV does not affect the virtual-machine load/store
+     * instructions, HLV, HLVX, and HSV.
+     */
     if (riscv_cpu_two_stage_lookup(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
@@ -1577,7 +1594,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool write_gva = false;
     uint64_t s;
 
-    /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
+    /*
+     * cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
      * so we mask off the MSB and separate into trap type and cause.
      */
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
@@ -1754,7 +1772,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         riscv_cpu_set_mode(env, PRV_M);
     }
 
-    /* NOTE: it is not necessary to yield load reservations here. It is only
+    /*
+     * NOTE: it is not necessary to yield load reservations here. It is only
      * necessary for an SC from "another hart" to cause a load reservation
      * to be yielded. Refer to the memory consistency model section of the
      * RISC-V ISA Specification.
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 41e56012d5..76755ee128 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -189,7 +189,7 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
     }
     ctr_index = csrno - base_csrno;
     if (!pmu_num || ctr_index >= pmu_num) {
-        /* The PMU is not enabled or counter is out of range*/
+        /* The PMU is not enabled or counter is out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -877,7 +877,7 @@ static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
                                         counter.mhpmcounter_val;
 
     if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
-        /**
+        /*
          * Counter should not increment if inhibit bit is set. We can't really
          * stop the icount counting. Just return the counter value written by
          * the supervisor to indicate that counter was not incremented.
@@ -891,7 +891,7 @@ static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
         }
     }
 
-    /**
+    /*
      * The kernel computes the perf delta by subtracting the current value from
      * the value it initialized previously (ctr_val).
      */
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 8e43bfc07c..ca3c4c1a3d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3136,9 +3136,11 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
     return false;
 }
 
-/* vmsbf.m set-before-first mask bit */
-/* vmsif.m set-includ-first mask bit */
-/* vmsof.m set-only-first mask bit */
+/*
+ * vmsbf.m set-before-first mask bit
+ * vmsif.m set-including-first mask bit
+ * vmsof.m set-only-first mask bit
+ */
 #define GEN_M_TRANS(NAME)                                          \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 3943b0f2e3..6ab2ae81c7 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -132,15 +132,15 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
 static void pmp_decode_napot(target_ulong a, target_ulong *sa, target_ulong *ea)
 {
     /*
-       aaaa...aaa0   8-byte NAPOT range
-       aaaa...aa01   16-byte NAPOT range
-       aaaa...a011   32-byte NAPOT range
-       ...
-       aa01...1111   2^XLEN-byte NAPOT range
-       a011...1111   2^(XLEN+1)-byte NAPOT range
-       0111...1111   2^(XLEN+2)-byte NAPOT range
-       1111...1111   Reserved
-    */
+     * aaaa...aaa0   8-byte NAPOT range
+     * aaaa...aa01   16-byte NAPOT range
+     * aaaa...a011   32-byte NAPOT range
+     * ...
+     * aa01...1111   2^XLEN-byte NAPOT range
+     * a011...1111   2^(XLEN+1)-byte NAPOT range
+     * 0111...1111   2^(XLEN+2)-byte NAPOT range
+     * 1111...1111   Reserved
+     */
     a = (a << 2) | 0x3;
     *sa = a & (a + 1);
     *ea = a | (a + 1);
@@ -205,7 +205,8 @@ void pmp_update_rule_nums(CPURISCVState *env)
     }
 }
 
-/* Convert cfg/addr reg values here into simple 'sa' --> start address and 'ea'
+/*
+ * Convert cfg/addr reg values here into simple 'sa' --> start address and 'ea'
  *   end address values.
  *   This function is called relatively infrequently whereas the check that
  *   an address is within a pmp rule is called often, so optimise that one
@@ -329,8 +330,10 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
         pmp_size = size;
     }
 
-    /* 1.10 draft priv spec states there is an implicit order
-         from low to high */
+    /*
+     * 1.10 draft priv spec states there is an implicit order
+     * from low to high
+     */
     for (i = 0; i < MAX_RISCV_PMPS; i++) {
         s = pmp_is_in_range(env, i, addr);
         e = pmp_is_in_range(env, i, addr + pmp_size - 1);
@@ -609,13 +612,13 @@ target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
         return TARGET_PAGE_SIZE;
     } else {
         /*
-        * At this point we have a tlb_size that is the smallest possible size
-        * That fits within a TARGET_PAGE_SIZE and the PMP region.
-        *
-        * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
-        * This means the result isn't cached in the TLB and is only used for
-        * a single translation.
-        */
+         * At this point we have a tlb_size that is the smallest possible size
+         * That fits within a TARGET_PAGE_SIZE and the PMP region.
+         *
+         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
+         * This means the result isn't cached in the TLB and is only used for
+         * a single translation.
+         */
         return 1;
     }
 }
diff --git a/target/riscv/sbi_ecall_interface.h b/target/riscv/sbi_ecall_interface.h
index 77574ed4cb..43899d08f6 100644
--- a/target/riscv/sbi_ecall_interface.h
+++ b/target/riscv/sbi_ecall_interface.h
@@ -28,7 +28,7 @@
 #define SBI_EXT_RFENCE                  0x52464E43
 #define SBI_EXT_HSM                     0x48534D
 
-/* SBI function IDs for BASE extension*/
+/* SBI function IDs for BASE extension */
 #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
 #define SBI_EXT_BASE_GET_IMP_ID         0x1
 #define SBI_EXT_BASE_GET_IMP_VERSION    0x2
@@ -37,13 +37,13 @@
 #define SBI_EXT_BASE_GET_MARCHID        0x5
 #define SBI_EXT_BASE_GET_MIMPID         0x6
 
-/* SBI function IDs for TIME extension*/
+/* SBI function IDs for TIME extension */
 #define SBI_EXT_TIME_SET_TIMER          0x0
 
-/* SBI function IDs for IPI extension*/
+/* SBI function IDs for IPI extension */
 #define SBI_EXT_IPI_SEND_IPI            0x0
 
-/* SBI function IDs for RFENCE extension*/
+/* SBI function IDs for RFENCE extension */
 #define SBI_EXT_RFENCE_REMOTE_FENCE_I       0x0
 #define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA    0x1
 #define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID  0x2
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3613aca28d..d0094922b6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -69,11 +69,13 @@ typedef struct DisasContext {
     uint32_t mstatus_hs_fs;
     uint32_t mstatus_hs_vs;
     uint32_t mem_idx;
-    /* Remember the rounding mode encoded in the previous fp instruction,
-       which we have already installed into env->fp_status.  Or -1 for
-       no previous fp instruction.  Note that we exit the TB when writing
-       to any system register, which includes CSR_FRM, so we do not have
-       to reset this known value.  */
+    /*
+     * Remember the rounding mode encoded in the previous fp instruction,
+     * which we have already installed into env->fp_status.  Or -1 for
+     * no previous fp instruction.  Note that we exit the TB when writing
+     * to any system register, which includes CSR_FRM, so we do not have
+     * to reset this known value.
+     */
     int frm;
     RISCVMXL ol;
     bool virt_inst_excp;
@@ -491,7 +493,7 @@ static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
     }
 }
 
-/* assume t is nanboxing (for normal) or sign-extended (for zfinx) */
+/* assume it is nanboxing (for normal) or sign-extended (for zfinx) */
 static void gen_set_fpr_hs(DisasContext *ctx, int reg_num, TCGv_i64 t)
 {
     if (!ctx->cfg_ptr->ext_zfinx) {
@@ -598,7 +600,8 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
 }
 
 #ifndef CONFIG_USER_ONLY
-/* The states of mstatus_fs are:
+/*
+ * The states of mstatus_fs are:
  * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
  * We will have already diagnosed disabled state,
  * and need to turn initial/clean into dirty.
@@ -636,7 +639,8 @@ static inline void mark_fs_dirty(DisasContext *ctx) { }
 #endif
 
 #ifndef CONFIG_USER_ONLY
-/* The states of mstatus_vs are:
+/*
+ * The states of mstatus_vs are:
  * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
  * We will have already diagnosed disabled state,
  * and need to turn initial/clean into dirty.
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 6067b5cfc7..81ac85b7d5 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -287,7 +287,7 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
 }
 
 /*
- *** stride: access vector element from strided memory
+ * stride: access vector element from strided memory
  */
 static void
 vext_ldst_stride(void *vd, void *v0, target_ulong base,
@@ -353,10 +353,10 @@ GEN_VEXT_ST_STRIDE(vsse32_v, int32_t, ste_w)
 GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 
 /*
- *** unit-stride: access elements stored contiguously in memory
+ * unit-stride: access elements stored contiguously in memory
  */
 
-/* unmasked unit-stride load and store operation*/
+/* unmasked unit-stride load and store operation */
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
              vext_ldst_elem_fn *ldst_elem, uint32_t log2_esz, uint32_t evl,
@@ -429,7 +429,7 @@ GEN_VEXT_ST_US(vse32_v, int32_t, ste_w)
 GEN_VEXT_ST_US(vse64_v, int64_t, ste_d)
 
 /*
- *** unit stride mask load and store, EEW = 1
+ * unit stride mask load and store, EEW = 1
  */
 void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
                     CPURISCVState *env, uint32_t desc)
@@ -450,7 +450,7 @@ void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
 }
 
 /*
- *** index: access vector element from indexed memory
+ * index: access vector element from indexed memory
  */
 typedef target_ulong vext_get_index_addr(target_ulong base,
         uint32_t idx, void *vs2);
@@ -554,7 +554,7 @@ GEN_VEXT_ST_INDEX(vsxei64_32_v, int32_t, idx_d, ste_w)
 GEN_VEXT_ST_INDEX(vsxei64_64_v, int64_t, idx_d, ste_d)
 
 /*
- *** unit-stride fault-only-fisrt load instructions
+ * unit-stride fault-only-fisrt load instructions
  */
 static inline void
 vext_ldff(void *vd, void *v0, target_ulong base,
@@ -571,7 +571,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t vma = vext_vma(desc);
     target_ulong addr, offset, remain;
 
-    /* probe every access*/
+    /* probe every access */
     for (i = env->vstart; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
@@ -660,7 +660,7 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
 #define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)
 
 /*
- *** load and store whole register instructions
+ * load and store whole register instructions
  */
 static void
 vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
@@ -733,7 +733,7 @@ GEN_VEXT_ST_WHOLE(vs4r_v, int8_t, ste_b)
 GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b)
 
 /*
- *** Vector Integer Arithmetic Instructions
+ * Vector Integer Arithmetic Instructions
  */
 
 /* expand macro args before macro */
@@ -1149,8 +1149,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
     }                                                         \
     env->vstart = 0;                                          \
-    /* mask destination register are always tail-agnostic */  \
-    /* set tail elements to 1s */                             \
+    /*
+     * mask destination register are always tail-agnostic
+     * set tail elements to 1s
+     */                                                       \
     if (vta_all_1s) {                                         \
         for (; i < total_elems; i++) {                        \
             vext_set_elem_mask(vd, i, 1);                     \
@@ -1185,8 +1187,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
     env->vstart = 0;                                            \
-    /* mask destination register are always tail-agnostic */    \
-    /* set tail elements to 1s */                               \
+    /*
+     * mask destination register are always tail-agnostic
+     * set tail elements to 1s
+     */                                                         \
     if (vta_all_1s) {                                           \
         for (; i < total_elems; i++) {                          \
             vext_set_elem_mask(vd, i, 1);                       \
@@ -1392,8 +1396,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
     env->vstart = 0;                                          \
-    /* mask destination register are always tail-agnostic */  \
-    /* set tail elements to 1s */                             \
+    /*
+     * mask destination register are always tail-agnostic
+     * set tail elements to 1s
+     */                                                       \
     if (vta_all_1s) {                                         \
         for (; i < total_elems; i++) {                        \
             vext_set_elem_mask(vd, i, 1);                     \
@@ -1455,8 +1461,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
     env->vstart = 0;                                                \
-    /* mask destination register are always tail-agnostic */        \
-    /* set tail elements to 1s */                                   \
+    /*
+     * mask destination register are always tail-agnostic
+     * set tail elements to 1s
+     */                                                             \
     if (vta_all_1s) {                                               \
         for (; i < total_elems; i++) {                              \
             vext_set_elem_mask(vd, i, 1);                           \
@@ -2075,7 +2083,7 @@ GEN_VEXT_VMERGE_VX(vmerge_vxm_w, int32_t, H4)
 GEN_VEXT_VMERGE_VX(vmerge_vxm_d, int64_t, H8)
 
 /*
- *** Vector Fixed-Point Arithmetic Instructions
+ * Vector Fixed-Point Arithmetic Instructions
  */
 
 /* Vector Single-Width Saturating Add and Subtract */
@@ -2988,7 +2996,7 @@ GEN_VEXT_VX_RM(vnclipu_wx_h, 2)
 GEN_VEXT_VX_RM(vnclipu_wx_w, 4)
 
 /*
- *** Vector Float Point Arithmetic Instructions
+ * Vector Float Point Arithmetic Instructions
  */
 /* Vector Single-Width Floating-Point Add/Subtract Instructions */
 #define OPFVV2(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
@@ -4171,8 +4179,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
     env->vstart = 0;                                          \
-    /* mask destination register are always tail-agnostic */  \
-    /* set tail elements to 1s */                             \
+    /*
+     * mask destination register are always tail-agnostic
+     * set tail elements to 1s
+     */                                                       \
     if (vta_all_1s) {                                         \
         for (; i < total_elems; i++) {                        \
             vext_set_elem_mask(vd, i, 1);                     \
@@ -4208,8 +4218,10 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
     env->vstart = 0;                                                \
-    /* mask destination register are always tail-agnostic */        \
-    /* set tail elements to 1s */                                   \
+    /*
+     * mask destination register are always tail-agnostic
+     * set tail elements to 1s
+     */                                                             \
     if (vta_all_1s) {                                               \
         for (; i < total_elems; i++) {                              \
             vext_set_elem_mask(vd, i, 1);                           \
@@ -4472,7 +4484,9 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8)
 #define WOP_UU_B uint16_t, uint8_t,  uint8_t
 #define WOP_UU_H uint32_t, uint16_t, uint16_t
 #define WOP_UU_W uint64_t, uint32_t, uint32_t
-/* vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned integer.*/
+/*
+ * vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned integer.
+ */
 RVVCALL(OPFVV1, vfwcvt_xu_f_v_h, WOP_UU_H, H4, H2, float16_to_uint32)
 RVVCALL(OPFVV1, vfwcvt_xu_f_v_w, WOP_UU_W, H8, H4, float32_to_uint64)
 GEN_VEXT_V_ENV(vfwcvt_xu_f_v_h, 4)
@@ -4559,7 +4573,7 @@ GEN_VEXT_V_ENV(vfncvt_f_f_w_h, 2)
 GEN_VEXT_V_ENV(vfncvt_f_f_w_w, 4)
 
 /*
- *** Vector Reduction Operations
+ * Vector Reduction Operations
  */
 /* Vector Single-Width Integer Reduction Instructions */
 #define GEN_VEXT_RED(NAME, TD, TS2, HD, HS2, OP)          \
@@ -4713,7 +4727,7 @@ GEN_VEXT_FRED(vfwredosum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
 GEN_VEXT_FRED(vfwredosum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
 
 /*
- *** Vector Mask Operations
+ * Vector Mask Operations
  */
 /* Vector Mask-Register Logical Instructions */
 #define GEN_VEXT_MASK_VV(NAME, OP)                        \
@@ -4733,10 +4747,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
     env->vstart = 0;                                      \
-    /* mask destination register are always tail-         \
-     * agnostic                                           \
+    /*
+     * mask destination register are always tail-agnostic
+     * set tail elements to 1s
      */                                                   \
-    /* set tail elements to 1s */                         \
     if (vta_all_1s) {                                     \
         for (; i < total_elems; i++) {                    \
             vext_set_elem_mask(vd, i, 1);                 \
@@ -4779,7 +4793,7 @@ target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
     return cnt;
 }
 
-/* vfirst find-first-set mask bit*/
+/* vfirst find-first-set mask bit */
 target_ulong HELPER(vfirst_m)(void *v0, void *vs2, CPURISCVState *env,
                               uint32_t desc)
 {
@@ -4844,8 +4858,10 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
         }
     }
     env->vstart = 0;
-    /* mask destination register are always tail-agnostic */
-    /* set tail elements to 1s */
+    /*
+     * mask destination register are always tail-agnostic
+     * set tail elements to 1s
+     */
     if (vta_all_1s) {
         for (; i < total_elems; i++) {
             vext_set_elem_mask(vd, i, 1);
@@ -4937,7 +4953,7 @@ GEN_VEXT_VID_V(vid_v_w, uint32_t, H4)
 GEN_VEXT_VID_V(vid_v_d, uint64_t, H8)
 
 /*
- *** Vector Permutation Instructions
+ * Vector Permutation Instructions
  */
 
 /* Vector Slide Instructions */
-- 
2.25.1


