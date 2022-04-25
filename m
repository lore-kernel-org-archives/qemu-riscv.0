Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nizYA-0007WH-LF
	for mharc-qemu-riscv@gnu.org; Mon, 25 Apr 2022 10:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nizY7-0007Jv-71; Mon, 25 Apr 2022 10:18:47 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:41764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nizY5-0003Qd-Bx; Mon, 25 Apr 2022 10:18:46 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id D82B811EFBD;
 Mon, 25 Apr 2022 14:18:40 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu 9/9] target/riscv: rvv: Add mask agnostic for vector
 permutation instructions
Message-ID: <165089631935.4839.7564289944057093570-9@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165089631935.4839.7564289944057093570-0@git.sr.ht>
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
Date: Mon, 25 Apr 2022 14:18:47 -0000
X-Original-Date: Thu, 17 Mar 2022 02:32:47 -0700
X-List-Received-Date: Mon, 25 Apr 2022 14:18:47 -0000

From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  1 +
 target/riscv/vector_helper.c            | 34 +++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 69d00c7116..3858a0479a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3975,6 +3975,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uin=
t8_t seq)
=20
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
=20
     tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                        vreg_ofs(s, a->rs2), cpu_env,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 600ccad513..e87806ed64 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -5037,11 +5037,15 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1=
, void *vs2,         \
     uint32_t esz =3D sizeof(ETYPE);                                         \
     uint32_t total_elems =3D vext_get_total_elems(desc, esz);               \
     uint32_t vta =3D vext_vta(desc);                                        \
+    uint32_t vma =3D vext_vma(desc);                                        \
     target_ulong offset =3D s1, i_min, i;                                   \
                                                                           \
     i_min =3D MAX(env->vstart, offset);                                     \
     for (i =3D i_min; i < vl; i++) {                                        \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i, i * esz,         \
+                                             (i + 1) * esz);              \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - offset));          \
@@ -5067,13 +5071,18 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1=
, void *vs2,         \
     uint32_t esz =3D sizeof(ETYPE);                                         \
     uint32_t total_elems =3D vext_get_total_elems(desc, esz);               \
     uint32_t vta =3D vext_vta(desc);                                        \
+    uint32_t vma =3D vext_vma(desc);                                        \
     target_ulong i_max, i;                                                \
                                                                           \
     i_max =3D MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
     for (i =3D env->vstart; i < i_max; ++i) {                               \
-        if (vm || vext_elem_mask(v0, i)) {                                \
-            *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i + s1));          \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i, i * esz,         \
+                                             (i + 1) * esz);              \
+            continue;                                                     \
         }                                                                 \
+        *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i + s1));              \
     }                                                                     \
                                                                           \
     for (i =3D i_max; i < vl; ++i) {                                        \
@@ -5104,10 +5113,14 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, =
target_ulong s1,       \
     uint32_t esz =3D sizeof(ETYPE);                                         =
  \
     uint32_t total_elems =3D vext_get_total_elems(desc, esz);               =
  \
     uint32_t vta =3D vext_vta(desc);                                        =
  \
+    uint32_t vma =3D vext_vma(desc);                                        =
  \
     uint32_t i;                                                             \
                                                                             \
     for (i =3D env->vstart; i < vl; i++) {                                  =
  \
         if (!vm && !vext_elem_mask(v0, i)) {                                \
+            /* set masked-off elements to 1s */                             \
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i, i * esz,           \
+                                             (i + 1) * esz);                \
             continue;                                                       \
         }                                                                   \
         if (i =3D=3D 0) {                                                   =
    \
@@ -5150,10 +5163,14 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0=
, target_ulong s1,       \
     uint32_t esz =3D sizeof(ETYPE);                                         =
    \
     uint32_t total_elems =3D vext_get_total_elems(desc, esz);               =
    \
     uint32_t vta =3D vext_vta(desc);                                        =
    \
+    uint32_t vma =3D vext_vma(desc);                                        =
    \
     uint32_t i;                                                             =
  \
                                                                             =
  \
     for (i =3D env->vstart; i < vl; i++) {                                  =
    \
         if (!vm && !vext_elem_mask(v0, i)) {                                =
  \
+            /* set masked-off elements to 1s */                             =
  \
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i, i * esz,           =
  \
+                                             (i + 1) * esz);                =
  \
             continue;                                                       =
  \
         }                                                                   =
  \
         if (i =3D=3D vl - 1) {                                              =
      \
@@ -5222,11 +5239,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void=
 *vs2,               \
     uint32_t esz =3D sizeof(TS2);                                           \
     uint32_t total_elems =3D vext_get_total_elems(desc, esz);               \
     uint32_t vta =3D vext_vta(desc);                                        \
+    uint32_t vma =3D vext_vma(desc);                                        \
     uint64_t index;                                                       \
     uint32_t i;                                                           \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i, i * esz,         \
+                                             (i + 1) * esz);              \
             continue;                                                     \
         }                                                                 \
         index =3D *((TS1 *)vs1 + HS1(i));                                   \
@@ -5263,11 +5284,15 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1=
, void *vs2,         \
     uint32_t esz =3D sizeof(ETYPE);                                         \
     uint32_t total_elems =3D vext_get_total_elems(desc, esz);               \
     uint32_t vta =3D vext_vta(desc);                                        \
+    uint32_t vma =3D vext_vma(desc);                                        \
     uint64_t index =3D s1;                                                  \
     uint32_t i;                                                           \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i, i * esz,         \
+                                             (i + 1) * esz);              \
             continue;                                                     \
         }                                                                 \
         if (index >=3D vlmax) {                                             \
@@ -5349,10 +5374,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,     =
            \
     uint32_t esz =3D sizeof(ETYPE);                                \
     uint32_t total_elems =3D vext_get_total_elems(desc, esz);      \
     uint32_t vta =3D vext_vta(desc);                               \
+    uint32_t vma =3D vext_vma(desc);                               \
     uint32_t i;                                                  \
                                                                  \
     for (i =3D env->vstart; i < vl; i++) {                         \
         if (!vm && !vext_elem_mask(v0, i)) {                     \
+            /* set masked-off elements to 1s */                  \
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i,         \
+                                             i * esz,            \
+                                             (i + 1) * esz);     \
             continue;                                            \
         }                                                        \
         *((ETYPE *)vd + HD(i)) =3D *((DTYPE *)vs2 + HS1(i));       \
--=20
2.34.2

