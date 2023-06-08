Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B2FC7EE43
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 13:32:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Fji-0001X4-8O; Thu, 08 Jun 2023 09:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Fjg-0001VO-CP
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 09:31:32 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Fjd-0005nY-U6
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 09:31:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6e1393f13so4094185e9.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686231088; x=1688823088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIvtCmiWepPA7NXEFbXWWLePEDf5Lnkm5evgEG2zaNg=;
 b=YnT/kOj39J4MceJDSe16IwcpGvYmeh17Dvh5M3p2jlc9+Uqw1EXdQEVCXWysqW+SEd
 wAMadfDa4QCNDQJda39OAi6CvgZMNHCPkpYkXCNgdKYN59zd5ZoLk2VCrjBALLJuwQt+
 PJYcPL5BV9L4YuLzQdkN7gqLl9RbGBCxRECaCTvMk4IYk9reN5aMFnCecvkN5HBugxMR
 1DQVHpoTBtGjZD1KXfNmxdJZ91lLEhQtnleGrLVLsn2S2MzcsjgXbOvadmIS1vx7okE2
 Et/aVv5U/a3wQryz/kuZ9TZKuJ5GP8E1wl9asI7qJkrTCr+diA71QG+yGFFudCfUvPFR
 4OEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686231088; x=1688823088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIvtCmiWepPA7NXEFbXWWLePEDf5Lnkm5evgEG2zaNg=;
 b=KLzdDPgtgkpMhX6qbCJihpOawxaSiBrS2EBnY0osNLqXnPuTIc1ZArZq1vpInYW4GO
 4sg8jApJfvo3UqQoHtIy787UeIdh8qT68EoZJGzP1oOncgFXPFrXvhKNDOqwTL6Xvnr5
 RtkrSkpsVI0sNLmlMSSOqzq65/v1wQMRVDLe688JeR0mlozYi7QU1zTHPiim3iS4a06F
 0AQ7Z8Hz+PIGVVGYoW+XIAK12KsEKYdOLGPX2ez0aBmT44M2Dytr7T/pcgi0Y/NFBcp6
 2LdttTRy7/FPOM0fnG9YGfZuaJaCwip4YePhCpALroy+KSzJ57mRzYYOCvumF52OlZYn
 mxBg==
X-Gm-Message-State: AC+VfDzp2/p8aIQTHeHvn/yD0ptQ/G7jvD/ASOLKMkDkhR0opeTEcxUq
 qtEvbLkG5/dhu/tcnCMtOOF49g==
X-Google-Smtp-Source: ACHHUZ5P/YnjUm3G3c/wrUfO3br8Qx7KVhNZsqrPuY4z4qYywqco3dNs1TsOdF7HDSqOVAxkUo3s1A==
X-Received: by 2002:a7b:cc08:0:b0:3f7:fa21:f66 with SMTP id
 f8-20020a7bcc08000000b003f7fa210f66mr1375067wmh.26.1686231088711; 
 Thu, 08 Jun 2023 06:31:28 -0700 (PDT)
Received: from localhost.localdomain ([176.176.169.168])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a7bc019000000b003f7e6d7f71esm2035290wmb.36.2023.06.08.06.31.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Jun 2023 06:31:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/5] target/arm: Rename helper template headers as '.h.inc'
Date: Thu,  8 Jun 2023 15:31:06 +0200
Message-Id: <20230608133108.72655-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230608133108.72655-1-philmd@linaro.org>
References: <20230608133108.72655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


