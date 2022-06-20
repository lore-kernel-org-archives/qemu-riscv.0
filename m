Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3BG6-0002KC-Ba
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFf-0001v2-Af; Mon, 20 Jun 2022 02:51:11 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:49176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFc-0004NE-9F; Mon, 20 Jun 2022 02:51:11 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id D816C11EF92;
 Mon, 20 Jun 2022 06:50:42 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v6 07/10] target/riscv: rvv: Add mask agnostic for vector
 floating-point instructions
Message-ID: <165570784143.17634.35095816584573691-7@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165570784143.17634.35095816584573691-0@git.sr.ht>
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
Date: Mon, 20 Jun 2022 06:51:13 -0000
X-Original-Date: Thu, 17 Mar 2022 02:08:01 -0700
X-List-Received-Date: Mon, 20 Jun 2022 06:51:13 -0000

From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++++
 target/riscv/vector_helper.c            | 26 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index e6aa5295a1..8ce3d28603 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2361,6 +2361,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         data =3D                                                     \
             FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -2446,6 +2447,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
           \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);              \
         data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S,                \
                           s->cfg_vta_all_1s);                     \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);              \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
                            fns[s->sew - 1], s);                   \
     }                                                             \
@@ -2485,6 +2487,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
                            vreg_ofs(s, a->rs1),                  \
                            vreg_ofs(s, a->rs2), cpu_env,         \
@@ -2525,6 +2528,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);             \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
                            fns[s->sew - 1], s);                  \
     }                                                            \
@@ -2562,6 +2566,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -2602,6 +2607,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);             \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
                            fns[s->sew - 1], s);                  \
     }                                                            \
@@ -2686,6 +2692,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
                            s->cfg_ptr->vlen / 8,
@@ -2790,6 +2797,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_=
f *a)
             TCGv_i32 desc;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
             data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+            data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
             static gen_helper_vmv_vx * const fns[3] =3D {
                 gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w,
@@ -2891,6 +2899,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -2944,6 +2953,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -3012,6 +3022,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -3067,6 +3078,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 597fa9c752..315742c6b8 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3051,10 +3051,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,     =
     \
     uint32_t total_elems =3D                                \
         vext_get_total_elems(env, desc, ESZ);             \
     uint32_t vta =3D vext_vta(desc);                        \
+    uint32_t vma =3D vext_vma(desc);                        \
     uint32_t i;                                           \
                                                           \
     for (i =3D env->vstart; i < vl; i++) {                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
+            /* set masked-off elements to 1s */           \
+            vext_set_elems_1s(vd, vma, i * ESZ,           \
+                              (i + 1) * ESZ);             \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, vs1, vs2, i, env);                  \
@@ -3090,10 +3094,14 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,   =
     \
     uint32_t total_elems =3D                                \
         vext_get_total_elems(env, desc, ESZ);              \
     uint32_t vta =3D vext_vta(desc);                        \
+    uint32_t vma =3D vext_vma(desc);                        \
     uint32_t i;                                           \
                                                           \
     for (i =3D env->vstart; i < vl; i++) {                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
+            /* set masked-off elements to 1s */           \
+            vext_set_elems_1s(vd, vma, i * ESZ,           \
+                              (i + 1) * ESZ);             \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, s1, vs2, i, env);                   \
@@ -3665,6 +3673,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
     uint32_t total_elems =3D                             \
         vext_get_total_elems(env, desc, ESZ);          \
     uint32_t vta =3D vext_vta(desc);                     \
+    uint32_t vma =3D vext_vma(desc);                     \
     uint32_t i;                                        \
                                                        \
     if (vl =3D=3D 0) {                                     \
@@ -3672,6 +3681,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
     }                                                  \
     for (i =3D env->vstart; i < vl; i++) {               \
         if (!vm && !vext_elem_mask(v0, i)) {           \
+            /* set masked-off elements to 1s */        \
+            vext_set_elems_1s(vd, vma, i * ESZ,        \
+                              (i + 1) * ESZ);          \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i, env);                    \
@@ -4182,12 +4194,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void=
 *vs2,   \
     uint32_t vl =3D env->vl;                                    \
     uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;        \
     uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
+    uint32_t vma =3D vext_vma(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
         if (!vm && !vext_elem_mask(v0, i)) {                  \
+            /* set masked-off elements to 1s */               \
+            if (vma) {                                        \
+                vext_set_elem_mask(vd, i, 1);                 \
+            }                                                 \
             continue;                                         \
         }                                                     \
         vext_set_elem_mask(vd, i,                             \
@@ -4215,11 +4232,16 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, vo=
id *vs2,       \
     uint32_t vl =3D env->vl;                                          \
     uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;              \
     uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                    \
+    uint32_t vma =3D vext_vma(desc);                                  \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D env->vstart; i < vl; i++) {                            \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                          \
         if (!vm && !vext_elem_mask(v0, i)) {                        \
+            /* set masked-off elements to 1s */                     \
+            if (vma) {                                              \
+                vext_set_elem_mask(vd, i, 1);                       \
+            }                                                       \
             continue;                                               \
         }                                                           \
         vext_set_elem_mask(vd, i,                                   \
@@ -4342,10 +4364,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,     =
  \
     uint32_t total_elems =3D                             \
         vext_get_total_elems(env, desc, ESZ);          \
     uint32_t vta =3D vext_vta(desc);                     \
+    uint32_t vma =3D vext_vma(desc);                     \
     uint32_t i;                                        \
                                                        \
     for (i =3D env->vstart; i < vl; i++) {               \
         if (!vm && !vext_elem_mask(v0, i)) {           \
+            /* set masked-off elements to 1s */        \
+            vext_set_elems_1s(vd, vma, i * ESZ,        \
+                              (i + 1) * ESZ);          \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i);                         \
--=20
2.34.2


