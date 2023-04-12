Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmQL3-0000Hc-13
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 22:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQL1-0000Gk-H7; Tue, 11 Apr 2023 22:35:59 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQKx-0008NM-7X; Tue, 11 Apr 2023 22:35:59 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowAC3vDABGTZkp2E_EQ--.55592S6;
 Wed, 12 Apr 2023 10:35:48 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC 4/5] target/riscv: Add support for Zvfbfwma extension
Date: Wed, 12 Apr 2023 10:33:19 +0800
Message-Id: <20230412023320.50706-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
References: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3vDABGTZkp2E_EQ--.55592S6
X-Coremail-Antispam: 1UD129KBjvJXoWxKFWUJF4rZr1xZr45Cry3Jwb_yoWxAry7pF
 WxGFWa9398GFyxAa1rtF45Aa12gwsakw4UGwna9ws5AayUGrZ8Xr1qy3y7Kr4jyFWDur4Y
 ka1jyFW5Cw4vqFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUma14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
 6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
 14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
 CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
 MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
 4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
 vfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
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
X-List-Received-Date: Wed, 12 Apr 2023 02:35:59 -0000

Add trans_* and helper function for Zvfbfwma instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/helper.h                      |  3 ++
 target/riscv/insn32.decode                 |  4 ++
 target/riscv/insn_trans/trans_rvbf16.c.inc | 58 ++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvzfh.c.inc  | 13 ++---
 target/riscv/vector_helper.c               | 11 ++++
 5 files changed, 83 insertions(+), 6 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 5a0649112a..afed7643c2 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1149,3 +1149,6 @@ DEF_HELPER_FLAGS_2(fcvt_s_bf16, TCG_CALL_NO_RWG, i64, env, i64)
 
 DEF_HELPER_5(vfncvtbf16_f_f_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvtbf16_f_f_v, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vfwmaccbf16_vv, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwmaccbf16_vf, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 57ce3a3c8b..6817bf39b1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -916,3 +916,7 @@ fcvt_s_bf16       0100000  00110 ..... ... ..... 1010011 @r2_rm
 # *** Zvfbfmin Standard Extension ***
 vfncvtbf16_f_f_w  010010 . ..... 11101 001 ..... 1010111 @r2_vm
 vfwcvtbf16_f_f_v  010010 . ..... 01101 001 ..... 1010111 @r2_vm
+
+# *** Zvfbfwma Standard Extension ***
+vfwmaccbf16_vv    100011 . ..... ..... 001 ..... 1010111 @r_vm
+vfwmaccbf16_vf    100011 . ..... ..... 101 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvbf16.c.inc b/target/riscv/insn_trans/trans_rvbf16.c.inc
index 8a7449e0c8..ca646dca29 100644
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
+static bool trans_vfwmaccbf16_vf(DisasContext *ctx, arg_vfwmaccbf16_vf *a)           \
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
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 8b1e2519bb..9cf1f9f0e2 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -28,8 +28,9 @@
     }                                  \
 } while (0)
 
-#define REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx) do {   \
-    if (!ctx->cfg_ptr->ext_zfhmin && !ctx->cfg_ptr->ext_zfbfmin) { \
+#define REQUIRE_ZFHMIN_OR_ZFBFMIN_OR_ZVFBFWMA(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zfhmin && !ctx->cfg_ptr->ext_zfbfmin && \
+        !ctx->cfg_ptr->ext_zvfbfwma) {        \
         return false;                         \
     }                                         \
 } while (0)
@@ -46,7 +47,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN_OR_ZVFBFWMA(ctx);
 
     decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -69,7 +70,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN_OR_ZVFBFWMA(ctx);
 
     decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -574,7 +575,7 @@ static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
 static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN_OR_ZVFBFWMA(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
 
@@ -594,7 +595,7 @@ static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZFBFMIN_OR_ZVFBFWMA(ctx);
 
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_ZERO);
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e4e7ac33d9..a8ab39ed8e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3541,6 +3541,17 @@ RVVCALL(OPFVF3, vfwmacc_vf_w, WOP_UUU_W, H8, H4, fwmacc32)
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


