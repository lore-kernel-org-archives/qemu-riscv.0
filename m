Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA68C71130
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 17:23:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uYpY5-0003rO-4G; Mon, 07 Jul 2025 13:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpW2-0000VP-So
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:20:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpVw-00051H-3K
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:20:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so23701985e9.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Jul 2025 10:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908822; x=1752513622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHZVDxqmNYoTl1VtUEuGuCVslQK6vMHQOasVIFp7MBk=;
 b=kewiTgaJceFTQzpXqB2vbBtgQCVcnHeSa2Vr6ebf9gWpEO6pjL46S04Ky2aSYOfM/m
 KT7MYowWPunOIzePxoKZ5TRBJQm5D3P5Hp383yrU2cYPA9x45FLthcP19MjLMB+pZ2nl
 +d2/5lZk3CQQxdo4vBI9jCz0eR5/HV/ZnB1b4J+RlDyo/NLHDcDmfQ/v2BXi8fAkZZzT
 dDZrN4Y9/ZKvANdCPxIzTFWttHc3wxFZ+Go8BSPiJcFnsg4EIelz2dBpYDabPzCHQIec
 qoi0Bc/19qx3lzXFPxNjBUjWkeGYoEdSokTifHSTzOX1mFrbq0I5adAoT1WfIzuH7ZQ2
 /w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908822; x=1752513622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHZVDxqmNYoTl1VtUEuGuCVslQK6vMHQOasVIFp7MBk=;
 b=V/J2NZ20J5xWwBsUJmTZsVsOvR+FUYIzzggrTJLL+n1J4lTQQpWvCPh1Dw/60xxzyg
 7P8knixbGlD91c1qhw9V+eGffXPQVaRtKUCKn4eUV++6hAoLTrfphsfw/ajdykFckH/L
 aENv+MXBU7cVQzN77tVnefnAft6mN9kD5FzPYZTeoMlTOYeX0kGz+TiKmunMTAazh9Jv
 L/WwHTmCgdGUzwCiuS7Qk59uFC4SlVu+IxxvO4z1Ojt3HiRhqxoNzSG4Aze1knkpAzn6
 rzW4GsK5RYm30lW6qysL9kVsdr4UyYWFNUSbUTloab3yo9l0zdvoENBkxPLb+s/BLgQ0
 0Jng==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9J9exoR+GFTrS3/KsObCSq7Ql1AxBoy+YcP0VUBDer0LfA7KpkcCNVNxJhKiqdA0WESDeXklpLyMT@nongnu.org
X-Gm-Message-State: AOJu0YylKYv9ezA809zl54gAeU1j1laJkUaxdgqazVcgXpUFQQ0enmdp
 gITP1NyxUeGdszhRs4jYstU7XCeyNHFSAu2wYxvno1dBq6P+EuJd1XufJANCRXgojN0=
X-Gm-Gg: ASbGncseG6vyJPuDJ+FRWc4LttBoH0gV+2hmochTZ/2BLUHKB4c/zypfUXuGKF4uhkx
 G/EOnq4Yo1UZDEBH0SOip5vWq+t/hc+FvNTILCqoUPvEGH0rLuma/jfqUC4VO7gEZUUmyxt+VOg
 Bsq4T6xYHW9rcLCj/5ik/WWC+GCdRy87YXeU3+JR/AurRKpYuVXbI0+8pQa1jqU/fLrt44na6CL
 /cSigezwGQYwvIWIU6PzYnaRZDpW8XYmhWOqtDbj/P/glSMNDbsQ37h/DmxNsNdahaDrmyLpSiF
 ipEVQrBD9WqwzOKmGIowmhv6VyXXjxbxImlIVNd0KDnZYvobbHpg0caJKuXSDnB6FKxQJz6ds75
 rFQ3dmnFYZkpldJPtPG/9lOxLZz5+M8/7Wfm9
X-Google-Smtp-Source: AGHT+IGJWyLS8lgTHM5f90/ohERSYYo8nxRNDz3UptV3SZAweJlFBaD/aoNOl7V4tLgRk+G+NoreSg==
X-Received: by 2002:a05:600c:3f15:b0:43d:5264:3cf0 with SMTP id
 5b1f17b1804b1-454ccde169dmr3783675e9.11.1751908821686; 
 Mon, 07 Jul 2025 10:20:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9969f2asm153421035e9.8.2025.07.07.10.20.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:20:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH-for-10.1 v6 02/14] qemu/target-info: Factor target_arch() out
Date: Mon,  7 Jul 2025 19:19:56 +0200
Message-ID: <20250707172009.3884-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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


