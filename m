Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99D1C87FCF
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 15:04:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uiwhs-0003BQ-Re; Mon, 04 Aug 2025 11:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKz-0000qi-HW
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:50 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKw-00008S-Mx
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:49 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so1918237f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754314484; x=1754919284; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WtdHwUd8/n4K5YgHaAzZsrPouzhCc7s7XT6kmarPt8=;
 b=mfa2tYz90uVCw3a72qmD8y0oWIMnQPUwJKCT2SyTdF50nhESunjucdnnMaG0+EJf6W
 R+KNGGKy+IrBBNOdgpEsy0vNiTbKuFZ9F1bv9EqL3mtE+j1p2oxmE/oYaFIgHQFULzi7
 ck+pW9rPDI8EHGMckhaXnwPnKJs2l1zzerdiu0Us+4hLeGt9UAMm66PCtftqRbyu7HAf
 DZRJ937LhSuJ7PcqhWOAQBrahwIz9KJgCqUC5YH+idcycvx2M7KPICeP+cGjUacQ1+3R
 y9nYpDLcSE2swMZaL6vcy4c4t6iygbD+n8nsdmk9qHeY0AbmdHf01/pU4x1Ndvf5jwvb
 rRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754314484; x=1754919284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WtdHwUd8/n4K5YgHaAzZsrPouzhCc7s7XT6kmarPt8=;
 b=aYM7RYZXLYHd+4bajrkmN1EJ8H9NNJnmpMyfC4fcyk/Kxe7XR53a+ICdt/f8jq/X4w
 opemX0pq256SlUJJ2I1sg+8VqgOZOMqgqefXHwAYPio3OpgGechO0y0hqfFU6RmdZraC
 m7a/UavXZy9Rp+9svXHyo+eG6dZM8v3X1mEbVnqaJHWHGziPuapWln73eJRDerkcjVku
 l5PevdG5lteVl7i+Uy4yzahKAJ2ODIqELzM6B5VNzS3pRiX4cY5nvfayO+MSUniAbjms
 LgB+FVpdHI3tarXrg9TmkgDDsug7YTv/tmJhsXj9W4QqJn+OqJ9VBTz9WRY+tcgPKTFy
 xXKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXKZN0txcNN2jtwrvzZiKE15DeRs84zcdQWedcOIxgenAt4/YUgDKFqVjHSen8cWQwumbCovgJq9ZN@nongnu.org
X-Gm-Message-State: AOJu0YwgCUkcoycAyNPWBEaz220alz2/2eVQVIB3Y+5TrXRC3JjwWJex
 I63H4jnTEdkT46StHHycOj6HwOA63yJQN1eQrColNeaEjkDDQGsl4wnTpUAUVNzkZM+kYf3R4Tw
 P6AJs
X-Gm-Gg: ASbGncsdcuoK+2NiAQxmRifNMXDGvzT4aCTIs1ozkyGmB7vbc64/jrTLSyT1K1o6x3g
 bKI9ytEYW6wemFiiJKltTO4Zr9U8hlDwqlMZRhF6cJ2mN/szfOssNWovktOluSVyP17n1sYZQLj
 ILdo7P+TBVXOuMqWIyZ8HevZ1flCd2oy2Xdhkp1CAGB1oAeKrZO0ox4taXUw37rlSR01pryYqog
 mav+XYwhoJISh3gt6zXs8kf6lcS9OmhDKB/1whTV3fjX8PYRgAc2Am/ftf1vd2/3sMlG8+w2VR9
 XwkTXDjiwpYKYEZOkLWWIrPWUUhsyZnug1rUxgct02udEIZz0vTmt8LwnIdTA9Ge4rW3KwzkMne
 3gUbp/y8IQIl73ZFUMGrmHnPGGU/71jxwBxaUX7MAZSC6l9KYmgJSKTPxMBFMBaN6tqtlEuYLJR
 DJu+FaHik=
X-Google-Smtp-Source: AGHT+IE7qGoOMREcolZT+b5z8oOJEXZ+ULPFeJUzvhUlbvrwHIlImWuNOVp/7/tR+H+SHpXvM4Bs1w==
X-Received: by 2002:a05:6000:2902:b0:3b7:895c:1562 with SMTP id
 ffacd0b85a97d-3b8d94649f4mr8060629f8f.11.1754314483968; 
 Mon, 04 Aug 2025 06:34:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c47ca5fsm15355970f8f.63.2025.08.04.06.34.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Aug 2025 06:34:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH-for-10.1 v2 07/11] hw/sd/sdcard: Allow using SWITCH_FUNCTION
 in more SPI states
Date: Mon,  4 Aug 2025 15:34:01 +0200
Message-ID: <20250804133406.17456-8-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250804133406.17456-1-philmd@linaro.org>
References: <20250804133406.17456-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

In SPI mode, SWITCH_FUNCTION is valid in all mode
(except the IDLE one).

Fixes: 775616c3ae8 ("Partial SD card SPI mode support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index df2a272c6a2..a9efa158594 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1488,8 +1488,14 @@ static sd_rsp_type_t sd_cmd_SWITCH_FUNCTION(SDState *sd, SDRequest req)
     if (sd->mode != sd_data_transfer_mode) {
         return sd_invalid_mode_for_cmd(sd, req);
     }
-    if (sd->state != sd_transfer_state) {
-        return sd_invalid_state_for_cmd(sd, req);
+    if (sd_is_spi(sd)) {
+        if (sd->state == sd_idle_state) {
+            return sd_invalid_state_for_cmd(sd, req);
+        }
+    } else {
+        if (sd->state != sd_transfer_state) {
+            return sd_invalid_state_for_cmd(sd, req);
+        }
     }
 
     sd_function_switch(sd, req.arg);
-- 
2.49.0


