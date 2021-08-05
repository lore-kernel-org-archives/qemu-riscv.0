Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTbD-00055V-Mz
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 22:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTbB-0004yU-R9; Wed, 04 Aug 2021 22:59:09 -0400
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:33180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTb9-0008Ve-5N; Wed, 04 Aug 2021 22:59:09 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07608247|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.00299586-4.10079e-05-0.996963;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvY-JEZ_1628132343; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvY-JEZ_1628132343)
 by smtp.aliyun-inc.com(10.147.41.199);
 Thu, 05 Aug 2021 10:59:03 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 08/13] target/riscv: Support UXL32 for vector instructions
Date: Thu,  5 Aug 2021 10:53:07 +0800
Message-Id: <20210805025312.15720-9-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 05 Aug 2021 02:59:10 -0000

For integer operations, the scalar can be taken from the scalar x register
specified by rs1. If XLEN<SEW, the value from the x register is sign-extended
to SEW bits.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h                      |  3 ++
 target/riscv/insn_trans/trans_rvv.c.inc | 44 ++++++++++++--------
 target/riscv/vector_helper.c            | 54 +++++++++++++++++--------
 3 files changed, 68 insertions(+), 33 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2b3ba21a78..9c96a1e818 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -111,6 +111,9 @@ FIELD(VTYPE, VEDIV, 5, 2)
 FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
+FIELD(VTYPE, RESERVED_UXL32, 7, 23)
+FIELD(VTYPE, VILL_UXL32, 31, 1)
+
 struct CPURISCVState {
     target_ulong gpr[32];
     uint64_t fpr[32]; /* assume both F and D extensions */
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 84a45fac38..732b8ab460 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -35,7 +35,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_constant_tl(RV_VLEN_MAX);
     } else {
-        s1 = gpr_src(ctx, a->rs1);
+        s1 = gpr_src_u(ctx, a->rs1);
     }
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
 
@@ -61,7 +61,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_constant_tl(RV_VLEN_MAX);
     } else {
-        s1 = gpr_src(ctx, a->rs1);
+        s1 = gpr_src_u(ctx, a->rs1);
     }
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
 
@@ -163,7 +163,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
-    base = gpr_src(s, rs1);
+    base = gpr_src_u(s, rs1);
 
     /*
      * As simd_desc supports at most 256 bytes, and in this implementation,
@@ -318,8 +318,8 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
 
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
-    base = gpr_src(s, rs1);
-    stride = gpr_src(s, rs2);
+    base = gpr_src_u(s, rs1);
+    stride = gpr_src_s(s, rs2);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -442,7 +442,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
-    base = gpr_src(s, rs1);
+    base = gpr_src_u(s, rs1);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -571,7 +571,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
-    base = gpr_src(s, rs1);
+    base = gpr_src_u(s, rs1);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -645,7 +645,7 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
-    base = gpr_src(s, rs1);
+    base = gpr_src_u(s, rs1);
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -731,12 +731,13 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
  */
 static bool amo_check(DisasContext *s, arg_rwdvm* a)
 {
-    return (!s->vill && has_ext(s, RVA) &&
-            (!a->wd || vext_check_overlap_mask(s, a->rd, a->vm, false)) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            ((1 << s->sew) <= sizeof(target_ulong)) &&
-            ((1 << s->sew) >= 4));
+    return !s->vill && has_ext(s, RVA) &&
+           (!a->wd || vext_check_overlap_mask(s, a->rd, a->vm, false)) &&
+           vext_check_reg(s, a->rd, false) &&
+           vext_check_reg(s, a->rs2, false) &&
+           (s->uxl32 ? ((1 << s->sew) == 4) :
+                       (((1 << s->sew) <= sizeof(target_ulong)) &&
+                        ((1 << s->sew) >= 4)));
 }
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
@@ -840,7 +841,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    src1 = gpr_src(s, rs1);
+    src1 = gpr_src_s(s, rs1);
 
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
@@ -882,7 +883,7 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
     if (a->vm && s->vl_eq_vlmax) {
         TCGv_i64 src1 = tcg_temp_new_i64();
 
-        tcg_gen_ext_tl_i64(src1, gpr_src(s, a->rs1));
+        tcg_gen_ext_tl_i64(src1, gpr_src_s(s, a->rs1));
         gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                 src1, MAXSZ(s), MAXSZ(s));
 
@@ -1635,7 +1636,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
         TCGLabel *over = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-        s1 = gpr_src(s, a->rs1);
+        s1 = gpr_src_s(s, a->rs1);
 
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
@@ -2609,6 +2610,9 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *a)
     } else {
         /* This instruction ignores LMUL and vector register groups */
         int vlmax = s->vlen >> (3 + s->sew);
+        if (s->uxl32) {
+            tcg_gen_ext32u_tl(cpu_gpr[a->rs1], cpu_gpr[a->rs1]);
+        }
         vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
     }
 
@@ -2667,6 +2671,9 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         }
 
         t1 = tcg_temp_new_i64();
+        if (s->uxl32) {
+            tcg_gen_ext32u_tl(cpu_gpr[a->rs1], cpu_gpr[a->rs1]);
+        }
         tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
@@ -2780,6 +2787,9 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
         if (a->rs1 == 0) {
             vec_element_loadi(s, dest, a->rs2, 0);
         } else {
+            if (unlikely(s->uxl32)) {
+                tcg_gen_ext32u_tl(cpu_gpr[a->rs1], cpu_gpr[a->rs1]);
+            }
             vec_element_loadx(s, dest, a->rs2, cpu_gpr[a->rs1], vlmax);
         }
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12c31aa4b4..4babd1b6aa 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -35,10 +35,19 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
     bool vill = FIELD_EX64(s2, VTYPE, VILL);
     target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
+    bool uxl32 = riscv_cpu_is_uxl32(env);
 
+    if (uxl32) {
+        vill = FIELD_EX64(s2, VTYPE, VILL_UXL32);
+        reserved = FIELD_EX64(s2, VTYPE, RESERVED_UXL32);
+    }
     if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
         /* only set vill bit. */
-        env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
+        if (uxl32) {
+            env->vtype = FIELD_DP64(0, VTYPE, VILL_UXL32, 1);
+        } else {
+            env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
+        }
         env->vl = 0;
         env->vstart = 0;
         return 0;
@@ -479,14 +488,18 @@ GEN_VEXT_ST_US(vse_v_d, int64_t, int64_t, ste_d)
 /*
  *** index: access vector element from indexed memory
  */
-typedef target_ulong vext_get_index_addr(target_ulong base,
-        uint32_t idx, void *vs2);
+typedef target_ulong vext_get_index_addr(bool uxl32, target_ulong base,
+                                         uint32_t idx, void *vs2);
 
-#define GEN_VEXT_GET_INDEX_ADDR(NAME, ETYPE, H)        \
-static target_ulong NAME(target_ulong base,            \
-                         uint32_t idx, void *vs2)      \
-{                                                      \
-    return (base + *((ETYPE *)vs2 + H(idx)));          \
+#define GEN_VEXT_GET_INDEX_ADDR(NAME, ETYPE, H)                 \
+static target_ulong NAME(bool uxl32, target_ulong base,         \
+                         uint32_t idx, void *vs2)               \
+{                                                               \
+    if (uxl32) {                                                \
+        return base + (int32_t)(*((ETYPE *)vs2 + H(idx)));      \
+    } else {                                                    \
+        return base + *((ETYPE *)vs2 + H(idx));                 \
+    }                                                           \
 }
 
 GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
@@ -508,13 +521,14 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t mlen = vext_mlen(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
+    bool uxl32 = riscv_cpu_is_uxl32(env);
 
     /* probe every access*/
     for (i = 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, mlen, i)) {
             continue;
         }
-        probe_pages(env, get_index_addr(base, i, vs2), nf * msz, ra,
+        probe_pages(env, get_index_addr(uxl32, base, i, vs2), nf * msz, ra,
                     access_type);
     }
     /* load bytes from guest memory */
@@ -524,7 +538,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
             continue;
         }
         while (k < nf) {
-            abi_ptr addr = get_index_addr(base, i, vs2) + k * msz;
+            abi_ptr addr = get_index_addr(uxl32, base, i, vs2) + k * msz;
             ldst_elem(env, addr, i + k * vlmax, vd, ra);
             k++;
         }
@@ -784,19 +798,22 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t mlen = vext_mlen(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
+    bool uxl32 = riscv_cpu_is_uxl32(env);
 
     for (i = 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, mlen, i)) {
             continue;
         }
-        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_LOAD);
-        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_STORE);
+        probe_pages(env, get_index_addr(uxl32, base, i, vs2), msz, ra,
+                    MMU_DATA_LOAD);
+        probe_pages(env, get_index_addr(uxl32, base, i, vs2), msz, ra,
+                    MMU_DATA_STORE);
     }
     for (i = 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, mlen, i)) {
             continue;
         }
-        addr = get_index_addr(base, i, vs2);
+        addr = get_index_addr(uxl32, base, i, vs2);
         noatomic_op(vs3, addr, wd, i, env, ra);
     }
     clear_elem(vs3, env->vl, env->vl * esz, vlmax * esz);
@@ -4682,7 +4699,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    target_ulong offset = s1, i;                                          \
+    target_ulong offset, i;                                               \
+    offset = riscv_cpu_is_uxl32(env) ? s1 & UINT32_MAX : s1;              \
                                                                           \
     for (i = offset; i < vl; i++) {                                       \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
@@ -4707,7 +4725,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    target_ulong offset = s1, i;                                          \
+    target_ulong offset, i;                                               \
+    offset = riscv_cpu_is_uxl32(env) ? s1 & UINT32_MAX : s1;              \
                                                                           \
     for (i = 0; i < vl; ++i) {                                            \
         target_ulong j = i + offset;                                      \
@@ -4734,6 +4753,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t i;                                                           \
+    s1 = riscv_cpu_is_uxl32(env) ? s1 & UINT32_MAX : s1;                  \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
@@ -4763,6 +4783,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
     uint32_t i;                                                           \
+    s1 = riscv_cpu_is_uxl32(env) ? s1 & UINT32_MAX : s1;                  \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
@@ -4823,8 +4844,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    uint64_t index = s1;                                                  \
+    uint64_t index;                                                       \
     uint32_t i;                                                           \
+    index = riscv_cpu_is_uxl32(env) ? s1 & UINT32_MAX : s1;               \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
-- 
2.17.1


