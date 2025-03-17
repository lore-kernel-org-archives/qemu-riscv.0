Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BFEC282EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:36:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFK8-0005Ml-3h; Mon, 17 Mar 2025 14:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFJB-0004kj-R4
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:30 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIX-0006CM-45
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:29 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2239c066347so99592375ad.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236478; x=1742841278; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59c6JEMS6FIy924v+CKtazEU0ebGAiMufvTS4mzCbJo=;
 b=lblGK3eFPt+sCGrYW0QxJpE1LrSpGpNxIS2m5YmKhw3nVjjCelWCpKQm6uL5M1QUEp
 jJ/MOCpqnY0t0jnwo6/g2GkNC2KZC2M20tYHaqKH1StkTCqeNVDZI66shL9LS2bIgMLx
 esds0hS6iReboXJI7V0Una+VJwreRyoD4iz2FwrFe/bymOcQqduMTECGTBVhdpMdTrHp
 6bMxHWLXmEuLfb3BYzpWBx8I3ZsN0zW6YGH2oHSr+VfjqHakgvFYKrtA3ptQo4xGSoUr
 XD3ZU4f3nL2wZkLe6k3RORD6a5XsBQbjT7M4Jd1AqGiKbdGMP4J4ZX1lxvnyRPyjYFK4
 Tt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236478; x=1742841278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59c6JEMS6FIy924v+CKtazEU0ebGAiMufvTS4mzCbJo=;
 b=KmGY4nPWBX7mvhk5NsG209u/iM/jcFZd1Q61eFpMhPnbtRYFTDyipmOK53wiRxwx7j
 H+9ZHzOzsavuxhokBKcDyM31q+mbMS5uqek+RxUUKnz6ik7qqiFOghe/cy684aAWd8q7
 wan+wbw6pnxp+b4ZEVP+nArp8A/11bRIGRZR6Z8RYaebdneIiyV3RY+ResowmrYZuMYX
 WiLK02QgJrFi8ez/JHjrTkSp/xxNSuAul7dg843Ek3uLkpKasw7MkPJYaQ7jcR6/ATMW
 ejmex6Da2YLmpafaITiYG51O2u1OyA8nCefdQz88HIGqs8m2X23mJcpxoU9kMYC1ixr8
 OkMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIoubj+xvOuqxnI1aEWnjxpmzt+hASaaCLia48fZuRwiSphA0one8kZ6qaMpX6gPzgzCrGm/GmZnxs@nongnu.org
X-Gm-Message-State: AOJu0YwrqAwX6QDVDyqZH/Vo1wVEDbyNkvAF65aQvZ1Ob+ITues9/6a2
 GHarcUlB7UDHf2KH9B8DkkaQduRvlAilCfNS/gsLdpXOJQpgOGzYFEbpSDMbtpM=
X-Gm-Gg: ASbGncsPvTrVkNQRYJKPTcF7948NP41bPAoL3qre9qCPpps7B01rNLZ07POXJfIJFVu
 Zsp6Q7pxuPd8VQrhjs2ipc/77oN/WtW2N86SopN50cX0x4fmcJ92iI/uqXIWyh3tvzKmv5fRoRz
 GsyM/gHTadIpBIIvdPYM75+qPWyTPJ54FbGC4zcRkNlqNNc4JPYCkWZZVgqHUaPJgwLwDxtb4yZ
 2W9nGfHEC2VbV66WgM9r0e7sssrgcQzjcHHhZ/BfQ5TmLZCoeRP40aCFP9pjpgl3H2weIHlKiwm
 89WiBZ36OoaSsbW4qnfaNzGW8MtTSq8ipVMJqUqdZY+f+flEWjZDl8c=
X-Google-Smtp-Source: AGHT+IGMBPlS4723f/QfXCi2z/TEFSVr/xLDSBzcEDnDoDIjYYHTKxD7//19rhfel7oXOjNf8/+suQ==
X-Received: by 2002:a17:902:f711:b0:220:fe51:1aab with SMTP id
 d9443c01a7336-225e0af4f9cmr187594395ad.38.1742236478508; 
 Mon, 17 Mar 2025 11:34:38 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:38 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 manos.pitsidianakis@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Xu <peterx@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 12/18] hw/xen: add stubs for various functions
Date: Mon, 17 Mar 2025 11:34:11 -0700
Message-Id: <20250317183417.285700-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

Those symbols are used by system/physmem.c, and are called only if
xen_enabled() (which happens only if CONFIG_XEN is set and xen is
available).

So we can crash the stubs in case those are called, as they are linked
only when CONFIG_XEN is not set.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/xen/xen_stubs.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/xen/meson.build |  3 +++
 2 files changed, 54 insertions(+)
 create mode 100644 hw/xen/xen_stubs.c

diff --git a/hw/xen/xen_stubs.c b/hw/xen/xen_stubs.c
new file mode 100644
index 00000000000..5e565df3929
--- /dev/null
+++ b/hw/xen/xen_stubs.c
@@ -0,0 +1,51 @@
+/*
+ * Various stubs for xen functions
+ *
+ * Those functions are used only if xen_enabled(). This file is linked only if
+ * CONFIG_XEN is not set, so they should never be called.
+ *
+ * Copyright (c) 2025 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "system/xen.h"
+#include "system/xen-mapcache.h"
+
+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
+{
+    g_assert_not_reached();
+}
+
+void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
+                   struct MemoryRegion *mr, Error **errp)
+{
+    g_assert_not_reached();
+}
+
+bool xen_mr_is_memory(MemoryRegion *mr)
+{
+    g_assert_not_reached();
+}
+
+void xen_invalidate_map_cache_entry(uint8_t *buffer)
+{
+    g_assert_not_reached();
+}
+
+ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
+{
+    g_assert_not_reached();
+}
+
+uint8_t *xen_map_cache(MemoryRegion *mr,
+                       hwaddr phys_addr,
+                       hwaddr size,
+                       ram_addr_t ram_addr_offset,
+                       uint8_t lock,
+                       bool dma,
+                       bool is_write)
+{
+    g_assert_not_reached();
+}
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 4a486e36738..a1850e76988 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -9,6 +9,9 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
 
 system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-operations.c',
+),
+if_false: files(
+  'xen_stubs.c',
 ))
 
 xen_specific_ss = ss.source_set()
-- 
2.39.5


