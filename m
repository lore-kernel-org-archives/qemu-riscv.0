Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C948C5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:06:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUw-0006QB-Vj; Fri, 21 Aug 2026 00:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUV-00067h-QM
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUS-0003EO-1I
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:25 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-384930ca5e2so542877a91.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285062; x=1787889862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=68pOmPzSVLedIxa6xDxSTghcazTA2dqFNSAoW+HSS78=;
 b=zgx0Q3Uvi5gGdT5PuYekznxAqFy1c4+8a7isMEBvB9gGXPNRL6pXxEV15JTykx/rOo
 Pjm2G3qXsCjsejL1DiMiNjd+ErVrfYcZNxWz017lwU/RXpBZdtw+Sz7J50H9QquSTk3Q
 L6Y7D/vQR14olT/QmggNK3td6jWFJfQ9HyiDBWi1D18Za1hH+ivFLcvifBTPoAUx1eed
 SGQ5Ie8jDLwIN9Nn4y1msHlAeMptSwrVPHnVlAE7b+Bh3BgPrces9ZBH574J4fceXpdG
 L0nZ4rgMwSERPBGrrMIe9t+ylgFLVadOxE7SCYFLuPrLFOFMuCx7jHx1n6gyWyIHv47v
 yfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285062; x=1787889862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=68pOmPzSVLedIxa6xDxSTghcazTA2dqFNSAoW+HSS78=;
 b=NYhHN+NYFOITyclQVCSl3EjCr8EcWS/r8hpAYJ37uuMhkzePqpWzoZlljWv6dcGqtO
 bvndro647iZPIusB76dZ4q03VTTfkB6U+qqb4e9kiBhWmxk9srEmizFyXqyKghgBNiXM
 Q8gRYzTaPHwuh2GNzBePJSFRko5IV81+qiknGLszVirWnfhcZLmInIjQKoZgCUuRUymy
 KpHxoK1OwTBmtUb+NniUw5Y2WidOqezI0Z53sB/KX06gJC22qDy1+E1yA3FsgF6wYEr4
 B6MnkqrU2F87GMkOTQudQHGEPSgzqnntleKcjZ8CBWqXORARIESbUVsh00DisgQSACxJ
 rymA==
X-Gm-Message-State: AFuF++msHN6rYmMTM7QXGovImxOAW9Y7jxWyEOTCV1W8fWN4rQf2XKFU
 Kb3FwDjxLtLxJ5Dz+Oc+fBK1BjPuqWEb04wp9TXmttSPv2ZMMxDBtZ3WtbJayX5bpGA=
X-Gm-Gg: AR+sD11x1a/rtYgIEZ1sRHIFQgUiG39My8gxjR1T64X7nNkST1XP8BAW0FUjZlwg5Kf
 EHcX4m+g3u3BqoD7B33fNdOaqhI9f0DPB5BKTz3jPxZYYrGLFv+yTpA63uDSKAS/VqNyFQHV+aY
 DQJf6htJGvrUQZXefIWRq0dBViOLb9OyBumPly4qLZaMb6OpVHz+fvGeF9vpw0f04mtB8mxW+PM
 52tNMEr48BvULOPWMFplza3gdcj0cg+xTIwNLWwVC7RdtnXQcmglPTtu/ksO8hMhR2TT0lcHOQB
 0/wH3sTbgdbd3d+KKMPMV4QPiVctAjsHEKtGMyYaXapVEdn2fJh/HsbkpFWBF2KLA5Gt4FdX1mI
 FaqsQqPOpVfyVY5O+flaBWQQ3fGaxCdslZ3IQoU1lfsLVT7ZtnHQa2XGeOvTO4lGN71t3dC4cT6
 tQgQcAt/RVEL92+34rpO8XiBtt32/2elefwR2GvYqXL1Fo4yRZrz3cZ2SyuTatk4A6VIE=
X-Received: by 2002:a17:90b:1b05:b0:38e:67e1:15b with SMTP id
 98e67ed59e1d1-395c353226dmr5177944a91.6.1787285062470; 
 Thu, 20 Aug 2026 21:04:22 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 15/23] target/riscv: Pass MemOpIdx to vext_ldst_us
Date: Thu, 20 Aug 2026 21:03:56 -0700
Message-ID: <20260821040404.268123-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Use mmu data passed in with VDATA.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 76990894e5..9b0c3f70c2 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -158,6 +158,19 @@ static inline void vext_set_elem_mask(void *v0, int index,
     ((uint64_t *)v0)[idx] = deposit64(old, pos, 1, value);
 }
 
+static inline MemOpIdx vext_oi(uint32_t desc, MemOp memop)
+{
+    uint32_t data = simd_data(desc);
+
+    if (FIELD_EX32(simd_data(desc), VDATA, BSWAP)) {
+        memop |= MO_BSWAP;
+    }
+    if (FIELD_EX32(simd_data(desc), VDATA, ALIGN)) {
+        memop |= MO_ALIGN;
+    }
+    return make_memop_idx(memop, FIELD_EX32(data, VDATA, MEM_IDX));
+}
+
 static inline MemOpIdx vext_make_memop_idx(CPURISCVState *env, size_t size)
 {
     int mmu_idx = riscv_env_mmu_index(env, false);
@@ -406,12 +419,12 @@ vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
                     uint32_t max_elems, bool vma,
                     vext_ldst_elem_fn_tlb *ldst_tlb,
                     vext_ldst_elem_fn_host *ldst_host,
-                    uintptr_t ra, bool is_load)
+                    uintptr_t ra, bool is_load, MemOpIdx oi)
 {
     target_ulong elems, addr, last, last_in_page, page_split;
     uint32_t esz = 1 << log2_esz;
     uint32_t msize = nf * esz;
-    int mmu_index = riscv_env_mmu_index(env, false);
+    int mmu_index = get_mmuidx(oi);
     MMUAccessType access_type = is_load ? MMU_DATA_LOAD : MMU_DATA_STORE;
     uint32_t i = env->vstart;
     void *host;
@@ -505,7 +518,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
 
     vext_ldst_us_notail(vd, base, env, log2_esz, vext_nf(desc), evl, max_elems,
-                        vext_vma(desc), ldst_tlb, ldst_host, ra, is_load);
+                        vext_vma(desc), ldst_tlb, ldst_host, ra, is_load,
+                        vext_oi(desc, log2_esz));
 
     env->vstart = 0;
     vext_set_tail_elems_1s(evl, vd, desc, nf, 1 << log2_esz, max_elems);
@@ -947,7 +961,8 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t evl = (riscv_cpu_cfg(env)->vlenb * vext_nf(desc)) >> log2_esz;
 
     vext_ldst_us_notail(vd, base, env, log2_esz, 1, evl, evl, false,
-                        ldst_tlb, ldst_host, ra, is_load);
+                        ldst_tlb, ldst_host, ra, is_load,
+                        vext_oi(desc, log2_esz));
     env->vstart = 0;
 }
 
-- 
2.43.0


