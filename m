Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1np4A7-0004rR-UP
	for mharc-qemu-riscv@gnu.org; Thu, 12 May 2022 04:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1np49t-0004kR-8a; Thu, 12 May 2022 04:26:54 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:45238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1np49q-0005QW-En; Thu, 12 May 2022 04:26:52 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id B897A11F113;
 Thu, 12 May 2022 08:26:22 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v17 15/16] target/riscv: rvv: Add tail agnostic for
 vector permutation instructions
Message-ID: <165234397852.32492.1203149738524050090-15@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165234397852.32492.1203149738524050090-0@git.sr.ht>
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
Date: Thu, 12 May 2022 08:27:04 -0000
X-Original-Date: Mon, 07 Mar 2022 07:59:26 -0800
X-List-Received-Date: Thu, 12 May 2022 08:27:04 -0000

From: eopXD <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  7 +++--
 target/riscv/vector_helper.c            | 40 +++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index e15dbdb01b..9717cfe657 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3670,7 +3670,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr=
 *a)
         return false;
     }
=20
-    if (a->vm && s->vl_eq_vlmax) {
+    if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         int scale =3D s->lmul - (s->sew + 3);
         int vlmax =3D s->cfg_ptr->vlen >> -scale;
         TCGv_i64 dest =3D tcg_temp_new_i64();
@@ -3702,7 +3702,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr=
 *a)
         return false;
     }
=20
-    if (a->vm && s->vl_eq_vlmax) {
+    if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         int scale =3D s->lmul - (s->sew + 3);
         int vlmax =3D s->cfg_ptr->vlen >> -scale;
         if (a->rs1 >=3D vlmax) {
@@ -3754,6 +3754,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *=
a)
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->cfg_ptr->vlen / 8,
@@ -3854,6 +3855,8 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uin=
t8_t seq)
     }
=20
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
+    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
=20
     tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                        vreg_ofs(s, a->rs2), cpu_env,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 93e7ce3bfe..70353b1116 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4930,6 +4930,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     target_ulong offset =3D s1, i_min, i;                                   \
                                                                           \
     i_min =3D MAX(env->vstart, offset);                                     \
@@ -4939,6 +4942,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
         }                                                                 \
         *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - offset));          \
     }                                                                     \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 /* vslideup.vx vd, vs2, rs1, vm # vd[i+rs1] =3D vs2[i] */
@@ -4954,6 +4959,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
     uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     target_ulong i_max, i;                                                \
                                                                           \
     i_max =3D MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
@@ -4970,6 +4978,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
     }                                                                     \
                                                                           \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 /* vslidedown.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+rs1] */
@@ -4985,6 +4995,9 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, ta=
rget_ulong s1,       \
     typedef uint##BITWIDTH##_t ETYPE;                                       \
     uint32_t vm =3D vext_vm(desc);                                          =
  \
     uint32_t vl =3D env->vl;                                                =
  \
+    uint32_t esz =3D sizeof(ETYPE);                                         =
  \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          =
  \
+    uint32_t vta =3D vext_vta(desc);                                        =
  \
     uint32_t i;                                                             \
                                                                             \
     for (i =3D env->vstart; i < vl; i++) {                                  =
  \
@@ -4998,6 +5011,8 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, ta=
rget_ulong s1,       \
         }                                                                   \
     }                                                                       \
     env->vstart =3D 0;                                                      =
  \
+    /* set tail elements to 1s */                                           \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);                \
 }
=20
 GEN_VEXT_VSLIE1UP(8,  H1)
@@ -5025,6 +5040,9 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, =
target_ulong s1,       \
     typedef uint##BITWIDTH##_t ETYPE;                                       =
  \
     uint32_t vm =3D vext_vm(desc);                                          =
    \
     uint32_t vl =3D env->vl;                                                =
    \
+    uint32_t esz =3D sizeof(ETYPE);                                         =
    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          =
    \
+    uint32_t vta =3D vext_vta(desc);                                        =
    \
     uint32_t i;                                                             =
  \
                                                                             =
  \
     for (i =3D env->vstart; i < vl; i++) {                                  =
    \
@@ -5038,6 +5056,8 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, =
target_ulong s1,       \
         }                                                                   =
  \
     }                                                                       =
  \
     env->vstart =3D 0;                                                      =
    \
+    /* set tail elements to 1s */                                           =
  \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);                =
  \
 }
=20
 GEN_VEXT_VSLIDE1DOWN(8,  H1)
@@ -5091,6 +5111,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
     uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(TS2)));             \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(TS2);                                           \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint64_t index;                                                       \
     uint32_t i;                                                           \
                                                                           \
@@ -5106,6 +5129,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
         }                                                                 \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 /* vd[i] =3D (vs1[i] >=3D VLMAX) ? 0 : vs2[vs1[i]]; */
@@ -5126,6 +5151,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
     uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint64_t index =3D s1;                                                  \
     uint32_t i;                                                           \
                                                                           \
@@ -5140,6 +5168,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
         }                                                                 \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 /* vd[i] =3D (x[rs1] >=3D VLMAX) ? 0 : vs2[rs1] */
@@ -5154,6 +5184,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint32_t num =3D 0, i;                                                  \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
@@ -5164,6 +5197,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
         num++;                                                            \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 /* Compress into vd elements of vs2 where vs1 is enabled */
@@ -5195,6 +5230,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       =
          \
 {                                                                \
     uint32_t vl =3D env->vl;                                       \
     uint32_t vm =3D vext_vm(desc);                                 \
+    uint32_t esz =3D sizeof(ETYPE);                                \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz); \
+    uint32_t vta =3D vext_vta(desc);                               \
     uint32_t i;                                                  \
                                                                  \
     for (i =3D env->vstart; i < vl; i++) {                         \
@@ -5204,6 +5242,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       =
          \
         *((ETYPE *)vd + HD(i)) =3D *((DTYPE *)vs2 + HS1(i));       \
     }                                                            \
     env->vstart =3D 0;                                             \
+    /* set tail elements to 1s */                                \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);     \
 }
=20
 GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
--=20
2.34.2


