Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXSkV-0006Vu-QJ
	for mharc-qemu-riscv@gnu.org; Thu, 24 Mar 2022 15:03:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nXSkT-0006Pe-64; Thu, 24 Mar 2022 15:03:53 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nXSkQ-0003ov-F7; Thu, 24 Mar 2022 15:03:52 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 9ED7911F204;
 Thu, 24 Mar 2022 19:03:24 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v4 14/14] target/riscv: rvv: Add tail agnostic for vector
 permutation instructions
Message-ID: <164814860220.28290.11643334198417094464-14@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <164814860220.28290.11643334198417094464-0@git.sr.ht>
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
Date: Thu, 24 Mar 2022 19:03:53 -0000
X-Original-Date: Mon, 07 Mar 2022 07:59:26 -0800
X-List-Received-Date: Thu, 24 Mar 2022 19:03:53 -0000

From: eopXD <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++
 target/riscv/vector_helper.c            | 68 ++++++++++++++++++++++---
 2 files changed, 82 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 8b24570e22..f037d1875c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3724,6 +3724,15 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmr=
r *a)
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
+        if (s->vta && s->lmul < 0) {
+            /* tail elements may pass vlmax when lmul < 0
+             * set tail elements to 1s
+             */
+            uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                             vreg_ofs(s, a->rd), -1,
+                             vlenb, vlenb);
+        }
         int scale =3D s->lmul - (s->sew + 3);
         int vlmax =3D scale < 0 ?
                        s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scal=
e;
@@ -3757,6 +3766,15 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmr=
r *a)
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
+        if (s->vta && s->lmul < 0) {
+            /* tail elements may pass vlmax when lmul < 0
+             * set tail elements to 1s
+             */
+            uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                             vreg_ofs(s, a->rd), -1,
+                             vlenb, vlenb);
+        }
         int scale =3D s->lmul - (s->sew + 3);
         int vlmax =3D scale < 0 ?
                        s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scal=
e;
@@ -3809,6 +3827,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *=
a)
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->cfg_ptr->vlen / 8,
@@ -3914,6 +3933,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uin=
t8_t seq)
     }
=20
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
=20
     tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                        vreg_ofs(s, a->rs2), cpu_env,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 0670489679..6e13d6bdcf 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4944,6 +4944,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
 void *vs2,         \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D                                                \
+        vext_get_total_elems(env_archcpu(env), env->vtype);               \
+    uint32_t vta =3D vext_vta(desc);                                        \
     target_ulong offset =3D s1, i_min, i;                                   \
                                                                           \
     i_min =3D MAX(env->vstart, offset);                                     \
@@ -4953,6 +4957,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
         }                                                                 \
         *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - offset));          \
     }                                                                     \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,               \
+                                     total_elems * esz);                  \
 }
=20
 /* vslideup.vx vd, vs2, rs1, vm # vd[i+rs1] =3D vs2[i] */
@@ -4965,12 +4972,16 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
+    uint32_t max_elem =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));        \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D                                                \
+        vext_get_total_elems(env_archcpu(env), env->vtype);               \
+    uint32_t vta =3D vext_vta(desc);                                        \
     target_ulong i_max, i;                                                \
                                                                           \
-    i_max =3D MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
+    i_max =3D MAX(MIN(s1 < max_elem ? max_elem - s1 : 0, vl), env->vstart); \
     for (i =3D env->vstart; i < i_max; ++i) {                               \
         if (vm || vext_elem_mask(v0, i)) {                                \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i + s1));          \
@@ -4984,6 +4995,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
     }                                                                     \
                                                                           \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,               \
+                                     total_elems * esz);                  \
 }
=20
 /* vslidedown.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+rs1] */
@@ -4999,6 +5013,10 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, t=
arget_ulong s1,       \
     typedef uint##BITWIDTH##_t ETYPE;                                       \
     uint32_t vm =3D vext_vm(desc);                                          =
  \
     uint32_t vl =3D env->vl;                                                =
  \
+    uint32_t esz =3D sizeof(ETYPE);                                         =
  \
+    uint32_t total_elems =3D                                                =
  \
+        vext_get_total_elems(env_archcpu(env), env->vtype);                 \
+    uint32_t vta =3D vext_vta(desc);                                        =
  \
     uint32_t i;                                                             \
                                                                             \
     for (i =3D env->vstart; i < vl; i++) {                                  =
  \
@@ -5012,6 +5030,9 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, ta=
rget_ulong s1,       \
         }                                                                   \
     }                                                                       \
     env->vstart =3D 0;                                                      =
  \
+    /* set tail elements to 1s */                                           \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,                 \
+                                     total_elems * esz);                    \
 }
=20
 GEN_VEXT_VSLIE1UP(8,  H1)
@@ -5039,6 +5060,10 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0,=
 target_ulong s1,       \
     typedef uint##BITWIDTH##_t ETYPE;                                       =
  \
     uint32_t vm =3D vext_vm(desc);                                          =
    \
     uint32_t vl =3D env->vl;                                                =
    \
+    uint32_t esz =3D sizeof(ETYPE);                                         =
    \
+    uint32_t total_elems =3D                                                =
    \
+        vext_get_total_elems(env_archcpu(env), env->vtype);                 =
  \
+    uint32_t vta =3D vext_vta(desc);                                        =
    \
     uint32_t i;                                                             =
  \
                                                                             =
  \
     for (i =3D env->vstart; i < vl; i++) {                                  =
    \
@@ -5052,6 +5077,9 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, =
target_ulong s1,       \
         }                                                                   =
  \
     }                                                                       =
  \
     env->vstart =3D 0;                                                      =
    \
+    /* set tail elements to 1s */                                           =
  \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,                 =
  \
+                                     total_elems * esz);                    =
  \
 }
=20
 GEN_VEXT_VSLIDE1DOWN(8,  H1)
@@ -5102,9 +5130,13 @@ GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, 64)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(TS2)));             \
+    uint32_t max_elem =3D vext_max_elems(desc, ctzl(sizeof(TS2)));          \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(TS2);                                           \
+    uint32_t total_elems =3D                                                \
+        vext_get_total_elems(env_archcpu(env), env->vtype);               \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint64_t index;                                                       \
     uint32_t i;                                                           \
                                                                           \
@@ -5113,13 +5145,16 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void=
 *vs2,               \
             continue;                                                     \
         }                                                                 \
         index =3D *((TS1 *)vs1 + HS1(i));                                   \
-        if (index >=3D vlmax) {                                             \
+        if (index >=3D max_elem) {                                          \
             *((TS2 *)vd + HS2(i)) =3D 0;                                    \
         } else {                                                          \
             *((TS2 *)vd + HS2(i)) =3D *((TS2 *)vs2 + HS2(index));           \
         }                                                                 \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,               \
+                                     total_elems * esz);                  \
 }
=20
 /* vd[i] =3D (vs1[i] >=3D VLMAX) ? 0 : vs2[vs1[i]]; */
@@ -5137,9 +5172,13 @@ GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_d, uint16_t, uint=
64_t, H2, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
+    uint32_t max_elem =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));        \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D                                                \
+        vext_get_total_elems(env_archcpu(env), env->vtype);               \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint64_t index =3D s1;                                                  \
     uint32_t i;                                                           \
                                                                           \
@@ -5147,13 +5186,16 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1=
, void *vs2,         \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
-        if (index >=3D vlmax) {                                             \
+        if (index >=3D max_elem) {                                          \
             *((ETYPE *)vd + H(i)) =3D 0;                                    \
         } else {                                                          \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(index));           \
         }                                                                 \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,               \
+                                     total_elems * esz);                  \
 }
=20
 /* vd[i] =3D (x[rs1] >=3D VLMAX) ? 0 : vs2[rs1] */
@@ -5168,6 +5210,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D                                                \
+        vext_get_total_elems(env_archcpu(env), env->vtype);               \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint32_t num =3D 0, i;                                                  \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
@@ -5178,6 +5224,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
         num++;                                                            \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,               \
+                                     total_elems * esz);                  \
 }
=20
 /* Compress into vd elements of vs2 where vs1 is enabled */
@@ -5214,6 +5263,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,      =
           \
 {                                                                \
     uint32_t vl =3D env->vl;                                       \
     uint32_t vm =3D vext_vm(desc);                                 \
+    uint32_t esz =3D sizeof(ETYPE);                                \
+    uint32_t total_elems =3D                                       \
+        vext_get_total_elems(env_archcpu(env), env->vtype);      \
+    uint32_t vta =3D vext_vta(desc);                               \
     uint32_t i;                                                  \
                                                                  \
     for (i =3D env->vstart; i < vl; i++) {                         \
@@ -5223,6 +5276,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       =
          \
         *((ETYPE *)vd + HD(i)) =3D *((DTYPE *)vs2 + HS1(i));       \
     }                                                            \
     env->vstart =3D 0;                                             \
+    /* set tail elements to 1s */                                \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,      \
+                                     total_elems * esz);         \
 }
=20
 GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
--=20
2.34.1

