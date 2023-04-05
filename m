Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjyyO-0000ga-NU
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 04:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjyyN-0000fl-6z; Wed, 05 Apr 2023 04:58:31 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjyyI-0003Cx-Rl; Wed, 05 Apr 2023 04:58:30 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAH+BQoOC1kWY5GDg--.24854S6;
 Wed, 05 Apr 2023 16:58:20 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 4/4] target/riscv: Fix lines with over 80 characters
Date: Wed,  5 Apr 2023 16:58:13 +0800
Message-Id: <20230405085813.40643-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
References: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAH+BQoOC1kWY5GDg--.24854S6
X-Coremail-Antispam: 1UD129KBjvAXoW3ur1xAry8Ar18XFy5GFyfJFb_yoW8CFWrZo
 WrGr4rZrWkCw1S9asI9F1Iqr17Xr4Dtws5Xa1DKFW0g3Z3WrWrXFW3trZxAay2qrs3AFWU
 Xa92qF15JF1kAryfn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUO07AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
 Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
 84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
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
X-List-Received-Date: Wed, 05 Apr 2023 08:58:31 -0000

Fix lines with over 80 characters for both code and comments.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c           |  3 +-
 target/riscv/cpu.h           |  4 +-
 target/riscv/cpu_helper.c    |  3 +-
 target/riscv/csr.c           | 38 ++++++++++--------
 target/riscv/debug.c         | 11 +++---
 target/riscv/gdbstub.c       |  3 +-
 target/riscv/pmp.c           |  6 ++-
 target/riscv/pmu.c           |  3 +-
 target/riscv/vector_helper.c | 76 ++++++++++++++++++++++++------------
 9 files changed, 91 insertions(+), 56 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2e45b1f076..cb68916fce 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1700,7 +1700,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
+                                 int max_str_len)
 {
     char *old = *isa_str;
     char *new = *isa_str;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5018a3b1b2..cbf3de2708 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -591,8 +591,8 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                               MMUAccessType access_type, int mmu_idx,
-                                               uintptr_t retaddr);
+                                               MMUAccessType access_type,
+                                               int mmu_idx, uintptr_t retaddr);
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 445ffe691a..2310c7905f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1121,7 +1121,8 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
             cs->exception_index = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
         } else {
             cs->exception_index = page_fault_exceptions ?
-                RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+                RISCV_EXCP_STORE_PAGE_FAULT :
+                RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
         }
         break;
     default:
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 76755ee128..e0b871f6dc 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1137,7 +1137,8 @@ static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP |
                                               SIP_LCOFIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
-static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
+static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
+                                               MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
 const bool valid_vm_1_10_32[16] = {
@@ -1298,7 +1299,8 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
 static RISCVException read_mstatus_i128(CPURISCVState *env, int csrno,
                                         Int128 *val)
 {
-    *val = int128_make128(env->mstatus, add_status_sd(MXL_RV128, env->mstatus));
+    *val = int128_make128(env->mstatus, add_status_sd(MXL_RV128,
+                                                      env->mstatus));
     return RISCV_EXCP_NONE;
 }
 
@@ -2823,7 +2825,8 @@ static RISCVException write_hstatus(CPURISCVState *env, int csrno,
 {
     env->hstatus = val;
     if (riscv_cpu_mxl(env) != MXL_RV32 && get_field(val, HSTATUS_VSXL) != 2) {
-        qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN options.");
+        qemu_log_mask(LOG_UNIMP,
+                      "QEMU does not support mixed HSXLEN options.");
     }
     if (get_field(val, HSTATUS_VSBE) != 0) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support big endian guests.");
@@ -3490,9 +3493,9 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
     target_ulong wpri_val = val & MMTE_MASK;
 
     if (val != wpri_val) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s" TARGET_FMT_lx "\n",
-                      "MMTE: WPRI violation written 0x", val,
-                      "vs expected 0x", wpri_val);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
+                      TARGET_FMT_lx "\n", "MMTE: WPRI violation written 0x",
+                      val, "vs expected 0x", wpri_val);
     }
     /* for machine mode pm.current is hardwired to 1 */
     wpri_val |= MMTE_M_PM_CURRENT;
@@ -3521,9 +3524,9 @@ static RISCVException write_smte(CPURISCVState *env, int csrno,
     target_ulong wpri_val = val & SMTE_MASK;
 
     if (val != wpri_val) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s" TARGET_FMT_lx "\n",
-                      "SMTE: WPRI violation written 0x", val,
-                      "vs expected 0x", wpri_val);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
+                      TARGET_FMT_lx "\n", "SMTE: WPRI violation written 0x",
+                      val, "vs expected 0x", wpri_val);
     }
 
     /* if pm.current==0 we can't modify current PM CSRs */
@@ -3549,9 +3552,9 @@ static RISCVException write_umte(CPURISCVState *env, int csrno,
     target_ulong wpri_val = val & UMTE_MASK;
 
     if (val != wpri_val) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s" TARGET_FMT_lx "\n",
-                      "UMTE: WPRI violation written 0x", val,
-                      "vs expected 0x", wpri_val);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s"
+                      TARGET_FMT_lx "\n", "UMTE: WPRI violation written 0x",
+                      val, "vs expected 0x", wpri_val);
     }
 
     if (check_pm_current_disabled(env, csrno)) {
@@ -3941,7 +3944,8 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
      * Fall back to 64-bit version for now, if the 128-bit alternative isn't
      * at all defined.
      * Note, some CSRs don't need to extend to MXLEN (64 upper bits non
-     * significant), for those, this fallback is correctly handling the accesses
+     * significant), for those, this fallback is correctly handling the
+     * accesses
      */
     target_ulong old_value;
     ret = riscv_csrrw_do64(env, csrno, &old_value,
@@ -4154,11 +4158,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus,
-                         NULL,                read_sstatus_i128               },
-    [CSR_SIE]        = { "sie",        smode, NULL,   NULL,    rmw_sie        },
-    [CSR_STVEC]      = { "stvec",      smode, read_stvec,      write_stvec    },
+                         NULL,                read_sstatus_i128              },
+    [CSR_SIE]        = { "sie",        smode, NULL,   NULL,    rmw_sie       },
+    [CSR_STVEC]      = { "stvec",      smode, read_stvec,      write_stvec   },
     [CSR_SCOUNTEREN] = { "scounteren", smode, read_scounteren,
-                         write_scounteren                                     },
+                         write_scounteren                                    },
 
     /* Supervisor Trap Handling */
     [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch,
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 1f7aed23c9..75ee1c4971 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -282,8 +282,8 @@ static target_ulong type2_mcontrol_validate(CPURISCVState *env,
     /* validate size encoding */
     size = type2_breakpoint_size(env, ctrl);
     if (access_size[size] == -1) {
-        qemu_log_mask(LOG_UNIMP, "access size %d is not supported, using SIZE_ANY\n",
-                      size);
+        qemu_log_mask(LOG_UNIMP, "access size %d is not supported, using "
+                                 "SIZE_ANY\n", size);
     } else {
         val |= (ctrl & TYPE2_SIZELO);
         if (riscv_cpu_mxl(env) == MXL_RV64) {
@@ -411,8 +411,8 @@ static target_ulong type6_mcontrol6_validate(CPURISCVState *env,
     /* validate size encoding */
     size = extract32(ctrl, 16, 4);
     if (access_size[size] == -1) {
-        qemu_log_mask(LOG_UNIMP, "access size %d is not supported, using SIZE_ANY\n",
-                      size);
+        qemu_log_mask(LOG_UNIMP, "access size %d is not supported, using "
+                                 "SIZE_ANY\n", size);
     } else {
         val |= (ctrl & TYPE6_SIZE);
     }
@@ -696,7 +696,8 @@ target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
     int trigger_type;
     switch (tdata_index) {
     case TDATA1:
-        trigger_type = extract_trigger_type(env, env->tdata1[env->trigger_cur]);
+        trigger_type = extract_trigger_type(env,
+                                            env->tdata1[env->trigger_cur]);
         if ((trigger_type == TRIGGER_TYPE_INST_CNT) && icount_enabled()) {
             return deposit64(env->tdata1[env->trigger_cur], 10, 14,
                              itrigger_get_adjust_count(env));
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 692bbb64f6..fa537aed74 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -321,7 +321,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
     if (env->misa_ext & RVV) {
         int base_reg = cs->gdb_num_regs;
-        gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set_vector,
+        gdb_register_coprocessor(cs, riscv_gdb_get_vector,
+                                 riscv_gdb_set_vector,
                                  ricsv_gen_dynamic_vector_xml(cs, base_reg),
                                  "riscv-vector.xml", 0);
     }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 6ab2ae81c7..1f5aca42e8 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -129,7 +129,8 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
     }
 }
 
-static void pmp_decode_napot(target_ulong a, target_ulong *sa, target_ulong *ea)
+static void pmp_decode_napot(target_ulong a, target_ulong *sa,
+                             target_ulong *ea)
 {
     /*
      * aaaa...aaa0   8-byte NAPOT range
@@ -217,7 +218,8 @@ static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index)
     pmp_update_rule_nums(env);
 }
 
-static int pmp_is_in_range(CPURISCVState *env, int pmp_index, target_ulong addr)
+static int pmp_is_in_range(CPURISCVState *env, int pmp_index,
+                           target_ulong addr)
 {
     int result = 0;
 
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 48ad60be2b..db06b3882f 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -419,7 +419,8 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr_idx)
     } else {
         return -1;
     }
-    overflow_at = (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + overflow_ns;
+    overflow_at = (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                  overflow_ns;
 
     if (overflow_at > INT64_MAX) {
         overflow_left += overflow_at - INT64_MAX;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 81ac85b7d5..f4d0438988 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -382,8 +382,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 }
 
 /*
- * masked unit-stride load and store operation will be a special case of stride,
- * stride = NF * sizeof (MTYPE)
+ * masked unit-stride load and store operation will be a special case of
+ * stride, stride = NF * sizeof (MTYPE)
  */
 
 #define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN)                            \
@@ -678,7 +678,8 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         /* load/store rest of elements of current segment pointed by vstart */
         for (pos = off; pos < max_elems; pos++, env->vstart++) {
             target_ulong addr = base + ((pos + k * max_elems) << log2_esz);
-            ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, vd,
+                      ra);
         }
         k++;
     }
@@ -1306,7 +1307,9 @@ GEN_VEXT_SHIFT_VV(vsra_vv_h, uint16_t, int16_t, H2, H2, DO_SRL, 0xf)
 GEN_VEXT_SHIFT_VV(vsra_vv_w, uint32_t, int32_t, H4, H4, DO_SRL, 0x1f)
 GEN_VEXT_SHIFT_VV(vsra_vv_d, uint64_t, int64_t, H8, H8, DO_SRL, 0x3f)
 
-/* generate the helpers for shift instructions with one vector and one scalar */
+/*
+ * generate the helpers for shift instructions with one vector and one scalar
+ */
 #define GEN_VEXT_SHIFT_VX(NAME, TD, TS2, HD, HS2, OP, MASK) \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
                   void *vs2, CPURISCVState *env,            \
@@ -2165,7 +2168,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
                  do_##NAME, ESZ);                               \
 }
 
-static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a,
+                             uint8_t b)
 {
     uint8_t res = a + b;
     if (res < a) {
@@ -2309,7 +2313,8 @@ static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
     return res;
 }
 
-static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a,
+                             int16_t b)
 {
     int16_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT16_MIN) {
@@ -2319,7 +2324,8 @@ static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
     return res;
 }
 
-static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a,
+                             int32_t b)
 {
     int32_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT32_MIN) {
@@ -2329,7 +2335,8 @@ static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return res;
 }
 
-static inline int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+static inline int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a,
+                             int64_t b)
 {
     int64_t res = a + b;
     if ((res ^ a) & (res ^ b) & INT64_MIN) {
@@ -2357,7 +2364,8 @@ GEN_VEXT_VX_RM(vsadd_vx_h, 2)
 GEN_VEXT_VX_RM(vsadd_vx_w, 4)
 GEN_VEXT_VX_RM(vsadd_vx_d, 8)
 
-static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a,
+                             uint8_t b)
 {
     uint8_t res = a - b;
     if (res > a) {
@@ -2428,7 +2436,8 @@ static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
     return res;
 }
 
-static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a,
+                             int16_t b)
 {
     int16_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT16_MIN) {
@@ -2438,7 +2447,8 @@ static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
     return res;
 }
 
-static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a,
+                             int32_t b)
 {
     int32_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT32_MIN) {
@@ -2448,7 +2458,8 @@ static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return res;
 }
 
-static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a,
+                             int64_t b)
 {
     int64_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT64_MIN) {
@@ -2504,7 +2515,8 @@ static inline uint8_t get_round(int vxrm, uint64_t v, uint8_t shift)
     return 0; /* round-down (truncate) */
 }
 
-static inline int32_t aadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+static inline int32_t aadd32(CPURISCVState *env, int vxrm, int32_t a,
+                             int32_t b)
 {
     int64_t res = (int64_t)a + b;
     uint8_t round = get_round(vxrm, res, 1);
@@ -2512,7 +2524,8 @@ static inline int32_t aadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return (res >> 1) + round;
 }
 
-static inline int64_t aadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+static inline int64_t aadd64(CPURISCVState *env, int vxrm, int64_t a,
+                             int64_t b)
 {
     int64_t res = a + b;
     uint8_t round = get_round(vxrm, res, 1);
@@ -2577,7 +2590,8 @@ GEN_VEXT_VX_RM(vaaddu_vx_h, 2)
 GEN_VEXT_VX_RM(vaaddu_vx_w, 4)
 GEN_VEXT_VX_RM(vaaddu_vx_d, 8)
 
-static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a,
+                             int32_t b)
 {
     int64_t res = (int64_t)a - b;
     uint8_t round = get_round(vxrm, res, 1);
@@ -2585,7 +2599,8 @@ static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
     return (res >> 1) + round;
 }
 
-static inline int64_t asub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+static inline int64_t asub64(CPURISCVState *env, int vxrm, int64_t a,
+                             int64_t b)
 {
     int64_t res = (int64_t)a - b;
     uint8_t round = get_round(vxrm, res, 1);
@@ -4498,7 +4513,9 @@ RVVCALL(OPFVV1, vfwcvt_x_f_v_w, WOP_UU_W, H8, H4, float32_to_int64)
 GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 4)
 GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 8)
 
-/* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width float */
+/*
+ * vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width float.
+ */
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_b, WOP_UU_B, H2, H1, uint8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
@@ -4515,8 +4532,7 @@ GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 4)
 GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 8)
 
 /*
- * vfwcvt.f.f.v vd, vs2, vm
- * Convert single-width float to double-width float.
+ * vfwcvt.f.f.v vd, vs2, vm # Convert single-width float to double-width float.
  */
 static uint32_t vfwcvtffv16(uint16_t a, float_status *s)
 {
@@ -4549,7 +4565,9 @@ GEN_VEXT_V_ENV(vfncvt_x_f_w_b, 1)
 GEN_VEXT_V_ENV(vfncvt_x_f_w_h, 2)
 GEN_VEXT_V_ENV(vfncvt_x_f_w_w, 4)
 
-/* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to float */
+/*
+ * vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to float.
+ */
 RVVCALL(OPFVV1, vfncvt_f_xu_w_h, NOP_UU_H, H2, H4, uint32_to_float16)
 RVVCALL(OPFVV1, vfncvt_f_xu_w_w, NOP_UU_W, H4, H8, uint64_to_float32)
 GEN_VEXT_V_ENV(vfncvt_f_xu_w_h, 2)
@@ -4699,14 +4717,20 @@ GEN_VEXT_FRED(vfredosum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
 GEN_VEXT_FRED(vfredosum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
 
 /* Maximum value */
-GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maximum_number)
-GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maximum_number)
-GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2,
+              float16_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4,
+              float32_maximum_number)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8,
+              float64_maximum_number)
 
 /* Minimum value */
-GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minimum_number)
-GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minimum_number)
-GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2,
+              float16_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4,
+              float32_minimum_number)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8,
+              float64_minimum_number)
 
 /* Vector Widening Floating-Point Add Instructions */
 static uint32_t fwadd16(uint32_t a, uint16_t b, float_status *s)
-- 
2.25.1


