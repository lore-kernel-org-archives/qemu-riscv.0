Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B0CC05023
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 19:33:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rxXSZ-0000CR-Kj; Thu, 18 Apr 2024 15:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXPg-0000D9-Hn
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:27:18 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rxXPe-0007bI-MQ
 for qemu-riscv@nongnu.org; Thu, 18 Apr 2024 15:27:16 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a523524e5baso129544466b.3
 for <qemu-riscv@nongnu.org>; Thu, 18 Apr 2024 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713468433; x=1714073233; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dml4vJCRKxCVY1uFtRIPG5lLzhQacgo/ZMSZt5sIQXk=;
 b=s0GWNpWbxlSuPx0vJ7p9ynQSeHaNOyYRX7Amfsgw8O4d/p11qNn2v5a4XpEuS1JXGo
 rQWrWIlD16vjIGqjWJzeUbh3WObU3OVpVG6L9bUAIz29fbNXfsb7MBnClZveoINehthx
 xook377/S9V4/YkCOrRrp73n4JJfenHHvrFyA+UYrCJ+uSXE1JKF7pKSJctNw1oPMznt
 EsMdeygEerSsbqmjmXfuZj5LmdF+A13jUx8gYLHLQ+ULwKAdGpuIXbvDUyKAzjZpB1PT
 yNsMmi2MhmmN1NFmITn8rHiSXZgUh3ViMW4tzD5j70brvYrIftV89SE+dgrAkkoWczax
 suuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713468433; x=1714073233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dml4vJCRKxCVY1uFtRIPG5lLzhQacgo/ZMSZt5sIQXk=;
 b=R0NBOo6RFq+H1iGK6XH0FU5a2dH36KfYhNsxNvgxtmtaXY44R1JL3zr7ZnOjirao3+
 YN+Vgx17IGAgP5T9BNjeIf3q2Xr5Nhd/9WUwFs8qLUibAqBsoQVywYYErskNGkxEhbB/
 aGkKsYrwPJPGUc9FMM5xEJGXvHjA3qrQ+U3kC+oXQOtrzSSIP03DlveRiN7cxeXeO4z/
 /V5V4HjWhFwl1Fm7IzBba5JynjyfICy4Hwhn+3pg9zwKuHaKm+biuGYQ/YqU+eT6aXwd
 3yw7qrbRmgIEYeJCMr/dCOw/6O6ErRQuwaueE/nV9ER0pG1/nj2ldBLaLzxEx1bvbO9c
 nL5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYC+StJ0SZgUd3Vq1rOBe5kDPYRBoZLMSkUm2ajphJ4BfHkzOscMNvYY9K+U3LmVfUtN29PMCJ7WR8zZ7uUm+smhVn9Bk=
X-Gm-Message-State: AOJu0YyMHC0g44yxMlDz/vlk1s7ivjYUYbhDMMb/qoge7gi6Nfv4r9wI
 v+ZRFppKbyH32sjqNT7okJW6h7B33T1OVYC6A8dPZDcgdYTDejPqb6B31978hIU=
X-Google-Smtp-Source: AGHT+IErWPr/zfg0WmvCw3RKPanQkeAYRatbBUwaG2fx37IV0JpOFdDvX+lUOlTZSWvTHHNC9ulpZw==
X-Received: by 2002:a17:906:6bc7:b0:a52:13ee:8124 with SMTP id
 t7-20020a1709066bc700b00a5213ee8124mr59241ejs.35.1713468433364; 
 Thu, 18 Apr 2024 12:27:13 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.151.213])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a1709060a5000b00a5575c9d5b4sm967734ejf.63.2024.04.18.12.27.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Apr 2024 12:27:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 15/24] exec: Restrict inclusion of 'user/guest-base.h'
Date: Thu, 18 Apr 2024 21:25:14 +0200
Message-ID: <20240418192525.97451-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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

Declare 'have_guest_base' in "user/guest-base.h".

Very few files require this header, so explicitly include
it there instead of "exec/cpu-all.h" which is used in many
source files.

Assert this user-specific header is only included from user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231211212003.21686-23-philmd@linaro.org>
---
 include/exec/cpu-all.h    | 3 ---
 include/exec/cpu_ldst.h   | 2 ++
 include/user/guest-base.h | 6 ++++++
 bsd-user/main.c           | 1 +
 linux-user/elfload.c      | 1 +
 linux-user/main.c         | 1 +
 6 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 027f19e052..e75ec13cd0 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -65,9 +65,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
-#include "user/guest-base.h"
-
-extern bool have_guest_base;
 
 /*
  * If non-zero, the guest virtual address space is a contiguous subset
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 2c5a0a5c81..6d47d3114a 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -73,6 +73,8 @@
 
 #if defined(CONFIG_USER_ONLY)
 
+#include "user/guest-base.h"
+
 #ifndef TARGET_TAGGED_ADDRESSES
 static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 {
diff --git a/include/user/guest-base.h b/include/user/guest-base.h
index 1e42bca5db..055c1d14fe 100644
--- a/include/user/guest-base.h
+++ b/include/user/guest-base.h
@@ -7,6 +7,12 @@
 #ifndef USER_GUEST_BASE_H
 #define USER_GUEST_BASE_H
 
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
 extern uintptr_t guest_base;
 
+extern bool have_guest_base;
+
 #endif
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 01b313756e..29a629d877 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -36,6 +36,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "exec/exec-all.h"
+#include "user/guest-base.h"
 #include "tcg/startup.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index fc60c01d57..9ed4baa2ac 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -8,6 +8,7 @@
 
 #include "qemu.h"
 #include "user/tswap-target.h"
+#include "user/guest-base.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index 149e35432e..94e4c47f05 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -38,6 +38,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
+#include "user/guest-base.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/user.h"
-- 
2.41.0


