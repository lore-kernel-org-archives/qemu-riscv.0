Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTYK-0005l7-0o
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 22:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTYG-0005eb-B6; Wed, 04 Aug 2021 22:56:08 -0400
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:57226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTYE-0005x5-9v; Wed, 04 Aug 2021 22:56:08 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436794|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0297705-7.76435e-05-0.970152;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYnsuC_1628132160; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYnsuC_1628132160) by smtp.aliyun-inc.com(10.147.40.2);
 Thu, 05 Aug 2021 10:56:01 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch instructions
Date: Thu,  5 Aug 2021 10:53:01 +0800
Message-Id: <20210805025312.15720-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.100; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-100.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Aug 2021 02:56:09 -0000

When UXLEN is 32 on 64-bit CPU, only use the LSB 32 bits of source
registers and sign-extend or zero-extend it according to different
operations.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 38 ++++++++++++++++++++-----
 target/riscv/translate.c                | 22 ++++++++++++++
 2 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 3705aad380..ea41d1de2d 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -84,11 +84,11 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     return true;
 }
 
-static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
+static bool gen_branch_internal(DisasContext *ctx, arg_b *a,
+                                TCGCond cond,
+                                TCGv src1, TCGv src2)
 {
     TCGLabel *l = gen_new_label();
-    TCGv src1 = gpr_src(ctx, a->rs1);
-    TCGv src2 = gpr_src(ctx, a->rs2);
 
     tcg_gen_brcond_tl(cond, src1, src2, l);
     gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
@@ -106,6 +106,30 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     return true;
 }
 
+static bool gen_branch_s(DisasContext *ctx, arg_b *a, TCGCond cond)
+{
+    TCGv src1 = gpr_src_s(ctx, a->rs1);
+    TCGv src2 = gpr_src_s(ctx, a->rs2);
+
+    return gen_branch_internal(ctx, a, cond, src1, src2);
+}
+
+static bool gen_branch_u(DisasContext *ctx, arg_b *a, TCGCond cond)
+{
+    TCGv src1 = gpr_src_u(ctx, a->rs1);
+    TCGv src2 = gpr_src_u(ctx, a->rs2);
+
+    return gen_branch_internal(ctx, a, cond, src1, src2);
+}
+
+static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
+{
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+
+    return gen_branch_internal(ctx, a, cond, src1, src2);
+}
+
 static bool trans_beq(DisasContext *ctx, arg_beq *a)
 {
     return gen_branch(ctx, a, TCG_COND_EQ);
@@ -118,22 +142,22 @@ static bool trans_bne(DisasContext *ctx, arg_bne *a)
 
 static bool trans_blt(DisasContext *ctx, arg_blt *a)
 {
-    return gen_branch(ctx, a, TCG_COND_LT);
+    return gen_branch_s(ctx, a, TCG_COND_LT);
 }
 
 static bool trans_bge(DisasContext *ctx, arg_bge *a)
 {
-    return gen_branch(ctx, a, TCG_COND_GE);
+    return gen_branch_s(ctx, a, TCG_COND_GE);
 }
 
 static bool trans_bltu(DisasContext *ctx, arg_bltu *a)
 {
-    return gen_branch(ctx, a, TCG_COND_LTU);
+    return gen_branch_u(ctx, a, TCG_COND_LTU);
 }
 
 static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 {
-    return gen_branch(ctx, a, TCG_COND_GEU);
+    return gen_branch_u(ctx, a, TCG_COND_GEU);
 }
 
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ac4a545da8..d334a9db86 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -176,6 +176,28 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
     }
 }
 
+static TCGv gpr_src_u(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0) {
+        return ctx->zero;
+    }
+    if (ctx->uxl32) {
+        tcg_gen_ext32u_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
+    }
+    return cpu_gpr[reg_num];
+}
+
+static TCGv gpr_src_s(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0) {
+        return ctx->zero;
+    }
+    if (ctx->uxl32) {
+        tcg_gen_ext32s_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
+    }
+    return cpu_gpr[reg_num];
+}
+
 /* Wrapper for getting reg values - need to check of reg is zero since
  * cpu_gpr[0] is not actually allocated
  */
-- 
2.17.1


