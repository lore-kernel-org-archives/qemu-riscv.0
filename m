Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oe4li-00020t-ND
	for mharc-qemu-riscv@gnu.org; Thu, 29 Sep 2022 21:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oe4lf-0001sQ-Cm; Thu, 29 Sep 2022 21:24:43 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39490 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oe4lZ-00080p-N4; Thu, 29 Sep 2022 21:24:43 -0400
Received: from localhost.localdomain (unknown [139.227.114.201])
 by APP-05 (Coremail) with SMTP id zQCowABHOHVJRTZjaraNAg--.3616S7;
 Fri, 30 Sep 2022 09:24:30 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC 5/8] target/riscv: add support for Zcmt extension
Date: Fri, 30 Sep 2022 09:23:42 +0800
Message-Id: <20220930012345.5248-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
References: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHOHVJRTZjaraNAg--.3616S7
X-Coremail-Antispam: 1UD129KBjvJXoW3WryfZw1kWFWxArWfKr1Utrb_yoW3trW3pF
 48C3y7GrWkJrZ7A3WftF1Yqr15Jw4rGw4UC393Aw4kJa13WFWrXr1DK3y3KFs8XFs5Wr1j
 93Z0yFy5CrW8X3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
 JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
 0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
 JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTY
 UUUUU
X-Originating-IP: [139.227.114.201]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 30 Sep 2022 01:24:43 -0000

Add encode, trans* functions and helper functions support for Zcmt
instrutions
Add support for jvt csr

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.h                        |  2 ++
 target/riscv/cpu_bits.h                   |  6 ++++
 target/riscv/csr.c                        | 28 +++++++++++++++++++
 target/riscv/helper.h                     |  1 +
 target/riscv/insn16.decode                |  6 ++++
 target/riscv/insn_trans/trans_rvzce.c.inc | 25 ++++++++++++++++-
 target/riscv/machine.c                    | 19 +++++++++++++
 target/riscv/translate.c                  |  2 +-
 target/riscv/zce_helper.c                 | 34 +++++++++++++++++++++++
 9 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index db3eca1d8a..2782ea9546 100644
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
index d8f5f0abed..37bf87f808 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -486,6 +486,9 @@
 /* Crypto Extension */
 #define CSR_SEED            0x015
 
+/* Zcmt Extension */
+#define CSR_JVT             0x017
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -857,4 +860,7 @@ typedef enum RISCVException {
 #define MHPMEVENT_IDX_MASK                 0xFFFFF
 #define MHPMEVENT_SSCOF_RESVD              16
 
+/* JVT CSR bits */
+#define JVT_MODE                           0x3F
+#define JVT_BASE                           (~0x3F)
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..a6d8115065 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -127,6 +127,17 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
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
+    return RISCV_EXCP_NONE;
+}
+
 #if !defined(CONFIG_USER_ONLY)
 static RISCVException mctr(CPURISCVState *env, int csrno)
 {
@@ -3634,6 +3645,20 @@ RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
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
@@ -3671,6 +3696,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Crypto Extension */
     [CSR_SEED] = { "seed", seed, NULL, NULL, rmw_seed },
 
+    /* Zcmt Extension */
+    [CSR_JVT] = {"jvt", zcmt, read_jvt, write_jvt},
+
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
     [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter,
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9250e01cb6..3cc1de9641 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1140,3 +1140,4 @@ DEF_HELPER_4(cm_pop, tl, env, tl, tl, tl)
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
 
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index 710e572cfe..8f3c93cc6b 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zcb Standard Extension.
+ * RISC-V translation routines for the Zc[b,d,mp,mt] Standard Extension.
  *
  * Copyright (c) 2021-2022 PLCT Lab
  *
@@ -32,6 +32,11 @@
         return false;            \
 } while (0)
 
+#define REQUIRE_ZCMT(ctx) do {   \
+    if (!ctx->cfg_ptr->ext_zcmt) \
+        return false;            \
+} while (0)
+
 static bool trans_c_zext_b(DisasContext *ctx, arg_c_zext_b *a)
 {
     REQUIRE_ZCB(ctx);
@@ -254,3 +259,21 @@ static bool trans_cm_mvsa01(DisasContext *ctx, arg_cm_mvsa01 *a)
 
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
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index c2a94a82b3..138eb75d00 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -296,6 +296,24 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
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
@@ -364,6 +382,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_kvmtimer,
         &vmstate_envcfg,
         &vmstate_debug,
+        &vmstate_jvt,
         NULL
     }
 };
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c4882db56b..347bc913eb 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1088,7 +1088,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
              ((opcode & 0xe003) == 0xe002))) {
             gen_exception_illegal(ctx);
         } else if (!(has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zcd ||
-                     ctx->cfg_ptr->ext_zcmp) &&
+                     ctx->cfg_ptr->ext_zcmp || ctx->cfg_ptr->ext_zcmt) &&
                    (((opcode & 0xe003) == 0x2000) ||
                     ((opcode & 0xe003) == 0x2002) ||
                     ((opcode & 0xe003) == 0xa000) ||
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


