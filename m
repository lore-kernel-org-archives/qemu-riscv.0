Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXSkS-0006Om-VZ
	for mharc-qemu-riscv@gnu.org; Thu, 24 Mar 2022 15:03:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nXSkR-0006JF-6G; Thu, 24 Mar 2022 15:03:51 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nXSkP-0003oB-0b; Thu, 24 Mar 2022 15:03:50 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id C484411F179;
 Thu, 24 Mar 2022 19:03:23 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v4 09/14] target/riscv: rvv: Add tail agnostic for vector
 integer merge and move instructions
Message-ID: <164814860220.28290.11643334198417094464-9@git.sr.ht>
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
Date: Thu, 24 Mar 2022 19:03:51 -0000
X-Original-Date: Mon, 07 Mar 2022 01:53:23 -0800
X-List-Received-Date: Thu, 24 Mar 2022 19:03:51 -0000

From: eopXD <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 40 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 28 +++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index ccbc55a2ab..24784b6f5f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2113,11 +2113,21 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_=
v *a)
         /* vmv.v.v has rs2 =3D 0 and vm =3D 1 */
         vext_check_sss(s, a->rd, a->rs1, 0, 1)) {
         if (s->vl_eq_vlmax) {
+            if (s->vta && s->lmul < 0) {
+                /* tail elements may pass vlmax when lmul < 0
+                * set tail elements to 1s
+                */
+                uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                                vreg_ofs(s, a->rd), -1,
+                                vlenb, vlenb);
+            }
             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
                              vreg_ofs(s, a->rs1),
                              MAXSZ(s), MAXSZ(s));
         } else {
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_gvec_2_ptr * const fns[4] =3D {
                 gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
                 gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
@@ -2153,6 +2163,15 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x=
 *a)
         s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
=20
         if (s->vl_eq_vlmax) {
+            if (s->vta && s->lmul < 0) {
+                /* tail elements may pass vlmax when lmul < 0
+                * set tail elements to 1s
+                */
+                uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                                vreg_ofs(s, a->rd), -1,
+                                vlenb, vlenb);
+            }
             tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
                                 MAXSZ(s), MAXSZ(s), s1);
         } else {
@@ -2160,6 +2179,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x =
*a)
             TCGv_i64 s1_i64 =3D tcg_temp_new_i64();
             TCGv_ptr dest =3D tcg_temp_new_ptr();
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[4] =3D {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -2190,6 +2210,15 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i=
 *a)
         vext_check_ss(s, a->rd, 0, 1)) {
         int64_t simm =3D sextract64(a->rs1, 0, 5);
         if (s->vl_eq_vlmax) {
+            if (s->vta && s->lmul < 0) {
+                /* tail elements may pass vlmax when lmul < 0
+                * set tail elements to 1s
+                */
+                uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                                vreg_ofs(s, a->rd), -1,
+                                vlenb, vlenb);
+            }
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), simm);
             mark_vs_dirty(s);
@@ -2198,6 +2227,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i =
*a)
             TCGv_i64 s1;
             TCGv_ptr dest;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[4] =3D {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -2770,6 +2800,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v=
_f *a)
         TCGv_i64 t1;
=20
         if (s->vl_eq_vlmax) {
+            if (s->vta && s->lmul < 0) {
+                /* tail elements may pass vlmax when lmul < 0
+                * set tail elements to 1s
+                */
+                uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                                vreg_ofs(s, a->rd), -1,
+                                vlenb, vlenb);
+            }
             t1 =3D tcg_temp_new_i64();
             /* NaN-box f[rs1] */
             do_nanbox(s, t1, cpu_fpr[a->rs1]);
@@ -2781,6 +2820,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_=
f *a)
             TCGv_ptr dest;
             TCGv_i32 desc;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[3] =3D {
                 gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a972946bc2..89927a424f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1964,6 +1964,10 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *=
env,           \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env_archcpu(env),    \
+                                         env->vtype);                \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -1971,6 +1975,9 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *e=
nv,           \
         *((ETYPE *)vd + H(i)) =3D s1;                                  \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     total_elems * esz);             \
 }
=20
 GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
@@ -1983,12 +1990,19 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVStat=
e *env,         \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env_archcpu(env),    \
+                                         env->vtype);                \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
         *((ETYPE *)vd + H(i)) =3D (ETYPE)s1;                           \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     total_elems * esz);             \
 }
=20
 GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
@@ -2001,6 +2015,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,          \
                   CPURISCVState *env, uint32_t desc)                 \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env_archcpu(env),    \
+                                         env->vtype);                \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -2008,6 +2026,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,          \
         *((ETYPE *)vd + H(i)) =3D *(vt + H(i));                        \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     total_elems * esz);             \
 }
=20
 GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
@@ -2020,6 +2041,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
               \
                   void *vs2, CPURISCVState *env, uint32_t desc)      \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env_archcpu(env),    \
+                                         env->vtype);                \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -2029,6 +2054,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
              \
         *((ETYPE *)vd + H(i)) =3D d;                                   \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     total_elems * esz);             \
 }
=20
 GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)
--=20
2.34.1


