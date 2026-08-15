Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44173C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:50:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKl-0007O2-8u; Sat, 15 Aug 2026 15:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKb-0007JE-HV
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:18 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKY-0008Ii-OI
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:12 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2d049069377so21933575ad.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823169; x=1787427969; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GgeC2Gz0Cy5NIUncliWwHs8r8iCx5AzYcDVo3ksrI48=;
 b=PgqeUTJALDRCrFqF9ysOwv1NejWOoeDT8+YqgaeTrGPlRHV88HjgQszNxu4XyupCKj
 uyUzJWNfCtg4H0EL3MpSW9XpBTrbwMm8pwEnRWMNRgbkzR3UojunpQCFotTLBQd0DkqP
 snSTri5iqa2ncIwz27aw6r5VpYKsquTLjyDUZsoyHrH6awIswtRyWjGNLvx6ULxhd7ya
 JEgU4pcn9vKbTaqdvhAGfZL35FktTZSw0CP8PhzAm09GrUzHuCARJUJzi8+Hk63MCi3O
 +Ne0fmdmLX1uWNjq7bTQ0vi4oHZLVEg2km7xC776h0iphmDt99hv3SgsdShLSQzq26Dm
 3XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823169; x=1787427969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GgeC2Gz0Cy5NIUncliWwHs8r8iCx5AzYcDVo3ksrI48=;
 b=XaiJNHZIVVHiBhlvH/6Rus+E+18IKevDpkOgiB2kGHvxiWVa3V7MBMlG7ARJUkQoGH
 UOOgZdOyGkYO3dG/+nbSjEI9v07MInsyBNTAuUqED97pTf4WvJ4+Ce5U0/hXIV25W76D
 Mg48S/yzRN5qLblx5Hp592KRYQHXrFJVMIrHl1i/Osl3LNkOR14cSMLKVbUiFbfeqciu
 ZgD34k1c53yS9DNKqKRr/Ys+sNuvhVms1F1Xczi2wQ4xYJMsRXvNJxhBbH3gP4C5aKHO
 XOeACd+y3T88X2foaN54tHO7IDPWlPDdrKq9iB0UwIXjV8Prs3g+I61zCBA0KU7ktBOz
 TcPQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqNj8gA4s9sWVYQN/CGSYpml2EJ0FW04JcjbFW+c6VNO5LWhu+gCG+nu1qQq7hwzDRKmo0ZNWLCDhtY@nongnu.org
X-Gm-Message-State: AOJu0YzR53EpfWIlMl8mek3SXQUrGQUXIP3PnTtH3MmfQwm/4uu88Noi
 DyDjVls3OwmwAbr3zprq5KVdenHM/w3iendYzKHEK6yL6TjvMYWB4oiUdFTAkvFBmCk=
X-Gm-Gg: AR+sD13CsRkkG/1u999/rgBAACXkxGDdGKyzbFjN+j9RnOXUebI+4slVmmsGJenSfCA
 AwV4tNCWojspsW7l6q1ZZcIorNGzUz+duOJ+hb/Y79t4upwfU0N91aQqLvXJKT0fGCxvNh84ofy
 pimGNNqapbGTixAGcLNkCjCRXkQDW+IyQCX6dQ000iC+wPhnfNo8yIxiKQL26AlPdoQvZlQmA5j
 TjiyGSkVPzEbl4jjlSK9FE8E368EtF6Jsizhuh+5ALHIqAJWcKcBWzP0FN5H91ZAuDyfojlS23O
 hC0O5CCJ/WjuVMs7ylGAS7jKSccoagDdV2bmJVSO5gV4V2zxPcWrwwpm4/yx2g0bZqIbU3PRabQ
 YP7DGd4oukfjJeJdPs2BwSRgIPRQ1JHaHMrCzmK3zPsGIeiLLr+pBopUhgAGwKwwH17/d9J4dIX
 qne+tWT2wh7Qyap7SzbpWbbaUVVUO8kxbNlHB09prd+BnijrT/RM+x9BhVfuboBi59oBzvzPS04
 h+VqcH9bWh8jbPN4i1o
X-Received: by 2002:a17:903:360c:b0:2ca:b8fd:f31 with SMTP id
 d9443c01a7336-2d3b0d5e37amr160724755ad.15.1786823169041; 
 Sat, 15 Aug 2026 12:46:09 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 09/23] target/riscv: Split out vext_page_ldst_us_{host,tlb}
Date: Sat, 15 Aug 2026 12:45:34 -0700
Message-ID: <20260815194549.1377505-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Split out the tail of vext_page_ldst_us, after probing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 60 ++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 12ef020840..7f721dc24d 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -403,6 +403,39 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d_tlb)
  */
 
 /* unmasked unit-stride load and store operation */
+static inline QEMU_ALWAYS_INLINE void
+vext_page_ldst_us_host(void *vd, void *host, uint32_t i, uint32_t evl,
+                       uint32_t nf, uint32_t log2_esz, uint32_t max_elems,
+                       vext_ldst_elem_fn_host *ldst_host)
+{
+    if (nf == 1) {
+        ldst_host(vd, host, i, evl);
+    } else {
+        uint32_t esz = 1 << log2_esz;
+        uint32_t msize = nf << log2_esz;
+        do {
+            vext_ldst_nf_host(vd, host, i, nf, esz, max_elems, ldst_host);
+            host += msize;
+        } while (++i < evl);
+    }
+}
+
+static inline QEMU_ALWAYS_INLINE void
+vext_page_ldst_us_tlb(CPURISCVState *env, void *vd, target_ulong addr,
+                      uint32_t i, uint32_t evl, uint32_t nf,
+                      uint32_t log2_esz, uint32_t max_elems,
+                      vext_ldst_elem_fn_tlb *ldst_tlb,
+                      int mmu_index, uintptr_t ra)
+{
+    uint32_t esz = 1 << log2_esz;
+    uint32_t msize = nf << log2_esz;
+    do {
+        vext_ldst_nf_tlb(env, vd, addr, i, nf, esz, max_elems, ldst_tlb, ra);
+        addr += msize;
+        env->vstart = ++i;
+    } while (i < evl);
+}
+
 static inline QEMU_ALWAYS_INLINE void
 vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
                   uint32_t elems, uint32_t nf, uint32_t max_elems,
@@ -412,38 +445,21 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
 {
     void *host;
     int flags;
-    uint32_t esz = 1 << log2_esz;
     uint32_t size = (elems * nf) << log2_esz;
-    uint32_t msize = nf * esz;
-    uint32_t evl = env->vstart + elems;
+    uint32_t i = env->vstart;
     MMUAccessType access_type = is_load ? MMU_DATA_LOAD : MMU_DATA_STORE;
 
-    /*
-     * Maximum vector length is VLMAX == 2^16 == LMUL * VL / SEW, and
-     * occurs for LMUL == 8, SEW == 8, VL == 2^16.
-     */
-    g_assert(env->vstart < UINT16_MAX && UINT16_MAX - env->vstart >= elems);
-
     /* Check page permission/pmp/watchpoint/etc. */
     probe_pages(env, addr, size, ra, access_type, mmu_index, &host, &flags,
                 true);
 
     if (flags == 0) {
-        if (nf == 1) {
-            ldst_host(vd, host, env->vstart, evl);
-        } else {
-            for (uint32_t i = env->vstart; i < evl; ++i) {
-                vext_ldst_nf_host(vd, host, i, nf, esz, max_elems, ldst_host);
-                host += msize;
-            }
-        }
+        vext_page_ldst_us_host(vd, host, i, i + elems, nf,
+                               log2_esz, max_elems, ldst_host);
         env->vstart += elems;
     } else {
-        for (uint32_t i = env->vstart; i < evl; env->vstart = ++i) {
-            vext_ldst_nf_tlb(env, vd, addr, i, nf, esz,
-                             max_elems, ldst_tlb, ra);
-            addr += msize;
-        }
+        vext_page_ldst_us_tlb(env, vd, addr, i, i + elems, nf, log2_esz,
+                              max_elems, ldst_tlb, mmu_index, ra);
     }
 }
 
-- 
2.43.0


