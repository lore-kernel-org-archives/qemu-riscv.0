Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njjFm-0000L0-1K
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 11:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njjFZ-0008Pn-Ia; Wed, 27 Apr 2022 11:06:41 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:42202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njjFT-0005LM-C5; Wed, 27 Apr 2022 11:06:38 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 038E011EFD2;
 Wed, 27 Apr 2022 15:06:30 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v10 05/14] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
Message-ID: <165107198903.23549.13907705840662008250-5@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165107198903.23549.13907705840662008250-0@git.sr.ht>
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
Date: Wed, 27 Apr 2022 15:06:43 -0000
X-Original-Date: Sun, 06 Mar 2022 23:10:25 -0800
X-List-Received-Date: Wed, 27 Apr 2022 15:06:43 -0000

From: eopXD <eop.chen@sifive.com>

Destination register of unit-stride mask load and store instructions are
always written with a tail-agnostic policy.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 11 ++++++++++
 target/riscv/translate.c                |  2 ++
 target/riscv/vector_helper.c            | 28 +++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index cc80bf00ff..99691f1b9f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -711,6 +711,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint=
8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
@@ -748,6 +749,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint=
8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
=20
@@ -774,6 +776,8 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, =
uint8_t eew)
     /* EMUL =3D 1, NFIELDS =3D 1 */
     data =3D FIELD_DP32(data, VDATA, LMUL, 0);
     data =3D FIELD_DP32(data, VDATA, NF, 1);
+    /* Mask destination register are always tail-agnostic */
+    data =3D FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
@@ -791,6 +795,8 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, =
uint8_t eew)
     /* EMUL =3D 1, NFIELDS =3D 1 */
     data =3D FIELD_DP32(data, VDATA, LMUL, 0);
     data =3D FIELD_DP32(data, VDATA, NF, 1);
+    /* Mask destination register are always tail-agnostic */
+    data =3D FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
=20
@@ -862,6 +868,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, u=
int8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -891,6 +898,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, u=
int8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     fn =3D fns[eew];
     if (fn =3D=3D NULL) {
         return false;
@@ -991,6 +999,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, ui=
nt8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -1043,6 +1052,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, =
uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
=20
@@ -1108,6 +1118,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uin=
t8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7775dade26..58cbb6ded3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -95,6 +95,7 @@ typedef struct DisasContext {
     int8_t lmul;
     uint8_t sew;
     uint8_t vta;
+    bool cfg_vta_all_1s;
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
@@ -1085,6 +1086,7 @@ static void riscv_tr_init_disas_context(DisasContextBas=
e *dcbase, CPUState *cs)
     ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul =3D sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
     ctx->vta =3D FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_=
1s;
+    ctx->cfg_vta_all_1s =3D cpu->cfg.rvv_ta_all_1s;
     ctx->vstart =3D env->vstart;
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->misa_mxl_max =3D env->misa_mxl_max;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 396e252179..d186bf9512 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -270,6 +270,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t vta =3D vext_vta(desc);
=20
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
@@ -284,6 +286,11 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
 }
=20
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
@@ -329,6 +336,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *=
env, uint32_t desc,
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t vta =3D vext_vta(desc);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < evl; i++, env->vstart++) {
@@ -340,6 +349,11 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState =
*env, uint32_t desc,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
 }
=20
 /*
@@ -439,6 +453,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t vta =3D vext_vta(desc);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
@@ -454,6 +470,11 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
 }
=20
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
@@ -521,6 +542,8 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t vta =3D vext_vta(desc);
     target_ulong addr, offset, remain;
=20
     /* probe every access*/
@@ -576,6 +599,11 @@ ProbeSuccess:
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
 }
=20
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
--=20
2.34.2


