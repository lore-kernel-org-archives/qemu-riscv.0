Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nopkB-0007tx-Jl
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 13:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nopk5-0007sf-Jx; Wed, 11 May 2022 13:03:17 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:45132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nopk3-0005dT-Ew; Wed, 11 May 2022 13:03:17 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 796A211F02E;
 Wed, 11 May 2022 17:03:14 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v16 03/15] target/riscv: rvv: Early exit when vstart >= vl
MIME-Version: 1.0
Message-ID: <165228859378.22204.7336259119424019499-3@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165228859378.22204.7336259119424019499-0@git.sr.ht>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Date: Wed, 11 May 2022 17:03:18 -0000
X-Original-Date: Fri, 11 Mar 2022 22:28:22 -0800
X-List-Received-Date: Wed, 11 May 2022 17:03:18 -0000

From: eopXD <eop.chen@sifive.com>

According to v-spec (section 5.4):
When vstart =E2=89=A5 vl, there are no body elements, and no elements are
updated in any destination vector register group, including that
no tail elements are updated with agnostic values.

vmsbf.m, vmsif.m, vmsof.m, viota.m, vcompress instructions themselves
require vstart to be zero. So they don't need the early exit.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 90327509f7..4d5dfa794a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -652,6 +652,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint=
32_t data,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -818,6 +819,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, =
uint32_t rs2,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -925,6 +927,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, u=
int32_t vs2,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1067,6 +1070,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint3=
2_t data,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1221,6 +1225,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn =
*gvec_fn,
     }
=20
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     if (a->vm && s->vl_eq_vlmax) {
         gvec_fn(s->sew, vreg_ofs(s, a->rd),
@@ -1268,6 +1273,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint=
32_t vs2, uint32_t vm,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1432,6 +1438,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint=
32_t vs2, uint32_t vm,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1518,6 +1525,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -1598,6 +1606,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -1675,6 +1684,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -1856,6 +1866,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2066,6 +2077,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v =
*a)
             };
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
                                cpu_env, s->cfg_ptr->vlen / 8,
@@ -2089,6 +2101,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x =
*a)
         TCGv s1;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
=20
@@ -2144,6 +2157,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i =
*a)
             };
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
             s1 =3D tcg_constant_i64(simm);
             dest =3D tcg_temp_new_ptr();
@@ -2296,6 +2310,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2326,6 +2341,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint=
32_t vs2,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -2414,6 +2430,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
         TCGLabel *over =3D gen_new_label();                        \
         gen_set_rm(s, RISCV_FRM_DYN);                            \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);\
                                                                  \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
@@ -2488,6 +2505,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2609,6 +2627,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
         TCGLabel *over =3D gen_new_label();
         gen_set_rm(s, rm);
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -2722,6 +2741,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_=
f *a)
             };
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
             t1 =3D tcg_temp_new_i64();
             /* NaN-box f[rs1] */
@@ -2810,6 +2830,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2861,6 +2882,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -2926,6 +2948,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2979,6 +3002,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -3066,6 +3090,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)    =
            \
         gen_helper_gvec_4_ptr *fn =3D gen_helper_##NAME;             \
         TCGLabel *over =3D gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -3234,6 +3259,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -3744,6 +3770,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uin=
t8_t seq)
     gen_helper_gvec_3_ptr *fn;
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     static gen_helper_gvec_3_ptr * const fns[6][4] =3D {
         {
--=20
2.34.2


