Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovYy7-0005T9-Ag
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 02:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovYxk-0005Jz-2A; Thu, 17 Nov 2022 02:05:28 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovYxh-00013X-2g; Thu, 17 Nov 2022 02:05:27 -0500
Received: from localhost.localdomain (unknown [180.165.240.202])
 by APP-01 (Coremail) with SMTP id qwCowABnbvIh3XVjJEYjCg--.9312S9;
 Thu, 17 Nov 2022 15:05:19 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 7/9] target/riscv: add support for Zcmt extension
Date: Thu, 17 Nov 2022 15:03:14 +0800
Message-Id: <20221117070316.58447-8-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABnbvIh3XVjJEYjCg--.9312S9
X-Coremail-Antispam: 1UD129KBjvJXoW3uFyDArykuF1fZF43ArWfuFg_yoWkKF1rpF
 4rC3y7GrW8JryxAa1ftF45tFn8Jws3G3y2kws3Jw4kJay3GFWrJrs8Kw13KFZ8XFZ5ury2
 9a1YyFy5C3y8Z3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl
 6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQSdkUUUUU=
X-Originating-IP: [180.165.240.202]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Thu, 17 Nov 2022 07:05:28 -0000
X-List-Received-Date: Thu, 17 Nov 2022 07:05:28 -0000

Add encode, trans* functions and helper functions support for Zcmt
instrutions
Add support for jvt csr

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.h                        |  2 +
 target/riscv/cpu_bits.h                   |  7 +++
 target/riscv/csr.c                        | 35 ++++++++++++++
 target/riscv/helper.h                     |  3 ++
 target/riscv/insn16.decode                |  7 ++-
 target/riscv/insn_trans/trans_rvf.c.inc   |  8 ++--
 target/riscv/insn_trans/trans_rvzce.c.inc | 29 +++++++++++-
 target/riscv/insn_trans/trans_rvzfh.c.inc |  6 +--
 target/riscv/machine.c                    | 19 ++++++++
 target/riscv/meson.build                  |  3 +-
 target/riscv/zce_helper.c                 | 57 +++++++++++++++++++++++
 11 files changed, 166 insertions(+), 10 deletions(-)
 create mode 100644 target/riscv/zce_helper.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6e915b6937..0f9fffab2f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -181,6 +181,8 @@ struct CPUArchState {
 
     uint32_t features;
 
+    target_ulong jvt;
+
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
 #endif
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8b0d7e20ea..ce347e5575 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -319,6 +319,7 @@
 #define SMSTATEEN_MAX_COUNT 4
 #define SMSTATEEN0_CS       (1ULL << 0)
 #define SMSTATEEN0_FCSR     (1ULL << 1)
+#define SMSTATEEN0_JVT      (1ULL << 2)
 #define SMSTATEEN0_HSCONTXT (1ULL << 57)
 #define SMSTATEEN0_IMSIC    (1ULL << 58)
 #define SMSTATEEN0_AIA      (1ULL << 59)
@@ -523,6 +524,9 @@
 /* Crypto Extension */
 #define CSR_SEED            0x015
 
+/* Zcmt Extension */
+#define CSR_JVT             0x017
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -894,4 +898,7 @@ typedef enum RISCVException {
 #define MHPMEVENT_IDX_MASK                 0xFFFFF
 #define MHPMEVENT_SSCOF_RESVD              16
 
+/* JVT CSR bits */
+#define JVT_MODE                           0x3F
+#define JVT_BASE                           (~0x3F)
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8b25f885ec..901da42b53 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -167,6 +167,24 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
     return ctr(env, csrno);
 }
 
+static RISCVException zcmt(CPURISCVState *env, int csrno)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_zcmt) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+#if !defined(CONFIG_USER_ONLY)
+    RISCVException ret = smstateen_acc_ok(env, 0, SMSTATEEN0_JVT);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+#endif
+
+    return RISCV_EXCP_NONE;
+}
+
 #if !defined(CONFIG_USER_ONLY)
 static RISCVException mctr(CPURISCVState *env, int csrno)
 {
@@ -3987,6 +4005,20 @@ RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
     return ret;
 }
 
+static RISCVException read_jvt(CPURISCVState *env, int csrno,
+                               target_ulong *val)
+{
+    *val = env->jvt;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_jvt(CPURISCVState *env, int csrno,
+                                target_ulong val)
+{
+    env->jvt = val;
+    return RISCV_EXCP_NONE;
+}
+
 /* Control and Status Register function table */
 riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
@@ -4024,6 +4056,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Crypto Extension */
     [CSR_SEED] = { "seed", seed, NULL, NULL, rmw_seed },
 
+    /* Zcmt Extension */
+    [CSR_JVT] = {"jvt", zcmt, read_jvt, write_jvt},
+
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
     [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter,
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 227c7122ef..2ae98f04d2 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1136,3 +1136,6 @@ DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_FLAGS_3(sm4ed, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+
+/* Zce helper */
+DEF_HELPER_3(cm_jalt, tl, env, tl, tl)
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 4654c23052..c359c574ab 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -49,6 +49,7 @@
 %zcb_h_uimm  5:1                     !function=ex_shift_1
 %zcmp_spimm  2:2                     !function=ex_shift_4
 %zcmp_rlist  4:4
+%zcmt_index  2:8
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -63,6 +64,7 @@
 &r2_s      rs1 rs2      !extern
 
 &zcmp      zcmp_rlist zcmp_spimm
+&zcmt      zcmt_index
 
 # Formats 16:
 @cr        ....  ..... .....  .. &r      rs2=%rs2_5       rs1=%rd     %rd
@@ -106,6 +108,7 @@
 @zcb_sh       ... . .. ... .. ... ..  &s  imm=%zcb_h_uimm  rs1=%rs1_3 rs2=%rs2_3
 @zcmp         ... ...  ........   ..  &zcmp  %zcmp_rlist   %zcmp_spimm
 @cm_mv        ... ...  ... .. ... ..  &r2_s  rs2=%sreg2    rs1=%sreg1
+@zcmt_jt      ... ...  ........   ..  &zcmt  %zcmt_index
 
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
@@ -186,7 +189,7 @@ slli              000 .  .....  ..... 10 @c_shift2
   sq              101  ... ... .. ... 10 @c_sqsp
   c_fsd           101   ......  ..... 10 @c_sdsp
 
-  # *** RV64 and RV32 Zcmp Extension ***
+  # *** RV64 and RV32 Zcmp/Zcmt Extension ***
   [
     cm_push         101  11000  .... .. 10 @zcmp
     cm_pop          101  11010  .... .. 10 @zcmp
@@ -194,6 +197,8 @@ slli              000 .  .....  ..... 10 @c_shift2
     cm_popretz      101  11100  .... .. 10 @zcmp
     cm_mva01s       101  011 ... 11 ... 10 @cm_mv
     cm_mvsa01       101  011 ... 01 ... 10 @cm_mv
+
+    cm_jalt         101  000   ........ 10 @zcmt_jt
   ]
 }
 sw                110 .  .....  ..... 10 @c_swsp
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 426518957b..310fa80bf8 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -31,7 +31,7 @@
 } while (0)
 
 #ifndef CONFIG_USER_ONLY
-static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
+static inline bool smstateen_check(DisasContext *ctx, int index, uint64_t bit)
 {
     CPUState *cpu = ctx->cs;
     CPURISCVState *env = cpu->env_ptr;
@@ -49,7 +49,7 @@ static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
         stateen &= env->sstateen[index];
     }
 
-    if (!(stateen & SMSTATEEN0_FCSR)) {
+    if (!(stateen & bit)) {
         if (ctx->virt_enabled) {
             ctx->virt_inst_excp = true;
         }
@@ -59,7 +59,7 @@ static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
     return true;
 }
 #else
-#define smstateen_fcsr_check(ctx, index) (true)
+#define smstateen_check(ctx, index, bit) (true)
 #endif
 
 #define REQUIRE_ZFINX_OR_F(ctx) do { \
@@ -67,7 +67,7 @@ static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
         if (!ctx->cfg_ptr->ext_zfinx) { \
             return false; \
         } \
-        if (!smstateen_fcsr_check(ctx, 0)) { \
+        if (!smstateen_check(ctx, 0, SMSTATEEN0_FCSR)) { \
             return false; \
         } \
     } \
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index f45224e388..6b011c04a1 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zc[b,mp] Standard Extension.
+ * RISC-V translation routines for the Zc[b,mp,mt] Standard Extension.
  *
  * Copyright (c) 2021-2022 PLCT Lab
  *
@@ -26,6 +26,15 @@
         return false;            \
 } while (0)
 
+#define REQUIRE_ZCMT(ctx) do {                       \
+    if (!ctx->cfg_ptr->ext_zcmt) {                   \
+        return false;                                \
+    }                                                \
+    if (!smstateen_check(ctx, 0, SMSTATEEN0_JVT)) {  \
+        return false;                                \
+    }                                                \
+} while (0)
+
 static bool trans_c_zext_b(DisasContext *ctx, arg_c_zext_b *a)
 {
     REQUIRE_ZCB(ctx);
@@ -338,3 +347,21 @@ static bool trans_cm_mvsa01(DisasContext *ctx, arg_cm_mvsa01 *a)
 
     return true;
 }
+
+static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
+{
+    REQUIRE_ZCMT(ctx);
+
+    TCGv index = tcg_const_tl(a->zcmt_index);
+    TCGv next_pc = tcg_const_tl(ctx->pc_succ_insn);
+
+    gen_helper_cm_jalt(cpu_pc, cpu_env, index, next_pc);
+
+    tcg_gen_lookup_and_goto_ptr();
+
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    tcg_temp_free(index);
+    tcg_temp_free(next_pc);
+    return true;
+}
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 6c2e338c0a..a1c513bc8c 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -29,7 +29,7 @@
     if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
         return false;                  \
     }                                  \
-    if (!smstateen_fcsr_check(ctx, 0)) { \
+    if (!smstateen_check(ctx, 0, SMSTATEEN0_FCSR)) { \
         return false; \
     } \
 } while (0)
@@ -38,7 +38,7 @@
     if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
         return false;                         \
     }                                         \
-    if (!smstateen_fcsr_check(ctx, 0)) { \
+    if (!smstateen_check(ctx, 0, SMSTATEEN0_FCSR)) { \
         return false; \
     } \
 } while (0)
@@ -48,7 +48,7 @@
           ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
         return false;                                        \
     }                                                        \
-    if (!smstateen_fcsr_check(ctx, 0)) { \
+    if (!smstateen_check(ctx, 0, SMSTATEEN0_FCSR)) { \
         return false; \
     } \
 } while (0)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 65a8549ec2..ee3a2deab6 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -331,6 +331,24 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
     }
 };
 
+static bool jvt_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+
+    return cpu->cfg.ext_zcmt;
+}
+
+static const VMStateDescription vmstate_jvt = {
+    .name = "cpu/jvt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = jvt_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(env.jvt, RISCVCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 5,
@@ -400,6 +418,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_envcfg,
         &vmstate_debug,
         &vmstate_smstateen,
+        &vmstate_jvt,
         NULL
     }
 };
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index ba25164d74..4bf9c9e632 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -18,7 +18,8 @@ riscv_ss.add(files(
   'bitmanip_helper.c',
   'translate.c',
   'm128_helper.c',
-  'crypto_helper.c'
+  'crypto_helper.c',
+  'zce_helper.c'
 ))
 riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
diff --git a/target/riscv/zce_helper.c b/target/riscv/zce_helper.c
new file mode 100644
index 0000000000..5822aa3740
--- /dev/null
+++ b/target/riscv/zce_helper.c
@@ -0,0 +1,57 @@
+/*
+ * RISC-V Zc* extension Helpers for QEMU.
+ *
+ * Copyright (c) 2021-2022 PLCT Lab
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+
+target_ulong HELPER(cm_jalt)(CPURISCVState *env, target_ulong index,
+                             target_ulong next_pc)
+{
+    target_ulong target = next_pc;
+    target_ulong val = 0;
+    int xlen = riscv_cpu_xlen(env);
+
+    val = env->jvt;
+
+    uint8_t mode = get_field(val, JVT_MODE);
+    target_ulong base = get_field(val, JVT_BASE);
+
+    target_ulong t0;
+
+    if (mode != 0) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    if (xlen == 32) {
+        t0 = base + (index << 2);
+        target = cpu_ldl_code(env, t0);
+    } else {
+        t0 = base + (index << 3);
+        target = cpu_ldq_code(env, t0);
+    }
+
+    /* index >= 32 for cm.jalt, otherwise for cm.jt */
+    if (index >= 32) {
+        env->gpr[1] = next_pc;
+    }
+
+    return target & ~0x1;
+}
-- 
2.25.1


