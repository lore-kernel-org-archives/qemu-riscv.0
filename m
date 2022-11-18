Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ow0e8-0005r7-C2
	for mharc-qemu-riscv@gnu.org; Fri, 18 Nov 2022 07:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ow0dx-0005p9-Le; Fri, 18 Nov 2022 07:38:54 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ow0dr-0007fN-Uq; Fri, 18 Nov 2022 07:38:51 -0500
Received: from localhost.localdomain (unknown [180.165.240.202])
 by APP-05 (Coremail) with SMTP id zQCowACHj7fNfHdjlWwsCg--.62094S7;
 Fri, 18 Nov 2022 20:38:41 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v5 5/9] target/riscv: add support for Zcb extension
Date: Fri, 18 Nov 2022 20:37:24 +0800
Message-Id: <20221118123728.49319-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
References: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHj7fNfHdjlWwsCg--.62094S7
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1Dtw13Cr18try7tF15XFb_yoW7uw1UpF
 1xCryUGFyqgFWIyayfKF43XF17Wr4fWrWUK39xAw1kGayYgFWDJr1DK3y3Ka1DXr4DWr4j
 93WDAayUJ3y0qa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAv
 wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14
 v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
X-Originating-IP: [180.165.240.202]
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
X-List-Received-Date: Fri, 18 Nov 2022 12:38:54 -0000

Add encode and trans* functions support for Zcb instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn16.decode                |  24 ++++++
 target/riscv/insn_trans/trans_rvzce.c.inc | 100 ++++++++++++++++++++++
 target/riscv/translate.c                  |   2 +
 3 files changed, 126 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index b62664b6af..47603ec1e0 100644
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
@@ -89,6 +92,13 @@
 
 @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
 
+@zcb_unary    ... ...  ... .. ... ..  &r2                  rs1=%rs1_3 rd=%rs1_3
+@zcb_binary   ... ...  ... .. ... ..  &r  rs2=%rs2_3       rs1=%rs1_3 rd=%rs1_3
+@zcb_lb       ... . .. ... .. ... ..  &i  imm=%zcb_b_uimm  rs1=%rs1_3 rd=%rs2_3
+@zcb_lh       ... . .. ... .. ... ..  &i  imm=%zcb_h_uimm  rs1=%rs1_3 rd=%rs2_3
+@zcb_sb       ... . .. ... .. ... ..  &s  imm=%zcb_b_uimm  rs1=%rs1_3 rs2=%rs2_3
+@zcb_sh       ... . .. ... .. ... ..  &s  imm=%zcb_h_uimm  rs1=%rs1_3 rs2=%rs2_3
+
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
   # Opcode of all zeros is illegal; rd != 0, nzuimm == 0 is reserved.
@@ -180,3 +190,17 @@ sw                110 .  .....  ..... 10 @c_swsp
   sd              111 .  .....  ..... 10 @c_sdsp
   c_fsw           111 .  .....  ..... 10 @c_swsp
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
+c_lbu             100 000  ... .. ... 00 @zcb_lb
+c_lhu             100 001  ... 0. ... 00 @zcb_lh
+c_lh              100 001  ... 1. ... 00 @zcb_lh
+c_sb              100 010  ... .. ... 00 @zcb_sb
+c_sh              100 011  ... 0. ... 00 @zcb_sh
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
new file mode 100644
index 0000000000..de96c4afaf
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -0,0 +1,100 @@
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
+static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_load(ctx, a, MO_UB);
+}
+
+static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_load(ctx, a, MO_UW);
+}
+
+static bool trans_c_lh(DisasContext *ctx, arg_c_lh *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_load(ctx, a, MO_SW);
+}
+
+static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_store(ctx, a, MO_UB);
+}
+
+static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
+{
+    REQUIRE_ZCB(ctx);
+    return gen_store(ctx, a, MO_UW);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ee24b451e3..ca01da3309 100644
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


