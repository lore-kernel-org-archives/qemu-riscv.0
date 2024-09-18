Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0287CDD550
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 17:16:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sqyGP-00079W-Vl; Wed, 18 Sep 2024 13:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sqyGN-00070n-TZ
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 13:14:47 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sqyGL-0001sV-TZ
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 13:14:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2d89229ac81so14721a91.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 10:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1726679684; x=1727284484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Yad8rwljItd1lBOHF5l5s1r+xJNloMy2zxgaSK2408=;
 b=B0M8wGfJmr52R13ogbEEtv+A4mpbi2Q3Ai5WK/sWyj/DPhlIUn7ULnLeV1DIzCR4lb
 aKkvop2Qc0fJE1rEtRPqa76WNtwC+NVlMB0qnLdMHNkz558rJ9qDmSwIAjTzyFBijpm4
 LJH2WrOHY67gv/ZCVrUjrrSiWnBkI9riKhEDnrnLyVXv2zWwsHIx/XPLKwGNPtn4qP42
 JJUs/zFmrxo1m9kin1gjDv/pPev4Vlq/9E6D4Bn/oho1ldf1JnPsTXgR+l19UrucQ6ns
 h7wn7AMC2o8zD1NOrxOXAPObq5lRfCbhz9PzMWGR+9lfv2uJPY1ZBOYEcN0ai4sof+qI
 pFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726679684; x=1727284484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Yad8rwljItd1lBOHF5l5s1r+xJNloMy2zxgaSK2408=;
 b=uOTOq6pDyhHMKZAHBF+qNXqVXpZcQZWU6CSvAR2iGlv+2RGCT8UA0qlmVfZn26vC2R
 LC4zpwBFbBLBTVBmvt+CnAouVWyJG2Ynt5Qw44odxoOth/0rdACjRST8lZSWZ4OfQZBX
 iYlWotlfUM9Q37lgLE860l7PFthADE6pLLN1h72lLY0s90WuyyjVEt5btlkSiBzlKD25
 tjwBkleXK6M7cp9qZHvPd1gj8comYKmGrTyyKuk6eUDVzEvtLyrQaX9wpld6g16ITj/c
 HFl6+IL2Q1aJ0zrK3DE6vsbmGVp3lba6mT1XBmX6+HluuV9T4s5a0CHjixaZoZ9Lmra8
 ORqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvAyEEccN4c+0+BNLS3RN8ZPH+lSL8RXlBjMXKyA7iDBxjbTXpIuaFga8wBegwvqrzR3dX4JryS9tb@nongnu.org
X-Gm-Message-State: AOJu0Yyj51nnhbe94DQdrCnizu4WD8nqrnlOpkWeShKN8cX9A9enJIg3
 b1Gu0qZ2LUpylRGw0oyp2g87rOMNNAw04FgA2XANVMMgzB3/Eci1awZfJwTH2rA=
X-Google-Smtp-Source: AGHT+IHl/cq+jQ767dFrl98tnvZkUQ/QQHF12lnR5PjK9WvWtCvhlaP10/fDNWK6ANt8Iq4QJQPHRw==
X-Received: by 2002:a17:90b:110f:b0:2c3:40b7:1f6d with SMTP id
 98e67ed59e1d1-2db9fe8d7b7mr29095182a91.0.1726679684525; 
 Wed, 18 Sep 2024 10:14:44 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dd608e2318sm1914577a91.32.2024.09.18.10.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 10:14:44 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 negge@google.com, Max Chou <max.chou@sifive.com>
Subject: [PATCH v6 4/7] target/riscv: rvv: Provide a fast path using direct
 access to host ram for unit-stride whole register load/store
Date: Thu, 19 Sep 2024 01:14:09 +0800
Message-Id: <20240918171412.150107-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918171412.150107-1-max.chou@sifive.com>
References: <20240918171412.150107-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102f.google.com
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

The vector unit-stride whole register load/store instructions are
similar to unmasked unit-stride load/store instructions that is suitable
to be optimized by using a direct access to host ram fast path.

Because the vector whole register load/store instructions do not need to
handle the tail agnostic, so remove the vstart early exit checking.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/vector_helper.c | 129 +++++++++++++++++++----------------
 1 file changed, 70 insertions(+), 59 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c2fcf8b3a00..824e6401736 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -665,80 +665,91 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d_tlb)
  */
 static void
 vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
-                vext_ldst_elem_fn_tlb *ldst_elem, uint32_t log2_esz,
-                uintptr_t ra)
+                vext_ldst_elem_fn_tlb *ldst_tlb,
+                vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
+                uintptr_t ra, bool is_load)
 {
-    uint32_t i, k, off, pos;
+    target_ulong page_split, elems, addr;
     uint32_t nf = vext_nf(desc);
     uint32_t vlenb = riscv_cpu_cfg(env)->vlenb;
     uint32_t max_elems = vlenb >> log2_esz;
+    uint32_t evl = nf * max_elems;
+    uint32_t esz = 1 << log2_esz;
+    int mmu_index = riscv_env_mmu_index(env, false);
 
-    if (env->vstart >= ((vlenb * nf) >> log2_esz)) {
-        env->vstart = 0;
-        return;
+    /* Calculate the page range of first page */
+    addr = base + (env->vstart << log2_esz);
+    page_split = -(addr | TARGET_PAGE_MASK);
+    /* Get number of elements */
+    elems = page_split / esz;
+    if (unlikely(env->vstart + elems >= evl)) {
+        elems = evl - env->vstart;
     }
 
-    k = env->vstart / max_elems;
-    off = env->vstart % max_elems;
-
-    if (off) {
-        /* load/store rest of elements of current segment pointed by vstart */
-        for (pos = off; pos < max_elems; pos++, env->vstart++) {
-            target_ulong addr = base + ((pos + k * max_elems) << log2_esz);
-            ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, vd,
-                      ra);
-        }
-        k++;
+    /* Load/store elements in the first page */
+    if (likely(elems)) {
+        vext_page_ldst_us(env, vd, addr, elems, 1, max_elems, log2_esz,
+                          is_load, mmu_index, ldst_tlb, ldst_host, ra);
     }
 
-    /* load/store elements for rest of segments */
-    for (; k < nf; k++) {
-        for (i = 0; i < max_elems; i++, env->vstart++) {
-            target_ulong addr = base + ((i + k * max_elems) << log2_esz);
-            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
+    /* Load/store elements in the second page */
+    if (unlikely(env->vstart < evl)) {
+        /* Cross page element */
+        if (unlikely(page_split % esz)) {
+            addr = base + (env->vstart << log2_esz);
+            ldst_tlb(env, adjust_addr(env, addr), env->vstart, vd, ra);
+            env->vstart++;
         }
+
+        addr = base + (env->vstart << log2_esz);
+        /* Get number of elements of second page */
+        elems = evl - env->vstart;
+
+        /* Load/store elements in the second page */
+        vext_page_ldst_us(env, vd, addr, elems, 1, max_elems, log2_esz,
+                          is_load, mmu_index, ldst_tlb, ldst_host, ra);
     }
 
     env->vstart = 0;
 }
 
-#define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN)      \
-void HELPER(NAME)(void *vd, target_ulong base,       \
-                  CPURISCVState *env, uint32_t desc) \
-{                                                    \
-    vext_ldst_whole(vd, base, env, desc, LOAD_FN,    \
-                    ctzl(sizeof(ETYPE)), GETPC());   \
-}
-
-GEN_VEXT_LD_WHOLE(vl1re8_v,  int8_t,  lde_b_tlb)
-GEN_VEXT_LD_WHOLE(vl1re16_v, int16_t, lde_h_tlb)
-GEN_VEXT_LD_WHOLE(vl1re32_v, int32_t, lde_w_tlb)
-GEN_VEXT_LD_WHOLE(vl1re64_v, int64_t, lde_d_tlb)
-GEN_VEXT_LD_WHOLE(vl2re8_v,  int8_t,  lde_b_tlb)
-GEN_VEXT_LD_WHOLE(vl2re16_v, int16_t, lde_h_tlb)
-GEN_VEXT_LD_WHOLE(vl2re32_v, int32_t, lde_w_tlb)
-GEN_VEXT_LD_WHOLE(vl2re64_v, int64_t, lde_d_tlb)
-GEN_VEXT_LD_WHOLE(vl4re8_v,  int8_t,  lde_b_tlb)
-GEN_VEXT_LD_WHOLE(vl4re16_v, int16_t, lde_h_tlb)
-GEN_VEXT_LD_WHOLE(vl4re32_v, int32_t, lde_w_tlb)
-GEN_VEXT_LD_WHOLE(vl4re64_v, int64_t, lde_d_tlb)
-GEN_VEXT_LD_WHOLE(vl8re8_v,  int8_t,  lde_b_tlb)
-GEN_VEXT_LD_WHOLE(vl8re16_v, int16_t, lde_h_tlb)
-GEN_VEXT_LD_WHOLE(vl8re32_v, int32_t, lde_w_tlb)
-GEN_VEXT_LD_WHOLE(vl8re64_v, int64_t, lde_d_tlb)
-
-#define GEN_VEXT_ST_WHOLE(NAME, ETYPE, STORE_FN)     \
-void HELPER(NAME)(void *vd, target_ulong base,       \
-                  CPURISCVState *env, uint32_t desc) \
-{                                                    \
-    vext_ldst_whole(vd, base, env, desc, STORE_FN,   \
-                    ctzl(sizeof(ETYPE)), GETPC());   \
-}
-
-GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b_tlb)
-GEN_VEXT_ST_WHOLE(vs2r_v, int8_t, ste_b_tlb)
-GEN_VEXT_ST_WHOLE(vs4r_v, int8_t, ste_b_tlb)
-GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b_tlb)
+#define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN_TLB, LOAD_FN_HOST)   \
+void HELPER(NAME)(void *vd, target_ulong base, CPURISCVState *env,  \
+                  uint32_t desc)                                    \
+{                                                                   \
+    vext_ldst_whole(vd, base, env, desc, LOAD_FN_TLB, LOAD_FN_HOST, \
+                    ctzl(sizeof(ETYPE)), GETPC(), true);            \
+}
+
+GEN_VEXT_LD_WHOLE(vl1re8_v,  int8_t,  lde_b_tlb, lde_b_host)
+GEN_VEXT_LD_WHOLE(vl1re16_v, int16_t, lde_h_tlb, lde_h_host)
+GEN_VEXT_LD_WHOLE(vl1re32_v, int32_t, lde_w_tlb, lde_w_host)
+GEN_VEXT_LD_WHOLE(vl1re64_v, int64_t, lde_d_tlb, lde_d_host)
+GEN_VEXT_LD_WHOLE(vl2re8_v,  int8_t,  lde_b_tlb, lde_b_host)
+GEN_VEXT_LD_WHOLE(vl2re16_v, int16_t, lde_h_tlb, lde_h_host)
+GEN_VEXT_LD_WHOLE(vl2re32_v, int32_t, lde_w_tlb, lde_w_host)
+GEN_VEXT_LD_WHOLE(vl2re64_v, int64_t, lde_d_tlb, lde_d_host)
+GEN_VEXT_LD_WHOLE(vl4re8_v,  int8_t,  lde_b_tlb, lde_b_host)
+GEN_VEXT_LD_WHOLE(vl4re16_v, int16_t, lde_h_tlb, lde_h_host)
+GEN_VEXT_LD_WHOLE(vl4re32_v, int32_t, lde_w_tlb, lde_w_host)
+GEN_VEXT_LD_WHOLE(vl4re64_v, int64_t, lde_d_tlb, lde_d_host)
+GEN_VEXT_LD_WHOLE(vl8re8_v,  int8_t,  lde_b_tlb, lde_b_host)
+GEN_VEXT_LD_WHOLE(vl8re16_v, int16_t, lde_h_tlb, lde_h_host)
+GEN_VEXT_LD_WHOLE(vl8re32_v, int32_t, lde_w_tlb, lde_w_host)
+GEN_VEXT_LD_WHOLE(vl8re64_v, int64_t, lde_d_tlb, lde_d_host)
+
+#define GEN_VEXT_ST_WHOLE(NAME, ETYPE, STORE_FN_TLB, STORE_FN_HOST)     \
+void HELPER(NAME)(void *vd, target_ulong base, CPURISCVState *env,      \
+                  uint32_t desc)                                        \
+{                                                                       \
+    vext_ldst_whole(vd, base, env, desc, STORE_FN_TLB, STORE_FN_HOST,   \
+                    ctzl(sizeof(ETYPE)), GETPC(), false);               \
+}
+
+GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b_tlb, ste_b_host)
+GEN_VEXT_ST_WHOLE(vs2r_v, int8_t, ste_b_tlb, ste_b_host)
+GEN_VEXT_ST_WHOLE(vs4r_v, int8_t, ste_b_tlb, ste_b_host)
+GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b_tlb, ste_b_host)
 
 /*
  * Vector Integer Arithmetic Instructions
-- 
2.34.1


