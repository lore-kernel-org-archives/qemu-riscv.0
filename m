Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FA2C02182
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:47:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tb6tF-0007YT-Et; Thu, 23 Jan 2025 18:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6tD-0007Ok-NM
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:45:35 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6t9-0004La-Jb
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:45:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so15450665e9.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2025 15:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737675930; x=1738280730; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGO8rj66FytAuOx0HD2g/yFD3gx++HeKfsSZtvEWB0o=;
 b=c1My6B2r3Mk1NAb3VDrgTKx3BrtzmKRV+149VgQBRPggYRWBSOoqVucHlHRUUYqiGC
 g4IrJ/sAm81IQGvAUNRwsmq5ok2QVaY/RvWQ5bL+IAiECFCT0vs3R56SOZWJQXJ7SXo5
 dEgAPYdOtxqPqoUWSDCQcApnIYTBCsiKtxLvp7KvS0rQig5Zk6y98JMcujKugn+6gKwC
 r6j4icsPbOgT5jzOBFYdV4kCU/Z55Bv+aFv0gmn4Xa6DqXYlp4xJ9glTCqi0vR7XAYvY
 Sjk+JMt87JMEE3jnhKl36p48ZUmNuuOEhXGppzB/zokZPjYYFqY/wJ7dbOTibMMWhKr0
 IJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737675930; x=1738280730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zGO8rj66FytAuOx0HD2g/yFD3gx++HeKfsSZtvEWB0o=;
 b=m3ZuWZvEe0hKAJTGZgy0EU7/GFYlwP10W+NcakGBeKS98K4k8MgrX89zRhqiC2q9d6
 AoFj8J0VJVWR33a39Wo0o/mlAHOy2YT5LwC4yOI1bEUJsuU4BjAgza8JYgNQOCuJHc75
 X/W+CJjwNFtb6ZzVYikFfntV+xyUaOJG3BlRG8xRMdOonqqzIya1h+M+9H5cZJUgd4PV
 nf6eQjKKpWTTjxcYp2IhRo+2zO0QV8a54HTskqk+iTQB7EGqWO+6TEjiMHvvsqiFu6O2
 zCGwaCa96Z8VUNf/5VkCAOulU/SBLFs4DK4WwjDYcZkZEnCLdVk/HAtl/2IswKeCOC7/
 taPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhsgE6AkNeLRK2cNUV9z1cWfe6rQpO0aaMWC78DWAFXXl0g6OBrKXR1fRmwtJSBTWDRJNaVZgzn4+t@nongnu.org
X-Gm-Message-State: AOJu0YygnyHj1pDHcLS42GE6EK4NDFaXP0CxBc5VzXRm4RSD9VmiY8Hi
 zI1aiz+hQj3g5yOtFaDgqwll4OEF34LR+YZ/9HIzN48KDI3DrlEZC49N17zeW8s=
X-Gm-Gg: ASbGncsscfwg0VHv7lT88cCCMcCj+DWiEXBAZuKE6fXwKnbmIeukkoC7rfC+8A2UodT
 aWeC8TB9B7A9M9grbLEDOLpQ4jc5vlzUkFQF8PAlry+kJ/44OiMJt5JZvIumz09ERBxGCnpvQQJ
 /UrF5UFDrYGVrDx2hqSl5Mp4DNxhGH0ytRWjinvmaa9WbP7hFDpYqMNAwj10gp3+CRpaClLM5UA
 PAyVfKLvAJDXFTB495GH2RlhhB2ScQdCWBjnLV6eP8sVK8pwJtH/I1UKXAubbdXM7q6xUeiHJa7
 lHCNtyYIk4YdewVNcq1bYngVFg1egMqn2AQJBFtI8nS1az+GUMEhd+Q=
X-Google-Smtp-Source: AGHT+IGTWWuqfdRG1OdMv1JrJhUNbIyiZqrhlB9MFbw+o6IkF6P0PGvSwNrik0HZ18U5C5r24zY0/A==
X-Received: by 2002:a05:600c:1e0e:b0:438:a20b:6a2a with SMTP id
 5b1f17b1804b1-438a20b6b71mr242006995e9.14.1737675930187; 
 Thu, 23 Jan 2025 15:45:30 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4b9990sm7076685e9.29.2025.01.23.15.45.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:28 -0800 (PST)
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
Subject: [PATCH 13/20] accel: Forward-declare AccelOpsClass in
 'qemu/typedefs.h'
Date: Fri, 24 Jan 2025 00:44:07 +0100
Message-ID: <20250123234415.59850-14-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

The heavily imported "system/cpus.h" header includes "accel-ops.h"
to get AccelOpsClass type declaration. Reduce headers pressure by
forward declaring it in "qemu/typedefs.h", where we already
declare the AccelCPUState type.

Reduce "system/cpus.h" inclusions by only including
"system/accel-ops.h" when necessary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/typedefs.h           | 1 +
 include/system/accel-ops.h        | 1 -
 include/system/cpus.h             | 2 --
 accel/accel-system.c              | 1 +
 accel/hvf/hvf-accel-ops.c         | 1 +
 accel/kvm/kvm-accel-ops.c         | 1 +
 accel/qtest/qtest.c               | 1 +
 accel/tcg/cpu-exec-common.c       | 1 -
 accel/tcg/cpu-exec.c              | 1 -
 accel/tcg/monitor.c               | 1 -
 accel/tcg/tcg-accel-ops.c         | 1 +
 accel/tcg/translate-all.c         | 1 -
 accel/xen/xen-all.c               | 1 +
 cpu-common.c                      | 1 -
 cpu-target.c                      | 1 +
 gdbstub/system.c                  | 1 +
 system/cpus.c                     | 1 +
 target/i386/nvmm/nvmm-accel-ops.c | 1 +
 target/i386/whpx/whpx-accel-ops.c | 1 +
 19 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 3d84efcac47..465cc501773 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -22,6 +22,7 @@
  * Please keep this list in case-insensitive alphabetical order.
  */
 typedef struct AccelCPUState AccelCPUState;
+typedef struct AccelOpsClass AccelOpsClass;
 typedef struct AccelState AccelState;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 137fb96d444..4c99d25aeff 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -17,7 +17,6 @@
 #define TYPE_ACCEL_OPS "accel" ACCEL_OPS_SUFFIX
 #define ACCEL_OPS_NAME(name) (name "-" TYPE_ACCEL_OPS)
 
-typedef struct AccelOpsClass AccelOpsClass;
 DECLARE_CLASS_CHECKERS(AccelOpsClass, ACCEL_OPS, TYPE_ACCEL_OPS)
 
 /**
diff --git a/include/system/cpus.h b/include/system/cpus.h
index 1cffeaaf5c4..3226c765d01 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -1,8 +1,6 @@
 #ifndef QEMU_CPUS_H
 #define QEMU_CPUS_H
 
-#include "system/accel-ops.h"
-
 /* register accel-specific operations */
 void cpus_register_accel(const AccelOpsClass *i);
 
diff --git a/accel/accel-system.c b/accel/accel-system.c
index a7596aef59d..5df49fbe831 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 #include "hw/boards.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "qemu/error-report.h"
 #include "accel-system.h"
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 945ba720513..12fc30c2761 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -54,6 +54,7 @@
 #include "exec/exec-all.h"
 #include "gdbstub/enums.h"
 #include "hw/boards.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/hvf.h"
 #include "system/hvf_int.h"
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index a81e8f3b03b..54ea60909e2 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -16,6 +16,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "system/accel-ops.h"
 #include "system/kvm.h"
 #include "system/kvm_int.h"
 #include "system/runstate.h"
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index ad7e3441a5a..7fae80f6a1b 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -18,6 +18,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/accel.h"
+#include "system/accel-ops.h"
 #include "system/qtest.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 100746d555a..c5c513f1e4a 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -19,7 +19,6 @@
 
 #include "qemu/osdep.h"
 #include "exec/log.h"
-#include "system/cpus.h"
 #include "system/tcg.h"
 #include "qemu/plugin.h"
 #include "internal-common.h"
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8ee76e14b0d..4070d532bf1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -33,7 +33,6 @@
 #include "qemu/rcu.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
-#include "system/cpus.h"
 #include "exec/cpu-all.h"
 #include "system/cpu-timers.h"
 #include "exec/replay-core.h"
diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
index ae1dbeb79f8..eeb38a4d9ce 100644
--- a/accel/tcg/monitor.c
+++ b/accel/tcg/monitor.c
@@ -13,7 +13,6 @@
 #include "qapi/type-helpers.h"
 #include "qapi/qapi-commands-machine.h"
 #include "monitor/monitor.h"
-#include "system/cpus.h"
 #include "system/cpu-timers.h"
 #include "system/tcg.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 6e3f1fa92b2..132c5d14613 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "system/accel-ops.h"
 #include "system/tcg.h"
 #include "system/replay.h"
 #include "system/cpu-timers.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 786e2f6f1a7..0914d6e98b2 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -54,7 +54,6 @@
 #include "qemu/cacheinfo.h"
 #include "qemu/timer.h"
 #include "exec/log.h"
-#include "system/cpus.h"
 #include "system/cpu-timers.h"
 #include "system/tcg.h"
 #include "qapi/error.h"
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 852e9fbe5fe..7aa28b9ab93 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -18,6 +18,7 @@
 #include "hw/xen/xen_igd.h"
 #include "chardev/char.h"
 #include "qemu/accel.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/xen.h"
 #include "system/runstate.h"
diff --git a/cpu-common.c b/cpu-common.c
index 4248b2d727e..f5dcc2d136b 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -21,7 +21,6 @@
 #include "qemu/main-loop.h"
 #include "exec/cpu-common.h"
 #include "hw/core/cpu.h"
-#include "system/cpus.h"
 #include "qemu/lockable.h"
 #include "trace/trace-root.h"
 
diff --git a/cpu-target.c b/cpu-target.c
index f97f3a14751..20933bde7d4 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -35,6 +35,7 @@
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
 #endif
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/tcg.h"
 #include "exec/tswap.h"
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 7f047a285c8..416c1dbe1e9 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -19,6 +19,7 @@
 #include "gdbstub/commands.h"
 #include "exec/hwaddr.h"
 #include "exec/tb-flush.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/runstate.h"
 #include "system/replay.h"
diff --git a/system/cpus.c b/system/cpus.c
index 37e5892c240..2cc5f887ab5 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -31,6 +31,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/gdbstub.h"
+#include "system/accel-ops.h"
 #include "system/hw_accel.h"
 #include "exec/cpu-common.h"
 #include "qemu/thread.h"
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index e7b56662fee..4e4e63de78e 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "system/kvm_int.h"
 #include "qemu/main-loop.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index ab2e014c9ea..81fdd06e487 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "system/kvm_int.h"
 #include "qemu/main-loop.h"
+#include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "qemu/guest-random.h"
 
-- 
2.47.1


