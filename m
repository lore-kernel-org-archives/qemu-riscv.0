Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6B4C5DF88
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:07:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUP-00061z-7e; Fri, 21 Aug 2026 00:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUL-0005zA-KK
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:17 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUJ-0003AK-Je
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:17 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2ceab75934dso8357385ad.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285054; x=1787889854; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Gl9t4+96sbWuifrUWiK56+aOXABIK2KdvSzfprs0Q7g=;
 b=qyRhRqlv8NW8Zrx9DdcdIPzJUcBHOWo2orhYihczq3rxQKFSdE8rOgRvEzTaIVYHod
 Xk+TynJOrYIGfm/TPjnIHJAPyHZD+KyqhLN78a8a/4dwhYm6XarXro88tdc+ktuDh6kI
 LRrWDD2ib2HMaK2idByAlH0SqnrL9bsW2p8d/eDVi9wDB77xNV9j4UmiZtdNQRr5bJsL
 pTANTGLqBEpju0CYkj20/bcx8bYLRmZqBfJSnGezbHL6ABzzOW76Fn9ZIxljGMDBy/n5
 BEcDIcj+mJLILWRsOw+2TF3m5hWK6vJW3a2LXucIER4GOTW/IY5KZhyL8q6BJBYF/++2
 VwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285054; x=1787889854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Gl9t4+96sbWuifrUWiK56+aOXABIK2KdvSzfprs0Q7g=;
 b=mVX/6h92yk3MwWkElSbyGfbFTbOZZ+bplhbisnLVGCkJ3F/8SvQ6xNe6fCpkaCLZad
 kbyhaLZRx4EaFdKKUvXv5W6dEa0kSho2waX+bkuUqZUOFx/Xa01mh/nJxJj6ark0Tgau
 uZtSZm3ulFDp2D02tV1/tpgC82JPm0FOBQcscasS2T76WB+1jqNuf1Qk/v2QJBmcoa46
 71gO5fa/CdNuXJxE6qNDpbuwIiIBF24xjBkDjUvi9FjcLIujJzP16hBrDVxSd+Y6oNzY
 PbpOqFvePTETB3PA3MLFESCXMqzWSs1sYCCWA3h1MGYwrsZj9M3eFcsYw/yr6gg7jqK0
 Tb3w==
X-Gm-Message-State: AFuF++nyAl9LTl7kdBe1TIMo7kynxoKB5d7u5WR8e7RD3WIy8nACsjg9
 TqMAz6G2l5JHQJ7Zo4n7Uw/GvWcnsJQvl9ii1lxMOAtAY/IVoQi2GxaWGXMYshBRYJo=
X-Gm-Gg: AR+sD13PKaONn49o5ADViUxXAxKcOT138sYP0MgPJhCAPvkc2NF+KvtU/f7Pb5Z9jW9
 oZhVisEzGXyN/niGxFefbt90dEa804CS5hxUeTaNUu61eNZQMbialDZEcW/d+QAVeSvjacCsC4r
 8wVwLOWn1P2ZVS43cgV43SdY4iCLldg2gn6W2YImzmMcm9w9e+CfIapX3ZYfCx0+zOeezeRXaUL
 jXMOdTxMJhVqoMoSCZJvP1IooFXbw3D+R5DwSt1oYVK1OsLEWw3+cWfs/wNSvZTNlcp5/P80zd7
 tH191B5qY1a88jMhRK16wpoJ/0AL0LX4NYWtDZg8Ft5Safo9llt0BkobyPB4uw1PdapWO/b+LyX
 zC/agEkLQozP7lkKu6tbvieKk3rVHt70mpLSro25Lr9ne4a7V41+jAHZ1EgYhZOL1PJvSzqI3Sz
 QW7MJ7KNsRTQMSkI4JMRLi9tM0WdYPbfBjNVe0GMiCK/1/boJl8gHrRMcXyw8TRvSBxlM=
X-Received: by 2002:a17:90b:3d85:b0:395:4de0:b78f with SMTP id
 98e67ed59e1d1-395c33ef91bmr6766319a91.1.1787285054153; 
 Thu, 20 Aug 2026 21:04:14 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 04/23] target/riscv: Drop is_load parameter from
 vext_continuous_ldst_tlb
Date: Thu, 20 Aug 2026 21:03:45 -0700
Message-ID: <20260821040404.268123-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

This parameter is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 6108cf3a6c..da1e704c56 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -274,9 +274,8 @@ GEN_VEXT_HOST_ST_ELEM(ste_d, uint64_t, H8, stq_le)
 
 static inline QEMU_ALWAYS_INLINE void
 vext_continuous_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst_tlb,
-                       void *vd, uint32_t evl, target_ulong addr,
-                       uint32_t reg_start, uintptr_t ra, uint32_t esz,
-                       bool is_load)
+                         void *vd, uint32_t evl, target_ulong addr,
+                         uint32_t reg_start, uintptr_t ra, uint32_t esz)
 {
     uint32_t i;
     for (i = env->vstart; i < evl; env->vstart = ++i, addr += esz) {
@@ -467,8 +466,8 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
         env->vstart += elems;
     } else {
         if (nf == 1) {
-            vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr, env->vstart,
-                                   ra, esz, is_load);
+            vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr,
+                                     env->vstart, ra, esz);
         } else {
             for (uint32_t i = env->vstart; i < evl; env->vstart = ++i) {
                 vext_ldst_nf_tlb(env, vd, addr, i, nf, esz,
@@ -501,9 +500,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
      */
     if (nf == 1 && (evl << log2_esz) <= 6) {
         addr = base + (env->vstart << log2_esz);
-        vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr, env->vstart, ra,
-                                 esz, is_load);
-
+        vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr,
+                                 env->vstart, ra, esz);
         env->vstart = 0;
         vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
         return;
-- 
2.43.0


