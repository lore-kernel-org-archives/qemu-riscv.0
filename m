Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F82C28B28
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 19:23:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tsRf6-0008N1-8g; Wed, 12 Mar 2025 15:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tsRev-0008Kk-0i
 for qemu-riscv@nongnu.org; Wed, 12 Mar 2025 15:22:30 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tsRen-0002VJ-QU
 for qemu-riscv@nongnu.org; Wed, 12 Mar 2025 15:22:28 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso123393f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Mar 2025 12:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1741807340; x=1742412140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0YnjXDNpttgXUs2gL4RwCNxe64IM7pUjPhQO2nAK70=;
 b=cpu/j0nB/JwosHUMfuQc1yvl6f0BKU6RS/3Z7jxglOv4LtTGCAcxBmtgFomHemNZ9C
 rQDykJvFffCV6BnB+4VhE049qaCuaBXVwgTC/alinEhlP7blSnd7J338Ix6QFc2t9UEr
 ud/3heNtd2QybMfIE4G7IVbtzdV7aHorFTRRm7zfV6roRXA5ROJ/8OUIrrUbSzBiqLCo
 6Vel8RoZy4y25f9H/R1LpvH29YYUXGmfUjv5RV2KfL63oKgPrfxeT1jqg2S3nW2Gi8nJ
 5dAK84oX1JBs4HH9Dc9gScGvKcPXUECDlPoF4V0j9OvDHx/sJquqTSUwpN/F8Ka1zoRq
 Acag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741807340; x=1742412140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0YnjXDNpttgXUs2gL4RwCNxe64IM7pUjPhQO2nAK70=;
 b=vIUCQKNZvpHVVOfrXoYCYuJlpU5oBcgv7O82Y4bjOUw2cMxPtO3li0EF9RymqbHixB
 6KCx4oPpsJUrB89Pl6ou7rjuz+ef2yjxXfltaG6YH/zzVg0rztzUQBNq+rvkCDhqzoXg
 lH/DaqxjT3S8fuiqUXkmnU3q5amWCeycpM507tQqzmC740kfX4MpEjn6Fbn5ff/GXbFa
 0ZBczKRTqeZA/5hYsYVqOhjYcikginxYrET2DU+goh6dSfQ6P3fp8StrvURV2UTkCglI
 5Fpf4U+UFk+6GAINhYa30RGjciEIYKyRQMTHiyVHP32KvF3y6S6sD81XxgZPg0tP87vq
 l0Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxDuB3cHuOp2vkT7cA8ui+4RMnRe/YmQIB8mU5ZR15RDWxJx6mFSZTYbHVNHXywKY0ibT5wMr9rmey@nongnu.org
X-Gm-Message-State: AOJu0Yy+dT8DJxxwrXnkZZOHX5qqQUnCx3rjVFRpWuWUnI9YF7WCftZ9
 8btX1LYQEAbbQd1wAS5QQpfPh/cU+Qp60TiJnxiOkPjBrXC9rHn1+IOGz+oLjXw=
X-Gm-Gg: ASbGncvPzhrigST8Eji+4uDKHpdje4zmVNElmi1n9DobvBv2tkOZT5WGtzotXcFh83A
 wWez+g5ls6+dhsGr1b1utH0URHs+RsgAfqxCShb+/Zs57cvgX3GMP7nobYTIhkeFOG8YIvbcwGO
 bURZk2rA3P77IR+DPaUEBaTgEs/dS+pZEXYIkBYfmVcCjj61eMCFbEzX1DKAZoeieEJJoomFXYr
 8iD8SlJeOJTVc2XAZIl+UimU84qi65Wcj4S+0QSkgsvs3iutJHdfsPoz1A4ILnAINpZ5GoAOeSf
 gGgbD810z3XJtu8b539VleJ3/iCNLPT7X7hrXmoFq1H8r3VOtO0OuUSjCFxg53W7gJyNOn2Cww=
 =
X-Google-Smtp-Source: AGHT+IH2Y1pDXhX+0QKx5aj3OgsAcBUzqCNRyMk2nedCzdNFbooTYUl9RLgKLTt49VSteWIDuOWT4g==
X-Received: by 2002:a05:6000:1a86:b0:38d:e48b:1787 with SMTP id
 ffacd0b85a97d-39132d1d1efmr19223162f8f.14.1741807339630; 
 Wed, 12 Mar 2025 12:22:19 -0700 (PDT)
Received: from paolo-laptop-amd.. ([2a0e:cb01:d3:f100:3f9b:7278:8381:286b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfba686sm22331645f8f.19.2025.03.12.12.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 12:22:19 -0700 (PDT)
From: Paolo Savini <paolo.savini@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Savini <paolo.savini@embecosm.com>,
 Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>,
 Jeremy Bennett <jeremy.bennett@embecosm.com>,
 Craig Blackmore <craig.blackmore@embecosm.com>
Subject: [PATCH 1/1 v3] target/riscv: optimize the memory probing for vector
 fault-only-first loads.
Date: Wed, 12 Mar 2025 19:22:15 +0000
Message-ID: <20250312192215.318565-2-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312192215.318565-1-paolo.savini@embecosm.com>
References: <20250312192215.318565-1-paolo.savini@embecosm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wr1-x435.google.com
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

Fault-only-first loads in the RISC-V vector extension need to update
the vl with the element index that causes an exception.
In order to ensure this the emulation of this instruction used to probe the
memory covered by the load operation with a loop that iterated over each element
so that when a flag was raised it was possible to set the vl to the
corresponding element index.
This loop was executed every time whether an exception happened or not.

This commit removes the per element memory probing from the main execution path
and adds a broad memory probing first. If this probing raises any flag that is
not a watchpoint flag (that per standard is allowed by this instruction) we
proceed with the per element probing to find the index of the element causing
the exception and set vl to such index.

Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/vector_helper.c | 103 ++++++++++++++++++++---------------
 1 file changed, 58 insertions(+), 45 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7773df6a7c..71b823d5d4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -633,47 +633,69 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
     uint32_t esz = 1 << log2_esz;
     uint32_t msize = nf * esz;
     uint32_t vma = vext_vma(desc);
-    target_ulong addr, offset, remain, page_split, elems;
+    target_ulong addr, addr_probe, addr_i, offset, remain, page_split, elems;
     int mmu_index = riscv_env_mmu_index(env, false);
+    int flags;
+    void *host;
 
     VSTART_CHECK_EARLY_EXIT(env);
 
-    /* probe every access */
-    for (i = env->vstart; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        addr = adjust_addr(env, base + i * (nf << log2_esz));
-        if (i == 0) {
-            /* Allow fault on first element. */
-            probe_pages(env, addr, nf << log2_esz, ra, MMU_DATA_LOAD);
-        } else {
-            remain = nf << log2_esz;
-            while (remain > 0) {
-                void *host;
-                int flags;
-
-                offset = -(addr | TARGET_PAGE_MASK);
-
-                /* Probe nonfault on subsequent elements. */
-                flags = probe_access_flags(env, addr, offset, MMU_DATA_LOAD,
-                                           mmu_index, true, &host, 0);
-
-                /*
-                 * Stop if invalid (unmapped) or mmio (transaction may fail).
-                 * Do not stop if watchpoint, as the spec says that
-                 * first-fault should continue to access the same
-                 * elements regardless of any watchpoint.
-                 */
-                if (flags & ~TLB_WATCHPOINT) {
-                    vl = i;
-                    goto ProbeSuccess;
-                }
-                if (remain <= offset) {
-                    break;
+    addr = base + ((env->vstart * nf) << log2_esz);
+    page_split = -(addr | TARGET_PAGE_MASK);
+    /* Get number of elements */
+    elems = page_split / msize;
+    if (unlikely(env->vstart + elems >= env->vl)) {
+        elems = env->vl - env->vstart;
+    }
+
+    /* Check page permission/pmp/watchpoint/etc. */
+    flags = probe_access_flags(env, adjust_addr(env, addr), elems * msize,
+                               MMU_DATA_LOAD, mmu_index, true, &host, ra);
+
+    /* If we are crossing a page check also the second page. */
+    if (env->vl > elems) {
+        addr_probe = addr + (elems << log2_esz);
+        flags |= probe_access_flags(env, adjust_addr(env, addr_probe),
+                                    elems * msize, MMU_DATA_LOAD, mmu_index,
+                                    true, &host, ra);
+    }
+
+    if (flags & ~TLB_WATCHPOINT) {
+        /* probe every access */
+        for (i = env->vstart; i < env->vl; i++) {
+            if (!vm && !vext_elem_mask(v0, i)) {
+                continue;
+            }
+            addr_i = adjust_addr(env, base + i * (nf << log2_esz));
+            if (i == 0) {
+                /* Allow fault on first element. */
+                probe_pages(env, addr_i, nf << log2_esz, ra, MMU_DATA_LOAD);
+            } else {
+                remain = nf << log2_esz;
+                while (remain > 0) {
+                    offset = -(addr_i | TARGET_PAGE_MASK);
+
+                    /* Probe nonfault on subsequent elements. */
+                    flags = probe_access_flags(env, addr_i, offset,
+                                               MMU_DATA_LOAD, mmu_index, true,
+                                               &host, 0);
+
+                    /*
+                     * Stop if invalid (unmapped) or mmio (transaction may
+                     * fail). Do not stop if watchpoint, as the spec says that
+                     * first-fault should continue to access the same
+                     * elements regardless of any watchpoint.
+                     */
+                    if (flags & ~TLB_WATCHPOINT) {
+                        vl = i;
+                        goto ProbeSuccess;
+                    }
+                    if (remain <= offset) {
+                        break;
+                    }
+                    remain -= offset;
+                    addr_i = adjust_addr(env, addr_i + offset);
                 }
-                remain -= offset;
-                addr = adjust_addr(env, addr + offset);
             }
         }
     }
@@ -685,15 +707,6 @@ ProbeSuccess:
 
     if (env->vstart < env->vl) {
         if (vm) {
-            /* Calculate the page range of first page */
-            addr = base + ((env->vstart * nf) << log2_esz);
-            page_split = -(addr | TARGET_PAGE_MASK);
-            /* Get number of elements */
-            elems = page_split / msize;
-            if (unlikely(env->vstart + elems >= env->vl)) {
-                elems = env->vl - env->vstart;
-            }
-
             /* Load/store elements in the first page */
             if (likely(elems)) {
                 vext_page_ldst_us(env, vd, addr, elems, nf, max_elems,
-- 
2.34.1


