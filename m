Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPyKZ-00017l-C2
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 23:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pPyKX-00015j-FL; Wed, 08 Feb 2023 23:14:41 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pPyKS-0002Wq-1h; Wed, 08 Feb 2023 23:14:41 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAAnJkIfc+RjuUgtBA--.61796S8;
 Thu, 09 Feb 2023 12:14:28 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v11 6/9] target/riscv: add support for Zcmp extension
Date: Thu,  9 Feb 2023 12:13:49 +0800
Message-Id: <20230209041352.53980-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209041352.53980-1-liweiwei@iscas.ac.cn>
References: <20230209041352.53980-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnJkIfc+RjuUgtBA--.61796S8
X-Coremail-Antispam: 1UD129KBjvJXoWxtr1UWw1xZrW3uF4rZw4fXwb_yoW3JF13pF
 1UC347Wr18XFWSyw48Kr1rCFnIqr1fKrWjk34Skwn5Cay3GF4DJr48KrW3ta1rWFWkuF45
 Ca98Cayjv3y5XFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
 6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQSdkUUUUU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 09 Feb 2023 04:14:41 -0000

Add encode, trans* functions for Zcmp instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode                |  18 +++
 target/riscv/insn_trans/trans_rvzce.c.inc | 189 +++++++++++++++++++++-
 target/riscv/translate.c                  |   5 +
 3 files changed, 211 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index ab780fa46a..55c9574299 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -21,6 +21,8 @@
 %rs1_3     7:3                !function=ex_rvc_register
 %rs2_3     2:3                !function=ex_rvc_register
 %rs2_5     2:5
+%r1s       7:3                !function=ex_sreg_register
+%r2s       2:3                !function=ex_sreg_register
 
 # Immediates:
 %imm_ci        12:s1 2:5
@@ -45,6 +47,8 @@
 
 %uimm_cl_b  5:1 6:1
 %uimm_cl_h  5:1                      !function=ex_shift_1
+%spimm      2:2                      !function=ex_shift_4
+%urlist     4:4
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -56,7 +60,9 @@
 &u         imm rd       !extern
 &shift     shamt rs1 rd !extern
 &r2        rd rs1       !extern
+&r2_s      rs1 rs2      !extern
 
+&cmpp      urlist spimm
 
 # Formats 16:
 @cr        ....  ..... .....  .. &r      rs2=%rs2_5       rs1=%rd     %rd
@@ -97,6 +103,8 @@
 @cl_h         ... . .. ... .. ... ..  &i  imm=%uimm_cl_h  rs1=%rs1_3 rd=%rs2_3
 @cs_b         ... . .. ... .. ... ..  &s  imm=%uimm_cl_b  rs1=%rs1_3 rs2=%rs2_3
 @cs_h         ... . .. ... .. ... ..  &s  imm=%uimm_cl_h  rs1=%rs1_3 rs2=%rs2_3
+@cm_pp        ... ...  ........   ..  &cmpp  %urlist      %spimm
+@cm_mv        ... ...  ... .. ... ..  &r2_s  rs2=%r2s     rs1=%r1s
 
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
@@ -176,6 +184,16 @@ slli              000 .  .....  ..... 10 @c_shift2
 {
   sq              101  ... ... .. ... 10 @c_sqsp
   c_fsd           101   ......  ..... 10 @c_sdsp
+
+  # *** RV64 and RV32 Zcmp Extension ***
+  [
+    cm_push         101  11000  .... .. 10 @cm_pp
+    cm_pop          101  11010  .... .. 10 @cm_pp
+    cm_popret       101  11110  .... .. 10 @cm_pp
+    cm_popretz      101  11100  .... .. 10 @cm_pp
+    cm_mva01s       101  011 ... 11 ... 10 @cm_mv
+    cm_mvsa01       101  011 ... 01 ... 10 @cm_mv
+  ]
 }
 sw                110 .  .....  ..... 10 @c_swsp
 
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index de96c4afaf..ac597e1ee2 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zcb Standard Extension.
+ * RISC-V translation routines for the Zc[b,mp] Standard Extensions.
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
@@ -98,3 +103,185 @@ static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
     REQUIRE_ZCB(ctx);
     return gen_store(ctx, a, MO_UW);
 }
+
+#define X_S0    8
+#define X_S1    9
+#define X_Sn    16
+
+static uint32_t decode_push_pop_list(DisasContext *ctx, target_ulong rlist)
+{
+    uint32_t reg_bitmap = 0;
+
+    if (ctx->cfg_ptr->ext_e && rlist > 6) {
+        return 0;
+    }
+
+    switch (rlist) {
+    case 15:
+        reg_bitmap |=  1 << (X_Sn + 11) ;
+        reg_bitmap |=  1 << (X_Sn + 10) ;
+        /* FALL THROUGH */
+    case 14:
+        reg_bitmap |=  1 << (X_Sn + 9) ;
+        /* FALL THROUGH */
+    case 13:
+        reg_bitmap |=  1 << (X_Sn + 8) ;
+        /* FALL THROUGH */
+    case 12:
+        reg_bitmap |=  1 << (X_Sn + 7) ;
+        /* FALL THROUGH */
+    case 11:
+        reg_bitmap |=  1 << (X_Sn + 6) ;
+        /* FALL THROUGH */
+    case 10:
+        reg_bitmap |=  1 << (X_Sn + 5) ;
+        /* FALL THROUGH */
+    case 9:
+        reg_bitmap |=  1 << (X_Sn + 4) ;
+        /* FALL THROUGH */
+    case 8:
+        reg_bitmap |=  1 << (X_Sn + 3) ;
+        /* FALL THROUGH */
+    case 7:
+        reg_bitmap |=  1 << (X_Sn + 2) ;
+        /* FALL THROUGH */
+    case 6:
+        reg_bitmap |=  1 << X_S1 ;
+        /* FALL THROUGH */
+    case 5:
+        reg_bitmap |= 1 << X_S0;
+        /* FALL THROUGH */
+    case 4:
+        reg_bitmap |= 1 << xRA;
+        break;
+    default:
+        break;
+    }
+
+    return reg_bitmap;
+}
+
+static bool gen_pop(DisasContext *ctx, arg_cmpp *a, bool ret, bool ret_val)
+{
+    REQUIRE_ZCMP(ctx);
+
+    uint32_t reg_bitmap = decode_push_pop_list(ctx, a->urlist);
+    if (reg_bitmap == 0) {
+        return false;
+    }
+
+    MemOp memop = get_ol(ctx) == MXL_RV32 ? MO_TEUL : MO_TEUQ;
+    int reg_size = memop_size(memop);
+    target_ulong stack_adj = ROUND_UP(ctpop32(reg_bitmap) * reg_size, 16) +
+                             a->spimm;
+    TCGv sp = dest_gpr(ctx, xSP);
+    TCGv addr = tcg_temp_new();
+    int i;
+
+    tcg_gen_addi_tl(addr, sp, stack_adj - reg_size);
+
+    for (i = X_Sn + 11; i >= 0; i--) {
+        if (reg_bitmap & (1 << i)) {
+            TCGv dest = dest_gpr(ctx, i);
+            tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
+            gen_set_gpr(ctx, i, dest);
+            tcg_gen_subi_tl(addr, addr, reg_size);
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
+    uint32_t reg_bitmap = decode_push_pop_list(ctx, a->urlist);
+    if (reg_bitmap == 0) {
+        return false;
+    }
+
+    MemOp memop = get_ol(ctx) == MXL_RV32 ? MO_TEUL : MO_TEUQ;
+    int reg_size = memop_size(memop);
+    target_ulong stack_adj = ROUND_UP(ctpop32(reg_bitmap) * reg_size, 16) +
+                             a->spimm;
+    TCGv sp = dest_gpr(ctx, xSP);
+    TCGv addr = tcg_temp_new();
+    int i;
+
+    tcg_gen_subi_tl(addr, sp, reg_size);
+
+    for (i = X_Sn + 11; i >= 0; i--) {
+        if (reg_bitmap & (1 << i)) {
+            TCGv val = get_gpr(ctx, i, EXT_NONE);
+            tcg_gen_qemu_st_tl(val, addr, ctx->mem_idx, memop);
+            tcg_gen_subi_tl(addr, addr, reg_size);
+        }
+    }
+
+    tcg_gen_subi_tl(sp, sp, stack_adj);
+    gen_set_gpr(ctx, xSP, sp);
+
+    tcg_temp_free(addr);
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
+    if (a->rs1 == a->rs2) {
+        return false;
+    }
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
index 65b50502a2..08d5ce60cb 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -781,6 +781,11 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
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


