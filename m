Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny63v-00026p-61
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny62N-0001ik-6c; Mon, 06 Jun 2022 02:16:30 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:48022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny62B-0000iq-5s; Mon, 06 Jun 2022 02:16:26 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id D243111F032;
 Mon,  6 Jun 2022 06:15:47 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v19 14/16] target/riscv: rvv: Add tail agnostic for
 vector mask instructions
Message-ID: <165449614532.19704.7000832880482980398-14@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165449614532.19704.7000832880482980398-0@git.sr.ht>
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
Date: Mon, 06 Jun 2022 06:16:51 -0000
X-Original-Date: Mon, 07 Mar 2022 07:26:05 -0800
X-List-Received-Date: Mon, 06 Jun 2022 06:16:51 -0000

From: eopXD <yueh.ting.chen@gmail.com>

The tail elements in the destination mask register are updated under
a tail-agnostic policy.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  6 +++++
 target/riscv/vector_helper.c            | 30 +++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 1add4cb655..a94e634a6b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3135,6 +3135,8 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)    =
            \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D                                                     \
+            FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -3239,6 +3241,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D                                                     \
+            FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
                            cpu_env, s->cfg_ptr->vlen / 8,          \
@@ -3276,6 +3280,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m =
*a)
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         static gen_helper_gvec_3_ptr * const fns[4] =3D {
             gen_helper_viota_m_b, gen_helper_viota_m_h,
             gen_helper_viota_m_w, gen_helper_viota_m_d,
@@ -3305,6 +3310,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         static gen_helper_gvec_2_ptr * const fns[4] =3D {
             gen_helper_vid_v_b, gen_helper_vid_v_h,
             gen_helper_vid_v_w, gen_helper_vid_v_d,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 2ab4308ef0..5c2d1c02f4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4716,6 +4716,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
   \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vl =3D env->vl;                                \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;    \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);          \
     uint32_t i;                                           \
     int a, b;                                             \
                                                           \
@@ -4725,6 +4727,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,      =
    \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
     env->vstart =3D 0;                                      \
+    /* mask destination register are always tail-         \
+     * agnostic                                           \
+     */                                                   \
+    /* set tail elements to 1s */                         \
+    if (vta_all_1s) {                                     \
+        for (; i < total_elems; i++) {                    \
+            vext_set_elem_mask(vd, i, 1);                 \
+        }                                                 \
+    }                                                     \
 }
=20
 #define DO_NAND(N, M)  (!(N & M))
@@ -4792,6 +4803,8 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURI=
SCVState *env,
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);
     int i;
     bool first_mask_bit =3D false;
=20
@@ -4820,6 +4833,13 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPUR=
ISCVState *env,
         }
     }
     env->vstart =3D 0;
+    /* mask destination register are always tail-agnostic */
+    /* set tail elements to 1s */
+    if (vta_all_1s) {
+        for (; i < total_elems; i++) {
+            vext_set_elem_mask(vd, i, 1);
+        }
+    }
 }
=20
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
@@ -4847,6 +4867,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURIS=
CVState *env,      \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint32_t sum =3D 0;                                                     \
     int i;                                                                \
                                                                           \
@@ -4860,6 +4883,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURIS=
CVState *env,      \
         }                                                                 \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 GEN_VEXT_VIOTA_M(viota_m_b, uint8_t,  H1)
@@ -4873,6 +4898,9 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *en=
v, uint32_t desc)  \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     int i;                                                                \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
@@ -4882,6 +4910,8 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *en=
v, uint32_t desc)  \
         *((ETYPE *)vd + H(i)) =3D i;                                        \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 GEN_VEXT_VID_V(vid_v_b, uint8_t,  H1)
--=20
2.34.2


