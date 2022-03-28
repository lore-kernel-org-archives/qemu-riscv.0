Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYjgn-0001JX-1j
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 03:21:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nYjge-0001C9-EG; Mon, 28 Mar 2022 03:21:12 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nYjgc-0007GF-Iq; Mon, 28 Mar 2022 03:21:12 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 9CF0F11EFCC;
 Mon, 28 Mar 2022 07:20:44 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v5 13/14] target/riscv: rvv: Add tail agnostic for vector
 mask instructions
Message-ID: <164845204233.25323.14607469451359734000-13@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <164845204233.25323.14607469451359734000-0@git.sr.ht>
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
Date: Mon, 28 Mar 2022 07:21:13 -0000
X-Original-Date: Mon, 07 Mar 2022 07:26:05 -0800
X-List-Received-Date: Mon, 28 Mar 2022 07:21:13 -0000

From: eopXD <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  4 ++++
 target/riscv/vector_helper.c            | 28 +++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 8abe80d3da..92f6dc5c76 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3199,6 +3199,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)    =
            \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -3303,6 +3304,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
                            cpu_env, s->cfg_ptr->vlen / 8,          \
@@ -3340,6 +3342,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m =
*a)
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         static gen_helper_gvec_3_ptr * const fns[4] =3D {
             gen_helper_viota_m_b, gen_helper_viota_m_h,
             gen_helper_viota_m_w, gen_helper_viota_m_d,
@@ -3369,6 +3372,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         static gen_helper_gvec_2_ptr * const fns[4] =3D {
             gen_helper_vid_v_b, gen_helper_vid_v_h,
             gen_helper_vid_v_w, gen_helper_vid_v_d,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a777744666..ec1c6927cf 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4721,6 +4721,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
   \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vl =3D env->vl;                                \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;    \
+    uint32_t vta =3D vext_vta(desc);                        \
     uint32_t i;                                           \
     int a, b;                                             \
                                                           \
@@ -4730,6 +4732,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,      =
    \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
     env->vstart =3D 0;                                      \
+    /* set tail elements to 1s */                         \
+    if (vta) {                                            \
+        for (; i < total_elems; i++) {                    \
+            vext_set_elem_mask(vd, i, 1);                 \
+        }                                                 \
+    }                                                     \
 }
=20
 #define DO_NAND(N, M)  (!(N & M))
@@ -4797,6 +4805,8 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURI=
SCVState *env,
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;
+    uint32_t vta =3D vext_vta(desc);
     int i;
     bool first_mask_bit =3D false;
=20
@@ -4825,6 +4835,12 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPUR=
ISCVState *env,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    if (vta) {
+        for (; i < total_elems; i++) {
+            vext_set_elem_mask(vd, i, 1);
+        }
+    }
 }
=20
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
@@ -4852,6 +4868,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURIS=
CVState *env,      \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(desc, esz);               \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint32_t sum =3D 0;                                                     \
     int i;                                                                \
                                                                           \
@@ -4865,6 +4884,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURIS=
CVState *env,      \
         }                                                                 \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,               \
+                                     total_elems * esz);                  \
 }
=20
 GEN_VEXT_VIOTA_M(viota_m_b, uint8_t,  H1)
@@ -4878,6 +4900,9 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *en=
v, uint32_t desc)  \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(desc, esz);               \
+    uint32_t vta =3D vext_vta(desc);                                        \
     int i;                                                                \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
@@ -4887,6 +4912,9 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *en=
v, uint32_t desc)  \
         *((ETYPE *)vd + H(i)) =3D i;                                        \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,               \
+                                     total_elems * esz);                  \
 }
=20
 GEN_VEXT_VID_V(vid_v_b, uint8_t,  H1)
--=20
2.34.1


