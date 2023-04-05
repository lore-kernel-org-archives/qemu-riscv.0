Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjyyR-0000iw-Mr
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 04:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjyyP-0000hJ-W5; Wed, 05 Apr 2023 04:58:34 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjyyI-0003D1-Ru; Wed, 05 Apr 2023 04:58:33 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAAH+BQoOC1kWY5GDg--.24854S4;
 Wed, 05 Apr 2023 16:58:19 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 2/4] target/riscv: Fix format for indentation
Date: Wed,  5 Apr 2023 16:58:11 +0800
Message-Id: <20230405085813.40643-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
References: <20230405085813.40643-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAH+BQoOC1kWY5GDg--.24854S4
X-Coremail-Antispam: 1UD129KBjvAXoWDXFWDWw4rKFyDKr45GrWUCFg_yoWrCFy8Go
 WfJF4Yyr1fKw1fC3s3ursaqr12gr4Dtws5JFs8KrWSgas7XrWfKFW7tws2vF47tr4fGFWU
 Zan3t3WrAFn7Aryfn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUOU7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r15M28IrcIa0x
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
 1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbdOz7UU
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
X-List-Received-Date: Wed, 05 Apr 2023 08:58:34 -0000

Fix identation problems, and try to use the same indentation strategy
in the same file.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/arch_dump.c                |   4 +-
 target/riscv/cpu.c                      |  40 +++---
 target/riscv/cpu_helper.c               | 163 ++++++++++++------------
 target/riscv/fpu_helper.c               |  24 ++--
 target/riscv/insn_trans/trans_rvv.c.inc |  28 ++--
 target/riscv/m128_helper.c              |  16 +--
 target/riscv/machine.c                  |  18 +--
 target/riscv/op_helper.c                |   4 +-
 target/riscv/pmp.c                      |  19 +--
 target/riscv/pmp.h                      |   9 +-
 target/riscv/translate.c                |   4 +-
 target/riscv/vector_helper.c            | 159 +++++++++++------------
 12 files changed, 247 insertions(+), 241 deletions(-)

diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
index 736a232956..573587810e 100644
--- a/target/riscv/arch_dump.c
+++ b/target/riscv/arch_dump.c
@@ -180,8 +180,8 @@ int cpu_get_dump_info(ArchDumpInfo *info,
     info->d_class = ELFCLASS32;
 #endif
 
-    info->d_endian = (env->mstatus & MSTATUS_UBE) != 0
-                     ? ELFDATA2MSB : ELFDATA2LSB;
+    info->d_endian = (env->mstatus & MSTATUS_UBE) != 0 ?
+                     ELFDATA2MSB : ELFDATA2LSB;
 
     return 0;
 }
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c304deabd7..8ed8601399 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -54,7 +54,7 @@ struct isa_ext_data {
 };
 
 #define ISA_EXT_DATA_ENTRY(_name, _m_letter, _min_ver, _prop) \
-{#_name, _m_letter, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
+    {#_name, _m_letter, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
 
 /**
  * Here are the ordering rules of extension naming defined by RISC-V
@@ -157,29 +157,29 @@ static void isa_ext_update_enabled(RISCVCPU *cpu,
 }
 
 const char * const riscv_int_regnames[] = {
-  "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
-  "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
-  "x14/a4",  "x15/a5", "x16/a6", "x17/a7", "x18/s2", "x19/s3",  "x20/s4",
-  "x21/s5",  "x22/s6", "x23/s7", "x24/s8", "x25/s9", "x26/s10", "x27/s11",
-  "x28/t3",  "x29/t4", "x30/t5", "x31/t6"
+    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
+    "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
+    "x14/a4",  "x15/a5", "x16/a6", "x17/a7", "x18/s2", "x19/s3",  "x20/s4",
+    "x21/s5",  "x22/s6", "x23/s7", "x24/s8", "x25/s9", "x26/s10", "x27/s11",
+    "x28/t3",  "x29/t4", "x30/t5", "x31/t6"
 };
 
 const char * const riscv_int_regnamesh[] = {
-  "x0h/zeroh", "x1h/rah",  "x2h/sph",   "x3h/gph",   "x4h/tph",  "x5h/t0h",
-  "x6h/t1h",   "x7h/t2h",  "x8h/s0h",   "x9h/s1h",   "x10h/a0h", "x11h/a1h",
-  "x12h/a2h",  "x13h/a3h", "x14h/a4h",  "x15h/a5h",  "x16h/a6h", "x17h/a7h",
-  "x18h/s2h",  "x19h/s3h", "x20h/s4h",  "x21h/s5h",  "x22h/s6h", "x23h/s7h",
-  "x24h/s8h",  "x25h/s9h", "x26h/s10h", "x27h/s11h", "x28h/t3h", "x29h/t4h",
-  "x30h/t5h",  "x31h/t6h"
+    "x0h/zeroh", "x1h/rah",  "x2h/sph",   "x3h/gph",   "x4h/tph",  "x5h/t0h",
+    "x6h/t1h",   "x7h/t2h",  "x8h/s0h",   "x9h/s1h",   "x10h/a0h", "x11h/a1h",
+    "x12h/a2h",  "x13h/a3h", "x14h/a4h",  "x15h/a5h",  "x16h/a6h", "x17h/a7h",
+    "x18h/s2h",  "x19h/s3h", "x20h/s4h",  "x21h/s5h",  "x22h/s6h", "x23h/s7h",
+    "x24h/s8h",  "x25h/s9h", "x26h/s10h", "x27h/s11h", "x28h/t3h", "x29h/t4h",
+    "x30h/t5h",  "x31h/t6h"
 };
 
 const char * const riscv_fpr_regnames[] = {
-  "f0/ft0",   "f1/ft1",  "f2/ft2",   "f3/ft3",   "f4/ft4",  "f5/ft5",
-  "f6/ft6",   "f7/ft7",  "f8/fs0",   "f9/fs1",   "f10/fa0", "f11/fa1",
-  "f12/fa2",  "f13/fa3", "f14/fa4",  "f15/fa5",  "f16/fa6", "f17/fa7",
-  "f18/fs2",  "f19/fs3", "f20/fs4",  "f21/fs5",  "f22/fs6", "f23/fs7",
-  "f24/fs8",  "f25/fs9", "f26/fs10", "f27/fs11", "f28/ft8", "f29/ft9",
-  "f30/ft10", "f31/ft11"
+    "f0/ft0",   "f1/ft1",  "f2/ft2",   "f3/ft3",   "f4/ft4",  "f5/ft5",
+    "f6/ft6",   "f7/ft7",  "f8/fs0",   "f9/fs1",   "f10/fa0", "f11/fa1",
+    "f12/fa2",  "f13/fa3", "f14/fa4",  "f15/fa5",  "f16/fa6", "f17/fa7",
+    "f18/fs2",  "f19/fs3", "f20/fs4",  "f21/fs5",  "f22/fs6", "f23/fs7",
+    "f24/fs8",  "f25/fs9", "f26/fs10", "f27/fs11", "f28/ft8", "f29/ft9",
+    "f30/ft10", "f31/ft11"
 };
 
 static const char * const riscv_excp_names[] = {
@@ -351,8 +351,8 @@ static void riscv_any_cpu_init(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj),
-            riscv_cpu_mxl(&RISCV_CPU(obj)->env) == MXL_RV32 ?
-                                    VM_1_10_SV32 : VM_1_10_SV57);
+        riscv_cpu_mxl(&RISCV_CPU(obj)->env) == MXL_RV32 ?
+        VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
     set_priv_version(env, PRIV_VERSION_1_12_0);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index fbcdec3c06..8d2547a164 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -68,12 +68,12 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
         flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
         flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
-                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
+                           FIELD_EX64(env->vtype, VTYPE, VLMUL));
         flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
         flags = FIELD_DP32(flags, TB_FLAGS, VTA,
-                    FIELD_EX64(env->vtype, VTYPE, VTA));
+                           FIELD_EX64(env->vtype, VTYPE, VTA));
         flags = FIELD_DP32(flags, TB_FLAGS, VMA,
-                    FIELD_EX64(env->vtype, VTYPE, VMA));
+                           FIELD_EX64(env->vtype, VTYPE, VMA));
     } else {
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
@@ -95,7 +95,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         if (env->priv == PRV_M ||
             (env->priv == PRV_S && !env->virt_enabled) ||
             (env->priv == PRV_U && !env->virt_enabled &&
-                get_field(env->hstatus, HSTATUS_HU))) {
+             get_field(env->hstatus, HSTATUS_HU))) {
             flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
 
@@ -230,75 +230,75 @@ int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero)
  * ----------------------------------------------------------------
  */
 static const uint8_t default_iprio[64] = {
- /* Custom interrupts 48 to 63 */
- [63] = IPRIO_MMAXIPRIO,
- [62] = IPRIO_MMAXIPRIO,
- [61] = IPRIO_MMAXIPRIO,
- [60] = IPRIO_MMAXIPRIO,
- [59] = IPRIO_MMAXIPRIO,
- [58] = IPRIO_MMAXIPRIO,
- [57] = IPRIO_MMAXIPRIO,
- [56] = IPRIO_MMAXIPRIO,
- [55] = IPRIO_MMAXIPRIO,
- [54] = IPRIO_MMAXIPRIO,
- [53] = IPRIO_MMAXIPRIO,
- [52] = IPRIO_MMAXIPRIO,
- [51] = IPRIO_MMAXIPRIO,
- [50] = IPRIO_MMAXIPRIO,
- [49] = IPRIO_MMAXIPRIO,
- [48] = IPRIO_MMAXIPRIO,
-
- /* Custom interrupts 24 to 31 */
- [31] = IPRIO_MMAXIPRIO,
- [30] = IPRIO_MMAXIPRIO,
- [29] = IPRIO_MMAXIPRIO,
- [28] = IPRIO_MMAXIPRIO,
- [27] = IPRIO_MMAXIPRIO,
- [26] = IPRIO_MMAXIPRIO,
- [25] = IPRIO_MMAXIPRIO,
- [24] = IPRIO_MMAXIPRIO,
-
- [47] = IPRIO_DEFAULT_UPPER,
- [23] = IPRIO_DEFAULT_UPPER + 1,
- [46] = IPRIO_DEFAULT_UPPER + 2,
- [45] = IPRIO_DEFAULT_UPPER + 3,
- [22] = IPRIO_DEFAULT_UPPER + 4,
- [44] = IPRIO_DEFAULT_UPPER + 5,
-
- [43] = IPRIO_DEFAULT_UPPER + 6,
- [21] = IPRIO_DEFAULT_UPPER + 7,
- [42] = IPRIO_DEFAULT_UPPER + 8,
- [41] = IPRIO_DEFAULT_UPPER + 9,
- [20] = IPRIO_DEFAULT_UPPER + 10,
- [40] = IPRIO_DEFAULT_UPPER + 11,
-
- [11] = IPRIO_DEFAULT_M,
- [3]  = IPRIO_DEFAULT_M + 1,
- [7]  = IPRIO_DEFAULT_M + 2,
-
- [9]  = IPRIO_DEFAULT_S,
- [1]  = IPRIO_DEFAULT_S + 1,
- [5]  = IPRIO_DEFAULT_S + 2,
-
- [12] = IPRIO_DEFAULT_SGEXT,
-
- [10] = IPRIO_DEFAULT_VS,
- [2]  = IPRIO_DEFAULT_VS + 1,
- [6]  = IPRIO_DEFAULT_VS + 2,
-
- [39] = IPRIO_DEFAULT_LOWER,
- [19] = IPRIO_DEFAULT_LOWER + 1,
- [38] = IPRIO_DEFAULT_LOWER + 2,
- [37] = IPRIO_DEFAULT_LOWER + 3,
- [18] = IPRIO_DEFAULT_LOWER + 4,
- [36] = IPRIO_DEFAULT_LOWER + 5,
-
- [35] = IPRIO_DEFAULT_LOWER + 6,
- [17] = IPRIO_DEFAULT_LOWER + 7,
- [34] = IPRIO_DEFAULT_LOWER + 8,
- [33] = IPRIO_DEFAULT_LOWER + 9,
- [16] = IPRIO_DEFAULT_LOWER + 10,
- [32] = IPRIO_DEFAULT_LOWER + 11,
+    /* Custom interrupts 48 to 63 */
+    [63] = IPRIO_MMAXIPRIO,
+    [62] = IPRIO_MMAXIPRIO,
+    [61] = IPRIO_MMAXIPRIO,
+    [60] = IPRIO_MMAXIPRIO,
+    [59] = IPRIO_MMAXIPRIO,
+    [58] = IPRIO_MMAXIPRIO,
+    [57] = IPRIO_MMAXIPRIO,
+    [56] = IPRIO_MMAXIPRIO,
+    [55] = IPRIO_MMAXIPRIO,
+    [54] = IPRIO_MMAXIPRIO,
+    [53] = IPRIO_MMAXIPRIO,
+    [52] = IPRIO_MMAXIPRIO,
+    [51] = IPRIO_MMAXIPRIO,
+    [50] = IPRIO_MMAXIPRIO,
+    [49] = IPRIO_MMAXIPRIO,
+    [48] = IPRIO_MMAXIPRIO,
+
+    /* Custom interrupts 24 to 31 */
+    [31] = IPRIO_MMAXIPRIO,
+    [30] = IPRIO_MMAXIPRIO,
+    [29] = IPRIO_MMAXIPRIO,
+    [28] = IPRIO_MMAXIPRIO,
+    [27] = IPRIO_MMAXIPRIO,
+    [26] = IPRIO_MMAXIPRIO,
+    [25] = IPRIO_MMAXIPRIO,
+    [24] = IPRIO_MMAXIPRIO,
+
+    [47] = IPRIO_DEFAULT_UPPER,
+    [23] = IPRIO_DEFAULT_UPPER + 1,
+    [46] = IPRIO_DEFAULT_UPPER + 2,
+    [45] = IPRIO_DEFAULT_UPPER + 3,
+    [22] = IPRIO_DEFAULT_UPPER + 4,
+    [44] = IPRIO_DEFAULT_UPPER + 5,
+
+    [43] = IPRIO_DEFAULT_UPPER + 6,
+    [21] = IPRIO_DEFAULT_UPPER + 7,
+    [42] = IPRIO_DEFAULT_UPPER + 8,
+    [41] = IPRIO_DEFAULT_UPPER + 9,
+    [20] = IPRIO_DEFAULT_UPPER + 10,
+    [40] = IPRIO_DEFAULT_UPPER + 11,
+
+    [11] = IPRIO_DEFAULT_M,
+    [3]  = IPRIO_DEFAULT_M + 1,
+    [7]  = IPRIO_DEFAULT_M + 2,
+
+    [9]  = IPRIO_DEFAULT_S,
+    [1]  = IPRIO_DEFAULT_S + 1,
+    [5]  = IPRIO_DEFAULT_S + 2,
+
+    [12] = IPRIO_DEFAULT_SGEXT,
+
+    [10] = IPRIO_DEFAULT_VS,
+    [2]  = IPRIO_DEFAULT_VS + 1,
+    [6]  = IPRIO_DEFAULT_VS + 2,
+
+    [39] = IPRIO_DEFAULT_LOWER,
+    [19] = IPRIO_DEFAULT_LOWER + 1,
+    [38] = IPRIO_DEFAULT_LOWER + 2,
+    [37] = IPRIO_DEFAULT_LOWER + 3,
+    [18] = IPRIO_DEFAULT_LOWER + 4,
+    [36] = IPRIO_DEFAULT_LOWER + 5,
+
+    [35] = IPRIO_DEFAULT_LOWER + 6,
+    [17] = IPRIO_DEFAULT_LOWER + 7,
+    [34] = IPRIO_DEFAULT_LOWER + 8,
+    [33] = IPRIO_DEFAULT_LOWER + 9,
+    [16] = IPRIO_DEFAULT_LOWER + 10,
+    [32] = IPRIO_DEFAULT_LOWER + 11,
 };
 
 uint8_t riscv_cpu_default_priority(int irq)
@@ -1001,8 +1001,8 @@ restart:
                  */
                 MemoryRegion *mr;
                 hwaddr l = sizeof(target_ulong), addr1;
-                mr = address_space_translate(cs->as, pte_addr,
-                    &addr1, &l, false, MEMTXATTRS_UNSPECIFIED);
+                mr = address_space_translate(cs->as, pte_addr, &addr1, &l,
+                                             false, MEMTXATTRS_UNSPECIFIED);
                 if (memory_region_is_ram(mr)) {
                     target_ulong *pte_pa =
                         qemu_map_ram_ptr(mr->ram_block, addr1);
@@ -1052,7 +1052,7 @@ restart:
             /* add write permission on stores or if the page is already dirty,
                so that we TLB miss on later writes to update the dirty bit */
             if ((pte & PTE_W) &&
-                    (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
+                (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
                 *prot |= PAGE_WRITE;
             }
             return TRANSLATE_SUCCESS;
@@ -1281,9 +1281,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                                        false);
 
             qemu_log_mask(CPU_LOG_MMU,
-                    "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
-                    HWADDR_FMT_plx " prot %d\n",
-                    __func__, im_address, ret, pa, prot2);
+                          "%s 2nd-stage address=%" VADDR_PRIx
+                          " ret %d physical "
+                          HWADDR_FMT_plx " prot %d\n",
+                          __func__, im_address, ret, pa, prot2);
 
             prot &= prot2;
 
@@ -1718,7 +1719,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->htval = htval;
         env->htinst = tinst;
         env->pc = (env->stvec >> 2 << 2) +
-            ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
+                  ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_S);
     } else {
         /* handle the trap in M-mode */
@@ -1749,7 +1750,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mtval2 = mtval2;
         env->mtinst = tinst;
         env->pc = (env->mtvec >> 2 << 2) +
-            ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
+                  ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_M);
     }
 
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 449d236df6..5dd14d8390 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -248,8 +248,8 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     float32 frs1 = check_nanbox_s(env, rs1);
     float32 frs2 = check_nanbox_s(env, rs2);
     return nanbox_s(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
-                    float32_minnum(frs1, frs2, &env->fp_status) :
-                    float32_minimum_number(frs1, frs2, &env->fp_status));
+                         float32_minnum(frs1, frs2, &env->fp_status) :
+                         float32_minimum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
@@ -257,8 +257,8 @@ uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     float32 frs1 = check_nanbox_s(env, rs1);
     float32 frs2 = check_nanbox_s(env, rs2);
     return nanbox_s(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
-                    float32_maxnum(frs1, frs2, &env->fp_status) :
-                    float32_maximum_number(frs1, frs2, &env->fp_status));
+                         float32_maxnum(frs1, frs2, &env->fp_status) :
+                         float32_maximum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
@@ -361,15 +361,15 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
     return env->priv_ver < PRIV_VERSION_1_11_0 ?
-            float64_minnum(frs1, frs2, &env->fp_status) :
-            float64_minimum_number(frs1, frs2, &env->fp_status);
+           float64_minnum(frs1, frs2, &env->fp_status) :
+           float64_minimum_number(frs1, frs2, &env->fp_status);
 }
 
 uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
     return env->priv_ver < PRIV_VERSION_1_11_0 ?
-            float64_maxnum(frs1, frs2, &env->fp_status) :
-            float64_maximum_number(frs1, frs2, &env->fp_status);
+           float64_maxnum(frs1, frs2, &env->fp_status) :
+           float64_maximum_number(frs1, frs2, &env->fp_status);
 }
 
 uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
@@ -481,8 +481,8 @@ uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     float16 frs1 = check_nanbox_h(env, rs1);
     float16 frs2 = check_nanbox_h(env, rs2);
     return nanbox_h(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
-                    float16_minnum(frs1, frs2, &env->fp_status) :
-                    float16_minimum_number(frs1, frs2, &env->fp_status));
+                         float16_minnum(frs1, frs2, &env->fp_status) :
+                         float16_minimum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
@@ -490,8 +490,8 @@ uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     float16 frs1 = check_nanbox_h(env, rs1);
     float16 frs2 = check_nanbox_h(env, rs2);
     return nanbox_h(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
-                    float16_maxnum(frs1, frs2, &env->fp_status) :
-                    float16_maximum_number(frs1, frs2, &env->fp_status));
+                         float16_maxnum(frs1, frs2, &env->fp_status) :
+                         float16_maximum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f2e3d38515..8e43bfc07c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -238,8 +238,8 @@ static bool vext_check_store(DisasContext *s, int vd, int nf, uint8_t eew)
 {
     int8_t emul = eew - s->sew + s->lmul;
     return (emul >= -3 && emul <= 3) &&
-            require_align(vd, emul) &&
-            require_nf(vd, nf, emul);
+           require_align(vd, emul) &&
+           require_nf(vd, nf, emul);
 }
 
 /*
@@ -315,7 +315,7 @@ static bool vext_check_ld_index(DisasContext *s, int vd, int vs2,
     int8_t seg_vd;
     int8_t emul = eew - s->sew + s->lmul;
     bool ret = vext_check_st_index(s, vd, vs2, nf, eew) &&
-        require_vm(vm, vd);
+               require_vm(vm, vd);
 
     /* Each segment register group has to follow overlap rules. */
     for (int i = 0; i < nf; ++i) {
@@ -345,8 +345,8 @@ static bool vext_check_ld_index(DisasContext *s, int vd, int vs2,
 static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
 {
     return require_vm(vm, vd) &&
-        require_align(vd, s->lmul) &&
-        require_align(vs, s->lmul);
+           require_align(vd, s->lmul) &&
+           require_align(vs, s->lmul);
 }
 
 /*
@@ -365,7 +365,7 @@ static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
 static bool vext_check_sss(DisasContext *s, int vd, int vs1, int vs2, int vm)
 {
     return vext_check_ss(s, vd, vs2, vm) &&
-        require_align(vs1, s->lmul);
+           require_align(vs1, s->lmul);
 }
 
 static bool vext_check_ms(DisasContext *s, int vd, int vs)
@@ -396,7 +396,7 @@ static bool vext_check_ms(DisasContext *s, int vd, int vs)
 static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2)
 {
     bool ret = vext_check_ms(s, vd, vs2) &&
-        require_align(vs1, s->lmul);
+               require_align(vs1, s->lmul);
     if (vd != vs1) {
         ret &= require_noover(vd, 0, vs1, s->lmul);
     }
@@ -460,14 +460,14 @@ static bool vext_narrow_check_common(DisasContext *s, int vd, int vs2,
 static bool vext_check_ds(DisasContext *s, int vd, int vs, int vm)
 {
     return vext_wide_check_common(s, vd, vm) &&
-        require_align(vs, s->lmul) &&
-        require_noover(vd, s->lmul + 1, vs, s->lmul);
+           require_align(vs, s->lmul) &&
+           require_noover(vd, s->lmul + 1, vs, s->lmul);
 }
 
 static bool vext_check_dd(DisasContext *s, int vd, int vs, int vm)
 {
     return vext_wide_check_common(s, vd, vm) &&
-        require_align(vs, s->lmul + 1);
+           require_align(vs, s->lmul + 1);
 }
 
 /*
@@ -485,8 +485,8 @@ static bool vext_check_dd(DisasContext *s, int vd, int vs, int vm)
 static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2, int vm)
 {
     return vext_check_ds(s, vd, vs2, vm) &&
-        require_align(vs1, s->lmul) &&
-        require_noover(vd, s->lmul + 1, vs1, s->lmul);
+           require_align(vs1, s->lmul) &&
+           require_noover(vd, s->lmul + 1, vs1, s->lmul);
 }
 
 /*
@@ -507,7 +507,7 @@ static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2, int vm)
 static bool vext_check_dds(DisasContext *s, int vd, int vs1, int vs2, int vm)
 {
     return vext_check_ds(s, vd, vs1, vm) &&
-        require_align(vs2, s->lmul + 1);
+           require_align(vs2, s->lmul + 1);
 }
 
 static bool vext_check_sd(DisasContext *s, int vd, int vs, int vm)
@@ -535,7 +535,7 @@ static bool vext_check_sd(DisasContext *s, int vd, int vs, int vm)
 static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2, int vm)
 {
     return vext_check_sd(s, vd, vs2, vm) &&
-        require_align(vs1, s->lmul);
+           require_align(vs1, s->lmul);
 }
 
 /*
diff --git a/target/riscv/m128_helper.c b/target/riscv/m128_helper.c
index 7bf115b85e..e6a4f6120a 100644
--- a/target/riscv/m128_helper.c
+++ b/target/riscv/m128_helper.c
@@ -24,8 +24,8 @@
 #include "exec/helper-proto.h"
 
 target_ulong HELPER(divu_i128)(CPURISCVState *env,
-                       target_ulong ul, target_ulong uh,
-                       target_ulong vl, target_ulong vh)
+                               target_ulong ul, target_ulong uh,
+                               target_ulong vl, target_ulong vh)
 {
     target_ulong ql, qh;
     Int128 q;
@@ -44,8 +44,8 @@ target_ulong HELPER(divu_i128)(CPURISCVState *env,
 }
 
 target_ulong HELPER(remu_i128)(CPURISCVState *env,
-                       target_ulong ul, target_ulong uh,
-                       target_ulong vl, target_ulong vh)
+                               target_ulong ul, target_ulong uh,
+                               target_ulong vl, target_ulong vh)
 {
     target_ulong rl, rh;
     Int128 r;
@@ -64,8 +64,8 @@ target_ulong HELPER(remu_i128)(CPURISCVState *env,
 }
 
 target_ulong HELPER(divs_i128)(CPURISCVState *env,
-                       target_ulong ul, target_ulong uh,
-                       target_ulong vl, target_ulong vh)
+                               target_ulong ul, target_ulong uh,
+                               target_ulong vl, target_ulong vh)
 {
     target_ulong qh, ql;
     Int128 q;
@@ -89,8 +89,8 @@ target_ulong HELPER(divs_i128)(CPURISCVState *env,
 }
 
 target_ulong HELPER(rems_i128)(CPURISCVState *env,
-                       target_ulong ul, target_ulong uh,
-                       target_ulong vl, target_ulong vh)
+                               target_ulong ul, target_ulong uh,
+                               target_ulong vl, target_ulong vh)
 {
     target_ulong rh, rl;
     Int128 r;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 8869346089..3ce2970785 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -136,15 +136,15 @@ static const VMStateDescription vmstate_vector = {
     .minimum_version_id = 2,
     .needed = vector_needed,
     .fields = (VMStateField[]) {
-            VMSTATE_UINT64_ARRAY(env.vreg, RISCVCPU, 32 * RV_VLEN_MAX / 64),
-            VMSTATE_UINTTL(env.vxrm, RISCVCPU),
-            VMSTATE_UINTTL(env.vxsat, RISCVCPU),
-            VMSTATE_UINTTL(env.vl, RISCVCPU),
-            VMSTATE_UINTTL(env.vstart, RISCVCPU),
-            VMSTATE_UINTTL(env.vtype, RISCVCPU),
-            VMSTATE_BOOL(env.vill, RISCVCPU),
-            VMSTATE_END_OF_LIST()
-        }
+        VMSTATE_UINT64_ARRAY(env.vreg, RISCVCPU, 32 * RV_VLEN_MAX / 64),
+        VMSTATE_UINTTL(env.vxrm, RISCVCPU),
+        VMSTATE_UINTTL(env.vxsat, RISCVCPU),
+        VMSTATE_UINTTL(env.vl, RISCVCPU),
+        VMSTATE_UINTTL(env.vstart, RISCVCPU),
+        VMSTATE_UINTTL(env.vtype, RISCVCPU),
+        VMSTATE_BOOL(env.vill, RISCVCPU),
+        VMSTATE_END_OF_LIST()
+    }
 };
 
 static bool pointermasking_needed(void *opaque)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index c0c4ced7f0..ec9a384772 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -367,8 +367,8 @@ void helper_wfi(CPURISCVState *env)
     if (((prv_s || (!rvs && prv_u)) && get_field(env->mstatus, MSTATUS_TW)) ||
         (rvs && prv_u && !env->virt_enabled)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
-    } else if (env->virt_enabled && (prv_u ||
-        (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
+    } else if (env->virt_enabled &&
+               (prv_u || (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
         cs->halted = 1;
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index a08cd95658..3943b0f2e3 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -27,7 +27,7 @@
 #include "exec/exec-all.h"
 
 static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
-    uint8_t val);
+                          uint8_t val);
 static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
 static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index);
 
@@ -220,8 +220,8 @@ static int pmp_is_in_range(CPURISCVState *env, int pmp_index, target_ulong addr)
 {
     int result = 0;
 
-    if ((addr >= env->pmp_state.addr[pmp_index].sa)
-        && (addr <= env->pmp_state.addr[pmp_index].ea)) {
+    if ((addr >= env->pmp_state.addr[pmp_index].sa) &&
+        (addr <= env->pmp_state.addr[pmp_index].ea)) {
         result = 1;
     } else {
         result = 0;
@@ -234,8 +234,9 @@ static int pmp_is_in_range(CPURISCVState *env, int pmp_index, target_ulong addr)
  * Check if the address has required RWX privs when no PMP entry is matched.
  */
 static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
-    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
-    target_ulong mode)
+                                       target_ulong size, pmp_priv_t privs,
+                                       pmp_priv_t *allowed_privs,
+                                       target_ulong mode)
 {
     bool ret;
 
@@ -297,8 +298,8 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
  * Return negtive value if no match
  */
 int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
-    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
-    target_ulong mode)
+                       target_ulong size, pmp_priv_t privs,
+                       pmp_priv_t *allowed_privs, target_ulong mode)
 {
     int i = 0;
     int ret = -1;
@@ -466,7 +467,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
  * Handle a write to a pmpcfg CSR
  */
 void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
-    target_ulong val)
+                      target_ulong val)
 {
     int i;
     uint8_t cfg_val;
@@ -508,7 +509,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
  * Handle a write to a pmpaddr CSR
  */
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
-    target_ulong val)
+                       target_ulong val)
 {
     trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
 
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index da32c61c85..b296ea1fc6 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -63,18 +63,19 @@ typedef struct {
 } pmp_table_t;
 
 void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
-    target_ulong val);
+                      target_ulong val);
 target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index);
 
 void mseccfg_csr_write(CPURISCVState *env, target_ulong val);
 target_ulong mseccfg_csr_read(CPURISCVState *env);
 
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
-    target_ulong val);
+                       target_ulong val);
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
 int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
-    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
-    target_ulong mode);
+                       target_ulong size, pmp_priv_t privs,
+                       pmp_priv_t *allowed_privs,
+                       target_ulong mode);
 target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
                               target_ulong tlb_sa, target_ulong tlb_ea);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 03748f72e6..3613aca28d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -746,8 +746,8 @@ EX_SH(12)
 } while (0)
 
 #define REQUIRE_EITHER_EXT(ctx, A, B) do {       \
-    if (!ctx->cfg_ptr->ext_##A &&      \
-        !ctx->cfg_ptr->ext_##B) {      \
+    if (!ctx->cfg_ptr->ext_##A &&                \
+        !ctx->cfg_ptr->ext_##B) {                \
         return false;                            \
     }                                            \
 } while (0)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 2423affe37..6067b5cfc7 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -50,10 +50,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
         }
     }
 
-    if ((sew > cpu->cfg.elen)
-        || vill
-        || (ediv != 0)
-        || (reserved != 0)) {
+    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
         /* only set vill bit. */
         env->vill = 1;
         env->vtype = 0;
@@ -1116,7 +1113,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
                                                                          \
         *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
     }                                                                    \
-    env->vstart = 0;                                          \
+    env->vstart = 0;                                                     \
     /* set tail elements to 1s */                                        \
     vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);             \
 }
@@ -1308,7 +1305,8 @@ GEN_VEXT_SHIFT_VV(vsra_vv_d, uint64_t, int64_t, H8, H8, DO_SRL, 0x3f)
 /* generate the helpers for shift instructions with one vector and one scalar */
 #define GEN_VEXT_SHIFT_VX(NAME, TD, TS2, HD, HS2, OP, MASK) \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
-        void *vs2, CPURISCVState *env, uint32_t desc)       \
+                  void *vs2, CPURISCVState *env,            \
+                  uint32_t desc)                            \
 {                                                           \
     uint32_t vm = vext_vm(desc);                            \
     uint32_t vl = env->vl;                                  \
@@ -1735,9 +1733,9 @@ GEN_VEXT_VX(vmulhsu_vx_d, 8)
 /* Vector Integer Divide Instructions */
 #define DO_DIVU(N, M) (unlikely(M == 0) ? (__typeof(N))(-1) : N / M)
 #define DO_REMU(N, M) (unlikely(M == 0) ? N : N % M)
-#define DO_DIV(N, M)  (unlikely(M == 0) ? (__typeof(N))(-1) :\
+#define DO_DIV(N, M)  (unlikely(M == 0) ? (__typeof(N))(-1) : \
         unlikely((N == -N) && (M == (__typeof(N))(-1))) ? N : N / M)
-#define DO_REM(N, M)  (unlikely(M == 0) ? N :\
+#define DO_REM(N, M)  (unlikely(M == 0) ? N : \
         unlikely((N == -N) && (M == (__typeof(N))(-1))) ? 0 : N % M)
 
 RVVCALL(OPIVV2, vdivu_vv_b, OP_UUU_B, H1, H1, H1, DO_DIVU)
@@ -1846,7 +1844,7 @@ GEN_VEXT_VX(vwmulsu_vx_h, 4)
 GEN_VEXT_VX(vwmulsu_vx_w, 8)
 
 /* Vector Single-Width Integer Multiply-Add Instructions */
-#define OPIVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
+#define OPIVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)       \
 static void do_##NAME(void *vd, void *vs1, void *vs2, int i)       \
 {                                                                  \
     TX1 s1 = *((T1 *)vs1 + HS1(i));                                \
@@ -2277,7 +2275,8 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
 /* generate helpers for fixed point instructions with OPIVX format */
 #define GEN_VEXT_VX_RM(NAME, ESZ)                         \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
-        void *vs2, CPURISCVState *env, uint32_t desc)     \
+                  void *vs2, CPURISCVState *env,          \
+                  uint32_t desc)                          \
 {                                                         \
     vext_vx_rm_2(vd, v0, s1, vs2, env, desc,              \
                  do_##NAME, ESZ);                         \
@@ -2651,7 +2650,7 @@ static inline int8_t vsmul8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 
     res = (int16_t)a * (int16_t)b;
     round = get_round(vxrm, res, 7);
-    res   = (res >> 7) + round;
+    res = (res >> 7) + round;
 
     if (res > INT8_MAX) {
         env->vxsat = 0x1;
@@ -2671,7 +2670,7 @@ static int16_t vsmul16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 
     res = (int32_t)a * (int32_t)b;
     round = get_round(vxrm, res, 15);
-    res   = (res >> 15) + round;
+    res = (res >> 15) + round;
 
     if (res > INT16_MAX) {
         env->vxsat = 0x1;
@@ -2691,7 +2690,7 @@ static int32_t vsmul32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 
     res = (int64_t)a * (int64_t)b;
     round = get_round(vxrm, res, 31);
-    res   = (res >> 31) + round;
+    res = (res >> 31) + round;
 
     if (res > INT32_MAX) {
         env->vxsat = 0x1;
@@ -2758,7 +2757,7 @@ vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
     uint8_t res;
 
     round = get_round(vxrm, a, shift);
-    res   = (a >> shift)  + round;
+    res = (a >> shift) + round;
     return res;
 }
 static inline uint16_t
@@ -2862,7 +2861,7 @@ vnclip8(CPURISCVState *env, int vxrm, int16_t a, int8_t b)
     int16_t res;
 
     round = get_round(vxrm, a, shift);
-    res   = (a >> shift)  + round;
+    res = (a >> shift) + round;
     if (res > INT8_MAX) {
         env->vxsat = 0x1;
         return INT8_MAX;
@@ -2881,7 +2880,7 @@ vnclip16(CPURISCVState *env, int vxrm, int32_t a, int16_t b)
     int32_t res;
 
     round = get_round(vxrm, a, shift);
-    res   = (a >> shift)  + round;
+    res = (a >> shift) + round;
     if (res > INT16_MAX) {
         env->vxsat = 0x1;
         return INT16_MAX;
@@ -2900,7 +2899,7 @@ vnclip32(CPURISCVState *env, int vxrm, int64_t a, int32_t b)
     int64_t res;
 
     round = get_round(vxrm, a, shift);
-    res   = (a >> shift)  + round;
+    res = (a >> shift) + round;
     if (res > INT32_MAX) {
         env->vxsat = 0x1;
         return INT32_MAX;
@@ -2933,7 +2932,7 @@ vnclipu8(CPURISCVState *env, int vxrm, uint16_t a, uint8_t b)
     uint16_t res;
 
     round = get_round(vxrm, a, shift);
-    res   = (a >> shift)  + round;
+    res = (a >> shift) + round;
     if (res > UINT8_MAX) {
         env->vxsat = 0x1;
         return UINT8_MAX;
@@ -2949,7 +2948,7 @@ vnclipu16(CPURISCVState *env, int vxrm, uint32_t a, uint16_t b)
     uint32_t res;
 
     round = get_round(vxrm, a, shift);
-    res   = (a >> shift)  + round;
+    res = (a >> shift) + round;
     if (res > UINT16_MAX) {
         env->vxsat = 0x1;
         return UINT16_MAX;
@@ -2965,7 +2964,7 @@ vnclipu32(CPURISCVState *env, int vxrm, uint64_t a, uint32_t b)
     uint64_t res;
 
     round = get_round(vxrm, a, shift);
-    res   = (a >> shift)  + round;
+    res = (a >> shift) + round;
     if (res > UINT32_MAX) {
         env->vxsat = 0x1;
         return UINT32_MAX;
@@ -3052,7 +3051,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
     uint32_t vm = vext_vm(desc);                          \
     uint32_t vl = env->vl;                                \
     uint32_t total_elems =                                \
-        vext_get_total_elems(env, desc, ESZ);              \
+        vext_get_total_elems(env, desc, ESZ);             \
     uint32_t vta = vext_vta(desc);                        \
     uint32_t vma = vext_vma(desc);                        \
     uint32_t i;                                           \
@@ -3118,13 +3117,13 @@ GEN_VEXT_VF(vfrsub_vf_d, 8)
 static uint32_t vfwadd16(uint16_t a, uint16_t b, float_status *s)
 {
     return float32_add(float16_to_float32(a, true, s),
-            float16_to_float32(b, true, s), s);
+                       float16_to_float32(b, true, s), s);
 }
 
 static uint64_t vfwadd32(uint32_t a, uint32_t b, float_status *s)
 {
     return float64_add(float32_to_float64(a, s),
-            float32_to_float64(b, s), s);
+                       float32_to_float64(b, s), s);
 
 }
 
@@ -3140,13 +3139,13 @@ GEN_VEXT_VF(vfwadd_vf_w, 8)
 static uint32_t vfwsub16(uint16_t a, uint16_t b, float_status *s)
 {
     return float32_sub(float16_to_float32(a, true, s),
-            float16_to_float32(b, true, s), s);
+                       float16_to_float32(b, true, s), s);
 }
 
 static uint64_t vfwsub32(uint32_t a, uint32_t b, float_status *s)
 {
     return float64_sub(float32_to_float64(a, s),
-            float32_to_float64(b, s), s);
+                       float32_to_float64(b, s), s);
 
 }
 
@@ -3250,13 +3249,13 @@ GEN_VEXT_VF(vfrdiv_vf_d, 8)
 static uint32_t vfwmul16(uint16_t a, uint16_t b, float_status *s)
 {
     return float32_mul(float16_to_float32(a, true, s),
-            float16_to_float32(b, true, s), s);
+                       float16_to_float32(b, true, s), s);
 }
 
 static uint64_t vfwmul32(uint32_t a, uint32_t b, float_status *s)
 {
     return float64_mul(float32_to_float64(a, s),
-            float32_to_float64(b, s), s);
+                       float32_to_float64(b, s), s);
 
 }
 RVVCALL(OPFVV2, vfwmul_vv_h, WOP_UUU_H, H4, H2, H2, vfwmul16)
@@ -3271,7 +3270,7 @@ GEN_VEXT_VF(vfwmul_vf_w, 8)
 /* Vector Single-Width Floating-Point Fused Multiply-Add Instructions */
 #define OPFVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)       \
 static void do_##NAME(void *vd, void *vs1, void *vs2, int i,       \
-        CPURISCVState *env)                                        \
+                      CPURISCVState *env)                          \
 {                                                                  \
     TX1 s1 = *((T1 *)vs1 + HS1(i));                                \
     TX2 s2 = *((T2 *)vs2 + HS2(i));                                \
@@ -3303,7 +3302,7 @@ GEN_VEXT_VV_ENV(vfmacc_vv_d, 8)
 
 #define OPFVF3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)           \
 static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i,    \
-        CPURISCVState *env)                                       \
+                      CPURISCVState *env)                         \
 {                                                                 \
     TX2 s2 = *((T2 *)vs2 + HS2(i));                               \
     TD d = *((TD *)vd + HD(i));                                   \
@@ -3319,20 +3318,20 @@ GEN_VEXT_VF(vfmacc_vf_d, 8)
 
 static uint16_t fnmacc16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
-    return float16_muladd(a, b, d,
-            float_muladd_negate_c | float_muladd_negate_product, s);
+    return float16_muladd(a, b, d, float_muladd_negate_c |
+                                   float_muladd_negate_product, s);
 }
 
 static uint32_t fnmacc32(uint32_t a, uint32_t b, uint32_t d, float_status *s)
 {
-    return float32_muladd(a, b, d,
-            float_muladd_negate_c | float_muladd_negate_product, s);
+    return float32_muladd(a, b, d, float_muladd_negate_c |
+                                   float_muladd_negate_product, s);
 }
 
 static uint64_t fnmacc64(uint64_t a, uint64_t b, uint64_t d, float_status *s)
 {
-    return float64_muladd(a, b, d,
-            float_muladd_negate_c | float_muladd_negate_product, s);
+    return float64_muladd(a, b, d, float_muladd_negate_c |
+                                   float_muladd_negate_product, s);
 }
 
 RVVCALL(OPFVV3, vfnmacc_vv_h, OP_UUU_H, H2, H2, H2, fnmacc16)
@@ -3434,20 +3433,20 @@ GEN_VEXT_VF(vfmadd_vf_d, 8)
 
 static uint16_t fnmadd16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
-    return float16_muladd(d, b, a,
-            float_muladd_negate_c | float_muladd_negate_product, s);
+    return float16_muladd(d, b, a, float_muladd_negate_c |
+                                   float_muladd_negate_product, s);
 }
 
 static uint32_t fnmadd32(uint32_t a, uint32_t b, uint32_t d, float_status *s)
 {
-    return float32_muladd(d, b, a,
-            float_muladd_negate_c | float_muladd_negate_product, s);
+    return float32_muladd(d, b, a, float_muladd_negate_c |
+                                   float_muladd_negate_product, s);
 }
 
 static uint64_t fnmadd64(uint64_t a, uint64_t b, uint64_t d, float_status *s)
 {
-    return float64_muladd(d, b, a,
-            float_muladd_negate_c | float_muladd_negate_product, s);
+    return float64_muladd(d, b, a, float_muladd_negate_c |
+                                   float_muladd_negate_product, s);
 }
 
 RVVCALL(OPFVV3, vfnmadd_vv_h, OP_UUU_H, H2, H2, H2, fnmadd16)
@@ -3523,13 +3522,13 @@ GEN_VEXT_VF(vfnmsub_vf_d, 8)
 static uint32_t fwmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
 {
     return float32_muladd(float16_to_float32(a, true, s),
-                        float16_to_float32(b, true, s), d, 0, s);
+                          float16_to_float32(b, true, s), d, 0, s);
 }
 
 static uint64_t fwmacc32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
 {
     return float64_muladd(float32_to_float64(a, s),
-                        float32_to_float64(b, s), d, 0, s);
+                          float32_to_float64(b, s), d, 0, s);
 }
 
 RVVCALL(OPFVV3, vfwmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwmacc16)
@@ -3544,15 +3543,16 @@ GEN_VEXT_VF(vfwmacc_vf_w, 8)
 static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
 {
     return float32_muladd(float16_to_float32(a, true, s),
-                        float16_to_float32(b, true, s), d,
-                        float_muladd_negate_c | float_muladd_negate_product, s);
+                          float16_to_float32(b, true, s), d,
+                          float_muladd_negate_c | float_muladd_negate_product,
+                          s);
 }
 
 static uint64_t fwnmacc32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
 {
-    return float64_muladd(float32_to_float64(a, s),
-                        float32_to_float64(b, s), d,
-                        float_muladd_negate_c | float_muladd_negate_product, s);
+    return float64_muladd(float32_to_float64(a, s), float32_to_float64(b, s),
+                          d, float_muladd_negate_c |
+                             float_muladd_negate_product, s);
 }
 
 RVVCALL(OPFVV3, vfwnmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwnmacc16)
@@ -3567,15 +3567,15 @@ GEN_VEXT_VF(vfwnmacc_vf_w, 8)
 static uint32_t fwmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
 {
     return float32_muladd(float16_to_float32(a, true, s),
-                        float16_to_float32(b, true, s), d,
-                        float_muladd_negate_c, s);
+                          float16_to_float32(b, true, s), d,
+                          float_muladd_negate_c, s);
 }
 
 static uint64_t fwmsac32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
 {
     return float64_muladd(float32_to_float64(a, s),
-                        float32_to_float64(b, s), d,
-                        float_muladd_negate_c, s);
+                          float32_to_float64(b, s), d,
+                          float_muladd_negate_c, s);
 }
 
 RVVCALL(OPFVV3, vfwmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwmsac16)
@@ -3590,15 +3590,15 @@ GEN_VEXT_VF(vfwmsac_vf_w, 8)
 static uint32_t fwnmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
 {
     return float32_muladd(float16_to_float32(a, true, s),
-                        float16_to_float32(b, true, s), d,
-                        float_muladd_negate_product, s);
+                          float16_to_float32(b, true, s), d,
+                          float_muladd_negate_product, s);
 }
 
 static uint64_t fwnmsac32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
 {
     return float64_muladd(float32_to_float64(a, s),
-                        float32_to_float64(b, s), d,
-                        float_muladd_negate_product, s);
+                          float32_to_float64(b, s), d,
+                          float_muladd_negate_product, s);
 }
 
 RVVCALL(OPFVV3, vfwnmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwnmsac16)
@@ -3616,9 +3616,9 @@ GEN_VEXT_VF(vfwnmsac_vf_w, 8)
 #define OP_UU_W uint32_t, uint32_t, uint32_t
 #define OP_UU_D uint64_t, uint64_t, uint64_t
 
-#define OPFVV1(NAME, TD, T2, TX2, HD, HS2, OP)        \
+#define OPFVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
 static void do_##NAME(void *vd, void *vs2, int i,      \
-        CPURISCVState *env)                            \
+                      CPURISCVState *env)              \
 {                                                      \
     TX2 s2 = *((T2 *)vs2 + HS2(i));                    \
     *((TD *)vd + HD(i)) = OP(s2, &env->fp_status);     \
@@ -3626,7 +3626,7 @@ static void do_##NAME(void *vd, void *vs2, int i,      \
 
 #define GEN_VEXT_V_ENV(NAME, ESZ)                      \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
-        CPURISCVState *env, uint32_t desc)             \
+                  CPURISCVState *env, uint32_t desc)   \
 {                                                      \
     uint32_t vm = vext_vm(desc);                       \
     uint32_t vl = env->vl;                             \
@@ -3703,9 +3703,9 @@ static uint64_t frsqrt7(uint64_t f, int exp_size, int frac_size)
     }
 
     int idx = ((exp & 1) << (precision - 1)) |
-                (frac >> (frac_size - precision + 1));
+              (frac >> (frac_size - precision + 1));
     uint64_t out_frac = (uint64_t)(lookup_table[idx]) <<
-                            (frac_size - precision);
+                        (frac_size - precision);
     uint64_t out_exp = (3 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp) / 2;
 
     uint64_t val = 0;
@@ -3727,9 +3727,9 @@ static float16 frsqrt7_h(float16 f, float_status *s)
      * frsqrt7(-subnormal) = canonical NaN
      */
     if (float16_is_signaling_nan(f, s) ||
-            (float16_is_infinity(f) && sign) ||
-            (float16_is_normal(f) && sign) ||
-            (float16_is_zero_or_denormal(f) && !float16_is_zero(f) && sign)) {
+        (float16_is_infinity(f) && sign) ||
+        (float16_is_normal(f) && sign) ||
+        (float16_is_zero_or_denormal(f) && !float16_is_zero(f) && sign)) {
         s->float_exception_flags |= float_flag_invalid;
         return float16_default_nan(s);
     }
@@ -3767,9 +3767,9 @@ static float32 frsqrt7_s(float32 f, float_status *s)
      * frsqrt7(-subnormal) = canonical NaN
      */
     if (float32_is_signaling_nan(f, s) ||
-            (float32_is_infinity(f) && sign) ||
-            (float32_is_normal(f) && sign) ||
-            (float32_is_zero_or_denormal(f) && !float32_is_zero(f) && sign)) {
+        (float32_is_infinity(f) && sign) ||
+        (float32_is_normal(f) && sign) ||
+        (float32_is_zero_or_denormal(f) && !float32_is_zero(f) && sign)) {
         s->float_exception_flags |= float_flag_invalid;
         return float32_default_nan(s);
     }
@@ -3807,9 +3807,9 @@ static float64 frsqrt7_d(float64 f, float_status *s)
      * frsqrt7(-subnormal) = canonical NaN
      */
     if (float64_is_signaling_nan(f, s) ||
-            (float64_is_infinity(f) && sign) ||
-            (float64_is_normal(f) && sign) ||
-            (float64_is_zero_or_denormal(f) && !float64_is_zero(f) && sign)) {
+        (float64_is_infinity(f) && sign) ||
+        (float64_is_normal(f) && sign) ||
+        (float64_is_zero_or_denormal(f) && !float64_is_zero(f) && sign)) {
         s->float_exception_flags |= float_flag_invalid;
         return float64_default_nan(s);
     }
@@ -3897,18 +3897,18 @@ static uint64_t frec7(uint64_t f, int exp_size, int frac_size,
                 ((s->float_rounding_mode == float_round_up) && sign)) {
                 /* Return greatest/negative finite value. */
                 return (sign << (exp_size + frac_size)) |
-                    (MAKE_64BIT_MASK(frac_size, exp_size) - 1);
+                       (MAKE_64BIT_MASK(frac_size, exp_size) - 1);
             } else {
                 /* Return +-inf. */
                 return (sign << (exp_size + frac_size)) |
-                    MAKE_64BIT_MASK(frac_size, exp_size);
+                       MAKE_64BIT_MASK(frac_size, exp_size);
             }
         }
     }
 
     int idx = frac >> (frac_size - precision);
     uint64_t out_frac = (uint64_t)(lookup_table[idx]) <<
-                            (frac_size - precision);
+                        (frac_size - precision);
     uint64_t out_exp = 2 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp;
 
     if (out_exp == 0 || out_exp == UINT64_MAX) {
@@ -4422,8 +4422,8 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
                                                               \
     for (i = env->vstart; i < vl; i++) {                      \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
-        *((ETYPE *)vd + H(i))                                 \
-          = (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
+        *((ETYPE *)vd + H(i)) =                               \
+            (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
     }                                                         \
     env->vstart = 0;                                          \
     /* set tail elements to 1s */                             \
@@ -4564,7 +4564,8 @@ GEN_VEXT_V_ENV(vfncvt_f_f_w_w, 4)
 /* Vector Single-Width Integer Reduction Instructions */
 #define GEN_VEXT_RED(NAME, TD, TS2, HD, HS2, OP)          \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
-        void *vs2, CPURISCVState *env, uint32_t desc)     \
+                  void *vs2, CPURISCVState *env,          \
+                  uint32_t desc)                          \
 {                                                         \
     uint32_t vm = vext_vm(desc);                          \
     uint32_t vl = env->vl;                                \
@@ -5013,7 +5014,8 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
 
 #define GEN_VEXT_VSLIE1UP(BITWIDTH, H)                                      \
 static void vslide1up_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
-                     void *vs2, CPURISCVState *env, uint32_t desc)          \
+                                 void *vs2, CPURISCVState *env,             \
+                                 uint32_t desc)                             \
 {                                                                           \
     typedef uint##BITWIDTH##_t ETYPE;                                       \
     uint32_t vm = vext_vm(desc);                                            \
@@ -5061,7 +5063,8 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
 
 #define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)                                     \
 static void vslide1down_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
-                       void *vs2, CPURISCVState *env, uint32_t desc)          \
+                                   void *vs2, CPURISCVState *env,             \
+                                   uint32_t desc)                             \
 {                                                                             \
     typedef uint##BITWIDTH##_t ETYPE;                                         \
     uint32_t vm = vext_vm(desc);                                              \
-- 
2.25.1


