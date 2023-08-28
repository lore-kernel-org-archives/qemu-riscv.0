Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E50C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 22:15:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qakV6-00070T-PD; Mon, 28 Aug 2023 18:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakV5-0006qa-G6
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:14:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakV0-0004I8-BK
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:14:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31c71898109so3189469f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 15:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260856; x=1693865656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OR2t1S0ttCGvBFU5E6vcS7ExCprp94yTFLK0sZMvoOs=;
 b=S/ZQcSkVLgX19BJ+tgcVctbK7w2mjfIqpChSOf2Q9B2GI13xVls8DefVwpOXZtkBN6
 UNTxPFK0GZKi8XcC6UB7cV/REOHocM8L25wMvAQVAlejRO1X4GEXvzmwmntDA1Qx2M/e
 0I9TD0wk1JuENiQGX5pDMnykq/oL4/ppbWzAJi0VAr2jVxODyZjVgp1N4w70KtG58x63
 XXHtgSlRwcQ4kl7EqVEG26uENC1BJdt0CarqLF0vAcv+2RbTRCxfSOdT4AJQTXD/6kT4
 qTmQiSMjrca/6mQFI3x/jfZv8rZe9UO7aAqMLyCEriyinKt5jTThWowyD7fydVOV/0NQ
 P//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260856; x=1693865656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OR2t1S0ttCGvBFU5E6vcS7ExCprp94yTFLK0sZMvoOs=;
 b=DgTqVBOSEjiLSAfCWIzml/tqLQKBJKCVCHGoQ5Wk2MImGdDrmitXpbtDyjZd+N73cl
 PFOg9AoYV/v4OUScOzgKcEdaUni+m+DHVU3V7x4qZ5XSEoIu9Dy/EzK+9a55tiYS2Srp
 azuTWRZAb/NuclTiMGBsoGs/8kOW661dsTfQxsLkLM9h13gOdtbSkb4lbqQZjFP5zTG/
 YlblKlUTZCXEPmFinhw2tn7rY1AHD52fpqFxL02kjUs1g9gUEnnFtlJ2ETfrEAqSPDac
 47wiqLbgU8Ac6CtpWunykf2xg+cj307u9Jx3x/zLUTePbwe92KrzQhTX3EpUGJZgM3wY
 sd+A==
X-Gm-Message-State: AOJu0YzvHO7uPp9txjIlOb0VkCPPonbizm0RMiRTIgw+7HvDCyOub+mu
 0A5ggWpyq1GAftrYv7L/8NG6Mw==
X-Google-Smtp-Source: AGHT+IEVm4JmspE62irAxgd9zW4r9QXDwSL+8p3PuMUoqH0cJNJq8bcZPVLx12KHrLa9Z4AJ+Nex7Q==
X-Received: by 2002:a5d:5101:0:b0:317:e515:d623 with SMTP id
 s1-20020a5d5101000000b00317e515d623mr19508673wrt.60.1693260856203; 
 Mon, 28 Aug 2023 15:14:16 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 v18-20020adfedd2000000b0031934b035d2sm11710874wro.52.2023.08.28.15.14.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:14:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/11] target/xtensa: Include missing 'qemu/atomic.h' header
Date: Tue, 29 Aug 2023 00:13:12 +0200
Message-ID: <20230828221314.18435-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Since commit fa92bd4af7 ("target/xtensa: fix access to
the INTERRUPT SR") these files use QEMU atomic API.
Explicit the header inclusion instead of relying on
implicit and indirect inclusion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xtensa/pic_cpu.c        | 1 +
 target/xtensa/exc_helper.c | 1 +
 target/xtensa/op_helper.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/xtensa/pic_cpu.c b/hw/xtensa/pic_cpu.c
index 6c9447565d..8cef88c61b 100644
--- a/hw/xtensa/pic_cpu.c
+++ b/hw/xtensa/pic_cpu.c
@@ -30,6 +30,7 @@
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
+#include "qemu/atomic.h"
 
 void check_interrupts(CPUXtensaState *env)
 {
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 43f6a862de..91354884f7 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -31,6 +31,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
+#include "qemu/atomic.h"
 #include "exec/exec-all.h"
 
 void HELPER(exception)(CPUXtensaState *env, uint32_t excp)
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 03e2c1889a..7bb8cd6726 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -30,6 +30,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "qemu/atomic.h"
 #include "qemu/timer.h"
 
 #ifndef CONFIG_USER_ONLY
-- 
2.41.0


