Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4290CCFA1A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 13:51:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vJBEH-0007Gg-6z; Wed, 12 Nov 2025 08:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJB7b-0004Ia-On
 for qemu-riscv@nongnu.org; Wed, 12 Nov 2025 08:42:53 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJB7a-0001PR-4y
 for qemu-riscv@nongnu.org; Wed, 12 Nov 2025 08:42:51 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b3669ca3dso443755f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Nov 2025 05:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762954969; x=1763559769; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+FKtjjNLglLvZKO2jnLzMl6gZsHlOg0FzPTza935NrQ=;
 b=Mhf4m2aqs3yszqewGtCnGGJ0V2BJl3o80Zp+X1JPYhkGQhy6krI5wJlfKMfEDQn28y
 ibrfCm4/RWarUjy3RkIRqE7dGrGUKUrH5RniAav6RQLu0Dc4qEPdvnof2mDQodtuyLn3
 bu36gIX1eZgbq2dMSBCeAofxxMwQYnJSjNXAemPCddgxrSTQHeuLEDsPEw3PEW0VQIA4
 AyGk4IglBy3OUZjnWIIk56xkILhdYQapJuJDth3mTEpkZyy9nPdgKl2f9OM8wcJaAdFl
 9HwN45p3B+2DMiQibvWSaKU0xzsbHy1JhtrIGFgL377B0M3oNmnwirIlu73otq20n3fZ
 ys9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762954969; x=1763559769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+FKtjjNLglLvZKO2jnLzMl6gZsHlOg0FzPTza935NrQ=;
 b=TKQrGUVuHlS6KEYlv7dAcRe0p6DrhC9oNYhgkNXkYrBX2HeGrh2673zeR3Gtec09ow
 a8hJheTQ9rMV9gS0dBDhQqwrGmvBnkf58qObXI6ajuSAKVIixRSWITqHiNwLnnHm7aGy
 rFQyBwV/PX9aGQKmzio1MHo4fjcJIjPSi7cbqi+/ljOsAi3jxrxdzUaFcWzULLg8Nun5
 iwmbV0CKQRBDcbBOWbpHzOvqPycLZEtOKQLOwrfquCycsZuOkh2vlVhyH3Mc01jBx9o9
 k09Ghmde2P7InnoeIoKzcxSBPsuXS1VeEjnR2I74kM0YmbD3s/OeZZqaxp0Mh/wNACsT
 MCxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL0ejVSC7WRE/RhWogEEhnTUHp6RQ9E6Zo2sQ33EksKJuQq7CHIZ9GsAV4JS9V3lWFHlmptEpLlqMX@nongnu.org
X-Gm-Message-State: AOJu0YzmncysCRUhVxOQdF1EWA7DxwCxOgbbExu6B7zNcT81Ufp7Z/kW
 g2shsqXwBC4ONhZ1Oe+W+6vp4WilC60oOrxFXfR1wx6waL2OvmBZ9GGdUYnhAkjwByw=
X-Gm-Gg: ASbGncuj3PIEQppMMTUKMYh/gsQU0E2Yu4uM1lkTAiNs5CT6SevPNHXCvkkNSN8L98k
 05tHFzdEvYuaV6FRkxifRoze1ybb3wa1/+7cCWR27BXuWGtXu7HNhY1b9vgd4zYv/VgwK/LR7JR
 k8DNNIwqhljczuElC9eR4KGv6O6lSM1U1OPirLJ5JhCCgC4imr+yhu2x1EcPiCeWc9GzETKObnJ
 w6VPlzab7mNg98Gci9OGjsGz8Ixm2gSbF5uIm1MrZdv/AJuTZiR8UdgGy/0RvDy2lAIDh12wEkJ
 Ki8X6862VNAlK1lJs+ImF9sxtbegoW2m9upJi3s5hlVz7g3UWJe0HvM4Cp8RO74/G8btF/Yuudl
 svFNfRMIkDntZhURnKF1+AOxK7R3B+bMnQmMTeUz6QqhlyCY/od4SM2ssCIe8khLv12ctpr/Aeq
 HETR307b8Mp783XLwAAF3XMzvOvin73gTZBAd3q21gTD3VfG8UMIb7Foo=
X-Google-Smtp-Source: AGHT+IE6U1v+SxSpbcd7fRn/IKD99tBQOXOF7AIL563l2AwmeycAM8BBAUsouxCh8B0yHer2RLgpKA==
X-Received: by 2002:a05:6000:2f82:b0:42b:2fc8:186 with SMTP id
 ffacd0b85a97d-42b4bdb7e9dmr2826173f8f.46.1762954968588; 
 Wed, 12 Nov 2025 05:42:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b2e052f32sm27479368f8f.17.2025.11.12.05.42.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Nov 2025 05:42:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 09/10] hw/char: Simplify when qemu_chr_fe_write() could not
 write
Date: Wed, 12 Nov 2025 14:41:42 +0100
Message-ID: <20251112134143.27194-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112134143.27194-1-philmd@linaro.org>
References: <20251112134143.27194-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

If no chars were written, avoid to access the FIFO.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


