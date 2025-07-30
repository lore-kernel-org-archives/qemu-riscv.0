Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A36AC87FC9
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 22:11:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhEzW-0000tv-0y; Wed, 30 Jul 2025 18:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwc-0001dp-Uq
 for qemu-riscv@nongnu.org; Wed, 30 Jul 2025 18:06:43 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwX-0002d8-2U
 for qemu-riscv@nongnu.org; Wed, 30 Jul 2025 18:06:42 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-23c8f179e1bso4473445ad.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Jul 2025 15:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913195; x=1754517995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t5MOCh8vZ85TyUX2Kr+LHdMr3zhcFbFlGuu1sgPE5wg=;
 b=RG5emM8YEy7KmmVSCFPt8rxFJW7qiyoVZpmdWCp4Q9FJVEfD1ECJwOm/8En2zwqXv1
 iCfi+cMDWJghZXiqgSLIQZvYwApwFv+tYDICvr9uLhm4RLUqdiR/EgsJ272qMdJQk3Du
 464vJ6nEW/yW1+fe+rkdbRjPsaDRJnbTfmpGllf3tbiNHB7oV+Klpi9WHqh3ngPW6I3j
 NwjO1a8ijbE3dxKEdEAZR6eIwqK9YUqG2KLmVOdg/egiyTtLhLCUI+vaL/tAKTXdHRY7
 n4WZcKzTeluRHCMD0IE9QIrUMDDp8z+as5gcWba/cI32rHMnWsjOrkt6ZflDKwzwmEMp
 Xo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913195; x=1754517995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t5MOCh8vZ85TyUX2Kr+LHdMr3zhcFbFlGuu1sgPE5wg=;
 b=GOuxAPl9Rhr+tCJnH9QudbooC3lcGXunKWtee9+Djmb7D9qA9CSv+aGptmze7ef340
 RD0hGN2S9rh17U33k8vLJ80CDG/xGS7NwIJbOpQkWjOqm70+UnKEFP2qJWOgIh8GfTOm
 1esWNkHaIn56e2IN9zWo3+KQm+YRuUw0PDH27TgrL5xGRbQELxWlDVcmiek+aeWxX3+p
 +ckb6iPITKCDm52e96EgSqDI2Dr5qXC5pPZoXVMy3cQiF+IJdZXYXw7i+pwx0uIKhUf8
 F30METdJlNZxIQE1rsGyItl1NxcU3gytVLsVksvJlkMA/EQRea1vk+vrq1EGggEPYo+Y
 vioQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX7F8XFhTIdAnzdLwHAcuCsYRE7aXpc8x9brLQqirtZNUH12dzoqEEy/nFHlqwIdHJkVQ2Xh0HZNwp@nongnu.org
X-Gm-Message-State: AOJu0Yw8w62Q7bCa9HjYVWMss+XplrPc4TdY+i+6Iaii35zZNU2Cuyf6
 5y1v2KmuzlrSeOb5+GhdC6t+KxDW3xKCGauOF6G9ON0cX4KqCmrjFBez72pfyBtfsA8=
X-Gm-Gg: ASbGncsSU2wLU1iglx+nncaHsOD9jFQzGbaYPER2YBY9DZxqGiWpcrxud4WHnbndqgY
 KDtMBXr5DTL9AY5PnyMdrphv7+bAaXavMRh6Y1b/aN9oH4/Iy2eE7ySkzYmE7AUgVOqhrgTKCm8
 ZUjOIzXJh2GclsyTOJKcKXDSJlVOhw7+Te+cPpMxF/4Lnit6bq5w250MZBls5hVrhUOEGa5oquf
 +KV/uF6vtsjZOdWThRY7QZqJcYy/UaGnKHiabmaBh2LEOWGeIfSI96OrqnYM3q05fe0tXFgyhKV
 AYTEntetQCbqbf3k5zsBWrM9mtTxO4CSJ7OBInbuAl/QLfBjkQnTQU+rYPxcg0bMJsOF0LAx7Fb
 PuAssBeabltRoflz3c/WXeg==
X-Google-Smtp-Source: AGHT+IF1HRNCCD7zRktuNXo7omeQUVfwXTQJyCef5uTGpBAFnihPPCxSFKsuYupnOc+fpQUlejtg0g==
X-Received: by 2002:a17:903:11d0:b0:240:2281:bd0e with SMTP id
 d9443c01a7336-24096a72dacmr70431405ad.2.1753913195279; 
 Wed, 30 Jul 2025 15:06:35 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:34 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 08/10] semihosting/arm-compat-semi: replace target_long with
 int64_t
Date: Wed, 30 Jul 2025 15:06:19 -0700
Message-ID: <20250730220621.1142496-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e3b520631b3..715a22528ab 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -502,7 +502,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ISERROR:
         GET_ARG(0);
-        common_semi_set_ret(cs, (target_long)arg0 < 0);
+        common_semi_set_ret(cs, (int64_t)arg0 < 0);
         break;
 
     case TARGET_SYS_ISTTY:
-- 
2.47.2


