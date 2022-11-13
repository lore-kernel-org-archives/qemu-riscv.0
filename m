Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ou2qG-00039H-KY
	for mharc-qemu-riscv@gnu.org; Sat, 12 Nov 2022 21:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ou2q7-00037s-9p; Sat, 12 Nov 2022 21:35:20 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ou2q4-0006Uo-Fm; Sat, 12 Nov 2022 21:35:19 -0500
Received: from localhost.localdomain (unknown [180.165.240.202])
 by APP-01 (Coremail) with SMTP id qwCowABH6GnNV3BjuIN9CQ--.57556S8;
 Sun, 13 Nov 2022 10:35:10 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 6/8] target/riscv: add support for Zcmt extension
Date: Sun, 13 Nov 2022 10:32:49 +0800
Message-Id: <20221113023251.11047-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
References: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABH6GnNV3BjuIN9CQ--.57556S8
X-Coremail-Antispam: 1UD129KBjvJXoW3uFy3KrWDAF4xtw1Uuw4rZrb_yoWDury3pr
 4rCay3GrWrJrWxAa1ftF45trn8Jws3G3y2kan3Jw4kJay3GFW5Jrs8tw13KFZ8XF95ury2
 9a1YyFy5CrWUZFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWx
 Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
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
X-List-Received-Date: Sun, 13 Nov 2022 02:35:21 -0000

Add encode, trans* functions and helper functions support for Zcmt
instrutions
Add support for jvt csr

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.h                        |  2 ++
 target/riscv/cpu_bits.h                   |  7 +++++
 target/riscv/csr.c                        | 35 +++++++++++++++++++++++
 target/riscv/helper.h                     |  1 +
 target/riscv/insn16.decode                |  6 ++++
 target/riscv/insn_trans/trans_rvf.c.inc   |  8 +++---
 target/riscv/insn_trans/trans_rvzce.c.inc | 29 ++++++++++++++++++-
 target/riscv/insn_trans/trans_rvzfh.c.inc |  6 ++--
 target/riscv/machine.c                    | 19 ++++++++++++
 target/riscv/zce_helper.c                 | 34 ++++++++++++++++++++++
 10 files changed, 139 insertions(+), 8 deletions(-)

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
index 048ccf6ac3..4862fc422e 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1142,3 +1142,4 @@ DEF_HELPER_4(cm_pop, tl, env, tl, tl, tl)
 DEF_HELPER_4(cm_push, void, env, tl, tl, tl)
 DEF_HELPER_4(cm_popret, tl, env, tl, tl, tl)
 DEF_HELPER_4(cm_popretz, tl, env, tl, tl, tl)
+DEF_HELPER_3(cm_jalt, tl, env, tl, tl)
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 941146633d..25e274d582 100644
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
@@ -104,6 +106,7 @@
 @zcb_h        ... . .. ... .. ... ..  &i  imm=%zcb_h_uimm  rs1=%rs1_3 rd=%rs2_3
 @zcmp         ... ...  ........   ..  &zcmp  %zcmp_rlist   %zcmp_spimm
 @cm_mv        ... ...  ... .. ... ..  &r2_s  rs2=%sreg2    rs1=%sreg1
+@zcmt_jt      ... ...  ........   ..  &zcmt  %zcmt_index
 
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
@@ -191,6 +194,9 @@ slli              000 .  .....  ..... 10 @c_shift2
   cm_popretz      101  11100  .... .. 10 @zcmp
   cm_mva01s       101  011 ... 11 ... 10 @cm_mv
   cm_mvsa01       101  011 ... 01 ... 10 @cm_mv
+
+  # *** RV64 and RV32 Zcmt Extension ***
+  cm_jalt         101  000   ........ 10 @zcmt_jt
 }
 sw                110 .  .....  ..... 10 @c_swsp
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 93657680c6..1616ce663d 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -25,7 +25,7 @@
 } while (0)
 
 #ifndef CONFIG_USER_ONLY
-static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
+static inline bool smstateen_check(DisasContext *ctx, int index, uint64_t bit)
 {
     CPUState *cpu = ctx->cs;
     CPURISCVState *env = cpu->env_ptr;
@@ -43,7 +43,7 @@ static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
         stateen &= env->sstateen[index];
     }
 
-    if (!(stateen & SMSTATEEN0_FCSR)) {
+    if (!(stateen & bit)) {
         if (ctx->virt_enabled) {
             ctx->virt_inst_excp = true;
         }
@@ -53,7 +53,7 @@ static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
     return true;
 }
 #else
-#define smstateen_fcsr_check(ctx, index) (true)
+#define smstateen_check(ctx, index, bit) (true)
 #endif
 
 #define REQUIRE_ZFINX_OR_F(ctx) do { \
@@ -61,7 +61,7 @@ static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
         if (!ctx->cfg_ptr->ext_zfinx) { \
             return false; \
         } \
-        if (!smstateen_fcsr_check(ctx, 0)) { \
+        if (!smstateen_check(ctx, 0, SMSTATEEN0_FCSR)) { \
             return false; \
         } \
     } \
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index b0055934ed..bde6e1f904 100644
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
@@ -236,3 +245,21 @@ static bool trans_cm_mvsa01(DisasContext *ctx, arg_cm_mvsa01 *a)
 
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
diff --git a/target/riscv/zce_helper.c b/target/riscv/zce_helper.c
index 1346de1367..f687c6fc85 100644
--- a/target/riscv/zce_helper.c
+++ b/target/riscv/zce_helper.c
@@ -208,3 +208,37 @@ target_ulong HELPER(cm_popretz)(CPURISCVState *env, target_ulong sp,
 #undef X_Sn
 #undef ZCMP_POP
 #undef ZCMP_PUSH
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


