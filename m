Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny62I-0001em-4Q
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny61x-0001YZ-Vt; Mon, 06 Jun 2022 02:16:10 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:48002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny61n-0000h5-NC; Mon, 06 Jun 2022 02:15:55 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 05A8C11EF33;
 Mon,  6 Jun 2022 06:15:46 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v19 03/16] target/riscv: rvv: Rename ambiguous esz
Message-ID: <165449614532.19704.7000832880482980398-3@git.sr.ht>
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
X-Original-Date: Wed, 09 Mar 2022 00:34:29 -0800
X-List-Received-Date: Mon, 06 Jun 2022 06:16:17 -0000

From: eopXD <yueh.ting.chen@gmail.com>

No functional change intended in this commit.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 76 ++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 60840325c4..3b79b9cbc2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -125,9 +125,9 @@ static inline int32_t vext_lmul(uint32_t desc)
 /*
  * Get the maximum number of elements can be operated.
  *
- * esz: log2 of element size in bytes.
+ * log2_esz: log2 of element size in bytes.
  */
-static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
+static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
 {
     /*
      * As simd_desc support at most 2048 bytes, the max vlen is 1024 bits.
@@ -136,7 +136,7 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint=
32_t esz)
     uint32_t vlenb =3D simd_maxsz(desc);
=20
     /* Return VLMAX */
-    int scale =3D vext_lmul(desc) - esz;
+    int scale =3D vext_lmul(desc) - log2_esz;
     return scale < 0 ? vlenb >> -scale : vlenb << scale;
 }
=20
@@ -231,11 +231,11 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
                  target_ulong stride, CPURISCVState *env,
                  uint32_t desc, uint32_t vm,
                  vext_ldst_elem_fn *ldst_elem,
-                 uint32_t esz, uintptr_t ra)
+                 uint32_t log2_esz, uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
-    uint32_t max_elems =3D vext_max_elems(desc, esz);
+    uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
=20
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
@@ -244,7 +244,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
=20
         k =3D 0;
         while (k < nf) {
-            target_ulong addr =3D base + stride * i + (k << esz);
+            target_ulong addr =3D base + stride * i + (k << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra=
);
             k++;
         }
@@ -289,18 +289,18 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 /* unmasked unit-stride load and store operation*/
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
-             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
+             vext_ldst_elem_fn *ldst_elem, uint32_t log2_esz, uint32_t evl,
              uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
-    uint32_t max_elems =3D vext_max_elems(desc, esz);
+    uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < evl; i++, env->vstart++) {
         k =3D 0;
         while (k < nf) {
-            target_ulong addr =3D base + ((i * nf + k) << esz);
+            target_ulong addr =3D base + ((i * nf + k) << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra=
);
             k++;
         }
@@ -399,12 +399,12 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
                 void *vs2, CPURISCVState *env, uint32_t desc,
                 vext_get_index_addr get_index_addr,
                 vext_ldst_elem_fn *ldst_elem,
-                uint32_t esz, uintptr_t ra)
+                uint32_t log2_esz, uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
-    uint32_t max_elems =3D vext_max_elems(desc, esz);
+    uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
@@ -414,7 +414,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
=20
         k =3D 0;
         while (k < nf) {
-            abi_ptr addr =3D get_index_addr(base, i, vs2) + (k << esz);
+            abi_ptr addr =3D get_index_addr(base, i, vs2) + (k << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra=
);
             k++;
         }
@@ -480,13 +480,13 @@ static inline void
 vext_ldff(void *vd, void *v0, target_ulong base,
           CPURISCVState *env, uint32_t desc,
           vext_ldst_elem_fn *ldst_elem,
-          uint32_t esz, uintptr_t ra)
+          uint32_t log2_esz, uintptr_t ra)
 {
     void *host;
     uint32_t i, k, vl =3D 0;
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
-    uint32_t max_elems =3D vext_max_elems(desc, esz);
+    uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
     target_ulong addr, offset, remain;
=20
     /* probe every access*/
@@ -494,12 +494,12 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        addr =3D adjust_addr(env, base + i * (nf << esz));
+        addr =3D adjust_addr(env, base + i * (nf << log2_esz));
         if (i =3D=3D 0) {
-            probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
+            probe_pages(env, addr, nf << log2_esz, ra, MMU_DATA_LOAD);
         } else {
             /* if it triggers an exception, no need to check watchpoint */
-            remain =3D nf << esz;
+            remain =3D nf << log2_esz;
             while (remain > 0) {
                 offset =3D -(addr | TARGET_PAGE_MASK);
                 host =3D tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
@@ -536,7 +536,7 @@ ProbeSuccess:
             continue;
         }
         while (k < nf) {
-            target_ulong addr =3D base + ((i * nf + k) << esz);
+            target_ulong addr =3D base + ((i * nf + k) << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra=
);
             k++;
         }
@@ -576,12 +576,12 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
  */
 static void
 vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t de=
sc,
-                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra)
+                vext_ldst_elem_fn *ldst_elem, uint32_t log2_esz, uintptr_t r=
a)
 {
     uint32_t i, k, off, pos;
     uint32_t nf =3D vext_nf(desc);
     uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
-    uint32_t max_elems =3D vlenb >> esz;
+    uint32_t max_elems =3D vlenb >> log2_esz;
=20
     k =3D env->vstart / max_elems;
     off =3D env->vstart % max_elems;
@@ -589,7 +589,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVStat=
e *env, uint32_t desc,
     if (off) {
         /* load/store rest of elements of current segment pointed by vstart =
*/
         for (pos =3D off; pos < max_elems; pos++, env->vstart++) {
-            target_ulong addr =3D base + ((pos + k * max_elems) << esz);
+            target_ulong addr =3D base + ((pos + k * max_elems) << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, vd, =
ra);
         }
         k++;
@@ -598,7 +598,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVStat=
e *env, uint32_t desc,
     /* load/store elements for rest of segments */
     for (; k < nf; k++) {
         for (i =3D 0; i < max_elems; i++, env->vstart++) {
-            target_ulong addr =3D base + ((i + k * max_elems) << esz);
+            target_ulong addr =3D base + ((i + k * max_elems) << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra=
);
         }
     }
@@ -4688,11 +4688,11 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t, H2)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
=20
-#define GEN_VEXT_VSLIE1UP(ESZ, H)                                           \
-static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
-                     CPURISCVState *env, uint32_t desc)                     \
+#define GEN_VEXT_VSLIE1UP(BITWIDTH, H)                                      \
+static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
+                     void *vs2, CPURISCVState *env, uint32_t desc)          \
 {                                                                           \
-    typedef uint##ESZ##_t ETYPE;                                            \
+    typedef uint##BITWIDTH##_t ETYPE;                                       \
     uint32_t vm =3D vext_vm(desc);                                          =
  \
     uint32_t vl =3D env->vl;                                                =
  \
     uint32_t i;                                                             \
@@ -4715,11 +4715,11 @@ GEN_VEXT_VSLIE1UP(16, H2)
 GEN_VEXT_VSLIE1UP(32, H4)
 GEN_VEXT_VSLIE1UP(64, H8)
=20
-#define GEN_VEXT_VSLIDE1UP_VX(NAME, ESZ)                          \
+#define GEN_VEXT_VSLIDE1UP_VX(NAME, BITWIDTH)                     \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)              \
 {                                                                 \
-    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);                  \
+    vslide1up_##BITWIDTH(vd, v0, s1, vs2, env, desc);             \
 }
=20
 /* vslide1up.vx vd, vs2, rs1, vm # vd[0]=3Dx[rs1], vd[i+1] =3D vs2[i] */
@@ -4728,11 +4728,11 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, 16)
 GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
 GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
=20
-#define GEN_VEXT_VSLIDE1DOWN(ESZ, H)                                        =
  \
-static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2=
, \
-                       CPURISCVState *env, uint32_t desc)                   =
  \
+#define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)                                   =
  \
+static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,     =
  \
+                       void *vs2, CPURISCVState *env, uint32_t desc)        =
  \
 {                                                                           =
  \
-    typedef uint##ESZ##_t ETYPE;                                            =
  \
+    typedef uint##BITWIDTH##_t ETYPE;                                       =
  \
     uint32_t vm =3D vext_vm(desc);                                          =
    \
     uint32_t vl =3D env->vl;                                                =
    \
     uint32_t i;                                                             =
  \
@@ -4755,11 +4755,11 @@ GEN_VEXT_VSLIDE1DOWN(16, H2)
 GEN_VEXT_VSLIDE1DOWN(32, H4)
 GEN_VEXT_VSLIDE1DOWN(64, H8)
=20
-#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ESZ)                        \
+#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, BITWIDTH)                   \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)              \
 {                                                                 \
-    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);                \
+    vslide1down_##BITWIDTH(vd, v0, s1, vs2, env, desc);           \
 }
=20
 /* vslide1down.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+1], vd[vl-1]=3Dx[rs1] */
@@ -4769,11 +4769,11 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, 32)
 GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, 64)
=20
 /* Vector Floating-Point Slide Instructions */
-#define GEN_VEXT_VFSLIDE1UP_VF(NAME, ESZ)                     \
+#define GEN_VEXT_VFSLIDE1UP_VF(NAME, BITWIDTH)                \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
-    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);              \
+    vslide1up_##BITWIDTH(vd, v0, s1, vs2, env, desc);         \
 }
=20
 /* vfslide1up.vf vd, vs2, rs1, vm # vd[0]=3Df[rs1], vd[i+1] =3D vs2[i] */
@@ -4781,11 +4781,11 @@ GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_h, 16)
 GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_w, 32)
 GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_d, 64)
=20
-#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, ESZ)                   \
+#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, BITWIDTH)              \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
-    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);            \
+    vslide1down_##BITWIDTH(vd, v0, s1, vs2, env, desc);       \
 }
=20
 /* vfslide1down.vf vd, vs2, rs1, vm # vd[i] =3D vs2[i+1], vd[vl-1]=3Df[rs1] =
*/
--=20
2.34.2


