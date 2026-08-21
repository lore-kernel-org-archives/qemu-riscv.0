Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BD2C5DF88
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:06:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUO-00061u-So; Fri, 21 Aug 2026 00:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUN-00060d-3U
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:19 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUL-0003B3-63
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:18 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-382ef647e20so547695a91.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285056; x=1787889856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kFG+X+gNFB2lQusybVgjPeXj7Ar+44XCtkZGXEI5MiU=;
 b=lyS4tjgiyZTR7VhSqeYXblio0umpvpT3nFlkZdyy17Ybnb/PUFxpqb1fnkujMwzKWs
 dqca1qGZw6Wgx+YTbJka4159uLBphHulFUhbmk/r2x1sazWtnHyxBoCP8rCZTb0bMBJ1
 ZbN3uKSTvbeCPMzM2sthAXRf4diBYERtZksPav5vGbKRdWlerbRnU7ZXsunb3KrEyitU
 fyqyUW4YkVSJQvVQXBaYbD1SQP5WErdSFXDyKVq1d6xvGy3sOr3Dv3/i/nqCdyCIhJff
 GBseTbLmWvvRROfga8ymaNjeHWJInRUCRvYfY//cmHOABDiwS2HD8P/XorHZqC+MflbZ
 HJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285056; x=1787889856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kFG+X+gNFB2lQusybVgjPeXj7Ar+44XCtkZGXEI5MiU=;
 b=ndNM+hXvoEqeBl0q4D4aQ9321/QZ/Tb5M2CNUXDKfnu4ZOAM9Aj91ZFCWVqwJaIcpz
 8nWJ8LKEQYQX3Yxfc7eVpdvPRvZq3wUQeaul6/vbI6mU+HZ/FRnLlEUEZS5eSTtdCn9q
 fmvsZl3GNTc5aCmwnfF9OqRNhukvfdgD8h2FGcI40/4+qq7QBQXRuUU+ipgPsEN8FUMU
 uhCpFWlL9XMf+AzSxax5CuPJUzPYoLbUGlpJOaP62iZ/HK35Py+1BBfPlp1zJJ4w00ZG
 XoYJsI//c9148YdRSHcB2cSyIuPV84Ly+esLPfB60QmqWSf9PalZiTrfrKF74DkjVce+
 bimQ==
X-Gm-Message-State: AFuF++nyy8fe6oyhTwt5s8THd2lqtYA6a0Dz1v6UNu53HJDvI1VJ0LVQ
 NA65pFCJH1i5FbedPKzQM95ErE4itDxwVyJdvwOsuE8wwycPxsZRLCqXJYYiLngfEUVoXsiEIL0
 e7YuR
X-Gm-Gg: AR+sD10I2YGbSRXwYZbQCQ6iUObH4VOX8aIgf3hujFJ+g6PEZDf8XrRlgdpdhoeYSkB
 s44UJsUtmUXcPNR3j+cnfcDhVveRc4bUdXWCgJXC9j+GBDJbSE8dGEe5RaKumMCRGL5PCZQmIg/
 hnFEDF59SD4KYyhNoY+XVpaEpHcTEKAt8Q4NfrLFxlJOf0vYoED4AiQqzMZR49jacWsRtogL0jn
 6qwmiPhhgM2PRmYDRYKn9XKpZQprW86q6riMZAkv1KxdBI+z2HoVWMBIKp44ps6OkHiba6PB1jA
 Bd8+/TAxy3B8eoEx5/epn1Tl4tdVNJkyv19H8Jpl+oaZK5CTsZNvqQMk32uJDzomLcQHJtLPjn/
 h3LkcJx4mmbLGpndgwoEaAZbusK1X/lBOe1UGdo4xtFHSiiCKWho/POWk1UnWWqUnSnlmZkuJaK
 xEO56d2eemUuY9cenHWWwr4pFwdymJ8MmNfmtSwRAqp1xEHCeJ2dnCKgM1uoOvZaG7hQA=
X-Received: by 2002:a17:90b:3912:b0:392:e5b1:d833 with SMTP id
 98e67ed59e1d1-395c3738b35mr5334615a91.13.1787285055674; 
 Thu, 20 Aug 2026 21:04:15 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 06/23] target/riscv: Move misalignment check out of
 vext_page_ldst_us
Date: Thu, 20 Aug 2026 21:03:47 -0700
Message-ID: <20260821040404.268123-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Alignment faults generally have precedence over page faults,
therefore we need to test for that before probing pages.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 62 +++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 12 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 63a51f2b48..18840336cb 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -31,6 +31,9 @@
 #include "tcg/tcg-gvec-desc.h"
 #include "internals.h"
 #include "vector_internals.h"
+#ifdef CONFIG_USER_ONLY
+#include "user/cpu_loop.h"
+#endif
 #include <math.h>
 
 static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
@@ -433,16 +436,7 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
     probe_pages(env, addr, size, ra, access_type, mmu_index, &host, &flags,
                 true);
 
-    bool misaligned = addr & (esz - 1);
-
-    /*
-     * Allow the host fast-pash when:
-     *   1. Page permission/pmp/watchpoint are checked and we have a contigous
-     *      host mapping.
-     *   2. Zicclsm is enabled or load/store is not a misaligned access.
-     * Otherwise, we will fall back to the slow TLB-path.
-     */
-    if (flags == 0 && (riscv_cpu_cfg(env)->ext_zicclsm || !misaligned)) {
+    if (flags == 0) {
         if (nf == 1) {
             vext_continuous_ldst_host(env, ldst_host, vd, evl, env->vstart,
                                       host, esz, is_load);
@@ -462,6 +456,20 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
     }
 }
 
+static void vext_test_alignment(CPURISCVState *env, vaddr addr, uint32_t esz,
+                                MMUAccessType access_type, int mmu_index,
+                                uintptr_t ra)
+{
+    if (!riscv_cpu_cfg(env)->ext_zicclsm && (addr & (esz - 1)) != 0) {
+#ifdef CONFIG_USER_ONLY
+        cpu_loop_exit_sigbus(env_cpu(env), addr, access_type, ra);
+#else
+        riscv_cpu_do_unaligned_access(env_cpu(env), addr, access_type,
+                                      mmu_index, ra);
+#endif
+    }
+}
+
 static inline QEMU_ALWAYS_INLINE void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
              vext_ldst_elem_fn_tlb *ldst_tlb,
@@ -474,16 +482,21 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t esz = 1 << log2_esz;
     uint32_t msize = nf * esz;
     int mmu_index = riscv_env_mmu_index(env, false);
+    MMUAccessType access_type = is_load ? MMU_DATA_LOAD : MMU_DATA_STORE;
 
     VSTART_CHECK_EARLY_EXIT(env, evl);
 
+    addr = base + env->vstart * msize;
+
+    /* Recognize alignment fault before memory protection fault. */
+    vext_test_alignment(env, addr, esz, access_type, mmu_index, ra);
+
 #if defined(CONFIG_USER_ONLY)
     /*
      * For data sizes <= 6 bytes we get better performance
      * by simply calling ldst_tlb.
      */
     if (nf == 1 && (evl << log2_esz) <= 6) {
-        addr = base + (env->vstart << log2_esz);
         for (uint32_t i = env->vstart; i < evl;
              env->vstart = ++i, addr += esz) {
             ldst_tlb(env, adjust_addr(env, addr), i, vd, ra);
@@ -495,7 +508,6 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 #endif
 
     /* Calculate the page range of first page */
-    addr = base + ((env->vstart * nf) << log2_esz);
     page_split = -(addr | TARGET_PAGE_MASK);
     /* Get number of elements */
     elems = page_split / msize;
@@ -725,7 +737,27 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
 
     VSTART_CHECK_EARLY_EXIT(env, env->vl);
 
+    /* Search for the first active element. */
+    if (!vm) {
+        for (i = env->vstart; i < env->vl; ++i) {
+            if (vext_elem_mask(v0, i)) {
+                break;
+            }
+            if (vma) {
+                vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
+            }
+        }
+        if (i == env->vl) {
+            goto tail;
+        }
+        env->vstart = i;
+    }
+
     addr = base + ((env->vstart * nf) << log2_esz);
+
+    /* Recognize alignment fault before memory protection fault. */
+    vext_test_alignment(env, addr, esz, MMU_DATA_LOAD, mmu_index, ra);
+
     page_split = -(addr | TARGET_PAGE_MASK);
     /* Get number of elements */
     elems = page_split / msize;
@@ -823,6 +855,7 @@ ProbeSuccess:
         }
     }
 
+ tail:
     env->vstart = 0;
     vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
@@ -866,9 +899,14 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t evl = nf * max_elems;
     uint32_t esz = 1 << log2_esz;
     int mmu_index = riscv_env_mmu_index(env, false);
+    MMUAccessType access_type = is_load ? MMU_DATA_LOAD : MMU_DATA_STORE;
 
     /* Calculate the page range of first page */
     addr = base + (env->vstart << log2_esz);
+
+    /* Recognize alignment fault before memory protection fault. */
+    vext_test_alignment(env, addr, esz, access_type, mmu_index, ra);
+
     page_split = -(addr | TARGET_PAGE_MASK);
     /* Get number of elements */
     elems = page_split / esz;
-- 
2.43.0


