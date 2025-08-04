Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3F1C87FCB
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 19:20:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj0jC-000243-4F; Mon, 04 Aug 2025 15:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06P-00016X-Id
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:07 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06K-0000v2-TR
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:05 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-76bc61152d8so3897131b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 11:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754332799; x=1754937599; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M9U0/wZZ+X7jDvuQEIrxHKhigwEtRJDRddgS55lpDeU=;
 b=v83gKcA1IO85y5HsdNA4rzZJ+jiKm2/AWkUq/cqjoxjUxdd6GtB6+oVK5GlO8UbDcz
 pPHVFxMmR5ZDIaJwN2YavOX8f8tozy+XvYQyLH31UeTAyuN0eehlOyM7A3uCFY9bU+GE
 DMtoKMKjDsSJz44E+OJMwSMPA5uQCM4GlfClbxzSU/yOt/6ffkS4g+RZV9NgYXMUCLpe
 EWGtI3s8y7gjoUvmVK6Q/XKNA6Zn6/0SqwbRWFHXXtJmHXr9b0Vd9hq1v1fMsEwxAfL6
 WGrsJuxamGfEpGyGcFEzJ6Jzw7YWfEK1kwijRhMvskSRr0bnuv8G8pFFbCs8PvBDL6pj
 w53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754332799; x=1754937599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M9U0/wZZ+X7jDvuQEIrxHKhigwEtRJDRddgS55lpDeU=;
 b=Vk3AMrMIF+zS8Fl/giO1K4QOw4foJkBSpuRcqkuNZHGACd9Fmq9x529GgrNh7n/4PI
 XeFMlBkqON/Vb2/JyTN7hmCNO2Er5lkz9Hb935he5p9d2QRqGAO4cfkbeYim248Ow1bq
 PbyXCSXP2srlFlI2h6xybsLdvpzpIxEcaY58oJE4mCqeJX8VaSTRkEvw9skuO2YZ/rVm
 MKv2YSfLFiONmv/1uwA2U2+j1WBSYm+o/0BScOOXnG60F92ZvPwTnxUX83Dythu6XT56
 qe38W3btg4dBDUgTRbVXMg6s70px5XA/Hjwq2YXBZaYgLr9UVpSpgKXz7MrTeRHLaFCP
 xqHw==
X-Gm-Message-State: AOJu0Yzz4vTiPQmCEnitbEo/i798j3bBp3NGugw5iFRud5fguEnve0vU
 WLord+EvDppfOSpE5UKzuNKDgLTzG49WC+Vu6F1uBdMnWC9LMFv0tz792cqy80FArI4=
X-Gm-Gg: ASbGncuFXljCAlzpJmh+Abi2j1uaes7hdZn4C7p5fgpuIqi4+cxBfpHYc073axRftkP
 Z+YQ5133abDXOqEdVWkqaoUfgCnlYrL6QGDPogQo5hjWNN6YdS4m1joaKxclfvOm9f+S4SCffcu
 mVHHBH9aNdCc5CdkNmYhLxFKmehu+pZdnr9qvRsJjB+qGZlezTKymqh3JZIH3EvsrDQ5PeRrgfe
 wIzk4t+7jXMTuJiqObbFCczlDEhNWJBm2JX1drM+nTeGuUlQl6AApq0pme2jhjLSs1D/XvhNqwL
 pnlJMkhoBA9lAjL/XHkHm9o909g/NqfEISBv0jajSTxufAdV2JOuzlUmOsgYA9i35K3u+kEADUs
 tS7g2QlzdDsOZih29gSEIBQ==
X-Google-Smtp-Source: AGHT+IGXv/toE0slkkXu0tzxMxIDZx1hCC4UlcjLD+Xw8v5mt+ojSlfeQMHFcqGK3tMy6M7PAimzOg==
X-Received: by 2002:a05:6a00:4c97:b0:76b:f01c:ff08 with SMTP id
 d2e1a72fcca58-76bf01d0125mr11318107b3a.2.1754332799444; 
 Mon, 04 Aug 2025 11:39:59 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd78875cesm9940171b3a.15.2025.08.04.11.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 11:39:59 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 03/12] semihosting/guestfd: compile once for system/user
Date: Mon,  4 Aug 2025 11:39:41 -0700
Message-ID: <20250804183950.3147154-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42d.google.com
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

We move relevant code to semihosting/arm-compat-semi.c, and add
functions to query CONFIG_ARM_COMPATIBLE_SEMIHOSTING at runtime.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/semihosting/guestfd.h      |  7 -------
 include/semihosting/semihost.h     |  2 ++
 semihosting/arm-compat-semi-stub.c | 19 +++++++++++++++++++
 semihosting/arm-compat-semi.c      | 26 ++++++++++++++++++++++++++
 semihosting/guestfd.c              | 26 +++++---------------------
 semihosting/meson.build            | 11 ++++++-----
 6 files changed, 58 insertions(+), 33 deletions(-)
 create mode 100644 semihosting/arm-compat-semi-stub.c

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 3d426fedab3..a7ea1041ea0 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -35,13 +35,6 @@ typedef struct GuestFD {
     };
 } GuestFD;
 
-/*
- * For ARM semihosting, we have a separate structure for routing
- * data for the console which is outside the guest fd address space.
- */
-extern GuestFD console_in_gf;
-extern GuestFD console_out_gf;
-
 /**
  * alloc_guestfd:
  *
diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
index b03e6375787..231dc890395 100644
--- a/include/semihosting/semihost.h
+++ b/include/semihosting/semihost.h
@@ -33,6 +33,8 @@ typedef enum SemihostingTarget {
  * Return true if guest code is allowed to make semihosting calls.
  */
 bool semihosting_enabled(bool is_user);
+bool semihosting_arm_compatible(void);
+void semihosting_arm_compatible_init(void);
 
 SemihostingTarget semihosting_get_target(void);
 const char *semihosting_get_arg(int i);
diff --git a/semihosting/arm-compat-semi-stub.c b/semihosting/arm-compat-semi-stub.c
new file mode 100644
index 00000000000..bfa3681e267
--- /dev/null
+++ b/semihosting/arm-compat-semi-stub.c
@@ -0,0 +1,19 @@
+/*
+ * Stubs for platforms different from ARM
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "semihosting/semihost.h"
+#include <glib.h>
+
+bool semihosting_arm_compatible(void)
+{
+    return false;
+}
+
+void semihosting_arm_compatible_init(void)
+{
+    g_assert_not_reached();
+}
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 40dc778529d..3f653c6e7a9 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -101,6 +101,13 @@ static int gdb_open_modeflags[12] = {
     GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
 };
 
+/*
+ * For ARM semihosting, we have a separate structure for routing
+ * data for the console which is outside the guest fd address space.
+ */
+static GuestFD console_in_gf;
+static GuestFD console_out_gf;
+
 #ifndef CONFIG_USER_ONLY
 
 /**
@@ -353,6 +360,25 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
+bool semihosting_arm_compatible(void)
+{
+    return true;
+}
+
+void semihosting_arm_compatible_init(void)
+{
+    /* For ARM-compat, the console is in a separate namespace. */
+    if (use_gdb_syscalls()) {
+        console_in_gf.type = GuestFDGDB;
+        console_in_gf.hostfd = 0;
+        console_out_gf.type = GuestFDGDB;
+        console_out_gf.hostfd = 2;
+    } else {
+        console_in_gf.type = GuestFDConsole;
+        console_out_gf.type = GuestFDConsole;
+    }
+}
+
 /*
  * Do a semihosting call.
  *
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index d3241434c51..e8f236c690c 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -12,35 +12,20 @@
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/guestfd.h"
-#ifndef CONFIG_USER_ONLY
-#include CONFIG_DEVICES
-#endif
 
 static GArray *guestfd_array;
 
-#ifdef CONFIG_ARM_COMPATIBLE_SEMIHOSTING
-GuestFD console_in_gf;
-GuestFD console_out_gf;
-#endif
-
 void qemu_semihosting_guestfd_init(void)
 {
     /* New entries zero-initialized, i.e. type GuestFDUnused */
     guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
 
-#ifdef CONFIG_ARM_COMPATIBLE_SEMIHOSTING
-    /* For ARM-compat, the console is in a separate namespace. */
-    if (use_gdb_syscalls()) {
-        console_in_gf.type = GuestFDGDB;
-        console_in_gf.hostfd = 0;
-        console_out_gf.type = GuestFDGDB;
-        console_out_gf.hostfd = 2;
-    } else {
-        console_in_gf.type = GuestFDConsole;
-        console_out_gf.type = GuestFDConsole;
+    if (semihosting_arm_compatible()) {
+        semihosting_arm_compatible_init();
+        return;
     }
-#else
-    /* Otherwise, the stdio file descriptors apply. */
+
+    /* Out of ARM, the stdio file descriptors apply. */
     guestfd_array = g_array_set_size(guestfd_array, 3);
 #ifndef CONFIG_USER_ONLY
     if (!use_gdb_syscalls()) {
@@ -54,7 +39,6 @@ void qemu_semihosting_guestfd_init(void)
     associate_guestfd(0, 0);
     associate_guestfd(1, 1);
     associate_guestfd(2, 2);
-#endif
 }
 
 /*
diff --git a/semihosting/meson.build b/semihosting/meson.build
index 77200a7f27b..bb0db323937 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,17 +1,18 @@
-specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
-  'guestfd.c',
-))
-
 common_ss.add(when: 'CONFIG_SEMIHOSTING', if_false: files('stubs-all.c'))
-user_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files('user.c'))
+user_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+  'user.c',
+  'guestfd.c'))
 system_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'config.c',
   'console.c',
+  'guestfd.c',
   'uaccess.c',
   'syscalls.c',
 ), if_false: files(
   'stubs-system.c',
 ))
+system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+  if_false: files('arm-compat-semi-stub.c'))
 
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_USER_ONLY'],
                 if_true: files('syscalls.c'))
-- 
2.47.2


