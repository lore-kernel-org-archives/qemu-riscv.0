Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD79C54798
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 16:36:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rdYVn-0000bx-5C; Fri, 23 Feb 2024 11:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYJU-0003xO-O9
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:22:16 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYJJ-000636-9b
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:22:16 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4127190ad83so6971255e9.0
 for <qemu-riscv@nongnu.org>; Fri, 23 Feb 2024 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708705323; x=1709310123; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eLoCVfGQA0B56KJFSLQeHKi/nYPeRXMDk6OZ3NrpqZo=;
 b=AuEij2KrfDXJQJPOiZrvW102piFeCYe4ETGij+XBsFqskIfYc7SBWRVtQ4FhDGTZOM
 cY4w/dz4MtYLT0HGjOydVtPck9JPrwtEWWgzTsmuAU23ZuUtQy+BICC6sUwvQdAXZuf1
 og20PKe2qqEAjYuixcMctF94jI6mr7buEOuWaWr9Uv9M/B6Svewme2XXtwV7MozfywOC
 wtkSMFIqsi42Auf17Rk2xd9OWrGlu42aFzz7DoX8WRc3gf3QygVXGD8eKBghZ+moCE5T
 5E15hG6+EzX3DLpxHB2iteDpXAxw08qObSkfUmY7tDWpeSXb6hw7XlsgWLanUkOw27pa
 1HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708705323; x=1709310123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLoCVfGQA0B56KJFSLQeHKi/nYPeRXMDk6OZ3NrpqZo=;
 b=nTQB7YPDqsDo/LYXS7m8GV0ZgyOi7mNLfcPrXJjpjmLRg5Vj4OWOHlwxuAmL5lEmDp
 D5qC3bOs4h547pzqNlbetZRpfbIyBAf8h4s1r+4LqqLLa1CkDcIUBssCOrcVJpxv2IA5
 WNDb8DGGoi02zLcQFujDT3KDf43Erpi7pI5kw8sxuIMgO5n1OVrUsJl6NMZ93iTpnsBu
 Og3UtniWj8pR0LnzCj4cN9WduVtanJwpV0VvYM6Ln+cD9ypnVZ624yWiujhzoy+VCOCg
 aQIENLoZNJKcGvgKMYQ25EJXNMH2O7QgKYPJJAqW2p6ktdxLq3GlBuaVao28ET5SS4Ho
 Keiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW085As3DOsLXh9yLKqeWNdcc2JyMsaHAthgmPngsnqGPRKLXMRAzz2wwITEjyJ2rhAMn4ICEkhJeYnw4XagwYZTjJQj7Y=
X-Gm-Message-State: AOJu0Yx3lnr6UWlOE2nFSnK1r1ZKt3/ULPZlxS+m8uGWLBH5hXHLxJaP
 8B2V+Xl6A8EWAw+nqLl8jpoGQOv/z2KctNYh0ccWDT+v4MO/3zuQX/gvM1FG8WA=
X-Google-Smtp-Source: AGHT+IGcUCoViou239QibPBSUvZhRPwseyFY+ZLxBgrbA4mLNafh0ojegHnvH2Bd1uTDTYMGa7Nn/w==
X-Received: by 2002:a05:600c:3548:b0:412:96d7:c4d6 with SMTP id
 i8-20020a05600c354800b0041296d7c4d6mr249661wmq.41.1708705323413; 
 Fri, 23 Feb 2024 08:22:03 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b0033d282c7537sm3313119wrs.23.2024.02.23.08.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 08:22:03 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 883225F904;
 Fri, 23 Feb 2024 16:22:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, John Snow <jsnow@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 01/27] tests/tcg: update licenses to GPLv2 as intended
Date: Fri, 23 Feb 2024 16:21:36 +0000
Message-Id: <20240223162202.1936541-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223162202.1936541-1-alex.bennee@linaro.org>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

My default header template is GPLv3 but for QEMU code we really should
stick to GPLv2-or-later (allowing others to up-license it if they
wish). While this is test code we should still be consistent on the
source distribution.

I wrote all of this code so its not a problem. However there remains
one GPLv3 file left which is the crt0-tc2x.S for TriCore.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240215184036.214065-1-alex.bennee@linaro.org>
---
 tests/tcg/aarch64/semicall.h                      | 4 ++--
 tests/tcg/arm/semicall.h                          | 4 ++--
 tests/tcg/multiarch/float_helpers.h               | 4 ++--
 tests/tcg/riscv64/semicall.h                      | 4 ++--
 tests/tcg/multiarch/arm-compat-semi/semiconsole.c | 4 ++--
 tests/tcg/multiarch/arm-compat-semi/semihosting.c | 4 ++--
 tests/tcg/multiarch/float_convd.c                 | 4 ++--
 tests/tcg/multiarch/float_convs.c                 | 4 ++--
 tests/tcg/multiarch/float_madds.c                 | 4 ++--
 tests/tcg/multiarch/libs/float_helpers.c          | 4 ++--
 tests/tcg/i386/system/boot.S                      | 6 +++---
 tests/tcg/x86_64/system/boot.S                    | 6 +++---
 12 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/tests/tcg/aarch64/semicall.h b/tests/tcg/aarch64/semicall.h
index 8a3fce35c5f..30d4de9a549 100644
--- a/tests/tcg/aarch64/semicall.h
+++ b/tests/tcg/aarch64/semicall.h
@@ -1,10 +1,10 @@
 /*
  * Semihosting Tests - AArch64 helper
  *
- * Copyright (c) 2019
+ * Copyright (c) 2019, 2024
  * Written by Alex Bennée <alex.bennee@linaro.org>
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
diff --git a/tests/tcg/arm/semicall.h b/tests/tcg/arm/semicall.h
index ad8ac51310b..624937c5577 100644
--- a/tests/tcg/arm/semicall.h
+++ b/tests/tcg/arm/semicall.h
@@ -1,10 +1,10 @@
 /*
  * Semihosting Tests - ARM Helper
  *
- * Copyright (c) 2019
+ * Copyright (c) 2019, 2024
  * Written by Alex Bennée <alex.bennee@linaro.org>
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
diff --git a/tests/tcg/multiarch/float_helpers.h b/tests/tcg/multiarch/float_helpers.h
index 309f3f4bf10..c42ebe64b9e 100644
--- a/tests/tcg/multiarch/float_helpers.h
+++ b/tests/tcg/multiarch/float_helpers.h
@@ -1,9 +1,9 @@
 /*
  * Common Float Helpers
  *
- * Copyright (c) 2019 Linaro
+ * Copyright (c) 2019, 2024 Linaro
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include <inttypes.h>
diff --git a/tests/tcg/riscv64/semicall.h b/tests/tcg/riscv64/semicall.h
index f8c88f32dc5..11d0650cb06 100644
--- a/tests/tcg/riscv64/semicall.h
+++ b/tests/tcg/riscv64/semicall.h
@@ -1,10 +1,10 @@
 /*
  * Semihosting Tests - RiscV64 Helper
  *
- * Copyright (c) 2021
+ * Copyright (c) 2021, 2024
  * Written by Alex Bennée <alex.bennee@linaro.org>
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
diff --git a/tests/tcg/multiarch/arm-compat-semi/semiconsole.c b/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
index 1d82efc589d..1e2268f4b75 100644
--- a/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
@@ -1,10 +1,10 @@
 /*
  * linux-user semihosting console
  *
- * Copyright (c) 2019
+ * Copyright (c) 2024
  * Written by Alex Bennée <alex.bennee@linaro.org>
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #define SYS_READC       0x07
diff --git a/tests/tcg/multiarch/arm-compat-semi/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
index 8627eee3cf7..f609c01341a 100644
--- a/tests/tcg/multiarch/arm-compat-semi/semihosting.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
@@ -1,10 +1,10 @@
 /*
  * linux-user semihosting checks
  *
- * Copyright (c) 2019
+ * Copyright (c) 2019, 2024
  * Written by Alex Bennée <alex.bennee@linaro.org>
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #define SYS_WRITE0      0x04
diff --git a/tests/tcg/multiarch/float_convd.c b/tests/tcg/multiarch/float_convd.c
index 0a1f0f93dc5..58d7f8b4c58 100644
--- a/tests/tcg/multiarch/float_convd.c
+++ b/tests/tcg/multiarch/float_convd.c
@@ -1,9 +1,9 @@
 /*
  * Floating Point Convert Doubles to Various
  *
- * Copyright (c) 2019 Linaro
+ * Copyright (c) 2019, 2024 Linaro
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include <stdio.h>
diff --git a/tests/tcg/multiarch/float_convs.c b/tests/tcg/multiarch/float_convs.c
index 2e4fa55324d..cb1fdd439e3 100644
--- a/tests/tcg/multiarch/float_convs.c
+++ b/tests/tcg/multiarch/float_convs.c
@@ -1,9 +1,9 @@
 /*
  * Floating Point Convert Single to Various
  *
- * Copyright (c) 2019 Linaro
+ * Copyright (c) 2019, 2024 Linaro
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include <stdio.h>
diff --git a/tests/tcg/multiarch/float_madds.c b/tests/tcg/multiarch/float_madds.c
index 4888f8641f4..a692e052d5b 100644
--- a/tests/tcg/multiarch/float_madds.c
+++ b/tests/tcg/multiarch/float_madds.c
@@ -1,9 +1,9 @@
 /*
  * Fused Multiply Add (Single)
  *
- * Copyright (c) 2019 Linaro
+ * Copyright (c) 2019, 2024 Linaro
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include <stdio.h>
diff --git a/tests/tcg/multiarch/libs/float_helpers.c b/tests/tcg/multiarch/libs/float_helpers.c
index 4e68d2b6598..fad5fc98933 100644
--- a/tests/tcg/multiarch/libs/float_helpers.c
+++ b/tests/tcg/multiarch/libs/float_helpers.c
@@ -5,9 +5,9 @@
  * floating point constants useful for exercising the edge cases in
  * floating point tests.
  *
- * Copyright (c) 2019 Linaro
+ * Copyright (c) 2019, 2024 Linaro
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 /* we want additional float type definitions */
diff --git a/tests/tcg/i386/system/boot.S b/tests/tcg/i386/system/boot.S
index 9e8920cbfe0..28902c400d8 100644
--- a/tests/tcg/i386/system/boot.S
+++ b/tests/tcg/i386/system/boot.S
@@ -2,12 +2,12 @@
  * i386 boot code, based on  qemu-bmibug.
  *
  * Copyright 2019 Doug Gale
- * Copyright 2019 Linaro
+ * Copyright 2019, 2024 Linaro
  *
- * This work is licensed under the terms of the GNU GPL, version 3 or later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
         .section .head
diff --git a/tests/tcg/x86_64/system/boot.S b/tests/tcg/x86_64/system/boot.S
index dac9bd534d7..7213aec63b2 100644
--- a/tests/tcg/x86_64/system/boot.S
+++ b/tests/tcg/x86_64/system/boot.S
@@ -1,16 +1,16 @@
 /*
  * x86_64 boot and support code
  *
- * Copyright 2019 Linaro
+ * Copyright 2019, 2024 Linaro
  *
- * This work is licensed under the terms of the GNU GPL, version 3 or later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  *
  * Unlike the i386 version we instead use Xen's PVHVM booting header
  * which should drop us automatically into 32 bit mode ready to go. I've
  * nabbed bits of the Linux kernel setup to achieve this.
  *
- * SPDX-License-Identifier: GPL-3.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
         .section .head
-- 
2.39.2


