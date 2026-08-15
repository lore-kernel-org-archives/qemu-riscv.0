Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E0CC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:50:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKp-0007SV-NN; Sat, 15 Aug 2026 15:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKe-0007JK-E3
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:18 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKb-0008Jr-DN
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:16 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2d5655cc850so2242705ad.3
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823172; x=1787427972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kIcqFilPWZIzxet5M1i5bmYJsXUO1m+vtWn5m97WeJ8=;
 b=D2a6AUzfxCR8ryziqEgbiCVpWMszK5EXUjfZ09Kley8m+qNcj+A9W40e37oqLj8nzy
 cwv8AvFh3nP7UGgUJ496arnmc7XvX4Lpbox9lXHli8mbLjALxgeP5tB4e904B9FTkOWG
 4I4nnXUgna9KI/Xoh6Po/nyx2rwhmJFF/+YV4OckwUPgkTOH3h32bMtWaMez9VY7BYNt
 LR+xcViDOWvozcMXVBJXnT6u/iaCrW33WHmxgVRi4pcUYBii7+5U9OzhMqWmiSCxdt5C
 T0dzfm6N1rq35XPm85sytQdTi7/hxnT4dhA7DMOR1JRzbq8ncEWtovSd6IZe2th/KYS0
 r1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823172; x=1787427972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kIcqFilPWZIzxet5M1i5bmYJsXUO1m+vtWn5m97WeJ8=;
 b=bGiUy+mMFCUirYjyTH7g7mQSjJUkIDp3XqItll5XcK0r1PRRDEPJcN0KuNdIFCebgJ
 xdUZ7zEeqdcx9FCzJuVFXWoRgpiwe0u0gSd7jtho1ec43n8xJExUjN6ifNovNQfnd2NF
 I+bswr1y4n/wZQf0C5l/AHQgTN41yok5JAdkdumdc0b+SV1G0XFuBmo/6sMEhtDffbs1
 FdI/17fKZTO8FZtHcArDh7Mmrj9ybDqpJs69/Cn50yNsH6T58eLq5bxtdDKThRPSMEB5
 A4Q5vFWIBW+rjrDP9UH9Av2fhbze19HExrDh4nsJrJ96UwawKJ0h1QVtmJSts8DBLWW9
 ToEw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpKqX+uXAHXePqXv9qhWYbH0nYib4HthGescYfaIVyMEZ9UAVqx1404VzbzJarJTh2Zczsz1z/Gca0n@nongnu.org
X-Gm-Message-State: AOJu0YyEBC/C2lVPl+/p/8Ng6bqGV6138fT1n469IlGYjvCiEqnNCy3j
 GNmmAz5soifXpXMp6P4Tf14dB6nxYxPsVSXd25TFl7wU+l3H0MnC6y7Rl/kh2SU1grQ=
X-Gm-Gg: AR+sD114qid8zys1EEVMX/3Dd9b24yxQMCP9Xv/I1EkxOrVoLr7KOVzBgj4wkzZ8L/A
 3goyqgiaOMLK1l5n5aX/6qNiOxzHBIwAOT4IzkVeZn8f08m/TOWm2RN8NUA+PcJJwgx91C9RGhk
 AgmPRzD4WVAlp5Jcc3/xAbD/32bPX6bA8LRVIRH3CODZUnVIF2k2g/y0QyMD1VV313R0ND1BKZj
 BbJcRpr6/tn3fBihsBxcNh7xz85aNHsPodeX8nkSSUNjyJemdznApIcAtkb8z66oHdBl6nwglTg
 rmf/wDdRgffGy4joYrhfKoON24VHLk+DAL+uLanV0IHHIKLG1F+UMQn0TNqvJvjwOo0JUd0PZqo
 e9jO4+2FxnfRqC5hziD7KO4nFg2pBOGja+CpPPtw+4az/Ab57rjVayGkgsVDsCakqw2b+QqdJiw
 nfeDOpdLhTonJhvj4t5rjw7Pczjo2L7oaMrPlyWScnLv2EC8rRXQZi4IqYCoaI3aLImtF08TnGm
 1+54lQz0wWiIV7zaOpgH71bvw==
X-Received: by 2002:a17:902:f647:b0:2c6:a772:7e43 with SMTP id
 d9443c01a7336-2d3b0cf4b68mr172787265ad.18.1786823172022; 
 Sat, 15 Aug 2026 12:46:12 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 12/23] target/riscv: Split out vext_ldst_us_desc
Date: Sat, 15 Aug 2026 12:45:37 -0700
Message-ID: <20260815194549.1377505-13-richard.henderson@linaro.org>
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

Rename vext_ldst_us to vext_ldst_us_desc and split out
a new vext_ldst_us that doesn't use 'desc'.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 38 ++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index b482537f40..abb1ebcb43 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -478,15 +478,14 @@ static void vext_test_alignment(CPURISCVState *env, vaddr addr, uint32_t esz,
 }
 
 static inline QEMU_ALWAYS_INLINE void
-vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
+vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env,
+             uint32_t log2_esz, uint32_t nf, uint32_t evl,
+             uint32_t max_elems, bool vma,
              vext_ldst_elem_fn_tlb *ldst_tlb,
-             vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
-             uint32_t evl, uintptr_t ra, bool is_load)
+             vext_ldst_elem_fn_host *ldst_host,
+             uintptr_t ra, bool is_load)
 {
     target_ulong elems, addr, last, last_in_page, page_split;
-    uint32_t nf = vext_nf(desc);
-    uint32_t vma = vext_vma(desc);
-    uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
     uint32_t msize = nf * esz;
     int mmu_index = riscv_env_mmu_index(env, false);
@@ -579,6 +578,17 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     }
 }
 
+static inline QEMU_ALWAYS_INLINE void
+vext_ldst_us_desc(void *vd, target_ulong base, CPURISCVState *env,
+                  uint32_t desc, vext_ldst_elem_fn_tlb *ldst_tlb,
+                  vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
+                  uint32_t evl, uintptr_t ra, bool is_load)
+{
+    vext_ldst_us(vd, base, env, log2_esz, vext_nf(desc), evl,
+                 vext_max_elems(desc, log2_esz), vext_vma(desc),
+                 ldst_tlb, ldst_host, ra, is_load);
+}
+
 /*
  * masked unit-stride load and store operation will be a special case of
  * stride, stride = NF * sizeof (ETYPE)
@@ -596,8 +606,8 @@ void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,     \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,            \
                   CPURISCVState *env, uint32_t desc)                \
 {                                                                   \
-    vext_ldst_us(vd, base, env, desc, LOAD_FN_TLB, LOAD_FN_HOST,    \
-                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), true);      \
+    vext_ldst_us_desc(vd, base, env, desc, LOAD_FN_TLB, LOAD_FN_HOST,    \
+                      ctzl(sizeof(ETYPE)), env->vl, GETPC(), true);      \
 }
 
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b_tlb, lde_b_host)
@@ -617,8 +627,8 @@ void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,          \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                 \
                   CPURISCVState *env, uint32_t desc)                     \
 {                                                                        \
-    vext_ldst_us(vd, base, env, desc, STORE_FN_TLB, STORE_FN_HOST,       \
-                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), false);          \
+    vext_ldst_us_desc(vd, base, env, desc, STORE_FN_TLB, STORE_FN_HOST,  \
+                      ctzl(sizeof(ETYPE)), env->vl, GETPC(), false);     \
 }
 
 GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b_tlb, ste_b_host)
@@ -634,8 +644,8 @@ void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
 {
     /* evl = ceil(vl/8) */
     uint8_t evl = (env->vl + 7) >> 3;
-    vext_ldst_us(vd, base, env, desc, lde_b_tlb, lde_b_host,
-                 0, evl, GETPC(), true);
+    vext_ldst_us_desc(vd, base, env, desc, lde_b_tlb, lde_b_host,
+                      0, evl, GETPC(), true);
 }
 
 void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
@@ -643,8 +653,8 @@ void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
 {
     /* evl = ceil(vl/8) */
     uint8_t evl = (env->vl + 7) >> 3;
-    vext_ldst_us(vd, base, env, desc, ste_b_tlb, ste_b_host,
-                 0, evl, GETPC(), false);
+    vext_ldst_us_desc(vd, base, env, desc, ste_b_tlb, ste_b_host,
+                      0, evl, GETPC(), false);
 }
 
 /*
-- 
2.43.0


