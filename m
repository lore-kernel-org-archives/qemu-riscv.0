Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6EBC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:28:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnk9-0005bk-Po; Mon, 11 Dec 2023 16:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnk6-0005Kt-AU
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:23:11 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnk4-0005s8-AC
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:23:10 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-54dca2a3f16so9102193a12.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329787; x=1702934587; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fz8HKxM7VVSIi3osZUv3wojb8Ys1Hua/IsYgZ7swcCg=;
 b=AQP3i49Jx/MZR9E0744/rwo1Ou+6QctPa4kcMbfLGvQYgeFDX31El/X4bseM/hQ8g8
 AHbr4JKSfHCryjyRjNodZwE66BxtprRw4+LwDGrv8TcEqpd9FHtfdhMw+ioBXuaYU6gc
 q5b8g8qvzdJ44DQwNWoL3IV4tROPgPpG6F2nCHgwKGmQY3P3lptvdo6TfVRW37xVzl89
 M0f08Mil3zhpCZec0kiC0SUO3OHAE/R6RYTXXgVg8r8C3NbDP4CXycZFcbFVfwDMVWYN
 VOeqpP8/PfXd39wmYtnoRYUiUkTFpugtNuDxJzNP8AVI8K07BWReL8UWKsEp4QFHPoED
 lsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329787; x=1702934587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fz8HKxM7VVSIi3osZUv3wojb8Ys1Hua/IsYgZ7swcCg=;
 b=j2Zq9ONMncydXVryZvckT0D6Ut155bwAaASbvQx/Tk6583FdUPTK+HcEo9it/pT512
 RR+c/dK53j4XIvms1NBmFTaFStwAbPILkAPJynvXgRuXtKkf6XLpUEpE2x0M0vW6Q8RA
 ulUwqNdieVAxv07UKOYNd551kKOYLN9qXuoK6ptEu+HRBjqwxoQBE+R8I4+5+fYhR9C0
 kF6af+4OSprIniI+7qyej/PHTmti+YDJAWumhJ46ekXUEOjizYEwyKhl8g9NTQXcdV62
 TMUMkLaRA2zqhSPgw++bk71O8r/wS6BMRrYFzK8u+qID5WLK/SBOtGP+ODUY+0K+IBwO
 TzMw==
X-Gm-Message-State: AOJu0YxxWdsj+1/Ijy50v68tRELpTaRxeAPKF73POKk703iFllRYoiaa
 /m5seiTTg+/Lq7A0rUSNaZq5JA==
X-Google-Smtp-Source: AGHT+IEqSygAcNwC+o5B672MJ7q2nrXQaLih0XxOY9Iv/XLw9Z61UiqNUbCr3QSxyrAi+85OAHMOjg==
X-Received: by 2002:a17:907:2723:b0:a1f:8149:558c with SMTP id
 d3-20020a170907272300b00a1f8149558cmr4160576ejl.30.1702329787041; 
 Mon, 11 Dec 2023 13:23:07 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 qo14-20020a170907874e00b00a1f6737be65sm5109488ejc.82.2023.12.11.13.23.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:23:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 22/24] exec/cpu-all: Restrict inclusion of
 'exec/user/guest-base.h'
Date: Mon, 11 Dec 2023 22:19:59 +0100
Message-ID: <20231211212003.21686-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
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
---
 include/exec/cpu-all.h         | 3 ---
 include/exec/user/guest-base.h | 6 ++++++
 bsd-user/main.c                | 1 +
 linux-user/elfload.c           | 1 +
 linux-user/main.c              | 1 +
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 2d568ae4f0..5b75d04ff6 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -74,9 +74,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
-#include "exec/user/guest-base.h"
-
-extern bool have_guest_base;
 
 /*
  * If non-zero, the guest virtual address space is a contiguous subset
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
index cf9e74468b..f9e9ac1760 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -6,6 +6,7 @@
 #include <sys/shm.h>
 
 #include "qemu.h"
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


