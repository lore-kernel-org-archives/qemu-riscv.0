Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKeuY-0000GJ-16
	for mharc-qemu-riscv@gnu.org; Fri, 12 Mar 2021 05:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuW-0000D2-Qn
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:20:48 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKeuJ-0005EQ-PD
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:20:48 -0500
Received: by mail-ej1-x62a.google.com with SMTP id k16so2182591ejx.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Mar 2021 02:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AclNMqw7+Oe33LgyQ1xDfyBQsCEaTssVfqb8h0Up9Xg=;
 b=gvtJx4jbS3tbsx8zql/PG9nX6YWHCAHBFo/pXWyv733vRkUBu7VByp8bPzFrZ7F4It
 Ye98IEYC5OsbGu/v137Lbshmsd1ioiLnVALfEccR9OxSqwzfPMdyKISE1tni5wpVjto1
 Q38EJfBIoFvQa2ih8FMlyXEqTq2AqYqRb7ZXCyFB5ezsPkUJNSJUrj/RRUZyFGOc8Cr5
 QSi69yZH2E7jHcK0bdzmMEfCJ514D5rCLSk+C3FIzl6+hhEqZ3Pgh59KnSoTDPA9maPD
 GCJ1jjzao7K7Wl6bFqPLOGOcpgx6uiLx6fidBeSRVT66J+raL38+ZSFxy1NDktp1OF0T
 0pfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AclNMqw7+Oe33LgyQ1xDfyBQsCEaTssVfqb8h0Up9Xg=;
 b=SV17rrWpb4FAF2e/XWxRedmR5se3f9yHzyWmC+eba8bdYrwjqrjUd+jcitK5xgnLza
 EVXF1e7LjYvC72abD0xN3K8GLS567kGh+vXl3g+mhn88r/l0VI+Vl7draDMJWCshdPrI
 7LdpY7AaL3k2E4/r+88GtEHBQbuGYS7DukWPqAHZXRd5E8x1SGbMyy9f2Zjhh5bG0vFb
 K1p0gImORplx5bJE6OAYiGhsI96PMBjPcOUJzHt1Opq87BYnlN8hpSVqo5+tiwIXs5/L
 oDNGaiQoRzYkMe9p9DHC8SJJA+zRw8Nw2xzi9BiMkVHDtjW0WkDhhD2F45SpzIiPWy5K
 yO2A==
X-Gm-Message-State: AOAM532JBLJKybkPZMsbgB1ybSjmCCyJGNPw8JSZwId2q5lenSgjbs24
 jf9HlnozA/qQxyN9wnn90zR7Cg==
X-Google-Smtp-Source: ABdhPJwWP/KuQ4/4LZjE4Ciuh0uZiD5X5s+gleyQ4aWhvfx5LH0llGcGyZ84Qino8+GI5cN/K19rzw==
X-Received: by 2002:a17:906:1b54:: with SMTP id
 p20mr7630646ejg.307.1615544432429; 
 Fri, 12 Mar 2021 02:20:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e22sm2601168edu.61.2021.03.12.02.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:20:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C03001FF87;
 Fri, 12 Mar 2021 10:20:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v5 1/5] semihosting: move semihosting tests to multiarch
Date: Fri, 12 Mar 2021 10:20:25 +0000
Message-Id: <20210312102029.17017-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312102029.17017-1-alex.bennee@linaro.org>
References: <20210312102029.17017-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Mar 2021 10:20:49 -0000

It may be arm-compat-semihosting but more than one architecture uses
it so lets move the tests into the multiarch area. We gate it on the
feature and split the semicall.h header between the arches.

Also clean-up a bit of the Makefile messing about to one common set of
runners.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v5
  - add to MAINTAINERS
---
 tests/tcg/aarch64/semicall.h                  | 18 +++++++++++
 tests/tcg/arm/semicall.h                      | 15 +--------
 tests/tcg/riscv64/semicall.h                  | 22 +++++++++++++
 .../arm-compat-semi}/semiconsole.c            |  2 ++
 .../arm-compat-semi}/semihosting.c            |  5 ++-
 MAINTAINERS                                   |  1 +
 tests/tcg/Makefile.target                     |  3 ++
 tests/tcg/aarch64/Makefile.target             | 18 -----------
 tests/tcg/arm/Makefile.target                 | 16 ++--------
 tests/tcg/multiarch/Makefile.target           | 31 +++++++++++++++++++
 10 files changed, 84 insertions(+), 47 deletions(-)
 create mode 100644 tests/tcg/aarch64/semicall.h
 create mode 100644 tests/tcg/riscv64/semicall.h
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semiconsole.c (93%)
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semihosting.c (85%)

diff --git a/tests/tcg/aarch64/semicall.h b/tests/tcg/aarch64/semicall.h
new file mode 100644
index 0000000000..8a3fce35c5
--- /dev/null
+++ b/tests/tcg/aarch64/semicall.h
@@ -0,0 +1,18 @@
+/*
+ * Semihosting Tests - AArch64 helper
+ *
+ * Copyright (c) 2019
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-3.0-or-later
+ */
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+    register uintptr_t t asm("x0") = type;
+    register uintptr_t a0 asm("x1") = arg0;
+    asm("hlt 0xf000"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+    return t;
+}
diff --git a/tests/tcg/arm/semicall.h b/tests/tcg/arm/semicall.h
index d4f6818192..ad8ac51310 100644
--- a/tests/tcg/arm/semicall.h
+++ b/tests/tcg/arm/semicall.h
@@ -1,5 +1,5 @@
 /*
- * Semihosting Tests
+ * Semihosting Tests - ARM Helper
  *
  * Copyright (c) 2019
  * Written by Alex Bennée <alex.bennee@linaro.org>
@@ -7,13 +7,8 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
-#define SYS_WRITE0      0x04
-#define SYS_READC       0x07
-#define SYS_REPORTEXC   0x18
-
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
 {
-#if defined(__arm__)
     register uintptr_t t asm("r0") = type;
     register uintptr_t a0 asm("r1") = arg0;
 #ifdef __thumb__
@@ -23,13 +18,5 @@ uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
 #endif
     asm(SVC : "=r" (t)
         : "r" (t), "r" (a0));
-#else
-    register uintptr_t t asm("x0") = type;
-    register uintptr_t a0 asm("x1") = arg0;
-    asm("hlt 0xf000"
-        : "=r" (t)
-        : "r" (t), "r" (a0));
-#endif
-
     return t;
 }
diff --git a/tests/tcg/riscv64/semicall.h b/tests/tcg/riscv64/semicall.h
new file mode 100644
index 0000000000..f8c88f32dc
--- /dev/null
+++ b/tests/tcg/riscv64/semicall.h
@@ -0,0 +1,22 @@
+/*
+ * Semihosting Tests - RiscV64 Helper
+ *
+ * Copyright (c) 2021
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-3.0-or-later
+ */
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+    register uintptr_t t asm("a0") = type;
+    register uintptr_t a0 asm("a1") = arg0;
+    asm(".option norvc\n\t"
+        ".balign 16\n\t"
+        "slli zero, zero, 0x1f\n\t"
+        "ebreak\n\t"
+        "srai zero, zero, 0x7\n\t"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+    return t;
+}
diff --git a/tests/tcg/arm/semiconsole.c b/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
similarity index 93%
rename from tests/tcg/arm/semiconsole.c
rename to tests/tcg/multiarch/arm-compat-semi/semiconsole.c
index 6ef0bd2450..1d82efc589 100644
--- a/tests/tcg/arm/semiconsole.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
@@ -7,6 +7,8 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
+#define SYS_READC       0x07
+
 #include <stdio.h>
 #include <stdint.h>
 #include "semicall.h"
diff --git a/tests/tcg/arm/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
similarity index 85%
rename from tests/tcg/arm/semihosting.c
rename to tests/tcg/multiarch/arm-compat-semi/semihosting.c
index 33faac9916..b3fd16cd12 100644
--- a/tests/tcg/arm/semihosting.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
@@ -7,12 +7,15 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
+#define SYS_WRITE0      0x04
+#define SYS_REPORTEXC   0x18
+
 #include <stdint.h>
 #include "semicall.h"
 
 int main(int argc, char *argv[argc])
 {
-#if defined(__arm__)
+#if UINTPTR_MAX == UINT32_MAX
     uintptr_t exit_code = 0x20026;
 #else
     uintptr_t exit_block[2] = {0x20026, 0};
diff --git a/MAINTAINERS b/MAINTAINERS
index 8e9f0d591e..0af92aea8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3264,6 +3264,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: semihosting/
 F: include/semihosting/
+F: tests/tcg/multiarch/arm-compat-semi/
 
 Multi-process QEMU
 M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 24d75a5801..cab8c6b3a2 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -32,6 +32,9 @@
 all:
 -include ../../../config-host.mak
 -include ../config-$(TARGET).mak
+ifeq ($(CONFIG_USER_ONLY),y)
+-include $(SRC_PATH)/default-configs/targets/$(TARGET).mak
+endif
 
 # for including , in command strings
 COMMA := ,
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index bf53ad0087..56e48f4b34 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -41,24 +41,6 @@ AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-# Semihosting smoke test for linux-user
-AARCH64_TESTS += semihosting
-run-semihosting: semihosting
-	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
-
-run-plugin-semihosting-with-%:
-	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
-		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
-		 $(call strip-plugin,$<) 2> $<.err, \
-		"$< on $(TARGET_NAME) with $*")
-
-AARCH64_TESTS += semiconsole
-run-semiconsole: semiconsole
-	$(call skip-test, $<, "MANUAL ONLY")
-
-run-plugin-semiconsole-with-%:
-	$(call skip-test, $<, "MANUAL ONLY")
-
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
 # System Registers Tests
 AARCH64_TESTS += sysregs
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index ec95156562..1deda384df 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -30,37 +30,25 @@ run-fcvt: fcvt
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
 
 # Semihosting smoke test for linux-user
-ARM_TESTS += semihosting
 semihosting: CFLAGS += -mthumb
-run-semihosting: semihosting
-	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
 
 ARM_TESTS += semihosting-arm
 semihosting-arm: CFLAGS += -marm
-semihosting-arm: semihosting.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 run-semihosting-arm: semihosting-arm
 	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
 
-run-plugin-semihosting-with-%:
+run-plugin-semihosting-arm-with-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
 		 $(call strip-plugin,$<) 2> $<.err, \
 		"$< on $(TARGET_NAME) with $*")
 
-ARM_TESTS += semiconsole semiconsole-arm
+ARM_TESTS += semiconsole-arm
 
 semiconsole: CFLAGS += -mthumb
-run-semiconsole: semiconsole
-	$(call skip-test, $<, "MANUAL ONLY")
-
-run-plugin-semiconsole-with-%:
-	$(call skip-test, $<, "MANUAL ONLY")
 
 semiconsole-arm: CFLAGS += -marm
-semiconsole-arm: semiconsole.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 run-semiconsole-arm: semiconsole-arm
 	$(call skip-test, $<, "MANUAL ONLY")
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index abbdb2e126..a3a751723d 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -69,6 +69,37 @@ run-gdbstub-%:
 endif
 EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
 
+# ARM Compatible Semi Hosting Tests
+#
+# Despite having ARM in the name we actually have several
+# architectures that implement it. We gate the tests on the feature
+# appearing in config.
+#
+ifeq ($(CONFIG_ARM_COMPATIBLE_SEMIHOSTING),y)
+VPATH += $(MULTIARCH_SRC)/arm-compat-semi
+
+# Add -I path back to TARGET_NAME for semicall.h
+semihosting: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
+
+run-semihosting: semihosting
+	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
+
+run-plugin-semihosting-with-%:
+	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
+		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
+		 $(call strip-plugin,$<) 2> $<.err, \
+		"$< on $(TARGET_NAME) with $*")
+
+semiconsole: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
+
+run-semiconsole: semiconsole
+	$(call skip-test, $<, "MANUAL ONLY")
+
+run-plugin-semiconsole-with-%:
+	$(call skip-test, $<, "MANUAL ONLY")
+
+TESTS += semihosting semiconsole
+endif
 
 # Update TESTS
 TESTS += $(MULTIARCH_TESTS)
-- 
2.20.1


