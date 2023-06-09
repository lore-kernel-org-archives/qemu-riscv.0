Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00BAC7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:25:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RnO-0002TA-Ie; Thu, 08 Jun 2023 22:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnM-0002RE-TT
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:08 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnK-0005XK-8V
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:08 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64d44b198baso989784b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277445; x=1688869445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QxTD/xLHfG91exbynguR/xDlsjcF1kIUdWem1n6YAAM=;
 b=wayBJzyXxAXtNdin0sdvFPX3MKYnorpKfZgG8F1LK4THSQeaXofDwulvuw84Qzno1y
 7FtZNfsgvegXgxTs5/789rlc6YA0b963xxHFQ4arTHB2h9jGeqc5qI6nrUWyvB6XTllO
 BKpGlIC8dWDxFiVrOD4eRvD1NewjSWbZAR0J2h+ETKLhzV457OL9IEyAyymKJF0Ut6nR
 PH3ZWSgxRTPw3ZhIaP6YoEFxp+k94YjfwUAD01S4tPS7AdH2axqC2Icys/s1ymLLLU7F
 JA1wOu0cna7X6Nxj6DffjpzBYx28h5A59EmubRd4ygqQdZ6gcaoUeYi6bKJn79Qp42QH
 CAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277445; x=1688869445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QxTD/xLHfG91exbynguR/xDlsjcF1kIUdWem1n6YAAM=;
 b=On+BSNUSrfOagwtKNlVKVO7W8LdldVy1+ftRq7qFqFIzTT6pSBIUQqM2pCFkmBb1J/
 9zYPkCkmX4FlA92T+NgXyM9fNJ+r37TT4bOu0aqi+ef/JWoLq8eb3wxMThcNhJNDvIfK
 ZIciPRrOxsOT6V4FsA3/yr5ikERES4vEK0Q9oymCrwxalOvZ5EC2JntxrN+Fp70i7YSk
 vGB+kYbrxRDI3pAgGXW/u0lwHORfWsNp20G2+yarDXqnaKkWJstfCbn0MM/cXbmbavMe
 /tFzNfCdiYC6kcdSP56ZEunUqHAZf5jzmCpUiPi4fRhzx6LNJhtC2otc1J6EpoOxceTL
 DPgQ==
X-Gm-Message-State: AC+VfDwcACUGD/LH3fSmKXyV1ND5pP3meyiYD/9COXo1Is0zdbwDw/Qz
 JVJ8bqaJgA3I7lR4E1HQxbGBVw==
X-Google-Smtp-Source: ACHHUZ4fIWXxAnc83xJiso5a4LgUOL17YTfKCxAmthBr55DmaCiHgVstluN27vb5H/NV2qtTLgSK7A==
X-Received: by 2002:a05:6a00:238e:b0:64f:ad7c:70fb with SMTP id
 f14-20020a056a00238e00b0064fad7c70fbmr361729pfc.17.1686277444929; 
 Thu, 08 Jun 2023 19:24:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 02/38] util: Add cpuinfo-ppc.c
Date: Thu,  8 Jun 2023 19:23:25 -0700
Message-Id: <20230609022401.684157-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/ppc/host/cpuinfo.h   | 29 ++++++++++++++++
 host/include/ppc64/host/cpuinfo.h |  1 +
 tcg/ppc/tcg-target.h              | 16 ++++-----
 util/cpuinfo-ppc.c                | 57 +++++++++++++++++++++++++++++++
 tcg/ppc/tcg-target.c.inc          | 44 +-----------------------
 util/meson.build                  |  2 ++
 6 files changed, 98 insertions(+), 51 deletions(-)
 create mode 100644 host/include/ppc/host/cpuinfo.h
 create mode 100644 host/include/ppc64/host/cpuinfo.h
 create mode 100644 util/cpuinfo-ppc.c

diff --git a/host/include/ppc/host/cpuinfo.h b/host/include/ppc/host/cpuinfo.h
new file mode 100644
index 0000000000..7ec252ef52
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
+#define CPUINFO_V3_00           (1u << 3)
+#define CPUINFO_V3_10           (1u << 4)
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
index c7552b6391..b632a5a647 100644
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
+#define have_isa_3_00  (cpuinfo & CPUINFO_V3_00)
+#define have_isa_3_10  (cpuinfo & CPUINFO_V3_10)
+#define have_altivec   (cpuinfo & CPUINFO_ALTIVEC)
+#define have_vsx       (cpuinfo & CPUINFO_VSX)
 
 /* optional instructions automatically implemented */
 #define TCG_TARGET_HAS_ext8u_i32        0 /* andi */
diff --git a/util/cpuinfo-ppc.c b/util/cpuinfo-ppc.c
new file mode 100644
index 0000000000..ee761de33a
--- /dev/null
+++ b/util/cpuinfo-ppc.c
@@ -0,0 +1,57 @@
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
+    if (hwcap & PPC_FEATURE_ARCH_2_06) {
+        info |= CPUINFO_V2_06;
+    }
+    if (hwcap2 & PPC_FEATURE2_ARCH_2_07) {
+        info |= CPUINFO_V2_07;
+    }
+    if (hwcap2 & PPC_FEATURE2_ARCH_3_00) {
+        info |= CPUINFO_V3_00;
+    }
+    if (hwcap2 & PPC_FEATURE2_ARCH_3_1) {
+        info |= CPUINFO_V3_10;
+    }
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


