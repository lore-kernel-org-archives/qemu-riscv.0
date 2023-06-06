Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C550C7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:13:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6XQu-0003u2-8T; Tue, 06 Jun 2023 10:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQs-0003rc-O8
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:13:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQr-0005XY-0J
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:13:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f73617a292so31371515e9.2
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686060787; x=1688652787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8nAhi/2SNnfVAGDO4jkwWlSD81rGbl1OFEARKV9v1gg=;
 b=ZFePHRIrrHCo5PHUbKJxOssBQTMb4ejob3tZ9F+15+4bt+xksiwzxKQZ0va02vC7Tk
 5862DobTK6pTJnMZ0e94D01Xf+QlzF3r4a3q8Vepc79h68jyXSOmqw3uPspX/iQEAdtF
 ic9jsUlRclmKH2bSIcLWPqphV7cpnbLelnznLbUGR1bOFxGdw5BIuxx5Z9H9AiWZAoPm
 /JjRRnUfpDqtOY58GUC02FK3w3Px76eCvcsAcjEjvLUfG8JZmgUyg/s201LpddtRwvzV
 C7FvK8+eOKs6nSI1M1rQt7XXHF9rz75S69/J7SnrLs20iQWbJeOqzG+n9gzcrYLDguO7
 JY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060787; x=1688652787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8nAhi/2SNnfVAGDO4jkwWlSD81rGbl1OFEARKV9v1gg=;
 b=UL8l23TVw5SDzfrkCg4VamSFw+ky3P7qv+XMnAccUZSFi0Ip0XtnDSqII4jgj37iyf
 9J1mdwhcF69yURKK2IEeCO4SF4RkZIiOOY6tdbKuvAKJJMirInjPJeLKHPonrx98D+Nd
 17Yn9RFq98YSGd7nCib+J5ZLm3GrAUsIaEqHDisbyBgR5t0QLPQp/2SW0Ge+HNkU6wxe
 qpK35gEXPZd3U0pyGOaT3j1dXJm9fhJodnLnEvF25FfQpgG7daRiNTExJQpjOAjCFMdq
 YMTjhMT8dP+bBjhsu15VlVEz1p3oeCiUjvo7kIOIlH3/T88V+qDa7cz1sazwhP8c09eL
 wPqg==
X-Gm-Message-State: AC+VfDyDV55zUzVo+OJ1Sr4RyYlldbWFlRAW+/hMz1m5/CKMH7X8OrIA
 IH+Xp96053QxkWlj8OqnsHfs0A==
X-Google-Smtp-Source: ACHHUZ7sjyyvnfEQXKtFae8FfA5WbqSpk2b7ZHJUQqqw3sKa1ZVkkbXasE9Ft/AWRnDZM3/G4LP+BA==
X-Received: by 2002:a05:600c:2056:b0:3f2:549b:3ef2 with SMTP id
 p22-20020a05600c205600b003f2549b3ef2mr2147438wmg.17.1686060787430; 
 Tue, 06 Jun 2023 07:13:07 -0700 (PDT)
Received: from localhost.localdomain
 (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a05600c365400b003f60fb2addbsm17816209wmq.44.2023.06.06.07.13.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jun 2023 07:13:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] target/arm: Rename helper template headers as '.h.inc'
Date: Tue,  6 Jun 2023 16:12:49 +0200
Message-Id: <20230606141252.95032-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230606141252.95032-1-philmd@linaro.org>
References: <20230606141252.95032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Therefore rename the included templates as '.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h                               | 8 ++++----
 target/arm/tcg/{helper-a64.h => helper-a64.h.inc} | 0
 target/arm/tcg/{helper-mve.h => helper-mve.h.inc} | 0
 target/arm/tcg/{helper-sme.h => helper-sme.h.inc} | 0
 target/arm/tcg/{helper-sve.h => helper-sve.h.inc} | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename target/arm/tcg/{helper-a64.h => helper-a64.h.inc} (100%)
 rename target/arm/tcg/{helper-mve.h => helper-mve.h.inc} (100%)
 rename target/arm/tcg/{helper-sme.h => helper-sme.h.inc} (100%)
 rename target/arm/tcg/{helper-sve.h => helper-sve.h.inc} (100%)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3335c2b10b..4218d98b51 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1039,9 +1039,9 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
-#include "tcg/helper-a64.h"
-#include "tcg/helper-sve.h"
-#include "tcg/helper-sme.h"
+#include "tcg/helper-a64.h.inc"
+#include "tcg/helper-sve.h.inc"
+#include "tcg/helper-sme.h.inc"
 #endif
 
-#include "tcg/helper-mve.h"
+#include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h.inc
similarity index 100%
rename from target/arm/tcg/helper-a64.h
rename to target/arm/tcg/helper-a64.h.inc
diff --git a/target/arm/tcg/helper-mve.h b/target/arm/tcg/helper-mve.h.inc
similarity index 100%
rename from target/arm/tcg/helper-mve.h
rename to target/arm/tcg/helper-mve.h.inc
diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h.inc
similarity index 100%
rename from target/arm/tcg/helper-sme.h
rename to target/arm/tcg/helper-sme.h.inc
diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h.inc
similarity index 100%
rename from target/arm/tcg/helper-sve.h
rename to target/arm/tcg/helper-sve.h.inc
-- 
2.38.1


