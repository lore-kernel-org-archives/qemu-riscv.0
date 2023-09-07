Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873F6EB8FB0
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 11:28:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeDAI-0004NF-O9; Thu, 07 Sep 2023 07:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qeDA8-0004IP-NK
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:27:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qeDA0-00064N-F2
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:27:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31f737b8b69so317147f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 04:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1694086015; x=1694690815; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Onk5iX5pAqOQQ8Z64rzCsuwWRpswOiPiPW0vWDB6iYs=;
 b=aEdnT2mucqGZPkpxkqcNH/diU7wS3Ykg3yvMzrPWYb839Ws3jxlxQDtlP7htzFaBh9
 RzaNZAj9SyJozG1SZia5fu7XhpGFow41Twz0jPLK/mkUT9y6tZOMC+5m0C6Gt04UBaq5
 mMDwkzeWASEoT2dalgP05AcC8RhzI0wUJhb/lQyds95yB8ysSOyOno9+5i5h4rHjPck3
 7+7ibOnAokpn4QgKfCPSDEfGlyPJvkJZJ/KTlzxL2j0927me+UdkexaeDC3X+HtU2HOR
 K/4o3vr79GyIIhsM9g4kMS5He7Apq6PiMK98oh1gcWk0aeWorU3CsHeNfwTy8p5fc3Rk
 S6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694086015; x=1694690815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Onk5iX5pAqOQQ8Z64rzCsuwWRpswOiPiPW0vWDB6iYs=;
 b=FSrlah5EMNQqSDRkdrTEcz6wXXKp0H01akmO6aEPqzdp6Kzs0yu9B3Ob+E7QjZ1udF
 W8gkLY3h1Xeb+5aFndgAkQhNP2A5CTaANr3Oq8JS193vDXkQjlQICJUEbTz4skblB39c
 rIM80pmL/lU9NjgAF31A+U9YUPkoJl+nRxPQBg8eWrZV7q0gGj/Swb1yCceSS1cWRhjH
 2s5nxzXC533aniVgaHUif0p7jbnpfUyAwfdN0d2KrsteqyPrsh7bMZ+IzsAXm2AUtZBX
 R5Xzucs8GwQWWrbIZHUTVad5VIkwp10bzX0vXzmD1WK3Uz+S8i5kf9Mt5AZ4xqwGGyOh
 cZ+g==
X-Gm-Message-State: AOJu0Yy6ndM6+KzM53/yA3Z5E+Jqo4y5NOKYzv05+kHz6av6FcCdLHcL
 jWcA5eCqE/ztXbLi/OBhRZJuWujzrhMrbjmBVoY=
X-Google-Smtp-Source: AGHT+IHxHbDj6g0qxNfIf6qtXstbjqXuscneLTUuoI6CckEdLjo1l/WzKqygOYx2T+mFTDvjgaMYgQ==
X-Received: by 2002:a5d:4442:0:b0:319:7b6f:4a5d with SMTP id
 x2-20020a5d4442000000b003197b6f4a5dmr4857309wrr.52.1694086015012; 
 Thu, 07 Sep 2023 04:26:55 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:c2c3:52c5:8306:a161])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfe6c3000000b00317909f9985sm22998755wrm.113.2023.09.07.04.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 04:26:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v3 4/5] hw/char: riscv_htif: replace exit calls with proper
 shutdown
Date: Thu,  7 Sep 2023 13:26:39 +0200
Message-Id: <20230907112640.292104-5-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230907112640.292104-1-chigot@adacore.com>
References: <20230907112640.292104-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x433.google.com
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

This replaces the exit calls by shutdown requests, ensuring a proper
cleanup of Qemu. Otherwise, some connections like gdb could be broken
before its final packet ("Wxx") is being sent. This part, being done
inside qemu_cleanup function, can be reached only when the main loop
exits after a shutdown request.

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 hw/char/riscv_htif.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 37d3ccc76b..7e9b6fcc98 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -31,6 +31,7 @@
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
 #include "sysemu/dma.h"
+#include "sysemu/runstate.h"
 
 #define RISCV_DEBUG_HTIF 0
 #define HTIF_DEBUG(fmt, ...)                                                   \
@@ -205,7 +206,9 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
                     g_free(sig_data);
                 }
 
-                exit(exit_code);
+                qemu_system_shutdown_request_with_code(
+                    SHUTDOWN_CAUSE_GUEST_SHUTDOWN, exit_code);
+                return;
             } else {
                 uint64_t syscall[8];
                 cpu_physical_memory_read(payload, syscall, sizeof(syscall));
-- 
2.25.1


