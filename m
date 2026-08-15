Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC5AC5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:50:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKl-0007Np-2E; Sat, 15 Aug 2026 15:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKT-0007Gu-W1
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKS-0008GH-4a
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:05 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2cace91f112so24668775ad.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823163; x=1787427963; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MMt/T2qixGKzpFjQy6Eiw9D8oTLk6WHuNvJpilBc82M=;
 b=s1JOcfVsKdJ08WVjca43s5m/C7PCJFsl2d/uLtov9fuQAx7F6na6/3qwDRJa1U2goG
 8TE8LCs9qMqmsO6tCmiHdcngYI94c3By/nfcAb8lRDcWdx+tlFMlLAhybiJv7tokgjtj
 Yr3q3cVXJa/fiuCc54xz02/R8fQDvBIvZAam4h3cEyUyt9yStun6/pQF67VmkHtLpdGj
 xG3ragVUhvZ2M2C/uQEV3t7rbVdaff/tzJbXE1/RlEabsaFLDlPeW8syW4qCDieq+wEi
 qUIxd/X8t/XyikDYCTychoNwnd/NcXMiOlAWi28aKoi0bcTkZbs+/IsJ9UE0jSKVdBCa
 2RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823163; x=1787427963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MMt/T2qixGKzpFjQy6Eiw9D8oTLk6WHuNvJpilBc82M=;
 b=QGFbIaGkn2gbWzqoNsuvuSNHDd3bVEiuzi8gxhjJajLJ/j+unF6nE3NhORcVujyroV
 nK83ngdZ+AnqLJQN3G0ZaDUAV6+X8JLPH5V8tZpU6bfLbr8b2e894Gh8ge6CkS7Oh61q
 o8wgNzCsGUdBU9CAS1m88KkVOQJ3Lmnnjf9TTCwhEyv7QcqnvEF3yXnmNYyvuAOmdDDu
 YUPDm+UuX5XqRP8XqHzE8geu4361XjKQsg4uuthpJeKgwJlk6gWPNsViruURLHRzNxt9
 hIRzq4O0aDas3EuoAng0Hvxq7TNaiM7+Rc220TXpV97s32iN5CTH+ffoa0nIxdltQBsu
 vqMw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqavwmBMQQCSpv/jN+93GW9QM1P9PRueIQop/Yfe3o0o8KzsQq8kpFlwsw+KbZsiFO+SlF6TiFDIKH7@nongnu.org
X-Gm-Message-State: AOJu0YzC1Udaewv6QO4Uc8YlQIVLT57sWX6sGWp4wsUqqfXmT4UyI/8z
 pXlPZHLwkVLP9xer/0dUClfdCldmyYdO+5XCBm5LEQ4MAnUOCPyIuBqU0a8OdGR6RUk=
X-Gm-Gg: AR+sD12D5pZVHOpBlg62wG4bOiBkSB3eOSEUSUdDdoqiwWSwtgTL75XDBJOcr2LLbya
 MlDqTgr02PAW5ZvsWXDpSpAlxLPXe37KsgjLAIWzKdYXSIoYBYHs4qcr8S2QQvhk/2onNv4k8n0
 O8q9DKN8/5cNK1VVRNhji7W6KcLjF01arX6dYwl5K1ANPkVgA8uWYKi66JlsegvxxKi5zX0Z5LM
 bWHBkUTpOmXh/AaJf+WSN+W05Zg5QJsjUB86A+h6U7hiqn2CYvGKPXzPZegCch5SmMOdxOslK6L
 AkUdI3CXhORpAjoxfqLoVsRfwWm/U52d0VBsWOo//oKwjNrfFIIeOUV09keQAYQRBg3z6jasgQv
 1CNKv6mF54Zi8F0IL5CUFc8zGle5iF6/++A8otPiqusccrL9jKSMu17MJAmgarZ1Z8b1a55ukny
 fP6FC2OokGRRGHFsWbpSsTABVEqpUryTgYyXTvE7ODG0UOVpzk1/vxi2QCyagETvvALuQmQ0ylo
 e3uZiOnbAe6p6I0we4o
X-Received: by 2002:a17:902:e54c:b0:2ca:329:3da1 with SMTP id
 d9443c01a7336-2d3b0f3e8b7mr154018905ad.16.1786823162666; 
 Sat, 15 Aug 2026 12:46:02 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 03/23] target/riscv: Split out vext_ldst_nf_tlb
Date: Sat, 15 Aug 2026 12:45:28 -0700
Message-ID: <20260815194549.1377505-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Provide a helper that calls ldst_tlb for all NF vectors.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 77 +++++++++++++++-----------------
 1 file changed, 35 insertions(+), 42 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 8f74162d50..9c0cbcac16 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -329,6 +329,16 @@ static void vext_set_nf_elems_1s(void *vd, uint32_t i, uint32_t nf,
     }
 }
 
+static void vext_ldst_nf_tlb(CPURISCVState *env, void *vd, target_ulong addr,
+                             uint32_t i, uint32_t nf,
+                             uint32_t esz, uint32_t max_elems,
+                             vext_ldst_elem_fn_tlb *ldst_tlb, uintptr_t ra)
+{
+    for (uint32_t k = 0; k < nf; k++, addr += esz) {
+        ldst_tlb(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
+    }
+}
+
 /*
  * stride: access vector element from strided memory
  */
@@ -346,16 +356,11 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base, target_ulong stride,
     VSTART_CHECK_EARLY_EXIT(env, env->vl);
 
     for (uint32_t i = env->vstart; i < env->vl; env->vstart = ++i) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            if (vma) {
-                vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
-            }
-            continue;
-        }
-
-        for (uint32_t k = 0; k < nf; ++k) {
-            target_ulong addr = base + stride * i + (k << log2_esz);
-            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
+        if (vm || vext_elem_mask(v0, i)) {
+            vext_ldst_nf_tlb(env, vd, base + stride * i, i, nf,
+                             esz, max_elems, ldst_elem, ra);
+        } else if (vma) {
+            vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
         }
     }
 
@@ -411,6 +416,7 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
     int i, k, flags;
     uint32_t esz = 1 << log2_esz;
     uint32_t size = (elems * nf) << log2_esz;
+    uint32_t msize = nf * esz;
     uint32_t evl = env->vstart + elems;
     MMUAccessType access_type = is_load ? MMU_DATA_LOAD : MMU_DATA_STORE;
 
@@ -453,15 +459,10 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
             vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr, env->vstart,
                                    ra, esz, is_load);
         } else {
-            /* load bytes from guest memory */
             for (i = env->vstart; i < evl; env->vstart = ++i) {
-                k = 0;
-                while (k < nf) {
-                    ldst_tlb(env, adjust_addr(env, addr), i + k * max_elems,
-                             vd, ra);
-                    addr += esz;
-                    k++;
-                }
+                vext_ldst_nf_tlb(env, vd, addr, i, nf, esz,
+                                 max_elems, ldst_tlb, ra);
+                addr += msize;
             }
         }
     }
@@ -473,7 +474,6 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
              vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
              uint32_t evl, uintptr_t ra, bool is_load)
 {
-    uint32_t k;
     target_ulong page_split, elems, addr;
     uint32_t nf = vext_nf(desc);
     uint32_t vma = vext_vma(desc);
@@ -519,17 +519,16 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 
     /* Load/store elements in the second page */
     if (unlikely(env->vstart < evl)) {
+        addr = base + env->vstart * msize;
+
         /* Cross page element */
         if (unlikely(page_split % msize)) {
-            for (k = 0; k < nf; k++) {
-                addr = base + ((env->vstart * nf + k) << log2_esz);
-                ldst_tlb(env, adjust_addr(env, addr),
-                        env->vstart + k * max_elems, vd, ra);
-            }
+            vext_ldst_nf_tlb(env, vd, addr, env->vstart,
+                             nf, esz, max_elems, ldst_tlb, ra);
             env->vstart++;
+            addr += msize;
         }
 
-        addr = base + ((env->vstart * nf) << log2_esz);
         /* Get number of elements of second page */
         elems = evl - env->vstart;
 
@@ -724,7 +723,7 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
           uint32_t desc, vext_ldst_elem_fn_tlb *ldst_tlb,
           vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz, uintptr_t ra)
 {
-    uint32_t i, k, vl = 0;
+    uint32_t i, vl = 0;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
@@ -806,17 +805,16 @@ ProbeSuccess:
 
             /* Load/store elements in the second page */
             if (unlikely(env->vstart < env->vl)) {
+                addr = base + env->vstart * msize;
+
                 /* Cross page element */
                 if (unlikely(page_split % msize)) {
-                    for (k = 0; k < nf; k++) {
-                        addr = base + ((env->vstart * nf + k) << log2_esz);
-                        ldst_tlb(env, adjust_addr(env, addr),
-                                 env->vstart + k * max_elems, vd, ra);
-                    }
+                    vext_ldst_nf_tlb(env, vd, addr, env->vstart, nf,
+                                     esz, max_elems, ldst_tlb, ra);
                     env->vstart++;
+                    addr += msize;
                 }
 
-                addr = base + ((env->vstart * nf) << log2_esz);
                 /* Get number of elements of second page */
                 elems = env->vl - env->vstart;
 
@@ -827,16 +825,11 @@ ProbeSuccess:
             }
         } else {
             for (i = env->vstart; i < env->vl; i++) {
-                if (!vext_elem_mask(v0, i)) {
-                    if (vma) {
-                        vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
-                    }
-                    continue;
-                }
-                for (k = 0; k < nf; ++k) {
-                    addr = base + ((i * nf + k) << log2_esz);
-                    ldst_tlb(env, adjust_addr(env, addr), i + k * max_elems,
-                             vd, ra);
+                if (vext_elem_mask(v0, i)) {
+                    vext_ldst_nf_tlb(env, vd, base + i * msize, i, nf,
+                                     esz, max_elems, ldst_tlb, ra);
+                } else if (vma) {
+                    vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
                 }
             }
         }
-- 
2.43.0


