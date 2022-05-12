Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1np4bZ-0003r5-9Q
	for mharc-qemu-riscv@gnu.org; Thu, 12 May 2022 04:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1np4bP-0003dB-3x; Thu, 12 May 2022 04:55:19 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:45262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1np4bM-0001bp-JR; Thu, 12 May 2022 04:55:18 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 7492611F09A;
 Thu, 12 May 2022 08:55:13 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v3 08/10] target/riscv: rvv: Add mask agnostic for vector
 mask instructions
Message-ID: <165234571195.20102.85010942779919381-8@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165234571195.20102.85010942779919381-0@git.sr.ht>
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
Date: Thu, 12 May 2022 08:55:21 -0000
X-Original-Date: Thu, 17 Mar 2022 02:14:47 -0700
X-List-Received-Date: Thu, 12 May 2022 08:55:21 -0000

From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  3 +++
 target/riscv/vector_helper.c            | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 3286b822c3..e25d5bb8d8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3272,6 +3272,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D                                                     \
             FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
                            cpu_env, s->cfg_ptr->vlen / 8,          \
@@ -3310,6 +3311,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m =
*a)
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
         static gen_helper_gvec_3_ptr * const fns[4] =3D {
             gen_helper_viota_m_b, gen_helper_viota_m_h,
             gen_helper_viota_m_w, gen_helper_viota_m_d,
@@ -3340,6 +3342,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
         static gen_helper_gvec_2_ptr * const fns[4] =3D {
             gen_helper_vid_v_b, gen_helper_vid_v_h,
             gen_helper_vid_v_w, gen_helper_vid_v_d,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f0f3241174..09a32c7432 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4878,11 +4878,16 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPU=
RISCVState *env,
     uint32_t vl =3D env->vl;
     uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;
     uint32_t vta_all_1s =3D vext_vta_all_1s(desc);
+    uint32_t vma =3D vext_vma(desc);
     int i;
     bool first_mask_bit =3D false;
=20
     for (i =3D env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            if (vma) {
+                vext_set_elem_mask(vd, i, 1);
+            }
             continue;
         }
         /* write a zero to all following active elements */
@@ -4943,11 +4948,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPUR=
ISCVState *env,      \
     uint32_t esz =3D sizeof(ETYPE);                                         \
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
     uint32_t vta =3D vext_vta(desc);                                        \
+    uint32_t vma =3D vext_vma(desc);                                        \
     uint32_t sum =3D 0;                                                     \
     int i;                                                                \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) =3D sum;                                      \
@@ -4974,10 +4982,13 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *=
env, uint32_t desc)  \
     uint32_t esz =3D sizeof(ETYPE);                                         \
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
     uint32_t vta =3D vext_vta(desc);                                        \
+    uint32_t vma =3D vext_vma(desc);                                        \
     int i;                                                                \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) =3D i;                                        \
--=20
2.34.2


