Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny63n-00020G-LR
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny62O-0001io-L0; Mon, 06 Jun 2022 02:16:31 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:48020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny62B-0000io-6W; Mon, 06 Jun 2022 02:16:28 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 4FF0A11F01D;
 Mon,  6 Jun 2022 06:15:47 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v19 11/16] target/riscv: rvv: Add tail agnostic for
 vector fix-point arithmetic instructions
Message-ID: <165449614532.19704.7000832880482980398-11@git.sr.ht>
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
Date: Mon, 06 Jun 2022 06:16:52 -0000
X-Original-Date: Mon, 07 Mar 2022 02:04:21 -0800
X-List-Received-Date: Mon, 06 Jun 2022 06:16:52 -0000

From: eopXD <yueh.ting.chen@gmail.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 220 ++++++++++++++++++-----------------
 1 file changed, 114 insertions(+), 106 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 2bf670920a..db221797c6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2102,10 +2102,12 @@ static inline void
 vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
              CPURISCVState *env,
              uint32_t desc,
-             opivv2_rm_fn *fn)
+             opivv2_rm_fn *fn, uint32_t esz)
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
=20
     switch (env->vxrm) {
     case 0: /* rnu */
@@ -2125,15 +2127,17 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
                      env, vl, vm, 3, fn);
         break;
     }
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
 }
=20
 /* generate helpers for fixed point instructions with OPIVV format */
-#define GEN_VEXT_VV_RM(NAME)                                    \
+#define GEN_VEXT_VV_RM(NAME, ESZ)                               \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
                   CPURISCVState *env, uint32_t desc)            \
 {                                                               \
     vext_vv_rm_2(vd, v0, vs1, vs2, env, desc,                   \
-                 do_##NAME);                                    \
+                 do_##NAME, ESZ);                               \
 }
=20
 static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_=
t b)
@@ -2183,10 +2187,10 @@ RVVCALL(OPIVV2_RM, vsaddu_vv_b, OP_UUU_B, H1, H1, H1,=
 saddu8)
 RVVCALL(OPIVV2_RM, vsaddu_vv_h, OP_UUU_H, H2, H2, H2, saddu16)
 RVVCALL(OPIVV2_RM, vsaddu_vv_w, OP_UUU_W, H4, H4, H4, saddu32)
 RVVCALL(OPIVV2_RM, vsaddu_vv_d, OP_UUU_D, H8, H8, H8, saddu64)
-GEN_VEXT_VV_RM(vsaddu_vv_b)
-GEN_VEXT_VV_RM(vsaddu_vv_h)
-GEN_VEXT_VV_RM(vsaddu_vv_w)
-GEN_VEXT_VV_RM(vsaddu_vv_d)
+GEN_VEXT_VV_RM(vsaddu_vv_b, 1)
+GEN_VEXT_VV_RM(vsaddu_vv_h, 2)
+GEN_VEXT_VV_RM(vsaddu_vv_w, 4)
+GEN_VEXT_VV_RM(vsaddu_vv_d, 8)
=20
 typedef void opivx2_rm_fn(void *vd, target_long s1, void *vs2, int i,
                           CPURISCVState *env, int vxrm);
@@ -2219,10 +2223,12 @@ static inline void
 vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
              CPURISCVState *env,
              uint32_t desc,
-             opivx2_rm_fn *fn)
+             opivx2_rm_fn *fn, uint32_t esz)
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
=20
     switch (env->vxrm) {
     case 0: /* rnu */
@@ -2242,25 +2248,27 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, void=
 *vs2,
                      env, vl, vm, 3, fn);
         break;
     }
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
 }
=20
 /* generate helpers for fixed point instructions with OPIVX format */
-#define GEN_VEXT_VX_RM(NAME)                              \
+#define GEN_VEXT_VX_RM(NAME, ESZ)                         \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
         void *vs2, CPURISCVState *env, uint32_t desc)     \
 {                                                         \
     vext_vx_rm_2(vd, v0, s1, vs2, env, desc,              \
-                 do_##NAME);                              \
+                 do_##NAME, ESZ);                         \
 }
=20
 RVVCALL(OPIVX2_RM, vsaddu_vx_b, OP_UUU_B, H1, H1, saddu8)
 RVVCALL(OPIVX2_RM, vsaddu_vx_h, OP_UUU_H, H2, H2, saddu16)
 RVVCALL(OPIVX2_RM, vsaddu_vx_w, OP_UUU_W, H4, H4, saddu32)
 RVVCALL(OPIVX2_RM, vsaddu_vx_d, OP_UUU_D, H8, H8, saddu64)
-GEN_VEXT_VX_RM(vsaddu_vx_b)
-GEN_VEXT_VX_RM(vsaddu_vx_h)
-GEN_VEXT_VX_RM(vsaddu_vx_w)
-GEN_VEXT_VX_RM(vsaddu_vx_d)
+GEN_VEXT_VX_RM(vsaddu_vx_b, 1)
+GEN_VEXT_VX_RM(vsaddu_vx_h, 2)
+GEN_VEXT_VX_RM(vsaddu_vx_w, 4)
+GEN_VEXT_VX_RM(vsaddu_vx_d, 8)
=20
 static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
@@ -2306,19 +2314,19 @@ RVVCALL(OPIVV2_RM, vsadd_vv_b, OP_SSS_B, H1, H1, H1, =
sadd8)
 RVVCALL(OPIVV2_RM, vsadd_vv_h, OP_SSS_H, H2, H2, H2, sadd16)
 RVVCALL(OPIVV2_RM, vsadd_vv_w, OP_SSS_W, H4, H4, H4, sadd32)
 RVVCALL(OPIVV2_RM, vsadd_vv_d, OP_SSS_D, H8, H8, H8, sadd64)
-GEN_VEXT_VV_RM(vsadd_vv_b)
-GEN_VEXT_VV_RM(vsadd_vv_h)
-GEN_VEXT_VV_RM(vsadd_vv_w)
-GEN_VEXT_VV_RM(vsadd_vv_d)
+GEN_VEXT_VV_RM(vsadd_vv_b, 1)
+GEN_VEXT_VV_RM(vsadd_vv_h, 2)
+GEN_VEXT_VV_RM(vsadd_vv_w, 4)
+GEN_VEXT_VV_RM(vsadd_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vsadd_vx_b, OP_SSS_B, H1, H1, sadd8)
 RVVCALL(OPIVX2_RM, vsadd_vx_h, OP_SSS_H, H2, H2, sadd16)
 RVVCALL(OPIVX2_RM, vsadd_vx_w, OP_SSS_W, H4, H4, sadd32)
 RVVCALL(OPIVX2_RM, vsadd_vx_d, OP_SSS_D, H8, H8, sadd64)
-GEN_VEXT_VX_RM(vsadd_vx_b)
-GEN_VEXT_VX_RM(vsadd_vx_h)
-GEN_VEXT_VX_RM(vsadd_vx_w)
-GEN_VEXT_VX_RM(vsadd_vx_d)
+GEN_VEXT_VX_RM(vsadd_vx_b, 1)
+GEN_VEXT_VX_RM(vsadd_vx_h, 2)
+GEN_VEXT_VX_RM(vsadd_vx_w, 4)
+GEN_VEXT_VX_RM(vsadd_vx_d, 8)
=20
 static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_=
t b)
 {
@@ -2367,19 +2375,19 @@ RVVCALL(OPIVV2_RM, vssubu_vv_b, OP_UUU_B, H1, H1, H1,=
 ssubu8)
 RVVCALL(OPIVV2_RM, vssubu_vv_h, OP_UUU_H, H2, H2, H2, ssubu16)
 RVVCALL(OPIVV2_RM, vssubu_vv_w, OP_UUU_W, H4, H4, H4, ssubu32)
 RVVCALL(OPIVV2_RM, vssubu_vv_d, OP_UUU_D, H8, H8, H8, ssubu64)
-GEN_VEXT_VV_RM(vssubu_vv_b)
-GEN_VEXT_VV_RM(vssubu_vv_h)
-GEN_VEXT_VV_RM(vssubu_vv_w)
-GEN_VEXT_VV_RM(vssubu_vv_d)
+GEN_VEXT_VV_RM(vssubu_vv_b, 1)
+GEN_VEXT_VV_RM(vssubu_vv_h, 2)
+GEN_VEXT_VV_RM(vssubu_vv_w, 4)
+GEN_VEXT_VV_RM(vssubu_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vssubu_vx_b, OP_UUU_B, H1, H1, ssubu8)
 RVVCALL(OPIVX2_RM, vssubu_vx_h, OP_UUU_H, H2, H2, ssubu16)
 RVVCALL(OPIVX2_RM, vssubu_vx_w, OP_UUU_W, H4, H4, ssubu32)
 RVVCALL(OPIVX2_RM, vssubu_vx_d, OP_UUU_D, H8, H8, ssubu64)
-GEN_VEXT_VX_RM(vssubu_vx_b)
-GEN_VEXT_VX_RM(vssubu_vx_h)
-GEN_VEXT_VX_RM(vssubu_vx_w)
-GEN_VEXT_VX_RM(vssubu_vx_d)
+GEN_VEXT_VX_RM(vssubu_vx_b, 1)
+GEN_VEXT_VX_RM(vssubu_vx_h, 2)
+GEN_VEXT_VX_RM(vssubu_vx_w, 4)
+GEN_VEXT_VX_RM(vssubu_vx_d, 8)
=20
 static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
@@ -2425,19 +2433,19 @@ RVVCALL(OPIVV2_RM, vssub_vv_b, OP_SSS_B, H1, H1, H1, =
ssub8)
 RVVCALL(OPIVV2_RM, vssub_vv_h, OP_SSS_H, H2, H2, H2, ssub16)
 RVVCALL(OPIVV2_RM, vssub_vv_w, OP_SSS_W, H4, H4, H4, ssub32)
 RVVCALL(OPIVV2_RM, vssub_vv_d, OP_SSS_D, H8, H8, H8, ssub64)
-GEN_VEXT_VV_RM(vssub_vv_b)
-GEN_VEXT_VV_RM(vssub_vv_h)
-GEN_VEXT_VV_RM(vssub_vv_w)
-GEN_VEXT_VV_RM(vssub_vv_d)
+GEN_VEXT_VV_RM(vssub_vv_b, 1)
+GEN_VEXT_VV_RM(vssub_vv_h, 2)
+GEN_VEXT_VV_RM(vssub_vv_w, 4)
+GEN_VEXT_VV_RM(vssub_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vssub_vx_b, OP_SSS_B, H1, H1, ssub8)
 RVVCALL(OPIVX2_RM, vssub_vx_h, OP_SSS_H, H2, H2, ssub16)
 RVVCALL(OPIVX2_RM, vssub_vx_w, OP_SSS_W, H4, H4, ssub32)
 RVVCALL(OPIVX2_RM, vssub_vx_d, OP_SSS_D, H8, H8, ssub64)
-GEN_VEXT_VX_RM(vssub_vx_b)
-GEN_VEXT_VX_RM(vssub_vx_h)
-GEN_VEXT_VX_RM(vssub_vx_w)
-GEN_VEXT_VX_RM(vssub_vx_d)
+GEN_VEXT_VX_RM(vssub_vx_b, 1)
+GEN_VEXT_VX_RM(vssub_vx_h, 2)
+GEN_VEXT_VX_RM(vssub_vx_w, 4)
+GEN_VEXT_VX_RM(vssub_vx_d, 8)
=20
 /* Vector Single-Width Averaging Add and Subtract */
 static inline uint8_t get_round(int vxrm, uint64_t v, uint8_t shift)
@@ -2489,19 +2497,19 @@ RVVCALL(OPIVV2_RM, vaadd_vv_b, OP_SSS_B, H1, H1, H1, =
aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_h, OP_SSS_H, H2, H2, H2, aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_w, OP_SSS_W, H4, H4, H4, aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_d, OP_SSS_D, H8, H8, H8, aadd64)
-GEN_VEXT_VV_RM(vaadd_vv_b)
-GEN_VEXT_VV_RM(vaadd_vv_h)
-GEN_VEXT_VV_RM(vaadd_vv_w)
-GEN_VEXT_VV_RM(vaadd_vv_d)
+GEN_VEXT_VV_RM(vaadd_vv_b, 1)
+GEN_VEXT_VV_RM(vaadd_vv_h, 2)
+GEN_VEXT_VV_RM(vaadd_vv_w, 4)
+GEN_VEXT_VV_RM(vaadd_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vaadd_vx_b, OP_SSS_B, H1, H1, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_h, OP_SSS_H, H2, H2, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_w, OP_SSS_W, H4, H4, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_d, OP_SSS_D, H8, H8, aadd64)
-GEN_VEXT_VX_RM(vaadd_vx_b)
-GEN_VEXT_VX_RM(vaadd_vx_h)
-GEN_VEXT_VX_RM(vaadd_vx_w)
-GEN_VEXT_VX_RM(vaadd_vx_d)
+GEN_VEXT_VX_RM(vaadd_vx_b, 1)
+GEN_VEXT_VX_RM(vaadd_vx_h, 2)
+GEN_VEXT_VX_RM(vaadd_vx_w, 4)
+GEN_VEXT_VX_RM(vaadd_vx_d, 8)
=20
 static inline uint32_t aaddu32(CPURISCVState *env, int vxrm,
                                uint32_t a, uint32_t b)
@@ -2526,19 +2534,19 @@ RVVCALL(OPIVV2_RM, vaaddu_vv_b, OP_UUU_B, H1, H1, H1,=
 aaddu32)
 RVVCALL(OPIVV2_RM, vaaddu_vv_h, OP_UUU_H, H2, H2, H2, aaddu32)
 RVVCALL(OPIVV2_RM, vaaddu_vv_w, OP_UUU_W, H4, H4, H4, aaddu32)
 RVVCALL(OPIVV2_RM, vaaddu_vv_d, OP_UUU_D, H8, H8, H8, aaddu64)
-GEN_VEXT_VV_RM(vaaddu_vv_b)
-GEN_VEXT_VV_RM(vaaddu_vv_h)
-GEN_VEXT_VV_RM(vaaddu_vv_w)
-GEN_VEXT_VV_RM(vaaddu_vv_d)
+GEN_VEXT_VV_RM(vaaddu_vv_b, 1)
+GEN_VEXT_VV_RM(vaaddu_vv_h, 2)
+GEN_VEXT_VV_RM(vaaddu_vv_w, 4)
+GEN_VEXT_VV_RM(vaaddu_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vaaddu_vx_b, OP_UUU_B, H1, H1, aaddu32)
 RVVCALL(OPIVX2_RM, vaaddu_vx_h, OP_UUU_H, H2, H2, aaddu32)
 RVVCALL(OPIVX2_RM, vaaddu_vx_w, OP_UUU_W, H4, H4, aaddu32)
 RVVCALL(OPIVX2_RM, vaaddu_vx_d, OP_UUU_D, H8, H8, aaddu64)
-GEN_VEXT_VX_RM(vaaddu_vx_b)
-GEN_VEXT_VX_RM(vaaddu_vx_h)
-GEN_VEXT_VX_RM(vaaddu_vx_w)
-GEN_VEXT_VX_RM(vaaddu_vx_d)
+GEN_VEXT_VX_RM(vaaddu_vx_b, 1)
+GEN_VEXT_VX_RM(vaaddu_vx_h, 2)
+GEN_VEXT_VX_RM(vaaddu_vx_w, 4)
+GEN_VEXT_VX_RM(vaaddu_vx_d, 8)
=20
 static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, int32_=
t b)
 {
@@ -2562,19 +2570,19 @@ RVVCALL(OPIVV2_RM, vasub_vv_b, OP_SSS_B, H1, H1, H1, =
asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_h, OP_SSS_H, H2, H2, H2, asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_w, OP_SSS_W, H4, H4, H4, asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_d, OP_SSS_D, H8, H8, H8, asub64)
-GEN_VEXT_VV_RM(vasub_vv_b)
-GEN_VEXT_VV_RM(vasub_vv_h)
-GEN_VEXT_VV_RM(vasub_vv_w)
-GEN_VEXT_VV_RM(vasub_vv_d)
+GEN_VEXT_VV_RM(vasub_vv_b, 1)
+GEN_VEXT_VV_RM(vasub_vv_h, 2)
+GEN_VEXT_VV_RM(vasub_vv_w, 4)
+GEN_VEXT_VV_RM(vasub_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vasub_vx_b, OP_SSS_B, H1, H1, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_h, OP_SSS_H, H2, H2, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_w, OP_SSS_W, H4, H4, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_d, OP_SSS_D, H8, H8, asub64)
-GEN_VEXT_VX_RM(vasub_vx_b)
-GEN_VEXT_VX_RM(vasub_vx_h)
-GEN_VEXT_VX_RM(vasub_vx_w)
-GEN_VEXT_VX_RM(vasub_vx_d)
+GEN_VEXT_VX_RM(vasub_vx_b, 1)
+GEN_VEXT_VX_RM(vasub_vx_h, 2)
+GEN_VEXT_VX_RM(vasub_vx_w, 4)
+GEN_VEXT_VX_RM(vasub_vx_d, 8)
=20
 static inline uint32_t asubu32(CPURISCVState *env, int vxrm,
                                uint32_t a, uint32_t b)
@@ -2599,19 +2607,19 @@ RVVCALL(OPIVV2_RM, vasubu_vv_b, OP_UUU_B, H1, H1, H1,=
 asubu32)
 RVVCALL(OPIVV2_RM, vasubu_vv_h, OP_UUU_H, H2, H2, H2, asubu32)
 RVVCALL(OPIVV2_RM, vasubu_vv_w, OP_UUU_W, H4, H4, H4, asubu32)
 RVVCALL(OPIVV2_RM, vasubu_vv_d, OP_UUU_D, H8, H8, H8, asubu64)
-GEN_VEXT_VV_RM(vasubu_vv_b)
-GEN_VEXT_VV_RM(vasubu_vv_h)
-GEN_VEXT_VV_RM(vasubu_vv_w)
-GEN_VEXT_VV_RM(vasubu_vv_d)
+GEN_VEXT_VV_RM(vasubu_vv_b, 1)
+GEN_VEXT_VV_RM(vasubu_vv_h, 2)
+GEN_VEXT_VV_RM(vasubu_vv_w, 4)
+GEN_VEXT_VV_RM(vasubu_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vasubu_vx_b, OP_UUU_B, H1, H1, asubu32)
 RVVCALL(OPIVX2_RM, vasubu_vx_h, OP_UUU_H, H2, H2, asubu32)
 RVVCALL(OPIVX2_RM, vasubu_vx_w, OP_UUU_W, H4, H4, asubu32)
 RVVCALL(OPIVX2_RM, vasubu_vx_d, OP_UUU_D, H8, H8, asubu64)
-GEN_VEXT_VX_RM(vasubu_vx_b)
-GEN_VEXT_VX_RM(vasubu_vx_h)
-GEN_VEXT_VX_RM(vasubu_vx_w)
-GEN_VEXT_VX_RM(vasubu_vx_d)
+GEN_VEXT_VX_RM(vasubu_vx_b, 1)
+GEN_VEXT_VX_RM(vasubu_vx_h, 2)
+GEN_VEXT_VX_RM(vasubu_vx_w, 4)
+GEN_VEXT_VX_RM(vasubu_vx_d, 8)
=20
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation */
 static inline int8_t vsmul8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
@@ -2706,19 +2714,19 @@ RVVCALL(OPIVV2_RM, vsmul_vv_b, OP_SSS_B, H1, H1, H1, =
vsmul8)
 RVVCALL(OPIVV2_RM, vsmul_vv_h, OP_SSS_H, H2, H2, H2, vsmul16)
 RVVCALL(OPIVV2_RM, vsmul_vv_w, OP_SSS_W, H4, H4, H4, vsmul32)
 RVVCALL(OPIVV2_RM, vsmul_vv_d, OP_SSS_D, H8, H8, H8, vsmul64)
-GEN_VEXT_VV_RM(vsmul_vv_b)
-GEN_VEXT_VV_RM(vsmul_vv_h)
-GEN_VEXT_VV_RM(vsmul_vv_w)
-GEN_VEXT_VV_RM(vsmul_vv_d)
+GEN_VEXT_VV_RM(vsmul_vv_b, 1)
+GEN_VEXT_VV_RM(vsmul_vv_h, 2)
+GEN_VEXT_VV_RM(vsmul_vv_w, 4)
+GEN_VEXT_VV_RM(vsmul_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vsmul_vx_b, OP_SSS_B, H1, H1, vsmul8)
 RVVCALL(OPIVX2_RM, vsmul_vx_h, OP_SSS_H, H2, H2, vsmul16)
 RVVCALL(OPIVX2_RM, vsmul_vx_w, OP_SSS_W, H4, H4, vsmul32)
 RVVCALL(OPIVX2_RM, vsmul_vx_d, OP_SSS_D, H8, H8, vsmul64)
-GEN_VEXT_VX_RM(vsmul_vx_b)
-GEN_VEXT_VX_RM(vsmul_vx_h)
-GEN_VEXT_VX_RM(vsmul_vx_w)
-GEN_VEXT_VX_RM(vsmul_vx_d)
+GEN_VEXT_VX_RM(vsmul_vx_b, 1)
+GEN_VEXT_VX_RM(vsmul_vx_h, 2)
+GEN_VEXT_VX_RM(vsmul_vx_w, 4)
+GEN_VEXT_VX_RM(vsmul_vx_d, 8)
=20
 /* Vector Single-Width Scaling Shift Instructions */
 static inline uint8_t
@@ -2765,19 +2773,19 @@ RVVCALL(OPIVV2_RM, vssrl_vv_b, OP_UUU_B, H1, H1, H1, =
vssrl8)
 RVVCALL(OPIVV2_RM, vssrl_vv_h, OP_UUU_H, H2, H2, H2, vssrl16)
 RVVCALL(OPIVV2_RM, vssrl_vv_w, OP_UUU_W, H4, H4, H4, vssrl32)
 RVVCALL(OPIVV2_RM, vssrl_vv_d, OP_UUU_D, H8, H8, H8, vssrl64)
-GEN_VEXT_VV_RM(vssrl_vv_b)
-GEN_VEXT_VV_RM(vssrl_vv_h)
-GEN_VEXT_VV_RM(vssrl_vv_w)
-GEN_VEXT_VV_RM(vssrl_vv_d)
+GEN_VEXT_VV_RM(vssrl_vv_b, 1)
+GEN_VEXT_VV_RM(vssrl_vv_h, 2)
+GEN_VEXT_VV_RM(vssrl_vv_w, 4)
+GEN_VEXT_VV_RM(vssrl_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vssrl_vx_b, OP_UUU_B, H1, H1, vssrl8)
 RVVCALL(OPIVX2_RM, vssrl_vx_h, OP_UUU_H, H2, H2, vssrl16)
 RVVCALL(OPIVX2_RM, vssrl_vx_w, OP_UUU_W, H4, H4, vssrl32)
 RVVCALL(OPIVX2_RM, vssrl_vx_d, OP_UUU_D, H8, H8, vssrl64)
-GEN_VEXT_VX_RM(vssrl_vx_b)
-GEN_VEXT_VX_RM(vssrl_vx_h)
-GEN_VEXT_VX_RM(vssrl_vx_w)
-GEN_VEXT_VX_RM(vssrl_vx_d)
+GEN_VEXT_VX_RM(vssrl_vx_b, 1)
+GEN_VEXT_VX_RM(vssrl_vx_h, 2)
+GEN_VEXT_VX_RM(vssrl_vx_w, 4)
+GEN_VEXT_VX_RM(vssrl_vx_d, 8)
=20
 static inline int8_t
 vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
@@ -2824,19 +2832,19 @@ RVVCALL(OPIVV2_RM, vssra_vv_b, OP_SSS_B, H1, H1, H1, =
vssra8)
 RVVCALL(OPIVV2_RM, vssra_vv_h, OP_SSS_H, H2, H2, H2, vssra16)
 RVVCALL(OPIVV2_RM, vssra_vv_w, OP_SSS_W, H4, H4, H4, vssra32)
 RVVCALL(OPIVV2_RM, vssra_vv_d, OP_SSS_D, H8, H8, H8, vssra64)
-GEN_VEXT_VV_RM(vssra_vv_b)
-GEN_VEXT_VV_RM(vssra_vv_h)
-GEN_VEXT_VV_RM(vssra_vv_w)
-GEN_VEXT_VV_RM(vssra_vv_d)
+GEN_VEXT_VV_RM(vssra_vv_b, 1)
+GEN_VEXT_VV_RM(vssra_vv_h, 2)
+GEN_VEXT_VV_RM(vssra_vv_w, 4)
+GEN_VEXT_VV_RM(vssra_vv_d, 8)
=20
 RVVCALL(OPIVX2_RM, vssra_vx_b, OP_SSS_B, H1, H1, vssra8)
 RVVCALL(OPIVX2_RM, vssra_vx_h, OP_SSS_H, H2, H2, vssra16)
 RVVCALL(OPIVX2_RM, vssra_vx_w, OP_SSS_W, H4, H4, vssra32)
 RVVCALL(OPIVX2_RM, vssra_vx_d, OP_SSS_D, H8, H8, vssra64)
-GEN_VEXT_VX_RM(vssra_vx_b)
-GEN_VEXT_VX_RM(vssra_vx_h)
-GEN_VEXT_VX_RM(vssra_vx_w)
-GEN_VEXT_VX_RM(vssra_vx_d)
+GEN_VEXT_VX_RM(vssra_vx_b, 1)
+GEN_VEXT_VX_RM(vssra_vx_h, 2)
+GEN_VEXT_VX_RM(vssra_vx_w, 4)
+GEN_VEXT_VX_RM(vssra_vx_d, 8)
=20
 /* Vector Narrowing Fixed-Point Clip Instructions */
 static inline int8_t
@@ -2899,16 +2907,16 @@ vnclip32(CPURISCVState *env, int vxrm, int64_t a, int=
32_t b)
 RVVCALL(OPIVV2_RM, vnclip_wv_b, NOP_SSS_B, H1, H2, H1, vnclip8)
 RVVCALL(OPIVV2_RM, vnclip_wv_h, NOP_SSS_H, H2, H4, H2, vnclip16)
 RVVCALL(OPIVV2_RM, vnclip_wv_w, NOP_SSS_W, H4, H8, H4, vnclip32)
-GEN_VEXT_VV_RM(vnclip_wv_b)
-GEN_VEXT_VV_RM(vnclip_wv_h)
-GEN_VEXT_VV_RM(vnclip_wv_w)
+GEN_VEXT_VV_RM(vnclip_wv_b, 1)
+GEN_VEXT_VV_RM(vnclip_wv_h, 2)
+GEN_VEXT_VV_RM(vnclip_wv_w, 4)
=20
 RVVCALL(OPIVX2_RM, vnclip_wx_b, NOP_SSS_B, H1, H2, vnclip8)
 RVVCALL(OPIVX2_RM, vnclip_wx_h, NOP_SSS_H, H2, H4, vnclip16)
 RVVCALL(OPIVX2_RM, vnclip_wx_w, NOP_SSS_W, H4, H8, vnclip32)
-GEN_VEXT_VX_RM(vnclip_wx_b)
-GEN_VEXT_VX_RM(vnclip_wx_h)
-GEN_VEXT_VX_RM(vnclip_wx_w)
+GEN_VEXT_VX_RM(vnclip_wx_b, 1)
+GEN_VEXT_VX_RM(vnclip_wx_h, 2)
+GEN_VEXT_VX_RM(vnclip_wx_w, 4)
=20
 static inline uint8_t
 vnclipu8(CPURISCVState *env, int vxrm, uint16_t a, uint8_t b)
@@ -2961,16 +2969,16 @@ vnclipu32(CPURISCVState *env, int vxrm, uint64_t a, u=
int32_t b)
 RVVCALL(OPIVV2_RM, vnclipu_wv_b, NOP_UUU_B, H1, H2, H1, vnclipu8)
 RVVCALL(OPIVV2_RM, vnclipu_wv_h, NOP_UUU_H, H2, H4, H2, vnclipu16)
 RVVCALL(OPIVV2_RM, vnclipu_wv_w, NOP_UUU_W, H4, H8, H4, vnclipu32)
-GEN_VEXT_VV_RM(vnclipu_wv_b)
-GEN_VEXT_VV_RM(vnclipu_wv_h)
-GEN_VEXT_VV_RM(vnclipu_wv_w)
+GEN_VEXT_VV_RM(vnclipu_wv_b, 1)
+GEN_VEXT_VV_RM(vnclipu_wv_h, 2)
+GEN_VEXT_VV_RM(vnclipu_wv_w, 4)
=20
 RVVCALL(OPIVX2_RM, vnclipu_wx_b, NOP_UUU_B, H1, H2, vnclipu8)
 RVVCALL(OPIVX2_RM, vnclipu_wx_h, NOP_UUU_H, H2, H4, vnclipu16)
 RVVCALL(OPIVX2_RM, vnclipu_wx_w, NOP_UUU_W, H4, H8, vnclipu32)
-GEN_VEXT_VX_RM(vnclipu_wx_b)
-GEN_VEXT_VX_RM(vnclipu_wx_h)
-GEN_VEXT_VX_RM(vnclipu_wx_w)
+GEN_VEXT_VX_RM(vnclipu_wx_b, 1)
+GEN_VEXT_VX_RM(vnclipu_wx_h, 2)
+GEN_VEXT_VX_RM(vnclipu_wx_w, 4)
=20
 /*
  *** Vector Float Point Arithmetic Instructions
--=20
2.34.2


