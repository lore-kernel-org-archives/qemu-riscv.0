Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZSSn-00064o-Vx
	for mharc-qemu-riscv@gnu.org; Tue, 07 Mar 2023 03:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZSSj-00061L-12; Tue, 07 Mar 2023 03:14:21 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZSSd-0007KS-7G; Tue, 07 Mar 2023 03:14:20 -0500
Received: from localhost.localdomain (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowACn0qJN8gZkNe6lDA--.36330S8;
 Tue, 07 Mar 2023 16:14:10 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v12 06/10] target/riscv: add support for Zcmp extension
Date: Tue,  7 Mar 2023 16:13:59 +0800
Message-Id: <20230307081403.61950-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACn0qJN8gZkNe6lDA--.36330S8
X-Coremail-Antispam: 1UD129KBjvJXoWxtr1UWw1xZrW3uF4rZw4fXwb_yoW3Jr1xpF
 1UC34xGr18XFWSyw48Kr1rCFnIqr1SgrWUt34Skwn5CayfGF4DJr48KrW3tw4rWFWkuFW5
 Ca98Cayjv3y5XFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
X-Originating-IP: [180.165.240.213]
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
X-List-Received-Date: Tue, 07 Mar 2023 08:14:21 -0000

Add encode, trans* functions for Zcmp instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode                |  18 +++
 target/riscv/insn_trans/trans_rvzce.c.inc | 187 +++++++++++++++++++++-
 target/riscv/translate.c                  |   5 +
 3 files changed, 209 insertions(+), 1 deletion(-)

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
index de96c4afaf..a47959eb67 100644
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
@@ -98,3 +103,183 @@ static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
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
index 3634137d85..6872d17fb9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -757,6 +757,11 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
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


