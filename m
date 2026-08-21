Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F394EC5DF88
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:06:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUM-0005zb-FG; Fri, 21 Aug 2026 00:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUK-0005yB-Ai
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:16 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUH-00039e-6a
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:15 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-3900e39d935so502885a91.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285052; x=1787889852; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FcNFOnOL8974glwABu+kV2mxfPSi3R5uRGeROQDc4EQ=;
 b=lym96s6HCDxM/MXJMjRramhd6BsKbFyG77i8r1C4BufljHms1t34QQnLHIkvIK974h
 y38LBsE5MpDSOZg7t90vDmBsmaS8rD++MH2wEw/dY+LWdlE7afYy/U5FfSLOrcM2X9mR
 0DwFnUTMUOhO9YJruUft+hltJKNvprs+dF2hgX7frskkzqy2F1REuOcwT8CJFhbAsdKK
 q9EYx/DEIx8l/9bHMN8BlT+rrNQKJkSNatYURgiYrmbB6D9wx4EbvbE0eF981LIwVH4u
 0NHai0yRwhaXCUD/sxFgqHrKa4sejSfMc4xp7nLmYIPk94uUaEkrbBdwn613JgYFLNzp
 X+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285052; x=1787889852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FcNFOnOL8974glwABu+kV2mxfPSi3R5uRGeROQDc4EQ=;
 b=EXDSf1KxI70GPNLwnPSMR29rqD0C3M2XtcYisNftcrNYtaa9jsIRhhr0qph8XazuE6
 HpNLXoKPjrGoyBApHj8TMA0RdTCBkXs+grN1mx7sTAu/QAmagdjpg4ZJY++oBxMhWs2Z
 fvJEw1AucMqB42HXRE48SdHurYfDr3M4STa42frgRN3nx3qCiPNROKG3bAHKsSaP7iu6
 57FXPybT1HyC4edJg+bXppgpBonNXYejMCM2RVZqTxqgw4FFDsTrj9iRih/9XOQYmUGJ
 e/I4U2V+RuDxnRwY68OjBOW2xesqPikaRXPFzzrqPDzVCph4XByDOe81cMAUoM5iV+N7
 N/vA==
X-Gm-Message-State: AFuF++nBXxiI/rx5X+XBe50VVc5m8u5NPdL3Bdu097jOyGF6Ej33DFJU
 xFNVCdy1MgP3ftDTGOz2j2/H3oI0qipmFWWVHoyM6EkrtWZ4OcrrYxmWrbCfDBdP3ekp67PRt0V
 vVLy4
X-Gm-Gg: AR+sD11mrQZd24x6dqm6iUeMluc6ONLef5vDe3oXu9hywvv2ss1gk96M7igHzeTDm/t
 jdBw8TLngx07y1IluBj61uuLVtte2rzdfmYWpP3wvFoDj96Cuhxd3OUnmyLODdCxyQ5hjn0mFVD
 LbZml5WHZbM8Tu+obw1kc7I8+6MaUVU9l0wS/LcgIvG3HlPFFfAA7tfyR1E6whDHtMS8sDt5BxE
 f9EtFL30im7zSv0fMVdNzFHZRhzYIHYMhSc71XFR7WhsQQZvShefgWbmI5fIgV4dgxZNrrPDAZD
 IZ2/u1Fba0HDweGVINwonoaxAeZoFmC2elOJr/MOb1TOygKOBBuRcxSVGb4DPPWraJI7CQXuo87
 0g4y0RymYkLjolbTh2mAVGvU22YCJcpunbYpSz4Umn2/mPKy4DOb2sJg6xcmGwDWbHsXRMYdtWs
 jndbeIHGK6ZeUsG/NR6S5A0PNNjQEk71J9vKUjQCEsUZjjyMUOj/Wwvy82FiO4meky2Sjy
X-Received: by 2002:a17:90b:58ce:b0:38e:5964:97a8 with SMTP id
 98e67ed59e1d1-395c398662amr6901770a91.16.1787285051829; 
 Thu, 20 Aug 2026 21:04:11 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 01/23] target/riscv: Split out vext_set_nf_elems_1s
Date: Thu, 20 Aug 2026 21:03:42 -0700
Message-ID: <20260821040404.268123-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


