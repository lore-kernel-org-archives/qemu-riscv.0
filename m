Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22586C0218C
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:49:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tb6tK-0007pM-3U; Thu, 23 Jan 2025 18:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6tH-0007gH-Gu
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:45:39 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6tF-0004NK-9K
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:45:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso15534995e9.2
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2025 15:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737675936; x=1738280736; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QhTovaxYyVYo/iAlHiQi1CfSH3sOOBet2z8bCBrBkk0=;
 b=Hjt4jNn+psy8P4dRHPP+fR7ghVxt2Nx4X0R56bTI/CeOVwPyeWFQDg/d+BSdzJBmBZ
 VXX/nmIdzwJ080KkyEtQpk1lp7XKBs5oKYB3qjoo1zIDQby8cvtFXhhOnyJMYixMpTgS
 3t6oeGcVDM2i7hP0oLfmzpfE0+FzXbMFKBsQMtIsjqHm8fIyMDX39Ybh4blrHm5tHYct
 ylGZikG/Xl3zurRWDX91WnmFdBmN5UYqoM4Ymf47WX0ujJYScmCc/hVNAc7A5IeuKmbc
 TqVe18wDkgR08L7qpePWpJSvbF8qlcjf4FVIj1XIhRm49SDuy/a7ne6btbu2yD18jyYa
 iCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737675936; x=1738280736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QhTovaxYyVYo/iAlHiQi1CfSH3sOOBet2z8bCBrBkk0=;
 b=kdFXvIwLMBtDUXvnbQa4LWWhnnlaE1Dz2/5cKgrSocLKWF0OFx/dr/hhA3CSPhXxjy
 +wH+BdGlC2bGnUOKoR6TQZBZ04f4Xou4IpXuu3gG1S6lIT7necYTQJt+vu1g3x+SW+d/
 OUh0NaWQT83pLQ68UCePR3569BXZZMwa7VXvWu/55cWjh8L92XYy5tNcVbcyfxrC0+TR
 t2DZKTC8adz9VXOPLlyA5aXrAAHeSZqvs+lSUwaNOuuJ5QZKagiM1EHkCh3XMK8Z8inZ
 xk/6y5F1j3MQhA5eBE2OcdWKHH55lmIS0HelNV5oXf7OIkHSegK6nA8fGNx5FNhx1ETl
 bSRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcuxBKCN2LyUIJlceV5nCM1OW+8ZmH8cIXIz+AvlBBcxaSShlwpcdCjV//lYqB1M4PfjcC7EmRzcDf@nongnu.org
X-Gm-Message-State: AOJu0YzzxzjaiVmUTPn6ECMrg/4iZZTBLTKAhk+NRJVhYxbcYJoZel+6
 gELUIXdljXiRnYzdiaJM8ufZl8sOy9C/eVd5FR/iu1uNynFzf/sw6h1jjjukLkQ=
X-Gm-Gg: ASbGncs2jUYkDqVgYp1DsYyxb407uGo+xi8WhFb44GyCojAzIYUd++iTNozw0lsxzBt
 HGanwEJLtuId7VriQ3xi9qtfzWOgEY7+3DEYTiVvb31wGPImDKLU/98Eq3vmJL4otl1XTzLdnFn
 KdHj2jxIzq7Wak7iB1fBoQOh5BivCcX7p2xlKM7n00P5o5Uj+gDyqXA+3p8d0Pplv61VYgn6aIr
 bkMXbJjnTNeZr5800rGkz38WkQmFIVGFfUVKmOVwwvyOqLBFOBjUFbGu/bhiX1SWfrlrZT2umkr
 5+6wXkexpIuuDyq+Jhpbpi1FHHcSJYmUeZKgK+kszT58qPNh7En1pK07jaG7CQb32g==
X-Google-Smtp-Source: AGHT+IE1g5Lka6yaX7yxmvTjxCMF9sNPmOLsz1lyorKlxhPYpXBg1FExyYB9qYVhhui8O2rA+ot5eQ==
X-Received: by 2002:a05:600c:3b0a:b0:434:9c60:95a3 with SMTP id
 5b1f17b1804b1-438913ca93cmr282415605e9.11.1737675935797; 
 Thu, 23 Jan 2025 15:45:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd507d60sm6676495e9.18.2025.01.23.15.45.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/20] accel/tcg: Move cpu_memory_rw_debug() user
 implementation to user-exec.c
Date: Fri, 24 Jan 2025 00:44:08 +0100
Message-ID: <20250123234415.59850-15-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

cpu_memory_rw_debug() system implementation is defined in
system/physmem.c. Move the user one to accel/tcg/user-exec.c
to simplify cpu-target.c maintenance.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/user-exec.c |  92 +++++++++++++++++++++++++++++++++++++
 cpu-target.c          | 102 +-----------------------------------------
 2 files changed, 94 insertions(+), 100 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index c4454100ad7..e7e99a46087 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -19,6 +19,8 @@
 #include "qemu/osdep.h"
 #include "accel/tcg/cpu-ops.h"
 #include "disas/disas.h"
+#include "exec/vaddr.h"
+#include "exec/tswap.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/bitops.h"
@@ -35,6 +37,7 @@
 #include "internal-common.h"
 #include "internal-target.h"
 #include "tb-internal.h"
+#include "qemu.h"
 
 __thread uintptr_t helper_retaddr;
 
@@ -969,6 +972,95 @@ static void *cpu_mmu_lookup(CPUState *cpu, vaddr addr,
     return ret;
 }
 
+/* physical memory access (slow version, mainly for debug) */
+int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
+                        void *ptr, size_t len, bool is_write)
+{
+    int flags;
+    vaddr l, page;
+    void * p;
+    uint8_t *buf = ptr;
+    ssize_t written;
+    int ret = -1;
+    int fd = -1;
+
+    while (len > 0) {
+        page = addr & TARGET_PAGE_MASK;
+        l = (page + TARGET_PAGE_SIZE) - addr;
+        if (l > len)
+            l = len;
+        flags = page_get_flags(page);
+        if (!(flags & PAGE_VALID)) {
+            goto out_close;
+        }
+        if (is_write) {
+            if (flags & PAGE_WRITE) {
+                /* XXX: this code should not depend on lock_user */
+                p = lock_user(VERIFY_WRITE, addr, l, 0);
+                if (!p) {
+                    goto out_close;
+                }
+                memcpy(p, buf, l);
+                unlock_user(p, addr, l);
+            } else {
+                /* Bypass the host page protection using ptrace. */
+                if (fd == -1) {
+                    fd = open("/proc/self/mem", O_WRONLY);
+                    if (fd == -1) {
+                        goto out;
+                    }
+                }
+                /*
+                 * If there is a TranslationBlock and we weren't bypassing the
+                 * host page protection, the memcpy() above would SEGV,
+                 * ultimately leading to page_unprotect(). So invalidate the
+                 * translations manually. Both invalidation and pwrite() must
+                 * be under mmap_lock() in order to prevent the creation of
+                 * another TranslationBlock in between.
+                 */
+                mmap_lock();
+                tb_invalidate_phys_range(addr, addr + l - 1);
+                written = pwrite(fd, buf, l,
+                                 (off_t)(uintptr_t)g2h_untagged(addr));
+                mmap_unlock();
+                if (written != l) {
+                    goto out_close;
+                }
+            }
+        } else if (flags & PAGE_READ) {
+            /* XXX: this code should not depend on lock_user */
+            p = lock_user(VERIFY_READ, addr, l, 1);
+            if (!p) {
+                goto out_close;
+            }
+            memcpy(buf, p, l);
+            unlock_user(p, addr, 0);
+        } else {
+            /* Bypass the host page protection using ptrace. */
+            if (fd == -1) {
+                fd = open("/proc/self/mem", O_RDONLY);
+                if (fd == -1) {
+                    goto out;
+                }
+            }
+            if (pread(fd, buf, l,
+                      (off_t)(uintptr_t)g2h_untagged(addr)) != l) {
+                goto out_close;
+            }
+        }
+        len -= l;
+        buf += l;
+        addr += l;
+    }
+    ret = 0;
+out_close:
+    if (fd != -1) {
+        close(fd);
+    }
+out:
+    return ret;
+}
+
 #include "ldst_atomicity.c.inc"
 
 static uint8_t do_ld1_mmu(CPUState *cpu, vaddr addr, MemOpIdx oi,
diff --git a/cpu-target.c b/cpu-target.c
index 20933bde7d4..6d8b7825746 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -19,18 +19,12 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-
-#include "exec/target_page.h"
-#include "exec/page-protection.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "migration/vmstate.h"
-#ifdef CONFIG_USER_ONLY
-#include "qemu.h"
-#include "user/page-protection.h"
-#else
+#ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
@@ -38,16 +32,15 @@
 #include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/tcg.h"
-#include "exec/tswap.h"
 #include "exec/replay-core.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
-#include "exec/translation-block.h"
 #include "exec/log.h"
 #include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
+#include "hw/core/cpu.h"
 
 #ifndef CONFIG_USER_ONLY
 static int cpu_common_post_load(void *opaque, int version_id)
@@ -367,97 +360,6 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
     abort();
 }
 
-/* physical memory access (slow version, mainly for debug) */
-#if defined(CONFIG_USER_ONLY)
-int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
-                        void *ptr, size_t len, bool is_write)
-{
-    int flags;
-    vaddr l, page;
-    void * p;
-    uint8_t *buf = ptr;
-    ssize_t written;
-    int ret = -1;
-    int fd = -1;
-
-    while (len > 0) {
-        page = addr & TARGET_PAGE_MASK;
-        l = (page + TARGET_PAGE_SIZE) - addr;
-        if (l > len)
-            l = len;
-        flags = page_get_flags(page);
-        if (!(flags & PAGE_VALID)) {
-            goto out_close;
-        }
-        if (is_write) {
-            if (flags & PAGE_WRITE) {
-                /* XXX: this code should not depend on lock_user */
-                p = lock_user(VERIFY_WRITE, addr, l, 0);
-                if (!p) {
-                    goto out_close;
-                }
-                memcpy(p, buf, l);
-                unlock_user(p, addr, l);
-            } else {
-                /* Bypass the host page protection using ptrace. */
-                if (fd == -1) {
-                    fd = open("/proc/self/mem", O_WRONLY);
-                    if (fd == -1) {
-                        goto out;
-                    }
-                }
-                /*
-                 * If there is a TranslationBlock and we weren't bypassing the
-                 * host page protection, the memcpy() above would SEGV,
-                 * ultimately leading to page_unprotect(). So invalidate the
-                 * translations manually. Both invalidation and pwrite() must
-                 * be under mmap_lock() in order to prevent the creation of
-                 * another TranslationBlock in between.
-                 */
-                mmap_lock();
-                tb_invalidate_phys_range(addr, addr + l - 1);
-                written = pwrite(fd, buf, l,
-                                 (off_t)(uintptr_t)g2h_untagged(addr));
-                mmap_unlock();
-                if (written != l) {
-                    goto out_close;
-                }
-            }
-        } else if (flags & PAGE_READ) {
-            /* XXX: this code should not depend on lock_user */
-            p = lock_user(VERIFY_READ, addr, l, 1);
-            if (!p) {
-                goto out_close;
-            }
-            memcpy(buf, p, l);
-            unlock_user(p, addr, 0);
-        } else {
-            /* Bypass the host page protection using ptrace. */
-            if (fd == -1) {
-                fd = open("/proc/self/mem", O_RDONLY);
-                if (fd == -1) {
-                    goto out;
-                }
-            }
-            if (pread(fd, buf, l,
-                      (off_t)(uintptr_t)g2h_untagged(addr)) != l) {
-                goto out_close;
-            }
-        }
-        len -= l;
-        buf += l;
-        addr += l;
-    }
-    ret = 0;
-out_close:
-    if (fd != -1) {
-        close(fd);
-    }
-out:
-    return ret;
-}
-#endif
-
 bool target_words_bigendian(void)
 {
     return TARGET_BIG_ENDIAN;
-- 
2.47.1


