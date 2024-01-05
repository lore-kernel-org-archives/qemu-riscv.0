Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE64C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:59:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmS9-0007vm-Ig; Fri, 05 Jan 2024 10:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRd-00074F-4I
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:16 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRZ-0007es-GV
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:12 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so1479592f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469748; x=1705074548; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ux8OTSc8Ad9jOVNGlPCxH1dshjQrIfyvWA7mV8zeD70=;
 b=KvLiuHotPLFzDY5cGRIYlx7MzPpNJHtlWFKoRlRM92gtTF6gcJZHZFac9pzvl+4OjA
 5Y7TUBAgkt91UmhVpooMo3vFLsXkW3/L6pLDFmvOgwc1KiL5P3AntWTx+NUqLz9coDyk
 mvDzDYMpREBNgkwfKy/w9196OppRfEOwe1TJ6tHtldw9W1wufNkcbzOFzR1HxJfb9bO3
 r79ie326Qqf4mbWYFWkRaGuDfFFsrR8E0gf6FqgTAUwZtTaPJCMV3NVcUWdGfNvjwC4o
 nUVBfbVrHyZ732LbSWFdfHcPw3nXUut+r4dkawPydxjoMBIKh7PiKS5uSu6oV2u0Hto8
 s3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469748; x=1705074548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ux8OTSc8Ad9jOVNGlPCxH1dshjQrIfyvWA7mV8zeD70=;
 b=o4EnjVSZG6hioZggRsxXYiLONZsx0jkKESbc1GwghUhNDFTpWHmEV6hek0iEG9nWy2
 6S/2XUjNTOTBglR/iGBPjyWagr2zNqOvDwdc2RLMT9wTYOgxA5r2I4Jt3I8Q5e1yz4rs
 2Di1QjYwxxJXzOSDkidZUw7qnvdwWuKV/uNJEyGLNl4WmXzVF2FD3ONXzss944j0HQir
 ML/q2g7DSZVrkiqUQpTj+pfbPvaJUc/mwVMH5HQFTeUrL8dy35IPI7qwEtflNSbY9J1i
 cj1wvwQRIgMC/+kw9/SJE33h6kvYonknVSiPOxp9dlQE7GklkO7Jf2RQDlGeFj8rHlas
 tv4w==
X-Gm-Message-State: AOJu0Yx1IlkuJBsuplQuh8nye9fZGs57I4EsWf2mCQTJ6wS2L9au2zG/
 M3G3+ivMcfKMsDbCBt27sqT2p1DfVKcQzA==
X-Google-Smtp-Source: AGHT+IGIETFYAoKomZGthhzqwh2WmijwBElGFtT7X9nQ/SVIqNP8h6kcKqDLfl1PV4n8/g7pTRHYdw==
X-Received: by 2002:a5d:4a84:0:b0:336:7bd0:47a2 with SMTP id
 o4-20020a5d4a84000000b003367bd047a2mr1392275wrq.112.1704469747954; 
 Fri, 05 Jan 2024 07:49:07 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d4a4b000000b0033755d8ce7asm1612139wrs.76.2024.01.05.07.49.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 58/71] backends: Simplify host_memory_backend_memory_complete()
Date: Fri,  5 Jan 2024 16:42:51 +0100
Message-ID: <20240105154307.21385-59-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Return early if bc->alloc is NULL. De-indent the if() ladder.

Note, this avoids a pointless call to error_propagate() with
errp=NULL at the 'out:' label.

Change trivial when reviewed with 'git-diff --ignore-all-space'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-16-philmd@linaro.org>
---
 backends/hostmem.c | 133 +++++++++++++++++++++++----------------------
 1 file changed, 67 insertions(+), 66 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 747e7838c0..1723c19165 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -328,83 +328,84 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
     void *ptr;
     uint64_t sz;
 
-    if (bc->alloc) {
-        bc->alloc(backend, &local_err);
-        if (local_err) {
-            goto out;
-        }
+    if (!bc->alloc) {
+        return;
+    }
+    bc->alloc(backend, &local_err);
+    if (local_err) {
+        goto out;
+    }
 
-        ptr = memory_region_get_ram_ptr(&backend->mr);
-        sz = memory_region_size(&backend->mr);
+    ptr = memory_region_get_ram_ptr(&backend->mr);
+    sz = memory_region_size(&backend->mr);
 
-        if (backend->merge) {
-            qemu_madvise(ptr, sz, QEMU_MADV_MERGEABLE);
-        }
-        if (!backend->dump) {
-            qemu_madvise(ptr, sz, QEMU_MADV_DONTDUMP);
-        }
+    if (backend->merge) {
+        qemu_madvise(ptr, sz, QEMU_MADV_MERGEABLE);
+    }
+    if (!backend->dump) {
+        qemu_madvise(ptr, sz, QEMU_MADV_DONTDUMP);
+    }
 #ifdef CONFIG_NUMA
-        unsigned long lastbit = find_last_bit(backend->host_nodes, MAX_NODES);
-        /* lastbit == MAX_NODES means maxnode = 0 */
-        unsigned long maxnode = (lastbit + 1) % (MAX_NODES + 1);
-        /* ensure policy won't be ignored in case memory is preallocated
-         * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
-         * this doesn't catch hugepage case. */
-        unsigned flags = MPOL_MF_STRICT | MPOL_MF_MOVE;
-        int mode = backend->policy;
+    unsigned long lastbit = find_last_bit(backend->host_nodes, MAX_NODES);
+    /* lastbit == MAX_NODES means maxnode = 0 */
+    unsigned long maxnode = (lastbit + 1) % (MAX_NODES + 1);
+    /* ensure policy won't be ignored in case memory is preallocated
+     * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
+     * this doesn't catch hugepage case. */
+    unsigned flags = MPOL_MF_STRICT | MPOL_MF_MOVE;
+    int mode = backend->policy;
 
-        /* check for invalid host-nodes and policies and give more verbose
-         * error messages than mbind(). */
-        if (maxnode && backend->policy == MPOL_DEFAULT) {
-            error_setg(errp, "host-nodes must be empty for policy default,"
-                       " or you should explicitly specify a policy other"
-                       " than default");
-            return;
-        } else if (maxnode == 0 && backend->policy != MPOL_DEFAULT) {
-            error_setg(errp, "host-nodes must be set for policy %s",
-                       HostMemPolicy_str(backend->policy));
-            return;
-        }
+    /* check for invalid host-nodes and policies and give more verbose
+     * error messages than mbind(). */
+    if (maxnode && backend->policy == MPOL_DEFAULT) {
+        error_setg(errp, "host-nodes must be empty for policy default,"
+                   " or you should explicitly specify a policy other"
+                   " than default");
+        return;
+    } else if (maxnode == 0 && backend->policy != MPOL_DEFAULT) {
+        error_setg(errp, "host-nodes must be set for policy %s",
+                   HostMemPolicy_str(backend->policy));
+        return;
+    }
 
-        /* We can have up to MAX_NODES nodes, but we need to pass maxnode+1
-         * as argument to mbind() due to an old Linux bug (feature?) which
-         * cuts off the last specified node. This means backend->host_nodes
-         * must have MAX_NODES+1 bits available.
-         */
-        assert(sizeof(backend->host_nodes) >=
-               BITS_TO_LONGS(MAX_NODES + 1) * sizeof(unsigned long));
-        assert(maxnode <= MAX_NODES);
+    /* We can have up to MAX_NODES nodes, but we need to pass maxnode+1
+     * as argument to mbind() due to an old Linux bug (feature?) which
+     * cuts off the last specified node. This means backend->host_nodes
+     * must have MAX_NODES+1 bits available.
+     */
+    assert(sizeof(backend->host_nodes) >=
+           BITS_TO_LONGS(MAX_NODES + 1) * sizeof(unsigned long));
+    assert(maxnode <= MAX_NODES);
 
 #ifdef HAVE_NUMA_HAS_PREFERRED_MANY
-        if (mode == MPOL_PREFERRED && numa_has_preferred_many() > 0) {
-            /*
-             * Replace with MPOL_PREFERRED_MANY otherwise the mbind() below
-             * silently picks the first node.
-             */
-            mode = MPOL_PREFERRED_MANY;
-        }
+    if (mode == MPOL_PREFERRED && numa_has_preferred_many() > 0) {
+        /*
+         * Replace with MPOL_PREFERRED_MANY otherwise the mbind() below
+         * silently picks the first node.
+         */
+        mode = MPOL_PREFERRED_MANY;
+    }
 #endif
 
-        if (maxnode &&
-            mbind(ptr, sz, mode, backend->host_nodes, maxnode + 1, flags)) {
-            if (backend->policy != MPOL_DEFAULT || errno != ENOSYS) {
-                error_setg_errno(errp, errno,
-                                 "cannot bind memory to host NUMA nodes");
-                return;
-            }
+    if (maxnode &&
+        mbind(ptr, sz, mode, backend->host_nodes, maxnode + 1, flags)) {
+        if (backend->policy != MPOL_DEFAULT || errno != ENOSYS) {
+            error_setg_errno(errp, errno,
+                             "cannot bind memory to host NUMA nodes");
+            return;
         }
+    }
 #endif
-        /* Preallocate memory after the NUMA policy has been instantiated.
-         * This is necessary to guarantee memory is allocated with
-         * specified NUMA policy in place.
-         */
-        if (backend->prealloc) {
-            qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
-                              backend->prealloc_threads,
-                              backend->prealloc_context, &local_err);
-            if (local_err) {
-                goto out;
-            }
+    /* Preallocate memory after the NUMA policy has been instantiated.
+     * This is necessary to guarantee memory is allocated with
+     * specified NUMA policy in place.
+     */
+    if (backend->prealloc) {
+        qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
+                          backend->prealloc_threads,
+                          backend->prealloc_context, &local_err);
+        if (local_err) {
+            goto out;
         }
     }
 out:
-- 
2.41.0


