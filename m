Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA8FC4345F
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 19:43:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0RSt-0000OF-DR; Fri, 26 Apr 2024 15:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSs-0000Lp-6s
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:42:34 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSo-0002q2-9i
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:42:33 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-518a3e0d2ecso3926526e87.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Apr 2024 12:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160548; x=1714765348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4r3G1A3uieLAlLtfe4V5hp04cU912Q1LgbF6VzVX8w=;
 b=rtYOCSNPRvlTRkjO3j1jcvOoMrUCNJVjC34gA/YJ6U7r31pVKuFrOTp0gzobW5O91I
 zpdiq55+fWg+lWmYcy8of8j38ElSnSEyxWLNWvRf9ggs2Tv3AcHbnBonAtvk9fc19Zi5
 DVQyFckW1mu4GhW93/EbgwwZXT3XGUOtlc6GxVliT3+m5acn06H7DqWcXj4sEQrM/zwa
 R7G7hqyLIZ9Z71Dnogjta4WHlkSaYXbn3FYbj9axP1k8Zar38Zqz3Bjk84WwNFOueYHj
 imK0e6y0AbiTZ/Chhidv5ho9zV5Sl+mSaGtQEb02rGthluHd7psRihwrvZUI2kzM5ARV
 ZDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160548; x=1714765348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4r3G1A3uieLAlLtfe4V5hp04cU912Q1LgbF6VzVX8w=;
 b=aKy/26J69M1Pl2lGKQZFZCVvMdoD6iT3rELklAcvAFVwFJ3pT5n2FjVgG2rrMGslb9
 FQLnx4+xmTtwRr129zcIFmJEKw8Yb0oIJ6g9w4qCPEmbaUyNkN10fWjQMFLV8GWu7hpR
 LBq7AmGzLXnrB8siD6I+VPKZylg5J3peGcXX2MwLxXutStm2/yM983ZmqScD/jtJEy0P
 +2t/inkpvwhmTlpJe3Aodz9KbFQIxPb9Q5SPOqzfpHh1kSQlzLS4YE0Utv/1KyEMYf44
 FDpmoVcjn3YmAhEipBQs0sORhA46ApDIPpHGXNX6QIL26De9x/TABwcqW0v5tzdNHWZ3
 H96g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGFSFlUF2s1PxfLaYxdB/uhXW336p/841nag6qxCKoEHpOPhWVHzmBd8Onv+iHrV5azuF/2bO58FjlixUbyAkgPg9/K+4=
X-Gm-Message-State: AOJu0YzhtanwjxtXuiMiqO4Z6gB9svASIFx4Mj3G0WW4B/LTn4Ss/Top
 OcT46OvSzWOyx+caVtBpjtXApWthV0eancTD7Dn3L9UiV0+MEz5jPGqyIfRKO0rXMGuEnRSZySZ
 oJDA=
X-Google-Smtp-Source: AGHT+IHEgQLIyIXgvEtytGPu3bgx9xvrZH5H8bxNMkgnBYf9H4ipD6zo6v2Z9b74Q+Oju52h54anjQ==
X-Received: by 2002:ac2:483c:0:b0:51c:5570:f570 with SMTP id
 28-20020ac2483c000000b0051c5570f570mr2916306lft.59.1714160548267; 
 Fri, 26 Apr 2024 12:42:28 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 r25-20020a170906351900b00a55b5c365dfsm6435433eja.199.2024.04.26.12.42.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:42:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 04/38] exec: Expose 'target_page.h' API to user emulation
Date: Fri, 26 Apr 2024 21:41:24 +0200
Message-ID: <20240426194200.43723-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
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

User-only objects might benefit from the "exec/target_page.h"
API, which allows to build some objects once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231211212003.21686-3-philmd@linaro.org>
---
 meson.build            |  2 +-
 page-target.c          | 44 ++++++++++++++++++++++++++++++++++++++++++
 system/physmem.c       | 30 ----------------------------
 target/target-common.c | 10 ----------
 target/meson.build     |  2 --
 5 files changed, 45 insertions(+), 43 deletions(-)
 create mode 100644 page-target.c
 delete mode 100644 target/target-common.c

diff --git a/meson.build b/meson.build
index 96fdc6dfd2..5db2dbc12e 100644
--- a/meson.build
+++ b/meson.build
@@ -3523,7 +3523,7 @@ if get_option('b_lto')
   pagevary = declare_dependency(link_with: pagevary)
 endif
 common_ss.add(pagevary)
-specific_ss.add(files('page-vary-target.c'))
+specific_ss.add(files('page-target.c', 'page-vary-target.c'))
 
 subdir('backends')
 subdir('disas')
diff --git a/page-target.c b/page-target.c
new file mode 100644
index 0000000000..82211c8593
--- /dev/null
+++ b/page-target.c
@@ -0,0 +1,44 @@
+/*
+ * QEMU page values getters (target independent)
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "exec/target_page.h"
+#include "exec/cpu-defs.h"
+#include "cpu.h"
+#include "exec/cpu-all.h"
+
+size_t qemu_target_page_size(void)
+{
+    return TARGET_PAGE_SIZE;
+}
+
+int qemu_target_page_mask(void)
+{
+    return TARGET_PAGE_MASK;
+}
+
+int qemu_target_page_bits(void)
+{
+    return TARGET_PAGE_BITS;
+}
+
+int qemu_target_page_bits_min(void)
+{
+    return TARGET_PAGE_BITS_MIN;
+}
+
+/* Convert target pages to MiB (2**20). */
+size_t qemu_target_pages_to_MiB(size_t pages)
+{
+    int page_bits = TARGET_PAGE_BITS;
+
+    /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
+    g_assert(page_bits < 20);
+
+    return pages >> (20 - page_bits);
+}
diff --git a/system/physmem.c b/system/physmem.c
index c3d04ca921..1a81c226ba 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3540,36 +3540,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
     return 0;
 }
 
-/*
- * Allows code that needs to deal with migration bitmaps etc to still be built
- * target independent.
- */
-size_t qemu_target_page_size(void)
-{
-    return TARGET_PAGE_SIZE;
-}
-
-int qemu_target_page_bits(void)
-{
-    return TARGET_PAGE_BITS;
-}
-
-int qemu_target_page_bits_min(void)
-{
-    return TARGET_PAGE_BITS_MIN;
-}
-
-/* Convert target pages to MiB (2**20). */
-size_t qemu_target_pages_to_MiB(size_t pages)
-{
-    int page_bits = TARGET_PAGE_BITS;
-
-    /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
-    g_assert(page_bits < 20);
-
-    return pages >> (20 - page_bits);
-}
-
 bool cpu_physical_memory_is_io(hwaddr phys_addr)
 {
     MemoryRegion*mr;
diff --git a/target/target-common.c b/target/target-common.c
deleted file mode 100644
index 903b10cfe4..0000000000
--- a/target/target-common.c
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-#include "qemu/osdep.h"
-
-#include "cpu.h"
-#include "exec/target_page.h"
-
-int qemu_target_page_mask(void)
-{
-    return TARGET_PAGE_MASK;
-}
diff --git a/target/meson.build b/target/meson.build
index 59b46b2ef4..1c2e6f2b19 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -18,5 +18,3 @@ subdir('sh4')
 subdir('sparc')
 subdir('tricore')
 subdir('xtensa')
-
-specific_ss.add(files('target-common.c'))
-- 
2.41.0


