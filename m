Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYjgN-0000qp-3X
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 03:20:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nYjgH-0000f4-Az; Mon, 28 Mar 2022 03:20:49 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nYjgD-0007EJ-C3; Mon, 28 Mar 2022 03:20:48 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 5FEB411EF74;
 Mon, 28 Mar 2022 07:20:43 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v5 04/14] target/riscv: rvv: Add tail agnostic for vv
 instructions
Message-ID: <164845204233.25323.14607469451359734000-4@git.sr.ht>
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
Date: Mon, 28 Mar 2022 07:20:50 -0000
X-Original-Date: Tue, 01 Mar 2022 01:07:38 -0800
X-List-Received-Date: Mon, 28 Mar 2022 07:20:50 -0000

From: eopXD <eop.chen@sifive.com>

This is the first commit regarding the tail agnostic behavior.
Added option 'rvv_ta_all_1s' to enable the behavior, the option
is default to false.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c                      |   1 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/cpu_helper.c               |   2 +
 target/riscv/insn_trans/trans_rvv.c.inc |  11 +
 target/riscv/internals.h                |   5 +-
 target/riscv/translate.c                |   2 +
 target/riscv/vector_helper.c            | 315 ++++++++++++++----------
 7 files changed, 207 insertions(+), 131 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..cd4cf4b41e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -810,6 +810,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
=20
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+    DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c069fe85fa..8c4a79b5a0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -369,6 +369,7 @@ struct RISCVCPUConfig {
     bool ext_zhinxmin;
     bool ext_zve32f;
     bool ext_zve64f;
+    bool rvv_ta_all_1s;
=20
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
@@ -516,6 +517,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
 /* If PointerMasking should be applied */
 FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
 FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
+FIELD(TB_FLAGS, VTA, 24, 1)
=20
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1c60fb2e80..2941c88c31 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -65,6 +65,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong =
*pc,
         flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
                     FIELD_EX64(env->vtype, VTYPE, VLMUL));
         flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
+        flags =3D FIELD_DP32(flags, TB_FLAGS, VTA,
+                    FIELD_EX64(env->vtype, VTYPE, VTA));
     } else {
         flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 57953923d5..cc80bf00ff 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1223,6 +1223,16 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn=
 *gvec_fn,
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     if (a->vm && s->vl_eq_vlmax) {
+        if (s->vta && s->lmul < 0) {
+            /*
+             * tail elements may pass vlmax when lmul < 0
+             * set tail elements to 1s
+             */
+            uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                             vreg_ofs(s, a->rd), -1,
+                             vlenb, vlenb);
+        }
         gvec_fn(s->sew, vreg_ofs(s, a->rd),
                 vreg_ofs(s, a->rs2), vreg_ofs(s, a->rs1),
                 MAXSZ(s), MAXSZ(s));
@@ -1231,6 +1241,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn =
*gvec_fn,
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->cfg_ptr->vlen / 8,
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index dbb322bfa7..512c6c30cf 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -24,8 +24,9 @@
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
-FIELD(VDATA, NF, 4, 4)
-FIELD(VDATA, WD, 4, 1)
+FIELD(VDATA, VTA, 4, 1)
+FIELD(VDATA, NF, 5, 4)
+FIELD(VDATA, WD, 5, 1)
=20
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fac998a6b5..7775dade26 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -94,6 +94,7 @@ typedef struct DisasContext {
      */
     int8_t lmul;
     uint8_t sew;
+    uint8_t vta;
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
@@ -1083,6 +1084,7 @@ static void riscv_tr_init_disas_context(DisasContextBas=
e *dcbase, CPUState *cs)
     ctx->vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul =3D sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
+    ctx->vta =3D FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_=
1s;
     ctx->vstart =3D env->vstart;
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->misa_mxl_max =3D env->misa_mxl_max;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d0452a7756..39c79c59c2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -122,6 +122,11 @@ static inline int32_t vext_lmul(uint32_t desc)
     return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
 }
=20
+static inline uint32_t vext_vta(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, VTA);
+}
+
 /*
  * Get the maximum number of elements can be operated.
  *
@@ -140,6 +145,19 @@ static inline uint32_t vext_max_elems(uint32_t desc, uin=
t32_t log2_esz)
     return scale < 0 ? vlenb >> -scale : vlenb << scale;
 }
=20
+/*
+ * Get number of total elements, including prestart, body and tail elements.
+ * Note that when LMUL < 1, the tail includes the elements past VLMAX that
+ * are held in the same vector register.
+ */
+static inline uint32_t vext_get_total_elems(uint32_t desc, uint32_t esz)
+{
+    uint32_t vlenb =3D simd_maxsz(desc);
+    int8_t lmul =3D vext_lmul(desc) < 0 ? 0 : vext_lmul(desc);
+
+    return vlenb >> (esz - lmul);
+}
+
 static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
 {
     return (addr & env->cur_pmmask) | env->cur_pmbase;
@@ -172,6 +190,33 @@ static void probe_pages(CPURISCVState *env, target_ulong=
 addr,
     }
 }
=20
+static void vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t cnt,
+                              uint32_t tot)
+{
+    if (is_agnostic =3D=3D 0) {
+        /* policy undisturbed */
+        return;
+    }
+    if (tot - cnt =3D=3D 0) {
+        return ;
+    }
+    memset(base, -1, tot - cnt);
+}
+
+/* set agnostic elements to 1s */
+#define GEN_SET_ELEMS_1S(SET_ELEMS_1S_FN, ETYPE, H)                         =
   \
+static void SET_ELEMS_1S_FN(void *vd, uint32_t is_agnostic, uint32_t idx,   =
   \
+                            uint32_t cnt, uint32_t tot)                     =
   \
+{                                                                           =
   \
+    ETYPE *cur =3D ((ETYPE *)vd + H(idx));                                  =
     \
+    vext_set_elems_1s(cur, is_agnostic, cnt, tot);                          =
   \
+}
+
+GEN_SET_ELEMS_1S(vext_set_elems_1s_b, int8_t, H1)
+GEN_SET_ELEMS_1S(vext_set_elems_1s_h, int16_t, H2)
+GEN_SET_ELEMS_1S(vext_set_elems_1s_w, int32_t, H4)
+GEN_SET_ELEMS_1S(vext_set_elems_1s_d, int64_t, H8)
+
 static inline void vext_set_elem_mask(void *v0, int index,
                                       uint8_t value)
 {
@@ -197,6 +242,14 @@ static inline int vext_elem_mask(void *v0, int index)
 typedef void vext_ldst_elem_fn(CPURISCVState *env, target_ulong addr,
                                uint32_t idx, void *vd, uintptr_t retaddr);
=20
+/* set bytes to all 1s for agnostic elements */
+typedef void vext_set_elems_1s_fn(void *vd, uint32_t vta, uint32_t idx,
+                                  uint32_t cnt, uint32_t tot);
+static vext_set_elems_1s_fn *vext_set_elems_1s_fns[4] =3D {
+    vext_set_elems_1s_b, vext_set_elems_1s_h,
+    vext_set_elems_1s_w, vext_set_elems_1s_d
+};
+
 #define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
 static void NAME(CPURISCVState *env, abi_ptr addr,         \
                  uint32_t idx, void *vd, uintptr_t retaddr)\
@@ -710,10 +763,12 @@ RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D, H8, H8, H8, DO_SUB)
=20
 static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
                        CPURISCVState *env, uint32_t desc,
-                       opivv2_fn *fn)
+                       opivv2_fn *fn, uint32_t esz)
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D vext_get_total_elems(desc, esz);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
=20
     for (i =3D env->vstart; i < vl; i++) {
@@ -723,26 +778,28 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, v=
oid *vs2,
         fn(vd, vs1, vs2, i);
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, total_elems * es=
z);
 }
=20
 /* generate the helpers for OPIVV */
-#define GEN_VEXT_VV(NAME)                                 \
+#define GEN_VEXT_VV(NAME, ESZ)                            \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     do_vext_vv(vd, v0, vs1, vs2, env, desc,               \
-               do_##NAME);                                \
+               do_##NAME, ESZ);                           \
 }
=20
-GEN_VEXT_VV(vadd_vv_b)
-GEN_VEXT_VV(vadd_vv_h)
-GEN_VEXT_VV(vadd_vv_w)
-GEN_VEXT_VV(vadd_vv_d)
-GEN_VEXT_VV(vsub_vv_b)
-GEN_VEXT_VV(vsub_vv_h)
-GEN_VEXT_VV(vsub_vv_w)
-GEN_VEXT_VV(vsub_vv_d)
+GEN_VEXT_VV(vadd_vv_b, 1)
+GEN_VEXT_VV(vadd_vv_h, 2)
+GEN_VEXT_VV(vadd_vv_w, 4)
+GEN_VEXT_VV(vadd_vv_d, 8)
+GEN_VEXT_VV(vsub_vv_b, 1)
+GEN_VEXT_VV(vsub_vv_h, 2)
+GEN_VEXT_VV(vsub_vv_w, 4)
+GEN_VEXT_VV(vsub_vv_d, 8)
=20
 typedef void opivx2_fn(void *vd, target_long s1, void *vs2, int i);
=20
@@ -887,30 +944,30 @@ RVVCALL(OPIVV2, vwadd_wv_w, WOP_WSSS_W, H8, H4, H4, DO_=
ADD)
 RVVCALL(OPIVV2, vwsub_wv_b, WOP_WSSS_B, H2, H1, H1, DO_SUB)
 RVVCALL(OPIVV2, vwsub_wv_h, WOP_WSSS_H, H4, H2, H2, DO_SUB)
 RVVCALL(OPIVV2, vwsub_wv_w, WOP_WSSS_W, H8, H4, H4, DO_SUB)
-GEN_VEXT_VV(vwaddu_vv_b)
-GEN_VEXT_VV(vwaddu_vv_h)
-GEN_VEXT_VV(vwaddu_vv_w)
-GEN_VEXT_VV(vwsubu_vv_b)
-GEN_VEXT_VV(vwsubu_vv_h)
-GEN_VEXT_VV(vwsubu_vv_w)
-GEN_VEXT_VV(vwadd_vv_b)
-GEN_VEXT_VV(vwadd_vv_h)
-GEN_VEXT_VV(vwadd_vv_w)
-GEN_VEXT_VV(vwsub_vv_b)
-GEN_VEXT_VV(vwsub_vv_h)
-GEN_VEXT_VV(vwsub_vv_w)
-GEN_VEXT_VV(vwaddu_wv_b)
-GEN_VEXT_VV(vwaddu_wv_h)
-GEN_VEXT_VV(vwaddu_wv_w)
-GEN_VEXT_VV(vwsubu_wv_b)
-GEN_VEXT_VV(vwsubu_wv_h)
-GEN_VEXT_VV(vwsubu_wv_w)
-GEN_VEXT_VV(vwadd_wv_b)
-GEN_VEXT_VV(vwadd_wv_h)
-GEN_VEXT_VV(vwadd_wv_w)
-GEN_VEXT_VV(vwsub_wv_b)
-GEN_VEXT_VV(vwsub_wv_h)
-GEN_VEXT_VV(vwsub_wv_w)
+GEN_VEXT_VV(vwaddu_vv_b, 2)
+GEN_VEXT_VV(vwaddu_vv_h, 4)
+GEN_VEXT_VV(vwaddu_vv_w, 8)
+GEN_VEXT_VV(vwsubu_vv_b, 2)
+GEN_VEXT_VV(vwsubu_vv_h, 4)
+GEN_VEXT_VV(vwsubu_vv_w, 8)
+GEN_VEXT_VV(vwadd_vv_b, 2)
+GEN_VEXT_VV(vwadd_vv_h, 4)
+GEN_VEXT_VV(vwadd_vv_w, 8)
+GEN_VEXT_VV(vwsub_vv_b, 2)
+GEN_VEXT_VV(vwsub_vv_h, 4)
+GEN_VEXT_VV(vwsub_vv_w, 8)
+GEN_VEXT_VV(vwaddu_wv_b, 2)
+GEN_VEXT_VV(vwaddu_wv_h, 4)
+GEN_VEXT_VV(vwaddu_wv_w, 8)
+GEN_VEXT_VV(vwsubu_wv_b, 2)
+GEN_VEXT_VV(vwsubu_wv_h, 4)
+GEN_VEXT_VV(vwsubu_wv_w, 8)
+GEN_VEXT_VV(vwadd_wv_b, 2)
+GEN_VEXT_VV(vwadd_wv_h, 4)
+GEN_VEXT_VV(vwadd_wv_w, 8)
+GEN_VEXT_VV(vwsub_wv_b, 2)
+GEN_VEXT_VV(vwsub_wv_h, 4)
+GEN_VEXT_VV(vwsub_wv_w, 8)
=20
 RVVCALL(OPIVX2, vwaddu_vx_b, WOP_UUU_B, H2, H1, DO_ADD)
 RVVCALL(OPIVX2, vwaddu_vx_h, WOP_UUU_H, H4, H2, DO_ADD)
@@ -1089,18 +1146,18 @@ RVVCALL(OPIVV2, vxor_vv_b, OP_SSS_B, H1, H1, H1, DO_X=
OR)
 RVVCALL(OPIVV2, vxor_vv_h, OP_SSS_H, H2, H2, H2, DO_XOR)
 RVVCALL(OPIVV2, vxor_vv_w, OP_SSS_W, H4, H4, H4, DO_XOR)
 RVVCALL(OPIVV2, vxor_vv_d, OP_SSS_D, H8, H8, H8, DO_XOR)
-GEN_VEXT_VV(vand_vv_b)
-GEN_VEXT_VV(vand_vv_h)
-GEN_VEXT_VV(vand_vv_w)
-GEN_VEXT_VV(vand_vv_d)
-GEN_VEXT_VV(vor_vv_b)
-GEN_VEXT_VV(vor_vv_h)
-GEN_VEXT_VV(vor_vv_w)
-GEN_VEXT_VV(vor_vv_d)
-GEN_VEXT_VV(vxor_vv_b)
-GEN_VEXT_VV(vxor_vv_h)
-GEN_VEXT_VV(vxor_vv_w)
-GEN_VEXT_VV(vxor_vv_d)
+GEN_VEXT_VV(vand_vv_b, 1)
+GEN_VEXT_VV(vand_vv_h, 2)
+GEN_VEXT_VV(vand_vv_w, 4)
+GEN_VEXT_VV(vand_vv_d, 8)
+GEN_VEXT_VV(vor_vv_b, 1)
+GEN_VEXT_VV(vor_vv_h, 2)
+GEN_VEXT_VV(vor_vv_w, 4)
+GEN_VEXT_VV(vor_vv_d, 8)
+GEN_VEXT_VV(vxor_vv_b, 1)
+GEN_VEXT_VV(vxor_vv_h, 2)
+GEN_VEXT_VV(vxor_vv_w, 4)
+GEN_VEXT_VV(vxor_vv_d, 8)
=20
 RVVCALL(OPIVX2, vand_vx_b, OP_SSS_B, H1, H1, DO_AND)
 RVVCALL(OPIVX2, vand_vx_h, OP_SSS_H, H2, H2, DO_AND)
@@ -1346,22 +1403,22 @@ RVVCALL(OPIVV2, vmax_vv_b, OP_SSS_B, H1, H1, H1, DO_M=
AX)
 RVVCALL(OPIVV2, vmax_vv_h, OP_SSS_H, H2, H2, H2, DO_MAX)
 RVVCALL(OPIVV2, vmax_vv_w, OP_SSS_W, H4, H4, H4, DO_MAX)
 RVVCALL(OPIVV2, vmax_vv_d, OP_SSS_D, H8, H8, H8, DO_MAX)
-GEN_VEXT_VV(vminu_vv_b)
-GEN_VEXT_VV(vminu_vv_h)
-GEN_VEXT_VV(vminu_vv_w)
-GEN_VEXT_VV(vminu_vv_d)
-GEN_VEXT_VV(vmin_vv_b)
-GEN_VEXT_VV(vmin_vv_h)
-GEN_VEXT_VV(vmin_vv_w)
-GEN_VEXT_VV(vmin_vv_d)
-GEN_VEXT_VV(vmaxu_vv_b)
-GEN_VEXT_VV(vmaxu_vv_h)
-GEN_VEXT_VV(vmaxu_vv_w)
-GEN_VEXT_VV(vmaxu_vv_d)
-GEN_VEXT_VV(vmax_vv_b)
-GEN_VEXT_VV(vmax_vv_h)
-GEN_VEXT_VV(vmax_vv_w)
-GEN_VEXT_VV(vmax_vv_d)
+GEN_VEXT_VV(vminu_vv_b, 1)
+GEN_VEXT_VV(vminu_vv_h, 2)
+GEN_VEXT_VV(vminu_vv_w, 4)
+GEN_VEXT_VV(vminu_vv_d, 8)
+GEN_VEXT_VV(vmin_vv_b, 1)
+GEN_VEXT_VV(vmin_vv_h, 2)
+GEN_VEXT_VV(vmin_vv_w, 4)
+GEN_VEXT_VV(vmin_vv_d, 8)
+GEN_VEXT_VV(vmaxu_vv_b, 1)
+GEN_VEXT_VV(vmaxu_vv_h, 2)
+GEN_VEXT_VV(vmaxu_vv_w, 4)
+GEN_VEXT_VV(vmaxu_vv_d, 8)
+GEN_VEXT_VV(vmax_vv_b, 1)
+GEN_VEXT_VV(vmax_vv_h, 2)
+GEN_VEXT_VV(vmax_vv_w, 4)
+GEN_VEXT_VV(vmax_vv_d, 8)
=20
 RVVCALL(OPIVX2, vminu_vx_b, OP_UUU_B, H1, H1, DO_MIN)
 RVVCALL(OPIVX2, vminu_vx_h, OP_UUU_H, H2, H2, DO_MIN)
@@ -1402,10 +1459,10 @@ RVVCALL(OPIVV2, vmul_vv_b, OP_SSS_B, H1, H1, H1, DO_M=
UL)
 RVVCALL(OPIVV2, vmul_vv_h, OP_SSS_H, H2, H2, H2, DO_MUL)
 RVVCALL(OPIVV2, vmul_vv_w, OP_SSS_W, H4, H4, H4, DO_MUL)
 RVVCALL(OPIVV2, vmul_vv_d, OP_SSS_D, H8, H8, H8, DO_MUL)
-GEN_VEXT_VV(vmul_vv_b)
-GEN_VEXT_VV(vmul_vv_h)
-GEN_VEXT_VV(vmul_vv_w)
-GEN_VEXT_VV(vmul_vv_d)
+GEN_VEXT_VV(vmul_vv_b, 1)
+GEN_VEXT_VV(vmul_vv_h, 2)
+GEN_VEXT_VV(vmul_vv_w, 4)
+GEN_VEXT_VV(vmul_vv_d, 8)
=20
 static int8_t do_mulh_b(int8_t s2, int8_t s1)
 {
@@ -1509,18 +1566,18 @@ RVVCALL(OPIVV2, vmulhsu_vv_b, OP_SUS_B, H1, H1, H1, d=
o_mulhsu_b)
 RVVCALL(OPIVV2, vmulhsu_vv_h, OP_SUS_H, H2, H2, H2, do_mulhsu_h)
 RVVCALL(OPIVV2, vmulhsu_vv_w, OP_SUS_W, H4, H4, H4, do_mulhsu_w)
 RVVCALL(OPIVV2, vmulhsu_vv_d, OP_SUS_D, H8, H8, H8, do_mulhsu_d)
-GEN_VEXT_VV(vmulh_vv_b)
-GEN_VEXT_VV(vmulh_vv_h)
-GEN_VEXT_VV(vmulh_vv_w)
-GEN_VEXT_VV(vmulh_vv_d)
-GEN_VEXT_VV(vmulhu_vv_b)
-GEN_VEXT_VV(vmulhu_vv_h)
-GEN_VEXT_VV(vmulhu_vv_w)
-GEN_VEXT_VV(vmulhu_vv_d)
-GEN_VEXT_VV(vmulhsu_vv_b)
-GEN_VEXT_VV(vmulhsu_vv_h)
-GEN_VEXT_VV(vmulhsu_vv_w)
-GEN_VEXT_VV(vmulhsu_vv_d)
+GEN_VEXT_VV(vmulh_vv_b, 1)
+GEN_VEXT_VV(vmulh_vv_h, 2)
+GEN_VEXT_VV(vmulh_vv_w, 4)
+GEN_VEXT_VV(vmulh_vv_d, 8)
+GEN_VEXT_VV(vmulhu_vv_b, 1)
+GEN_VEXT_VV(vmulhu_vv_h, 2)
+GEN_VEXT_VV(vmulhu_vv_w, 4)
+GEN_VEXT_VV(vmulhu_vv_d, 8)
+GEN_VEXT_VV(vmulhsu_vv_b, 1)
+GEN_VEXT_VV(vmulhsu_vv_h, 2)
+GEN_VEXT_VV(vmulhsu_vv_w, 4)
+GEN_VEXT_VV(vmulhsu_vv_d, 8)
=20
 RVVCALL(OPIVX2, vmul_vx_b, OP_SSS_B, H1, H1, DO_MUL)
 RVVCALL(OPIVX2, vmul_vx_h, OP_SSS_H, H2, H2, DO_MUL)
@@ -1579,22 +1636,22 @@ RVVCALL(OPIVV2, vrem_vv_b, OP_SSS_B, H1, H1, H1, DO_R=
EM)
 RVVCALL(OPIVV2, vrem_vv_h, OP_SSS_H, H2, H2, H2, DO_REM)
 RVVCALL(OPIVV2, vrem_vv_w, OP_SSS_W, H4, H4, H4, DO_REM)
 RVVCALL(OPIVV2, vrem_vv_d, OP_SSS_D, H8, H8, H8, DO_REM)
-GEN_VEXT_VV(vdivu_vv_b)
-GEN_VEXT_VV(vdivu_vv_h)
-GEN_VEXT_VV(vdivu_vv_w)
-GEN_VEXT_VV(vdivu_vv_d)
-GEN_VEXT_VV(vdiv_vv_b)
-GEN_VEXT_VV(vdiv_vv_h)
-GEN_VEXT_VV(vdiv_vv_w)
-GEN_VEXT_VV(vdiv_vv_d)
-GEN_VEXT_VV(vremu_vv_b)
-GEN_VEXT_VV(vremu_vv_h)
-GEN_VEXT_VV(vremu_vv_w)
-GEN_VEXT_VV(vremu_vv_d)
-GEN_VEXT_VV(vrem_vv_b)
-GEN_VEXT_VV(vrem_vv_h)
-GEN_VEXT_VV(vrem_vv_w)
-GEN_VEXT_VV(vrem_vv_d)
+GEN_VEXT_VV(vdivu_vv_b, 1)
+GEN_VEXT_VV(vdivu_vv_h, 2)
+GEN_VEXT_VV(vdivu_vv_w, 4)
+GEN_VEXT_VV(vdivu_vv_d, 8)
+GEN_VEXT_VV(vdiv_vv_b, 1)
+GEN_VEXT_VV(vdiv_vv_h, 2)
+GEN_VEXT_VV(vdiv_vv_w, 4)
+GEN_VEXT_VV(vdiv_vv_d, 8)
+GEN_VEXT_VV(vremu_vv_b, 1)
+GEN_VEXT_VV(vremu_vv_h, 2)
+GEN_VEXT_VV(vremu_vv_w, 4)
+GEN_VEXT_VV(vremu_vv_d, 8)
+GEN_VEXT_VV(vrem_vv_b, 1)
+GEN_VEXT_VV(vrem_vv_h, 2)
+GEN_VEXT_VV(vrem_vv_w, 4)
+GEN_VEXT_VV(vrem_vv_d, 8)
=20
 RVVCALL(OPIVX2, vdivu_vx_b, OP_UUU_B, H1, H1, DO_DIVU)
 RVVCALL(OPIVX2, vdivu_vx_h, OP_UUU_H, H2, H2, DO_DIVU)
@@ -1639,15 +1696,15 @@ RVVCALL(OPIVV2, vwmulu_vv_w, WOP_UUU_W, H8, H4, H4, D=
O_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_b, WOP_SUS_B, H2, H1, H1, DO_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_h, WOP_SUS_H, H4, H2, H2, DO_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_w, WOP_SUS_W, H8, H4, H4, DO_MUL)
-GEN_VEXT_VV(vwmul_vv_b)
-GEN_VEXT_VV(vwmul_vv_h)
-GEN_VEXT_VV(vwmul_vv_w)
-GEN_VEXT_VV(vwmulu_vv_b)
-GEN_VEXT_VV(vwmulu_vv_h)
-GEN_VEXT_VV(vwmulu_vv_w)
-GEN_VEXT_VV(vwmulsu_vv_b)
-GEN_VEXT_VV(vwmulsu_vv_h)
-GEN_VEXT_VV(vwmulsu_vv_w)
+GEN_VEXT_VV(vwmul_vv_b, 2)
+GEN_VEXT_VV(vwmul_vv_h, 4)
+GEN_VEXT_VV(vwmul_vv_w, 8)
+GEN_VEXT_VV(vwmulu_vv_b, 2)
+GEN_VEXT_VV(vwmulu_vv_h, 4)
+GEN_VEXT_VV(vwmulu_vv_w, 8)
+GEN_VEXT_VV(vwmulsu_vv_b, 2)
+GEN_VEXT_VV(vwmulsu_vv_h, 4)
+GEN_VEXT_VV(vwmulsu_vv_w, 8)
=20
 RVVCALL(OPIVX2, vwmul_vx_b, WOP_SSS_B, H2, H1, DO_MUL)
 RVVCALL(OPIVX2, vwmul_vx_h, WOP_SSS_H, H4, H2, DO_MUL)
@@ -1698,22 +1755,22 @@ RVVCALL(OPIVV3, vnmsub_vv_b, OP_SSS_B, H1, H1, H1, DO=
_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_h, OP_SSS_H, H2, H2, H2, DO_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_w, OP_SSS_W, H4, H4, H4, DO_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_d, OP_SSS_D, H8, H8, H8, DO_NMSUB)
-GEN_VEXT_VV(vmacc_vv_b)
-GEN_VEXT_VV(vmacc_vv_h)
-GEN_VEXT_VV(vmacc_vv_w)
-GEN_VEXT_VV(vmacc_vv_d)
-GEN_VEXT_VV(vnmsac_vv_b)
-GEN_VEXT_VV(vnmsac_vv_h)
-GEN_VEXT_VV(vnmsac_vv_w)
-GEN_VEXT_VV(vnmsac_vv_d)
-GEN_VEXT_VV(vmadd_vv_b)
-GEN_VEXT_VV(vmadd_vv_h)
-GEN_VEXT_VV(vmadd_vv_w)
-GEN_VEXT_VV(vmadd_vv_d)
-GEN_VEXT_VV(vnmsub_vv_b)
-GEN_VEXT_VV(vnmsub_vv_h)
-GEN_VEXT_VV(vnmsub_vv_w)
-GEN_VEXT_VV(vnmsub_vv_d)
+GEN_VEXT_VV(vmacc_vv_b, 1)
+GEN_VEXT_VV(vmacc_vv_h, 2)
+GEN_VEXT_VV(vmacc_vv_w, 4)
+GEN_VEXT_VV(vmacc_vv_d, 8)
+GEN_VEXT_VV(vnmsac_vv_b, 1)
+GEN_VEXT_VV(vnmsac_vv_h, 2)
+GEN_VEXT_VV(vnmsac_vv_w, 4)
+GEN_VEXT_VV(vnmsac_vv_d, 8)
+GEN_VEXT_VV(vmadd_vv_b, 1)
+GEN_VEXT_VV(vmadd_vv_h, 2)
+GEN_VEXT_VV(vmadd_vv_w, 4)
+GEN_VEXT_VV(vmadd_vv_d, 8)
+GEN_VEXT_VV(vnmsub_vv_b, 1)
+GEN_VEXT_VV(vnmsub_vv_h, 2)
+GEN_VEXT_VV(vnmsub_vv_w, 4)
+GEN_VEXT_VV(vnmsub_vv_d, 8)
=20
 #define OPIVX3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
 static void do_##NAME(void *vd, target_long s1, void *vs2, int i)   \
@@ -1766,15 +1823,15 @@ RVVCALL(OPIVV3, vwmacc_vv_w, WOP_SSS_W, H8, H4, H4, D=
O_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_b, WOP_SSU_B, H2, H1, H1, DO_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_h, WOP_SSU_H, H4, H2, H2, DO_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_w, WOP_SSU_W, H8, H4, H4, DO_MACC)
-GEN_VEXT_VV(vwmaccu_vv_b)
-GEN_VEXT_VV(vwmaccu_vv_h)
-GEN_VEXT_VV(vwmaccu_vv_w)
-GEN_VEXT_VV(vwmacc_vv_b)
-GEN_VEXT_VV(vwmacc_vv_h)
-GEN_VEXT_VV(vwmacc_vv_w)
-GEN_VEXT_VV(vwmaccsu_vv_b)
-GEN_VEXT_VV(vwmaccsu_vv_h)
-GEN_VEXT_VV(vwmaccsu_vv_w)
+GEN_VEXT_VV(vwmaccu_vv_b, 2)
+GEN_VEXT_VV(vwmaccu_vv_h, 4)
+GEN_VEXT_VV(vwmaccu_vv_w, 8)
+GEN_VEXT_VV(vwmacc_vv_b, 2)
+GEN_VEXT_VV(vwmacc_vv_h, 4)
+GEN_VEXT_VV(vwmacc_vv_w, 8)
+GEN_VEXT_VV(vwmaccsu_vv_b, 2)
+GEN_VEXT_VV(vwmaccsu_vv_h, 4)
+GEN_VEXT_VV(vwmaccsu_vv_w, 8)
=20
 RVVCALL(OPIVX3, vwmaccu_vx_b, WOP_UUU_B, H2, H1, DO_MACC)
 RVVCALL(OPIVX3, vwmaccu_vx_h, WOP_UUU_H, H4, H2, DO_MACC)
--=20
2.34.1


