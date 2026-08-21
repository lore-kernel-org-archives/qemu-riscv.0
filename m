Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF87C5DF88
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:04:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUT-00066v-6Y; Fri, 21 Aug 2026 00:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUP-00062L-Kw
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:21 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUO-0003CV-01
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:21 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso675410a91.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285059; x=1787889859; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7bhHwXmi5Ia9z6djPqPB3zlOaGaSOImvwNPGZX3JZAw=;
 b=vVp7DJVDUeyLpilXHQ81gwM7zuZxoMktecorvaqSs7KY+xxQ/SfYdYdT/oo/YL8Iyq
 +gb+l4dDFzNCN0iV8AVPP+XWWtnPCTr3VEOKBdPwc72aX0P6Zp3fqpwlLwcgesoVG3M3
 SPdVroyezE3O5MlL1WfplTYpWX1BawE1AboUA98eSyh4FPGjRuxvDwsnQH/exY1zzDb2
 5gAOyOe/rKNLl3dybiezQG2ClplNCTxKMR/DURPr7hGCu7YC/rqiVcoN+MHdNDNE1x03
 zQrHgS4t8Op84ZgYwK6J+fzWCpX2taPtRnJhaW4dmDu1FrX0BFKcx8uJRJtrlZCTPB1d
 +wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285059; x=1787889859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7bhHwXmi5Ia9z6djPqPB3zlOaGaSOImvwNPGZX3JZAw=;
 b=g0OGNNr3+FNrsjS5yWluhIDbto68KZhkGIDMYqhGe2q9c8jQnmu5VqRDqRO4krDJDb
 maNNN1MCWDC5+qJTLNQRdH4Dl/t4+6Ute0ZJr1vNGP7/EMkqQpbZU82TkhDtfMIL6hBD
 GXlFQDqB8XsT7M+5tLe3LluG8ojLXvzU96XUYR7v9ynm8LjrCsTrppRNTQGSCByh5668
 P7zYjgxIZZGQ5crRNTlyiacEA+znT2v/1YYtOhVNEYPb5489kkqHJ73zO8ApoTGyMKfP
 G1nhuJ4wxf22mEAI3OMChrhYItEIOyv0ZyiI9G2eoh7zuO/ITj49GBeWaJPwyRxCa1FI
 k8pQ==
X-Gm-Message-State: AFuF++kdP4m/F3V3lN9ia+7VW9jXWwXfPNA56JYB864zzI/+4Ii9xWbF
 qpsBzjEZ4KYYvAQsl/eT7wPLln/ajJzhQhqEoVuIRzSo0maow6NKLtrnbOjqzwplDyHaTQF3z6q
 mTwZq
X-Gm-Gg: AR+sD10MRA5/rt4H/jV3lNwZt6HwAnp5haxA3xkm2IMbKXtvX7EnLD826C9fV5+ymkO
 xX3ZWSe3CzbwG/YrKnSGrMELaoIE6pkyMJumJCvw+LqwIdbyF87EKH+NnTZFnIvdOQRTfZMORj2
 29+CXw152mBIe6FCsSCRprYJ+7NWq4e1wKzIfuZglmQDDzWq1lY/f6FvbSHf1B5O8Dm9g1072X/
 6sd9wVDU5KePX6mmJLzTTpW7iKodkh0H1yojh6DdXcYeIsTzsOnWkpR6ZEAoDQe4p4Jhb8DpD9h
 KJohllyx9NIuukoPx4LxKfNOccjLosVX03qQETD6NHRfMiApR2jFbFfQew3aBWgvY44fb7I1TjQ
 r84LbUfymQd1QT1FdW1eAroykvUR8UNdfw5/3AJ7lityTXKKsRqyYL+skHytsLoLbelGVZG5mBb
 gKMD5sORbUlC+UJSBvsID3UC8nTShULB+9sovIyMRn4/0llPbLtCsPlTMPvsAzqblEux8=
X-Received: by 2002:a17:90a:e7c2:b0:38e:4f41:83df with SMTP id
 98e67ed59e1d1-395c3a959b2mr6191648a91.15.1787285058599; 
 Thu, 20 Aug 2026 21:04:18 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 10/23] target/riscv: Split out vext_ldst_us_notail
Date: Thu, 20 Aug 2026 21:03:51 -0700
Message-ID: <20260821040404.268123-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Split out vext_ldst_us_tail that doesn't use 'desc'.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 34 +++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index abfd2ec45d..76f3babed6 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -472,14 +472,14 @@ static void vext_test_alignment(CPURISCVState *env, vaddr addr, uint32_t esz,
 }
 
 static inline QEMU_ALWAYS_INLINE void
-vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
-             vext_ldst_elem_fn_tlb *ldst_tlb,
-             vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
-             uint32_t evl, uintptr_t ra, bool is_load)
+vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
+                    uint32_t log2_esz, uint32_t nf, uint32_t evl,
+                    uint32_t max_elems, bool vma,
+                    vext_ldst_elem_fn_tlb *ldst_tlb,
+                    vext_ldst_elem_fn_host *ldst_host,
+                    uintptr_t ra, bool is_load)
 {
     target_ulong elems, addr, last, last_in_page, page_split;
-    uint32_t nf = vext_nf(desc);
-    uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
     uint32_t msize = nf * esz;
     int mmu_index = riscv_env_mmu_index(env, false);
@@ -503,7 +503,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         for (; i < evl; env->vstart = ++i, addr += esz) {
             ldst_tlb(env, adjust_addr(env, addr), i, vd, ra);
         }
-        goto tail;
+        return;
     }
 #endif
 
@@ -535,7 +535,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 
         /* Usually the first page contains the entire vector. */
         if (likely(page_evl == evl)) {
-            goto tail;
+            return;
         }
         env->vstart = i = page_evl;
         addr += elems * msize;
@@ -545,7 +545,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     if (unlikely(page_split % msize)) {
         vext_ldst_nf_tlb(env, vd, addr, i++, nf, esz, max_elems, ldst_tlb, ra);
         if (i == evl) {
-            goto tail;
+            return;
         }
         env->vstart = i;
         addr += msize;
@@ -564,10 +564,22 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         vext_page_ldst_us_tlb(env, vd, addr, i, evl, nf, log2_esz, max_elems,
                               ldst_tlb, mmu_index, ra);
     }
+}
+
+static inline QEMU_ALWAYS_INLINE void
+vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
+             vext_ldst_elem_fn_tlb *ldst_tlb,
+             vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
+             uint32_t evl, uintptr_t ra, bool is_load)
+{
+    uint32_t nf = vext_nf(desc);
+    uint32_t max_elems = vext_max_elems(desc, log2_esz);
+
+    vext_ldst_us_notail(vd, base, env, log2_esz, vext_nf(desc), evl, max_elems,
+                        vext_vma(desc), ldst_tlb, ldst_host, ra, is_load);
 
- tail:
     env->vstart = 0;
-    vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
+    vext_set_tail_elems_1s(evl, vd, desc, nf, 1 << log2_esz, max_elems);
 }
 
 /*
-- 
2.43.0


