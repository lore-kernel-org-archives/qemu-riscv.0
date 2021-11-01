Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhU8l-0001mx-6c
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8j-0001do-GT; Mon, 01 Nov 2021 06:02:05 -0400
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:42975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8a-0001UQ-Hg; Mon, 01 Nov 2021 06:02:04 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00259318-2.13049e-05-0.997386;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LlcGtUT_1635760905; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlcGtUT_1635760905)
 by smtp.aliyun-inc.com(10.147.43.230);
 Mon, 01 Nov 2021 18:01:49 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 09/13] target/riscv: Adjust vector address with ol
Date: Mon,  1 Nov 2021 18:01:39 +0800
Message-Id: <20211101100143.44356-10-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 Nov 2021 10:02:06 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  8 ++++
 target/riscv/internals.h                |  1 +
 target/riscv/vector_helper.c            | 54 +++++++++++++++++--------
 3 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ed042f7bb9..5cd9b802df 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -233,6 +233,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
+    data = FIELD_DP32(data, VDATA, OL, s->ol);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s);
 }
 
@@ -286,6 +287,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
+    data = FIELD_DP32(data, VDATA, OL, s->ol);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s);
 }
 
@@ -365,6 +367,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
+    data = FIELD_DP32(data, VDATA, OL, s->ol);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
 }
 
@@ -404,6 +407,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
+    data = FIELD_DP32(data, VDATA, OL, s->ol);
     fn =  fns[seq][s->sew];
     if (fn == NULL) {
         return false;
@@ -490,6 +494,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
+    data = FIELD_DP32(data, VDATA, OL, s->ol);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
 }
 
@@ -542,6 +547,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
+    data = FIELD_DP32(data, VDATA, OL, s->ol);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
 }
 
@@ -617,6 +623,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
+    data = FIELD_DP32(data, VDATA, OL, s->ol);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
 
@@ -724,6 +731,7 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, WD, a->wd);
+    data = FIELD_DP32(data, VDATA, OL, s->ol);
     return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
 }
 /*
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b15ad394bb..f74b8291e4 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -27,6 +27,7 @@ FIELD(VDATA, VM, 8, 1)
 FIELD(VDATA, LMUL, 9, 2)
 FIELD(VDATA, NF, 11, 4)
 FIELD(VDATA, WD, 11, 1)
+FIELD(VDATA, OL, 15, 2)
 
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 535420ee66..451688c328 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -112,6 +112,11 @@ static uint32_t vext_wd(uint32_t desc)
     return (simd_data(desc) >> 11) & 0x1;
 }
 
+static inline uint32_t vext_ol(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, OL);
+}
+
 /*
  * Get vector group length in bytes. Its range is [64, 2048].
  *
@@ -123,6 +128,14 @@ static inline uint32_t vext_maxsz(uint32_t desc)
     return simd_maxsz(desc) << vext_lmul(desc);
 }
 
+static inline target_ulong adjust_addr(target_ulong addr, uint32_t olen)
+{
+    if (olen < TARGET_LONG_BITS) {
+        addr &= UINT32_MAX;
+    }
+    return addr;
+}
+
 /*
  * This function checks watchpoint before real load operation.
  *
@@ -135,17 +148,17 @@ static inline uint32_t vext_maxsz(uint32_t desc)
  */
 static void probe_pages(CPURISCVState *env, target_ulong addr,
                         target_ulong len, uintptr_t ra,
-                        MMUAccessType access_type)
+                        MMUAccessType access_type, uint32_t olen)
 {
     target_ulong pagelen = -(addr | TARGET_PAGE_MASK);
     target_ulong curlen = MIN(pagelen, len);
 
-    probe_access(env, addr, curlen, access_type,
+    probe_access(env, adjust_addr(addr, olen), curlen, access_type,
                  cpu_mmu_index(env, false), ra);
     if (len > curlen) {
         addr += curlen;
         curlen = len - curlen;
-        probe_access(env, addr, curlen, access_type,
+        probe_access(env, adjust_addr(addr, olen), curlen, access_type,
                      cpu_mmu_index(env, false), ra);
     }
 }
@@ -290,13 +303,14 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t nf = vext_nf(desc);
     uint32_t mlen = vext_mlen(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t olen = 16 << vext_ol(desc);
 
     /* probe every access*/
     for (i = 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, mlen, i)) {
             continue;
         }
-        probe_pages(env, base + stride * i, nf * msz, ra, access_type);
+        probe_pages(env, base + stride * i, nf * msz, ra, access_type, olen);
     }
     /* do real access */
     for (i = 0; i < env->vl; i++) {
@@ -306,7 +320,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             target_ulong addr = base + stride * i + k * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(addr, olen), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -391,15 +405,16 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t olen = 16 << vext_ol(desc);
 
     /* probe every access */
-    probe_pages(env, base, env->vl * nf * msz, ra, access_type);
+    probe_pages(env, base, env->vl * nf * msz, ra, access_type, olen);
     /* load bytes from guest memory */
     for (i = 0; i < env->vl; i++) {
         k = 0;
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(addr, olen), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -519,6 +534,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t mlen = vext_mlen(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t olen = 16 << vext_ol(desc);
 
     /* probe every access*/
     for (i = 0; i < env->vl; i++) {
@@ -526,7 +542,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
             continue;
         }
         probe_pages(env, get_index_addr(base, i, vs2), nf * msz, ra,
-                    access_type);
+                    access_type, olen);
     }
     /* load bytes from guest memory */
     for (i = 0; i < env->vl; i++) {
@@ -536,7 +552,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             abi_ptr addr = get_index_addr(base, i, vs2) + k * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(addr, olen), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -619,6 +635,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t olen = 16 << vext_ol(desc);
     target_ulong addr, offset, remain;
 
     /* probe every access*/
@@ -626,9 +643,9 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, mlen, i)) {
             continue;
         }
-        addr = base + nf * i * msz;
+        addr = adjust_addr(base + nf * i * msz, olen);
         if (i == 0) {
-            probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
+            probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD, olen);
         } else {
             /* if it triggers an exception, no need to check watchpoint */
             remain = nf * msz;
@@ -643,7 +660,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
                         goto ProbeSuccess;
                     }
 #else
-                    probe_pages(env, addr, offset, ra, MMU_DATA_LOAD);
+                    probe_pages(env, addr, offset, ra, MMU_DATA_LOAD, olen);
 #endif
                 } else {
                     vl = i;
@@ -653,7 +670,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
                     break;
                 }
                 remain -= offset;
-                addr += offset;
+                addr = adjust_addr(addr + offset, olen);
             }
         }
     }
@@ -669,7 +686,7 @@ ProbeSuccess:
         }
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(addr, olen), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -795,20 +812,23 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
     uint32_t vm = vext_vm(desc);
     uint32_t mlen = vext_mlen(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t olen = 16 << vext_ol(desc);
 
     for (i = 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, mlen, i)) {
             continue;
         }
-        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_LOAD);
-        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_STORE);
+        probe_pages(env, get_index_addr(base, i, vs2), msz, ra,
+                    MMU_DATA_LOAD, olen);
+        probe_pages(env, get_index_addr(base, i, vs2), msz, ra,
+                    MMU_DATA_STORE, olen);
     }
     for (i = 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, mlen, i)) {
             continue;
         }
         addr = get_index_addr(base, i, vs2);
-        noatomic_op(vs3, addr, wd, i, env, ra);
+        noatomic_op(vs3, adjust_addr(addr, olen), wd, i, env, ra);
     }
     clear_elem(vs3, env->vl, env->vl * esz, vlmax * esz);
 }
-- 
2.25.1


