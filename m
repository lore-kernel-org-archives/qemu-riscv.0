Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327E8C10F15
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 11:06:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rzwu3-0002HU-Oz; Thu, 25 Apr 2024 07:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtW-0000Hv-Cu
 for qemu-riscv@nongnu.org; Thu, 25 Apr 2024 07:04:09 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtI-0000IX-SF
 for qemu-riscv@nongnu.org; Thu, 25 Apr 2024 07:03:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so686854f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Apr 2024 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714043017; x=1714647817; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5xgdXCGND9O0mxiiZCYBTt0WDd2teRijPgGqLuPJXs=;
 b=g5EW0dllJYe6kN4eFHbXVWmL4KhI3jy6/Ii3SibI0uZLUDhHAzNufOdir+OZbTp/O3
 zp0O42G9+3pNG6QU0r7I+9QwJughycPnPoRIDjP8vnkZC4vQnTTkI9Bq/wdDH1AdzR/M
 YzEjNNxt7hl422i1Xk9WnxmJLzBZsyzrJ6UrHV5SnweI1iu6aEEzA/ewGOgMtTFnakBf
 4zIuQvHU4gt6X39RNNUgJFnQG0DLjnE13Hoc3Wov9LUTPOcuOn8RB4FgEKFChi+48xDi
 103ZXVpsKhkaMK1tevcVM2pxItvHMvrCs3HQiMrDs2FX8iWYT9YeB4fEHB7H5f/Qo5Ax
 UGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714043017; x=1714647817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5xgdXCGND9O0mxiiZCYBTt0WDd2teRijPgGqLuPJXs=;
 b=XwI+Y1bSgjfev1ayxr+fTlU5pxnJYqKimgmL1M4pxpJWvSZA0cBq4cUyZYIj/e11Ah
 N1tQKMsRtKx/JMmlY9MOcHd4Tnt3K3qZo66nyg08+ZPsCKUs3BhDiunW3MqeWQyI3GSm
 gUjlM0SvYUyqZqEN7UOJyqRkSHaFjWxUQTBjY1kVlru3v5psj6zwFxC4XoawgXs1lFut
 qt+a1x9wPoCyRinsz0BQpy7/Qw2WfGKL3f/Q5UfDJ6bV/1U94/rg4MRl+yKotPH1Mn0S
 fJ6Ia0WcIRGS6pS1LM7n1uXApaPEsaZB8BbHguOyDaaEqqZiofyEGGo355O8yThqazru
 p8aA==
X-Gm-Message-State: AOJu0YwJSNXOn423BJsLnc2HSFtarmRyTH+mAKaUVdln+h7VXj8LE1ts
 /7DVzoh1RaN/cURsPF4JXCxiaWUe9ilCXsvIbbgGUXBPiMdCf1f91HtRULG+8PE=
X-Google-Smtp-Source: AGHT+IGo4/4ds+aqwK0mOG61Mddx3imkACop4W8f2nNt+x5+kxgtBIL46K0+6irigKjFcRzE/192Mw==
X-Received: by 2002:adf:f146:0:b0:343:b686:89a0 with SMTP id
 y6-20020adff146000000b00343b68689a0mr3968839wro.13.1714043016769; 
 Thu, 25 Apr 2024 04:03:36 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d54cd000000b0034335e47102sm19464539wrv.113.2024.04.25.04.03.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:03:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>
Subject: [PULL 17/22] hw/misc : Correct 5 spaces indents in stm32l4x5_exti
Date: Thu, 25 Apr 2024 13:01:50 +0200
Message-ID: <20240425110157.20328-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

From: Inès Varhol <ines.varhol@telecom-paris.fr>

Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240421141455.116548-1-ines.varhol@telecom-paris.fr>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/stm32l4x5_exti.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/misc/stm32l4x5_exti.c b/hw/misc/stm32l4x5_exti.c
index 9fd859160d..5c55ee4268 100644
--- a/hw/misc/stm32l4x5_exti.c
+++ b/hw/misc/stm32l4x5_exti.c
@@ -59,22 +59,22 @@ static const uint32_t exti_romask[EXTI_NUM_REGISTER] = {
 
 static unsigned regbank_index_by_irq(unsigned irq)
 {
-     return irq >= EXTI_MAX_IRQ_PER_BANK ? 1 : 0;
+    return irq >= EXTI_MAX_IRQ_PER_BANK ? 1 : 0;
 }
 
 static unsigned regbank_index_by_addr(hwaddr addr)
 {
-     return addr >= EXTI_IMR2 ? 1 : 0;
+    return addr >= EXTI_IMR2 ? 1 : 0;
 }
 
 static unsigned valid_mask(unsigned bank)
 {
-     return MAKE_64BIT_MASK(0, irqs_per_bank[bank]);
+    return MAKE_64BIT_MASK(0, irqs_per_bank[bank]);
 }
 
 static unsigned configurable_mask(unsigned bank)
 {
-     return valid_mask(bank) & ~exti_romask[bank];
+    return valid_mask(bank) & ~exti_romask[bank];
 }
 
 static void stm32l4x5_exti_reset_hold(Object *obj)
-- 
2.41.0


