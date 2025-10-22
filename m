Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59640CCD1BB
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 15:10:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBaTI-0002MH-2T; Wed, 22 Oct 2025 11:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBaT6-0001gM-3e
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 11:09:42 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBaT1-0001EB-K3
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 11:09:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso6569860f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 08:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761145773; x=1761750573; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3ngZPbaDwZJ3E3qgfPsLGR0H4y0FqCGiSlAmIJaKZo=;
 b=TSdmTSN23yD8jGXvzAbey+dWHWM8FxvrfmN1ImrH1NtZ8soN5Eqga/kO/A1xR6qHxh
 +8bH19ilt8w/tPjnk99wB3ttbpjTJt+CHAwf27OaRYRAznCJyDjA8Zlp4ikzb2C8A/bQ
 /jvTXHOcAp1tW24yoQDaFoxjxDTnSQ2vBdKe8GHQShx/a/7YlnGPrKFy9BFvHUUVEdtZ
 2jYF+sq1TkXmFReziIo8se95iuJFVnNzR0gdzVdiBQk1JpkCNFdyUZxRmOFHM8mXIFKx
 4aDAmb+Hlcqiq785T0zu08HByp6691GVVyvcZccPKhzzrdtFuQZsGaozX3ZlV+w+rEAn
 qanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761145773; x=1761750573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3ngZPbaDwZJ3E3qgfPsLGR0H4y0FqCGiSlAmIJaKZo=;
 b=O7Odbza8wnGM2UuGM868qWxHtVE5kpuXbSSdSehAHzfuOmPOX4mPaPH7hnSpTq4ipT
 KBMJWyCOF61bzQWfSu+ZRGgBA6r37EaKZUBOnFlGI4rQ3Tm5g1Lzx82u83UN9Uana2D1
 uEggXvDW9QVddso2geLTW/4vFgTIbPXLuVOR945Sa0y8lNnPMLUUYH1NlA6fl8tnAnyi
 vgcC5D6XGbguzcvFah6EAz5ME9iSCC64wObwhX9Xk1vGhCxevJutwQm2hXsiZIVwgROi
 OZbpnazytn556fy0Ll6mZgHU5yiFEof2aiK8nYgSk71njqA7ULpmF8rBqLUuZfG00tRS
 u89Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsnyFFlk3u3sglLZdalEu8HkfhEEQBHIjna7E7rdEzRwUz0AFPr/+M48W5YxdcwkOpagGs3ButHtvf@nongnu.org
X-Gm-Message-State: AOJu0YxGgilAnpVV30tLrdxh4VHH3nJVdjQRn+xdVlioL274m/yKlKUM
 xoztgpdIzLA7goR+lhCb/Cm56RwyHOPn8JOXs3InNCNUi+TxQu+vXpTJbKgQe6Prbas=
X-Gm-Gg: ASbGncsOw+jqxc1keRvmkveuSolEcqDz88RXJPIQUMQnPvsSI3z35iq8uUIYiHQr5my
 lvlMujZmwbX6KO9brTDkdmw48UpRadNi7NmBJn1aTtd41VHgvm8W03p8DIFmoc/t+Xxz6Arq2DZ
 F0R23Nxl2nkmqCpsYcT1zvH7atfIkgpJ2t2shAXZzkHc1+k1CE6sCKFjgg+Xoc0Himphld83eim
 hKgpIW26h5bRLf8yv8BpfsAC5jv6vQuXmXpmC0tmnLjDDblwJe4IolE7oudnCYB7mAjQvxo5/cV
 9vQ2FiJkPbrzge57LT8hjVGW6jCAtndf/ImN3EHoYrzlhJzRarqMG0f04GBdunrE1Q+YFVtzdiR
 sYIB6g6/LOZD5PBMrbinJS9gLfW73B1nn8hoAvZY9dUbf7zyt6jF4JlXUwaeyLqa8HvTedEDtFQ
 pIE7M/RmABIrYR03rztejXMGlz3kx5QoyzwoUEz3gA0PB2Ty504A==
X-Google-Smtp-Source: AGHT+IEsl/9G9/Zuob4PcW4PSudJtYR4GBXWNfJrFgGghbd5T6mHaj216FQRdNkAzsYiEBWskD5SeA==
X-Received: by 2002:a05:6000:1a8d:b0:428:3be9:b465 with SMTP id
 ffacd0b85a97d-4283be9b5bbmr11554632f8f.51.1761145772667; 
 Wed, 22 Oct 2025 08:09:32 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c34sm25325512f8f.17.2025.10.22.08.09.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Oct 2025 08:09:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 9/9] hw/char: Simplify when qemu_chr_fe_write() could not
 write
Date: Wed, 22 Oct 2025 17:07:43 +0200
Message-ID: <20251022150743.78183-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022150743.78183-1-philmd@linaro.org>
References: <20251022150743.78183-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

If no chars were written, avoid to access the FIFO.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/cadence_uart.c | 2 +-
 hw/char/ibex_uart.c    | 2 +-
 hw/char/sifive_uart.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 0dfa356b6d0..8908ebbe34a 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -316,7 +316,7 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
 
     ret = qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_count);
 
-    if (ret >= 0) {
+    if (ret > 0) {
         s->tx_count -= ret;
         memmove(s->tx_fifo, s->tx_fifo + ret, s->tx_count);
     }
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index d6f0d18c777..b7843c7a741 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -161,7 +161,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCondition cond,
 
     ret = qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_level);
 
-    if (ret >= 0) {
+    if (ret > 0) {
         s->tx_level -= ret;
         memmove(s->tx_fifo, s->tx_fifo + ret, s->tx_level);
     }
diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index e7357d585a1..e5b381425a9 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -83,7 +83,7 @@ static gboolean sifive_uart_xmit(void *do_not_use, GIOCondition cond,
                                    fifo8_num_used(&s->tx_fifo), &numptr);
     ret = qemu_chr_fe_write(&s->chr, characters, numptr);
 
-    if (ret >= 0) {
+    if (ret > 0) {
         /* We wrote the data, actually pop the fifo */
         fifo8_pop_bufptr(&s->tx_fifo, ret, NULL);
     }
-- 
2.51.0


