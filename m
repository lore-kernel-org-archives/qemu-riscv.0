Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48075C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:48:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKs-0007Ws-T8; Sat, 15 Aug 2026 15:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKd-0007JH-7K
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:18 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKb-0008Jd-5D
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:14 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2caea3f742bso36591125ad.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823171; x=1787427971; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SDG8brCROUt59NSkp02IKoNqQYLa+S3EnhwTp/+RG4Q=;
 b=r7GmYVaxN9OGiG/NNXaVB82rJ3S41P1jsjPYOfCQJbJEUwp/G2mNGIiSkQtR47uG+n
 a1qNf48b7C5h1mNLFgZsFp8szbFs8u8b5/pOKQcq8PQYLdkRq9VY4tyEL3R28gDV9bnv
 b/b/PL/8h8msHYlG7nVJVF7DqppLTQJQ4Eo/e8lHKz8pFfinQRjsuxxEEwMXu/vsY0VK
 OA7zR+OwEOELrRYObl2FV7inPW0N8bjdy7h7Yr4U7j7+Mb9EXtv7d+XW6u3WT4n0XDUS
 DYnfPW5oAvAToeIWsozACEfL2yddzn1HmxYgd2cQmJhmRcxPRyUAgBCGpAXXTMKB6CJH
 OG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823171; x=1787427971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SDG8brCROUt59NSkp02IKoNqQYLa+S3EnhwTp/+RG4Q=;
 b=H30gu2qYZ10JfF3GEq8d3ocy4OprbeCayX+oYGWmzl1yGWCcQd69zWWK8e79NW96zV
 snPMR57p6NKHvJ21PPiFxa+zMiT9vWARNmDC4LxZUxV33uCeuIgPI+LTtk+DuVaKc9tC
 c3NIVpHocDQXX+LXtcyiFEaX+D0Fl6OPa+DGFfvaIefWxTBFj94v11VHyuoktw2hOAUG
 hZuSMZhhzIzEbOWWlLVoa38ls4i4c7M43Bg0l/3FQC9VrW2HsCcf5EA8e6lnv+t286dU
 PHV5ha5qTg1Vzl01gDyz4kfpoMg32r4VvClOZ5Flto/x1hIK8z5ckmelGN8XuLSY467/
 MDQA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrS7rCxHcWjl7oz1HT/08BLEzv5dcBLFRSDbQPvHDz5VoTZhXx+XBbEcE9B8AaRW3nOVd4JxPBNAtll@nongnu.org
X-Gm-Message-State: AOJu0YyfAi7PmHYR5u/P2qb8PBCr1kdrJgnIvbymGVQc4R3pYTvjyKqH
 L3pEBcc4VCRmD9uTDl8kwf2o22IgUd1qghQuwOpoKbsjkFhYNmMyoLaZ9hoJg2oxG/o=
X-Gm-Gg: AR+sD114xpWLNolsBA2UKuiXcNUH8klSYC0GrEJ5Y8K9POKVoW68M78VJxSwOcr9P7o
 ONEObwYlzZcgu7S8AL0vHw7uYuDtKP0TBtsm20Ol+WwEGD5/u12tirUjxulBwEZ+60gwwNFWu11
 gejDtazuFjjuE2xVBO82DZc5ATsq/THpWz0dVa7lRZQSDyxfkkuvIzHAKfbBob+yFuLVjpw5q/F
 3Qf4HiLLL/LBObEbCZhfwBllI1v8+BlyP1pYP2VXah6tpo6K1UDPvbvPfXQw6UtF1KqsUAVjV2K
 UsO+HtxVkyPYXklfj5S0whEjO7kX9Nvjx3Doeppw9yKor12auwAreSfTvPlupv6/5XDsxaHp0uC
 kKqxIpgoPdO9r165MTqKRSDjMUTKPtokrTvAY7FTPj4oToIQ4tzTUZ/CgKta60EmWdzBwwynziB
 qZO1wmeVrh4ECIFlnhbLcVH9jqNoaP8YtioKIwuekDXRimMWNHD98duE0h7ONTeey0dyMrL9ZS7
 Kvqq6b5yoV9Mp/2iRic/6hZZ6u3uyI=
X-Received: by 2002:a17:903:22c6:b0:2c0:db23:4c4 with SMTP id
 d9443c01a7336-2d3b0c8852emr168380435ad.16.1786823171044; 
 Sat, 15 Aug 2026 12:46:11 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 11/23] target/riscv: Rewrite vext_ldff
Date: Sat, 15 Aug 2026 12:45:36 -0700
Message-ID: <20260815194549.1377505-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Do not call probe_pages for every active element.
We can make do with no more than 2 such calls for
the two pages the insn might reference.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 258 ++++++++++++++++++++-----------
 1 file changed, 172 insertions(+), 86 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 5b03e23fc3..b482537f40 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -759,135 +759,221 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
           uint32_t desc, vext_ldst_elem_fn_tlb *ldst_tlb,
           vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz, uintptr_t ra)
 {
-    uint32_t i, vl = 0;
+    uint32_t i = env->vstart, vl = env->vl;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
     uint32_t esz = 1 << log2_esz;
     uint32_t msize = nf * esz;
     uint32_t vma = vext_vma(desc);
-    target_ulong addr, addr_i, offset, remain, page_split, elems;
+    target_ulong addr, last, last_in_page, page_split, elems;
     int mmu_index = riscv_env_mmu_index(env, false);
+    bool first_active;
     int flags;
     void *host;
 
     VSTART_CHECK_EARLY_EXIT(env, env->vl);
 
-    /* Search for the first active element. */
-    if (!vm) {
-        for (i = env->vstart; i < env->vl; ++i) {
+    /* Skip forward to the first active element. */
+    if (vm) {
+        first_active = i == 0;
+    } else if (i == 0 && vext_elem_mask(v0, 0)) {
+        first_active = true;
+    } else {
+        first_active = false;
+        while (1) {
             if (vext_elem_mask(v0, i)) {
                 break;
             }
             if (vma) {
                 vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
             }
+            if (++i == vl) {
+                goto tail;
+            }
         }
-        if (i == env->vl) {
-            goto tail;
-        }
-        env->vstart = i;
     }
-
-    addr = base + ((env->vstart * nf) << log2_esz);
+    addr = base + i * msize;
 
     /* Recognize alignment fault before memory protection fault. */
     vext_test_alignment(env, addr, esz, MMU_DATA_LOAD, mmu_index, ra);
 
-    page_split = -(addr | TARGET_PAGE_MASK);
-    /* Get number of elements */
-    elems = page_split / msize;
-    if (unlikely(env->vstart + elems >= env->vl)) {
-        elems = env->vl - env->vstart;
+    /* Calculate the page range of first page. */
+    last = base + vl * msize - 1;
+    last_in_page = addr | ~TARGET_PAGE_MASK;
+    page_split = last_in_page - addr;
+
+    /*
+     * If the first element is active, it must succeed.
+     * If it also crosses the page, just go ahead and load it.
+     */
+    if (unlikely(page_split < msize) && first_active) {
+        vext_ldst_nf_tlb(env, vd, addr, 0, nf, esz, max_elems, ldst_tlb, ra);
+        env->vstart = i = 1;
+        addr += msize;
+        page_split = -(addr | TARGET_PAGE_MASK);
+        first_active = false;
     }
 
-    /* Check page permission/pmp/watchpoint/etc. */
-    probe_pages(env, addr, (env->vl - env->vstart) * msize, ra, MMU_DATA_LOAD,
-                mmu_index, &host, &flags, true);
+    /*
+     * Test whether the first page is accessible.
+     * If the first element is active, it must succeed.
+     */
+    flags = probe_access_flags(env, adjust_addr(env, addr),
+                               MIN(last, last_in_page) - addr + 1,
+                               MMU_DATA_LOAD, mmu_index, !first_active,
+                               &host, ra);
 
-    if (flags & ~TLB_WATCHPOINT) {
-        /* probe every access */
-        for (i = env->vstart; i < env->vl; i++) {
-            if (!vm && !vext_elem_mask(v0, i)) {
-                continue;
-            }
-            addr_i = adjust_addr(env, base + i * (nf << log2_esz));
-            if (i == 0) {
-                /* Allow fault on first element. */
-                probe_pages(env, addr_i, nf << log2_esz, ra, MMU_DATA_LOAD,
-                            mmu_index, &host, NULL, false);
+    /* Get number of complete elements in the first page. */
+    elems = MIN(page_split / msize, vl - i);
+
+    /* Load complete elements from the first page. */
+    if (likely(elems)) {
+        uint32_t page_evl = i + elems;
+
+        if (flags == 0) {
+            if (vm) {
+                vext_page_ldst_us_host(vd, host, i, page_evl, nf,
+                                       log2_esz, max_elems, ldst_host);
             } else {
-                remain = nf << log2_esz;
-                while (remain > 0) {
-                    offset = -(addr_i | TARGET_PAGE_MASK);
-
-                    /* Probe nonfault on subsequent elements. */
-                    probe_pages(env, addr_i, offset, 0, MMU_DATA_LOAD,
-                                mmu_index, &host, &flags, true);
-
-                    /*
-                     * Stop if invalid (unmapped) or mmio (transaction may
-                     * fail). Do not stop if watchpoint, as the spec says that
-                     * first-fault should continue to access the same
-                     * elements regardless of any watchpoint.
-                     */
-                    if (flags & ~TLB_WATCHPOINT) {
-                        vl = i;
-                        goto ProbeSuccess;
+                host -= addr - base;
+                do {
+                    if (vext_elem_mask(v0, i)) {
+                        vext_ldst_nf_host(vd, host + i * msize, i, nf, esz,
+                                          max_elems, ldst_host);
+                    } else if (vma) {
+                        vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
                     }
-                    if (remain <= offset) {
-                        break;
+                } while (++i < page_evl);
+            }
+        } else {
+            /*
+             * If the first element is active, it must succeed.
+             * This will load from MMIO or fault from INVALID.
+             */
+            if (first_active) {
+                vext_ldst_nf_tlb(env, vd, addr, 0, nf, esz,
+                                 max_elems, ldst_tlb, ra);
+                i = 1;
+                addr += msize;
+            }
+
+            /* Stop if invalid (unmapped) or mmio (transaction may fail). */
+            if (flags & (TLB_INVALID_MASK | TLB_MMIO)) {
+                env->vl = i;
+                goto tail;
+            }
+
+            /* None of these ldst_tlb calls may fault. */
+            if (vm) {
+                vext_page_ldst_us_tlb(env, vd, addr, i, page_evl, nf,
+                                      log2_esz, max_elems,
+                                      ldst_tlb, mmu_index, ra);
+            } else {
+                do {
+                    if (vext_elem_mask(v0, i)) {
+                        vext_ldst_nf_tlb(env, vd, base + i * msize, i, nf,
+                                         esz, max_elems, ldst_tlb, ra);
+                    } else if (vma) {
+                        vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
                     }
-                    remain -= offset;
-                    addr_i = adjust_addr(env, addr_i + offset);
-                }
+                } while (++i < page_evl);
+            }
+        }
+
+        /* Usually the first page contains the entire vector. */
+        if (likely(page_evl == vl)) {
+            goto tail;
+        }
+        i = page_evl;
+    }
+
+    /* Skip forward to the next active element. */
+    if (!vm) {
+        while (1) {
+            if (vext_elem_mask(v0, i)) {
+                break;
+            }
+            if (vma) {
+                vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
+            }
+            if (++i == vl) {
+                goto tail;
             }
         }
     }
-ProbeSuccess:
-    /* load bytes from guest memory */
-    if (vl != 0) {
-        env->vl = vl;
+
+    addr = base + i * msize;
+    page_split = -(addr | TARGET_PAGE_MASK);
+
+    /* Validate the second page is accessible. */
+    if (unlikely(page_split < msize)) {
+        /*
+         * Cross page element which isn't first.
+         * We have not yet advanced addr to the next page.
+         */
+        target_ulong next_page = addr + page_split;
+        flags |= probe_access_flags(env, adjust_addr(env, next_page),
+                                    last - next_page + 1, MMU_DATA_LOAD,
+                                    mmu_index, true, &host, ra);
+
+        /* Stop if invalid (unmapped) or mmio (transaction may fail). */
+        if (flags & (TLB_INVALID_MASK | TLB_MMIO)) {
+            env->vl = i;
+            goto tail;
+        }
+
+        vext_ldst_nf_tlb(env, vd, addr, i, nf, esz, max_elems, ldst_tlb, ra);
+        if (++i == vl) {
+            goto tail;
+        }
+        addr += msize;
+        if (host) {
+            host += addr - next_page;
+        }
+    } else {
+        flags = probe_access_flags(env, adjust_addr(env, addr),
+                                   last - addr + 1, MMU_DATA_LOAD,
+                                   mmu_index, true, &host, ra);
+
+        /* Stop if invalid (unmapped) or mmio (transaction may fail). */
+        if (flags & (TLB_INVALID_MASK | TLB_MMIO)) {
+            env->vl = i;
+            goto tail;
+        }
     }
 
-    if (env->vstart < env->vl) {
+    /* Load complete elements from the second page. */
+    if (flags == 0) {
         if (vm) {
-            /* Load/store elements in the first page */
-            if (likely(elems)) {
-                vext_page_ldst_us(env, vd, addr, elems, nf, max_elems,
-                                  log2_esz, true, mmu_index, ldst_tlb,
-                                  ldst_host, ra);
-            }
-
-            /* Load/store elements in the second page */
-            if (unlikely(env->vstart < env->vl)) {
-                addr = base + env->vstart * msize;
-
-                /* Cross page element */
-                if (unlikely(page_split % msize)) {
-                    vext_ldst_nf_tlb(env, vd, addr, env->vstart, nf,
-                                     esz, max_elems, ldst_tlb, ra);
-                    env->vstart++;
-                    addr += msize;
-                }
-
-                /* Get number of elements of second page */
-                elems = env->vl - env->vstart;
-
-                /* Load/store elements in the second page */
-                vext_page_ldst_us(env, vd, addr, elems, nf, max_elems,
-                                  log2_esz, true, mmu_index, ldst_tlb,
-                                  ldst_host, ra);
-            }
+            vext_page_ldst_us_host(vd, host, i, vl, nf,
+                                   log2_esz, max_elems, ldst_host);
         } else {
-            for (i = env->vstart; i < env->vl; i++) {
+            host -= addr - base;
+            do {
+                if (vext_elem_mask(v0, i)) {
+                    vext_ldst_nf_host(vd, host + i * msize, i, nf, esz,
+                                      max_elems, ldst_host);
+                } else if (vma) {
+                    vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
+                }
+            } while (++i < vl);
+        }
+    } else {
+        /* None of these ldst_tlb calls may fault. */
+        if (vm) {
+            vext_page_ldst_us_tlb(env, vd, addr, i, vl, nf,
+                                  log2_esz, max_elems,
+                                  ldst_tlb, mmu_index, ra);
+        } else {
+            do {
                 if (vext_elem_mask(v0, i)) {
                     vext_ldst_nf_tlb(env, vd, base + i * msize, i, nf,
                                      esz, max_elems, ldst_tlb, ra);
                 } else if (vma) {
                     vext_set_nf_elems_1s(vd, i, nf, esz, max_elems);
                 }
-            }
+            } while (++i < vl);
         }
     }
 
-- 
2.43.0


