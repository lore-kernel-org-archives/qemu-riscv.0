Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9123DC5DF6A
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:48:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKm-0007OB-3T; Sat, 15 Aug 2026 15:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKj-0007KE-6h
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:21 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKh-0008Lj-4K
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:20 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2cf50c6f235so25704355ad.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823178; x=1787427978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HEmanzey66AM32+Ka5lo5pqmPx+R0ZxDJxeFbZuCuhU=;
 b=rx7+pkXEX7ktDiXbmz3tiskY/UKvR8R2DSX+tKhhoPLhFwlutDQiGnSMqGBgVUm5HG
 ZziMc+r4G90cCEElITJnkiyBZHRXhLPQRXy57ax2zZtbtb5FyTTwKH8SnDlNi/xcj34W
 V3fVEiySecq6BdZfxDst1OUUGvvV/xyrjMrgPGV4VbQTpMBuvfUAXjQO0GFtZf17ioEN
 /asR86UrIAkaUJ95sYfInAmfRhVoRsc0jkbVf5b2PhuFC/uYFq+z47IdQJK2wuA32s+A
 IbU7qcXHVH+Sipv5jiBpUW5AYnIY0wFZ0Uc275SkkY6xGWlr6D3rcEJALituX3qluGWm
 9NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823178; x=1787427978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HEmanzey66AM32+Ka5lo5pqmPx+R0ZxDJxeFbZuCuhU=;
 b=EHHcaC0TyKLU9IWNfwCVn4oqjpR3xgdJgfAYiv5wMMnIJ3TfVnIP9K6NLCJQJKa/NG
 dQ28OSphijVKS31rAswdv+zqsWcF1fFUlbvglqnfccfwS+mULCScndlICgTLup3xklwt
 FOIFHwJA4rqcXTS5vtKHsiPSbkfg753Tb1uxqHPdbQ0TxlmqQqaRJq1rUpvpnhDSAj4t
 GKD2OJmSjcGdUzNSIQcod3jDGTJ3yxTlxZzbDEETLUxJtCwnaLz8FotzguKl5fwUwABE
 VaA6ThO/30TJAvPMSk0Ecw3FElEGbRsrz88XboCjQH5HVBsu1nkTL4rE8KQ25OiXGqNU
 7E9Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoXEDd3lbAeH18sSWHd3h6Ethj4jdmryicARWpm+XMxXbAaZDQwrg0e0fJtsctAED2ONdoF/v1vHmB+@nongnu.org
X-Gm-Message-State: AOJu0YyVZFD4/H1TY0vNpmfMSeH1IqWuwln3oamAfmIwVERs2/X8Zy2+
 zT/LNBCbkPJWswU7c5yN329X5Yrms8btiOMtiAWMCQF++v42iWa/P8L69iIsqRrLyFY=
X-Gm-Gg: AR+sD1178BloJ/GTzGIWeH/GxdHlwv/PhtdSt9ogQ6d9UlC3Nf/0DHDHeolEZ5lt8Nn
 Mmutuj2Ho2yAUhGwS17l0YmDbdRdNOZPVXZeqZVhlkvHWX9fyP/sgMhQnLYzJFeGC4f39H+GmQE
 pQ+3a008psprHudYnGr8YrhM9fREoQsJtGCgfb1gHsEyHCdEIEPwXAtM16TW8U/Vd+tC3/u8DvM
 YVoHz5F5NjQiKmRRXBW9Z7klfXsiiigWvrinZFuHp2KdgJ+z4spS9S44L1m4xWtRGeHd9Df+Vdz
 ZpX1Hdkh05stI8WDA04Tc6j//djDsu9UgstAyEBVM30Mxs8IWv2IpgyBSFDxsluFHYJ3KYxW6ma
 yi6HmTJtnAAIzYZYcUxUOIP5mRIyMixb0EcHUMMRGzw5GsbDqNLR1XVR6vSulnV4N3F+vhjclSw
 IX/R5bRAP7PG2qzzbZM5erjlZEYZmzHcc3JjEdCe8I7p/1gkrzfOeUQh5BZsIhhhcrYvnoCG1eL
 f46B+lBUjPYRa8uLIeH
X-Received: by 2002:a17:903:2c8:b0:2ca:e5c:7fcf with SMTP id
 d9443c01a7336-2d3b08014f7mr182553535ad.3.1786823177576; 
 Sat, 15 Aug 2026 12:46:17 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 17/23] target/riscv: Pass MemOpIdx to vext_ldst_us
Date: Sat, 15 Aug 2026 12:45:42 -0700
Message-ID: <20260815194549.1377505-18-richard.henderson@linaro.org>
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
index 178ed32429..5ead4cd6fe 100644
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
@@ -412,12 +425,12 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env,
              uint32_t max_elems, bool vma,
              vext_ldst_elem_fn_tlb *ldst_tlb,
              vext_ldst_elem_fn_host *ldst_host,
-             uintptr_t ra, bool is_load)
+             uintptr_t ra, bool is_load, MemOpIdx oi)
 {
     target_ulong elems, addr, last, last_in_page, page_split;
     uint32_t esz = 1 << log2_esz;
     uint32_t msize = nf * esz;
-    int mmu_index = riscv_env_mmu_index(env, false);
+    int mmu_index = get_mmuidx(oi);
     MMUAccessType access_type = is_load ? MMU_DATA_LOAD : MMU_DATA_STORE;
     uint32_t i = env->vstart;
     void *host;
@@ -515,7 +528,8 @@ vext_ldst_us_desc(void *vd, target_ulong base, CPURISCVState *env,
 {
     vext_ldst_us(vd, base, env, log2_esz, vext_nf(desc), evl,
                  vext_max_elems(desc, log2_esz), vext_vma(desc),
-                 ldst_tlb, ldst_host, ra, is_load);
+                 ldst_tlb, ldst_host, ra, is_load,
+                 vext_oi(desc, log2_esz));
 }
 
 /*
@@ -958,7 +972,8 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     uint32_t evl = (riscv_cpu_cfg(env)->vlenb * vext_nf(desc)) >> log2_esz;
 
     vext_ldst_us(vd, base, env, log2_esz, 1, evl, evl, false,
-                 ldst_tlb, ldst_host, ra, is_load);
+                 ldst_tlb, ldst_host, ra, is_load,
+                 vext_oi(desc, log2_esz));
 }
 
 #define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN_TLB, LOAD_FN_HOST)   \
-- 
2.43.0


