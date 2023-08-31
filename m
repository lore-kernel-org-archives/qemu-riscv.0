Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594C4C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:14:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhKK-0006CU-BZ; Thu, 31 Aug 2023 09:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFv-0003ch-P8
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:40 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFr-0005dz-Pi
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401f503b529so7249995e9.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486713; x=1694091513; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1e6wfOUuMKCjdsL213yjWvY/4BGAvkNLIa8eLz9Omvk=;
 b=GqF3GdQVzYimY9Po0NsGNUukTmmDDvsPWS/nUcIXw+JBi/N+/oL9qpzAzNN2aiDHkI
 9ofSg81Gi/P4Z+/TGoTmVsUh76Hchj044h2eyZe4QS1+QDWZmdL4G02Ndzui2eEywxhc
 ZXbiOVuGj1cd0cyqO9QguLxF2Stp7uOt7TLJ0dMcuod+1JF7jNcM6qZelmyezgsbvFw4
 Cb2wJJs5qaBf5I8gcxEgZcpCt2uk9mwmMMwc7AXLiTIBIOZ4ORbQ9XgTyn0mOscYg5nd
 T6woG8kSpF0hsabxvgV9addb3+NTftYVbZxCnpsplbGvg7rqm1lkYj2sRokO97aMuyio
 sIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486713; x=1694091513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1e6wfOUuMKCjdsL213yjWvY/4BGAvkNLIa8eLz9Omvk=;
 b=NeV2pMeo3Qjxt3aq6WVby8bhDPe9cauQzQvBSq2ILJ1GghROJY2GzNBW33ThCEYQkD
 5ZT35wygXkokSRF6O2qBwlNBX4d9F+Kgbov7mkOsRO1jyjb6qO19Tp2TNAACi+ZXnSjH
 hHfJpdSmgCbcPJOo3iHx7+HqDWwXACNMdLyJDJRMRjUfSDS46S+SPC4eonLzhG2slYYG
 MC0xOcpXmYmQBTJT9uLunujVaxBWZEsp9pmNF8mzaWW6Sg6RldLHrmGLDD9jV1vThM/j
 JprRUgtJXozpcAYDjFlJBHorm3rzdfdl+v0wbf4RSzeL51kYIxVF6umofJLEXaNCVKBE
 fGsA==
X-Gm-Message-State: AOJu0YymbXqgR3BHHjw4zL7eGr2j5qtRgzrB2bxZTxbbi/XcmvRRMwFz
 vXh/a6PQqtXNWDeJC7qvI9y9yg==
X-Google-Smtp-Source: AGHT+IHUjWLU/+eXL8zH76o+mmIerwYhEBVW+dytGy6Gbed/inQ69l/k7pg20eFJP18gbEsSL/iHSw==
X-Received: by 2002:a05:6000:11c6:b0:317:5b76:826 with SMTP id
 i6-20020a05600011c600b003175b760826mr3994669wrx.0.1693486713368; 
 Thu, 31 Aug 2023 05:58:33 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a05600c218200b003fef5402d2dsm5122621wme.8.2023.08.31.05.58.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/41] exec/translation-block: Clean up includes
Date: Thu, 31 Aug 2023 14:56:20 +0200
Message-ID: <20230831125646.67855-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

'qemu/atomic.h' and 'exec/target_page.h' are not used.
'qemu/interval-tree.h' is only required for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-12-philmd@linaro.org>
---
 include/exec/translation-block.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index 5119924927..b785751774 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -7,11 +7,11 @@
 #ifndef EXEC_TRANSLATION_BLOCK_H
 #define EXEC_TRANSLATION_BLOCK_H
 
-#include "qemu/atomic.h"
 #include "qemu/thread.h"
-#include "qemu/interval-tree.h"
 #include "exec/cpu-common.h"
-#include "exec/target_page.h"
+#ifdef CONFIG_USER_ONLY
+#include "qemu/interval-tree.h"
+#endif
 
 /*
  * Page tracking code uses ram addresses in system mode, and virtual
-- 
2.41.0


