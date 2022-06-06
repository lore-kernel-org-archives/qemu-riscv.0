Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny63t-00024U-RQ
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny620-0001Yd-6P; Mon, 06 Jun 2022 02:16:14 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:47998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny61n-0000h3-Ld; Mon, 06 Jun 2022 02:15:55 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id AC3D711EF1B;
 Mon,  6 Jun 2022 06:15:45 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v19 01/16] target/riscv: rvv: Prune redundant ESZ, DSZ
 parameter passed
Message-ID: <165449614532.19704.7000832880482980398-1@git.sr.ht>
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
Date: Mon, 06 Jun 2022 06:16:17 -0000
X-Original-Date: Mon, 14 Mar 2022 00:38:00 -0700
X-List-Received-Date: Mon, 06 Jun 2022 06:16:17 -0000

From: eopXD <yueh.ting.chen@gmail.com>

No functional change intended in this commit.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 1132 +++++++++++++++++-----------------
 1 file changed, 565 insertions(+), 567 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 576b14e5a3..85dd611cd9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -710,7 +710,6 @@ RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D, H8, H8, H8, DO_SUB)
=20
 static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
                        CPURISCVState *env, uint32_t desc,
-                       uint32_t esz, uint32_t dsz,
                        opivv2_fn *fn)
 {
     uint32_t vm =3D vext_vm(desc);
@@ -727,23 +726,23 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, v=
oid *vs2,
 }
=20
 /* generate the helpers for OPIVV */
-#define GEN_VEXT_VV(NAME, ESZ, DSZ)                       \
+#define GEN_VEXT_VV(NAME)                                 \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    do_vext_vv(vd, v0, vs1, vs2, env, desc, ESZ, DSZ,     \
+    do_vext_vv(vd, v0, vs1, vs2, env, desc,               \
                do_##NAME);                                \
 }
=20
-GEN_VEXT_VV(vadd_vv_b, 1, 1)
-GEN_VEXT_VV(vadd_vv_h, 2, 2)
-GEN_VEXT_VV(vadd_vv_w, 4, 4)
-GEN_VEXT_VV(vadd_vv_d, 8, 8)
-GEN_VEXT_VV(vsub_vv_b, 1, 1)
-GEN_VEXT_VV(vsub_vv_h, 2, 2)
-GEN_VEXT_VV(vsub_vv_w, 4, 4)
-GEN_VEXT_VV(vsub_vv_d, 8, 8)
+GEN_VEXT_VV(vadd_vv_b)
+GEN_VEXT_VV(vadd_vv_h)
+GEN_VEXT_VV(vadd_vv_w)
+GEN_VEXT_VV(vadd_vv_d)
+GEN_VEXT_VV(vsub_vv_b)
+GEN_VEXT_VV(vsub_vv_h)
+GEN_VEXT_VV(vsub_vv_w)
+GEN_VEXT_VV(vsub_vv_d)
=20
 typedef void opivx2_fn(void *vd, target_long s1, void *vs2, int i);
=20
@@ -773,7 +772,6 @@ RVVCALL(OPIVX2, vrsub_vx_d, OP_SSS_D, H8, H8, DO_RSUB)
=20
 static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
                        CPURISCVState *env, uint32_t desc,
-                       uint32_t esz, uint32_t dsz,
                        opivx2_fn fn)
 {
     uint32_t vm =3D vext_vm(desc);
@@ -790,27 +788,27 @@ static void do_vext_vx(void *vd, void *v0, target_long =
s1, void *vs2,
 }
=20
 /* generate the helpers for OPIVX */
-#define GEN_VEXT_VX(NAME, ESZ, DSZ)                       \
+#define GEN_VEXT_VX(NAME)                                 \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    do_vext_vx(vd, v0, s1, vs2, env, desc, ESZ, DSZ,      \
+    do_vext_vx(vd, v0, s1, vs2, env, desc,                \
                do_##NAME);                                \
 }
=20
-GEN_VEXT_VX(vadd_vx_b, 1, 1)
-GEN_VEXT_VX(vadd_vx_h, 2, 2)
-GEN_VEXT_VX(vadd_vx_w, 4, 4)
-GEN_VEXT_VX(vadd_vx_d, 8, 8)
-GEN_VEXT_VX(vsub_vx_b, 1, 1)
-GEN_VEXT_VX(vsub_vx_h, 2, 2)
-GEN_VEXT_VX(vsub_vx_w, 4, 4)
-GEN_VEXT_VX(vsub_vx_d, 8, 8)
-GEN_VEXT_VX(vrsub_vx_b, 1, 1)
-GEN_VEXT_VX(vrsub_vx_h, 2, 2)
-GEN_VEXT_VX(vrsub_vx_w, 4, 4)
-GEN_VEXT_VX(vrsub_vx_d, 8, 8)
+GEN_VEXT_VX(vadd_vx_b)
+GEN_VEXT_VX(vadd_vx_h)
+GEN_VEXT_VX(vadd_vx_w)
+GEN_VEXT_VX(vadd_vx_d)
+GEN_VEXT_VX(vsub_vx_b)
+GEN_VEXT_VX(vsub_vx_h)
+GEN_VEXT_VX(vsub_vx_w)
+GEN_VEXT_VX(vsub_vx_d)
+GEN_VEXT_VX(vrsub_vx_b)
+GEN_VEXT_VX(vrsub_vx_h)
+GEN_VEXT_VX(vrsub_vx_w)
+GEN_VEXT_VX(vrsub_vx_d)
=20
 void HELPER(vec_rsubs8)(void *d, void *a, uint64_t b, uint32_t desc)
 {
@@ -889,30 +887,30 @@ RVVCALL(OPIVV2, vwadd_wv_w, WOP_WSSS_W, H8, H4, H4, DO_=
ADD)
 RVVCALL(OPIVV2, vwsub_wv_b, WOP_WSSS_B, H2, H1, H1, DO_SUB)
 RVVCALL(OPIVV2, vwsub_wv_h, WOP_WSSS_H, H4, H2, H2, DO_SUB)
 RVVCALL(OPIVV2, vwsub_wv_w, WOP_WSSS_W, H8, H4, H4, DO_SUB)
-GEN_VEXT_VV(vwaddu_vv_b, 1, 2)
-GEN_VEXT_VV(vwaddu_vv_h, 2, 4)
-GEN_VEXT_VV(vwaddu_vv_w, 4, 8)
-GEN_VEXT_VV(vwsubu_vv_b, 1, 2)
-GEN_VEXT_VV(vwsubu_vv_h, 2, 4)
-GEN_VEXT_VV(vwsubu_vv_w, 4, 8)
-GEN_VEXT_VV(vwadd_vv_b, 1, 2)
-GEN_VEXT_VV(vwadd_vv_h, 2, 4)
-GEN_VEXT_VV(vwadd_vv_w, 4, 8)
-GEN_VEXT_VV(vwsub_vv_b, 1, 2)
-GEN_VEXT_VV(vwsub_vv_h, 2, 4)
-GEN_VEXT_VV(vwsub_vv_w, 4, 8)
-GEN_VEXT_VV(vwaddu_wv_b, 1, 2)
-GEN_VEXT_VV(vwaddu_wv_h, 2, 4)
-GEN_VEXT_VV(vwaddu_wv_w, 4, 8)
-GEN_VEXT_VV(vwsubu_wv_b, 1, 2)
-GEN_VEXT_VV(vwsubu_wv_h, 2, 4)
-GEN_VEXT_VV(vwsubu_wv_w, 4, 8)
-GEN_VEXT_VV(vwadd_wv_b, 1, 2)
-GEN_VEXT_VV(vwadd_wv_h, 2, 4)
-GEN_VEXT_VV(vwadd_wv_w, 4, 8)
-GEN_VEXT_VV(vwsub_wv_b, 1, 2)
-GEN_VEXT_VV(vwsub_wv_h, 2, 4)
-GEN_VEXT_VV(vwsub_wv_w, 4, 8)
+GEN_VEXT_VV(vwaddu_vv_b)
+GEN_VEXT_VV(vwaddu_vv_h)
+GEN_VEXT_VV(vwaddu_vv_w)
+GEN_VEXT_VV(vwsubu_vv_b)
+GEN_VEXT_VV(vwsubu_vv_h)
+GEN_VEXT_VV(vwsubu_vv_w)
+GEN_VEXT_VV(vwadd_vv_b)
+GEN_VEXT_VV(vwadd_vv_h)
+GEN_VEXT_VV(vwadd_vv_w)
+GEN_VEXT_VV(vwsub_vv_b)
+GEN_VEXT_VV(vwsub_vv_h)
+GEN_VEXT_VV(vwsub_vv_w)
+GEN_VEXT_VV(vwaddu_wv_b)
+GEN_VEXT_VV(vwaddu_wv_h)
+GEN_VEXT_VV(vwaddu_wv_w)
+GEN_VEXT_VV(vwsubu_wv_b)
+GEN_VEXT_VV(vwsubu_wv_h)
+GEN_VEXT_VV(vwsubu_wv_w)
+GEN_VEXT_VV(vwadd_wv_b)
+GEN_VEXT_VV(vwadd_wv_h)
+GEN_VEXT_VV(vwadd_wv_w)
+GEN_VEXT_VV(vwsub_wv_b)
+GEN_VEXT_VV(vwsub_wv_h)
+GEN_VEXT_VV(vwsub_wv_w)
=20
 RVVCALL(OPIVX2, vwaddu_vx_b, WOP_UUU_B, H2, H1, DO_ADD)
 RVVCALL(OPIVX2, vwaddu_vx_h, WOP_UUU_H, H4, H2, DO_ADD)
@@ -938,30 +936,30 @@ RVVCALL(OPIVX2, vwadd_wx_w, WOP_WSSS_W, H8, H4, DO_ADD)
 RVVCALL(OPIVX2, vwsub_wx_b, WOP_WSSS_B, H2, H1, DO_SUB)
 RVVCALL(OPIVX2, vwsub_wx_h, WOP_WSSS_H, H4, H2, DO_SUB)
 RVVCALL(OPIVX2, vwsub_wx_w, WOP_WSSS_W, H8, H4, DO_SUB)
-GEN_VEXT_VX(vwaddu_vx_b, 1, 2)
-GEN_VEXT_VX(vwaddu_vx_h, 2, 4)
-GEN_VEXT_VX(vwaddu_vx_w, 4, 8)
-GEN_VEXT_VX(vwsubu_vx_b, 1, 2)
-GEN_VEXT_VX(vwsubu_vx_h, 2, 4)
-GEN_VEXT_VX(vwsubu_vx_w, 4, 8)
-GEN_VEXT_VX(vwadd_vx_b, 1, 2)
-GEN_VEXT_VX(vwadd_vx_h, 2, 4)
-GEN_VEXT_VX(vwadd_vx_w, 4, 8)
-GEN_VEXT_VX(vwsub_vx_b, 1, 2)
-GEN_VEXT_VX(vwsub_vx_h, 2, 4)
-GEN_VEXT_VX(vwsub_vx_w, 4, 8)
-GEN_VEXT_VX(vwaddu_wx_b, 1, 2)
-GEN_VEXT_VX(vwaddu_wx_h, 2, 4)
-GEN_VEXT_VX(vwaddu_wx_w, 4, 8)
-GEN_VEXT_VX(vwsubu_wx_b, 1, 2)
-GEN_VEXT_VX(vwsubu_wx_h, 2, 4)
-GEN_VEXT_VX(vwsubu_wx_w, 4, 8)
-GEN_VEXT_VX(vwadd_wx_b, 1, 2)
-GEN_VEXT_VX(vwadd_wx_h, 2, 4)
-GEN_VEXT_VX(vwadd_wx_w, 4, 8)
-GEN_VEXT_VX(vwsub_wx_b, 1, 2)
-GEN_VEXT_VX(vwsub_wx_h, 2, 4)
-GEN_VEXT_VX(vwsub_wx_w, 4, 8)
+GEN_VEXT_VX(vwaddu_vx_b)
+GEN_VEXT_VX(vwaddu_vx_h)
+GEN_VEXT_VX(vwaddu_vx_w)
+GEN_VEXT_VX(vwsubu_vx_b)
+GEN_VEXT_VX(vwsubu_vx_h)
+GEN_VEXT_VX(vwsubu_vx_w)
+GEN_VEXT_VX(vwadd_vx_b)
+GEN_VEXT_VX(vwadd_vx_h)
+GEN_VEXT_VX(vwadd_vx_w)
+GEN_VEXT_VX(vwsub_vx_b)
+GEN_VEXT_VX(vwsub_vx_h)
+GEN_VEXT_VX(vwsub_vx_w)
+GEN_VEXT_VX(vwaddu_wx_b)
+GEN_VEXT_VX(vwaddu_wx_h)
+GEN_VEXT_VX(vwaddu_wx_w)
+GEN_VEXT_VX(vwsubu_wx_b)
+GEN_VEXT_VX(vwsubu_wx_h)
+GEN_VEXT_VX(vwsubu_wx_w)
+GEN_VEXT_VX(vwadd_wx_b)
+GEN_VEXT_VX(vwadd_wx_h)
+GEN_VEXT_VX(vwadd_wx_w)
+GEN_VEXT_VX(vwsub_wx_b)
+GEN_VEXT_VX(vwsub_wx_h)
+GEN_VEXT_VX(vwsub_wx_w)
=20
 /* Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions */
 #define DO_VADC(N, M, C) (N + M + C)
@@ -1091,18 +1089,18 @@ RVVCALL(OPIVV2, vxor_vv_b, OP_SSS_B, H1, H1, H1, DO_X=
OR)
 RVVCALL(OPIVV2, vxor_vv_h, OP_SSS_H, H2, H2, H2, DO_XOR)
 RVVCALL(OPIVV2, vxor_vv_w, OP_SSS_W, H4, H4, H4, DO_XOR)
 RVVCALL(OPIVV2, vxor_vv_d, OP_SSS_D, H8, H8, H8, DO_XOR)
-GEN_VEXT_VV(vand_vv_b, 1, 1)
-GEN_VEXT_VV(vand_vv_h, 2, 2)
-GEN_VEXT_VV(vand_vv_w, 4, 4)
-GEN_VEXT_VV(vand_vv_d, 8, 8)
-GEN_VEXT_VV(vor_vv_b, 1, 1)
-GEN_VEXT_VV(vor_vv_h, 2, 2)
-GEN_VEXT_VV(vor_vv_w, 4, 4)
-GEN_VEXT_VV(vor_vv_d, 8, 8)
-GEN_VEXT_VV(vxor_vv_b, 1, 1)
-GEN_VEXT_VV(vxor_vv_h, 2, 2)
-GEN_VEXT_VV(vxor_vv_w, 4, 4)
-GEN_VEXT_VV(vxor_vv_d, 8, 8)
+GEN_VEXT_VV(vand_vv_b)
+GEN_VEXT_VV(vand_vv_h)
+GEN_VEXT_VV(vand_vv_w)
+GEN_VEXT_VV(vand_vv_d)
+GEN_VEXT_VV(vor_vv_b)
+GEN_VEXT_VV(vor_vv_h)
+GEN_VEXT_VV(vor_vv_w)
+GEN_VEXT_VV(vor_vv_d)
+GEN_VEXT_VV(vxor_vv_b)
+GEN_VEXT_VV(vxor_vv_h)
+GEN_VEXT_VV(vxor_vv_w)
+GEN_VEXT_VV(vxor_vv_d)
=20
 RVVCALL(OPIVX2, vand_vx_b, OP_SSS_B, H1, H1, DO_AND)
 RVVCALL(OPIVX2, vand_vx_h, OP_SSS_H, H2, H2, DO_AND)
@@ -1116,18 +1114,18 @@ RVVCALL(OPIVX2, vxor_vx_b, OP_SSS_B, H1, H1, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_h, OP_SSS_H, H2, H2, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_w, OP_SSS_W, H4, H4, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_d, OP_SSS_D, H8, H8, DO_XOR)
-GEN_VEXT_VX(vand_vx_b, 1, 1)
-GEN_VEXT_VX(vand_vx_h, 2, 2)
-GEN_VEXT_VX(vand_vx_w, 4, 4)
-GEN_VEXT_VX(vand_vx_d, 8, 8)
-GEN_VEXT_VX(vor_vx_b, 1, 1)
-GEN_VEXT_VX(vor_vx_h, 2, 2)
-GEN_VEXT_VX(vor_vx_w, 4, 4)
-GEN_VEXT_VX(vor_vx_d, 8, 8)
-GEN_VEXT_VX(vxor_vx_b, 1, 1)
-GEN_VEXT_VX(vxor_vx_h, 2, 2)
-GEN_VEXT_VX(vxor_vx_w, 4, 4)
-GEN_VEXT_VX(vxor_vx_d, 8, 8)
+GEN_VEXT_VX(vand_vx_b)
+GEN_VEXT_VX(vand_vx_h)
+GEN_VEXT_VX(vand_vx_w)
+GEN_VEXT_VX(vand_vx_d)
+GEN_VEXT_VX(vor_vx_b)
+GEN_VEXT_VX(vor_vx_h)
+GEN_VEXT_VX(vor_vx_w)
+GEN_VEXT_VX(vor_vx_d)
+GEN_VEXT_VX(vxor_vx_b)
+GEN_VEXT_VX(vxor_vx_h)
+GEN_VEXT_VX(vxor_vx_w)
+GEN_VEXT_VX(vxor_vx_d)
=20
 /* Vector Single-Width Bit Shift Instructions */
 #define DO_SLL(N, M)  (N << (M))
@@ -1348,22 +1346,22 @@ RVVCALL(OPIVV2, vmax_vv_b, OP_SSS_B, H1, H1, H1, DO_M=
AX)
 RVVCALL(OPIVV2, vmax_vv_h, OP_SSS_H, H2, H2, H2, DO_MAX)
 RVVCALL(OPIVV2, vmax_vv_w, OP_SSS_W, H4, H4, H4, DO_MAX)
 RVVCALL(OPIVV2, vmax_vv_d, OP_SSS_D, H8, H8, H8, DO_MAX)
-GEN_VEXT_VV(vminu_vv_b, 1, 1)
-GEN_VEXT_VV(vminu_vv_h, 2, 2)
-GEN_VEXT_VV(vminu_vv_w, 4, 4)
-GEN_VEXT_VV(vminu_vv_d, 8, 8)
-GEN_VEXT_VV(vmin_vv_b, 1, 1)
-GEN_VEXT_VV(vmin_vv_h, 2, 2)
-GEN_VEXT_VV(vmin_vv_w, 4, 4)
-GEN_VEXT_VV(vmin_vv_d, 8, 8)
-GEN_VEXT_VV(vmaxu_vv_b, 1, 1)
-GEN_VEXT_VV(vmaxu_vv_h, 2, 2)
-GEN_VEXT_VV(vmaxu_vv_w, 4, 4)
-GEN_VEXT_VV(vmaxu_vv_d, 8, 8)
-GEN_VEXT_VV(vmax_vv_b, 1, 1)
-GEN_VEXT_VV(vmax_vv_h, 2, 2)
-GEN_VEXT_VV(vmax_vv_w, 4, 4)
-GEN_VEXT_VV(vmax_vv_d, 8, 8)
+GEN_VEXT_VV(vminu_vv_b)
+GEN_VEXT_VV(vminu_vv_h)
+GEN_VEXT_VV(vminu_vv_w)
+GEN_VEXT_VV(vminu_vv_d)
+GEN_VEXT_VV(vmin_vv_b)
+GEN_VEXT_VV(vmin_vv_h)
+GEN_VEXT_VV(vmin_vv_w)
+GEN_VEXT_VV(vmin_vv_d)
+GEN_VEXT_VV(vmaxu_vv_b)
+GEN_VEXT_VV(vmaxu_vv_h)
+GEN_VEXT_VV(vmaxu_vv_w)
+GEN_VEXT_VV(vmaxu_vv_d)
+GEN_VEXT_VV(vmax_vv_b)
+GEN_VEXT_VV(vmax_vv_h)
+GEN_VEXT_VV(vmax_vv_w)
+GEN_VEXT_VV(vmax_vv_d)
=20
 RVVCALL(OPIVX2, vminu_vx_b, OP_UUU_B, H1, H1, DO_MIN)
 RVVCALL(OPIVX2, vminu_vx_h, OP_UUU_H, H2, H2, DO_MIN)
@@ -1381,22 +1379,22 @@ RVVCALL(OPIVX2, vmax_vx_b, OP_SSS_B, H1, H1, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_h, OP_SSS_H, H2, H2, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_w, OP_SSS_W, H4, H4, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_d, OP_SSS_D, H8, H8, DO_MAX)
-GEN_VEXT_VX(vminu_vx_b, 1, 1)
-GEN_VEXT_VX(vminu_vx_h, 2, 2)
-GEN_VEXT_VX(vminu_vx_w, 4, 4)
-GEN_VEXT_VX(vminu_vx_d, 8, 8)
-GEN_VEXT_VX(vmin_vx_b, 1, 1)
-GEN_VEXT_VX(vmin_vx_h, 2, 2)
-GEN_VEXT_VX(vmin_vx_w, 4, 4)
-GEN_VEXT_VX(vmin_vx_d, 8, 8)
-GEN_VEXT_VX(vmaxu_vx_b, 1, 1)
-GEN_VEXT_VX(vmaxu_vx_h, 2, 2)
-GEN_VEXT_VX(vmaxu_vx_w, 4, 4)
-GEN_VEXT_VX(vmaxu_vx_d, 8, 8)
-GEN_VEXT_VX(vmax_vx_b, 1, 1)
-GEN_VEXT_VX(vmax_vx_h, 2, 2)
-GEN_VEXT_VX(vmax_vx_w, 4, 4)
-GEN_VEXT_VX(vmax_vx_d, 8, 8)
+GEN_VEXT_VX(vminu_vx_b)
+GEN_VEXT_VX(vminu_vx_h)
+GEN_VEXT_VX(vminu_vx_w)
+GEN_VEXT_VX(vminu_vx_d)
+GEN_VEXT_VX(vmin_vx_b)
+GEN_VEXT_VX(vmin_vx_h)
+GEN_VEXT_VX(vmin_vx_w)
+GEN_VEXT_VX(vmin_vx_d)
+GEN_VEXT_VX(vmaxu_vx_b)
+GEN_VEXT_VX(vmaxu_vx_h)
+GEN_VEXT_VX(vmaxu_vx_w)
+GEN_VEXT_VX(vmaxu_vx_d)
+GEN_VEXT_VX(vmax_vx_b)
+GEN_VEXT_VX(vmax_vx_h)
+GEN_VEXT_VX(vmax_vx_w)
+GEN_VEXT_VX(vmax_vx_d)
=20
 /* Vector Single-Width Integer Multiply Instructions */
 #define DO_MUL(N, M) (N * M)
@@ -1404,10 +1402,10 @@ RVVCALL(OPIVV2, vmul_vv_b, OP_SSS_B, H1, H1, H1, DO_M=
UL)
 RVVCALL(OPIVV2, vmul_vv_h, OP_SSS_H, H2, H2, H2, DO_MUL)
 RVVCALL(OPIVV2, vmul_vv_w, OP_SSS_W, H4, H4, H4, DO_MUL)
 RVVCALL(OPIVV2, vmul_vv_d, OP_SSS_D, H8, H8, H8, DO_MUL)
-GEN_VEXT_VV(vmul_vv_b, 1, 1)
-GEN_VEXT_VV(vmul_vv_h, 2, 2)
-GEN_VEXT_VV(vmul_vv_w, 4, 4)
-GEN_VEXT_VV(vmul_vv_d, 8, 8)
+GEN_VEXT_VV(vmul_vv_b)
+GEN_VEXT_VV(vmul_vv_h)
+GEN_VEXT_VV(vmul_vv_w)
+GEN_VEXT_VV(vmul_vv_d)
=20
 static int8_t do_mulh_b(int8_t s2, int8_t s1)
 {
@@ -1511,18 +1509,18 @@ RVVCALL(OPIVV2, vmulhsu_vv_b, OP_SUS_B, H1, H1, H1, d=
o_mulhsu_b)
 RVVCALL(OPIVV2, vmulhsu_vv_h, OP_SUS_H, H2, H2, H2, do_mulhsu_h)
 RVVCALL(OPIVV2, vmulhsu_vv_w, OP_SUS_W, H4, H4, H4, do_mulhsu_w)
 RVVCALL(OPIVV2, vmulhsu_vv_d, OP_SUS_D, H8, H8, H8, do_mulhsu_d)
-GEN_VEXT_VV(vmulh_vv_b, 1, 1)
-GEN_VEXT_VV(vmulh_vv_h, 2, 2)
-GEN_VEXT_VV(vmulh_vv_w, 4, 4)
-GEN_VEXT_VV(vmulh_vv_d, 8, 8)
-GEN_VEXT_VV(vmulhu_vv_b, 1, 1)
-GEN_VEXT_VV(vmulhu_vv_h, 2, 2)
-GEN_VEXT_VV(vmulhu_vv_w, 4, 4)
-GEN_VEXT_VV(vmulhu_vv_d, 8, 8)
-GEN_VEXT_VV(vmulhsu_vv_b, 1, 1)
-GEN_VEXT_VV(vmulhsu_vv_h, 2, 2)
-GEN_VEXT_VV(vmulhsu_vv_w, 4, 4)
-GEN_VEXT_VV(vmulhsu_vv_d, 8, 8)
+GEN_VEXT_VV(vmulh_vv_b)
+GEN_VEXT_VV(vmulh_vv_h)
+GEN_VEXT_VV(vmulh_vv_w)
+GEN_VEXT_VV(vmulh_vv_d)
+GEN_VEXT_VV(vmulhu_vv_b)
+GEN_VEXT_VV(vmulhu_vv_h)
+GEN_VEXT_VV(vmulhu_vv_w)
+GEN_VEXT_VV(vmulhu_vv_d)
+GEN_VEXT_VV(vmulhsu_vv_b)
+GEN_VEXT_VV(vmulhsu_vv_h)
+GEN_VEXT_VV(vmulhsu_vv_w)
+GEN_VEXT_VV(vmulhsu_vv_d)
=20
 RVVCALL(OPIVX2, vmul_vx_b, OP_SSS_B, H1, H1, DO_MUL)
 RVVCALL(OPIVX2, vmul_vx_h, OP_SSS_H, H2, H2, DO_MUL)
@@ -1540,22 +1538,22 @@ RVVCALL(OPIVX2, vmulhsu_vx_b, OP_SUS_B, H1, H1, do_mu=
lhsu_b)
 RVVCALL(OPIVX2, vmulhsu_vx_h, OP_SUS_H, H2, H2, do_mulhsu_h)
 RVVCALL(OPIVX2, vmulhsu_vx_w, OP_SUS_W, H4, H4, do_mulhsu_w)
 RVVCALL(OPIVX2, vmulhsu_vx_d, OP_SUS_D, H8, H8, do_mulhsu_d)
-GEN_VEXT_VX(vmul_vx_b, 1, 1)
-GEN_VEXT_VX(vmul_vx_h, 2, 2)
-GEN_VEXT_VX(vmul_vx_w, 4, 4)
-GEN_VEXT_VX(vmul_vx_d, 8, 8)
-GEN_VEXT_VX(vmulh_vx_b, 1, 1)
-GEN_VEXT_VX(vmulh_vx_h, 2, 2)
-GEN_VEXT_VX(vmulh_vx_w, 4, 4)
-GEN_VEXT_VX(vmulh_vx_d, 8, 8)
-GEN_VEXT_VX(vmulhu_vx_b, 1, 1)
-GEN_VEXT_VX(vmulhu_vx_h, 2, 2)
-GEN_VEXT_VX(vmulhu_vx_w, 4, 4)
-GEN_VEXT_VX(vmulhu_vx_d, 8, 8)
-GEN_VEXT_VX(vmulhsu_vx_b, 1, 1)
-GEN_VEXT_VX(vmulhsu_vx_h, 2, 2)
-GEN_VEXT_VX(vmulhsu_vx_w, 4, 4)
-GEN_VEXT_VX(vmulhsu_vx_d, 8, 8)
+GEN_VEXT_VX(vmul_vx_b)
+GEN_VEXT_VX(vmul_vx_h)
+GEN_VEXT_VX(vmul_vx_w)
+GEN_VEXT_VX(vmul_vx_d)
+GEN_VEXT_VX(vmulh_vx_b)
+GEN_VEXT_VX(vmulh_vx_h)
+GEN_VEXT_VX(vmulh_vx_w)
+GEN_VEXT_VX(vmulh_vx_d)
+GEN_VEXT_VX(vmulhu_vx_b)
+GEN_VEXT_VX(vmulhu_vx_h)
+GEN_VEXT_VX(vmulhu_vx_w)
+GEN_VEXT_VX(vmulhu_vx_d)
+GEN_VEXT_VX(vmulhsu_vx_b)
+GEN_VEXT_VX(vmulhsu_vx_h)
+GEN_VEXT_VX(vmulhsu_vx_w)
+GEN_VEXT_VX(vmulhsu_vx_d)
=20
 /* Vector Integer Divide Instructions */
 #define DO_DIVU(N, M) (unlikely(M =3D=3D 0) ? (__typeof(N))(-1) : N / M)
@@ -1581,22 +1579,22 @@ RVVCALL(OPIVV2, vrem_vv_b, OP_SSS_B, H1, H1, H1, DO_R=
EM)
 RVVCALL(OPIVV2, vrem_vv_h, OP_SSS_H, H2, H2, H2, DO_REM)
 RVVCALL(OPIVV2, vrem_vv_w, OP_SSS_W, H4, H4, H4, DO_REM)
 RVVCALL(OPIVV2, vrem_vv_d, OP_SSS_D, H8, H8, H8, DO_REM)
-GEN_VEXT_VV(vdivu_vv_b, 1, 1)
-GEN_VEXT_VV(vdivu_vv_h, 2, 2)
-GEN_VEXT_VV(vdivu_vv_w, 4, 4)
-GEN_VEXT_VV(vdivu_vv_d, 8, 8)
-GEN_VEXT_VV(vdiv_vv_b, 1, 1)
-GEN_VEXT_VV(vdiv_vv_h, 2, 2)
-GEN_VEXT_VV(vdiv_vv_w, 4, 4)
-GEN_VEXT_VV(vdiv_vv_d, 8, 8)
-GEN_VEXT_VV(vremu_vv_b, 1, 1)
-GEN_VEXT_VV(vremu_vv_h, 2, 2)
-GEN_VEXT_VV(vremu_vv_w, 4, 4)
-GEN_VEXT_VV(vremu_vv_d, 8, 8)
-GEN_VEXT_VV(vrem_vv_b, 1, 1)
-GEN_VEXT_VV(vrem_vv_h, 2, 2)
-GEN_VEXT_VV(vrem_vv_w, 4, 4)
-GEN_VEXT_VV(vrem_vv_d, 8, 8)
+GEN_VEXT_VV(vdivu_vv_b)
+GEN_VEXT_VV(vdivu_vv_h)
+GEN_VEXT_VV(vdivu_vv_w)
+GEN_VEXT_VV(vdivu_vv_d)
+GEN_VEXT_VV(vdiv_vv_b)
+GEN_VEXT_VV(vdiv_vv_h)
+GEN_VEXT_VV(vdiv_vv_w)
+GEN_VEXT_VV(vdiv_vv_d)
+GEN_VEXT_VV(vremu_vv_b)
+GEN_VEXT_VV(vremu_vv_h)
+GEN_VEXT_VV(vremu_vv_w)
+GEN_VEXT_VV(vremu_vv_d)
+GEN_VEXT_VV(vrem_vv_b)
+GEN_VEXT_VV(vrem_vv_h)
+GEN_VEXT_VV(vrem_vv_w)
+GEN_VEXT_VV(vrem_vv_d)
=20
 RVVCALL(OPIVX2, vdivu_vx_b, OP_UUU_B, H1, H1, DO_DIVU)
 RVVCALL(OPIVX2, vdivu_vx_h, OP_UUU_H, H2, H2, DO_DIVU)
@@ -1614,22 +1612,22 @@ RVVCALL(OPIVX2, vrem_vx_b, OP_SSS_B, H1, H1, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_h, OP_SSS_H, H2, H2, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_w, OP_SSS_W, H4, H4, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_d, OP_SSS_D, H8, H8, DO_REM)
-GEN_VEXT_VX(vdivu_vx_b, 1, 1)
-GEN_VEXT_VX(vdivu_vx_h, 2, 2)
-GEN_VEXT_VX(vdivu_vx_w, 4, 4)
-GEN_VEXT_VX(vdivu_vx_d, 8, 8)
-GEN_VEXT_VX(vdiv_vx_b, 1, 1)
-GEN_VEXT_VX(vdiv_vx_h, 2, 2)
-GEN_VEXT_VX(vdiv_vx_w, 4, 4)
-GEN_VEXT_VX(vdiv_vx_d, 8, 8)
-GEN_VEXT_VX(vremu_vx_b, 1, 1)
-GEN_VEXT_VX(vremu_vx_h, 2, 2)
-GEN_VEXT_VX(vremu_vx_w, 4, 4)
-GEN_VEXT_VX(vremu_vx_d, 8, 8)
-GEN_VEXT_VX(vrem_vx_b, 1, 1)
-GEN_VEXT_VX(vrem_vx_h, 2, 2)
-GEN_VEXT_VX(vrem_vx_w, 4, 4)
-GEN_VEXT_VX(vrem_vx_d, 8, 8)
+GEN_VEXT_VX(vdivu_vx_b)
+GEN_VEXT_VX(vdivu_vx_h)
+GEN_VEXT_VX(vdivu_vx_w)
+GEN_VEXT_VX(vdivu_vx_d)
+GEN_VEXT_VX(vdiv_vx_b)
+GEN_VEXT_VX(vdiv_vx_h)
+GEN_VEXT_VX(vdiv_vx_w)
+GEN_VEXT_VX(vdiv_vx_d)
+GEN_VEXT_VX(vremu_vx_b)
+GEN_VEXT_VX(vremu_vx_h)
+GEN_VEXT_VX(vremu_vx_w)
+GEN_VEXT_VX(vremu_vx_d)
+GEN_VEXT_VX(vrem_vx_b)
+GEN_VEXT_VX(vrem_vx_h)
+GEN_VEXT_VX(vrem_vx_w)
+GEN_VEXT_VX(vrem_vx_d)
=20
 /* Vector Widening Integer Multiply Instructions */
 RVVCALL(OPIVV2, vwmul_vv_b, WOP_SSS_B, H2, H1, H1, DO_MUL)
@@ -1641,15 +1639,15 @@ RVVCALL(OPIVV2, vwmulu_vv_w, WOP_UUU_W, H8, H4, H4, D=
O_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_b, WOP_SUS_B, H2, H1, H1, DO_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_h, WOP_SUS_H, H4, H2, H2, DO_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_w, WOP_SUS_W, H8, H4, H4, DO_MUL)
-GEN_VEXT_VV(vwmul_vv_b, 1, 2)
-GEN_VEXT_VV(vwmul_vv_h, 2, 4)
-GEN_VEXT_VV(vwmul_vv_w, 4, 8)
-GEN_VEXT_VV(vwmulu_vv_b, 1, 2)
-GEN_VEXT_VV(vwmulu_vv_h, 2, 4)
-GEN_VEXT_VV(vwmulu_vv_w, 4, 8)
-GEN_VEXT_VV(vwmulsu_vv_b, 1, 2)
-GEN_VEXT_VV(vwmulsu_vv_h, 2, 4)
-GEN_VEXT_VV(vwmulsu_vv_w, 4, 8)
+GEN_VEXT_VV(vwmul_vv_b)
+GEN_VEXT_VV(vwmul_vv_h)
+GEN_VEXT_VV(vwmul_vv_w)
+GEN_VEXT_VV(vwmulu_vv_b)
+GEN_VEXT_VV(vwmulu_vv_h)
+GEN_VEXT_VV(vwmulu_vv_w)
+GEN_VEXT_VV(vwmulsu_vv_b)
+GEN_VEXT_VV(vwmulsu_vv_h)
+GEN_VEXT_VV(vwmulsu_vv_w)
=20
 RVVCALL(OPIVX2, vwmul_vx_b, WOP_SSS_B, H2, H1, DO_MUL)
 RVVCALL(OPIVX2, vwmul_vx_h, WOP_SSS_H, H4, H2, DO_MUL)
@@ -1660,15 +1658,15 @@ RVVCALL(OPIVX2, vwmulu_vx_w, WOP_UUU_W, H8, H4, DO_MU=
L)
 RVVCALL(OPIVX2, vwmulsu_vx_b, WOP_SUS_B, H2, H1, DO_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_h, WOP_SUS_H, H4, H2, DO_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_w, WOP_SUS_W, H8, H4, DO_MUL)
-GEN_VEXT_VX(vwmul_vx_b, 1, 2)
-GEN_VEXT_VX(vwmul_vx_h, 2, 4)
-GEN_VEXT_VX(vwmul_vx_w, 4, 8)
-GEN_VEXT_VX(vwmulu_vx_b, 1, 2)
-GEN_VEXT_VX(vwmulu_vx_h, 2, 4)
-GEN_VEXT_VX(vwmulu_vx_w, 4, 8)
-GEN_VEXT_VX(vwmulsu_vx_b, 1, 2)
-GEN_VEXT_VX(vwmulsu_vx_h, 2, 4)
-GEN_VEXT_VX(vwmulsu_vx_w, 4, 8)
+GEN_VEXT_VX(vwmul_vx_b)
+GEN_VEXT_VX(vwmul_vx_h)
+GEN_VEXT_VX(vwmul_vx_w)
+GEN_VEXT_VX(vwmulu_vx_b)
+GEN_VEXT_VX(vwmulu_vx_h)
+GEN_VEXT_VX(vwmulu_vx_w)
+GEN_VEXT_VX(vwmulsu_vx_b)
+GEN_VEXT_VX(vwmulsu_vx_h)
+GEN_VEXT_VX(vwmulsu_vx_w)
=20
 /* Vector Single-Width Integer Multiply-Add Instructions */
 #define OPIVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
@@ -1700,22 +1698,22 @@ RVVCALL(OPIVV3, vnmsub_vv_b, OP_SSS_B, H1, H1, H1, DO=
_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_h, OP_SSS_H, H2, H2, H2, DO_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_w, OP_SSS_W, H4, H4, H4, DO_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_d, OP_SSS_D, H8, H8, H8, DO_NMSUB)
-GEN_VEXT_VV(vmacc_vv_b, 1, 1)
-GEN_VEXT_VV(vmacc_vv_h, 2, 2)
-GEN_VEXT_VV(vmacc_vv_w, 4, 4)
-GEN_VEXT_VV(vmacc_vv_d, 8, 8)
-GEN_VEXT_VV(vnmsac_vv_b, 1, 1)
-GEN_VEXT_VV(vnmsac_vv_h, 2, 2)
-GEN_VEXT_VV(vnmsac_vv_w, 4, 4)
-GEN_VEXT_VV(vnmsac_vv_d, 8, 8)
-GEN_VEXT_VV(vmadd_vv_b, 1, 1)
-GEN_VEXT_VV(vmadd_vv_h, 2, 2)
-GEN_VEXT_VV(vmadd_vv_w, 4, 4)
-GEN_VEXT_VV(vmadd_vv_d, 8, 8)
-GEN_VEXT_VV(vnmsub_vv_b, 1, 1)
-GEN_VEXT_VV(vnmsub_vv_h, 2, 2)
-GEN_VEXT_VV(vnmsub_vv_w, 4, 4)
-GEN_VEXT_VV(vnmsub_vv_d, 8, 8)
+GEN_VEXT_VV(vmacc_vv_b)
+GEN_VEXT_VV(vmacc_vv_h)
+GEN_VEXT_VV(vmacc_vv_w)
+GEN_VEXT_VV(vmacc_vv_d)
+GEN_VEXT_VV(vnmsac_vv_b)
+GEN_VEXT_VV(vnmsac_vv_h)
+GEN_VEXT_VV(vnmsac_vv_w)
+GEN_VEXT_VV(vnmsac_vv_d)
+GEN_VEXT_VV(vmadd_vv_b)
+GEN_VEXT_VV(vmadd_vv_h)
+GEN_VEXT_VV(vmadd_vv_w)
+GEN_VEXT_VV(vmadd_vv_d)
+GEN_VEXT_VV(vnmsub_vv_b)
+GEN_VEXT_VV(vnmsub_vv_h)
+GEN_VEXT_VV(vnmsub_vv_w)
+GEN_VEXT_VV(vnmsub_vv_d)
=20
 #define OPIVX3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
 static void do_##NAME(void *vd, target_long s1, void *vs2, int i)   \
@@ -1741,22 +1739,22 @@ RVVCALL(OPIVX3, vnmsub_vx_b, OP_SSS_B, H1, H1, DO_NMS=
UB)
 RVVCALL(OPIVX3, vnmsub_vx_h, OP_SSS_H, H2, H2, DO_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_w, OP_SSS_W, H4, H4, DO_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_d, OP_SSS_D, H8, H8, DO_NMSUB)
-GEN_VEXT_VX(vmacc_vx_b, 1, 1)
-GEN_VEXT_VX(vmacc_vx_h, 2, 2)
-GEN_VEXT_VX(vmacc_vx_w, 4, 4)
-GEN_VEXT_VX(vmacc_vx_d, 8, 8)
-GEN_VEXT_VX(vnmsac_vx_b, 1, 1)
-GEN_VEXT_VX(vnmsac_vx_h, 2, 2)
-GEN_VEXT_VX(vnmsac_vx_w, 4, 4)
-GEN_VEXT_VX(vnmsac_vx_d, 8, 8)
-GEN_VEXT_VX(vmadd_vx_b, 1, 1)
-GEN_VEXT_VX(vmadd_vx_h, 2, 2)
-GEN_VEXT_VX(vmadd_vx_w, 4, 4)
-GEN_VEXT_VX(vmadd_vx_d, 8, 8)
-GEN_VEXT_VX(vnmsub_vx_b, 1, 1)
-GEN_VEXT_VX(vnmsub_vx_h, 2, 2)
-GEN_VEXT_VX(vnmsub_vx_w, 4, 4)
-GEN_VEXT_VX(vnmsub_vx_d, 8, 8)
+GEN_VEXT_VX(vmacc_vx_b)
+GEN_VEXT_VX(vmacc_vx_h)
+GEN_VEXT_VX(vmacc_vx_w)
+GEN_VEXT_VX(vmacc_vx_d)
+GEN_VEXT_VX(vnmsac_vx_b)
+GEN_VEXT_VX(vnmsac_vx_h)
+GEN_VEXT_VX(vnmsac_vx_w)
+GEN_VEXT_VX(vnmsac_vx_d)
+GEN_VEXT_VX(vmadd_vx_b)
+GEN_VEXT_VX(vmadd_vx_h)
+GEN_VEXT_VX(vmadd_vx_w)
+GEN_VEXT_VX(vmadd_vx_d)
+GEN_VEXT_VX(vnmsub_vx_b)
+GEN_VEXT_VX(vnmsub_vx_h)
+GEN_VEXT_VX(vnmsub_vx_w)
+GEN_VEXT_VX(vnmsub_vx_d)
=20
 /* Vector Widening Integer Multiply-Add Instructions */
 RVVCALL(OPIVV3, vwmaccu_vv_b, WOP_UUU_B, H2, H1, H1, DO_MACC)
@@ -1768,15 +1766,15 @@ RVVCALL(OPIVV3, vwmacc_vv_w, WOP_SSS_W, H8, H4, H4, D=
O_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_b, WOP_SSU_B, H2, H1, H1, DO_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_h, WOP_SSU_H, H4, H2, H2, DO_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_w, WOP_SSU_W, H8, H4, H4, DO_MACC)
-GEN_VEXT_VV(vwmaccu_vv_b, 1, 2)
-GEN_VEXT_VV(vwmaccu_vv_h, 2, 4)
-GEN_VEXT_VV(vwmaccu_vv_w, 4, 8)
-GEN_VEXT_VV(vwmacc_vv_b, 1, 2)
-GEN_VEXT_VV(vwmacc_vv_h, 2, 4)
-GEN_VEXT_VV(vwmacc_vv_w, 4, 8)
-GEN_VEXT_VV(vwmaccsu_vv_b, 1, 2)
-GEN_VEXT_VV(vwmaccsu_vv_h, 2, 4)
-GEN_VEXT_VV(vwmaccsu_vv_w, 4, 8)
+GEN_VEXT_VV(vwmaccu_vv_b)
+GEN_VEXT_VV(vwmaccu_vv_h)
+GEN_VEXT_VV(vwmaccu_vv_w)
+GEN_VEXT_VV(vwmacc_vv_b)
+GEN_VEXT_VV(vwmacc_vv_h)
+GEN_VEXT_VV(vwmacc_vv_w)
+GEN_VEXT_VV(vwmaccsu_vv_b)
+GEN_VEXT_VV(vwmaccsu_vv_h)
+GEN_VEXT_VV(vwmaccsu_vv_w)
=20
 RVVCALL(OPIVX3, vwmaccu_vx_b, WOP_UUU_B, H2, H1, DO_MACC)
 RVVCALL(OPIVX3, vwmaccu_vx_h, WOP_UUU_H, H4, H2, DO_MACC)
@@ -1790,18 +1788,18 @@ RVVCALL(OPIVX3, vwmaccsu_vx_w, WOP_SSU_W, H8, H4, DO_=
MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_b, WOP_SUS_B, H2, H1, DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_h, WOP_SUS_H, H4, H2, DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_w, WOP_SUS_W, H8, H4, DO_MACC)
-GEN_VEXT_VX(vwmaccu_vx_b, 1, 2)
-GEN_VEXT_VX(vwmaccu_vx_h, 2, 4)
-GEN_VEXT_VX(vwmaccu_vx_w, 4, 8)
-GEN_VEXT_VX(vwmacc_vx_b, 1, 2)
-GEN_VEXT_VX(vwmacc_vx_h, 2, 4)
-GEN_VEXT_VX(vwmacc_vx_w, 4, 8)
-GEN_VEXT_VX(vwmaccsu_vx_b, 1, 2)
-GEN_VEXT_VX(vwmaccsu_vx_h, 2, 4)
-GEN_VEXT_VX(vwmaccsu_vx_w, 4, 8)
-GEN_VEXT_VX(vwmaccus_vx_b, 1, 2)
-GEN_VEXT_VX(vwmaccus_vx_h, 2, 4)
-GEN_VEXT_VX(vwmaccus_vx_w, 4, 8)
+GEN_VEXT_VX(vwmaccu_vx_b)
+GEN_VEXT_VX(vwmaccu_vx_h)
+GEN_VEXT_VX(vwmaccu_vx_w)
+GEN_VEXT_VX(vwmacc_vx_b)
+GEN_VEXT_VX(vwmacc_vx_h)
+GEN_VEXT_VX(vwmacc_vx_w)
+GEN_VEXT_VX(vwmaccsu_vx_b)
+GEN_VEXT_VX(vwmaccsu_vx_h)
+GEN_VEXT_VX(vwmaccsu_vx_w)
+GEN_VEXT_VX(vwmaccus_vx_b)
+GEN_VEXT_VX(vwmaccus_vx_h)
+GEN_VEXT_VX(vwmaccus_vx_w)
=20
 /* Vector Integer Merge and Move Instructions */
 #define GEN_VEXT_VMV_VV(NAME, ETYPE, H)                              \
@@ -1922,7 +1920,7 @@ vext_vv_rm_1(void *vd, void *v0, void *vs1, void *vs2,
 static inline void
 vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
              CPURISCVState *env,
-             uint32_t desc, uint32_t esz, uint32_t dsz,
+             uint32_t desc,
              opivv2_rm_fn *fn)
 {
     uint32_t vm =3D vext_vm(desc);
@@ -1949,11 +1947,11 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
 }
=20
 /* generate helpers for fixed point instructions with OPIVV format */
-#define GEN_VEXT_VV_RM(NAME, ESZ, DSZ)                          \
+#define GEN_VEXT_VV_RM(NAME)                                    \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
                   CPURISCVState *env, uint32_t desc)            \
 {                                                               \
-    vext_vv_rm_2(vd, v0, vs1, vs2, env, desc, ESZ, DSZ,         \
+    vext_vv_rm_2(vd, v0, vs1, vs2, env, desc,                   \
                  do_##NAME);                                    \
 }
=20
@@ -2004,10 +2002,10 @@ RVVCALL(OPIVV2_RM, vsaddu_vv_b, OP_UUU_B, H1, H1, H1,=
 saddu8)
 RVVCALL(OPIVV2_RM, vsaddu_vv_h, OP_UUU_H, H2, H2, H2, saddu16)
 RVVCALL(OPIVV2_RM, vsaddu_vv_w, OP_UUU_W, H4, H4, H4, saddu32)
 RVVCALL(OPIVV2_RM, vsaddu_vv_d, OP_UUU_D, H8, H8, H8, saddu64)
-GEN_VEXT_VV_RM(vsaddu_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vsaddu_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vsaddu_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vsaddu_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vsaddu_vv_b)
+GEN_VEXT_VV_RM(vsaddu_vv_h)
+GEN_VEXT_VV_RM(vsaddu_vv_w)
+GEN_VEXT_VV_RM(vsaddu_vv_d)
=20
 typedef void opivx2_rm_fn(void *vd, target_long s1, void *vs2, int i,
                           CPURISCVState *env, int vxrm);
@@ -2039,7 +2037,7 @@ vext_vx_rm_1(void *vd, void *v0, target_long s1, void *=
vs2,
 static inline void
 vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
              CPURISCVState *env,
-             uint32_t desc, uint32_t esz, uint32_t dsz,
+             uint32_t desc,
              opivx2_rm_fn *fn)
 {
     uint32_t vm =3D vext_vm(desc);
@@ -2066,11 +2064,11 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, void=
 *vs2,
 }
=20
 /* generate helpers for fixed point instructions with OPIVX format */
-#define GEN_VEXT_VX_RM(NAME, ESZ, DSZ)                    \
+#define GEN_VEXT_VX_RM(NAME)                              \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
         void *vs2, CPURISCVState *env, uint32_t desc)     \
 {                                                         \
-    vext_vx_rm_2(vd, v0, s1, vs2, env, desc, ESZ, DSZ,    \
+    vext_vx_rm_2(vd, v0, s1, vs2, env, desc,              \
                  do_##NAME);                              \
 }
=20
@@ -2078,10 +2076,10 @@ RVVCALL(OPIVX2_RM, vsaddu_vx_b, OP_UUU_B, H1, H1, sad=
du8)
 RVVCALL(OPIVX2_RM, vsaddu_vx_h, OP_UUU_H, H2, H2, saddu16)
 RVVCALL(OPIVX2_RM, vsaddu_vx_w, OP_UUU_W, H4, H4, saddu32)
 RVVCALL(OPIVX2_RM, vsaddu_vx_d, OP_UUU_D, H8, H8, saddu64)
-GEN_VEXT_VX_RM(vsaddu_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vsaddu_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vsaddu_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vsaddu_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vsaddu_vx_b)
+GEN_VEXT_VX_RM(vsaddu_vx_h)
+GEN_VEXT_VX_RM(vsaddu_vx_w)
+GEN_VEXT_VX_RM(vsaddu_vx_d)
=20
 static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
@@ -2127,19 +2125,19 @@ RVVCALL(OPIVV2_RM, vsadd_vv_b, OP_SSS_B, H1, H1, H1, =
sadd8)
 RVVCALL(OPIVV2_RM, vsadd_vv_h, OP_SSS_H, H2, H2, H2, sadd16)
 RVVCALL(OPIVV2_RM, vsadd_vv_w, OP_SSS_W, H4, H4, H4, sadd32)
 RVVCALL(OPIVV2_RM, vsadd_vv_d, OP_SSS_D, H8, H8, H8, sadd64)
-GEN_VEXT_VV_RM(vsadd_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vsadd_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vsadd_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vsadd_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vsadd_vv_b)
+GEN_VEXT_VV_RM(vsadd_vv_h)
+GEN_VEXT_VV_RM(vsadd_vv_w)
+GEN_VEXT_VV_RM(vsadd_vv_d)
=20
 RVVCALL(OPIVX2_RM, vsadd_vx_b, OP_SSS_B, H1, H1, sadd8)
 RVVCALL(OPIVX2_RM, vsadd_vx_h, OP_SSS_H, H2, H2, sadd16)
 RVVCALL(OPIVX2_RM, vsadd_vx_w, OP_SSS_W, H4, H4, sadd32)
 RVVCALL(OPIVX2_RM, vsadd_vx_d, OP_SSS_D, H8, H8, sadd64)
-GEN_VEXT_VX_RM(vsadd_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vsadd_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vsadd_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vsadd_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vsadd_vx_b)
+GEN_VEXT_VX_RM(vsadd_vx_h)
+GEN_VEXT_VX_RM(vsadd_vx_w)
+GEN_VEXT_VX_RM(vsadd_vx_d)
=20
 static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_=
t b)
 {
@@ -2188,19 +2186,19 @@ RVVCALL(OPIVV2_RM, vssubu_vv_b, OP_UUU_B, H1, H1, H1,=
 ssubu8)
 RVVCALL(OPIVV2_RM, vssubu_vv_h, OP_UUU_H, H2, H2, H2, ssubu16)
 RVVCALL(OPIVV2_RM, vssubu_vv_w, OP_UUU_W, H4, H4, H4, ssubu32)
 RVVCALL(OPIVV2_RM, vssubu_vv_d, OP_UUU_D, H8, H8, H8, ssubu64)
-GEN_VEXT_VV_RM(vssubu_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vssubu_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vssubu_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vssubu_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vssubu_vv_b)
+GEN_VEXT_VV_RM(vssubu_vv_h)
+GEN_VEXT_VV_RM(vssubu_vv_w)
+GEN_VEXT_VV_RM(vssubu_vv_d)
=20
 RVVCALL(OPIVX2_RM, vssubu_vx_b, OP_UUU_B, H1, H1, ssubu8)
 RVVCALL(OPIVX2_RM, vssubu_vx_h, OP_UUU_H, H2, H2, ssubu16)
 RVVCALL(OPIVX2_RM, vssubu_vx_w, OP_UUU_W, H4, H4, ssubu32)
 RVVCALL(OPIVX2_RM, vssubu_vx_d, OP_UUU_D, H8, H8, ssubu64)
-GEN_VEXT_VX_RM(vssubu_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vssubu_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vssubu_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vssubu_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vssubu_vx_b)
+GEN_VEXT_VX_RM(vssubu_vx_h)
+GEN_VEXT_VX_RM(vssubu_vx_w)
+GEN_VEXT_VX_RM(vssubu_vx_d)
=20
 static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
@@ -2246,19 +2244,19 @@ RVVCALL(OPIVV2_RM, vssub_vv_b, OP_SSS_B, H1, H1, H1, =
ssub8)
 RVVCALL(OPIVV2_RM, vssub_vv_h, OP_SSS_H, H2, H2, H2, ssub16)
 RVVCALL(OPIVV2_RM, vssub_vv_w, OP_SSS_W, H4, H4, H4, ssub32)
 RVVCALL(OPIVV2_RM, vssub_vv_d, OP_SSS_D, H8, H8, H8, ssub64)
-GEN_VEXT_VV_RM(vssub_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vssub_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vssub_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vssub_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vssub_vv_b)
+GEN_VEXT_VV_RM(vssub_vv_h)
+GEN_VEXT_VV_RM(vssub_vv_w)
+GEN_VEXT_VV_RM(vssub_vv_d)
=20
 RVVCALL(OPIVX2_RM, vssub_vx_b, OP_SSS_B, H1, H1, ssub8)
 RVVCALL(OPIVX2_RM, vssub_vx_h, OP_SSS_H, H2, H2, ssub16)
 RVVCALL(OPIVX2_RM, vssub_vx_w, OP_SSS_W, H4, H4, ssub32)
 RVVCALL(OPIVX2_RM, vssub_vx_d, OP_SSS_D, H8, H8, ssub64)
-GEN_VEXT_VX_RM(vssub_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vssub_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vssub_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vssub_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vssub_vx_b)
+GEN_VEXT_VX_RM(vssub_vx_h)
+GEN_VEXT_VX_RM(vssub_vx_w)
+GEN_VEXT_VX_RM(vssub_vx_d)
=20
 /* Vector Single-Width Averaging Add and Subtract */
 static inline uint8_t get_round(int vxrm, uint64_t v, uint8_t shift)
@@ -2310,19 +2308,19 @@ RVVCALL(OPIVV2_RM, vaadd_vv_b, OP_SSS_B, H1, H1, H1, =
aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_h, OP_SSS_H, H2, H2, H2, aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_w, OP_SSS_W, H4, H4, H4, aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_d, OP_SSS_D, H8, H8, H8, aadd64)
-GEN_VEXT_VV_RM(vaadd_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vaadd_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vaadd_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vaadd_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vaadd_vv_b)
+GEN_VEXT_VV_RM(vaadd_vv_h)
+GEN_VEXT_VV_RM(vaadd_vv_w)
+GEN_VEXT_VV_RM(vaadd_vv_d)
=20
 RVVCALL(OPIVX2_RM, vaadd_vx_b, OP_SSS_B, H1, H1, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_h, OP_SSS_H, H2, H2, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_w, OP_SSS_W, H4, H4, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_d, OP_SSS_D, H8, H8, aadd64)
-GEN_VEXT_VX_RM(vaadd_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vaadd_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vaadd_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vaadd_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vaadd_vx_b)
+GEN_VEXT_VX_RM(vaadd_vx_h)
+GEN_VEXT_VX_RM(vaadd_vx_w)
+GEN_VEXT_VX_RM(vaadd_vx_d)
=20
 static inline uint32_t aaddu32(CPURISCVState *env, int vxrm,
                                uint32_t a, uint32_t b)
@@ -2347,19 +2345,19 @@ RVVCALL(OPIVV2_RM, vaaddu_vv_b, OP_UUU_B, H1, H1, H1,=
 aaddu32)
 RVVCALL(OPIVV2_RM, vaaddu_vv_h, OP_UUU_H, H2, H2, H2, aaddu32)
 RVVCALL(OPIVV2_RM, vaaddu_vv_w, OP_UUU_W, H4, H4, H4, aaddu32)
 RVVCALL(OPIVV2_RM, vaaddu_vv_d, OP_UUU_D, H8, H8, H8, aaddu64)
-GEN_VEXT_VV_RM(vaaddu_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vaaddu_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vaaddu_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vaaddu_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vaaddu_vv_b)
+GEN_VEXT_VV_RM(vaaddu_vv_h)
+GEN_VEXT_VV_RM(vaaddu_vv_w)
+GEN_VEXT_VV_RM(vaaddu_vv_d)
=20
 RVVCALL(OPIVX2_RM, vaaddu_vx_b, OP_UUU_B, H1, H1, aaddu32)
 RVVCALL(OPIVX2_RM, vaaddu_vx_h, OP_UUU_H, H2, H2, aaddu32)
 RVVCALL(OPIVX2_RM, vaaddu_vx_w, OP_UUU_W, H4, H4, aaddu32)
 RVVCALL(OPIVX2_RM, vaaddu_vx_d, OP_UUU_D, H8, H8, aaddu64)
-GEN_VEXT_VX_RM(vaaddu_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vaaddu_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vaaddu_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vaaddu_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vaaddu_vx_b)
+GEN_VEXT_VX_RM(vaaddu_vx_h)
+GEN_VEXT_VX_RM(vaaddu_vx_w)
+GEN_VEXT_VX_RM(vaaddu_vx_d)
=20
 static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, int32_=
t b)
 {
@@ -2383,19 +2381,19 @@ RVVCALL(OPIVV2_RM, vasub_vv_b, OP_SSS_B, H1, H1, H1, =
asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_h, OP_SSS_H, H2, H2, H2, asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_w, OP_SSS_W, H4, H4, H4, asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_d, OP_SSS_D, H8, H8, H8, asub64)
-GEN_VEXT_VV_RM(vasub_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vasub_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vasub_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vasub_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vasub_vv_b)
+GEN_VEXT_VV_RM(vasub_vv_h)
+GEN_VEXT_VV_RM(vasub_vv_w)
+GEN_VEXT_VV_RM(vasub_vv_d)
=20
 RVVCALL(OPIVX2_RM, vasub_vx_b, OP_SSS_B, H1, H1, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_h, OP_SSS_H, H2, H2, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_w, OP_SSS_W, H4, H4, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_d, OP_SSS_D, H8, H8, asub64)
-GEN_VEXT_VX_RM(vasub_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vasub_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vasub_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vasub_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vasub_vx_b)
+GEN_VEXT_VX_RM(vasub_vx_h)
+GEN_VEXT_VX_RM(vasub_vx_w)
+GEN_VEXT_VX_RM(vasub_vx_d)
=20
 static inline uint32_t asubu32(CPURISCVState *env, int vxrm,
                                uint32_t a, uint32_t b)
@@ -2420,19 +2418,19 @@ RVVCALL(OPIVV2_RM, vasubu_vv_b, OP_UUU_B, H1, H1, H1,=
 asubu32)
 RVVCALL(OPIVV2_RM, vasubu_vv_h, OP_UUU_H, H2, H2, H2, asubu32)
 RVVCALL(OPIVV2_RM, vasubu_vv_w, OP_UUU_W, H4, H4, H4, asubu32)
 RVVCALL(OPIVV2_RM, vasubu_vv_d, OP_UUU_D, H8, H8, H8, asubu64)
-GEN_VEXT_VV_RM(vasubu_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vasubu_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vasubu_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vasubu_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vasubu_vv_b)
+GEN_VEXT_VV_RM(vasubu_vv_h)
+GEN_VEXT_VV_RM(vasubu_vv_w)
+GEN_VEXT_VV_RM(vasubu_vv_d)
=20
 RVVCALL(OPIVX2_RM, vasubu_vx_b, OP_UUU_B, H1, H1, asubu32)
 RVVCALL(OPIVX2_RM, vasubu_vx_h, OP_UUU_H, H2, H2, asubu32)
 RVVCALL(OPIVX2_RM, vasubu_vx_w, OP_UUU_W, H4, H4, asubu32)
 RVVCALL(OPIVX2_RM, vasubu_vx_d, OP_UUU_D, H8, H8, asubu64)
-GEN_VEXT_VX_RM(vasubu_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vasubu_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vasubu_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vasubu_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vasubu_vx_b)
+GEN_VEXT_VX_RM(vasubu_vx_h)
+GEN_VEXT_VX_RM(vasubu_vx_w)
+GEN_VEXT_VX_RM(vasubu_vx_d)
=20
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation */
 static inline int8_t vsmul8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
@@ -2527,19 +2525,19 @@ RVVCALL(OPIVV2_RM, vsmul_vv_b, OP_SSS_B, H1, H1, H1, =
vsmul8)
 RVVCALL(OPIVV2_RM, vsmul_vv_h, OP_SSS_H, H2, H2, H2, vsmul16)
 RVVCALL(OPIVV2_RM, vsmul_vv_w, OP_SSS_W, H4, H4, H4, vsmul32)
 RVVCALL(OPIVV2_RM, vsmul_vv_d, OP_SSS_D, H8, H8, H8, vsmul64)
-GEN_VEXT_VV_RM(vsmul_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vsmul_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vsmul_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vsmul_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vsmul_vv_b)
+GEN_VEXT_VV_RM(vsmul_vv_h)
+GEN_VEXT_VV_RM(vsmul_vv_w)
+GEN_VEXT_VV_RM(vsmul_vv_d)
=20
 RVVCALL(OPIVX2_RM, vsmul_vx_b, OP_SSS_B, H1, H1, vsmul8)
 RVVCALL(OPIVX2_RM, vsmul_vx_h, OP_SSS_H, H2, H2, vsmul16)
 RVVCALL(OPIVX2_RM, vsmul_vx_w, OP_SSS_W, H4, H4, vsmul32)
 RVVCALL(OPIVX2_RM, vsmul_vx_d, OP_SSS_D, H8, H8, vsmul64)
-GEN_VEXT_VX_RM(vsmul_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vsmul_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vsmul_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vsmul_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vsmul_vx_b)
+GEN_VEXT_VX_RM(vsmul_vx_h)
+GEN_VEXT_VX_RM(vsmul_vx_w)
+GEN_VEXT_VX_RM(vsmul_vx_d)
=20
 /* Vector Single-Width Scaling Shift Instructions */
 static inline uint8_t
@@ -2586,19 +2584,19 @@ RVVCALL(OPIVV2_RM, vssrl_vv_b, OP_UUU_B, H1, H1, H1, =
vssrl8)
 RVVCALL(OPIVV2_RM, vssrl_vv_h, OP_UUU_H, H2, H2, H2, vssrl16)
 RVVCALL(OPIVV2_RM, vssrl_vv_w, OP_UUU_W, H4, H4, H4, vssrl32)
 RVVCALL(OPIVV2_RM, vssrl_vv_d, OP_UUU_D, H8, H8, H8, vssrl64)
-GEN_VEXT_VV_RM(vssrl_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vssrl_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vssrl_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vssrl_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vssrl_vv_b)
+GEN_VEXT_VV_RM(vssrl_vv_h)
+GEN_VEXT_VV_RM(vssrl_vv_w)
+GEN_VEXT_VV_RM(vssrl_vv_d)
=20
 RVVCALL(OPIVX2_RM, vssrl_vx_b, OP_UUU_B, H1, H1, vssrl8)
 RVVCALL(OPIVX2_RM, vssrl_vx_h, OP_UUU_H, H2, H2, vssrl16)
 RVVCALL(OPIVX2_RM, vssrl_vx_w, OP_UUU_W, H4, H4, vssrl32)
 RVVCALL(OPIVX2_RM, vssrl_vx_d, OP_UUU_D, H8, H8, vssrl64)
-GEN_VEXT_VX_RM(vssrl_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vssrl_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vssrl_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vssrl_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vssrl_vx_b)
+GEN_VEXT_VX_RM(vssrl_vx_h)
+GEN_VEXT_VX_RM(vssrl_vx_w)
+GEN_VEXT_VX_RM(vssrl_vx_d)
=20
 static inline int8_t
 vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
@@ -2645,19 +2643,19 @@ RVVCALL(OPIVV2_RM, vssra_vv_b, OP_SSS_B, H1, H1, H1, =
vssra8)
 RVVCALL(OPIVV2_RM, vssra_vv_h, OP_SSS_H, H2, H2, H2, vssra16)
 RVVCALL(OPIVV2_RM, vssra_vv_w, OP_SSS_W, H4, H4, H4, vssra32)
 RVVCALL(OPIVV2_RM, vssra_vv_d, OP_SSS_D, H8, H8, H8, vssra64)
-GEN_VEXT_VV_RM(vssra_vv_b, 1, 1)
-GEN_VEXT_VV_RM(vssra_vv_h, 2, 2)
-GEN_VEXT_VV_RM(vssra_vv_w, 4, 4)
-GEN_VEXT_VV_RM(vssra_vv_d, 8, 8)
+GEN_VEXT_VV_RM(vssra_vv_b)
+GEN_VEXT_VV_RM(vssra_vv_h)
+GEN_VEXT_VV_RM(vssra_vv_w)
+GEN_VEXT_VV_RM(vssra_vv_d)
=20
 RVVCALL(OPIVX2_RM, vssra_vx_b, OP_SSS_B, H1, H1, vssra8)
 RVVCALL(OPIVX2_RM, vssra_vx_h, OP_SSS_H, H2, H2, vssra16)
 RVVCALL(OPIVX2_RM, vssra_vx_w, OP_SSS_W, H4, H4, vssra32)
 RVVCALL(OPIVX2_RM, vssra_vx_d, OP_SSS_D, H8, H8, vssra64)
-GEN_VEXT_VX_RM(vssra_vx_b, 1, 1)
-GEN_VEXT_VX_RM(vssra_vx_h, 2, 2)
-GEN_VEXT_VX_RM(vssra_vx_w, 4, 4)
-GEN_VEXT_VX_RM(vssra_vx_d, 8, 8)
+GEN_VEXT_VX_RM(vssra_vx_b)
+GEN_VEXT_VX_RM(vssra_vx_h)
+GEN_VEXT_VX_RM(vssra_vx_w)
+GEN_VEXT_VX_RM(vssra_vx_d)
=20
 /* Vector Narrowing Fixed-Point Clip Instructions */
 static inline int8_t
@@ -2720,16 +2718,16 @@ vnclip32(CPURISCVState *env, int vxrm, int64_t a, int=
32_t b)
 RVVCALL(OPIVV2_RM, vnclip_wv_b, NOP_SSS_B, H1, H2, H1, vnclip8)
 RVVCALL(OPIVV2_RM, vnclip_wv_h, NOP_SSS_H, H2, H4, H2, vnclip16)
 RVVCALL(OPIVV2_RM, vnclip_wv_w, NOP_SSS_W, H4, H8, H4, vnclip32)
-GEN_VEXT_VV_RM(vnclip_wv_b, 1, 1)
-GEN_VEXT_VV_RM(vnclip_wv_h, 2, 2)
-GEN_VEXT_VV_RM(vnclip_wv_w, 4, 4)
+GEN_VEXT_VV_RM(vnclip_wv_b)
+GEN_VEXT_VV_RM(vnclip_wv_h)
+GEN_VEXT_VV_RM(vnclip_wv_w)
=20
 RVVCALL(OPIVX2_RM, vnclip_wx_b, NOP_SSS_B, H1, H2, vnclip8)
 RVVCALL(OPIVX2_RM, vnclip_wx_h, NOP_SSS_H, H2, H4, vnclip16)
 RVVCALL(OPIVX2_RM, vnclip_wx_w, NOP_SSS_W, H4, H8, vnclip32)
-GEN_VEXT_VX_RM(vnclip_wx_b, 1, 1)
-GEN_VEXT_VX_RM(vnclip_wx_h, 2, 2)
-GEN_VEXT_VX_RM(vnclip_wx_w, 4, 4)
+GEN_VEXT_VX_RM(vnclip_wx_b)
+GEN_VEXT_VX_RM(vnclip_wx_h)
+GEN_VEXT_VX_RM(vnclip_wx_w)
=20
 static inline uint8_t
 vnclipu8(CPURISCVState *env, int vxrm, uint16_t a, uint8_t b)
@@ -2782,16 +2780,16 @@ vnclipu32(CPURISCVState *env, int vxrm, uint64_t a, u=
int32_t b)
 RVVCALL(OPIVV2_RM, vnclipu_wv_b, NOP_UUU_B, H1, H2, H1, vnclipu8)
 RVVCALL(OPIVV2_RM, vnclipu_wv_h, NOP_UUU_H, H2, H4, H2, vnclipu16)
 RVVCALL(OPIVV2_RM, vnclipu_wv_w, NOP_UUU_W, H4, H8, H4, vnclipu32)
-GEN_VEXT_VV_RM(vnclipu_wv_b, 1, 1)
-GEN_VEXT_VV_RM(vnclipu_wv_h, 2, 2)
-GEN_VEXT_VV_RM(vnclipu_wv_w, 4, 4)
+GEN_VEXT_VV_RM(vnclipu_wv_b)
+GEN_VEXT_VV_RM(vnclipu_wv_h)
+GEN_VEXT_VV_RM(vnclipu_wv_w)
=20
 RVVCALL(OPIVX2_RM, vnclipu_wx_b, NOP_UUU_B, H1, H2, vnclipu8)
 RVVCALL(OPIVX2_RM, vnclipu_wx_h, NOP_UUU_H, H2, H4, vnclipu16)
 RVVCALL(OPIVX2_RM, vnclipu_wx_w, NOP_UUU_W, H4, H8, vnclipu32)
-GEN_VEXT_VX_RM(vnclipu_wx_b, 1, 1)
-GEN_VEXT_VX_RM(vnclipu_wx_h, 2, 2)
-GEN_VEXT_VX_RM(vnclipu_wx_w, 4, 4)
+GEN_VEXT_VX_RM(vnclipu_wx_b)
+GEN_VEXT_VX_RM(vnclipu_wx_h)
+GEN_VEXT_VX_RM(vnclipu_wx_w)
=20
 /*
  *** Vector Float Point Arithmetic Instructions
@@ -2806,7 +2804,7 @@ static void do_##NAME(void *vd, void *vs1, void *vs2, i=
nt i,   \
     *((TD *)vd + HD(i)) =3D OP(s2, s1, &env->fp_status);         \
 }
=20
-#define GEN_VEXT_VV_ENV(NAME, ESZ, DSZ)                   \
+#define GEN_VEXT_VV_ENV(NAME)                             \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
@@ -2827,9 +2825,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
   \
 RVVCALL(OPFVV2, vfadd_vv_h, OP_UUU_H, H2, H2, H2, float16_add)
 RVVCALL(OPFVV2, vfadd_vv_w, OP_UUU_W, H4, H4, H4, float32_add)
 RVVCALL(OPFVV2, vfadd_vv_d, OP_UUU_D, H8, H8, H8, float64_add)
-GEN_VEXT_VV_ENV(vfadd_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfadd_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfadd_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfadd_vv_h)
+GEN_VEXT_VV_ENV(vfadd_vv_w)
+GEN_VEXT_VV_ENV(vfadd_vv_d)
=20
 #define OPFVF2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)        \
 static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i, \
@@ -2839,7 +2837,7 @@ static void do_##NAME(void *vd, uint64_t s1, void *vs2,=
 int i, \
     *((TD *)vd + HD(i)) =3D OP(s2, (TX1)(T1)s1, &env->fp_status);\
 }
=20
-#define GEN_VEXT_VF(NAME, ESZ, DSZ)                       \
+#define GEN_VEXT_VF(NAME)                                 \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
@@ -2860,22 +2858,22 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,   =
     \
 RVVCALL(OPFVF2, vfadd_vf_h, OP_UUU_H, H2, H2, float16_add)
 RVVCALL(OPFVF2, vfadd_vf_w, OP_UUU_W, H4, H4, float32_add)
 RVVCALL(OPFVF2, vfadd_vf_d, OP_UUU_D, H8, H8, float64_add)
-GEN_VEXT_VF(vfadd_vf_h, 2, 2)
-GEN_VEXT_VF(vfadd_vf_w, 4, 4)
-GEN_VEXT_VF(vfadd_vf_d, 8, 8)
+GEN_VEXT_VF(vfadd_vf_h)
+GEN_VEXT_VF(vfadd_vf_w)
+GEN_VEXT_VF(vfadd_vf_d)
=20
 RVVCALL(OPFVV2, vfsub_vv_h, OP_UUU_H, H2, H2, H2, float16_sub)
 RVVCALL(OPFVV2, vfsub_vv_w, OP_UUU_W, H4, H4, H4, float32_sub)
 RVVCALL(OPFVV2, vfsub_vv_d, OP_UUU_D, H8, H8, H8, float64_sub)
-GEN_VEXT_VV_ENV(vfsub_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfsub_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfsub_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfsub_vv_h)
+GEN_VEXT_VV_ENV(vfsub_vv_w)
+GEN_VEXT_VV_ENV(vfsub_vv_d)
 RVVCALL(OPFVF2, vfsub_vf_h, OP_UUU_H, H2, H2, float16_sub)
 RVVCALL(OPFVF2, vfsub_vf_w, OP_UUU_W, H4, H4, float32_sub)
 RVVCALL(OPFVF2, vfsub_vf_d, OP_UUU_D, H8, H8, float64_sub)
-GEN_VEXT_VF(vfsub_vf_h, 2, 2)
-GEN_VEXT_VF(vfsub_vf_w, 4, 4)
-GEN_VEXT_VF(vfsub_vf_d, 8, 8)
+GEN_VEXT_VF(vfsub_vf_h)
+GEN_VEXT_VF(vfsub_vf_w)
+GEN_VEXT_VF(vfsub_vf_d)
=20
 static uint16_t float16_rsub(uint16_t a, uint16_t b, float_status *s)
 {
@@ -2895,9 +2893,9 @@ static uint64_t float64_rsub(uint64_t a, uint64_t b, fl=
oat_status *s)
 RVVCALL(OPFVF2, vfrsub_vf_h, OP_UUU_H, H2, H2, float16_rsub)
 RVVCALL(OPFVF2, vfrsub_vf_w, OP_UUU_W, H4, H4, float32_rsub)
 RVVCALL(OPFVF2, vfrsub_vf_d, OP_UUU_D, H8, H8, float64_rsub)
-GEN_VEXT_VF(vfrsub_vf_h, 2, 2)
-GEN_VEXT_VF(vfrsub_vf_w, 4, 4)
-GEN_VEXT_VF(vfrsub_vf_d, 8, 8)
+GEN_VEXT_VF(vfrsub_vf_h)
+GEN_VEXT_VF(vfrsub_vf_w)
+GEN_VEXT_VF(vfrsub_vf_d)
=20
 /* Vector Widening Floating-Point Add/Subtract Instructions */
 static uint32_t vfwadd16(uint16_t a, uint16_t b, float_status *s)
@@ -2915,12 +2913,12 @@ static uint64_t vfwadd32(uint32_t a, uint32_t b, floa=
t_status *s)
=20
 RVVCALL(OPFVV2, vfwadd_vv_h, WOP_UUU_H, H4, H2, H2, vfwadd16)
 RVVCALL(OPFVV2, vfwadd_vv_w, WOP_UUU_W, H8, H4, H4, vfwadd32)
-GEN_VEXT_VV_ENV(vfwadd_vv_h, 2, 4)
-GEN_VEXT_VV_ENV(vfwadd_vv_w, 4, 8)
+GEN_VEXT_VV_ENV(vfwadd_vv_h)
+GEN_VEXT_VV_ENV(vfwadd_vv_w)
 RVVCALL(OPFVF2, vfwadd_vf_h, WOP_UUU_H, H4, H2, vfwadd16)
 RVVCALL(OPFVF2, vfwadd_vf_w, WOP_UUU_W, H8, H4, vfwadd32)
-GEN_VEXT_VF(vfwadd_vf_h, 2, 4)
-GEN_VEXT_VF(vfwadd_vf_w, 4, 8)
+GEN_VEXT_VF(vfwadd_vf_h)
+GEN_VEXT_VF(vfwadd_vf_w)
=20
 static uint32_t vfwsub16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -2937,12 +2935,12 @@ static uint64_t vfwsub32(uint32_t a, uint32_t b, floa=
t_status *s)
=20
 RVVCALL(OPFVV2, vfwsub_vv_h, WOP_UUU_H, H4, H2, H2, vfwsub16)
 RVVCALL(OPFVV2, vfwsub_vv_w, WOP_UUU_W, H8, H4, H4, vfwsub32)
-GEN_VEXT_VV_ENV(vfwsub_vv_h, 2, 4)
-GEN_VEXT_VV_ENV(vfwsub_vv_w, 4, 8)
+GEN_VEXT_VV_ENV(vfwsub_vv_h)
+GEN_VEXT_VV_ENV(vfwsub_vv_w)
 RVVCALL(OPFVF2, vfwsub_vf_h, WOP_UUU_H, H4, H2, vfwsub16)
 RVVCALL(OPFVF2, vfwsub_vf_w, WOP_UUU_W, H8, H4, vfwsub32)
-GEN_VEXT_VF(vfwsub_vf_h, 2, 4)
-GEN_VEXT_VF(vfwsub_vf_w, 4, 8)
+GEN_VEXT_VF(vfwsub_vf_h)
+GEN_VEXT_VF(vfwsub_vf_w)
=20
 static uint32_t vfwaddw16(uint32_t a, uint16_t b, float_status *s)
 {
@@ -2956,12 +2954,12 @@ static uint64_t vfwaddw32(uint64_t a, uint32_t b, flo=
at_status *s)
=20
 RVVCALL(OPFVV2, vfwadd_wv_h, WOP_WUUU_H, H4, H2, H2, vfwaddw16)
 RVVCALL(OPFVV2, vfwadd_wv_w, WOP_WUUU_W, H8, H4, H4, vfwaddw32)
-GEN_VEXT_VV_ENV(vfwadd_wv_h, 2, 4)
-GEN_VEXT_VV_ENV(vfwadd_wv_w, 4, 8)
+GEN_VEXT_VV_ENV(vfwadd_wv_h)
+GEN_VEXT_VV_ENV(vfwadd_wv_w)
 RVVCALL(OPFVF2, vfwadd_wf_h, WOP_WUUU_H, H4, H2, vfwaddw16)
 RVVCALL(OPFVF2, vfwadd_wf_w, WOP_WUUU_W, H8, H4, vfwaddw32)
-GEN_VEXT_VF(vfwadd_wf_h, 2, 4)
-GEN_VEXT_VF(vfwadd_wf_w, 4, 8)
+GEN_VEXT_VF(vfwadd_wf_h)
+GEN_VEXT_VF(vfwadd_wf_w)
=20
 static uint32_t vfwsubw16(uint32_t a, uint16_t b, float_status *s)
 {
@@ -2975,39 +2973,39 @@ static uint64_t vfwsubw32(uint64_t a, uint32_t b, flo=
at_status *s)
=20
 RVVCALL(OPFVV2, vfwsub_wv_h, WOP_WUUU_H, H4, H2, H2, vfwsubw16)
 RVVCALL(OPFVV2, vfwsub_wv_w, WOP_WUUU_W, H8, H4, H4, vfwsubw32)
-GEN_VEXT_VV_ENV(vfwsub_wv_h, 2, 4)
-GEN_VEXT_VV_ENV(vfwsub_wv_w, 4, 8)
+GEN_VEXT_VV_ENV(vfwsub_wv_h)
+GEN_VEXT_VV_ENV(vfwsub_wv_w)
 RVVCALL(OPFVF2, vfwsub_wf_h, WOP_WUUU_H, H4, H2, vfwsubw16)
 RVVCALL(OPFVF2, vfwsub_wf_w, WOP_WUUU_W, H8, H4, vfwsubw32)
-GEN_VEXT_VF(vfwsub_wf_h, 2, 4)
-GEN_VEXT_VF(vfwsub_wf_w, 4, 8)
+GEN_VEXT_VF(vfwsub_wf_h)
+GEN_VEXT_VF(vfwsub_wf_w)
=20
 /* Vector Single-Width Floating-Point Multiply/Divide Instructions */
 RVVCALL(OPFVV2, vfmul_vv_h, OP_UUU_H, H2, H2, H2, float16_mul)
 RVVCALL(OPFVV2, vfmul_vv_w, OP_UUU_W, H4, H4, H4, float32_mul)
 RVVCALL(OPFVV2, vfmul_vv_d, OP_UUU_D, H8, H8, H8, float64_mul)
-GEN_VEXT_VV_ENV(vfmul_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfmul_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfmul_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfmul_vv_h)
+GEN_VEXT_VV_ENV(vfmul_vv_w)
+GEN_VEXT_VV_ENV(vfmul_vv_d)
 RVVCALL(OPFVF2, vfmul_vf_h, OP_UUU_H, H2, H2, float16_mul)
 RVVCALL(OPFVF2, vfmul_vf_w, OP_UUU_W, H4, H4, float32_mul)
 RVVCALL(OPFVF2, vfmul_vf_d, OP_UUU_D, H8, H8, float64_mul)
-GEN_VEXT_VF(vfmul_vf_h, 2, 2)
-GEN_VEXT_VF(vfmul_vf_w, 4, 4)
-GEN_VEXT_VF(vfmul_vf_d, 8, 8)
+GEN_VEXT_VF(vfmul_vf_h)
+GEN_VEXT_VF(vfmul_vf_w)
+GEN_VEXT_VF(vfmul_vf_d)
=20
 RVVCALL(OPFVV2, vfdiv_vv_h, OP_UUU_H, H2, H2, H2, float16_div)
 RVVCALL(OPFVV2, vfdiv_vv_w, OP_UUU_W, H4, H4, H4, float32_div)
 RVVCALL(OPFVV2, vfdiv_vv_d, OP_UUU_D, H8, H8, H8, float64_div)
-GEN_VEXT_VV_ENV(vfdiv_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfdiv_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfdiv_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfdiv_vv_h)
+GEN_VEXT_VV_ENV(vfdiv_vv_w)
+GEN_VEXT_VV_ENV(vfdiv_vv_d)
 RVVCALL(OPFVF2, vfdiv_vf_h, OP_UUU_H, H2, H2, float16_div)
 RVVCALL(OPFVF2, vfdiv_vf_w, OP_UUU_W, H4, H4, float32_div)
 RVVCALL(OPFVF2, vfdiv_vf_d, OP_UUU_D, H8, H8, float64_div)
-GEN_VEXT_VF(vfdiv_vf_h, 2, 2)
-GEN_VEXT_VF(vfdiv_vf_w, 4, 4)
-GEN_VEXT_VF(vfdiv_vf_d, 8, 8)
+GEN_VEXT_VF(vfdiv_vf_h)
+GEN_VEXT_VF(vfdiv_vf_w)
+GEN_VEXT_VF(vfdiv_vf_d)
=20
 static uint16_t float16_rdiv(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3027,9 +3025,9 @@ static uint64_t float64_rdiv(uint64_t a, uint64_t b, fl=
oat_status *s)
 RVVCALL(OPFVF2, vfrdiv_vf_h, OP_UUU_H, H2, H2, float16_rdiv)
 RVVCALL(OPFVF2, vfrdiv_vf_w, OP_UUU_W, H4, H4, float32_rdiv)
 RVVCALL(OPFVF2, vfrdiv_vf_d, OP_UUU_D, H8, H8, float64_rdiv)
-GEN_VEXT_VF(vfrdiv_vf_h, 2, 2)
-GEN_VEXT_VF(vfrdiv_vf_w, 4, 4)
-GEN_VEXT_VF(vfrdiv_vf_d, 8, 8)
+GEN_VEXT_VF(vfrdiv_vf_h)
+GEN_VEXT_VF(vfrdiv_vf_w)
+GEN_VEXT_VF(vfrdiv_vf_d)
=20
 /* Vector Widening Floating-Point Multiply */
 static uint32_t vfwmul16(uint16_t a, uint16_t b, float_status *s)
@@ -3046,12 +3044,12 @@ static uint64_t vfwmul32(uint32_t a, uint32_t b, floa=
t_status *s)
 }
 RVVCALL(OPFVV2, vfwmul_vv_h, WOP_UUU_H, H4, H2, H2, vfwmul16)
 RVVCALL(OPFVV2, vfwmul_vv_w, WOP_UUU_W, H8, H4, H4, vfwmul32)
-GEN_VEXT_VV_ENV(vfwmul_vv_h, 2, 4)
-GEN_VEXT_VV_ENV(vfwmul_vv_w, 4, 8)
+GEN_VEXT_VV_ENV(vfwmul_vv_h)
+GEN_VEXT_VV_ENV(vfwmul_vv_w)
 RVVCALL(OPFVF2, vfwmul_vf_h, WOP_UUU_H, H4, H2, vfwmul16)
 RVVCALL(OPFVF2, vfwmul_vf_w, WOP_UUU_W, H8, H4, vfwmul32)
-GEN_VEXT_VF(vfwmul_vf_h, 2, 4)
-GEN_VEXT_VF(vfwmul_vf_w, 4, 8)
+GEN_VEXT_VF(vfwmul_vf_h)
+GEN_VEXT_VF(vfwmul_vf_w)
=20
 /* Vector Single-Width Floating-Point Fused Multiply-Add Instructions */
 #define OPFVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)       \
@@ -3082,9 +3080,9 @@ static uint64_t fmacc64(uint64_t a, uint64_t b, uint64_=
t d, float_status *s)
 RVVCALL(OPFVV3, vfmacc_vv_h, OP_UUU_H, H2, H2, H2, fmacc16)
 RVVCALL(OPFVV3, vfmacc_vv_w, OP_UUU_W, H4, H4, H4, fmacc32)
 RVVCALL(OPFVV3, vfmacc_vv_d, OP_UUU_D, H8, H8, H8, fmacc64)
-GEN_VEXT_VV_ENV(vfmacc_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfmacc_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfmacc_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfmacc_vv_h)
+GEN_VEXT_VV_ENV(vfmacc_vv_w)
+GEN_VEXT_VV_ENV(vfmacc_vv_d)
=20
 #define OPFVF3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)           \
 static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i,    \
@@ -3098,9 +3096,9 @@ static void do_##NAME(void *vd, uint64_t s1, void *vs2,=
 int i,    \
 RVVCALL(OPFVF3, vfmacc_vf_h, OP_UUU_H, H2, H2, fmacc16)
 RVVCALL(OPFVF3, vfmacc_vf_w, OP_UUU_W, H4, H4, fmacc32)
 RVVCALL(OPFVF3, vfmacc_vf_d, OP_UUU_D, H8, H8, fmacc64)
-GEN_VEXT_VF(vfmacc_vf_h, 2, 2)
-GEN_VEXT_VF(vfmacc_vf_w, 4, 4)
-GEN_VEXT_VF(vfmacc_vf_d, 8, 8)
+GEN_VEXT_VF(vfmacc_vf_h)
+GEN_VEXT_VF(vfmacc_vf_w)
+GEN_VEXT_VF(vfmacc_vf_d)
=20
 static uint16_t fnmacc16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3123,15 +3121,15 @@ static uint64_t fnmacc64(uint64_t a, uint64_t b, uint=
64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmacc_vv_h, OP_UUU_H, H2, H2, H2, fnmacc16)
 RVVCALL(OPFVV3, vfnmacc_vv_w, OP_UUU_W, H4, H4, H4, fnmacc32)
 RVVCALL(OPFVV3, vfnmacc_vv_d, OP_UUU_D, H8, H8, H8, fnmacc64)
-GEN_VEXT_VV_ENV(vfnmacc_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfnmacc_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfnmacc_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfnmacc_vv_h)
+GEN_VEXT_VV_ENV(vfnmacc_vv_w)
+GEN_VEXT_VV_ENV(vfnmacc_vv_d)
 RVVCALL(OPFVF3, vfnmacc_vf_h, OP_UUU_H, H2, H2, fnmacc16)
 RVVCALL(OPFVF3, vfnmacc_vf_w, OP_UUU_W, H4, H4, fnmacc32)
 RVVCALL(OPFVF3, vfnmacc_vf_d, OP_UUU_D, H8, H8, fnmacc64)
-GEN_VEXT_VF(vfnmacc_vf_h, 2, 2)
-GEN_VEXT_VF(vfnmacc_vf_w, 4, 4)
-GEN_VEXT_VF(vfnmacc_vf_d, 8, 8)
+GEN_VEXT_VF(vfnmacc_vf_h)
+GEN_VEXT_VF(vfnmacc_vf_w)
+GEN_VEXT_VF(vfnmacc_vf_d)
=20
 static uint16_t fmsac16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3151,15 +3149,15 @@ static uint64_t fmsac64(uint64_t a, uint64_t b, uint6=
4_t d, float_status *s)
 RVVCALL(OPFVV3, vfmsac_vv_h, OP_UUU_H, H2, H2, H2, fmsac16)
 RVVCALL(OPFVV3, vfmsac_vv_w, OP_UUU_W, H4, H4, H4, fmsac32)
 RVVCALL(OPFVV3, vfmsac_vv_d, OP_UUU_D, H8, H8, H8, fmsac64)
-GEN_VEXT_VV_ENV(vfmsac_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfmsac_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfmsac_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfmsac_vv_h)
+GEN_VEXT_VV_ENV(vfmsac_vv_w)
+GEN_VEXT_VV_ENV(vfmsac_vv_d)
 RVVCALL(OPFVF3, vfmsac_vf_h, OP_UUU_H, H2, H2, fmsac16)
 RVVCALL(OPFVF3, vfmsac_vf_w, OP_UUU_W, H4, H4, fmsac32)
 RVVCALL(OPFVF3, vfmsac_vf_d, OP_UUU_D, H8, H8, fmsac64)
-GEN_VEXT_VF(vfmsac_vf_h, 2, 2)
-GEN_VEXT_VF(vfmsac_vf_w, 4, 4)
-GEN_VEXT_VF(vfmsac_vf_d, 8, 8)
+GEN_VEXT_VF(vfmsac_vf_h)
+GEN_VEXT_VF(vfmsac_vf_w)
+GEN_VEXT_VF(vfmsac_vf_d)
=20
 static uint16_t fnmsac16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3179,15 +3177,15 @@ static uint64_t fnmsac64(uint64_t a, uint64_t b, uint=
64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmsac_vv_h, OP_UUU_H, H2, H2, H2, fnmsac16)
 RVVCALL(OPFVV3, vfnmsac_vv_w, OP_UUU_W, H4, H4, H4, fnmsac32)
 RVVCALL(OPFVV3, vfnmsac_vv_d, OP_UUU_D, H8, H8, H8, fnmsac64)
-GEN_VEXT_VV_ENV(vfnmsac_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfnmsac_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfnmsac_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfnmsac_vv_h)
+GEN_VEXT_VV_ENV(vfnmsac_vv_w)
+GEN_VEXT_VV_ENV(vfnmsac_vv_d)
 RVVCALL(OPFVF3, vfnmsac_vf_h, OP_UUU_H, H2, H2, fnmsac16)
 RVVCALL(OPFVF3, vfnmsac_vf_w, OP_UUU_W, H4, H4, fnmsac32)
 RVVCALL(OPFVF3, vfnmsac_vf_d, OP_UUU_D, H8, H8, fnmsac64)
-GEN_VEXT_VF(vfnmsac_vf_h, 2, 2)
-GEN_VEXT_VF(vfnmsac_vf_w, 4, 4)
-GEN_VEXT_VF(vfnmsac_vf_d, 8, 8)
+GEN_VEXT_VF(vfnmsac_vf_h)
+GEN_VEXT_VF(vfnmsac_vf_w)
+GEN_VEXT_VF(vfnmsac_vf_d)
=20
 static uint16_t fmadd16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3207,15 +3205,15 @@ static uint64_t fmadd64(uint64_t a, uint64_t b, uint6=
4_t d, float_status *s)
 RVVCALL(OPFVV3, vfmadd_vv_h, OP_UUU_H, H2, H2, H2, fmadd16)
 RVVCALL(OPFVV3, vfmadd_vv_w, OP_UUU_W, H4, H4, H4, fmadd32)
 RVVCALL(OPFVV3, vfmadd_vv_d, OP_UUU_D, H8, H8, H8, fmadd64)
-GEN_VEXT_VV_ENV(vfmadd_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfmadd_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfmadd_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfmadd_vv_h)
+GEN_VEXT_VV_ENV(vfmadd_vv_w)
+GEN_VEXT_VV_ENV(vfmadd_vv_d)
 RVVCALL(OPFVF3, vfmadd_vf_h, OP_UUU_H, H2, H2, fmadd16)
 RVVCALL(OPFVF3, vfmadd_vf_w, OP_UUU_W, H4, H4, fmadd32)
 RVVCALL(OPFVF3, vfmadd_vf_d, OP_UUU_D, H8, H8, fmadd64)
-GEN_VEXT_VF(vfmadd_vf_h, 2, 2)
-GEN_VEXT_VF(vfmadd_vf_w, 4, 4)
-GEN_VEXT_VF(vfmadd_vf_d, 8, 8)
+GEN_VEXT_VF(vfmadd_vf_h)
+GEN_VEXT_VF(vfmadd_vf_w)
+GEN_VEXT_VF(vfmadd_vf_d)
=20
 static uint16_t fnmadd16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3238,15 +3236,15 @@ static uint64_t fnmadd64(uint64_t a, uint64_t b, uint=
64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmadd_vv_h, OP_UUU_H, H2, H2, H2, fnmadd16)
 RVVCALL(OPFVV3, vfnmadd_vv_w, OP_UUU_W, H4, H4, H4, fnmadd32)
 RVVCALL(OPFVV3, vfnmadd_vv_d, OP_UUU_D, H8, H8, H8, fnmadd64)
-GEN_VEXT_VV_ENV(vfnmadd_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfnmadd_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfnmadd_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfnmadd_vv_h)
+GEN_VEXT_VV_ENV(vfnmadd_vv_w)
+GEN_VEXT_VV_ENV(vfnmadd_vv_d)
 RVVCALL(OPFVF3, vfnmadd_vf_h, OP_UUU_H, H2, H2, fnmadd16)
 RVVCALL(OPFVF3, vfnmadd_vf_w, OP_UUU_W, H4, H4, fnmadd32)
 RVVCALL(OPFVF3, vfnmadd_vf_d, OP_UUU_D, H8, H8, fnmadd64)
-GEN_VEXT_VF(vfnmadd_vf_h, 2, 2)
-GEN_VEXT_VF(vfnmadd_vf_w, 4, 4)
-GEN_VEXT_VF(vfnmadd_vf_d, 8, 8)
+GEN_VEXT_VF(vfnmadd_vf_h)
+GEN_VEXT_VF(vfnmadd_vf_w)
+GEN_VEXT_VF(vfnmadd_vf_d)
=20
 static uint16_t fmsub16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3266,15 +3264,15 @@ static uint64_t fmsub64(uint64_t a, uint64_t b, uint6=
4_t d, float_status *s)
 RVVCALL(OPFVV3, vfmsub_vv_h, OP_UUU_H, H2, H2, H2, fmsub16)
 RVVCALL(OPFVV3, vfmsub_vv_w, OP_UUU_W, H4, H4, H4, fmsub32)
 RVVCALL(OPFVV3, vfmsub_vv_d, OP_UUU_D, H8, H8, H8, fmsub64)
-GEN_VEXT_VV_ENV(vfmsub_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfmsub_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfmsub_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfmsub_vv_h)
+GEN_VEXT_VV_ENV(vfmsub_vv_w)
+GEN_VEXT_VV_ENV(vfmsub_vv_d)
 RVVCALL(OPFVF3, vfmsub_vf_h, OP_UUU_H, H2, H2, fmsub16)
 RVVCALL(OPFVF3, vfmsub_vf_w, OP_UUU_W, H4, H4, fmsub32)
 RVVCALL(OPFVF3, vfmsub_vf_d, OP_UUU_D, H8, H8, fmsub64)
-GEN_VEXT_VF(vfmsub_vf_h, 2, 2)
-GEN_VEXT_VF(vfmsub_vf_w, 4, 4)
-GEN_VEXT_VF(vfmsub_vf_d, 8, 8)
+GEN_VEXT_VF(vfmsub_vf_h)
+GEN_VEXT_VF(vfmsub_vf_w)
+GEN_VEXT_VF(vfmsub_vf_d)
=20
 static uint16_t fnmsub16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3294,15 +3292,15 @@ static uint64_t fnmsub64(uint64_t a, uint64_t b, uint=
64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmsub_vv_h, OP_UUU_H, H2, H2, H2, fnmsub16)
 RVVCALL(OPFVV3, vfnmsub_vv_w, OP_UUU_W, H4, H4, H4, fnmsub32)
 RVVCALL(OPFVV3, vfnmsub_vv_d, OP_UUU_D, H8, H8, H8, fnmsub64)
-GEN_VEXT_VV_ENV(vfnmsub_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfnmsub_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfnmsub_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfnmsub_vv_h)
+GEN_VEXT_VV_ENV(vfnmsub_vv_w)
+GEN_VEXT_VV_ENV(vfnmsub_vv_d)
 RVVCALL(OPFVF3, vfnmsub_vf_h, OP_UUU_H, H2, H2, fnmsub16)
 RVVCALL(OPFVF3, vfnmsub_vf_w, OP_UUU_W, H4, H4, fnmsub32)
 RVVCALL(OPFVF3, vfnmsub_vf_d, OP_UUU_D, H8, H8, fnmsub64)
-GEN_VEXT_VF(vfnmsub_vf_h, 2, 2)
-GEN_VEXT_VF(vfnmsub_vf_w, 4, 4)
-GEN_VEXT_VF(vfnmsub_vf_d, 8, 8)
+GEN_VEXT_VF(vfnmsub_vf_h)
+GEN_VEXT_VF(vfnmsub_vf_w)
+GEN_VEXT_VF(vfnmsub_vf_d)
=20
 /* Vector Widening Floating-Point Fused Multiply-Add Instructions */
 static uint32_t fwmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
@@ -3319,12 +3317,12 @@ static uint64_t fwmacc32(uint32_t a, uint32_t b, uint=
64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwmacc16)
 RVVCALL(OPFVV3, vfwmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwmacc32)
-GEN_VEXT_VV_ENV(vfwmacc_vv_h, 2, 4)
-GEN_VEXT_VV_ENV(vfwmacc_vv_w, 4, 8)
+GEN_VEXT_VV_ENV(vfwmacc_vv_h)
+GEN_VEXT_VV_ENV(vfwmacc_vv_w)
 RVVCALL(OPFVF3, vfwmacc_vf_h, WOP_UUU_H, H4, H2, fwmacc16)
 RVVCALL(OPFVF3, vfwmacc_vf_w, WOP_UUU_W, H8, H4, fwmacc32)
-GEN_VEXT_VF(vfwmacc_vf_h, 2, 4)
-GEN_VEXT_VF(vfwmacc_vf_w, 4, 8)
+GEN_VEXT_VF(vfwmacc_vf_h)
+GEN_VEXT_VF(vfwmacc_vf_w)
=20
 static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *=
s)
 {
@@ -3342,12 +3340,12 @@ static uint64_t fwnmacc32(uint32_t a, uint32_t b, uin=
t64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwnmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwnmacc16)
 RVVCALL(OPFVV3, vfwnmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwnmacc32)
-GEN_VEXT_VV_ENV(vfwnmacc_vv_h, 2, 4)
-GEN_VEXT_VV_ENV(vfwnmacc_vv_w, 4, 8)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_h)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_w)
 RVVCALL(OPFVF3, vfwnmacc_vf_h, WOP_UUU_H, H4, H2, fwnmacc16)
 RVVCALL(OPFVF3, vfwnmacc_vf_w, WOP_UUU_W, H8, H4, fwnmacc32)
-GEN_VEXT_VF(vfwnmacc_vf_h, 2, 4)
-GEN_VEXT_VF(vfwnmacc_vf_w, 4, 8)
+GEN_VEXT_VF(vfwnmacc_vf_h)
+GEN_VEXT_VF(vfwnmacc_vf_w)
=20
 static uint32_t fwmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
 {
@@ -3365,12 +3363,12 @@ static uint64_t fwmsac32(uint32_t a, uint32_t b, uint=
64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwmsac16)
 RVVCALL(OPFVV3, vfwmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwmsac32)
-GEN_VEXT_VV_ENV(vfwmsac_vv_h, 2, 4)
-GEN_VEXT_VV_ENV(vfwmsac_vv_w, 4, 8)
+GEN_VEXT_VV_ENV(vfwmsac_vv_h)
+GEN_VEXT_VV_ENV(vfwmsac_vv_w)
 RVVCALL(OPFVF3, vfwmsac_vf_h, WOP_UUU_H, H4, H2, fwmsac16)
 RVVCALL(OPFVF3, vfwmsac_vf_w, WOP_UUU_W, H8, H4, fwmsac32)
-GEN_VEXT_VF(vfwmsac_vf_h, 2, 4)
-GEN_VEXT_VF(vfwmsac_vf_w, 4, 8)
+GEN_VEXT_VF(vfwmsac_vf_h)
+GEN_VEXT_VF(vfwmsac_vf_w)
=20
 static uint32_t fwnmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *=
s)
 {
@@ -3388,12 +3386,12 @@ static uint64_t fwnmsac32(uint32_t a, uint32_t b, uin=
t64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwnmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwnmsac16)
 RVVCALL(OPFVV3, vfwnmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwnmsac32)
-GEN_VEXT_VV_ENV(vfwnmsac_vv_h, 2, 4)
-GEN_VEXT_VV_ENV(vfwnmsac_vv_w, 4, 8)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_h)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_w)
 RVVCALL(OPFVF3, vfwnmsac_vf_h, WOP_UUU_H, H4, H2, fwnmsac16)
 RVVCALL(OPFVF3, vfwnmsac_vf_w, WOP_UUU_W, H8, H4, fwnmsac32)
-GEN_VEXT_VF(vfwnmsac_vf_h, 2, 4)
-GEN_VEXT_VF(vfwnmsac_vf_w, 4, 8)
+GEN_VEXT_VF(vfwnmsac_vf_h)
+GEN_VEXT_VF(vfwnmsac_vf_w)
=20
 /* Vector Floating-Point Square-Root Instruction */
 /* (TD, T2, TX2) */
@@ -3409,7 +3407,7 @@ static void do_##NAME(void *vd, void *vs2, int i,      \
     *((TD *)vd + HD(i)) =3D OP(s2, &env->fp_status);     \
 }
=20
-#define GEN_VEXT_V_ENV(NAME, ESZ, DSZ)                 \
+#define GEN_VEXT_V_ENV(NAME)                           \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
         CPURISCVState *env, uint32_t desc)             \
 {                                                      \
@@ -3432,9 +3430,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
 RVVCALL(OPFVV1, vfsqrt_v_h, OP_UU_H, H2, H2, float16_sqrt)
 RVVCALL(OPFVV1, vfsqrt_v_w, OP_UU_W, H4, H4, float32_sqrt)
 RVVCALL(OPFVV1, vfsqrt_v_d, OP_UU_D, H8, H8, float64_sqrt)
-GEN_VEXT_V_ENV(vfsqrt_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4)
-GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8)
+GEN_VEXT_V_ENV(vfsqrt_v_h)
+GEN_VEXT_V_ENV(vfsqrt_v_w)
+GEN_VEXT_V_ENV(vfsqrt_v_d)
=20
 /*
  * Vector Floating-Point Reciprocal Square-Root Estimate Instruction
@@ -3614,9 +3612,9 @@ static float64 frsqrt7_d(float64 f, float_status *s)
 RVVCALL(OPFVV1, vfrsqrt7_v_h, OP_UU_H, H2, H2, frsqrt7_h)
 RVVCALL(OPFVV1, vfrsqrt7_v_w, OP_UU_W, H4, H4, frsqrt7_s)
 RVVCALL(OPFVV1, vfrsqrt7_v_d, OP_UU_D, H8, H8, frsqrt7_d)
-GEN_VEXT_V_ENV(vfrsqrt7_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfrsqrt7_v_w, 4, 4)
-GEN_VEXT_V_ENV(vfrsqrt7_v_d, 8, 8)
+GEN_VEXT_V_ENV(vfrsqrt7_v_h)
+GEN_VEXT_V_ENV(vfrsqrt7_v_w)
+GEN_VEXT_V_ENV(vfrsqrt7_v_d)
=20
 /*
  * Vector Floating-Point Reciprocal Estimate Instruction
@@ -3805,36 +3803,36 @@ static float64 frec7_d(float64 f, float_status *s)
 RVVCALL(OPFVV1, vfrec7_v_h, OP_UU_H, H2, H2, frec7_h)
 RVVCALL(OPFVV1, vfrec7_v_w, OP_UU_W, H4, H4, frec7_s)
 RVVCALL(OPFVV1, vfrec7_v_d, OP_UU_D, H8, H8, frec7_d)
-GEN_VEXT_V_ENV(vfrec7_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfrec7_v_w, 4, 4)
-GEN_VEXT_V_ENV(vfrec7_v_d, 8, 8)
+GEN_VEXT_V_ENV(vfrec7_v_h)
+GEN_VEXT_V_ENV(vfrec7_v_w)
+GEN_VEXT_V_ENV(vfrec7_v_d)
=20
 /* Vector Floating-Point MIN/MAX Instructions */
 RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number)
 RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number)
 RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minimum_number)
-GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfmin_vv_h)
+GEN_VEXT_VV_ENV(vfmin_vv_w)
+GEN_VEXT_VV_ENV(vfmin_vv_d)
 RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minimum_number)
 RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minimum_number)
 RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minimum_number)
-GEN_VEXT_VF(vfmin_vf_h, 2, 2)
-GEN_VEXT_VF(vfmin_vf_w, 4, 4)
-GEN_VEXT_VF(vfmin_vf_d, 8, 8)
+GEN_VEXT_VF(vfmin_vf_h)
+GEN_VEXT_VF(vfmin_vf_w)
+GEN_VEXT_VF(vfmin_vf_d)
=20
 RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maximum_number)
 RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maximum_number)
 RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maximum_number)
-GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfmax_vv_h)
+GEN_VEXT_VV_ENV(vfmax_vv_w)
+GEN_VEXT_VV_ENV(vfmax_vv_d)
 RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maximum_number)
 RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maximum_number)
 RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maximum_number)
-GEN_VEXT_VF(vfmax_vf_h, 2, 2)
-GEN_VEXT_VF(vfmax_vf_w, 4, 4)
-GEN_VEXT_VF(vfmax_vf_d, 8, 8)
+GEN_VEXT_VF(vfmax_vf_h)
+GEN_VEXT_VF(vfmax_vf_w)
+GEN_VEXT_VF(vfmax_vf_d)
=20
 /* Vector Floating-Point Sign-Injection Instructions */
 static uint16_t fsgnj16(uint16_t a, uint16_t b, float_status *s)
@@ -3855,15 +3853,15 @@ static uint64_t fsgnj64(uint64_t a, uint64_t b, float=
_status *s)
 RVVCALL(OPFVV2, vfsgnj_vv_h, OP_UUU_H, H2, H2, H2, fsgnj16)
 RVVCALL(OPFVV2, vfsgnj_vv_w, OP_UUU_W, H4, H4, H4, fsgnj32)
 RVVCALL(OPFVV2, vfsgnj_vv_d, OP_UUU_D, H8, H8, H8, fsgnj64)
-GEN_VEXT_VV_ENV(vfsgnj_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfsgnj_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfsgnj_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfsgnj_vv_h)
+GEN_VEXT_VV_ENV(vfsgnj_vv_w)
+GEN_VEXT_VV_ENV(vfsgnj_vv_d)
 RVVCALL(OPFVF2, vfsgnj_vf_h, OP_UUU_H, H2, H2, fsgnj16)
 RVVCALL(OPFVF2, vfsgnj_vf_w, OP_UUU_W, H4, H4, fsgnj32)
 RVVCALL(OPFVF2, vfsgnj_vf_d, OP_UUU_D, H8, H8, fsgnj64)
-GEN_VEXT_VF(vfsgnj_vf_h, 2, 2)
-GEN_VEXT_VF(vfsgnj_vf_w, 4, 4)
-GEN_VEXT_VF(vfsgnj_vf_d, 8, 8)
+GEN_VEXT_VF(vfsgnj_vf_h)
+GEN_VEXT_VF(vfsgnj_vf_w)
+GEN_VEXT_VF(vfsgnj_vf_d)
=20
 static uint16_t fsgnjn16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3883,15 +3881,15 @@ static uint64_t fsgnjn64(uint64_t a, uint64_t b, floa=
t_status *s)
 RVVCALL(OPFVV2, vfsgnjn_vv_h, OP_UUU_H, H2, H2, H2, fsgnjn16)
 RVVCALL(OPFVV2, vfsgnjn_vv_w, OP_UUU_W, H4, H4, H4, fsgnjn32)
 RVVCALL(OPFVV2, vfsgnjn_vv_d, OP_UUU_D, H8, H8, H8, fsgnjn64)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_h)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_w)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_d)
 RVVCALL(OPFVF2, vfsgnjn_vf_h, OP_UUU_H, H2, H2, fsgnjn16)
 RVVCALL(OPFVF2, vfsgnjn_vf_w, OP_UUU_W, H4, H4, fsgnjn32)
 RVVCALL(OPFVF2, vfsgnjn_vf_d, OP_UUU_D, H8, H8, fsgnjn64)
-GEN_VEXT_VF(vfsgnjn_vf_h, 2, 2)
-GEN_VEXT_VF(vfsgnjn_vf_w, 4, 4)
-GEN_VEXT_VF(vfsgnjn_vf_d, 8, 8)
+GEN_VEXT_VF(vfsgnjn_vf_h)
+GEN_VEXT_VF(vfsgnjn_vf_w)
+GEN_VEXT_VF(vfsgnjn_vf_d)
=20
 static uint16_t fsgnjx16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3911,15 +3909,15 @@ static uint64_t fsgnjx64(uint64_t a, uint64_t b, floa=
t_status *s)
 RVVCALL(OPFVV2, vfsgnjx_vv_h, OP_UUU_H, H2, H2, H2, fsgnjx16)
 RVVCALL(OPFVV2, vfsgnjx_vv_w, OP_UUU_W, H4, H4, H4, fsgnjx32)
 RVVCALL(OPFVV2, vfsgnjx_vv_d, OP_UUU_D, H8, H8, H8, fsgnjx64)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_h, 2, 2)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_w, 4, 4)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_d, 8, 8)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_h)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_w)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_d)
 RVVCALL(OPFVF2, vfsgnjx_vf_h, OP_UUU_H, H2, H2, fsgnjx16)
 RVVCALL(OPFVF2, vfsgnjx_vf_w, OP_UUU_W, H4, H4, fsgnjx32)
 RVVCALL(OPFVF2, vfsgnjx_vf_d, OP_UUU_D, H8, H8, fsgnjx64)
-GEN_VEXT_VF(vfsgnjx_vf_h, 2, 2)
-GEN_VEXT_VF(vfsgnjx_vf_w, 4, 4)
-GEN_VEXT_VF(vfsgnjx_vf_d, 8, 8)
+GEN_VEXT_VF(vfsgnjx_vf_h)
+GEN_VEXT_VF(vfsgnjx_vf_w)
+GEN_VEXT_VF(vfsgnjx_vf_d)
=20
 /* Vector Floating-Point Compare Instructions */
 #define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)            \
@@ -4063,7 +4061,7 @@ static void do_##NAME(void *vd, void *vs2, int i)      \
     *((TD *)vd + HD(i)) =3D OP(s2);                      \
 }
=20
-#define GEN_VEXT_V(NAME, ESZ, DSZ)                     \
+#define GEN_VEXT_V(NAME)                               \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
                   CPURISCVState *env, uint32_t desc)   \
 {                                                      \
@@ -4140,9 +4138,9 @@ target_ulong fclass_d(uint64_t frs1)
 RVVCALL(OPIVV1, vfclass_v_h, OP_UU_H, H2, H2, fclass_h)
 RVVCALL(OPIVV1, vfclass_v_w, OP_UU_W, H4, H4, fclass_s)
 RVVCALL(OPIVV1, vfclass_v_d, OP_UU_D, H8, H8, fclass_d)
-GEN_VEXT_V(vfclass_v_h, 2, 2)
-GEN_VEXT_V(vfclass_v_w, 4, 4)
-GEN_VEXT_V(vfclass_v_d, 8, 8)
+GEN_VEXT_V(vfclass_v_h)
+GEN_VEXT_V(vfclass_v_w)
+GEN_VEXT_V(vfclass_v_d)
=20
 /* Vector Floating-Point Merge Instruction */
 #define GEN_VFMERGE_VF(NAME, ETYPE, H)                        \
@@ -4170,33 +4168,33 @@ GEN_VFMERGE_VF(vfmerge_vfm_d, int64_t, H8)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_h, OP_UU_H, H2, H2, float16_to_uint16)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_w, OP_UU_W, H4, H4, float32_to_uint32)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_d, OP_UU_D, H8, H8, float64_to_uint64)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_w, 4, 4)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_d, 8, 8)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_h)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_w)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_d)
=20
 /* vfcvt.x.f.v vd, vs2, vm # Convert float to signed integer. */
 RVVCALL(OPFVV1, vfcvt_x_f_v_h, OP_UU_H, H2, H2, float16_to_int16)
 RVVCALL(OPFVV1, vfcvt_x_f_v_w, OP_UU_W, H4, H4, float32_to_int32)
 RVVCALL(OPFVV1, vfcvt_x_f_v_d, OP_UU_D, H8, H8, float64_to_int64)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_w, 4, 4)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_d, 8, 8)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_h)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_w)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_d)
=20
 /* vfcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to float. */
 RVVCALL(OPFVV1, vfcvt_f_xu_v_h, OP_UU_H, H2, H2, uint16_to_float16)
 RVVCALL(OPFVV1, vfcvt_f_xu_v_w, OP_UU_W, H4, H4, uint32_to_float32)
 RVVCALL(OPFVV1, vfcvt_f_xu_v_d, OP_UU_D, H8, H8, uint64_to_float64)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_w, 4, 4)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_d, 8, 8)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_h)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_w)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_d)
=20
 /* vfcvt.f.x.v vd, vs2, vm # Convert integer to float. */
 RVVCALL(OPFVV1, vfcvt_f_x_v_h, OP_UU_H, H2, H2, int16_to_float16)
 RVVCALL(OPFVV1, vfcvt_f_x_v_w, OP_UU_W, H4, H4, int32_to_float32)
 RVVCALL(OPFVV1, vfcvt_f_x_v_d, OP_UU_D, H8, H8, int64_to_float64)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_h, 2, 2)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_w, 4, 4)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_h)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_w)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_d)
=20
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
@@ -4206,30 +4204,30 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8)
 /* vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned intege=
r.*/
 RVVCALL(OPFVV1, vfwcvt_xu_f_v_h, WOP_UU_H, H4, H2, float16_to_uint32)
 RVVCALL(OPFVV1, vfwcvt_xu_f_v_w, WOP_UU_W, H8, H4, float32_to_uint64)
-GEN_VEXT_V_ENV(vfwcvt_xu_f_v_h, 2, 4)
-GEN_VEXT_V_ENV(vfwcvt_xu_f_v_w, 4, 8)
+GEN_VEXT_V_ENV(vfwcvt_xu_f_v_h)
+GEN_VEXT_V_ENV(vfwcvt_xu_f_v_w)
=20
 /* vfwcvt.x.f.v vd, vs2, vm # Convert float to double-width signed integer. =
*/
 RVVCALL(OPFVV1, vfwcvt_x_f_v_h, WOP_UU_H, H4, H2, float16_to_int32)
 RVVCALL(OPFVV1, vfwcvt_x_f_v_w, WOP_UU_W, H8, H4, float32_to_int64)
-GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 2, 4)
-GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 4, 8)
+GEN_VEXT_V_ENV(vfwcvt_x_f_v_h)
+GEN_VEXT_V_ENV(vfwcvt_x_f_v_w)
=20
 /* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width floa=
t */
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_b, WOP_UU_B, H2, H1, uint8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_b, 1, 2)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h, 2, 4)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w, 4, 8)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_b)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w)
=20
 /* vfwcvt.f.x.v vd, vs2, vm # Convert integer to double-width float. */
 RVVCALL(OPFVV1, vfwcvt_f_x_v_b, WOP_UU_B, H2, H1, int8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_h, WOP_UU_H, H4, H2, int16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_w, WOP_UU_W, H8, H4, int32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_b, 1, 2)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 2, 4)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 4, 8)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_b)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_h)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_w)
=20
 /*
  * vfwcvt.f.f.v vd, vs2, vm
@@ -4242,8 +4240,8 @@ static uint32_t vfwcvtffv16(uint16_t a, float_status *s)
=20
 RVVCALL(OPFVV1, vfwcvt_f_f_v_h, WOP_UU_H, H4, H2, vfwcvtffv16)
 RVVCALL(OPFVV1, vfwcvt_f_f_v_w, WOP_UU_W, H8, H4, float32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_f_v_h, 2, 4)
-GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8)
+GEN_VEXT_V_ENV(vfwcvt_f_f_v_h)
+GEN_VEXT_V_ENV(vfwcvt_f_f_v_w)
=20
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
@@ -4254,29 +4252,29 @@ GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8)
 RVVCALL(OPFVV1, vfncvt_xu_f_w_b, NOP_UU_B, H1, H2, float16_to_uint8)
 RVVCALL(OPFVV1, vfncvt_xu_f_w_h, NOP_UU_H, H2, H4, float32_to_uint16)
 RVVCALL(OPFVV1, vfncvt_xu_f_w_w, NOP_UU_W, H4, H8, float64_to_uint32)
-GEN_VEXT_V_ENV(vfncvt_xu_f_w_b, 1, 1)
-GEN_VEXT_V_ENV(vfncvt_xu_f_w_h, 2, 2)
-GEN_VEXT_V_ENV(vfncvt_xu_f_w_w, 4, 4)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_b)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_h)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_w)
=20
 /* vfncvt.x.f.v vd, vs2, vm # Convert double-width float to signed integer. =
*/
 RVVCALL(OPFVV1, vfncvt_x_f_w_b, NOP_UU_B, H1, H2, float16_to_int8)
 RVVCALL(OPFVV1, vfncvt_x_f_w_h, NOP_UU_H, H2, H4, float32_to_int16)
 RVVCALL(OPFVV1, vfncvt_x_f_w_w, NOP_UU_W, H4, H8, float64_to_int32)
-GEN_VEXT_V_ENV(vfncvt_x_f_w_b, 1, 1)
-GEN_VEXT_V_ENV(vfncvt_x_f_w_h, 2, 2)
-GEN_VEXT_V_ENV(vfncvt_x_f_w_w, 4, 4)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_b)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_h)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_w)
=20
 /* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to floa=
t */
 RVVCALL(OPFVV1, vfncvt_f_xu_w_h, NOP_UU_H, H2, H4, uint32_to_float16)
 RVVCALL(OPFVV1, vfncvt_f_xu_w_w, NOP_UU_W, H4, H8, uint64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_xu_w_h, 2, 2)
-GEN_VEXT_V_ENV(vfncvt_f_xu_w_w, 4, 4)
+GEN_VEXT_V_ENV(vfncvt_f_xu_w_h)
+GEN_VEXT_V_ENV(vfncvt_f_xu_w_w)
=20
 /* vfncvt.f.x.v vd, vs2, vm # Convert double-width integer to float. */
 RVVCALL(OPFVV1, vfncvt_f_x_w_h, NOP_UU_H, H2, H4, int32_to_float16)
 RVVCALL(OPFVV1, vfncvt_f_x_w_w, NOP_UU_W, H4, H8, int64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_x_w_h, 2, 2)
-GEN_VEXT_V_ENV(vfncvt_f_x_w_w, 4, 4)
+GEN_VEXT_V_ENV(vfncvt_f_x_w_h)
+GEN_VEXT_V_ENV(vfncvt_f_x_w_w)
=20
 /* vfncvt.f.f.v vd, vs2, vm # Convert double float to single-width float. */
 static uint16_t vfncvtffv16(uint32_t a, float_status *s)
@@ -4286,8 +4284,8 @@ static uint16_t vfncvtffv16(uint32_t a, float_status *s)
=20
 RVVCALL(OPFVV1, vfncvt_f_f_w_h, NOP_UU_H, H2, H4, vfncvtffv16)
 RVVCALL(OPFVV1, vfncvt_f_f_w_w, NOP_UU_W, H4, H8, float64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_f_w_h, 2, 2)
-GEN_VEXT_V_ENV(vfncvt_f_f_w_w, 4, 4)
+GEN_VEXT_V_ENV(vfncvt_f_f_w_h)
+GEN_VEXT_V_ENV(vfncvt_f_f_w_w)
=20
 /*
  *** Vector Reduction Operations
--=20
2.34.2


