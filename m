Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny62R-0001j1-3r
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny62A-0001aa-4h; Mon, 06 Jun 2022 02:16:16 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:48006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny620-0000i7-7a; Mon, 06 Jun 2022 02:16:11 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 8C78F11EFCC;
 Mon,  6 Jun 2022 06:15:46 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v19 06/16] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
Message-ID: <165449614532.19704.7000832880482980398-6@git.sr.ht>
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
Date: Mon, 06 Jun 2022 06:16:18 -0000
X-Original-Date: Sun, 06 Mar 2022 23:10:25 -0800
X-List-Received-Date: Mon, 06 Jun 2022 06:16:18 -0000

From: eopXD <yueh.ting.chen@gmail.com>

Destination register of unit-stride mask load and store instructions are
always written with a tail-agnostic policy.

A vector segment load / store instruction may contain fractional lmul
with nf * lmul > 1. The rest of the elements in the last register should
be treated as tail elements.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  6 +++
 target/riscv/translate.c                |  2 +
 target/riscv/vector_helper.c            | 60 +++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index bf9886a93d..cd73fd6119 100644
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
@@ -774,6 +775,8 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, =
uint8_t eew)
     /* EMUL =3D 1, NFIELDS =3D 1 */
     data =3D FIELD_DP32(data, VDATA, LMUL, 0);
     data =3D FIELD_DP32(data, VDATA, NF, 1);
+    /* Mask destination register are always tail-agnostic */
+    data =3D FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
@@ -862,6 +865,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, u=
int8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -991,6 +995,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, ui=
nt8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -1108,6 +1113,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uin=
t8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 59f0ee9a50..b151c20674 100644
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
@@ -1101,6 +1102,7 @@ static void riscv_tr_init_disas_context(DisasContextBas=
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
index 2248f0cbee..cb14c321ea 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -269,6 +269,9 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
=20
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
@@ -283,6 +286,18 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+    if (nf * max_elems % total_elems !=3D 0) {
+        uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+        uint32_t registers_used =3D
+            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
 }
=20
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
@@ -328,6 +343,9 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *=
env, uint32_t desc,
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < evl; i++, env->vstart++) {
@@ -339,6 +357,18 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState =
*env, uint32_t desc,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + evl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+    if (nf * max_elems % total_elems !=3D 0) {
+        uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+        uint32_t registers_used =3D
+            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
 }
=20
 /*
@@ -438,6 +468,9 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
@@ -453,6 +486,18 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+    if (nf * max_elems % total_elems !=3D 0) {
+        uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+        uint32_t registers_used =3D
+            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
 }
=20
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
@@ -520,6 +565,9 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
     target_ulong addr, offset, remain;
=20
     /* probe every access*/
@@ -575,6 +623,18 @@ ProbeSuccess:
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
+                          (k * max_elems + max_elems) * esz);
+    }
+    if (nf * max_elems % total_elems !=3D 0) {
+        uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
+        uint32_t registers_used =3D
+            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
+        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
+                          registers_used * vlenb);
+    }
 }
=20
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
--=20
2.34.2


