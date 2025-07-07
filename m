Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2845DC71130
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 17:27:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uYpXx-0003Q7-HT; Mon, 07 Jul 2025 13:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWP-0000h4-VF
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:20:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWI-00056k-AH
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:20:50 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so1852250f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Jul 2025 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908842; x=1752513642; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/3S1SutETVOVzQXn+B5Ty8Wa6Pzu0fGa53c3etvcBA=;
 b=lMmFyQVS5UyejsR6o0MB3nNkYbGyS8jS61F+/iTt7aHA2WyANZG70JCFcKzRYul13p
 a60FEXY+tTxJSPsdiFBPWSi4kzJ0txfsKcLTMxjUFtRDsXW2bc5Deo2CHVcVcMuz0DAq
 fM+UMuD8YNX7lwU7/ncpMpmDOldsJ+Z5ccdeaB88v/vflEyzkoPl3N5fA4UKPbcHvgVM
 AkzXKF3yjqaKeEDI4xNysv1FmJ4POal/6f9tIKZnricVgpal2tCmAglenBmZaAb2qJgM
 LD/2AWdsYfVi0vYbzgpJLmWQl38ni0+OKP8ED4P3vLiVSC6q2Yl/OaNhnvuKJjwsPpoZ
 eBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908842; x=1752513642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/3S1SutETVOVzQXn+B5Ty8Wa6Pzu0fGa53c3etvcBA=;
 b=MHjaudNBvR2bkfuZ3m7A6RAIaN1ygeVoVfPv/gAfR4hfuHis6W87G/LQPS1rIfkxvL
 o3P61Sql1MedVByVgwGq2oIuJIZ/zUXzCdgSqHSWA9GSkUIlkAzsJ5oU99KxzwbfzUEl
 1fXyK+xQsyo+sukZsGQa8BKR7w03Ylg9vGRyeMVCE4TQgDfsTPtORC9JLx5Rzp/mb19M
 DKIt8q0JWwIX6iPUcxANNvI8HWA8s71LCya7nj60VHX+GEFR25lwM/loXPiAvdMTjZWP
 H1PxNBlqrbJ0+T7jIbSOPIgXXsJ4KSwPjiKXAIWUB6usZqIBAw/5cDR2G9N2643i3K7x
 wLIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/1sJ2RuvuSwEkwGLQpYbbr4e9Ss3pR5M/4a8iVDY0uD18QLZIixI4TgJLdoED3p31+MYPIOYms/1k@nongnu.org
X-Gm-Message-State: AOJu0Ywp6UyJT9fcrSHRvloX3PeU2vKlN/x6gfiu5ho5z1F6ojvvr606
 eGhuBVdAf8P1vDkSg7ymS6sZy4mCa0cvSA3i6B9V9yg7rg8OkARRQYLuRlKQ/UIqnYk=
X-Gm-Gg: ASbGncswalf6YeivEwb1Wej0DYSHbnCxlC2Y/E8N29oK9jty1ifAI/0OcuUILfwaN8l
 qAxfQjarpFjvGxa44vcmA8wgOil7LWYcSWE8jUWyCzho1KttEbE8DrDI4DSe8Nv7TyKKffTnWXo
 t/xIGq/2rkt2HVAqs+fUEOnrCXrkxEMTR8YlGZu1BLP0dwIhJzNQBGsNxTZR8N+zkf6bEshMdNa
 aaddI6IGFtnVf+hndyZAekHjJnF3EHYHTSMys+fiMqUMoYNv8+du3w8dmDQrw2oTFlE6+02Cvp+
 ANtQYTn0wgb9ehw7dweKJEdSF6snYVYnfGcdIoArtvC8VVHu73odV7/4PEbE08PmyTuD3qCNGUl
 Oi9uH2s/BLy8g7F//SLTdth+ke4Sn3Tzz08ZWPtLZ+bLkKQk=
X-Google-Smtp-Source: AGHT+IEE2BgYU4ioX3C7uU/iCZP0JhspMkrKzzO2Roh10BzFrS0z4whPy53s/TQGYRTtAf2ayV+M7g==
X-Received: by 2002:a05:6000:40c9:b0:3b3:a43a:cc54 with SMTP id
 ffacd0b85a97d-3b49aa7daeamr8990189f8f.45.1751908841758; 
 Mon, 07 Jul 2025 10:20:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1685499sm117981975e9.22.2025.07.07.10.20.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:20:41 -0700 (PDT)
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
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH-for-10.1 v6 06/14] qemu: Convert target_words_bigendian() to
 TargetInfo API
Date: Mon,  7 Jul 2025 19:20:00 +0200
Message-ID: <20250707172009.3884-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/tswap.h       | 13 +------------
 include/qemu/target-info.h |  8 ++++++++
 cpu-target.c               |  7 -------
 hw/core/cpu-system.c       |  2 +-
 hw/display/vga.c           |  2 +-
 hw/virtio/virtio.c         |  2 +-
 system/memory.c            |  1 +
 system/qtest.c             |  1 +
 target-info.c              |  5 +++++
 9 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index 49511f26117..55ffa633598 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -9,18 +9,7 @@
 #define TSWAP_H
 
 #include "qemu/bswap.h"
-
-/**
- * target_big_endian:
- * Returns true if the (default) endianness of the target is big endian,
- * false otherwise. Common code should normally never need to know about the
- * endianness of the target, so please do *not* use this function unless you
- * know very well what you are doing!
- */
-bool target_big_endian(void);
-#ifdef COMPILING_PER_TARGET
-#define target_big_endian()   TARGET_BIG_ENDIAN
-#endif
+#include "qemu/target-info.h"
 
 /*
  * If we're in target-specific code, we can hard-code the swapping
diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index dde0e7d968a..18a8c4ff6e8 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -38,4 +38,12 @@ const char *target_machine_typename(void);
  */
 const char *target_cpu_type(void);
 
+/**
+ * target_big_endian:
+ *
+ * Returns: %true if the (default) endianness of the target is big endian,
+ *          %false otherwise.
+ */
+bool target_big_endian(void);
+
 #endif
diff --git a/cpu-target.c b/cpu-target.c
index 1c90a307593..20db5ff3108 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -22,7 +22,6 @@
 #include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "exec/cpu-common.h"
-#include "exec/tswap.h"
 #include "exec/replay-core.h"
 #include "exec/log.h"
 #include "hw/core/cpu.h"
@@ -85,9 +84,3 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
 #endif
     abort();
 }
-
-#undef target_big_endian
-bool target_big_endian(void)
-{
-    return TARGET_BIG_ENDIAN;
-}
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 3c84176a0c5..a975405d3a0 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -24,7 +24,7 @@
 #include "exec/cputlb.h"
 #include "system/memory.h"
 #include "exec/tb-flush.h"
-#include "exec/tswap.h"
+#include "qemu/target-info.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/sysemu-cpu-ops.h"
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 20475ebbd31..90b89cf4044 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -26,7 +26,7 @@
 #include "qemu/units.h"
 #include "system/reset.h"
 #include "qapi/error.h"
-#include "exec/tswap.h"
+#include "qemu/target-info.h"
 #include "hw/display/vga.h"
 #include "hw/i386/x86.h"
 #include "hw/pci/pci.h"
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 82a285a31d1..0f4d28033d7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -20,7 +20,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
-#include "exec/tswap.h"
+#include "qemu/target-info.h"
 #include "qom/object_interfaces.h"
 #include "hw/core/cpu.h"
 #include "hw/virtio/virtio.h"
diff --git a/system/memory.c b/system/memory.c
index e8d9b15b28f..38da62f5052 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -22,6 +22,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
+#include "qemu/target-info.h"
 #include "qom/object.h"
 #include "trace.h"
 #include "system/ram_addr.h"
diff --git a/system/qtest.c b/system/qtest.c
index 301b03be2d3..fa42c9f9215 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -29,6 +29,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
+#include "qemu/target-info.h"
 #include "qom/object_interfaces.h"
 
 #define MAX_IRQ 256
diff --git a/target-info.c b/target-info.c
index 2659aecd8d1..758b430d94a 100644
--- a/target-info.c
+++ b/target-info.c
@@ -57,3 +57,8 @@ EndianMode target_endian_mode(void)
 {
     return target_info()->endianness;
 }
+
+bool target_big_endian(void)
+{
+    return target_endian_mode() == ENDIAN_MODE_BIG;
+}
-- 
2.49.0


