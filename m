Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35937C83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:12:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhLa-0008Dp-Qy; Thu, 31 Aug 2023 09:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhIB-00014V-5Q
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhI8-0006xB-FT
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso7562545e9.2
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486855; x=1694091655; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DlQKvvYxi/qCYEWGVTmqr7bzh4KTihilnnc7Rwr6fI=;
 b=jCMrT8BIIecveYmht/zcR/MM4uSG20H+ePvDhXxPp5EyW4gGprD3ZFRlSJvHI4PkTF
 M9GnGmQQuS1T1lzbUXoP2Pd5DjxAm+T6ZcY1rIBUb1moJqFhcxUeSIRci2fus8QnQLXu
 qR84noLKVTQTohPxZFgVWrgt7HYhKzjv/ZrOdqaGkprfSMXqiRrkY3H9l9E03LuhoisL
 TqYYowdoob2Fd5ufFBYXt7elTFPFmyyuoyfCIKjk9mNuz+rfsceyNNPBurh7PXYEbQdw
 8Cg6kYuDR7uvdhIV+Izm+MnrdgQiIuyVRK5x6Q20zeiKf8+RukKFa+G5mECmUzLfIdug
 g+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486855; x=1694091655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DlQKvvYxi/qCYEWGVTmqr7bzh4KTihilnnc7Rwr6fI=;
 b=UA7czsf4y26Jn8zbOf2n5RqxfXY+w/3liaa3sHF8rc04dZem0apmPOVTE+GV/tqaGa
 Q0tUE6BiMd3Qiw9RxeAFei7UkniwV8yVgSzIHWbiy5NOh9Guy1vCNz7UmJL7vEwKxiQv
 6KAl4KIeD5vIBvTnmKH3R3DTLMqZdymk8Af3ImYm0emIr+XJc+V61iutsUtdxrDSjVPr
 +hQu1xWoCHNVQYw/V47Qv+9Ul3svOXrvfW7FB+DysRZvlVfQrXmnWBKyu4H8jVmGaZDG
 0IvA4VYr+2fW+4hHRHv88EX7PnMflK2w18uTIBCwA5dK+Z++v0j4ASlTQbCywDXOBXxO
 A3pQ==
X-Gm-Message-State: AOJu0Yxhy5GprsbcjxGUs1lfkXmEeYv8gjZwrSKdvw2cHZXooF1QBedY
 yQxZJcYqyqm5ThMYg9NFtTvHbIsAqgjp0xGq9CU=
X-Google-Smtp-Source: AGHT+IF9zXp5z0tE5lsQ1/7sCJqanpRlZWKLVXEkWFZx1qC01p3Yj6O7U9t2aQzWy2kATFY9QwU5/g==
X-Received: by 2002:a05:600c:228e:b0:3fe:ef11:d79f with SMTP id
 14-20020a05600c228e00b003feef11d79fmr4442477wmf.36.1693486854925; 
 Thu, 31 Aug 2023 06:00:54 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003fedcd02e2asm1881333wmg.35.2023.08.31.06.00.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 06:00:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 41/41] tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc
Date: Thu, 31 Aug 2023 14:56:43 +0200
Message-ID: <20230831125646.67855-42-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename 'bti-crt.inc.c' as 'bti-crt.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230606141252.95032-6-philmd@linaro.org>
---
 tests/tcg/aarch64/bti-1.c                          | 2 +-
 tests/tcg/aarch64/bti-3.c                          | 2 +-
 tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} (100%)

diff --git a/tests/tcg/aarch64/bti-1.c b/tests/tcg/aarch64/bti-1.c
index 61924f0d7a..99a879af23 100644
--- a/tests/tcg/aarch64/bti-1.c
+++ b/tests/tcg/aarch64/bti-1.c
@@ -2,7 +2,7 @@
  * Branch target identification, basic notskip cases.
  */
 
-#include "bti-crt.inc.c"
+#include "bti-crt.c.inc"
 
 static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 {
diff --git a/tests/tcg/aarch64/bti-3.c b/tests/tcg/aarch64/bti-3.c
index a852856d9a..8c534c09d7 100644
--- a/tests/tcg/aarch64/bti-3.c
+++ b/tests/tcg/aarch64/bti-3.c
@@ -2,7 +2,7 @@
  * BTI vs PACIASP
  */
 
-#include "bti-crt.inc.c"
+#include "bti-crt.c.inc"
 
 static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 {
diff --git a/tests/tcg/aarch64/bti-crt.inc.c b/tests/tcg/aarch64/bti-crt.c.inc
similarity index 100%
rename from tests/tcg/aarch64/bti-crt.inc.c
rename to tests/tcg/aarch64/bti-crt.c.inc
-- 
2.41.0


