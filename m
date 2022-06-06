Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny63u-00024i-3r
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny620-0001Yb-5q; Mon, 06 Jun 2022 02:16:14 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:48000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny61n-0000h4-Nw; Mon, 06 Jun 2022 02:15:57 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id CF0B311EF1E;
 Mon,  6 Jun 2022 06:15:45 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v19 02/16] target/riscv: rvv: Prune redundant access_type
 parameter passed
Message-ID: <165449614532.19704.7000832880482980398-2@git.sr.ht>
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
X-Original-Date: Thu, 12 May 2022 00:47:44 -0700
X-List-Received-Date: Mon, 06 Jun 2022 06:16:18 -0000

From: eopXD <yueh.ting.chen@gmail.com>

No functional change intended in this commit.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 85dd611cd9..60840325c4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -231,7 +231,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
                  target_ulong stride, CPURISCVState *env,
                  uint32_t desc, uint32_t vm,
                  vext_ldst_elem_fn *ldst_elem,
-                 uint32_t esz, uintptr_t ra, MMUAccessType access_type)
+                 uint32_t esz, uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
@@ -259,7 +259,7 @@ void HELPER(NAME)(void *vd, void * v0, target_ulong base,=
               \
 {                                                                       \
     uint32_t vm =3D vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      \
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      \
+                     ctzl(sizeof(ETYPE)), GETPC());                     \
 }
=20
 GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
@@ -274,7 +274,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base, =
               \
 {                                                                       \
     uint32_t vm =3D vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     \
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
+                     ctzl(sizeof(ETYPE)), GETPC());                     \
 }
=20
 GEN_VEXT_ST_STRIDE(vsse8_v,  int8_t,  ste_b)
@@ -290,7 +290,7 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
              vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
-             uintptr_t ra, MMUAccessType access_type)
+             uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
@@ -319,14 +319,14 @@ void HELPER(NAME##_mask)(void *vd, void *v0, target_ulo=
ng base,         \
 {                                                                       \
     uint32_t stride =3D vext_nf(desc) << ctzl(sizeof(ETYPE));             \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   \
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      \
+                     ctzl(sizeof(ETYPE)), GETPC());                     \
 }                                                                       \
                                                                         \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, LOAD_FN,                          \
-                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_LOAD); \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC());                \
 }
=20
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
@@ -340,14 +340,14 @@ void HELPER(NAME##_mask)(void *vd, void *v0, target_ulo=
ng base,          \
 {                                                                        \
     uint32_t stride =3D vext_nf(desc) << ctzl(sizeof(ETYPE));              \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,   \
-                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);      \
+                     ctzl(sizeof(ETYPE)), GETPC());                      \
 }                                                                        \
                                                                          \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                 \
                   CPURISCVState *env, uint32_t desc)                     \
 {                                                                        \
     vext_ldst_us(vd, base, env, desc, STORE_FN,                          \
-                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_STORE); \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC());                 \
 }
=20
 GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
@@ -364,7 +364,7 @@ void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
     /* evl =3D ceil(vl/8) */
     uint8_t evl =3D (env->vl + 7) >> 3;
     vext_ldst_us(vd, base, env, desc, lde_b,
-                 0, evl, GETPC(), MMU_DATA_LOAD);
+                 0, evl, GETPC());
 }
=20
 void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
@@ -373,7 +373,7 @@ void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
     /* evl =3D ceil(vl/8) */
     uint8_t evl =3D (env->vl + 7) >> 3;
     vext_ldst_us(vd, base, env, desc, ste_b,
-                 0, evl, GETPC(), MMU_DATA_STORE);
+                 0, evl, GETPC());
 }
=20
 /*
@@ -399,7 +399,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
                 void *vs2, CPURISCVState *env, uint32_t desc,
                 vext_get_index_addr get_index_addr,
                 vext_ldst_elem_fn *ldst_elem,
-                uint32_t esz, uintptr_t ra, MMUAccessType access_type)
+                uint32_t esz, uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
@@ -427,7 +427,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base, =
                  \
                   void *vs2, CPURISCVState *env, uint32_t desc)            \
 {                                                                          \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,                \
-                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD); \
+                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC());                \
 }
=20
 GEN_VEXT_LD_INDEX(vlxei8_8_v,   int8_t,  idx_b, lde_b)
@@ -453,7 +453,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base, =
        \
 {                                                                \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
                     STORE_FN, ctzl(sizeof(ETYPE)),               \
-                    GETPC(), MMU_DATA_STORE);                    \
+                    GETPC());                                    \
 }
=20
 GEN_VEXT_ST_INDEX(vsxei8_8_v,   int8_t,  idx_b, ste_b)
@@ -576,8 +576,7 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
  */
 static void
 vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t de=
sc,
-                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra,
-                MMUAccessType access_type)
+                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra)
 {
     uint32_t i, k, off, pos;
     uint32_t nf =3D vext_nf(desc);
@@ -612,8 +611,7 @@ void HELPER(NAME)(void *vd, target_ulong base,       \
                   CPURISCVState *env, uint32_t desc) \
 {                                                    \
     vext_ldst_whole(vd, base, env, desc, LOAD_FN,    \
-                    ctzl(sizeof(ETYPE)), GETPC(),    \
-                    MMU_DATA_LOAD);                  \
+                    ctzl(sizeof(ETYPE)), GETPC());   \
 }
=20
 GEN_VEXT_LD_WHOLE(vl1re8_v,  int8_t,  lde_b)
@@ -638,8 +636,7 @@ void HELPER(NAME)(void *vd, target_ulong base,       \
                   CPURISCVState *env, uint32_t desc) \
 {                                                    \
     vext_ldst_whole(vd, base, env, desc, STORE_FN,   \
-                    ctzl(sizeof(ETYPE)), GETPC(),    \
-                    MMU_DATA_STORE);                 \
+                    ctzl(sizeof(ETYPE)), GETPC());   \
 }
=20
 GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b)
--=20
2.34.2


