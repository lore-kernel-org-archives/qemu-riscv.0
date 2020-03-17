Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEFCA-0002W1-5X
	for mharc-qemu-riscv@gnu.org; Tue, 17 Mar 2020 12:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jEFC3-0002ED-87
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 12:35:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jEFC1-0006KM-Mk
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 12:35:51 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:55877)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jEFBx-0004oc-Vq; Tue, 17 Mar 2020 12:35:46 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0821728|-1; CH=blue; DM=||false|;
 DS=CONTINUE|ham_regular_dialog|0.146209-0.000366199-0.853425;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03299; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H1.CCrS_1584462937; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H1.CCrS_1584462937)
 by smtp.aliyun-inc.com(10.147.42.253);
 Wed, 18 Mar 2020 00:35:37 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 44/61] target/riscv: narrowing floating-point/integer
 type-convert instructions
Date: Tue, 17 Mar 2020 23:06:36 +0800
Message-Id: <20200317150653.9008-45-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Tue, 17 Mar 2020 16:35:56 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 11 +++++++
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 42 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 39 +++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b5985f78bf..72bf084d57 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1018,3 +1018,14 @@ DEF_HELPER_5(vfwcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vfncvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_x_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_x_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_xu_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_xu_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfncvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e0efc63ec2..57ac4de1c2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -524,6 +524,11 @@ vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
 vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
 vfwcvt_f_x_v    100010 . ..... 01011 001 ..... 1010111 @r2_vm
 vfwcvt_f_f_v    100010 . ..... 01100 001 ..... 1010111 @r2_vm
+vfncvt_xu_f_v   100010 . ..... 10000 001 ..... 1010111 @r2_vm
+vfncvt_x_f_v    100010 . ..... 10001 001 ..... 1010111 @r2_vm
+vfncvt_f_xu_v   100010 . ..... 10010 001 ..... 1010111 @r2_vm
+vfncvt_f_x_v    100010 . ..... 10011 001 ..... 1010111 @r2_vm
+vfncvt_f_f_v    100010 . ..... 10100 001 ..... 1010111 @r2_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 7e8df1c663..53984da94c 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2118,3 +2118,45 @@ GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v)
 GEN_OPFV_WIDEN_TRANS(vfwcvt_f_xu_v)
 GEN_OPFV_WIDEN_TRANS(vfwcvt_f_x_v)
 GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v)
+
+/* Narrowing Floating-Point/Integer Type-Convert Instructions */
+
+/*
+ * If the current SEW does not correspond to a supported IEEE floating-point
+ * type, an illegal instruction exception is raised
+ */
+static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, true) &&
+            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
+                2 << s->lmul) &&
+            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+}
+
+#define GEN_OPFV_NARROW_TRANS(NAME)                                \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
+{                                                                  \
+    if (opfv_narrow_check(s, a)) {                                 \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_3_ptr * const fns[2] = {            \
+            gen_helper_##NAME##_h,                                 \
+            gen_helper_##NAME##_w,                                 \
+        };                                                         \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
+            vreg_ofs(s, a->rs2), cpu_env, 0,                       \
+            s->vlen / 8, data, fns[s->sew - 1]);                   \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+GEN_OPFV_NARROW_TRANS(vfncvt_xu_f_v)
+GEN_OPFV_NARROW_TRANS(vfncvt_x_f_v)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_v)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_x_v)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_f_v)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 0eb0ce02a8..c34f334127 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4251,3 +4251,42 @@ RVVCALL(OPFVV1, vfwcvt_f_f_v_h, WOP_UU_H, H4, H2, vfwcvtffv16)
 RVVCALL(OPFVV1, vfwcvt_f_f_v_w, WOP_UU_W, H8, H4, float32_to_float64)
 GEN_VEXT_V_ENV(vfwcvt_f_f_v_h, 2, 4, clearl)
 GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8, clearq)
+
+/* Narrowing Floating-Point/Integer Type-Convert Instructions */
+/* (TD, T2, TX2) */
+#define NOP_UU_H uint16_t, uint32_t, uint32_t
+#define NOP_UU_W uint32_t, uint64_t, uint64_t
+/* vfncvt.xu.f.v vd, vs2, vm # Convert float to unsigned integer. */
+RVVCALL(OPFVV1, vfncvt_xu_f_v_h, NOP_UU_H, H2, H4, float32_to_uint16)
+RVVCALL(OPFVV1, vfncvt_xu_f_v_w, NOP_UU_W, H4, H8, float64_to_uint32)
+GEN_VEXT_V_ENV(vfncvt_xu_f_v_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_xu_f_v_w, 4, 4, clearl)
+
+/* vfncvt.x.f.v vd, vs2, vm # Convert double-width float to signed integer. */
+RVVCALL(OPFVV1, vfncvt_x_f_v_h, NOP_UU_H, H2, H4, float32_to_int16)
+RVVCALL(OPFVV1, vfncvt_x_f_v_w, NOP_UU_W, H4, H8, float64_to_int32)
+GEN_VEXT_V_ENV(vfncvt_x_f_v_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_x_f_v_w, 4, 4, clearl)
+
+/* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to float */
+RVVCALL(OPFVV1, vfncvt_f_xu_v_h, NOP_UU_H, H2, H4, uint32_to_float16)
+RVVCALL(OPFVV1, vfncvt_f_xu_v_w, NOP_UU_W, H4, H8, uint64_to_float32)
+GEN_VEXT_V_ENV(vfncvt_f_xu_v_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_f_xu_v_w, 4, 4, clearl)
+
+/* vfncvt.f.x.v vd, vs2, vm # Convert double-width integer to float. */
+RVVCALL(OPFVV1, vfncvt_f_x_v_h, NOP_UU_H, H2, H4, int32_to_float16)
+RVVCALL(OPFVV1, vfncvt_f_x_v_w, NOP_UU_W, H4, H8, int64_to_float32)
+GEN_VEXT_V_ENV(vfncvt_f_x_v_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_f_x_v_w, 4, 4, clearl)
+
+/* vfncvt.f.f.v vd, vs2, vm # Convert double float to single-width float. */
+static uint16_t vfncvtffv16(uint32_t a, float_status *s)
+{
+    return float32_to_float16(a, true, s);
+}
+
+RVVCALL(OPFVV1, vfncvt_f_f_v_h, NOP_UU_H, H2, H4, vfncvtffv16)
+RVVCALL(OPFVV1, vfncvt_f_f_v_w, NOP_UU_W, H4, H8, float64_to_float32)
+GEN_VEXT_V_ENV(vfncvt_f_f_v_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfncvt_f_f_v_w, 4, 4, clearl)
-- 
2.23.0


