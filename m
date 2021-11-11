Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlCWR-00069L-VL
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 11:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCWP-00060c-GZ; Thu, 11 Nov 2021 11:01:53 -0500
Received: from out29-52.mail.aliyun.com ([115.124.29.52]:37223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCWL-0000vB-Sv; Thu, 11 Nov 2021 11:01:53 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07609383|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_regular_dialog|0.411451-0.000991827-0.587557;
 FP=449214936364103999|2|2|6|0|-1|-1|-1; HT=ay29a033018047209;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LrJ34Tr_1636646501; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrJ34Tr_1636646501)
 by smtp.aliyun-inc.com(10.147.41.158);
 Fri, 12 Nov 2021 00:01:41 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v4 19/20] target/riscv: Adjust scalar reg in vector with XLEN
Date: Thu, 11 Nov 2021 23:51:48 +0800
Message-Id: <20211111155149.58172-20-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.29.52; envelope-from=zhiwei_liu@c-sky.com;
 helo=out29-52.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 16:01:54 -0000

When sew <= 32bits, not need to extend scalar reg.
When sew > 32bits, if xlen is less that sew, we should sign extend
the scalar register, except explicitly specified by the spec.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 44 ++++++++++++++++++-------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6cc83356d9..ce566cf73b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -833,7 +833,7 @@ typedef void gen_helper_opivx(TCGv_ptr, TCGv_ptr, TCGv, TCGv_ptr,
                               TCGv_env, TCGv_i32);
 
 static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
-                        gen_helper_opivx *fn, DisasContext *s)
+                        gen_helper_opivx *fn, DisasContext *s, DisasExtend ext)
 {
     TCGv_ptr dest, src2, mask;
     TCGv src1;
@@ -846,7 +846,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    src1 = get_gpr(s, rs1, EXT_NONE);
+    src1 = get_gpr(s, rs1, ext);
 
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
@@ -895,7 +895,7 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
         tcg_temp_free_i64(src1);
         return true;
     }
-    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, EXT_SIGN);
 }
 
 /* OPIVX with GVEC IR */
@@ -1128,7 +1128,7 @@ static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
                            gen_helper_opivx *fn)
 {
     if (opivx_widen_check(s, a)) {
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, EXT_SIGN);
     }
     return false;
 }
@@ -1213,7 +1213,7 @@ static bool do_opiwx_widen(DisasContext *s, arg_rmrr *a,
                            gen_helper_opivx *fn)
 {
     if (opiwx_widen_check(s, a)) {
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, EXT_SIGN);
     }
     return false;
 }
@@ -1312,7 +1312,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
             gen_helper_##NAME##_w, gen_helper_##NAME##_d,                \
         };                                                               \
                                                                          \
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s);\
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
+                           fns[s->sew], s, EXT_SIGN);                    \
     }                                                                    \
     return false;                                                        \
 }
@@ -1386,7 +1387,7 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
         tcg_temp_free_i32(src1);
         return true;
     }
-    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, EXT_SIGN);
 }
 
 #define GEN_OPIVX_GVEC_SHIFT_TRANS(NAME, SUF) \
@@ -1472,7 +1473,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
             gen_helper_##NAME##_h,                                       \
             gen_helper_##NAME##_w,                                       \
         };                                                               \
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s);\
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
+                           fns[s->sew], s, EXT_SIGN);                    \
     }                                                                    \
     return false;                                                        \
 }
@@ -2670,6 +2672,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         /* This instruction ignores LMUL and vector register groups */
         int maxsz = s->vlen >> 3;
         TCGv_i64 t1;
+        TCGv src1 = get_gpr(s, a->rs1, EXT_ZERO);
         TCGLabel *over = gen_new_label();
 
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2679,7 +2682,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         }
 
         t1 = tcg_temp_new_i64();
-        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
+        tcg_gen_extu_tl_i64(t1, src1);
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
     done:
@@ -2748,12 +2751,28 @@ static bool slideup_check(DisasContext *s, arg_rmrr *a)
             (a->rd != a->rs2));
 }
 
+/* OPIVXU without GVEC IR */
+#define GEN_OPIVXU_TRANS(NAME, CHECK)                                    \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
+{                                                                        \
+    if (CHECK(s, a)) {                                                   \
+        static gen_helper_opivx * const fns[4] = {                       \
+            gen_helper_##NAME##_b, gen_helper_##NAME##_h,                \
+            gen_helper_##NAME##_w, gen_helper_##NAME##_d,                \
+        };                                                               \
+                                                                         \
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
+                           fns[s->sew], s, EXT_ZERO);                    \
+    }                                                                    \
+    return false;                                                        \
+}
+
 GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
-GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
+GEN_OPIVXU_TRANS(vslide1up_vx, slideup_check)
 GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
 
 GEN_OPIVX_TRANS(vslidedown_vx, opivx_check)
-GEN_OPIVX_TRANS(vslide1down_vx, opivx_check)
+GEN_OPIVXU_TRANS(vslide1down_vx, opivx_check)
 GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, opivx_check)
 
 /* Vector Register Gather Instruction */
@@ -2803,7 +2822,8 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
             gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
             gen_helper_vrgather_vx_w, gen_helper_vrgather_vx_d
         };
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s);
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm,
+                           fns[s->sew], s, EXT_SIGN);
     }
     return true;
 }
-- 
2.25.1


