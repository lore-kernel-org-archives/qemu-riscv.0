Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D40C5DF6A
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:50:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKl-0007O3-DW; Sat, 15 Aug 2026 15:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKZ-0007J0-Mp
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:14 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKX-0008IG-Ep
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:11 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2cca0c5799eso19521835ad.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823167; x=1787427967; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=igBGUbI9Br7/yOtZA1N4yUxnnhsC2oSUup6hyiOZht8=;
 b=urzUJyYaPFSczIbSa/HZLkv49bsag/CVepml2lD2R4fGaDvJZcu3nkvbUG8JLCSUr6
 czjVlF+znvvrrGB89KHxgks3llCK9uy7hOiXHYhvFHe/PmllOsfzFkpExqRBwahj8KX7
 QkdbYqbxKW9/ptKZXGZhdvm5gPKOoDKbzHuRDCXWFFBBKvPuftsiHHCkfOBLzU5IkAD2
 iYLXjE3BddI2CMoxQhvM1JcRMFIkjzsqlp2cH4TZE+B+rigIcYY+umTQUOPHB/cV5mEN
 hXEFXZE0NK0tLe/gKXfS6URCVww2kJGo8pOb4dHBqnyMfaLWMsS2S4e3bEyFdJIQkejL
 VnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823167; x=1787427967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=igBGUbI9Br7/yOtZA1N4yUxnnhsC2oSUup6hyiOZht8=;
 b=bMf5Z0WJFMvPGXyHBRp8WWmrvZaR9RPitMUlp8hLfcOwllPV+zxshveYZOSBNPbc+X
 Egv8DQwLa+ZbASbg+4rC/A/BZudVLRcF5/zHqeJTmrN/Vfytu1i1QbgKjwIHGoofxtXs
 9Y2pzbrLkwJJLsmQbRdayMcvlKKkXzVTH72OyMA//KI9H6HapvH9r/IWaLbx6Hn+Epla
 4JiPgv4TSSQyjvrob7SlpcOLN401c2hfao+YgvGY53E7w+dIeURk4AUK2oAddO9nC8WH
 DmD42PQfBGWeBmN5f4zcopjA8nO1IsPbOp0G7B1ZyYyGz3zv7yB3I8K1TSzQmyY2Y4Gn
 TbRQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpUC/FkDObdf9cLtBTx7KvkDRspQJhNRrPXTAIwd4rz8pcFPjpwLFGjPchQnF0reRlMXGhlFNWu/kNs@nongnu.org
X-Gm-Message-State: AOJu0Yzv3OfMnNySp5gN5X94CqwHPXiJ1FYFo/jIs6Mf1HAsLKrfKM3h
 YfKbM3WMQdSSUuXsbO1EoINaE4ONNsv4/kxlDFjyAjfSjVEsWdJkerq8koUT4OSt1r0=
X-Gm-Gg: AR+sD11u40eTmg7DFnyqufgQiTi7Q6jUMB0Oh5sIgFE+JvNgJRNtIuPjpQfZYHKag6f
 56iFbgzO/RKaOe5zhKefXceC0jqVYih9pLQoD0uMfG+/jJDrpgWRz1Dfx1fJ7Tgg0WaL+BoORdA
 q1G3QHqkEbPnxWCA4rg4R+Yp0hjY6SgVUr5/ghCnarWl8Ah20oQq0540LwsWCYhjs0enRXhrgK/
 PziyoX7yW1orJlLBfoY6EONu819OI7VHe9TdDMT1safXDmob8WEzNcO8VgDBtBOkioR/CuP0avs
 yv2D+Dbw4x6eQzmWw7WWjRqdQnvOjM/tB0p4KSPQoZXNvbmzXzCVOnK5k35Xi4lpEoZ4JtxcWoq
 u3dVhm1JP8ov+wTs2BptM8/OFpIpMKZYGxvMxaeHf4cuqXFr606lh1fhq2RWsXCZSS7X/+5C5wT
 AM3920m0IRKXcAxcvdzy9uA/js3KBd50MnAwo89xZrWBEtB0CZ02YTu5/GztW+X39o9RgsDkwbN
 Mdl1pETYL1Au/VMCKq1
X-Received: by 2002:a17:903:3c6b:b0:2ca:ed57:8586 with SMTP id
 d9443c01a7336-2d3b0da5dc0mr166165965ad.23.1786823167045; 
 Sat, 15 Aug 2026 12:46:07 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 08/23] target/riscv: Move misalignment check out of
 vext_page_ldst_us
Date: Sat, 15 Aug 2026 12:45:33 -0700
Message-ID: <20260815194549.1377505-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Alignment faults generally have precedence over page faults,
therefore we need to test for that before probing pages.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 62 +++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 12 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 79c1d77a14..12ef020840 100644
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
@@ -425,16 +428,7 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
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
             ldst_host(vd, host, env->vstart, evl);
         } else {
@@ -453,6 +447,20 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
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
@@ -466,16 +474,21 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
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
@@ -489,7 +502,6 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 #endif
 
     /* Calculate the page range of first page */
-    addr = base + ((env->vstart * nf) << log2_esz);
     page_split = -(addr | TARGET_PAGE_MASK);
     /* Get number of elements */
     elems = page_split / msize;
@@ -723,7 +735,27 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
 
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
@@ -821,6 +853,7 @@ ProbeSuccess:
         }
     }
 
+ tail:
     env->vstart = 0;
     if (vma) {
         vext_set_tail_elems_1s(env->vl, vd, nf, esz, max_elems);
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


