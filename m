Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4E2E8FDDD
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:09:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnxsW-0004iY-0N; Wed, 04 Oct 2023 05:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxqm-0002lZ-3L
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:26 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxqj-0007XJ-Vk
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:23 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-405361bb94eso19250845e9.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 02:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696410440; x=1697015240; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sOgJBUOMii81BIol1zFAI/xxhQ5Wq887ylm0CQGkpK8=;
 b=HD64TI3jKPk14zBd5YlYtCWPUjBr9AdFYBnESA8k3uS/Ce9Rqv0DBghO3X5psBzkIW
 OCF9vaYThkxlcqSZcdq3CuxQ4N7O5XPPZqrvvK1QOMph19+yQ5q4MeUsHL/Pkr0UlAwk
 /DKPVMKwmSKszjVLlTeVpIhraJ/rKWEM01brKBUvWlV4eLAAk0/rE4Q1xrU27m673Vfp
 pBL5QL/1FolB2vSKpbBKpaVA4j38nR3XqRfaXIDZYA7oswc0c9HosYRt5wrWzSrLE8g0
 gPHazC/uD1//68rIafTeptIqpr5Ddt8mAML2aLx2kw+buK3OFZscWeuf8YSTfeiec7pd
 gp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696410440; x=1697015240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sOgJBUOMii81BIol1zFAI/xxhQ5Wq887ylm0CQGkpK8=;
 b=c2j6VhvJ6eNraLsQeS6D+DpG75ivR9nrxLxoXXQ7G3DV2kQVskn16mfnDu8E+buzlO
 VKk4nto/V6flhokY6On0Kq0do7h2tTyl4RRTFopGMmArNfmPRGVqOPnvfelAP0y6yxz3
 471KPsVSieyhRMhemOlM25Dlx4fBLZBqeumQB+PHcnbEBcr2OS1lV77NnSUEX0NOgpuI
 F9RmAIaEmNOsnkBTBDk0cgdR+mA+FXX8eAXvpMMahcstdy2EkzvZEAPwNxOckTVUmDuQ
 4lvoVXQtTVtuUOOQRv7ZZPW16GsdJZZ0tZP4UV56/KOAGiCprcLUJPmybAxxJ3VcAD2w
 rRuA==
X-Gm-Message-State: AOJu0Yw4AUqM3GTqfK/WrJqRve/Vx6+FUDEU2MOTNB6KZYlMlFLgL+if
 h4X+oCaH4Q9xj0z1kBD3zc/Rvg==
X-Google-Smtp-Source: AGHT+IFnXKu/ZtOnkqgv7q6nNBtoDdacLKbH5YvuPEusn4Gc9GBOG9X8LgHe/UkX8BRgHrXr/TsDpQ==
X-Received: by 2002:a5d:4d8c:0:b0:323:36a3:8ca with SMTP id
 b12-20020a5d4d8c000000b0032336a308camr1501528wru.28.1696410440570; 
 Wed, 04 Oct 2023 02:07:20 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 f16-20020a5d4dd0000000b00323384e04e8sm3476163wru.111.2023.10.04.02.07.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 02:07:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH 08/13] semihosting: Rename softmmu_FOO_user() ->
 uaccess_FOO_user()
Date: Wed,  4 Oct 2023 11:06:23 +0200
Message-ID: <20231004090629.37473-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Add a check in 'softmmu-uaccess.h' that the header is only
include in system emulation, and rename it as 'uaccess.h'.

Rename the API methods:

  - softmmu_[un]lock_user*() -> uaccess_[un]lock_user*()
  - softmmu_strlen_user() -> uaccess_strlen_user().

Update a pair of comments.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .../{softmmu-uaccess.h => uaccess.h}          | 24 +++++++++++--------
 semihosting/arm-compat-semi.c                 |  4 ++--
 semihosting/config.c                          |  2 +-
 semihosting/guestfd.c                         |  2 +-
 semihosting/syscalls.c                        |  2 +-
 semihosting/uaccess.c                         | 14 +++++------
 stubs/semihost.c                              |  4 ++--
 target/m68k/m68k-semi.c                       |  2 +-
 target/mips/tcg/sysemu/mips-semi.c            |  2 +-
 target/nios2/nios2-semi.c                     |  2 +-
 10 files changed, 31 insertions(+), 27 deletions(-)
 rename include/semihosting/{softmmu-uaccess.h => uaccess.h} (75%)

diff --git a/include/semihosting/softmmu-uaccess.h b/include/semihosting/uaccess.h
similarity index 75%
rename from include/semihosting/softmmu-uaccess.h
rename to include/semihosting/uaccess.h
index 4f08dfc098..3963eafc3e 100644
--- a/include/semihosting/softmmu-uaccess.h
+++ b/include/semihosting/uaccess.h
@@ -7,8 +7,12 @@
  * This code is licensed under the GPL
  */
 
-#ifndef SEMIHOSTING_SOFTMMU_UACCESS_H
-#define SEMIHOSTING_SOFTMMU_UACCESS_H
+#ifndef SEMIHOSTING_UACCESS_H
+#define SEMIHOSTING_UACCESS_H
+
+#ifdef CONFIG_USER_ONLY
+#error Cannot include semihosting/uaccess.h from user emulation
+#endif
 
 #include "cpu.h"
 
@@ -42,18 +46,18 @@
 
 #define put_user_ual(arg, p) put_user_u32(arg, p)
 
-void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
+void *uaccess_lock_user(CPUArchState *env, target_ulong addr,
                         target_ulong len, bool copy);
-#define lock_user(type, p, len, copy) softmmu_lock_user(env, p, len, copy)
+#define lock_user(type, p, len, copy) uaccess_lock_user(env, p, len, copy)
 
-char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr);
-#define lock_user_string(p) softmmu_lock_user_string(env, p)
+char *uaccess_lock_user_string(CPUArchState *env, target_ulong addr);
+#define lock_user_string(p) uaccess_lock_user_string(env, p)
 
-void softmmu_unlock_user(CPUArchState *env, void *p,
+void uaccess_unlock_user(CPUArchState *env, void *p,
                          target_ulong addr, target_ulong len);
-#define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
+#define unlock_user(s, args, len) uaccess_unlock_user(env, s, args, len)
 
-ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr);
-#define target_strlen(p) softmmu_strlen_user(env, p)
+ssize_t uaccess_strlen_user(CPUArchState *env, target_ulong addr);
+#define target_strlen(p) uaccess_strlen_user(env, p)
 
 #endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 564fe17f75..bb43f01265 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -202,13 +202,13 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
  * The semihosting API has no concept of its errno being thread-safe,
  * as the API design predates SMP CPUs and was intended as a simple
  * real-hardware set of debug functionality. For QEMU, we make the
- * errno be per-thread in linux-user mode; in softmmu it is a simple
+ * errno be per-thread in linux-user mode; in system-mode it is a simple
  * global, and we assume that the guest takes care of avoiding any races.
  */
 #ifndef CONFIG_USER_ONLY
 static target_ulong syscall_err;
 
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #endif
 
 static inline uint32_t get_swi_errno(CPUState *cs)
diff --git a/semihosting/config.c b/semihosting/config.c
index 8ca569735d..61e4016fc5 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -12,7 +12,7 @@
  * linux-user targets. However in that use case no configuration of
  * the outputs and command lines is supported.
  *
- * The config module is common to all softmmu targets however as vl.c
+ * The config module is common to all system targets however as vl.c
  * needs to link against the helpers.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index acb86b50dd..955c2efbd0 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -15,7 +15,7 @@
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #include CONFIG_DEVICES
 #endif
 
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index d27574a1e2..4060211d19 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -15,7 +15,7 @@
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #endif
 
 
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index 7505eb6d1b..5d889f9263 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -9,9 +9,9 @@
 
 #include "qemu/osdep.h"
 #include "exec/exec-all.h"
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 
-void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
+void *uaccess_lock_user(CPUArchState *env, target_ulong addr,
                         target_ulong len, bool copy)
 {
     void *p = malloc(len);
@@ -24,7 +24,7 @@ void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
     return p;
 }
 
-ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
+ssize_t uaccess_strlen_user(CPUArchState *env, target_ulong addr)
 {
     int mmu_idx = cpu_mmu_index(env, false);
     size_t len = 0;
@@ -72,16 +72,16 @@ ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
     }
 }
 
-char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
+char *uaccess_lock_user_string(CPUArchState *env, target_ulong addr)
 {
-    ssize_t len = softmmu_strlen_user(env, addr);
+    ssize_t len = uaccess_strlen_user(env, addr);
     if (len < 0) {
         return NULL;
     }
-    return softmmu_lock_user(env, addr, len + 1, true);
+    return uaccess_lock_user(env, addr, len + 1, true);
 }
 
-void softmmu_unlock_user(CPUArchState *env, void *p,
+void uaccess_unlock_user(CPUArchState *env, void *p,
                          target_ulong addr, target_ulong len)
 {
     if (len) {
diff --git a/stubs/semihost.c b/stubs/semihost.c
index aad7a70353..9343d385d7 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -1,9 +1,9 @@
 /*
- * Semihosting Stubs for SoftMMU
+ * Semihosting Stubs for system emulation
  *
  * Copyright (c) 2019 Linaro Ltd
  *
- * Stubs for SoftMMU targets that don't actually do semihosting.
+ * Stubs for system targets that don't actually do semihosting.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 80cd8d70db..b4ffb70f8b 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -27,7 +27,7 @@
 #include "gdbstub/syscalls.h"
 #include "gdbstub/helpers.h"
 #include "semihosting/syscalls.h"
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
 
diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index f3735df7b9..cc084eb1a2 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -22,7 +22,7 @@
 #include "qemu/log.h"
 #include "gdbstub/syscalls.h"
 #include "gdbstub/helpers.h"
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 #include "semihosting/syscalls.h"
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 9d0241c758..0b84fcb6b6 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -26,7 +26,7 @@
 #include "gdbstub/syscalls.h"
 #include "gdbstub/helpers.h"
 #include "semihosting/syscalls.h"
-#include "semihosting/softmmu-uaccess.h"
+#include "semihosting/uaccess.h"
 #include "qemu/log.h"
 
 #define HOSTED_EXIT  0
-- 
2.41.0


