Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ou2q3-00035b-Uu
	for mharc-qemu-riscv@gnu.org; Sat, 12 Nov 2022 21:35:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ou2q2-000349-Q3; Sat, 12 Nov 2022 21:35:14 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ou2py-0006Tl-Go; Sat, 12 Nov 2022 21:35:14 -0500
Received: from localhost.localdomain (unknown [180.165.240.202])
 by APP-01 (Coremail) with SMTP id qwCowABH6GnNV3BjuIN9CQ--.57556S6;
 Sun, 13 Nov 2022 10:35:04 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 4/8] target/riscv: add support for Zcb extension
Date: Sun, 13 Nov 2022 10:32:47 +0800
Message-Id: <20221113023251.11047-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
References: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABH6GnNV3BjuIN9CQ--.57556S6
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1Dtw13Cr18uw18tr1DZFb_yoWxXw1UpF
 1xCryUGF1qgFyxAayfKF4avF17WrnagrWUK3s3Aw1kGa1YgFWDJr1DK3yakw4DWr4kWr4Y
 9a1DAayUt3yYya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
 1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
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
X-List-Received-Date: Sun, 13 Nov 2022 02:35:15 -0000

Add encode and trans* functions support for Zcb instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn16.decode                |  22 ++++
 target/riscv/insn_trans/trans_rvzce.c.inc | 133 ++++++++++++++++++++++
 target/riscv/translate.c                  |   2 +
 3 files changed, 157 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index c32cfe1543..2c1ae4d92e 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -43,6 +43,8 @@
 %imm_addi16sp  12:s1 3:2 5:1 2:1 6:1 !function=ex_shift_4
 %imm_lui       12:s1 2:5             !function=ex_shift_12
 
+%zcb_b_uimm  5:1 6:1
+%zcb_h_uimm  5:1                     !function=ex_shift_1
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -53,6 +55,7 @@
 &b         imm rs2 rs1  !extern
 &u         imm rd       !extern
 &shift     shamt rs1 rd !extern
+&r2        rd rs1       !extern
 
 
 # Formats 16:
@@ -89,6 +92,11 @@
 
 @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
 
+@zcb_unary    ... ...  ... .. ... ..  &r2                  rs1=%rs1_3 rd=%rs1_3
+@zcb_binary   ... ...  ... .. ... ..  &r  rs2=%rs2_3       rs1=%rs1_3 rd=%rs1_3
+@zcb_b        ... . .. ... .. ... ..  &i  imm=%zcb_b_uimm  rs1=%rs1_3 rd=%rs2_3
+@zcb_h        ... . .. ... .. ... ..  &i  imm=%zcb_h_uimm  rs1=%rs1_3 rd=%rs2_3
+
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
   # Opcode of all zeros is illegal; rd != 0, nzuimm == 0 is reserved.
@@ -180,3 +188,17 @@ sw                110 .  .....  ..... 10 @c_swsp
   sd              111 .  .....  ..... 10 @c_sdsp
   fsw             111 .  .....  ..... 10 @c_swsp
 }
+
+# *** RV64 and RV32 Zcb Extension ***
+c_zext_b          100 111  ... 11 000 01 @zcb_unary
+c_sext_b          100 111  ... 11 001 01 @zcb_unary
+c_zext_h          100 111  ... 11 010 01 @zcb_unary
+c_sext_h          100 111  ... 11 011 01 @zcb_unary
+c_zext_w          100 111  ... 11 100 01 @zcb_unary
+c_not             100 111  ... 11 101 01 @zcb_unary
+c_mul             100 111  ... 10 ... 01 @zcb_binary
+c_lbu             100 000  ... .. ... 00 @zcb_b
+c_lhu             100 001  ... 0. ... 00 @zcb_h
+c_lh              100 001  ... 1. ... 00 @zcb_h
+c_sb              100 010  ... .. ... 00 @zcb_b
+c_sh              100 011  ... 0. ... 00 @zcb_h
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
new file mode 100644
index 0000000000..0947190f2d
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -0,0 +1,133 @@
+/*
+ * RISC-V translation routines for the Zcb Standard Extension.
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
+#define REQUIRE_ZCB(ctx) do {   \
+    if (!ctx->cfg_ptr->ext_zcb) \
+        return false;           \
+} while (0)
+
+static bool trans_c_zext_b(DisasContext *ctx, arg_c_zext_b *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8u_tl);
+}
+
+static bool trans_c_zext_h(DisasContext *ctx, arg_c_zext_h *a)
+{
+    REQUIRE_ZCB(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16u_tl);
+}
+
+static bool trans_c_sext_b(DisasContext *ctx, arg_c_sext_b *a)
+{
+    REQUIRE_ZCB(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8s_tl);
+}
+
+static bool trans_c_sext_h(DisasContext *ctx, arg_c_sext_h *a)
+{
+    REQUIRE_ZCB(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16s_tl);
+}
+
+static bool trans_c_zext_w(DisasContext *ctx, arg_c_zext_w *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZCB(ctx);
+    REQUIRE_ZBA(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext32u_tl);
+}
+
+static bool trans_c_not(DisasContext *ctx, arg_c_not *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_not_tl);
+}
+
+static bool trans_c_mul(DisasContext *ctx, arg_c_mul *a)
+{
+    REQUIRE_ZCB(ctx);
+    REQUIRE_M_OR_ZMMUL(ctx);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
+}
+
+static bool gen_zce_load(DisasContext *ctx, arg_i *a, MemOp memop)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_addi_tl(t0, src1, a->imm);
+
+    tcg_gen_qemu_ld_tl(dest, t0, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu *a)
+{
+    REQUIRE_ZCB(ctx);
+    MemOp memop = MO_UB;
+    return gen_zce_load(ctx, a, memop);
+}
+
+static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
+{
+    REQUIRE_ZCB(ctx);
+    MemOp memop = MO_UW;
+    return gen_zce_load(ctx, a, memop);
+}
+
+static bool trans_c_lh(DisasContext *ctx, arg_c_lh *a)
+{
+    REQUIRE_ZCB(ctx);
+    MemOp memop = MO_SW;
+    return gen_zce_load(ctx, a, memop);
+}
+
+static bool gen_zce_store(DisasContext *ctx, arg_i *a, MemOp memop)
+{
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_addi_tl(t0, src1, a->imm);
+    tcg_gen_qemu_st_tl(src2, t0, ctx->mem_idx, memop);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
+{
+    REQUIRE_ZCB(ctx);
+    MemOp memop = MO_UB;
+    return gen_zce_store(ctx, a, memop);
+}
+
+static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
+{
+    REQUIRE_ZCB(ctx);
+    MemOp memop = MO_UW;
+    return gen_zce_store(ctx, a, memop);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0514e43fd3..7cd35058d3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1069,6 +1069,8 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
+#include "insn_trans/trans_rvzce.c.inc"
+
 /* Include decoders for factored-out extensions */
 #include "decode-XVentanaCondOps.c.inc"
 
-- 
2.25.1


