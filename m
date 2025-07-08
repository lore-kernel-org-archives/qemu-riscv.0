Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A109EC83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:53:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFAi-0003zt-S8; Tue, 08 Jul 2025 16:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDgC-0006L3-6U
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:08:38 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDg1-0004kK-JA
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:08:32 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60c5b8ee2d9so10443031a12.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001665; x=1752606465; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hg2dyL7tW3tL/dDdSwNEK/JVBUdUtkDstPfeG3qxYtE=;
 b=X8XPXt0hCzd6ZuCEi7d4rkQ+gQvCCE6BJsbpDMUziWweqfWoOe1Mnx5BzlSkJ7N4rx
 0umxMLxAAImrIbD5xJji8s/45V4WuSv2vLfZg1eCLgmR9/PYZJ7etBU6ZyzeZZWjE2s1
 lH9YbhfyWMYFT83YPTTxW9tHUotxlcJl9ig2rQUM5Q8d1ZS88aMm6b4W6HmbAEtzwzUJ
 yj2vfbZwky0/Ubav3L8KAp2mEZMD2ovqdwRmNL9r0qO/rz/qAkHDUQre/XTayPo2Leh0
 8NVgb5buk6JC/920OHEJurXDuiQIRFFedE+ckZjO2wJJnqSQrhB1VLoaTEN+x1Kd8uGg
 ux6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001665; x=1752606465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hg2dyL7tW3tL/dDdSwNEK/JVBUdUtkDstPfeG3qxYtE=;
 b=hufhv4E/4LUNE0O7x+M51jchMFCDK+3lhpHm0LxNf9d/sxFU084hpORA62rzXM/rGz
 qrAfKMoaAkcIS2ZWzNj0BrRgrX6+D0F20L9yDDYK0Gh6tTXQFXtz1qPVfKNEQ2BjfCQ8
 rtjgg6WYbMTVtBud4+gn/XHuZMDa80EAzZoz3L37bQmGgJHJ5O5xQj377rPm0N2Ua7cN
 4NUawdVKug5q45d/YLK0cruLFxn0W0YDoNTZ6ZLD0W9lU/2CEAQq0KeOq27OQdzvdfBX
 t/ixChw+Qq2BAWe5i9IbmvfnqS6uke5DWBQhEBhr4DqUNWBGc2mEP5928Tl0YBkoI4T5
 bacA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSgQitV3d93JsTaCUZssjprjrnMYJhaSnl5k2RvvitFSkYrbrEPxuMKbiATRTSNNhAzxjim0PZpEiS@nongnu.org
X-Gm-Message-State: AOJu0YyKjlMCzYtGEPQbFgTG9IpSTLpZHmYqocnkHmu57eLhenDlkmJj
 KPCPqR0wim4ERDXiYO3FDra5kvSefISz+TdL5tiKzkRR+5LIyXPZgzWTaX6DBXasmbOX48EqzKM
 Fo3a3
X-Gm-Gg: ASbGncseApMlsTG1Cy1c0njFEvtiPQuN4hQ+1aADBb/f0JWDc70oLl6a06lyLvGq2en
 G+mSL5Mz1iscntwxYbbgTr+g1wGoFXN5kSfa1AGWOjcUyNaF776pCO9x2dkP29yrSq2WKKj5rU9
 MV9p1IfSe2gvHd88z/gvVL5+1dX6sv6r28YI86JSSx7Up2k2T00Ud7Fy8FElKvGhTq4X2qDCdBt
 E13+I604mV72KG8uwv+VfVmGX3cNNR49kTdTAb6BwKdmmcrwaWAmz1tIdsbmleZnmu9fe/zqFji
 aktrB8Kn5RUPp1QMDnLOGvTcjWKD5W8pK+IMR0IbByEcFc7Yb22LzKA8rfpkXNv2sO1GOByilKQ
 KxFbQLMkXvJobZubzCXxrL+bYzDu3NEsc675h
X-Google-Smtp-Source: AGHT+IEl3xAFgAOmbbj7qgMvicNw9rf+A5S0u5RVkXBNEJvLMdLB/qGhc6bLcFco17sXFzqEy1AtOw==
X-Received: by 2002:adf:9c81:0:b0:3a4:cbc6:9db0 with SMTP id
 ffacd0b85a97d-3b5ddea1b98mr3138124f8f.51.1751995365618; 
 Tue, 08 Jul 2025 10:22:45 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b975efsm13281509f8f.46.2025.07.08.10.22.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:22:45 -0700 (PDT)
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
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH-for-10.1 v7 5/8] qemu: Convert target_words_bigendian() to
 TargetInfo API
Date: Tue,  8 Jul 2025 19:19:45 +0200
Message-ID: <20250708171949.62500-6-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708171949.62500-1-philmd@linaro.org>
References: <20250708171949.62500-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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
index a756c0714c4..3110ab32f75 100644
--- a/target-info.c
+++ b/target-info.c
@@ -47,3 +47,8 @@ EndianMode target_endian_mode(void)
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


