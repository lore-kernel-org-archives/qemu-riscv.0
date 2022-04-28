Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njxoU-00050q-OX
	for mharc-qemu-riscv@gnu.org; Thu, 28 Apr 2022 02:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njxoO-0004nr-N9; Thu, 28 Apr 2022 02:39:36 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:42392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njxoL-0002zQ-IJ; Thu, 28 Apr 2022 02:39:36 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id A759F11F0BB;
 Thu, 28 Apr 2022 06:39:30 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v12 06/15] target/riscv: rvv: Add tail agnostic for vx,
 vvm, vxm instructions
Message-ID: <165112796938.27173.10721042199099922491-6@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165112796938.27173.10721042199099922491-0@git.sr.ht>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Date: Thu, 28 Apr 2022 06:39:37 -0000
X-Original-Date: Sun, 06 Mar 2022 23:32:57 -0800
X-List-Received-Date: Thu, 28 Apr 2022 06:39:37 -0000

From: eopXD <eop.chen@sifive.com>

`vmadc` and `vmsbc` produces a mask value, they always operate with
a tail agnostic policy.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  29 +++
 target/riscv/internals.h                |   5 +-
 target/riscv/vector_helper.c            | 317 +++++++++++++-----------
 3 files changed, 211 insertions(+), 140 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 99691f1b9f..d15858fc6f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1299,6 +1299,8 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint=
32_t vs2, uint32_t vm,
=20
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
     desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
                                       s->cfg_ptr->vlen / 8, data));
=20
@@ -1335,6 +1337,16 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sF=
n *gvec_fn,
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
+        if (s->vta && s->lmul < 0) {
+            /*
+             * tail elements may pass vlmax when lmul < 0
+             * set tail elements to 1s
+             */
+            uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                             vreg_ofs(s, a->rd), -1,
+                             vlenb, vlenb);
+        }
         TCGv_i64 src1 =3D tcg_temp_new_i64();
=20
         tcg_gen_ext_tl_i64(src1, get_gpr(s, a->rs1, EXT_SIGN));
@@ -1464,6 +1476,8 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint=
32_t vs2, uint32_t vm,
=20
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
     desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
                                       s->cfg_ptr->vlen / 8, data));
=20
@@ -1493,6 +1507,16 @@ do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iF=
n *gvec_fn,
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
+        if (s->vta && s->lmul < 0) {
+            /*
+             * tail elements may pass vlmax when lmul < 0
+             * set tail elements to 1s
+             */
+            uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                             vreg_ofs(s, a->rd), -1,
+                             vlenb, vlenb);
+        }
         gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                 extract_imm(s, a->rs1, imm_mode), MAXSZ(s), MAXSZ(s));
         mark_vs_dirty(s);
@@ -1546,6 +1570,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
@@ -1627,6 +1652,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
@@ -1705,6 +1731,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D                                                     \
+            FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 512c6c30cf..193ce57a6d 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -25,8 +25,9 @@
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
 FIELD(VDATA, VTA, 4, 1)
-FIELD(VDATA, NF, 5, 4)
-FIELD(VDATA, WD, 5, 1)
+FIELD(VDATA, VTA_ALL_1S, 5, 1)
+FIELD(VDATA, NF, 6, 4)
+FIELD(VDATA, WD, 6, 1)
=20
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d186bf9512..4ecdf955f3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -127,6 +127,11 @@ static inline uint32_t vext_vta(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, VTA);
 }
=20
+static inline uint32_t vext_vta_all_1s(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, VTA_ALL_1S);
+}
+
 /*
  * Get the maximum number of elements can be operated.
  *
@@ -838,10 +843,12 @@ RVVCALL(OPIVX2, vrsub_vx_d, OP_SSS_D, H8, H8, DO_RSUB)
=20
 static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
                        CPURISCVState *env, uint32_t desc,
-                       opivx2_fn fn)
+                       opivx2_fn fn, uint32_t esz)
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
=20
     for (i =3D env->vstart; i < vl; i++) {
@@ -851,30 +858,32 @@ static void do_vext_vx(void *vd, void *v0, target_long =
s1, void *vs2,
         fn(vd, s1, vs2, i);
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
 }
=20
 /* generate the helpers for OPIVX */
-#define GEN_VEXT_VX(NAME)                                 \
+#define GEN_VEXT_VX(NAME, ESZ)                            \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     do_vext_vx(vd, v0, s1, vs2, env, desc,                \
-               do_##NAME);                                \
-}
-
-GEN_VEXT_VX(vadd_vx_b)
-GEN_VEXT_VX(vadd_vx_h)
-GEN_VEXT_VX(vadd_vx_w)
-GEN_VEXT_VX(vadd_vx_d)
-GEN_VEXT_VX(vsub_vx_b)
-GEN_VEXT_VX(vsub_vx_h)
-GEN_VEXT_VX(vsub_vx_w)
-GEN_VEXT_VX(vsub_vx_d)
-GEN_VEXT_VX(vrsub_vx_b)
-GEN_VEXT_VX(vrsub_vx_h)
-GEN_VEXT_VX(vrsub_vx_w)
-GEN_VEXT_VX(vrsub_vx_d)
+               do_##NAME, ESZ);                           \
+}
+
+GEN_VEXT_VX(vadd_vx_b, 1)
+GEN_VEXT_VX(vadd_vx_h, 2)
+GEN_VEXT_VX(vadd_vx_w, 4)
+GEN_VEXT_VX(vadd_vx_d, 8)
+GEN_VEXT_VX(vsub_vx_b, 1)
+GEN_VEXT_VX(vsub_vx_h, 2)
+GEN_VEXT_VX(vsub_vx_w, 4)
+GEN_VEXT_VX(vsub_vx_d, 8)
+GEN_VEXT_VX(vrsub_vx_b, 1)
+GEN_VEXT_VX(vrsub_vx_h, 2)
+GEN_VEXT_VX(vrsub_vx_w, 4)
+GEN_VEXT_VX(vrsub_vx_d, 8)
=20
 void HELPER(vec_rsubs8)(void *d, void *a, uint64_t b, uint32_t desc)
 {
@@ -1002,30 +1011,30 @@ RVVCALL(OPIVX2, vwadd_wx_w, WOP_WSSS_W, H8, H4, DO_AD=
D)
 RVVCALL(OPIVX2, vwsub_wx_b, WOP_WSSS_B, H2, H1, DO_SUB)
 RVVCALL(OPIVX2, vwsub_wx_h, WOP_WSSS_H, H4, H2, DO_SUB)
 RVVCALL(OPIVX2, vwsub_wx_w, WOP_WSSS_W, H8, H4, DO_SUB)
-GEN_VEXT_VX(vwaddu_vx_b)
-GEN_VEXT_VX(vwaddu_vx_h)
-GEN_VEXT_VX(vwaddu_vx_w)
-GEN_VEXT_VX(vwsubu_vx_b)
-GEN_VEXT_VX(vwsubu_vx_h)
-GEN_VEXT_VX(vwsubu_vx_w)
-GEN_VEXT_VX(vwadd_vx_b)
-GEN_VEXT_VX(vwadd_vx_h)
-GEN_VEXT_VX(vwadd_vx_w)
-GEN_VEXT_VX(vwsub_vx_b)
-GEN_VEXT_VX(vwsub_vx_h)
-GEN_VEXT_VX(vwsub_vx_w)
-GEN_VEXT_VX(vwaddu_wx_b)
-GEN_VEXT_VX(vwaddu_wx_h)
-GEN_VEXT_VX(vwaddu_wx_w)
-GEN_VEXT_VX(vwsubu_wx_b)
-GEN_VEXT_VX(vwsubu_wx_h)
-GEN_VEXT_VX(vwsubu_wx_w)
-GEN_VEXT_VX(vwadd_wx_b)
-GEN_VEXT_VX(vwadd_wx_h)
-GEN_VEXT_VX(vwadd_wx_w)
-GEN_VEXT_VX(vwsub_wx_b)
-GEN_VEXT_VX(vwsub_wx_h)
-GEN_VEXT_VX(vwsub_wx_w)
+GEN_VEXT_VX(vwaddu_vx_b, 2)
+GEN_VEXT_VX(vwaddu_vx_h, 4)
+GEN_VEXT_VX(vwaddu_vx_w, 8)
+GEN_VEXT_VX(vwsubu_vx_b, 2)
+GEN_VEXT_VX(vwsubu_vx_h, 4)
+GEN_VEXT_VX(vwsubu_vx_w, 8)
+GEN_VEXT_VX(vwadd_vx_b, 2)
+GEN_VEXT_VX(vwadd_vx_h, 4)
+GEN_VEXT_VX(vwadd_vx_w, 8)
+GEN_VEXT_VX(vwsub_vx_b, 2)
+GEN_VEXT_VX(vwsub_vx_h, 4)
+GEN_VEXT_VX(vwsub_vx_w, 8)
+GEN_VEXT_VX(vwaddu_wx_b, 2)
+GEN_VEXT_VX(vwaddu_wx_h, 4)
+GEN_VEXT_VX(vwaddu_wx_w, 8)
+GEN_VEXT_VX(vwsubu_wx_b, 2)
+GEN_VEXT_VX(vwsubu_wx_h, 4)
+GEN_VEXT_VX(vwsubu_wx_w, 8)
+GEN_VEXT_VX(vwadd_wx_b, 2)
+GEN_VEXT_VX(vwadd_wx_h, 4)
+GEN_VEXT_VX(vwadd_wx_w, 8)
+GEN_VEXT_VX(vwsub_wx_b, 2)
+GEN_VEXT_VX(vwsub_wx_h, 4)
+GEN_VEXT_VX(vwsub_wx_w, 8)
=20
 /* Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions */
 #define DO_VADC(N, M, C) (N + M + C)
@@ -1036,6 +1045,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vl =3D env->vl;                                    \
+    uint32_t esz =3D sizeof(ETYPE);                             \
+    uint32_t total_elems =3D                                    \
+        vext_get_total_elems(env, desc, esz);                 \
+    uint32_t vta =3D vext_vta(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -1046,6 +1059,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,   \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, s1, carry);         \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* set tail elements to 1s */                             \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);  \
 }
=20
 GEN_VEXT_VADC_VVM(vadc_vvm_b, uint8_t,  H1, DO_VADC)
@@ -1063,6 +1078,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,        \
                   CPURISCVState *env, uint32_t desc)                     \
 {                                                                        \
     uint32_t vl =3D env->vl;                                               \
+    uint32_t esz =3D sizeof(ETYPE);                                        \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);         \
+    uint32_t vta =3D vext_vta(desc);                                       \
     uint32_t i;                                                          \
                                                                          \
     for (i =3D env->vstart; i < vl; i++) {                                 \
@@ -1072,6 +1090,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,        \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, (ETYPE)(target_long)s1, carry);\
     }                                                                    \
     env->vstart =3D 0;                                          \
+    /* set tail elements to 1s */                                        \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);             \
 }
=20
 GEN_VEXT_VADC_VXM(vadc_vxm_b, uint8_t,  H1, DO_VADC)
@@ -1094,6 +1114,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,   \
 {                                                             \
     uint32_t vl =3D env->vl;                                    \
     uint32_t vm =3D vext_vm(desc);                              \
+    uint32_t esz =3D sizeof(ETYPE);                             \
+    uint32_t total_elems =3D                                    \
+        vext_get_total_elems(env, desc, esz);                 \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -1103,6 +1127,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,   \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* mask destination register are always tail-agnostic */  \
+    /* set tail elements to 1s */                             \
+    if (vta_all_1s) {                                         \
+        for (; i < total_elems; i++) {                        \
+            vext_set_elem_mask(vd, i, 1);                     \
+        }                                                     \
+    }                                                         \
 }
=20
 GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
@@ -1121,6 +1152,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
         \
 {                                                               \
     uint32_t vl =3D env->vl;                                      \
     uint32_t vm =3D vext_vm(desc);                                \
+    uint32_t esz =3D sizeof(ETYPE);                               \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);\
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                \
     uint32_t i;                                                 \
                                                                 \
     for (i =3D env->vstart; i < vl; i++) {                        \
@@ -1130,6 +1164,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
          \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
     env->vstart =3D 0;                                            \
+    /* mask destination register are always tail-agnostic */    \
+    /* set tail elements to 1s */                               \
+    if (vta_all_1s) {                                           \
+        for (; i < total_elems; i++) {                          \
+            vext_set_elem_mask(vd, i, 1);                       \
+        }                                                       \
+    }                                                           \
 }
=20
 GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
@@ -1180,18 +1221,18 @@ RVVCALL(OPIVX2, vxor_vx_b, OP_SSS_B, H1, H1, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_h, OP_SSS_H, H2, H2, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_w, OP_SSS_W, H4, H4, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_d, OP_SSS_D, H8, H8, DO_XOR)
-GEN_VEXT_VX(vand_vx_b)
-GEN_VEXT_VX(vand_vx_h)
-GEN_VEXT_VX(vand_vx_w)
-GEN_VEXT_VX(vand_vx_d)
-GEN_VEXT_VX(vor_vx_b)
-GEN_VEXT_VX(vor_vx_h)
-GEN_VEXT_VX(vor_vx_w)
-GEN_VEXT_VX(vor_vx_d)
-GEN_VEXT_VX(vxor_vx_b)
-GEN_VEXT_VX(vxor_vx_h)
-GEN_VEXT_VX(vxor_vx_w)
-GEN_VEXT_VX(vxor_vx_d)
+GEN_VEXT_VX(vand_vx_b, 1)
+GEN_VEXT_VX(vand_vx_h, 2)
+GEN_VEXT_VX(vand_vx_w, 4)
+GEN_VEXT_VX(vand_vx_d, 8)
+GEN_VEXT_VX(vor_vx_b, 1)
+GEN_VEXT_VX(vor_vx_h, 2)
+GEN_VEXT_VX(vor_vx_w, 4)
+GEN_VEXT_VX(vor_vx_d, 8)
+GEN_VEXT_VX(vxor_vx_b, 1)
+GEN_VEXT_VX(vxor_vx_h, 2)
+GEN_VEXT_VX(vxor_vx_w, 4)
+GEN_VEXT_VX(vxor_vx_d, 8)
=20
 /* Vector Single-Width Bit Shift Instructions */
 #define DO_SLL(N, M)  (N << (M))
@@ -1445,22 +1486,22 @@ RVVCALL(OPIVX2, vmax_vx_b, OP_SSS_B, H1, H1, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_h, OP_SSS_H, H2, H2, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_w, OP_SSS_W, H4, H4, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_d, OP_SSS_D, H8, H8, DO_MAX)
-GEN_VEXT_VX(vminu_vx_b)
-GEN_VEXT_VX(vminu_vx_h)
-GEN_VEXT_VX(vminu_vx_w)
-GEN_VEXT_VX(vminu_vx_d)
-GEN_VEXT_VX(vmin_vx_b)
-GEN_VEXT_VX(vmin_vx_h)
-GEN_VEXT_VX(vmin_vx_w)
-GEN_VEXT_VX(vmin_vx_d)
-GEN_VEXT_VX(vmaxu_vx_b)
-GEN_VEXT_VX(vmaxu_vx_h)
-GEN_VEXT_VX(vmaxu_vx_w)
-GEN_VEXT_VX(vmaxu_vx_d)
-GEN_VEXT_VX(vmax_vx_b)
-GEN_VEXT_VX(vmax_vx_h)
-GEN_VEXT_VX(vmax_vx_w)
-GEN_VEXT_VX(vmax_vx_d)
+GEN_VEXT_VX(vminu_vx_b, 1)
+GEN_VEXT_VX(vminu_vx_h, 2)
+GEN_VEXT_VX(vminu_vx_w, 4)
+GEN_VEXT_VX(vminu_vx_d, 8)
+GEN_VEXT_VX(vmin_vx_b, 1)
+GEN_VEXT_VX(vmin_vx_h, 2)
+GEN_VEXT_VX(vmin_vx_w, 4)
+GEN_VEXT_VX(vmin_vx_d, 8)
+GEN_VEXT_VX(vmaxu_vx_b, 1)
+GEN_VEXT_VX(vmaxu_vx_h, 2)
+GEN_VEXT_VX(vmaxu_vx_w, 4)
+GEN_VEXT_VX(vmaxu_vx_d, 8)
+GEN_VEXT_VX(vmax_vx_b, 1)
+GEN_VEXT_VX(vmax_vx_h, 2)
+GEN_VEXT_VX(vmax_vx_w, 4)
+GEN_VEXT_VX(vmax_vx_d, 8)
=20
 /* Vector Single-Width Integer Multiply Instructions */
 #define DO_MUL(N, M) (N * M)
@@ -1604,22 +1645,22 @@ RVVCALL(OPIVX2, vmulhsu_vx_b, OP_SUS_B, H1, H1, do_mu=
lhsu_b)
 RVVCALL(OPIVX2, vmulhsu_vx_h, OP_SUS_H, H2, H2, do_mulhsu_h)
 RVVCALL(OPIVX2, vmulhsu_vx_w, OP_SUS_W, H4, H4, do_mulhsu_w)
 RVVCALL(OPIVX2, vmulhsu_vx_d, OP_SUS_D, H8, H8, do_mulhsu_d)
-GEN_VEXT_VX(vmul_vx_b)
-GEN_VEXT_VX(vmul_vx_h)
-GEN_VEXT_VX(vmul_vx_w)
-GEN_VEXT_VX(vmul_vx_d)
-GEN_VEXT_VX(vmulh_vx_b)
-GEN_VEXT_VX(vmulh_vx_h)
-GEN_VEXT_VX(vmulh_vx_w)
-GEN_VEXT_VX(vmulh_vx_d)
-GEN_VEXT_VX(vmulhu_vx_b)
-GEN_VEXT_VX(vmulhu_vx_h)
-GEN_VEXT_VX(vmulhu_vx_w)
-GEN_VEXT_VX(vmulhu_vx_d)
-GEN_VEXT_VX(vmulhsu_vx_b)
-GEN_VEXT_VX(vmulhsu_vx_h)
-GEN_VEXT_VX(vmulhsu_vx_w)
-GEN_VEXT_VX(vmulhsu_vx_d)
+GEN_VEXT_VX(vmul_vx_b, 1)
+GEN_VEXT_VX(vmul_vx_h, 2)
+GEN_VEXT_VX(vmul_vx_w, 4)
+GEN_VEXT_VX(vmul_vx_d, 8)
+GEN_VEXT_VX(vmulh_vx_b, 1)
+GEN_VEXT_VX(vmulh_vx_h, 2)
+GEN_VEXT_VX(vmulh_vx_w, 4)
+GEN_VEXT_VX(vmulh_vx_d, 8)
+GEN_VEXT_VX(vmulhu_vx_b, 1)
+GEN_VEXT_VX(vmulhu_vx_h, 2)
+GEN_VEXT_VX(vmulhu_vx_w, 4)
+GEN_VEXT_VX(vmulhu_vx_d, 8)
+GEN_VEXT_VX(vmulhsu_vx_b, 1)
+GEN_VEXT_VX(vmulhsu_vx_h, 2)
+GEN_VEXT_VX(vmulhsu_vx_w, 4)
+GEN_VEXT_VX(vmulhsu_vx_d, 8)
=20
 /* Vector Integer Divide Instructions */
 #define DO_DIVU(N, M) (unlikely(M =3D=3D 0) ? (__typeof(N))(-1) : N / M)
@@ -1678,22 +1719,22 @@ RVVCALL(OPIVX2, vrem_vx_b, OP_SSS_B, H1, H1, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_h, OP_SSS_H, H2, H2, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_w, OP_SSS_W, H4, H4, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_d, OP_SSS_D, H8, H8, DO_REM)
-GEN_VEXT_VX(vdivu_vx_b)
-GEN_VEXT_VX(vdivu_vx_h)
-GEN_VEXT_VX(vdivu_vx_w)
-GEN_VEXT_VX(vdivu_vx_d)
-GEN_VEXT_VX(vdiv_vx_b)
-GEN_VEXT_VX(vdiv_vx_h)
-GEN_VEXT_VX(vdiv_vx_w)
-GEN_VEXT_VX(vdiv_vx_d)
-GEN_VEXT_VX(vremu_vx_b)
-GEN_VEXT_VX(vremu_vx_h)
-GEN_VEXT_VX(vremu_vx_w)
-GEN_VEXT_VX(vremu_vx_d)
-GEN_VEXT_VX(vrem_vx_b)
-GEN_VEXT_VX(vrem_vx_h)
-GEN_VEXT_VX(vrem_vx_w)
-GEN_VEXT_VX(vrem_vx_d)
+GEN_VEXT_VX(vdivu_vx_b, 1)
+GEN_VEXT_VX(vdivu_vx_h, 2)
+GEN_VEXT_VX(vdivu_vx_w, 4)
+GEN_VEXT_VX(vdivu_vx_d, 8)
+GEN_VEXT_VX(vdiv_vx_b, 1)
+GEN_VEXT_VX(vdiv_vx_h, 2)
+GEN_VEXT_VX(vdiv_vx_w, 4)
+GEN_VEXT_VX(vdiv_vx_d, 8)
+GEN_VEXT_VX(vremu_vx_b, 1)
+GEN_VEXT_VX(vremu_vx_h, 2)
+GEN_VEXT_VX(vremu_vx_w, 4)
+GEN_VEXT_VX(vremu_vx_d, 8)
+GEN_VEXT_VX(vrem_vx_b, 1)
+GEN_VEXT_VX(vrem_vx_h, 2)
+GEN_VEXT_VX(vrem_vx_w, 4)
+GEN_VEXT_VX(vrem_vx_d, 8)
=20
 /* Vector Widening Integer Multiply Instructions */
 RVVCALL(OPIVV2, vwmul_vv_b, WOP_SSS_B, H2, H1, H1, DO_MUL)
@@ -1724,15 +1765,15 @@ RVVCALL(OPIVX2, vwmulu_vx_w, WOP_UUU_W, H8, H4, DO_MU=
L)
 RVVCALL(OPIVX2, vwmulsu_vx_b, WOP_SUS_B, H2, H1, DO_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_h, WOP_SUS_H, H4, H2, DO_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_w, WOP_SUS_W, H8, H4, DO_MUL)
-GEN_VEXT_VX(vwmul_vx_b)
-GEN_VEXT_VX(vwmul_vx_h)
-GEN_VEXT_VX(vwmul_vx_w)
-GEN_VEXT_VX(vwmulu_vx_b)
-GEN_VEXT_VX(vwmulu_vx_h)
-GEN_VEXT_VX(vwmulu_vx_w)
-GEN_VEXT_VX(vwmulsu_vx_b)
-GEN_VEXT_VX(vwmulsu_vx_h)
-GEN_VEXT_VX(vwmulsu_vx_w)
+GEN_VEXT_VX(vwmul_vx_b, 2)
+GEN_VEXT_VX(vwmul_vx_h, 4)
+GEN_VEXT_VX(vwmul_vx_w, 8)
+GEN_VEXT_VX(vwmulu_vx_b, 2)
+GEN_VEXT_VX(vwmulu_vx_h, 4)
+GEN_VEXT_VX(vwmulu_vx_w, 8)
+GEN_VEXT_VX(vwmulsu_vx_b, 2)
+GEN_VEXT_VX(vwmulsu_vx_h, 4)
+GEN_VEXT_VX(vwmulsu_vx_w, 8)
=20
 /* Vector Single-Width Integer Multiply-Add Instructions */
 #define OPIVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
@@ -1805,22 +1846,22 @@ RVVCALL(OPIVX3, vnmsub_vx_b, OP_SSS_B, H1, H1, DO_NMS=
UB)
 RVVCALL(OPIVX3, vnmsub_vx_h, OP_SSS_H, H2, H2, DO_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_w, OP_SSS_W, H4, H4, DO_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_d, OP_SSS_D, H8, H8, DO_NMSUB)
-GEN_VEXT_VX(vmacc_vx_b)
-GEN_VEXT_VX(vmacc_vx_h)
-GEN_VEXT_VX(vmacc_vx_w)
-GEN_VEXT_VX(vmacc_vx_d)
-GEN_VEXT_VX(vnmsac_vx_b)
-GEN_VEXT_VX(vnmsac_vx_h)
-GEN_VEXT_VX(vnmsac_vx_w)
-GEN_VEXT_VX(vnmsac_vx_d)
-GEN_VEXT_VX(vmadd_vx_b)
-GEN_VEXT_VX(vmadd_vx_h)
-GEN_VEXT_VX(vmadd_vx_w)
-GEN_VEXT_VX(vmadd_vx_d)
-GEN_VEXT_VX(vnmsub_vx_b)
-GEN_VEXT_VX(vnmsub_vx_h)
-GEN_VEXT_VX(vnmsub_vx_w)
-GEN_VEXT_VX(vnmsub_vx_d)
+GEN_VEXT_VX(vmacc_vx_b, 1)
+GEN_VEXT_VX(vmacc_vx_h, 2)
+GEN_VEXT_VX(vmacc_vx_w, 4)
+GEN_VEXT_VX(vmacc_vx_d, 8)
+GEN_VEXT_VX(vnmsac_vx_b, 1)
+GEN_VEXT_VX(vnmsac_vx_h, 2)
+GEN_VEXT_VX(vnmsac_vx_w, 4)
+GEN_VEXT_VX(vnmsac_vx_d, 8)
+GEN_VEXT_VX(vmadd_vx_b, 1)
+GEN_VEXT_VX(vmadd_vx_h, 2)
+GEN_VEXT_VX(vmadd_vx_w, 4)
+GEN_VEXT_VX(vmadd_vx_d, 8)
+GEN_VEXT_VX(vnmsub_vx_b, 1)
+GEN_VEXT_VX(vnmsub_vx_h, 2)
+GEN_VEXT_VX(vnmsub_vx_w, 4)
+GEN_VEXT_VX(vnmsub_vx_d, 8)
=20
 /* Vector Widening Integer Multiply-Add Instructions */
 RVVCALL(OPIVV3, vwmaccu_vv_b, WOP_UUU_B, H2, H1, H1, DO_MACC)
@@ -1854,18 +1895,18 @@ RVVCALL(OPIVX3, vwmaccsu_vx_w, WOP_SSU_W, H8, H4, DO_=
MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_b, WOP_SUS_B, H2, H1, DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_h, WOP_SUS_H, H4, H2, DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_w, WOP_SUS_W, H8, H4, DO_MACC)
-GEN_VEXT_VX(vwmaccu_vx_b)
-GEN_VEXT_VX(vwmaccu_vx_h)
-GEN_VEXT_VX(vwmaccu_vx_w)
-GEN_VEXT_VX(vwmacc_vx_b)
-GEN_VEXT_VX(vwmacc_vx_h)
-GEN_VEXT_VX(vwmacc_vx_w)
-GEN_VEXT_VX(vwmaccsu_vx_b)
-GEN_VEXT_VX(vwmaccsu_vx_h)
-GEN_VEXT_VX(vwmaccsu_vx_w)
-GEN_VEXT_VX(vwmaccus_vx_b)
-GEN_VEXT_VX(vwmaccus_vx_h)
-GEN_VEXT_VX(vwmaccus_vx_w)
+GEN_VEXT_VX(vwmaccu_vx_b, 2)
+GEN_VEXT_VX(vwmaccu_vx_h, 4)
+GEN_VEXT_VX(vwmaccu_vx_w, 8)
+GEN_VEXT_VX(vwmacc_vx_b, 2)
+GEN_VEXT_VX(vwmacc_vx_h, 4)
+GEN_VEXT_VX(vwmacc_vx_w, 8)
+GEN_VEXT_VX(vwmaccsu_vx_b, 2)
+GEN_VEXT_VX(vwmaccsu_vx_h, 4)
+GEN_VEXT_VX(vwmaccsu_vx_w, 8)
+GEN_VEXT_VX(vwmaccus_vx_b, 2)
+GEN_VEXT_VX(vwmaccus_vx_h, 4)
+GEN_VEXT_VX(vwmaccus_vx_w, 8)
=20
 /* Vector Integer Merge and Move Instructions */
 #define GEN_VEXT_VMV_VV(NAME, ETYPE, H)                              \
--=20
2.34.2


