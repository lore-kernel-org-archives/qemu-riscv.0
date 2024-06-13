Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A1FC27C4F
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHlIb-0000Gw-54; Thu, 13 Jun 2024 10:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sHlIX-0000Ev-8D
 for qemu-riscv@nongnu.org; Thu, 13 Jun 2024 10:19:29 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sHlIV-0003ck-7T
 for qemu-riscv@nongnu.org; Thu, 13 Jun 2024 10:19:28 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-70436ac8882so842892b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Jun 2024 07:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718288364; x=1718893164; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=10cMDHZvE0ZWYZou04C7wNwX0NYAeUSY86V5tPIbZF0=;
 b=DUkfGFcHWXNzzTOcHXB5zPleYTuEbkinzAFQjcBdDlM8r8vJlt9pG99euhHUXOvvGT
 l27/wsz5+5KtHHdz3LEbhTV5W85dlSS93Cq3vGaT+gNPgtExvnvh7REK3aNz3DnaUVd6
 /jBSI2qeeUuWycmTG5V3qWxLew88m9ZZ8cJWmmJo6iMJQJ7LLwwxSYZD4k8xcB3Hm41P
 6chex5uBProeOutZufTSUl/fo5H0Da6C58tzUG0zsYTSgcyKGKSSdeyDSDs0ApNIrZOl
 JlU6YSJmR3WGhuEGVJR1QhGJXpQd9Elkx4/pmjQCr+1/3qhrEmeRgR+1hIcdal31AdQu
 8V5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718288364; x=1718893164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=10cMDHZvE0ZWYZou04C7wNwX0NYAeUSY86V5tPIbZF0=;
 b=Wu6oMcKuj30VcY+cClpBnu8y6OLcPXpnERexXLKftSFa3Jlj1xunBi7asHUWqHO/mM
 Y/Fp3fShk3AjbQCam7EQx9OEGta2DHb2F0i6Hmd5bWU9R2iBvwkb3auyFw1k5PaoZyDA
 6eTCzIq6Mt9GRL1YxyHcJVc94dhVBatFMEXImroNwitlUMtjTjpXZmxfuiO4SfQgJHYB
 aMzgzf/fuUpvQAiGTipYjbyEbRguqzwyPrGQ5g+CQ2ad5TFNkymoX0xjuRA18Nw9zZOb
 jH1Xdi47istV+ZDgFvREK9ESBZByYlmTQph84pRip4qNy3S6PQwA695nQa5OIyELrAqb
 ZU7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7nAlGIcUaxj1ztD9bR7oY9Mf84nUhPBA0z/3yN84jHjeeIaqvupvGuelg9/2MtMKfX2M8n+AsVd0mpq9tCh/z8K7NCF0=
X-Gm-Message-State: AOJu0YybUOan12T6FSZGuNXlFgqD6wkZ3abzVlUMWk8hryAiDhU1TH76
 9cgSn1Q4V3Ma9cWL440vd8SIC0gCOWYZ3yoaY4+Vz8MtryU/wbzaB2cVM5DAclaEXaqBojFHJpL
 IDRQ=
X-Google-Smtp-Source: AGHT+IHVpYvO9k0z+vG7UWjS4P/s7BvnyJr7bdSqE0esRt4UrWpzWOwZLxhfx4hxeMFjqlpzHDSjxw==
X-Received: by 2002:a05:6a20:2214:b0:1b0:225:2b27 with SMTP id
 adf61e73a8af0-1b8a9c564cbmr3666803637.51.1718288364516; 
 Thu, 13 Jun 2024 07:19:24 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f2fe6dsm14386975ad.257.2024.06.13.07.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 07:19:24 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v3 3/5] target/riscv: rvv: Provide a fast path using
 direct access to host ram for unit-stride whole register load/store
Date: Thu, 13 Jun 2024 22:19:04 +0800
Message-Id: <20240613141906.1276105-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613141906.1276105-1-max.chou@sifive.com>
References: <20240613141906.1276105-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/vector_helper.c | 185 +++++++++++++++++++++++++----------
 1 file changed, 133 insertions(+), 52 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d33ba5aeca1..b34d10b1b5d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -928,81 +928,162 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d_tlb)
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
+    RVVContLdSt info;
+    target_ulong addr;
+    void *host;
+    int flags;
+    intptr_t reg_start, reg_last;
+    uint32_t idx_nf, off, evl;
     uint32_t nf = vext_nf(desc);
     uint32_t vlenb = riscv_cpu_cfg(env)->vlenb;
     uint32_t max_elems = vlenb >> log2_esz;
+    uint32_t esz = 1 << log2_esz;
 
     if (env->vstart >= ((vlenb * nf) >> log2_esz)) {
         env->vstart = 0;
         return;
     }
 
-    k = env->vstart / max_elems;
-    off = env->vstart % max_elems;
+    vext_cont_ldst_elements(&info, base, env->vreg, env->vstart,
+                            nf * max_elems, desc, log2_esz, true);
+    vext_cont_ldst_pages(env, &info, base, is_load, desc, esz, ra);
+    vext_cont_ldst_watchpoints(env, &info, env->vreg, base, esz, is_load, ra,
+                               desc);
+
+    flags = info.page[0].flags | info.page[1].flags;
+    if (unlikely(flags != 0)) {
+        /* At least one page includes MMIO. */
+        reg_start = info.reg_idx_first[0];
+        idx_nf = reg_start / max_elems;
+        off = reg_start % max_elems;
+        evl = (idx_nf + 1) * max_elems;
+
+        if (off) {
+            /*
+             * load/store rest of elements of current segment pointed by vstart
+             */
+            addr = base + (reg_start << log2_esz);
+            for (; reg_start < evl; reg_start++, addr += esz) {
+                ldst_tlb(env, adjust_addr(env, addr), reg_start << log2_esz,
+                         vd, ra);
+            }
+            idx_nf++;
+        }
+
+        /* load/store elements for rest of segments */
+        evl = nf * max_elems;
+        addr = base + (reg_start << log2_esz);
+        for (; reg_start < evl; reg_start++, addr += esz) {
+            ldst_tlb(env, adjust_addr(env, addr), reg_start << log2_esz, vd,
+                     ra);
+        }
+
+        env->vstart = 0;
+        return;
+    }
+
+    /* The entire operation is in RAM, on valid pages. */
+    reg_start = info.reg_idx_first[0];
+    reg_last = info.reg_idx_last[0] + 1;
+    host = info.page[0].host;
+    idx_nf = reg_start / max_elems;
+    off = reg_start % max_elems;
+    evl = (idx_nf + 1) * max_elems;
 
     if (off) {
         /* load/store rest of elements of current segment pointed by vstart */
-        for (pos = off; pos < max_elems; pos++, env->vstart++) {
-            target_ulong addr = base + ((pos + k * max_elems) << log2_esz);
-            ldst_elem(env, adjust_addr(env, addr),
-                      (pos + k * max_elems) << log2_esz, vd, ra);
+        for (; reg_start < evl; reg_start++) {
+            ldst_host(vd, reg_start << log2_esz,
+                      host + (reg_start << log2_esz));
         }
-        k++;
+        idx_nf++;
     }
 
     /* load/store elements for rest of segments */
-    for (; k < nf; k++) {
-        for (i = 0; i < max_elems; i++, env->vstart++) {
-            target_ulong addr = base + ((i + k * max_elems) << log2_esz);
-            ldst_elem(env, adjust_addr(env, addr),
-                      (i + k * max_elems) << log2_esz, vd, ra);
+    for (; reg_start < reg_last; reg_start++) {
+        ldst_host(vd, reg_start << log2_esz, host + (reg_start << log2_esz));
+    }
+
+    /*
+     * Use the slow path to manage the cross-page misalignment.
+     * But we know this is RAM and cannot trap.
+     */
+    if (unlikely(info.mem_off_split >= 0)) {
+        reg_start = info.reg_idx_split;
+        addr = base + (reg_start << log2_esz);
+        ldst_tlb(env, adjust_addr(env, addr), reg_start << log2_esz, vd, ra);
+    }
+
+    if (unlikely(info.mem_off_first[1] >= 0)) {
+        reg_start = info.reg_idx_first[1];
+        reg_last = info.reg_idx_last[1] + 1;
+        host = info.page[1].host;
+        idx_nf = reg_start / max_elems;
+        off = reg_start % max_elems;
+        evl = (idx_nf + 1) * max_elems;
+
+        if (off) {
+            /*
+             * load/store rest of elements of current segment pointed by vstart
+             */
+            for (; reg_start < evl; reg_start++) {
+                ldst_host(vd, reg_start << log2_esz,
+                          host + (reg_start << log2_esz));
+            }
+            idx_nf++;
+        }
+
+        /* load/store elements for rest of segments */
+        for (; reg_start < reg_last; reg_start++) {
+            ldst_host(vd, reg_start << log2_esz,
+                      host + (reg_start << log2_esz));
         }
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


