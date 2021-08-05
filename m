Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTZI-0008HH-Ex
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 22:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTZF-0008Dc-AJ; Wed, 04 Aug 2021 22:57:09 -0400
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:36272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTZC-0006ma-Cy; Wed, 04 Aug 2021 22:57:09 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0743679|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0510524-0.00286427-0.946083;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYBBHl_1628132221; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYBBHl_1628132221)
 by smtp.aliyun-inc.com(10.147.42.22); Thu, 05 Aug 2021 10:57:02 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 04/13] target/riscv: Support UXL32 for slit/sltiu
Date: Thu,  5 Aug 2021 10:53:03 +0800
Message-Id: <20210805025312.15720-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.173; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-173.mail.aliyun.com
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
X-List-Received-Date: Thu, 05 Aug 2021 02:57:10 -0000

For slitu, the imm is sign-extend before unsigned compare. Thus we
should only use the LSB 32 bits of the imm for UXL32.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc |  8 ++---
 target/riscv/translate.c                | 44 +++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 6823a6b3e0..6201c07795 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -276,12 +276,12 @@ static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
 
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
-    return gen_arith_imm_tl(ctx, a, &gen_slt);
+    return gen_arith_simm_tl(ctx, a, &gen_slt);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    return gen_arith_imm_tl(ctx, a, &gen_sltu);
+    return gen_arith_uimm_tl(ctx, a, &gen_sltu);
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
@@ -328,12 +328,12 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a)
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    return gen_arith(ctx, a, &gen_slt);
+    return gen_arith_s(ctx, a, &gen_slt);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    return gen_arith(ctx, a, &gen_sltu);
+    return gen_arith_u(ctx, a, &gen_sltu);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d334a9db86..912e5f1061 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -494,6 +494,28 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
     return true;
 }
 
+static bool gen_arith_simm_tl(DisasContext *ctx, arg_i *a,
+                              void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src_s(ctx, a->rs1);
+    TCGv src2 = tcg_constant_tl(a->imm);
+
+    (*func)(dest, src1, src2);
+    return true;
+}
+
+static bool gen_arith_uimm_tl(DisasContext *ctx, arg_i *a,
+                              void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src_u(ctx, a->rs1);
+    TCGv src2 = tcg_constant_tl(ctx->uxl32 ? a->imm & UINT32_MAX : a->imm);
+
+    (*func)(dest, src1, src2);
+    return true;
+}
+
 static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_add_tl(ret, arg1, arg2);
@@ -779,6 +801,28 @@ static bool gen_arith(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static bool gen_arith_u(DisasContext *ctx, arg_r *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src_u(ctx, a->rs1);
+    TCGv src2 = gpr_src_u(ctx, a->rs2);
+
+    (*func)(dest, src1, src2);
+    return true;
+}
+
+static bool gen_arith_s(DisasContext *ctx, arg_r *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src_s(ctx, a->rs1);
+    TCGv src2 = gpr_src_s(ctx, a->rs2);
+
+    (*func)(dest, src1, src2);
+    return true;
+}
+
 static bool gen_shift(DisasContext *ctx, arg_r *a,
                         void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


