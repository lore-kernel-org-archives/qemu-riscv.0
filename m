Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny63u-00026E-W9
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny62N-0001ii-4U; Mon, 06 Jun 2022 02:16:29 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:48012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny626-0000ij-GM; Mon, 06 Jun 2022 02:16:24 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id CD62311EFDA;
 Mon,  6 Jun 2022 06:15:46 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v19 08/16] target/riscv: rvv: Add tail agnostic for
 vector integer shift instructions
Message-ID: <165449614532.19704.7000832880482980398-8@git.sr.ht>
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
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Date: Mon, 06 Jun 2022 06:16:47 -0000
X-Original-Date: Mon, 07 Mar 2022 01:38:18 -0800
X-List-Received-Date: Mon, 06 Jun 2022 06:16:47 -0000

From: eopXD <yueh.ting.chen@gmail.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  3 ++-
 target/riscv/vector_helper.c            | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 22edf6228d..dbe687fb73 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1831,7 +1831,7 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecG=
en2sFn32 *gvec_fn,
         return false;
     }
=20
-    if (a->vm && s->vl_eq_vlmax) {
+    if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         TCGv_i32 src1 =3D tcg_temp_new_i32();
=20
         tcg_gen_trunc_tl_i32(src1, get_gpr(s, a->rs1, EXT_NONE));
@@ -1890,6 +1890,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3bcde37e28..9738c50222 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1270,6 +1270,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
                   \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(TS1);                                           \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint32_t i;                                                           \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
@@ -1281,6 +1284,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
                   \
         *((TS1 *)vd + HS1(i)) =3D OP(s2, s1 & MASK);                        \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7)
@@ -1305,6 +1310,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
      \
 {                                                           \
     uint32_t vm =3D vext_vm(desc);                            \
     uint32_t vl =3D env->vl;                                  \
+    uint32_t esz =3D sizeof(TD);                              \
+    uint32_t total_elems =3D                                  \
+        vext_get_total_elems(env, desc, esz);               \
+    uint32_t vta =3D vext_vta(desc);                          \
     uint32_t i;                                             \
                                                             \
     for (i =3D env->vstart; i < vl; i++) {                    \
@@ -1315,6 +1324,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
     \
         *((TD *)vd + HD(i)) =3D OP(s2, s1 & MASK);            \
     }                                                       \
     env->vstart =3D 0;                                        \
+    /* set tail elements to 1s */                           \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);\
 }
=20
 GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7)
--=20
2.34.2


