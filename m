Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020B2C4167B
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:38:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD20l-0004aP-5B; Tue, 12 Dec 2023 07:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD209-0003eT-TY
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:36:43 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD206-0000px-EA
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:36:41 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54f5469c211so5423960a12.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384594; x=1702989394; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFHPuaJlGIZrE/w+wBk6CARRnPU80SYEtnM2ju+CrtY=;
 b=ThPacPTpcNdd5Qb/M3Onu6B3EWSayIYppvhq421UAml+0njkTiCuas2ahYCFA437vO
 n3UuEAX6oeclRmhiAyxpCVSGgEXTmZaPuAF0wN841n6KQXEkd0wPzP0d0T7S7eDWACrc
 rUyUQLciXYzpeJ2zPh0Er3VwUluhZuvChyo2icGHIdVmvLNLNeX4hvbBZ7co1s1JNS65
 H7umbEySev1OgxEjrrAvAPri6uS9f1RVdE0albT4CDNgCpTraJ0eLAZ/saSXbrHq6JTz
 fIMm39ZjIeClKz/MuO0W730eYgXXVCz5tBT397UCRwSaolyfnOqkhHQhb5M4LEwipAHx
 Wy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384594; x=1702989394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UFHPuaJlGIZrE/w+wBk6CARRnPU80SYEtnM2ju+CrtY=;
 b=qDe/UVqrk2JecsPajxQqctFJEToJ0MRj7e4tH9fpFj3KMVtIkf7fR25RPUdlxV6RhW
 xByr2iBYAb9IokPFKRXN4rvvIo4F5UkpnEWug2OlItmw+sQUoS1+rxBi22hivBCpJmxl
 A21tAwu+DG88HjwcFWPas+zomIwcddfHw8oti/RMX6RpxxEHackLnJCHZjkM2SbfGKBN
 1s+mErj9KwZD5lAuGyc5IwiFzfK2sKfO2Uw+mcM0ux/BWomKF5p6U0rieZWUUosiU+XW
 fdkgiJwR51jttEygc6AhPXPIZm/XYRSPI4w46lUZjnQRa8mT/QobRczFLk8yiIbVoAAz
 o3lg==
X-Gm-Message-State: AOJu0YzkOkQ3/s+OroD9QeH//ky3RikjEncnrPmnpRSwkKV10tTDRxXr
 x3UzaYGcRd2IYzwrQ1NhlckB/w==
X-Google-Smtp-Source: AGHT+IGNAmk6pXo2b3cLPD4XysG56TpqFrfp7UlChY4rorxaBCoksAKV4l1tnnkqqSdoViFdZ/pQhg==
X-Received: by 2002:a17:906:44a:b0:a1b:86e5:4e1 with SMTP id
 e10-20020a170906044a00b00a1b86e504e1mr3066964eja.108.1702384594559; 
 Tue, 12 Dec 2023 04:36:34 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 ll9-20020a170907190900b00a1cbb289a7csm6155242ejc.183.2023.12.12.04.36.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:36:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 21/23] exec/cpu-all: Restrict inclusion of
 'exec/user/guest-base.h'
Date: Tue, 12 Dec 2023 13:33:57 +0100
Message-ID: <20231212123401.37493-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Declare 'have_guest_base' in "exec/user/guest-base.h".
Very few files require this header, so explicitly include
it there instead of "exec/cpu-all.h" which is used in many
source files.
Assert this user-specific header is only included from user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h         | 3 ---
 include/exec/cpu_ldst.h        | 2 ++
 include/exec/user/guest-base.h | 6 ++++++
 bsd-user/main.c                | 1 +
 linux-user/elfload.c           | 1 +
 linux-user/main.c              | 1 +
 6 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 95af418920..d2ddfae286 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -65,9 +65,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
-#include "exec/user/guest-base.h"
-
-extern bool have_guest_base;
 
 /*
  * If non-zero, the guest virtual address space is a contiguous subset
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 64e0319996..e039cc7f80 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,6 +69,8 @@
 
 #if defined(CONFIG_USER_ONLY)
 
+#include "exec/user/guest-base.h"
+
 #ifndef TARGET_TAGGED_ADDRESSES
 static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 {
diff --git a/include/exec/user/guest-base.h b/include/exec/user/guest-base.h
index afe2ab7fbb..cf40151360 100644
--- a/include/exec/user/guest-base.h
+++ b/include/exec/user/guest-base.h
@@ -7,6 +7,12 @@
 #ifndef EXEC_USER_GUEST_BASE_H
 #define EXEC_USER_GUEST_BASE_H
 
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
 extern uintptr_t guest_base;
 
+extern bool have_guest_base;
+
 #endif
diff --git a/bsd-user/main.c b/bsd-user/main.c
index e6014f517e..c331d727e1 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -36,6 +36,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "exec/exec-all.h"
+#include "exec/user/guest-base.h"
 #include "tcg/startup.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index debea5c355..a8c106ec0c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 
 #include "qemu.h"
 #include "exec/user/tswap-target.h"
+#include "exec/user/guest-base.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index 0cdaf30d34..84691d707b 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -38,6 +38,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
+#include "exec/user/guest-base.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/user.h"
-- 
2.41.0


