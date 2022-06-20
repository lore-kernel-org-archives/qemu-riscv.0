Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3BFl-00024K-JS
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFd-0001ta-Ry; Mon, 20 Jun 2022 02:51:10 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:49174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFc-0004ND-99; Mon, 20 Jun 2022 02:51:09 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id B116F11EF8D;
 Mon, 20 Jun 2022 06:50:42 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v6 06/10] target/riscv: rvv: Add mask agnostic for vector
 fix-point arithmetic instructions
Message-ID: <165570784143.17634.35095816584573691-6@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165570784143.17634.35095816584573691-0@git.sr.ht>
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
Date: Mon, 20 Jun 2022 06:51:12 -0000
X-Original-Date: Thu, 17 Mar 2022 01:52:54 -0700
X-List-Received-Date: Mon, 20 Jun 2022 06:51:12 -0000

From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/vector_helper.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 07ce671879..597fa9c752 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2129,10 +2129,12 @@ static inline void
 vext_vv_rm_1(void *vd, void *v0, void *vs1, void *vs2,
              CPURISCVState *env,
              uint32_t vl, uint32_t vm, int vxrm,
-             opivv2_rm_fn *fn)
+             opivv2_rm_fn *fn, uint32_t vma, uint32_t esz)
 {
     for (uint32_t i =3D env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
             continue;
         }
         fn(vd, vs1, vs2, i, env, vxrm);
@@ -2150,23 +2152,24 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
     uint32_t vl =3D env->vl;
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
     uint32_t vta =3D vext_vta(desc);
+    uint32_t vma =3D vext_vma(desc);
=20
     switch (env->vxrm) {
     case 0: /* rnu */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, 0, fn);
+                     env, vl, vm, 0, fn, vma, esz);
         break;
     case 1: /* rne */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, 1, fn);
+                     env, vl, vm, 1, fn, vma, esz);
         break;
     case 2: /* rdn */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, 2, fn);
+                     env, vl, vm, 2, fn, vma, esz);
         break;
     default: /* rod */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, 3, fn);
+                     env, vl, vm, 3, fn, vma, esz);
         break;
     }
     /* set tail elements to 1s */
@@ -2250,10 +2253,12 @@ static inline void
 vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
              CPURISCVState *env,
              uint32_t vl, uint32_t vm, int vxrm,
-             opivx2_rm_fn *fn)
+             opivx2_rm_fn *fn, uint32_t vma, uint32_t esz)
 {
     for (uint32_t i =3D env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
             continue;
         }
         fn(vd, s1, vs2, i, env, vxrm);
@@ -2271,23 +2276,24 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, void=
 *vs2,
     uint32_t vl =3D env->vl;
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
     uint32_t vta =3D vext_vta(desc);
+    uint32_t vma =3D vext_vma(desc);
=20
     switch (env->vxrm) {
     case 0: /* rnu */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, 0, fn);
+                     env, vl, vm, 0, fn, vma, esz);
         break;
     case 1: /* rne */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, 1, fn);
+                     env, vl, vm, 1, fn, vma, esz);
         break;
     case 2: /* rdn */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, 2, fn);
+                     env, vl, vm, 2, fn, vma, esz);
         break;
     default: /* rod */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, 3, fn);
+                     env, vl, vm, 3, fn, vma, esz);
         break;
     }
     /* set tail elements to 1s */
--=20
2.34.2


