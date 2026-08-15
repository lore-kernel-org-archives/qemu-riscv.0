Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634B2C5DF6A
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:46:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKj-0007Is-3g; Sat, 15 Aug 2026 15:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKS-0007Gp-GA
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:05 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKP-0008FT-Rt
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:04 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2ce87c7e3bbso26850855ad.1
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823160; x=1787427960; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FcNFOnOL8974glwABu+kV2mxfPSi3R5uRGeROQDc4EQ=;
 b=ngVXFLKiuracZoCOGOGSLyBeH/M2RMz5k819RLU37JYetNRMe/UOEdmNxRTZ97eqlB
 CWmPwxVQNlCIoJGly8xfKI1FBsi6t8qzSbBgMYqJ6t0pNAuOyuAT4cmJXufribmAUeUw
 MdQXfHjxMYjgfKzsZJMnFLZKD1+XuVpkbxvAmHecHYJPDRaYtUYd6+wPpnt/14hI4FqL
 XPvDgIOpVs/qqicB0Bo8sSsBcf+X4RfL8QbYXLcr1/QwGEjulZFez3WnTp1ozYKkGu/C
 iCE2qkveMtK597AsNoE+AHqzD4F5F+Jwy4LlZAcpvbF+3kCmKJbNfZUv1sTPtdtLts3Y
 51kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823160; x=1787427960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FcNFOnOL8974glwABu+kV2mxfPSi3R5uRGeROQDc4EQ=;
 b=OLHVN5hK3rl/NVsTyzijZYTfuhMpx128yk/Vd3yt+Qap9DLkgSXms+btD3GtH8TVKL
 VEfHQax2MmF4ebMSAOF/Qoo9iOiafzhJIFPaLJcJsoNnsfIlp3qEEFR1knzeSqp5TKbj
 D4C59tB88sgfPTbnkkqWs6vV5nFN9Lj7RkWtD4DsEW791zcj+LFxagnepo7sqDqTyDtb
 2Q7h/aGbzC9FVHuLdQ4OO1iAgDyIfZQM7rL2bPk7D95MHTjg+yEjWVBGg+da7Q/G+Puv
 BHcPfalXo1qs/aVCIx6RVcQF/qpuLPrpREwTDArpP3P5aqURBIuApQYc0VhBePyY0ga1
 krUQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RodVTUT2TXV6+snwmgbBdsNzSQMeFKpLYFgZUjG0e/SLvTFkWRMi9dATMOhjt4Grl7c4o8HjL0JD/Il@nongnu.org
X-Gm-Message-State: AOJu0YyzBKsy0XP/p2OcstAoJGT4RYvNFpIb5rzQ2b68wvaPiMTbwBJR
 CBZk+EcJPvDBnJYesO+F0OxvtGanUo3siggbXiFI1kgMUQfDldqeBzOxu6pAC/4dXJwM+zG0U/4
 Ol53m
X-Gm-Gg: AR+sD11BniNpEWcfyGdpfeoi/ojTfUd8BHfZI/JT3UpitjL/mcjbfRuv3x1Ia9rsU+w
 f7M4XC2LWQkyQaI0oJcvujaWCeWI4m2JwTzKBYlbUM0Ot19XIHNPxXLZ9nUXkA2WEcV5OpOb1PB
 PbMBiYdwAQojZvCDrn/rGm2kwl6r8MM10h4zqPs9qvNYYCfk6kEFihJXG6r/8f8sm8pE9BM/pPG
 XZdpZ+SYs1cJcXc5FDUQ6CoR9ZOAKJtaZvz06tLJrLv2KnSfc/cFG/zwQxmjDdm9zyhaMU8bhmR
 EWPkppOYzOEJe3DjUf28z0n2espv4s4+aXu7jpTwEXoUbDkJDfwoMQ0Pb0fXp4QJmbioOktLZ2N
 0hNBQ3K5UGxpqvR3bri6XUEX5dACfegXGVckCWSa/xVT53DwGUkf70vNY2PA8Iqa9oLPtdg1/F/
 +TtGQ6UkcxezKD7LkRPuojNrA6msUVeXxE1oytPGYJxWwuNgekkgJn7mhJ2PJ6BOyP7wkiQXU3d
 GgANBhYOg3V6B8n5sujaWAKdSzVqww=
X-Received: by 2002:a17:902:c40a:b0:2c7:f4bd:91b5 with SMTP id
 d9443c01a7336-2d3b04bba89mr151713965ad.0.1786823160413; 
 Sat, 15 Aug 2026 12:46:00 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 01/23] target/riscv: Split out vext_set_nf_elems_1s
Date: Sat, 15 Aug 2026 12:45:26 -0700
Message-ID: <20260815194549.1377505-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Provide a helper that 1's element I for all NF vectors.
For the callers, this performs the element mask test once
instead of NF times.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 69 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index e28d8a3d9f..20a8f95efb 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -328,6 +328,15 @@ static void vext_set_tail_elems_1s(uint32_t vl, void *vd,
     }
 }
 
+static void vext_set_nf_elems_1s(void *vd, uint32_t i, uint32_t nf,
+                                 uint32_t esz, uint32_t max_elems)
+{
+    for (uint32_t k = 0; k < nf; ++k) {
+        vext_set_elems_1s(vd, true, (i + k * max_elems) * esz,
+                          (i + k * max_elems + 1) * esz);
+    }
+}
+
 /*
  * stride: access vector element from strided memory
  */
@@ -337,7 +346,6 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base, target_ulong stride,
                  vext_ldst_elem_fn_tlb *ldst_elem, uint32_t log2_esz,
                  uintptr_t ra)
 {
-    uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
@@ -345,23 +353,21 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base, target_ulong stride,
 
     VSTART_CHECK_EARLY_EXIT(env, env->vl);
 
-    for (i = env->vstart; i < env->vl; env->vstart = ++i) {
-        k = 0;
-        while (k < nf) {
-            if (!vm && !vext_elem_mask(v0, i)) {
-                /* set masked-off elements to 1s */
-                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
-                                  (i + k * max_elems + 1) * esz);
-                k++;
-                continue;
+    for (uint32_t i = env->vstart; i < env->vl; env->vstart = ++i) {
+        if (!vm && !vext_elem_mask(v0, i)) {
+            if (vma) {
+                vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
             }
+            continue;
+        }
+
+        for (uint32_t k = 0; k < nf; ++k) {
             target_ulong addr = base + stride * i + (k << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
-            k++;
         }
     }
-    env->vstart = 0;
 
+    env->vstart = 0;
     vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
@@ -632,7 +638,6 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
                 vext_ldst_elem_fn_tlb *ldst_elem,
                 uint32_t log2_esz, uintptr_t ra)
 {
-    uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
@@ -641,24 +646,21 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
 
     VSTART_CHECK_EARLY_EXIT(env, env->vl);
 
-    /* load bytes from guest memory */
-    for (i = env->vstart; i < env->vl; env->vstart = ++i) {
-        k = 0;
-        while (k < nf) {
-            if (!vm && !vext_elem_mask(v0, i)) {
-                /* set masked-off elements to 1s */
-                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
-                                  (i + k * max_elems + 1) * esz);
-                k++;
-                continue;
+    for (uint32_t i = env->vstart; i < env->vl; env->vstart = ++i) {
+        if (!vm && !vext_elem_mask(v0, i)) {
+            if (vma) {
+                vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
             }
+            continue;
+        }
+
+        for (uint32_t k = 0; k < nf; ++k) {
             abi_ptr addr = get_index_addr(base, i, vs2) + (k << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
-            k++;
         }
     }
-    env->vstart = 0;
 
+    env->vstart = 0;
     vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
@@ -824,25 +826,22 @@ ProbeSuccess:
             }
         } else {
             for (i = env->vstart; i < env->vl; i++) {
-                k = 0;
-                while (k < nf) {
-                    if (!vext_elem_mask(v0, i)) {
-                        /* set masked-off elements to 1s */
-                        vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
-                                          (i + k * max_elems + 1) * esz);
-                        k++;
-                        continue;
+                if (!vext_elem_mask(v0, i)) {
+                    if (vma) {
+                        vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
                     }
+                    continue;
+                }
+                for (k = 0; k < nf; ++k) {
                     addr = base + ((i * nf + k) << log2_esz);
                     ldst_tlb(env, adjust_addr(env, addr), i + k * max_elems,
                              vd, ra);
-                    k++;
                 }
             }
         }
     }
-    env->vstart = 0;
 
+    env->vstart = 0;
     vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
-- 
2.43.0


