Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4380C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:35:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1y2-0007gq-MD; Tue, 12 Dec 2023 07:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1xw-0007e9-Qc
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:34:25 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1xt-0006cU-EM
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:34:24 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54bf9a54fe3so7874710a12.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384460; x=1702989260; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDQDiSIXlkgjP0mASXiCW1Z5PDJEfauay7W7xh/vCZQ=;
 b=TI3PkvJAKD3QCOSMf3OoM3oY9H9xJQdUAGWM2FwVzWmfFRrLlMSszTSbk5PNkAaWiM
 RCb2cL/Y3ChkDmtg4hDg2QqVTjhHkHnX3gt6FJbSsrcpbCwtYdvqgMFPN0LfWEgOWdqv
 zZlpCHJeV+6VfXiWPLjrTkBXQ7pTAzJvPLAX2TGCyL09Mc5OCt9/EzDwho78wSIPui/v
 9NJHs6ULGsV4i1hDzHVArYsGV9n3eRG8Gl5zWoVdhxnBbhKJH5n2xmJLmFT2Hwc9XMw8
 2QhG1EhA1aS0Qdys+wAwmdwnoumoGWMHBivupg1MBGEvw/08lVDsvRPWc5s7ddc1UFPs
 HEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384460; x=1702989260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDQDiSIXlkgjP0mASXiCW1Z5PDJEfauay7W7xh/vCZQ=;
 b=mBRRcGq+6L8fagIDZDBHUGZ41ougW5fgWX4mgAZaHhwLe4uuxvg2pRIT3d9oeO/P+C
 HhX4wX9+2OfRHZ8yPXnqzkiIJZwXU7Qh90iQYn31V6W8CR0QMQgIhUFhzQvL9AAnUIBz
 6UojAFKM2tI8yyHg3Ke9xs5uxW8AzUyQNC3isu1WrkMfsl3tc8fvg4h3F2Bbdhnp37hq
 u6zXgIfaH8h9/2WdqEJdTTAqLvcbDjzyN61dCzadxSG2bz39lkJz9jtAT2K0eV6lU88F
 2kxh/SAUVq73W6jFUx0Ovwt3iYany8O4oLn8CRuAgh1RQ+9RG0BilOi4/YzUs2PaGwHr
 lO6Q==
X-Gm-Message-State: AOJu0YxBafW9eoNPSq9l8zX0scsfH/7ZH76gIXQ6xG8CYZobhVyGV3/f
 HVxV7OxvI+UKZ2zFTxQsTCtc0A==
X-Google-Smtp-Source: AGHT+IGrAKWazBmkRMdjtf5u/OosF1/95f731ICTz5WW04wb8ZG5X/7DPApb4EFzSdlFdmwtRgbyWw==
X-Received: by 2002:a17:906:74cf:b0:a1a:7568:1d4d with SMTP id
 z15-20020a17090674cf00b00a1a75681d4dmr3498417ejl.27.1702384459881; 
 Tue, 12 Dec 2023 04:34:19 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 ub27-20020a170907c81b00b00a1df4387f16sm6285128ejc.95.2023.12.12.04.34.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:34:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 02/23] exec: Expose 'target_page.h' API to user emulation
Date: Tue, 12 Dec 2023 13:33:38 +0100
Message-ID: <20231212123401.37493-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


