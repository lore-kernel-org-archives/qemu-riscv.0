Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D3EEB64DB
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 06:34:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9gYf-00077Y-VC; Thu, 15 Jun 2023 02:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gXs-0006SV-HO; Thu, 15 Jun 2023 02:33:24 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gXp-0004A0-LF; Thu, 15 Jun 2023 02:33:24 -0400
Received: from localhost.localdomain (unknown [117.61.111.213])
 by APP-05 (Coremail) with SMTP id zQCowAD3_h6isIpkuxShAg--.21989S5;
 Thu, 15 Jun 2023 14:33:14 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/6] target/riscv: Add support for Zvfbfmin extension
Date: Thu, 15 Jun 2023 14:32:59 +0800
Message-Id: <20230615063302.102409-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
References: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_h6isIpkuxShAg--.21989S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr13Arykur4DZr48uF15urg_yoW7Gw4DpF
 4xGrya939xGryxAanYqF45Ar45Grs3C3yUZwn3Kw4kCayUWrZ8XryDt3y3KrWjyrykur1j
 9a1jyFy3uws5AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU
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

Add trans_* and helper function for Zvfbfmin instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                      |  3 +
 target/riscv/insn32.decode                 |  4 ++
 target/riscv/insn_trans/trans_rvbf16.c.inc | 64 ++++++++++++++++++++++
 target/riscv/vector_helper.c               |  6 ++
 4 files changed, 77 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ef8487f1ee..fc48853e07 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1157,3 +1157,6 @@ DEF_HELPER_FLAGS_2(cm_jalt, TCG_CALL_NO_WG, tl, env, i32)
 /* BF16 functions */
 DEF_HELPER_FLAGS_2(fcvt_bf16_s, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_s_bf16, TCG_CALL_NO_RWG, i64, env, i64)
+
+DEF_HELPER_5(vfncvtbf16_f_f_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvtbf16_f_f_v, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 45fdcad185..10d001f14d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -912,3 +912,7 @@ czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
 # *** Zfbfmin Standard Extension ***
 fcvt_bf16_s       0100010  01000 ..... ... ..... 1010011 @r2_rm
 fcvt_s_bf16       0100000  00110 ..... ... ..... 1010011 @r2_rm
+
+# *** Zvfbfmin Standard Extension ***
+vfncvtbf16_f_f_w  010010 . ..... 11101 001 ..... 1010111 @r2_vm
+vfwcvtbf16_f_f_v  010010 . ..... 01101 001 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvbf16.c.inc b/target/riscv/insn_trans/trans_rvbf16.c.inc
index 8cafde505f..f794a3f745 100644
--- a/target/riscv/insn_trans/trans_rvbf16.c.inc
+++ b/target/riscv/insn_trans/trans_rvbf16.c.inc
@@ -22,6 +22,12 @@
     } \
 } while (0)
 
+#define REQUIRE_ZVFBFMIN(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zvfbfmin) { \
+        return false; \
+    } \
+} while (0)
+
 static bool trans_fcvt_bf16_s(DisasContext *ctx, arg_fcvt_bf16_s *a)
 {
     REQUIRE_FPU;
@@ -51,3 +57,61 @@ static bool trans_fcvt_s_bf16(DisasContext *ctx, arg_fcvt_s_bf16 *a)
     mark_fs_dirty(ctx);
     return true;
 }
+
+static bool trans_vfncvtbf16_f_f_w(DisasContext *ctx, arg_vfncvtbf16_f_f_w *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZVFBFMIN(ctx);
+
+    if (opfv_narrow_check(ctx, a) && (ctx->sew == MO_16)) {
+        uint32_t data = 0;
+        TCGLabel *over = gen_new_label();
+
+        gen_set_rm_chkfrm(ctx, RISCV_FRM_DYN);
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
+
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, ctx->lmul);
+        data = FIELD_DP32(data, VDATA, VTA, ctx->vta);
+        data = FIELD_DP32(data, VDATA, VMA, ctx->vma);
+        tcg_gen_gvec_3_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
+                           vreg_ofs(ctx, a->rs2), cpu_env,
+                           ctx->cfg_ptr->vlen / 8,
+                           ctx->cfg_ptr->vlen / 8, data,
+                           gen_helper_vfncvtbf16_f_f_w);
+        mark_vs_dirty(ctx);
+        gen_set_label(over);
+        return true;
+    }
+    return false;
+}
+
+static bool trans_vfwcvtbf16_f_f_v(DisasContext *ctx, arg_vfwcvtbf16_f_f_v *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZVFBFMIN(ctx);
+
+    if (opfv_widen_check(ctx, a) && (ctx->sew == MO_16)) {
+        uint32_t data = 0;
+        TCGLabel *over = gen_new_label();
+
+        gen_set_rm_chkfrm(ctx, RISCV_FRM_DYN);
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
+
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, ctx->lmul);
+        data = FIELD_DP32(data, VDATA, VTA, ctx->vta);
+        data = FIELD_DP32(data, VDATA, VMA, ctx->vma);
+        tcg_gen_gvec_3_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
+                           vreg_ofs(ctx, a->rs2), cpu_env,
+                           ctx->cfg_ptr->vlen / 8,
+                           ctx->cfg_ptr->vlen / 8, data,
+                           gen_helper_vfwcvtbf16_f_f_v);
+        mark_vs_dirty(ctx);
+        gen_set_label(over);
+        return true;
+    }
+    return false;
+}
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1e06e7447c..4d2bd42155 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4535,6 +4535,9 @@ RVVCALL(OPFVV1, vfwcvt_f_f_v_w, WOP_UU_W, H8, H4, float32_to_float64)
 GEN_VEXT_V_ENV(vfwcvt_f_f_v_h, 4)
 GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 8)
 
+RVVCALL(OPFVV1, vfwcvtbf16_f_f_v, WOP_UU_H, H4, H2, bfloat16_to_float32)
+GEN_VEXT_V_ENV(vfwcvtbf16_f_f_v, 4)
+
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
 #define NOP_UU_B uint8_t,  uint16_t, uint32_t
@@ -4581,6 +4584,9 @@ RVVCALL(OPFVV1, vfncvt_f_f_w_w, NOP_UU_W, H4, H8, float64_to_float32)
 GEN_VEXT_V_ENV(vfncvt_f_f_w_h, 2)
 GEN_VEXT_V_ENV(vfncvt_f_f_w_w, 4)
 
+RVVCALL(OPFVV1, vfncvtbf16_f_f_w, NOP_UU_H, H2, H4, float32_to_bfloat16)
+GEN_VEXT_V_ENV(vfncvtbf16_f_f_w, 2)
+
 /*
  * Vector Reduction Operations
  */
-- 
2.25.1


