Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B144CC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:50:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKl-0007O8-Nt; Sat, 15 Aug 2026 15:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKX-0007Ir-Qu
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:13 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKV-0008HJ-6d
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:08 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2cf52d15d88so21001165ad.2
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823165; x=1787427965; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=US7bLFAj81tqEBwMk45KMnHmQvxx6oAKzY8BWowRu2M=;
 b=KepZacLOtB4brD0XpMunciNYfhQJaDkIyXSD0tospxRtVcfscK1k8g2ZVjmvGG5iZn
 tBwhLsnypIYeur9UKmQKCSuSkjllZ7S6wYvui7t3+7PvJYMUIDw41/Hd06B20l9Eorwz
 TBnwBPzX1zQGgIMNQpnurYzz30ZoXbEZP29L0SQ2tVzCZIBt6qBoeQ73HbdlmjFhgw0k
 EI4I5ToBvZt8dclBjLkKB3dyXTyacof3pUiNa3UuAl6DgnqEiFwnh3hLheSp/NPdRwB6
 UMa61IsLXk7US1BEuC8Y9hKzO+uB4eavcGG3W9bjHhKdHgSyr+w2Kqj1t14GwOtmEqWY
 rYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823165; x=1787427965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=US7bLFAj81tqEBwMk45KMnHmQvxx6oAKzY8BWowRu2M=;
 b=sspNTP6Hip6ta+iZEjdrdeLfrZKoli351JwDYkHR3ORo/HbqRMkID0zJLptKDsgUeI
 YwcYpR8F2TebR92wF8QhszcW+oWmMXpIEe7efVu9Z6jjkZRjGEnErTykHyHskQYujcs5
 OCxExO81Yhbo/2LVONrqgO/TX81FL1ScjV1+Itlr16kiJzupSLZeI9DkdDF35YT77Q18
 RdO5HYfPtsot6oR9RetXMuNpk4J9tQt0g2IrbKiTBjr4DUE+2pTKRdVxb0AHDzSYb007
 BXvDeAJ95KUp6SHCj/hx+fIIokRZ7pEqiYvyF/VumrjxR7FL6sHVYQiRxC+dTPhL/zU4
 +4Vw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpYeJ1abocXeDbBojLGUCF/3DP/04agsQKPylJkyf0HfiSu8CzUE1CPCAvN/zz2iwrvmOo8yXgyCM0D@nongnu.org
X-Gm-Message-State: AOJu0Yw8cRCRfSn0FYdX61TTC9me9FcQ21W3i6SKFxsCR4uPac7ftb+n
 O4gdXis+wLEH1fxKfxB0bWKalpMRm+GzSDIzMxUM9yPVwNXF1n5aIO6ZVQIz7XJBNKU=
X-Gm-Gg: AR+sD11TERXZL32QjuSPpWlwPZOG4VB8joYlNGD0sHyMJgPW+UcDRkBni7CMtpaiGzG
 ibGk2kjOzzMP3lcijXBY3PqxFGr1JjE6t/4LHducvHURgZWaxsNYUdOCJPTaOACx89JqJXGS3Up
 v2dK8yCrdRlyMDqZPMjdqYqSjlJAc7X0MpoueNEIxjMhagDVZhXv09ww9Tiu+WrgE+gRx5RvMGV
 0sZR2xVPcFwzZzYq9RdCkNQ96ermTADS2qHdBa4WuKw+pbZM+C7iGS+khLxcRxFwqpq7hLqv1sK
 7MQsqN6raTyfl2wl32kSgabCI2FxyYRlfP4djs+hwRgA0Hs2hQ2wSYdQ+ijgBh/CEfR+U1pdITv
 1lOBg5hHt2o+6mNQtiPT24Ln2xL065kOm9MaU7W6O835EjtSMzfbYRFPxCcFS3hQE0/JSFuQqMa
 PRFGkVK4rjhDeLWqhkWi+2tBfRLy1fw6MD1NvT8GyXXGKYXqAlpbg8u3QuwPRFQ5CFhRcKOChE4
 aOTlI7wa5LtMGA1kfS/slaaHV1mR3Q=
X-Received: by 2002:a17:902:fdab:b0:2c9:b8b7:5d1c with SMTP id
 d9443c01a7336-2d3b0d43f16mr170532915ad.16.1786823164851; 
 Sat, 15 Aug 2026 12:46:04 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 06/23] target/riscv: Drop is_load parameter from
 vext_continuous_ldst_tlb
Date: Sat, 15 Aug 2026 12:45:31 -0700
Message-ID: <20260815194549.1377505-7-richard.henderson@linaro.org>
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

This parameter is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 3786a17231..a571982388 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -299,9 +299,8 @@ GEN_VEXT_HOST_ST_ELEM(ste_d, uint64_t, H8, stq_le)
 
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
@@ -458,8 +457,8 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
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
@@ -493,9 +492,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
      */
     if (nf == 1 && (evl << log2_esz) <= 6) {
         addr = base + (env->vstart << log2_esz);
-        vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr, env->vstart, ra,
-                                 esz, is_load);
-
+        vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr,
+                                 env->vstart, ra, esz);
         env->vstart = 0;
         if (vma) {
             vext_set_tail_elems_1s(evl, vd, nf, esz, max_elems);
-- 
2.43.0


