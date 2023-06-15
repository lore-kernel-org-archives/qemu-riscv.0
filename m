Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8573CEB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 06:34:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9gYf-00075W-CM; Thu, 15 Jun 2023 02:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gY0-0006Vj-03; Thu, 15 Jun 2023 02:33:32 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gXr-0004AL-Ru; Thu, 15 Jun 2023 02:33:25 -0400
Received: from localhost.localdomain (unknown [117.61.111.213])
 by APP-05 (Coremail) with SMTP id zQCowAD3_h6isIpkuxShAg--.21989S6;
 Thu, 15 Jun 2023 14:33:16 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 4/6] target/riscv: Add support for Zvfbfwma extension
Date: Thu, 15 Jun 2023 14:33:00 +0800
Message-Id: <20230615063302.102409-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
References: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_h6isIpkuxShAg--.21989S6
X-Coremail-Antispam: 1UD129KBjvJXoWxAF45Gr48trWDKF1rZryrZwb_yoWrKw1xpF
 4xGrya939xCFyxAa1ftF45Aw4Ygws3Gw4UAwn3WwsxAay7GrZ8Jryqyw4Ikr4jvFWDur42
 9ayqyry3Cws2qa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTY
 UUUUU
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

Add trans_* and helper function for Zvfbfwma instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                      |  3 ++
 target/riscv/insn32.decode                 |  4 ++
 target/riscv/insn_trans/trans_rvbf16.c.inc | 58 ++++++++++++++++++++++
 target/riscv/vector_helper.c               | 11 ++++
 4 files changed, 76 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index fc48853e07..3170b8daa6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1160,3 +1160,6 @@ DEF_HELPER_FLAGS_2(fcvt_s_bf16, TCG_CALL_NO_RWG, i64, env, i64)
 
 DEF_HELPER_5(vfncvtbf16_f_f_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvtbf16_f_f_v, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vfwmaccbf16_vv, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmaccbf16_vf, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 10d001f14d..8c5d293f07 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -916,3 +916,7 @@ fcvt_s_bf16       0100000  00110 ..... ... ..... 1010011 @r2_rm
 # *** Zvfbfmin Standard Extension ***
 vfncvtbf16_f_f_w  010010 . ..... 11101 001 ..... 1010111 @r2_vm
 vfwcvtbf16_f_f_v  010010 . ..... 01101 001 ..... 1010111 @r2_vm
+
+# *** Zvfbfwma Standard Extension ***
+vfwmaccbf16_vv    111011 . ..... ..... 001 ..... 1010111 @r_vm
+vfwmaccbf16_vf    111011 . ..... ..... 101 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvbf16.c.inc b/target/riscv/insn_trans/trans_rvbf16.c.inc
index f794a3f745..911bc29908 100644
--- a/target/riscv/insn_trans/trans_rvbf16.c.inc
+++ b/target/riscv/insn_trans/trans_rvbf16.c.inc
@@ -28,6 +28,12 @@
     } \
 } while (0)
 
+#define REQUIRE_ZVFBFWMA(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zvfbfwma) { \
+        return false; \
+    } \
+} while (0)
+
 static bool trans_fcvt_bf16_s(DisasContext *ctx, arg_fcvt_bf16_s *a)
 {
     REQUIRE_FPU;
@@ -115,3 +121,55 @@ static bool trans_vfwcvtbf16_f_f_v(DisasContext *ctx, arg_vfwcvtbf16_f_f_v *a)
     }
     return false;
 }
+
+static bool trans_vfwmaccbf16_vv(DisasContext *ctx, arg_vfwmaccbf16_vv *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZVFBFWMA(ctx);
+
+    if (require_rvv(ctx) && vext_check_isa_ill(ctx) && (ctx->sew == MO_16) &&
+        vext_check_dss(ctx, a->rd, a->rs1, a->rs2, a->vm)) {
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
+        tcg_gen_gvec_4_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
+                           vreg_ofs(ctx, a->rs1),
+                           vreg_ofs(ctx, a->rs2), cpu_env,
+                           ctx->cfg_ptr->vlen / 8,
+                           ctx->cfg_ptr->vlen / 8, data,
+                           gen_helper_vfwmaccbf16_vv);
+        mark_vs_dirty(ctx);
+        gen_set_label(over);
+        return true;
+    }
+    return false;
+}
+
+static bool trans_vfwmaccbf16_vf(DisasContext *ctx, arg_vfwmaccbf16_vf *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZVFBFWMA(ctx);
+
+    if (require_rvv(ctx) && (ctx->sew == MO_16) && vext_check_isa_ill(ctx) &&
+        vext_check_ds(ctx, a->rd, a->rs2, a->vm)) {
+        uint32_t data = 0;
+
+        gen_set_rm(ctx, RISCV_FRM_DYN);
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, ctx->lmul);
+        data = FIELD_DP32(data, VDATA, VTA, ctx->vta);
+        data = FIELD_DP32(data, VDATA, VMA, ctx->vma);
+        return opfvf_trans(a->rd, a->rs1, a->rs2, data,
+                           gen_helper_vfwmaccbf16_vf, ctx);
+    }
+
+    return false;
+}
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4d2bd42155..71bb9b4457 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3554,6 +3554,17 @@ RVVCALL(OPFVF3, vfwmacc_vf_w, WOP_UUU_W, H8, H4, fwmacc32)
 GEN_VEXT_VF(vfwmacc_vf_h, 4)
 GEN_VEXT_VF(vfwmacc_vf_w, 8)
 
+static uint32_t fwmaccbf16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
+{
+    return float32_muladd(bfloat16_to_float32(a, s),
+                          bfloat16_to_float32(b, s), d, 0, s);
+}
+
+RVVCALL(OPFVV3, vfwmaccbf16_vv, WOP_UUU_H, H4, H2, H2, fwmaccbf16)
+GEN_VEXT_VV_ENV(vfwmaccbf16_vv, 4)
+RVVCALL(OPFVF3, vfwmaccbf16_vf, WOP_UUU_H, H4, H2, fwmacc16)
+GEN_VEXT_VF(vfwmaccbf16_vf, 4)
+
 static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
 {
     return float32_muladd(float16_to_float32(a, true, s),
-- 
2.25.1


