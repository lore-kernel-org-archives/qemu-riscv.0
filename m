Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19953EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 06:37:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9gbc-0003z1-Ni; Thu, 15 Jun 2023 02:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gXz-0006Vi-VZ; Thu, 15 Jun 2023 02:33:32 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gXp-00049h-Mc; Thu, 15 Jun 2023 02:33:25 -0400
Received: from localhost.localdomain (unknown [117.61.111.213])
 by APP-05 (Coremail) with SMTP id zQCowAD3_h6isIpkuxShAg--.21989S4;
 Thu, 15 Jun 2023 14:33:12 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/6] target/riscv: Add support for Zfbfmin extension
Date: Thu, 15 Jun 2023 14:32:58 +0800
Message-Id: <20230615063302.102409-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
References: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_h6isIpkuxShAg--.21989S4
X-Coremail-Antispam: 1UD129KBjvJXoWxKr4fGw13tF1xZF17CryUKFg_yoWxWFy8pF
 4fCFW7C3ykJFyxZayfKa15AF17Ga1fKw4UJwn3Kw1kJay5GrZ8Zr4DK3y3KrWDJFyqgr1Y
 93WjyFy5ArW0qa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU
 =
X-Originating-IP: [117.61.111.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add trans_* and helper function for Zfbfmin instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/fpu_helper.c                  | 12 +++++
 target/riscv/helper.h                      |  4 ++
 target/riscv/insn32.decode                 |  4 ++
 target/riscv/insn_trans/trans_rvbf16.c.inc | 53 ++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvzfh.c.inc  | 12 ++---
 target/riscv/translate.c                   |  1 +
 6 files changed, 80 insertions(+), 6 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvbf16.c.inc

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 5dd14d8390..eb5ee5c4c9 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -593,3 +593,15 @@ uint64_t helper_fcvt_d_h(CPURISCVState *env, uint64_t rs1)
     float16 frs1 = check_nanbox_h(env, rs1);
     return float16_to_float64(frs1, true, &env->fp_status);
 }
+
+uint64_t helper_fcvt_bf16_s(CPURISCVState *env, uint64_t rs1)
+{
+    float32 frs1 = check_nanbox_s(env, rs1);
+    return nanbox_h(env, float32_to_bfloat16(frs1, &env->fp_status));
+}
+
+uint64_t helper_fcvt_s_bf16(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(env, rs1);
+    return nanbox_s(env, bfloat16_to_float32(frs1, &env->fp_status));
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 98e97810fd..ef8487f1ee 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1153,3 +1153,7 @@ DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 
 /* Zce helper */
 DEF_HELPER_FLAGS_2(cm_jalt, TCG_CALL_NO_WG, tl, env, i32)
+
+/* BF16 functions */
+DEF_HELPER_FLAGS_2(fcvt_bf16_s, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_s_bf16, TCG_CALL_NO_RWG, i64, env, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 73d5d1b045..45fdcad185 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -908,3 +908,7 @@ sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
 # *** RV32 Zicond Standard Extension ***
 czero_eqz   0000111  ..... ..... 101 ..... 0110011 @r
 czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
+
+# *** Zfbfmin Standard Extension ***
+fcvt_bf16_s       0100010  01000 ..... ... ..... 1010011 @r2_rm
+fcvt_s_bf16       0100000  00110 ..... ... ..... 1010011 @r2_rm
diff --git a/target/riscv/insn_trans/trans_rvbf16.c.inc b/target/riscv/insn_trans/trans_rvbf16.c.inc
new file mode 100644
index 0000000000..8cafde505f
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvbf16.c.inc
@@ -0,0 +1,53 @@
+/*
+ * RISC-V translation routines for the BF16 Standard Extensions.
+ *
+ * Copyright (c) 2020-2023 PLCT Lab
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
+#define REQUIRE_ZFBFMIN(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zfbfmin) { \
+        return false; \
+    } \
+} while (0)
+
+static bool trans_fcvt_bf16_s(DisasContext *ctx, arg_fcvt_bf16_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFBFMIN(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_bf16_s(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_s_bf16(DisasContext *ctx, arg_fcvt_s_bf16 *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFBFMIN(ctx);
+
+    TCGv_i64 dest = dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_bf16(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
+    mark_fs_dirty(ctx);
+    return true;
+}
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 74dde37ff7..8b1e2519bb 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -28,8 +28,8 @@
     }                                  \
 } while (0)
 
-#define REQUIRE_ZFHMIN(ctx) do {              \
-    if (!ctx->cfg_ptr->ext_zfhmin) {          \
+#define REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx) do {   \
+    if (!ctx->cfg_ptr->ext_zfhmin && !ctx->cfg_ptr->ext_zfbfmin) { \
         return false;                         \
     }                                         \
 } while (0)
@@ -46,7 +46,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -69,7 +69,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -574,7 +574,7 @@ static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
 static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
 
@@ -594,7 +594,7 @@ static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
 
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_ZERO);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8a33da811e..0ce2b97ba5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1108,6 +1108,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
+#include "insn_trans/trans_rvbf16.c.inc"
 #include "decode-xthead.c.inc"
 #include "insn_trans/trans_xthead.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
-- 
2.25.1


