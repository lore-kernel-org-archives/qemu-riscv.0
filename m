Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58299C5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:06:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUv-0006PV-4A; Fri, 21 Aug 2026 00:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUZ-00068H-Kw
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:33 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUV-0003FB-J2
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:29 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c96c92c0980so357855a12.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285064; x=1787889864; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RTJWXgQvQM7wk42NYFJf+QI6HP3tire/g0xQeY4+0Hk=;
 b=RaqA4uP8IfPI6+LWID3r4wqnZM8ZDB0/zcoWjtpvVTpIHkZXpc2pS0gzEyFaJtTOm2
 GuoywfQnbBfzP72+VcZgS3boleOJRE4UmalH3Zb454el9l3FcdHK2QestpK4FkzhC1XM
 0NrR8/Rx03+8mi7VV12S6FAreKR7zLiD4V1LcbrTjQET1PMQjc9cSb1JO79Yy7ZQzD3o
 82h4/sK8Q5F89gcYd2a8Zc9GEHul7D7PDNmE8Ag1epkAKLYvZDNzeZ9idmiqtu/hidfS
 60HPhgI3pbrEVw5cSTw57rxpbdg//7vHOdCdmoNIyRSlPTVfJ8qIXrUYtTLz8w8MOVQ8
 GluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285064; x=1787889864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RTJWXgQvQM7wk42NYFJf+QI6HP3tire/g0xQeY4+0Hk=;
 b=DFZpBlINsfUF/+OZsAty7GusI3Ldq0xRQhPG1IwzQ83n5dKZ/r/aUW7UsxdSBBvOhr
 xbeMhQiBgNQbYsO6PfgIIB0+2kFMo3npShny3dekcNq1JfyS5G9CYuPwuy0Lwg+avLbT
 E9/rVzOdcsUnPdd9DvMCMvQiDs4AphdJJ5VQkgeEAi90NAqTIzuigKom/HPPSkdU1lK/
 rmWP68u9tj2preR4U7mqXSSRLMlW/tt4GqLV87lDauSQifbkE1qBOUMBlHmOKEnbdbB0
 VjkgyETH2qy8HvFy5yWcQUtupOZpplSCo7MGX8w91TGEtoiuLQpo3UTymZ0H2xT6/tVs
 FXxw==
X-Gm-Message-State: AFuF++mYvN2cM35tsnszzie+ZchG8ahpTXM1jn5MqBhWjpWwTVeeRPd5
 EqRBi+Vtt83ooPKPdOf2CHE3UCj3hFeU3AmzpK1X2NmDRxUBjut59Ye+5bhvpVMXT5Z14rKI9at
 7xt06
X-Gm-Gg: AR+sD13QG84sSBnpxRQG7qfrpFxDyae80FQTS3fqjhBF+5MnAO6OPp9D4Gc6VcuSH9h
 HzrgAxPkfVwqoZn/gO4OzupL1TiFsUwt0AiVSfPzuyvtfA5h2GXTZ3gCagB4y13S86YGSIaycmb
 lb32HcJhhPdCjHaJ8YV2LB4tYfBvtsYyn3rFj12Bqz3KQ/PKIe+aGw0fZbaV/rm7YNNRGttOVkQ
 GGNVFKeXiedCJUuMTRgBcZZ2mx4USiwa9m7HvV2H5B4u8zy4J3Mc4tuDjdVava2VFfZTx5/bVPw
 ID6wgBTRxI24XsG3Z0mo1HtvZ1YkQTmVxD0gSh5KUtG+qChl9m5KqW6ClIWnUv/8QepS6+xdeBn
 Bq3Zci7p7Tsp8AlrBLR/C2g40u46Bl7zdiTEjKBzkII1Q83YukYI6U8NlYyi8ziW8A00/gujvsT
 bpUrILTM+0pZHOERIe88+oh+NF+7Y+PGftDBJzT1OqW+hk+IQ6emDSGPqZoGDKSdgrJbg=
X-Received: by 2002:a17:90b:51c3:b0:383:f52b:d616 with SMTP id
 98e67ed59e1d1-395c3707434mr6501632a91.10.1787285064171; 
 Thu, 20 Aug 2026 21:04:24 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 17/23] target/riscv: Pass MemOpIdx to vext_ldst_elem_fn_tlb
Date: Thu, 20 Aug 2026 21:03:58 -0700
Message-ID: <20260821040404.268123-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 91 +++++++++++++++-----------------
 1 file changed, 43 insertions(+), 48 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 98a0a5d025..f65da46144 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -171,32 +171,20 @@ static inline MemOpIdx vext_oi(uint32_t desc, MemOp memop)
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
 typedef void vext_ldst_elem_fn_host(void *vd, uint32_t idx, void *host);
 
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
 
 #define GEN_VEXT_HOST_LD_ELEM(NAME, ETYPE, H, LDSUF)        \
 static inline QEMU_ALWAYS_INLINE                            \
@@ -216,15 +204,14 @@ GEN_VEXT_HOST_LD_ELEM(lde_h, uint16_t, H2, lduw_le)
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
 
 #define GEN_VEXT_HOST_ST_ELEM(NAME, ETYPE, H, STSUF)        \
 static inline QEMU_ALWAYS_INLINE                            \
@@ -282,10 +269,11 @@ static void vext_ldst_nf_host(void *vd, void *host, uint32_t i, uint32_t nf,
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
 
@@ -302,13 +290,14 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base, target_ulong stride,
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
@@ -388,12 +377,13 @@ vext_page_ldst_us_tlb(CPURISCVState *env, void *vd, target_ulong addr,
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
@@ -443,7 +433,7 @@ vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
      */
     if (nf == 1 && (evl << log2_esz) <= 6) {
         for (; i < evl; env->vstart = ++i, addr += esz) {
-            ldst_tlb(env, adjust_addr(env, addr), i, vd, ra);
+            ldst_tlb(env, adjust_addr(env, addr), i, vd, oi, ra);
         }
         return;
     }
@@ -472,7 +462,7 @@ vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
         } else {
             vext_page_ldst_us_tlb(env, vd, addr, i, page_evl, nf,
                                   log2_esz, max_elems,
-                                  ldst_tlb, mmu_index, ra);
+                                  ldst_tlb, oi, ra);
         }
 
         /* Usually the first page contains the entire vector. */
@@ -485,7 +475,8 @@ vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
 
     /* Cross page element */
     if (unlikely(page_split % msize)) {
-        vext_ldst_nf_tlb(env, vd, addr, i++, nf, esz, max_elems, ldst_tlb, ra);
+        vext_ldst_nf_tlb(env, vd, addr, i++, nf, esz,
+                         max_elems, ldst_tlb, oi, ra);
         if (i == evl) {
             return;
         }
@@ -504,7 +495,7 @@ vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
                                max_elems, ldst_host, is_load);
     } else {
         vext_page_ldst_us_tlb(env, vd, addr, i, evl, nf, log2_esz, max_elems,
-                              ldst_tlb, mmu_index, ra);
+                              ldst_tlb, oi, ra);
     }
 }
 
@@ -623,6 +614,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
     uint32_t vma = vext_vma(desc);
+    MemOpIdx oi = vext_oi(desc, log2_esz);
 
     VSTART_CHECK_EARLY_EXIT(env, env->vl);
 
@@ -636,7 +628,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
 
         for (uint32_t k = 0; k < nf; ++k) {
             abi_ptr addr = get_index_addr(base, i, vs2) + (k << log2_esz);
-            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr),
+                      i + k * max_elems, vd, oi, ra);
         }
     }
 
@@ -753,7 +746,8 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
      * If it also crosses the page, just go ahead and load it.
      */
     if (unlikely(page_split < msize) && first_active) {
-        vext_ldst_nf_tlb(env, vd, addr, 0, nf, esz, max_elems, ldst_tlb, ra);
+        vext_ldst_nf_tlb(env, vd, addr, 0, nf, esz,
+                         max_elems, ldst_tlb, oi, ra);
         env->vstart = i = 1;
         addr += msize;
         page_split = -(addr | TARGET_PAGE_MASK);
@@ -798,7 +792,7 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
              */
             if (first_active) {
                 vext_ldst_nf_tlb(env, vd, addr, 0, nf, esz,
-                                 max_elems, ldst_tlb, ra);
+                                 max_elems, ldst_tlb, oi, ra);
                 i = 1;
                 addr += msize;
             }
@@ -813,12 +807,12 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
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
@@ -868,7 +862,8 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
             goto tail;
         }
 
-        vext_ldst_nf_tlb(env, vd, addr, i, nf, esz, max_elems, ldst_tlb, ra);
+        vext_ldst_nf_tlb(env, vd, addr, i, nf, esz,
+                         max_elems, ldst_tlb, oi, ra);
         if (++i == vl) {
             goto tail;
         }
@@ -909,12 +904,12 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
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


