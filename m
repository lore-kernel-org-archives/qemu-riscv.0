Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1337C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:26:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnhj-0000jW-Vg; Mon, 11 Dec 2023 16:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnhg-0000go-Ad
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:20:40 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnhU-0005DC-Mg
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:20:39 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50be4f03b06so4745372e87.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329627; x=1702934427; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgiAOK8BuLaD0cXDs62KfIAvV8sc/YA5HaZCqiUDiy0=;
 b=MmvNvQ1d0inCOhQtAJ811ZIi5Opzju8kLcjZhJVpe4JO+f3ZUc5x3GMbIJdswNnMXN
 swKnBAhEM/VtwqKNJPXY+ECORzLXENvXiYzkogTa81qDcxfuLSLciAPf0ODwCnklvd0Q
 0r5+5cZ37FYwrIx7khk+diDg1oECS4MmqL7ZEw5lsTBXiKTuwDKt7kd6ydi/ElpGnjrj
 1G25/9y0Gxwtsu2xDDUdqGUPdcLiYewKeCi8uDWZU+t8gZvPoQCy1md+jyiAWMwaJmjC
 0AzhJioYpooMRn8AO9FUXpHQxovgsVnYQevPuMzhpAg2KBp0Lp78SgAc5nhTZNa4Kdep
 i9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329627; x=1702934427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wgiAOK8BuLaD0cXDs62KfIAvV8sc/YA5HaZCqiUDiy0=;
 b=akfAZ9eC1ny+4iZ42AtLXZMrOYpD94B9wun+aIb22To96ietSawCcmmQo+kFHFAd04
 vethuTteXARKyjBJSFcyfZmkJJ3msFuJqoYZfACquUVnn7pQFQQTjlxXOW6N8WTFhAaS
 NVe5QbJT7MZJS5bbkByr6RVLrb4zoHoW4kz4wfjh0tS/QQr/ZxNwhsVL9yUFbnq6jxsi
 IWmZwachz3oPQlv09r9JqbOZtxNyl/Tob9Sry4nUl4gsyy5x//Glw4SqKweKbWZRRzst
 QOF1QZ0CgVVYvZQkqpEy4TG7TesV30szFJ5hKmmI8G2pKFGK3svXs4l2T5YcD1KYpnF5
 ju0w==
X-Gm-Message-State: AOJu0YwBcu4kxqqUEeFAWmuHw47aHtKM5QkaQ1QaxlQZ6+TsB6EhmAWy
 MtQypCdFJgWIwsd5W863/wtCEg==
X-Google-Smtp-Source: AGHT+IEs4f16yITKu9ESGF3sYemei7SRIH+ratgBSuKGdsJp+f7TQSU4vhxmpbCTPj2yD2qXXhIKpQ==
X-Received: by 2002:ac2:5f59:0:b0:50b:f300:204 with SMTP id
 25-20020ac25f59000000b0050bf3000204mr1399873lfz.70.1702329626915; 
 Mon, 11 Dec 2023 13:20:26 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 cf8-20020a0564020b8800b0054cfef2fe21sm4026966edb.41.2023.12.11.13.20.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:20:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 02/24] exec: Expose 'target_page.h' API to user emulation
Date: Mon, 11 Dec 2023 22:19:39 +0100
Message-ID: <20231211212003.21686-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
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

User-only objects might benefit from the "exec/target_page.h"
API, which allows to build some objects once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build      |  2 +-
 page-target.c    | 43 +++++++++++++++++++++++++++++++++++++++++++
 system/physmem.c | 35 -----------------------------------
 3 files changed, 44 insertions(+), 36 deletions(-)
 create mode 100644 page-target.c

diff --git a/meson.build b/meson.build
index d2c4c2adb3..5fdc4ef8db 100644
--- a/meson.build
+++ b/meson.build
@@ -3488,7 +3488,7 @@ if get_option('b_lto')
   pagevary = declare_dependency(link_with: pagevary)
 endif
 common_ss.add(pagevary)
-specific_ss.add(files('page-vary-target.c'))
+specific_ss.add(files('page-target.c', 'page-vary-target.c'))
 
 subdir('backends')
 subdir('disas')
diff --git a/page-target.c b/page-target.c
new file mode 100644
index 0000000000..d286e2d58b
--- /dev/null
+++ b/page-target.c
@@ -0,0 +1,43 @@
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
index a63853a7bc..4bdb3d0592 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3422,41 +3422,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
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
-int qemu_target_page_mask(void)
-{
-    return TARGET_PAGE_MASK;
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
-- 
2.41.0


