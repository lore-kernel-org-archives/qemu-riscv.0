Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5670C001B0
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:11:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGRM-0002id-6g; Mon, 03 Jul 2023 06:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRH-0002d6-Kz
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:05:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGR9-0005gb-26
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:05:47 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3142a9ffa89so3122294f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378723; x=1690970723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KMA70dMb1SJ/eTe/2+zO5JW0aBcXeIGHYSkfDyZwFgY=;
 b=aYjtH2H7qkJJalV8IVsFnz2q0v3zBLqYSvccnyC+f5R+UoL5Fbs9fOzEo5b+SMIa9f
 7uwNk6NJCuXv+Zw7UoTdcJ3Blr+sfWvGynzOImjTnmWCpD9+y2lySoRIErraz5yWJbmk
 7zSc+xLSoVWQ4z7ROcttwI2LNNctbIn9Ov7iF6LPB+c26zZnVgo1BTXfoU8vPNnWly9H
 O27I8l10OygS25j8+TZI7jx3IEAVaqVLilRAHgXCHSGDR7PV+7z1jwrP841Y6F2odDvN
 v7DJz1FTQI+Rdp9dCvbYr2MxZm+tMZ+CjlyFoJC3V1z2mu0aNVbLL+Z+MeBpIaRQ+v3v
 nGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378723; x=1690970723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KMA70dMb1SJ/eTe/2+zO5JW0aBcXeIGHYSkfDyZwFgY=;
 b=akg1ZReiTccd2OBdzWKs6GlqMVNVx83GFKQM+8ZOsG0YxpnrshYB6z5EN1XjwCZef6
 uHKPmyxglelz+LJUIREaR/h7Loc3Oijnv9C9r32WZcJqR8BCnHEVlh6yug3TgiQY0ab9
 xuP9fi6L2T+nkhoZcA4sqYRoMd8W89l9WVxgOMZOamkIOFEPsJZOa0GlH5WC5ZCj3H03
 /3+WnS5HFMPHFG3iFCVEglcznVqqDU0rhpMKoNOHkA8mc0flJl7dTK+o4eUUwPNdACOQ
 z0QxdZUQhIXaN1FFOP/T3raYMnij1WaoVEkZMKnlWb7hRt6CwKGpFBqr4sByydr16IN9
 YIDA==
X-Gm-Message-State: ABy/qLaoGAIE8V50XuC+nEUNwkcqKsEA/AES8/xRWt6kk0gUpWaV4MCs
 mn2fU97/iSOx68B6cdjCODZY1Q==
X-Google-Smtp-Source: APBJJlHWclKS9XEdI+syJ3HOK08iwxcg4XxKcynYmJrrOOdOIgOcZ6KS+IIfC/ztCq5PVztSbMr/Dw==
X-Received: by 2002:adf:f00b:0:b0:314:130f:ce65 with SMTP id
 j11-20020adff00b000000b00314130fce65mr8701501wro.35.1688378723565; 
 Mon, 03 Jul 2023 03:05:23 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 01/37] util: Add cpuinfo-ppc.c
Date: Mon,  3 Jul 2023 12:04:44 +0200
Message-Id: <20230703100520.68224-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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

Move the code from tcg/.  Fix a bug in that PPC_FEATURE2_ARCH_3_10
is actually spelled PPC_FEATURE2_ARCH_3_1.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/ppc/host/cpuinfo.h   | 29 ++++++++++++++++
 host/include/ppc64/host/cpuinfo.h |  1 +
 tcg/ppc/tcg-target.h              | 16 ++++-----
 util/cpuinfo-ppc.c                | 56 +++++++++++++++++++++++++++++++
 tcg/ppc/tcg-target.c.inc          | 44 +-----------------------
 util/meson.build                  |  2 ++
 6 files changed, 97 insertions(+), 51 deletions(-)
 create mode 100644 host/include/ppc/host/cpuinfo.h
 create mode 100644 host/include/ppc64/host/cpuinfo.h
 create mode 100644 util/cpuinfo-ppc.c

diff --git a/host/include/ppc/host/cpuinfo.h b/host/include/ppc/host/cpuinfo.h
new file mode 100644
index 0000000000..df11e8d417
--- /dev/null
+++ b/host/include/ppc/host/cpuinfo.h
@@ -0,0 +1,29 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Host specific cpu indentification for ppc.
+ */
+
+#ifndef HOST_CPUINFO_H
+#define HOST_CPUINFO_H
+
+/* Digested version of <cpuid.h> */
+
+#define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
+#define CPUINFO_V2_06           (1u << 1)
+#define CPUINFO_V2_07           (1u << 2)
+#define CPUINFO_V3_0            (1u << 3)
+#define CPUINFO_V3_1            (1u << 4)
+#define CPUINFO_ISEL            (1u << 5)
+#define CPUINFO_ALTIVEC         (1u << 6)
+#define CPUINFO_VSX             (1u << 7)
+
+/* Initialized with a constructor. */
+extern unsigned cpuinfo;
+
+/*
+ * We cannot rely on constructor ordering, so other constructors must
+ * use the function interface rather than the variable above.
+ */
+unsigned cpuinfo_init(void);
+
+#endif /* HOST_CPUINFO_H */
diff --git a/host/include/ppc64/host/cpuinfo.h b/host/include/ppc64/host/cpuinfo.h
new file mode 100644
index 0000000000..2f036a0627
--- /dev/null
+++ b/host/include/ppc64/host/cpuinfo.h
@@ -0,0 +1 @@
+#include "host/include/ppc/host/cpuinfo.h"
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index c7552b6391..9a41fab8cc 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -25,6 +25,8 @@
 #ifndef PPC_TCG_TARGET_H
 #define PPC_TCG_TARGET_H
 
+#include "host/cpuinfo.h"
+
 #define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 #define TCG_TARGET_NB_REGS 64
@@ -61,14 +63,12 @@ typedef enum {
     tcg_isa_3_10,
 } TCGPowerISA;
 
-extern TCGPowerISA have_isa;
-extern bool have_altivec;
-extern bool have_vsx;
-
-#define have_isa_2_06  (have_isa >= tcg_isa_2_06)
-#define have_isa_2_07  (have_isa >= tcg_isa_2_07)
-#define have_isa_3_00  (have_isa >= tcg_isa_3_00)
-#define have_isa_3_10  (have_isa >= tcg_isa_3_10)
+#define have_isa_2_06  (cpuinfo & CPUINFO_V2_06)
+#define have_isa_2_07  (cpuinfo & CPUINFO_V2_07)
+#define have_isa_3_00  (cpuinfo & CPUINFO_V3_0)
+#define have_isa_3_10  (cpuinfo & CPUINFO_V3_1)
+#define have_altivec   (cpuinfo & CPUINFO_ALTIVEC)
+#define have_vsx       (cpuinfo & CPUINFO_VSX)
 
 /* optional instructions automatically implemented */
 #define TCG_TARGET_HAS_ext8u_i32        0 /* andi */
diff --git a/util/cpuinfo-ppc.c b/util/cpuinfo-ppc.c
new file mode 100644
index 0000000000..d95adc8ccd
--- /dev/null
+++ b/util/cpuinfo-ppc.c
@@ -0,0 +1,56 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Host specific cpu indentification for ppc.
+ */
+
+#include "qemu/osdep.h"
+#include "host/cpuinfo.h"
+
+#ifdef CONFIG_GETAUXVAL
+# include <sys/auxv.h>
+#else
+# include <asm/cputable.h>
+# include "elf.h"
+#endif
+
+unsigned cpuinfo;
+
+/* Called both as constructor and (possibly) via other constructors. */
+unsigned __attribute__((constructor)) cpuinfo_init(void)
+{
+    unsigned info = cpuinfo;
+    unsigned long hwcap, hwcap2;
+
+    if (info) {
+        return info;
+    }
+
+    hwcap = qemu_getauxval(AT_HWCAP);
+    hwcap2 = qemu_getauxval(AT_HWCAP2);
+    info = CPUINFO_ALWAYS;
+
+    /* Version numbers are monotonic, and so imply all lower versions. */
+    if (hwcap2 & PPC_FEATURE2_ARCH_3_1) {
+        info |= CPUINFO_V3_1 | CPUINFO_V3_0 | CPUINFO_V2_07 | CPUINFO_V2_06;
+    } else if (hwcap2 & PPC_FEATURE2_ARCH_3_00) {
+        info |= CPUINFO_V3_0 | CPUINFO_V2_07 | CPUINFO_V2_06;
+    } else if (hwcap2 & PPC_FEATURE2_ARCH_2_07) {
+        info |= CPUINFO_V2_07 | CPUINFO_V2_06;
+    } else if (hwcap & PPC_FEATURE_ARCH_2_06) {
+        info |= CPUINFO_V2_06;
+    }
+
+    if (hwcap2 & PPC_FEATURE2_HAS_ISEL) {
+        info |= CPUINFO_ISEL;
+    }
+    if (hwcap & PPC_FEATURE_HAS_ALTIVEC) {
+        info |= CPUINFO_ALTIVEC;
+        /* We only care about the portion of VSX that overlaps Altivec. */
+        if (hwcap & PPC_FEATURE_HAS_VSX) {
+            info |= CPUINFO_VSX;
+        }
+    }
+
+    cpuinfo = info;
+    return info;
+}
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 5c8378f8f6..c866f2c997 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -101,10 +101,7 @@
 #define ALL_GENERAL_REGS  0xffffffffu
 #define ALL_VECTOR_REGS   0xffffffff00000000ull
 
-TCGPowerISA have_isa;
-static bool have_isel;
-bool have_altivec;
-bool have_vsx;
+#define have_isel  (cpuinfo & CPUINFO_ISEL)
 
 #ifndef CONFIG_SOFTMMU
 #define TCG_GUEST_BASE_REG 30
@@ -3879,45 +3876,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
-    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
-    unsigned long hwcap2 = qemu_getauxval(AT_HWCAP2);
-
-    have_isa = tcg_isa_base;
-    if (hwcap & PPC_FEATURE_ARCH_2_06) {
-        have_isa = tcg_isa_2_06;
-    }
-#ifdef PPC_FEATURE2_ARCH_2_07
-    if (hwcap2 & PPC_FEATURE2_ARCH_2_07) {
-        have_isa = tcg_isa_2_07;
-    }
-#endif
-#ifdef PPC_FEATURE2_ARCH_3_00
-    if (hwcap2 & PPC_FEATURE2_ARCH_3_00) {
-        have_isa = tcg_isa_3_00;
-    }
-#endif
-#ifdef PPC_FEATURE2_ARCH_3_10
-    if (hwcap2 & PPC_FEATURE2_ARCH_3_10) {
-        have_isa = tcg_isa_3_10;
-    }
-#endif
-
-#ifdef PPC_FEATURE2_HAS_ISEL
-    /* Prefer explicit instruction from the kernel. */
-    have_isel = (hwcap2 & PPC_FEATURE2_HAS_ISEL) != 0;
-#else
-    /* Fall back to knowing Power7 (2.06) has ISEL. */
-    have_isel = have_isa_2_06;
-#endif
-
-    if (hwcap & PPC_FEATURE_HAS_ALTIVEC) {
-        have_altivec = true;
-        /* We only care about the portion of VSX that overlaps Altivec. */
-        if (hwcap & PPC_FEATURE_HAS_VSX) {
-            have_vsx = true;
-        }
-    }
-
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffff;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
     if (have_altivec) {
diff --git a/util/meson.build b/util/meson.build
index 3a93071d27..a375160286 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -113,4 +113,6 @@ if cpu == 'aarch64'
   util_ss.add(files('cpuinfo-aarch64.c'))
 elif cpu in ['x86', 'x86_64']
   util_ss.add(files('cpuinfo-i386.c'))
+elif cpu in ['ppc', 'ppc64']
+  util_ss.add(files('cpuinfo-ppc.c'))
 endif
-- 
2.34.1


