Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmQL6-0000JZ-6R
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 22:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQL4-0000Ih-LD; Tue, 11 Apr 2023 22:36:02 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQL2-0008UG-E2; Tue, 11 Apr 2023 22:36:02 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowAC3vDABGTZkp2E_EQ--.55592S5;
 Wed, 12 Apr 2023 10:35:48 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC 3/5] target/riscv: Add support for Zvfbfmin extension
Date: Wed, 12 Apr 2023 10:33:18 +0800
Message-Id: <20230412023320.50706-4-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
References: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3vDABGTZkp2E_EQ--.55592S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1UAFWxAF47XFWkZw15CFg_yoW7GF1xpF
 4xGrya939xGFyxAanYqF45Aw45Grs3CayUZwn3Kw4kCay5urZ8XryDK3y3KrWjvrykur1j
 9a1jyFy3uws7AFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbJ73DUU
 UUU==
X-Originating-IP: [180.165.241.15]
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
X-List-Received-Date: Wed, 12 Apr 2023 02:36:02 -0000

Add trans_* and helper function for Zvfbfmin instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/helper.h                      |  3 +
 target/riscv/insn32.decode                 |  4 ++
 target/riscv/insn_trans/trans_rvbf16.c.inc | 64 ++++++++++++++++++++++
 target/riscv/vector_helper.c               |  6 ++
 4 files changed, 77 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 7650168eb0..5a0649112a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1146,3 +1146,6 @@ DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 /* BF16 functions */
 DEF_HELPER_FLAGS_2(fcvt_bf16_s, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_s_bf16, TCG_CALL_NO_RWG, i64, env, i64)
+
+DEF_HELPER_5(vfncvtbf16_f_f_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvtbf16_f_f_v, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 874a5cb974..57ce3a3c8b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -912,3 +912,7 @@ czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
 # *** Zfbfmin Standard Extension ***
 fcvt_bf16_s       0100010  00100 ..... ... ..... 1010011 @r2_rm
 fcvt_s_bf16       0100000  00110 ..... ... ..... 1010011 @r2_rm
+
+# *** Zvfbfmin Standard Extension ***
+vfncvtbf16_f_f_w  010010 . ..... 11101 001 ..... 1010111 @r2_vm
+vfwcvtbf16_f_f_v  010010 . ..... 01101 001 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvbf16.c.inc b/target/riscv/insn_trans/trans_rvbf16.c.inc
index 2a299075d8..8a7449e0c8 100644
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
index 2423affe37..e4e7ac33d9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4514,6 +4514,9 @@ RVVCALL(OPFVV1, vfwcvt_f_f_v_w, WOP_UU_W, H8, H4, float32_to_float64)
 GEN_VEXT_V_ENV(vfwcvt_f_f_v_h, 4)
 GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 8)
 
+RVVCALL(OPFVV1, vfwcvtbf16_f_f_v, WOP_UU_H, H4, H2, bfloat16_to_float32)
+GEN_VEXT_V_ENV(vfwcvtbf16_f_f_v, 4)
+
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
 #define NOP_UU_B uint8_t,  uint16_t, uint32_t
@@ -4558,6 +4561,9 @@ RVVCALL(OPFVV1, vfncvt_f_f_w_w, NOP_UU_W, H4, H8, float64_to_float32)
 GEN_VEXT_V_ENV(vfncvt_f_f_w_h, 2)
 GEN_VEXT_V_ENV(vfncvt_f_f_w_w, 4)
 
+RVVCALL(OPFVV1, vfncvtbf16_f_f_w, NOP_UU_H, H2, H4, float32_to_bfloat16)
+GEN_VEXT_V_ENV(vfncvtbf16_f_f_w, 2)
+
 /*
  *** Vector Reduction Operations
  */
-- 
2.25.1


