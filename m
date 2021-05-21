Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljy1W-0000Lh-G9
	for mharc-qemu-riscv@gnu.org; Fri, 21 May 2021 01:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ljy1P-0000J5-GW; Fri, 21 May 2021 01:48:31 -0400
Received: from out28-125.mail.aliyun.com ([115.124.28.125]:40769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ljy1K-0004MZ-UU; Fri, 21 May 2021 01:48:31 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07608247|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.029893-8.29618e-06-0.970099;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KGbeFOF_1621576098; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KGbeFOF_1621576098)
 by smtp.aliyun-inc.com(10.147.42.241);
 Fri, 21 May 2021 13:48:18 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH] target/riscv: Pass the same value to oprsz and maxsz.
Date: Fri, 21 May 2021 13:48:16 +0800
Message-Id: <20210521054816.1784297-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.125; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-125.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 May 2021 05:48:36 -0000

Since commit e2e7168a214b0ed98dc357bba96816486a289762, if oprsz
is still zero(as we don't use this field), simd_desc will trigger an
assert.

Besides, tcg_gen_gvec_*_ptr calls simd_desc in it's implementation.
Here we pass the value to maxsz and oprsz to bypass the assert.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 89 ++++++++++++++-----------
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 47914a3b69..83d9a285ba 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -183,7 +183,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
      */
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -334,7 +334,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     mask = tcg_temp_new_ptr();
     base = tcg_temp_new();
     stride = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     gen_get_gpr(stride, rs2);
@@ -462,7 +462,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
     base = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -594,7 +594,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     base = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -671,7 +671,7 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
     base = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -831,7 +831,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
-                           cpu_env, 0, s->vlen / 8, data, fn);
+                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
     }
     gen_set_label(over);
     return true;
@@ -874,7 +874,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1021,7 +1021,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1119,7 +1119,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-                           cpu_env, 0, s->vlen / 8,
+                           cpu_env, s->vlen / 8, s->vlen / 8,
                            data, fn);
         gen_set_label(over);
         return true;
@@ -1207,7 +1207,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-                           cpu_env, 0, s->vlen / 8, data, fn);
+                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
         gen_set_label(over);
         return true;
     }
@@ -1284,8 +1284,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew]);        \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew]);                           \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1473,8 +1474,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew]);        \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew]);                           \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1690,7 +1692,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
             };
 
             tcg_gen_ext_tl_i64(s1_i64, s1);
-            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1_i64, cpu_env, desc);
 
@@ -1729,7 +1731,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
 
             s1 = tcg_const_i64(simm);
             dest = tcg_temp_new_ptr();
-            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1, cpu_env, desc);
 
@@ -1838,8 +1840,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -1863,7 +1866,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1950,8 +1953,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
                            vreg_ofs(s, a->rs1),                  \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,      \
-                           s->vlen / 8, data, fns[s->sew - 1]);  \
+                           vreg_ofs(s, a->rs2), cpu_env,         \
+                           s->vlen / 8, s->vlen / 8, data,       \
+                           fns[s->sew - 1]);                     \
         gen_set_label(over);                                     \
         return true;                                             \
     }                                                            \
@@ -2024,8 +2028,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2138,8 +2143,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2225,7 +2231,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
             dest = tcg_temp_new_ptr();
-            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
 
@@ -2278,8 +2284,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2326,8 +2333,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data,         \
+                           fns[s->sew - 1]);                       \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2388,8 +2396,8 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fn);                 \
+                           vreg_ofs(s, a->rs2), cpu_env,           \
+                           s->vlen / 8, s->vlen / 8, data, fn);    \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2420,7 +2428,7 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
         dst = tcg_temp_new();
-        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+        desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -2452,7 +2460,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
         dst = tcg_temp_new();
-        desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+        desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -2486,7 +2494,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
-                           cpu_env, 0, s->vlen / 8, data, fn);     \
+                           cpu_env, s->vlen / 8, s->vlen / 8,      \
+                           data, fn);                              \
         gen_set_label(over);                                       \
         return true;                                               \
     }                                                              \
@@ -2516,8 +2525,8 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
             gen_helper_viota_m_w, gen_helper_viota_m_d,
         };
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
-                           vreg_ofs(s, a->rs2), cpu_env, 0,
-                           s->vlen / 8, data, fns[s->sew]);
+                           vreg_ofs(s, a->rs2), cpu_env,
+                           s->vlen / 8, s->vlen / 8, data, fns[s->sew]);
         gen_set_label(over);
         return true;
     }
@@ -2542,7 +2551,8 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
             gen_helper_vid_v_w, gen_helper_vid_v_d,
         };
         tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
-                           cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
+                           cpu_env, s->vlen / 8, s->vlen / 8,
+                           data, fns[s->sew]);
         gen_set_label(over);
         return true;
     }
@@ -2895,7 +2905,8 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
-                           cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
+                           cpu_env, s->vlen / 8, s->vlen / 8, data,
+                           fns[s->sew]);
         gen_set_label(over);
         return true;
     }
-- 
2.25.1


