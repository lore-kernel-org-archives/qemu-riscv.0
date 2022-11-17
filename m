Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovYy7-0005Te-O1
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 02:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovYxn-0005LN-7L; Thu, 17 Nov 2022 02:05:31 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovYxk-000179-7f; Thu, 17 Nov 2022 02:05:30 -0500
Received: from localhost.localdomain (unknown [180.165.240.202])
 by APP-01 (Coremail) with SMTP id qwCowABnbvIh3XVjJEYjCg--.9312S8;
 Thu, 17 Nov 2022 15:05:17 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 6/9] target/riscv: add support for Zcmp extension
Date: Thu, 17 Nov 2022 15:03:13 +0800
Message-Id: <20221117070316.58447-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABnbvIh3XVjJEYjCg--.9312S8
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4DWw1xtw1kAw1UuFWUCFg_yoW3urykpF
 4rC3y7WrWUZFWIyayxKFs5CrnIqr4fWrW0k3sxKw1kC3yagFWxJFn8t34avF4UGFWkZrWU
 Ca98AFWqk3y5XwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-List-Received-Date: Thu, 17 Nov 2022 07:05:32 -0000

Add encode, trans* functions for Zcmp instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn16.decode                |  18 ++
 target/riscv/insn_trans/trans_rvzce.c.inc | 242 +++++++++++++++++++++-
 target/riscv/translate.c                  |   5 +
 3 files changed, 264 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 47603ec1e0..4654c23052 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -21,6 +21,8 @@
 %rs1_3     7:3                !function=ex_rvc_register
 %rs2_3     2:3                !function=ex_rvc_register
 %rs2_5     2:5
+%sreg1     7:3                !function=ex_sreg_register
+%sreg2     2:3                !function=ex_sreg_register
 
 # Immediates:
 %imm_ci        12:s1 2:5
@@ -45,6 +47,8 @@
 
 %zcb_b_uimm  5:1 6:1
 %zcb_h_uimm  5:1                     !function=ex_shift_1
+%zcmp_spimm  2:2                     !function=ex_shift_4
+%zcmp_rlist  4:4
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -56,7 +60,9 @@
 &u         imm rd       !extern
 &shift     shamt rs1 rd !extern
 &r2        rd rs1       !extern
+&r2_s      rs1 rs2      !extern
 
+&zcmp      zcmp_rlist zcmp_spimm
 
 # Formats 16:
 @cr        ....  ..... .....  .. &r      rs2=%rs2_5       rs1=%rd     %rd
@@ -98,6 +104,8 @@
 @zcb_lh       ... . .. ... .. ... ..  &i  imm=%zcb_h_uimm  rs1=%rs1_3 rd=%rs2_3
 @zcb_sb       ... . .. ... .. ... ..  &s  imm=%zcb_b_uimm  rs1=%rs1_3 rs2=%rs2_3
 @zcb_sh       ... . .. ... .. ... ..  &s  imm=%zcb_h_uimm  rs1=%rs1_3 rs2=%rs2_3
+@zcmp         ... ...  ........   ..  &zcmp  %zcmp_rlist   %zcmp_spimm
+@cm_mv        ... ...  ... .. ... ..  &r2_s  rs2=%sreg2    rs1=%sreg1
 
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
@@ -177,6 +185,16 @@ slli              000 .  .....  ..... 10 @c_shift2
 {
   sq              101  ... ... .. ... 10 @c_sqsp
   c_fsd           101   ......  ..... 10 @c_sdsp
+
+  # *** RV64 and RV32 Zcmp Extension ***
+  [
+    cm_push         101  11000  .... .. 10 @zcmp
+    cm_pop          101  11010  .... .. 10 @zcmp
+    cm_popret       101  11110  .... .. 10 @zcmp
+    cm_popretz      101  11100  .... .. 10 @zcmp
+    cm_mva01s       101  011 ... 11 ... 10 @cm_mv
+    cm_mvsa01       101  011 ... 01 ... 10 @cm_mv
+  ]
 }
 sw                110 .  .....  ..... 10 @c_swsp
 
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index de96c4afaf..f45224e388 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zcb Standard Extension.
+ * RISC-V translation routines for the Zc[b,mp] Standard Extension.
  *
  * Copyright (c) 2021-2022 PLCT Lab
  *
@@ -21,6 +21,11 @@
         return false;           \
 } while (0)
 
+#define REQUIRE_ZCMP(ctx) do {   \
+    if (!ctx->cfg_ptr->ext_zcmp) \
+        return false;            \
+} while (0)
+
 static bool trans_c_zext_b(DisasContext *ctx, arg_c_zext_b *a)
 {
     REQUIRE_ZCB(ctx);
@@ -98,3 +103,238 @@ static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
     REQUIRE_ZCB(ctx);
     return gen_store(ctx, a, MO_UW);
 }
+
+static bool gen_zcmp_check(DisasContext *ctx, arg_zcmp *a)
+{
+    /* rlist 0 to 3 are reserved for future EABI variant */
+    if (a->zcmp_rlist < 4) {
+        return false;
+    }
+
+    /* rlist <= 6 when RV32E/RV64E */
+    if (ctx->cfg_ptr->ext_e && a->zcmp_rlist > 6) {
+        return false;
+    }
+
+    return true;
+}
+
+#define X_S0    8
+#define X_S1    9
+#define X_Sn    16
+
+static inline void update_push_pop_list(target_ulong rlist, bool *xreg_list)
+{
+    switch (rlist) {
+    case 15:
+        xreg_list[X_Sn + 11] = true;
+        xreg_list[X_Sn + 10] = true;
+        /* FALL THROUGH */
+    case 14:
+        xreg_list[X_Sn + 9] = true;
+        /* FALL THROUGH */
+    case 13:
+        xreg_list[X_Sn + 8] = true;
+        /* FALL THROUGH */
+    case 12:
+        xreg_list[X_Sn + 7] = true;
+        /* FALL THROUGH */
+    case 11:
+        xreg_list[X_Sn + 6] = true;
+        /* FALL THROUGH */
+    case 10:
+        xreg_list[X_Sn + 5] = true;
+        /* FALL THROUGH */
+    case 9:
+        xreg_list[X_Sn + 4] = true;
+        /* FALL THROUGH */
+    case 8:
+        xreg_list[X_Sn + 3] = true;
+        /* FALL THROUGH */
+    case 7:
+        xreg_list[X_Sn + 2] = true;
+        /* FALL THROUGH */
+    case 6:
+        xreg_list[X_S1] = true;
+        /* FALL THROUGH */
+    case 5:
+        xreg_list[X_S0] = true;
+        /* FALL THROUGH */
+    case 4:
+        xreg_list[xRA] = true;
+        break;
+    }
+}
+
+static inline target_ulong caculate_stack_adj(int bytes, target_ulong rlist,
+                                              target_ulong spimm)
+{
+    target_ulong stack_adj_base = 0;
+    switch (rlist) {
+    case 15:
+        stack_adj_base = bytes == 4 ? 64 : 112;
+        break;
+    case 14:
+        stack_adj_base = bytes == 4 ? 48 : 96;
+        break;
+    case 13:
+    case 12:
+        stack_adj_base = bytes == 4 ? 48 : 80;
+        break;
+    case 11:
+    case 10:
+        stack_adj_base = bytes == 4 ? 32 : 64;
+        break;
+    case 9:
+    case 8:
+        stack_adj_base = bytes == 4 ? 32 : 48;
+        break;
+    case 7:
+    case 6:
+        stack_adj_base = bytes == 4 ? 16 : 32;
+        break;
+    case 5:
+    case 4:
+        stack_adj_base = 16;
+        break;
+    }
+
+    return stack_adj_base + spimm;
+}
+
+static bool gen_pop(DisasContext *ctx, arg_zcmp *a, bool ret, bool ret_val)
+{
+    REQUIRE_ZCMP(ctx);
+
+    if (!gen_zcmp_check(ctx, a)) {
+        return false;
+    }
+
+    bool xreg_list[32] = {false};
+    int bytes = get_ol(ctx) == MXL_RV32 ? 4 : 8;
+    target_ulong stack_adj = caculate_stack_adj(bytes, a->zcmp_rlist,
+                                                a->zcmp_spimm);
+    TCGv sp = dest_gpr(ctx, xSP);
+    TCGv addr = tcg_temp_new();
+    int i;
+
+    update_push_pop_list(a->zcmp_rlist, xreg_list);
+    tcg_gen_addi_tl(addr, sp, stack_adj - bytes);
+
+    for (i = X_Sn + 11; i >= 0; i--) {
+        if (xreg_list[i]) {
+            TCGv dest = dest_gpr(ctx, i);
+            switch (bytes) {
+            case 4:
+                tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, MO_32);
+                break;
+            case 8:
+                tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, MO_64);
+                break;
+            default:
+                break;
+            }
+            gen_set_gpr(ctx, i, dest);
+            tcg_gen_subi_tl(addr, addr, bytes);
+        }
+    }
+
+    tcg_gen_addi_tl(sp, sp, stack_adj);
+    gen_set_gpr(ctx, xSP, sp);
+
+    if (ret_val) {
+        gen_set_gpr(ctx, xA0, ctx->zero);
+    }
+
+    if (ret) {
+        TCGv ret_addr = get_gpr(ctx, xRA, EXT_NONE);
+        gen_set_pc(ctx, ret_addr);
+        tcg_gen_lookup_and_goto_ptr();
+        ctx->base.is_jmp = DISAS_NORETURN;
+    }
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool trans_cm_push(DisasContext *ctx, arg_cm_push *a)
+{
+    REQUIRE_ZCMP(ctx);
+
+    if (!gen_zcmp_check(ctx, a)) {
+        return false;
+    }
+
+    bool xreg_list[32] = {false};
+    int bytes = get_ol(ctx) == MXL_RV32 ? 4 : 8;
+    target_ulong stack_adj = caculate_stack_adj(bytes, a->zcmp_rlist,
+                                                a->zcmp_spimm);
+    TCGv sp = dest_gpr(ctx, xSP);
+    TCGv addr = tcg_temp_new();
+    int i;
+
+    update_push_pop_list(a->zcmp_rlist, xreg_list);
+    tcg_gen_subi_tl(addr, sp, bytes);
+
+    for (i = X_Sn + 11; i >= 0; i--) {
+        if (xreg_list[i]) {
+            TCGv val = get_gpr(ctx, i, EXT_NONE);
+            switch (bytes) {
+            case 4:
+                tcg_gen_qemu_st_tl(val, addr, ctx->mem_idx, MO_32);
+                break;
+            case 8:
+                tcg_gen_qemu_st_tl(val, addr, ctx->mem_idx, MO_64);
+                break;
+            default:
+                break;
+            }
+            tcg_gen_subi_tl(addr, addr, bytes);
+        }
+    }
+
+    tcg_gen_subi_tl(sp, sp, stack_adj);
+    gen_set_gpr(ctx, xSP, sp);
+    return true;
+}
+
+static bool trans_cm_pop(DisasContext *ctx, arg_cm_pop *a)
+{
+    return gen_pop(ctx, a, false, false);
+}
+
+static bool trans_cm_popret(DisasContext *ctx, arg_cm_popret *a)
+{
+    return gen_pop(ctx, a, true, false);
+}
+
+static bool trans_cm_popretz(DisasContext *ctx, arg_cm_popret *a)
+{
+    return gen_pop(ctx, a, true, true);
+}
+
+static bool trans_cm_mva01s(DisasContext *ctx, arg_cm_mva01s *a)
+{
+    REQUIRE_ZCMP(ctx);
+
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_set_gpr(ctx, xA0, src1);
+    gen_set_gpr(ctx, xA1, src2);
+
+    return true;
+}
+
+static bool trans_cm_mvsa01(DisasContext *ctx, arg_cm_mvsa01 *a)
+{
+    REQUIRE_ZCMP(ctx);
+
+    TCGv a0 = get_gpr(ctx, xA0, EXT_NONE);
+    TCGv a1 = get_gpr(ctx, xA1, EXT_NONE);
+
+    gen_set_gpr(ctx, a->rs1, a0);
+    gen_set_gpr(ctx, a->rs2, a1);
+
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ca01da3309..1b2515650f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -738,6 +738,11 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
     return 8 + reg;
 }
 
+static int ex_sreg_register(DisasContext *ctx, int reg)
+{
+    return reg < 2 ? reg + 8 : reg + 16;
+}
+
 static int ex_rvc_shiftli(DisasContext *ctx, int imm)
 {
     /* For RV128 a shamt of 0 means a shift by 64. */
-- 
2.25.1


