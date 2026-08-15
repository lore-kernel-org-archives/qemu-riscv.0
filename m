Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30203C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:49:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKo-0007Rh-Nd; Sat, 15 Aug 2026 15:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKk-0007No-Vw
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:23 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKi-0008MS-Hw
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:22 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2cf452def93so25197685ad.1
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823179; x=1787427979; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NpuvhGia9PKI/LebOobTv0tqzmFTpPQqmvFmsy+gO6g=;
 b=SILdjQx2MnIAWPjGx8KApbOeBXHSIG5PD5WO/uT9ixCn80NPmG6dbOMoy1WdH0TmYs
 4IDKCdR4KDrthDSyA+GdE3ZYXa7fORafp2a34JbRfu756wP/d0XTDgtuRNFaN4OMLOIZ
 /n2aQ6Qjs57fVxOViFBVvyuzj9DQRVlDuOhT5LSfnQ/Xa7aZzfqaCx5Psa5KDM5PwzUu
 xrxzlKpl1RhYrwrKDmH1KqXCquZlcXcUAYRSXEGz/KRbgr31GFKwuQP26fkApD4ZhWz3
 3j7DIo9BGi+BUMSRPcgyChaxBgIWthMQEkwxAyLId7o/n1C8SHi0iAmg8OTK2NO4l7P2
 YXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823179; x=1787427979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NpuvhGia9PKI/LebOobTv0tqzmFTpPQqmvFmsy+gO6g=;
 b=rwJ/DWdbz50nTT2BZoMowJpCB8m11aAmnJqM+Ufc8nf2jb4AyBQ97JR2DFRVuxMFCC
 qihg/bUWie1qSbv8PvZ3s+R74H5pqBJP4oYA37R5nfVxd2LI9XFlyitU9JCIC/PdRipF
 jgt9S7M+v2V+BjboJiC1n2kRO236Rw6YNgZbK9ORaaev1WK8mE8FVfBeUKb33wD3RAo+
 OrznvIi/8BaNnFY9VEUEzOLCZ/ae30mLnwQyLqUGun9txdMBsuEcv/m0KnW5Y2TQKKV0
 A1KsU4iVT+IVuIvhpFETk2TRrSS++xyK7lXJJgYY5gAqC58fEwikN4MJ6J9MofKTz4jN
 Gqzw==
X-Forwarded-Encrypted: i=1;
 AHgh+RptN/7bbQ9bEss6oJAqMLdSjM51yg6R9BQGSD79tXjl+y1ZYPxoDqmB2Sgf6x/kC0gSnK4tp8XUc79c@nongnu.org
X-Gm-Message-State: AOJu0YwxeYYAsGXd7bZAZM8XUJbBON2EdM1lm+VYmDFckiKU26SHdAyH
 G1aEZNiFTalxhjM8cFkrbZBnysDPlmuH3/rjFDLRCjmsumgu+Tk2iLjxIeBqHwyTKRQmyYKTHcN
 C4ADq
X-Gm-Gg: AR+sD11MvmCVwaqCOf00NSapAeRR8sJ6+TTTtbns6+Bobts3UVobi0M7QfZxJH42FKM
 GToUV7u5/OGKtcFNiYnllNN5QIxyubPBWCJ6YZm1aFY/SRkYiPG++m7MDVY5XrphIIgoL5rn0rb
 urXKD9Q3hMixaMZvG8UyibmVvuOVlry+4SzhZU1qs8wIRcElTXhifeY4pra75FgnQ9Grr5wcp2P
 bUXI6ijdrvywXALMa4sJ4AAjsazzoHcN0F3E0ApoiXCqd5a95I9cAIFNEJ/XVL1ahM4Ffz80Axj
 wCiFJ72VMlxy4hfSvVwyxTW9ILhToTq4xC3RGII5yzKSDrp9k+e+hZL/0P39rKhnxCIBiK5Wy6e
 jOUlyYShDsIyCtfdSg54n7F2TFfQjSIljZSV1ifromJQ6odbA/WnzVR+uhyuKicCuFuPUSs0i7C
 VGTB0TNSHRT9hTC3s43X2ocVIPuain4mn1hAUct194IkUuBIbU9kSU9t/sCN9hS+fUMTvfuOGPN
 Ass6ahiiejWYIjMpAIw
X-Received: by 2002:a17:902:e806:b0:2cc:80d6:b72 with SMTP id
 d9443c01a7336-2d3b0091b5cmr116428965ad.20.1786823179025; 
 Sat, 15 Aug 2026 12:46:19 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 19/23] target/riscv: Pass MemOpIdx to vext_ldst_elem_fn_tlb
Date: Sat, 15 Aug 2026 12:45:44 -0700
Message-ID: <20260815194549.1377505-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Avoids continually looking up mmu_index with every operation.
Allows for big-endian support with no extra effort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 91 +++++++++++++++-----------------
 1 file changed, 43 insertions(+), 48 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 9c643f60ec..473b112426 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -171,33 +171,21 @@ static inline MemOpIdx vext_oi(uint32_t desc, MemOp memop)
     return make_memop_idx(memop, FIELD_EX32(data, VDATA, MEM_IDX));
 }
 
-static inline MemOpIdx vext_make_memop_idx(CPURISCVState *env, size_t size)
-{
-    int mmu_idx = riscv_env_mmu_index(env, false);
-    MemOp memop = size_memop(size) | mo_endian_env(env);
-
-    if (!riscv_cpu_cfg(env)->ext_zicclsm) {
-        memop |= MO_ALIGN;
-    }
-
-    return make_memop_idx(memop, mmu_idx);
-}
-
 /* elements operations for load and store */
 typedef void vext_ldst_elem_fn_tlb(CPURISCVState *env, abi_ptr addr,
-                                   uint32_t idx, void *vd, uintptr_t retaddr);
+                                   uint32_t idx, void *vd,
+                                   MemOpIdx oi, uintptr_t retaddr);
 typedef void vext_ldst_elem_fn_host(void *vd, void *host,
                                     uint32_t idx, uint32_t evl);
 
-#define GEN_VEXT_TLB_LD_ELEM(NAME, ETYPE, H, LDSUF)         \
-static inline QEMU_ALWAYS_INLINE                            \
-void NAME##_tlb(CPURISCVState *env, abi_ptr addr,           \
-                uint32_t idx, void *vd, uintptr_t retaddr)  \
-{                                                           \
-    ETYPE *cur = ((ETYPE *)vd + H(idx));                    \
-    MemOpIdx oi = vext_make_memop_idx(env, sizeof(ETYPE));  \
-    *cur = cpu_##LDSUF##_mmu(env, addr, oi, retaddr);       \
-}                                                           \
+#define GEN_VEXT_TLB_LD_ELEM(NAME, ETYPE, H, LDSUF)                     \
+static inline QEMU_ALWAYS_INLINE                                        \
+void NAME##_tlb(CPURISCVState *env, abi_ptr addr, uint32_t idx,         \
+                void *vd, MemOpIdx oi, uintptr_t retaddr)               \
+{                                                                       \
+    ETYPE *cur = ((ETYPE *)vd + H(idx));                                \
+    *cur = cpu_##LDSUF##_mmu(env, addr, oi, retaddr);                   \
+}
 
 #define GEN_VEXT_HOST_LD_ELEM(NAME, ETYPE, H, LDSUF)                    \
 static inline QEMU_ALWAYS_INLINE                                        \
@@ -229,15 +217,14 @@ GEN_VEXT_HOST_LD_ELEM(lde_h, uint16_t, H2, lduw_le)
 GEN_VEXT_HOST_LD_ELEM(lde_w, uint32_t, H4, ldl_le)
 GEN_VEXT_HOST_LD_ELEM(lde_d, uint64_t, H8, ldq_le)
 
-#define GEN_VEXT_TLB_ST_ELEM(NAME, ETYPE, H, STSUF)         \
-static inline QEMU_ALWAYS_INLINE                            \
-void NAME##_tlb(CPURISCVState *env, abi_ptr addr,           \
-                uint32_t idx, void *vd, uintptr_t retaddr)  \
-{                                                           \
-    ETYPE data = *((ETYPE *)vd + H(idx));                   \
-    MemOpIdx oi = vext_make_memop_idx(env, sizeof(ETYPE));  \
-    cpu_##STSUF##_mmu(env, addr, data, oi, retaddr);        \
-}                                                           \
+#define GEN_VEXT_TLB_ST_ELEM(NAME, ETYPE, H, STSUF)                     \
+static inline QEMU_ALWAYS_INLINE                                        \
+void NAME##_tlb(CPURISCVState *env, abi_ptr addr, uint32_t idx,         \
+                void *vd, MemOpIdx oi, uintptr_t retaddr)               \
+{                                                                       \
+    ETYPE data = *((ETYPE *)vd + H(idx));                               \
+    cpu_##STSUF##_mmu(env, addr, data, oi, retaddr);                    \
+}
 
 #define GEN_VEXT_HOST_ST_ELEM(NAME, ETYPE, H, STSUF)                    \
 static inline QEMU_ALWAYS_INLINE                                        \
@@ -299,10 +286,11 @@ static void vext_ldst_nf_host(void *vd, void *host, uint32_t i, uint32_t nf,
 static void vext_ldst_nf_tlb(CPURISCVState *env, void *vd, target_ulong addr,
                              uint32_t i, uint32_t nf,
                              uint32_t esz, uint32_t max_elems,
-                             vext_ldst_elem_fn_tlb *ldst_tlb, uintptr_t ra)
+                             vext_ldst_elem_fn_tlb *ldst_tlb,
+                             MemOpIdx oi, uintptr_t ra)
 {
     for (uint32_t k = 0; k < nf; k++, addr += esz) {
-        ldst_tlb(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
+        ldst_tlb(env, adjust_addr(env, addr), i + k * max_elems, vd, oi, ra);
     }
 }
 
@@ -319,13 +307,14 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base, target_ulong stride,
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
     uint32_t vma = vext_vma(desc);
+    MemOpIdx oi = vext_oi(desc, log2_esz);
 
     VSTART_CHECK_EARLY_EXIT(env, env->vl);
 
     for (uint32_t i = env->vstart; i < env->vl; env->vstart = ++i) {
         if (vm || vext_elem_mask(v0, i)) {
             vext_ldst_nf_tlb(env, vd, base + stride * i, i, nf,
-                             esz, max_elems, ldst_elem, ra);
+                             esz, max_elems, ldst_elem, oi, ra);
         } else if (vma) {
             vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
         }
@@ -394,12 +383,13 @@ vext_page_ldst_us_tlb(CPURISCVState *env, void *vd, target_ulong addr,
                       uint32_t i, uint32_t evl, uint32_t nf,
                       uint32_t log2_esz, uint32_t max_elems,
                       vext_ldst_elem_fn_tlb *ldst_tlb,
-                      int mmu_index, uintptr_t ra)
+                      MemOpIdx oi, uintptr_t ra)
 {
     uint32_t esz = 1 << log2_esz;
     uint32_t msize = nf << log2_esz;
     do {
-        vext_ldst_nf_tlb(env, vd, addr, i, nf, esz, max_elems, ldst_tlb, ra);
+        vext_ldst_nf_tlb(env, vd, addr, i, nf, esz,
+                         max_elems, ldst_tlb, oi, ra);
         addr += msize;
         env->vstart = ++i;
     } while (i < evl);
@@ -449,7 +439,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env,
      */
     if (nf == 1 && (evl << log2_esz) <= 6) {
         for (; i < evl; env->vstart = ++i, addr += esz) {
-            ldst_tlb(env, adjust_addr(env, addr), i, vd, ra);
+            ldst_tlb(env, adjust_addr(env, addr), i, vd, oi, ra);
         }
         goto tail;
     }
@@ -478,7 +468,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env,
         } else {
             vext_page_ldst_us_tlb(env, vd, addr, i, page_evl, nf,
                                   log2_esz, max_elems,
-                                  ldst_tlb, mmu_index, ra);
+                                  ldst_tlb, oi, ra);
         }
 
         /* Usually the first page contains the entire vector. */
@@ -491,7 +481,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env,
 
     /* Cross page element */
     if (unlikely(page_split % msize)) {
-        vext_ldst_nf_tlb(env, vd, addr, i++, nf, esz, max_elems, ldst_tlb, ra);
+        vext_ldst_nf_tlb(env, vd, addr, i++, nf, esz,
+                         max_elems, ldst_tlb, oi, ra);
         if (i == evl) {
             goto tail;
         }
@@ -510,7 +501,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env,
                                log2_esz, max_elems, ldst_host);
     } else {
         vext_page_ldst_us_tlb(env, vd, addr, i, evl, nf, log2_esz, max_elems,
-                              ldst_tlb, mmu_index, ra);
+                              ldst_tlb, oi, ra);
     }
 
  tail:
@@ -630,6 +621,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
     uint32_t vma = vext_vma(desc);
+    MemOpIdx oi = vext_oi(desc, log2_esz);
 
     VSTART_CHECK_EARLY_EXIT(env, env->vl);
 
@@ -643,7 +635,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
 
         for (uint32_t k = 0; k < nf; ++k) {
             abi_ptr addr = get_index_addr(base, i, vs2) + (k << log2_esz);
-            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr),
+                      i + k * max_elems, vd, oi, ra);
         }
     }
 
@@ -762,7 +755,8 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
      * If it also crosses the page, just go ahead and load it.
      */
     if (unlikely(page_split < msize) && first_active) {
-        vext_ldst_nf_tlb(env, vd, addr, 0, nf, esz, max_elems, ldst_tlb, ra);
+        vext_ldst_nf_tlb(env, vd, addr, 0, nf, esz,
+                         max_elems, ldst_tlb, oi, ra);
         env->vstart = i = 1;
         addr += msize;
         page_split = -(addr | TARGET_PAGE_MASK);
@@ -807,7 +801,7 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
              */
             if (first_active) {
                 vext_ldst_nf_tlb(env, vd, addr, 0, nf, esz,
-                                 max_elems, ldst_tlb, ra);
+                                 max_elems, ldst_tlb, oi, ra);
                 i = 1;
                 addr += msize;
             }
@@ -822,12 +816,12 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
             if (vm) {
                 vext_page_ldst_us_tlb(env, vd, addr, i, page_evl, nf,
                                       log2_esz, max_elems,
-                                      ldst_tlb, mmu_index, ra);
+                                      ldst_tlb, oi, ra);
             } else {
                 do {
                     if (vext_elem_mask(v0, i)) {
                         vext_ldst_nf_tlb(env, vd, base + i * msize, i, nf,
-                                         esz, max_elems, ldst_tlb, ra);
+                                         esz, max_elems, ldst_tlb, oi, ra);
                     } else if (vma) {
                         vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
                     }
@@ -877,7 +871,8 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
             goto tail;
         }
 
-        vext_ldst_nf_tlb(env, vd, addr, i, nf, esz, max_elems, ldst_tlb, ra);
+        vext_ldst_nf_tlb(env, vd, addr, i, nf, esz,
+                         max_elems, ldst_tlb, oi, ra);
         if (++i == vl) {
             goto tail;
         }
@@ -918,12 +913,12 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
         if (vm) {
             vext_page_ldst_us_tlb(env, vd, addr, i, vl, nf,
                                   log2_esz, max_elems,
-                                  ldst_tlb, mmu_index, ra);
+                                  ldst_tlb, oi, ra);
         } else {
             do {
                 if (vext_elem_mask(v0, i)) {
                     vext_ldst_nf_tlb(env, vd, base + i * msize, i, nf,
-                                     esz, max_elems, ldst_tlb, ra);
+                                     esz, max_elems, ldst_tlb, oi, ra);
                 } else if (vma) {
                     vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
                 }
-- 
2.43.0


