Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934E3C8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:45:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFA8-0001x3-Di; Tue, 08 Jul 2025 16:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDeA-0004xp-Vi
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:06:52 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDe8-0004Sb-VE
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:06:30 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-553be4d2fbfso5216528e87.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001586; x=1752606386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rAL/ETRijy4/iQ3UXazRTb8RTZUYHHKVtD2BscpxpCQ=;
 b=HP+HGDVJh5NP5cELuaWda8/HLE65VcI3oT+BdJIAeNyC9F8j/NuXkFpI7R+WSiPU1O
 +vpudvfvuyDnk865QxWAwm2Kn+Nwl5663Kxt/Ne7HYHq/fTwYabpV6oOMY+GWqM34Q+y
 ZWd8pr7JqVeHX9Woi3PKxm8wDTr3/uzqmM9wEd6aZPgqwELKo8CKOOJLIFnKiIbnbd/2
 5oWA7BTI2vevoZ49TP/zP/pMNkfJqeI2QLilt6PJZJFWYgtYthdCC0aMgyR31Z6KIdLK
 juxZUoxu/bpZ2h7LJzKN9UvnzPhp6Mrawlc9CScFoQqI9QQQteo0rG9w/RTwXaWL7l1k
 qhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001586; x=1752606386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rAL/ETRijy4/iQ3UXazRTb8RTZUYHHKVtD2BscpxpCQ=;
 b=a8Tv1kL+n7uYRDBLknVRYQ54Sph9aGKESR82z0yu7ocOIfuOJobsKc7y1l+w9NzJli
 rPeiFlHwJ67sKK1Vqls21inC+5m0QPLy2iHmrbXLvrAy0TyytDxoQBIOlnv8sNNaUje0
 2YlwYysLbTQt/eDGZHEUMqmbMMdsH9MC7N2wqDG/yf+7Upjn4mbu82QBuDYQxF7Q+3az
 NnEQ+P6YnF85wfqVeoCA+cghSooiO/UiCI7JhqcaZLhuaGjg9kZQLXaxxUQDyf0e+8DP
 MJc0/jMpnOu1ACBA0E0St9HKY0DUEDQmgCxyIQJqX7nx7KauWv90X27in95l/As/qC5U
 joyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzxJJ5914aCzjSQee18NHHYGVe0dXvSC8niHyNK08XNq412FVGJleezQrRAl1hdkatKf1Buz0k7PHd@nongnu.org
X-Gm-Message-State: AOJu0YwclDAoO/ajtRXBGgJUe+OdhTS8SwFBG9X5c64WT+VC9dPYAZjo
 J/axBt8fDg/q3+kw5LtHYE4TIIo4zlzx3eSXF5+BwyB047pp2Cko+R8gOwBnuquT5a+6SI37tF4
 iNDfb
X-Gm-Gg: ASbGnctnwXKs0gqMnO7ZU1YuhOkh0zi3/g6v7Z693sqsfGhAR0kUfuxydsTEid1AHk2
 /t4gpCl04l1aGHfg/euo8tIoA804RUQCe7Bp7SuCsi5n4rWoPlqmF+INHTEenKzsBP313h2vOOr
 EUIJ5yrFqZujn1NIHQLQYsaFheSfIILqhPNGECojyinfBcIFwUjGOlNnjmHeK/btujsBlLQnQyD
 CEkolWI+KFikep3TVmTa/KxZlN94aNXLxtHeCAKhBtreQS1ngZ99r/lkCpEVwsBpgz7zaNw+H50
 K7omh5Ux5Ujk2y04b1yC2HPU/qOb7hDex0jgIdA7THYodRQ0YQQU6SDpAxQhNzUE9ZRdw68stlY
 LjIl7LKtvCY55hqXgUmUtGkbxeQlvwoxHaD0R
X-Google-Smtp-Source: AGHT+IHLZ/ykY7TZOQ2MzTMugvmnHDJCgJFHffcGRPTy37tNNZ378jls3SdJIi/LF+8ECz9D0Bqdzg==
X-Received: by 2002:a05:600c:821b:b0:453:5c30:a1d0 with SMTP id
 5b1f17b1804b1-454b4eadb5amr140127105e9.21.1751995268172; 
 Tue, 08 Jul 2025 10:21:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd38f092sm28331705e9.1.2025.07.08.10.20.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:21:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH-for-10.1 v7 2/8] qemu/target-info: Factor target_arch() out
Date: Tue,  8 Jul 2025 19:19:42 +0200
Message-ID: <20250708171949.62500-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708171949.62500-1-philmd@linaro.org>
References: <20250708171949.62500-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x136.google.com
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

To keep "qemu/target-info.h" self-contained to native
types, declare target_arch() -- which returns a QAPI
type -- in "qemu/target-info-qapi.h".

No logical change.

Keeping native types in "qemu/target-info.h" is necessary
to keep building tests such tests/tcg/plugins/mem.c, as
per the comment added in commit ecbcc9ead2f ("tests/tcg:
add a system test to check memory instrumentation"):

/*
 * plugins should not include anything from QEMU aside from the
 * API header. However as this is a test plugin to exercise the
 * internals of QEMU and we want to avoid needless code duplication we
 * do so here. bswap.h is pretty self-contained although it needs a
 * few things provided by compiler.h.
 */

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/target-info-qapi.h | 21 +++++++++++++++++++++
 include/qemu/target-info.h      |  2 +-
 hw/core/machine-qmp-cmds.c      |  8 +++-----
 target-info.c                   |  8 ++++++++
 4 files changed, 33 insertions(+), 6 deletions(-)
 create mode 100644 include/qemu/target-info-qapi.h

diff --git a/include/qemu/target-info-qapi.h b/include/qemu/target-info-qapi.h
new file mode 100644
index 00000000000..dae92c47eb1
--- /dev/null
+++ b/include/qemu/target-info-qapi.h
@@ -0,0 +1,21 @@
+/*
+ * QEMU target info API (returning QAPI types)
+ *
+ *  Copyright (c) Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_TARGET_INFO_EXTRA_H
+#define QEMU_TARGET_INFO_EXTRA_H
+
+#include "qapi/qapi-types-machine.h"
+
+/**
+ * target_arch:
+ *
+ * Returns: QAPI SysEmuTarget enum (i.e. SYS_EMU_TARGET_X86_64).
+ */
+SysEmuTarget target_arch(void);
+
+#endif
diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 850a2958b9c..dde0e7d968a 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -1,5 +1,5 @@
 /*
- * QEMU target info API
+ * QEMU target info API (returning native types)
  *
  *  Copyright (c) Linaro
  *
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index d82043e1c68..cd98daedd18 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -19,7 +19,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/type-helpers.h"
 #include "qemu/uuid.h"
-#include "qemu/target-info.h"
+#include "qemu/target-info-qapi.h"
 #include "qom/qom-qobject.h"
 #include "system/hostmem.h"
 #include "system/hw_accel.h"
@@ -37,8 +37,7 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
     MachineState *ms = MACHINE(qdev_get_machine());
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     CpuInfoFastList *head = NULL, **tail = &head;
-    SysEmuTarget target = qapi_enum_parse(&SysEmuTarget_lookup, target_name(),
-                                          -1, &error_abort);
+    SysEmuTarget target = target_arch();
     CPUState *cpu;
 
     CPU_FOREACH(cpu) {
@@ -139,8 +138,7 @@ QemuTargetInfo *qmp_query_target(Error **errp)
 {
     QemuTargetInfo *info = g_malloc0(sizeof(*info));
 
-    info->arch = qapi_enum_parse(&SysEmuTarget_lookup, target_name(), -1,
-                                 &error_abort);
+    info->arch = target_arch();
 
     return info;
 }
diff --git a/target-info.c b/target-info.c
index 16fdca7aaaf..9ebabec988f 100644
--- a/target-info.c
+++ b/target-info.c
@@ -8,7 +8,9 @@
 
 #include "qemu/osdep.h"
 #include "qemu/target-info.h"
+#include "qemu/target-info-qapi.h"
 #include "qemu/target-info-impl.h"
+#include "qapi/error.h"
 
 const char *target_name(void)
 {
@@ -20,6 +22,12 @@ unsigned target_long_bits(void)
     return target_info()->long_bits;
 }
 
+SysEmuTarget target_arch(void)
+{
+    return qapi_enum_parse(&SysEmuTarget_lookup, target_name(), -1,
+                           &error_abort);
+}
+
 const char *target_cpu_type(void)
 {
     return target_info()->cpu_type;
-- 
2.49.0


