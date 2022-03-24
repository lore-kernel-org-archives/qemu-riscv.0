Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXSk9-0005vv-G5
	for mharc-qemu-riscv@gnu.org; Thu, 24 Mar 2022 15:03:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nXSk6-0005l7-MO; Thu, 24 Mar 2022 15:03:30 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nXSk4-0003ni-BS; Thu, 24 Mar 2022 15:03:30 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 792AA11F150;
 Thu, 24 Mar 2022 19:03:23 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v4 07/14] target/riscv: rvv: Add tail agnostic for vector
 integer shift instructions
Message-ID: <164814860220.28290.11643334198417094464-7@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <164814860220.28290.11643334198417094464-0@git.sr.ht>
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
Date: Thu, 24 Mar 2022 19:03:31 -0000
X-Original-Date: Mon, 07 Mar 2022 01:38:18 -0800
X-List-Received-Date: Thu, 24 Mar 2022 19:03:31 -0000

From: eopXD <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++++
 target/riscv/vector_helper.c            | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index e8ef5b1e0e..ccbc55a2ab 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1849,6 +1849,15 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVec=
Gen2sFn32 *gvec_fn,
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
+        if (s->vta && s->lmul < 0) {
+            /* tail elements may pass vlmax when lmul < 0
+             * set tail elements to 1s
+             */
+            uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                             vreg_ofs(s, a->rd), -1,
+                             vlenb, vlenb);
+        }
         TCGv_i32 src1 =3D tcg_temp_new_i32();
=20
         tcg_gen_trunc_tl_i32(src1, get_gpr(s, a->rs1, EXT_NONE));
@@ -1907,6 +1916,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4be99e3be4..9dedd1e29d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1263,6 +1263,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,      =
                    \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(TS1);                                           \
+    uint32_t total_elems =3D                                                \
+        vext_get_total_elems(env_archcpu(env), env->vtype);               \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint32_t i;                                                           \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
@@ -1274,6 +1278,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
                   \
         *((TS1 *)vd + HS1(i)) =3D OP(s2, s1 & MASK);                        \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,               \
+                                     total_elems * esz);                  \
 }
=20
 GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7)
@@ -1298,6 +1305,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
      \
 {                                                           \
     uint32_t vm =3D vext_vm(desc);                            \
     uint32_t vl =3D env->vl;                                  \
+    uint32_t esz =3D sizeof(TD);                              \
+    uint32_t total_elems =3D                                  \
+        vext_get_total_elems(env_archcpu(env), env->vtype); \
+    uint32_t vta =3D vext_vta(desc);                          \
     uint32_t i;                                             \
                                                             \
     for (i =3D env->vstart; i < vl; i++) {                    \
@@ -1308,6 +1319,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
     \
         *((TD *)vd + HD(i)) =3D OP(s2, s1 & MASK);            \
     }                                                       \
     env->vstart =3D 0;                                        \
+    /* set tail elements to 1s */                           \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, \
+                                     total_elems * esz);    \
 }
=20
 GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7)
--=20
2.34.1


