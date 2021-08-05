Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTbi-0006xz-Ac
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 22:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTbg-0006sB-OI; Wed, 04 Aug 2021 22:59:40 -0400
Received: from out28-197.mail.aliyun.com ([115.124.28.197]:42927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTbe-0000SN-Rq; Wed, 04 Aug 2021 22:59:40 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07594667|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0254385-0.000642626-0.973919;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYYLWy_1628132374; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYYLWy_1628132374)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 05 Aug 2021 10:59:34 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 09/13] target/riscv: Support UXL32 for atomic instructions
Date: Thu,  5 Aug 2021 10:53:08 +0800
Message-Id: <20210805025312.15720-10-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.197; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-197.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Aug 2021 02:59:41 -0000

Only load or store 32 bits data for atomic instructions when UXL32.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rva.c.inc | 36 ++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 5bb5bbd09c..07c94416e5 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -20,12 +20,19 @@
 
 static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src1 = gpr_src_u(ctx, a->rs1);
 
     /* Put addr in load_res, data in load_val.  */
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
+    if (ctx->uxl32) {
+        TCGv_i32 val = tcg_temp_new_i32();
+        tcg_gen_qemu_ld_i32(val, src1, ctx->mem_idx, mop);
+        tcg_gen_extu_i32_tl(load_val, val);
+    } else {
+        tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
+    }
     tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -39,8 +46,8 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
     TCGv dest = gpr_dst(ctx, a->rd);
-    TCGv src1 = gpr_src(ctx, a->rs1);
-    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv src1 = gpr_src_u(ctx, a->rs1);
+    TCGv src2 = gpr_src_u(ctx, a->rs2);
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
 
@@ -50,8 +57,25 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
      * Note that the TCG atomic primitives are SC,
      * so we can ignore AQ/RL along this path.
      */
-    tcg_gen_atomic_cmpxchg_tl(dest, load_res, load_val, src2,
-                              ctx->mem_idx, mop);
+    if (ctx->uxl32) {
+        TCGv_i32 retv, cmpv, newv;
+        retv = tcg_temp_new_i32();
+        cmpv = tcg_temp_new_i32();
+        newv = tcg_temp_new_i32();
+        tcg_gen_trunc_tl_i32(cmpv, load_val);
+        tcg_gen_trunc_tl_i32(newv, src2);
+
+        tcg_gen_atomic_cmpxchg_i32(retv, load_res, cmpv, newv,
+                                   ctx->mem_idx, mop);
+
+        tcg_gen_extu_i32_tl(dest, retv);
+        tcg_temp_free_i32(retv);
+        tcg_temp_free_i32(cmpv);
+        tcg_temp_free_i32(newv);
+    } else {
+        tcg_gen_atomic_cmpxchg_tl(dest, load_res, load_val, src2,
+                                  ctx->mem_idx, mop);
+    }
     tcg_gen_setcond_tl(TCG_COND_NE, dest, dest, load_val);
     tcg_gen_br(l2);
 
@@ -78,7 +102,7 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
                     MemOp mop)
 {
     TCGv dest = gpr_dst(ctx, a->rd);
-    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src1 = gpr_src_u(ctx, a->rs1);
     TCGv src2 = gpr_src(ctx, a->rs2);
 
     (*func)(dest, src1, src2, ctx->mem_idx, mop);
-- 
2.17.1


