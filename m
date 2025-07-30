Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ACDC87FCB
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 22:11:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhEzR-0000f3-Bv; Wed, 30 Jul 2025 18:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwc-0001dt-VM
 for qemu-riscv@nongnu.org; Wed, 30 Jul 2025 18:06:43 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwX-0002dk-Vl
 for qemu-riscv@nongnu.org; Wed, 30 Jul 2025 18:06:42 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2406fe901fcso3923965ad.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Jul 2025 15:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913196; x=1754517996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkgXPOtfTDdRhmtR7+6K9lh3sJBO3AG78sxoSa7xDFE=;
 b=Sia224/M9UDwNG/Gs8RYRY5ZdRjtRM/6CvvC5gTgImuvS+nGiPpvriWBk49jgMRPaa
 eDHNyfNTh3Vyr3UdbQ6hJxjWbl63OnmkGXw1QUjqUn9DScOTJc63jy9yDWZ5o1zmVkIw
 2E3pR6Ibz2zCLeRmqpVgVbfJ66Akzb/LWMR1yk8WtuOHQC/C9S1hK6mwxVlwmDAMDfhA
 SOup/o9ac+Ru5Cjb5AzpaIAZtOflHKeCvtvMtd+uO1SA6hTCixwCFgjPcrd0UWCbfHM8
 KA8mMCivXEUGEYityQ+O6bE2APwmNPeQ4/n60INsMLN8AEs/Y3XrLk5lOgSqNV2GRn1a
 ueNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913196; x=1754517996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HkgXPOtfTDdRhmtR7+6K9lh3sJBO3AG78sxoSa7xDFE=;
 b=SLJMPNWDgRwy1NqULNP3uizcgXBMCCXTZIojQp92H5p+MZo64HolddgXL+xs4w/6wt
 AmO0QmojG2T94IIuCOieEoQqk7Ht5X7Ht/QPf0fLBCZNut65rL0kc3UR3t/jzStOk1tZ
 arAHc6OtFJXMuJtrRie2/byzd4vOQMKKugUwd2SBPTqwt13Ddh9G1TbpFiDUhM9C//jO
 hhRxdO61dU4MfCT8PKKtTMOY70oE8iz6FWpcElab+KLIDTur8MhuYW8XaoQkrRKot0bz
 qTnTOHM3w0U4iu1UwmqKFgWw9a9Juac9W8FHa5LYemf5RJ/p16nq+JaYYqw9Arbi4QrJ
 hLXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyL8YSlZDApCU4jgAB/A0ZteONlo0spfZW1jBlUqP/rEGXYB1xp4OlqwnP2qiowFOHLQ4/w2iodpMY@nongnu.org
X-Gm-Message-State: AOJu0YxZtHjutLONXp7MRX+syjk77SoEIJLE6yQvrO2CWjXaVYM9vt8/
 F6gHS4pX0c/LS3zFCb1LW8gr69BV9ySdciHlLNUYL6heN3OHbJHU9oIk8wa69N60B4o=
X-Gm-Gg: ASbGncvQkwfV3MQt6WA27uGqbFkOPyHs2O8HfQwMYLNNhMU6VfpfoxahuY3Q3fe+Iw0
 wP9ns29A1wSm8fWIRCdaZDOtFseUKTlQjdiLQtc8jvo7TW6sKNyXkaw4rH8OIdmqayvleDDaLLy
 MuWzV1a+G3hOrEmFZXnFwlA4V95k3JpsDc7tArj0xCsZK82TTqkYb+77lE6A8opQahQBmPXSBgk
 +F2f+bmfk5raFeeAf44FuCox+6Uebv45Eg5mHi3QkZEtalQrY3ZIvsmfAFb6t7h3WX+ZQELBwhz
 NLBw22oOgiVDsi11mEOGGRb7YXa74Cs3zFrBQdgAI3ib/Z4mHLL1MntZeObK1zEwT0Pw+ho4nyA
 bK9kn/tGCDKLr5f0hkrbHng==
X-Google-Smtp-Source: AGHT+IEwidS7gyMXA5LeWThiCer8JwrvnZNz44DvSfCO/Ty70yonQ3n3aS69EaIJU+bGs8fnXBZJIQ==
X-Received: by 2002:a17:902:e54a:b0:240:3c0e:e8c3 with SMTP id
 d9443c01a7336-24096b587b5mr69293715ad.51.1753913196205; 
 Wed, 30 Jul 2025 15:06:36 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:35 -0700 (PDT)
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
Subject: [PATCH 09/10] semihosting/arm-compat-semi: remove dependency on cpu.h
Date: Wed, 30 Jul 2025 15:06:20 -0700
Message-ID: <20250730220621.1142496-10-pierrick.bouvier@linaro.org>
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 715a22528ab..703db038a4e 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -34,7 +34,6 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
-#include "cpu.h"
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
-- 
2.47.2


