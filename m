Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A241CCD1AB
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 14:50:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBaAn-0005TR-Db; Wed, 22 Oct 2025 10:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBaAc-000539-Bn
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 10:50:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBaAa-0007eJ-0X
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 10:50:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47495477241so19257075e9.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 07:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761144629; x=1761749429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3ngZPbaDwZJ3E3qgfPsLGR0H4y0FqCGiSlAmIJaKZo=;
 b=uwl8nTJHg/Epkr6OCRIP2CIG8z2RWKhnoyQUN+I/48ujSNUJtTOfKve6/7PtGkcEBF
 JqjQAZXF4Kw2C1vCU0/jWOw13XNLo6K2IaAX4BjKVDcDeJtgwYABeDJsxlo/peqRSKsB
 ZqhsnGZsMBO75mHrf58hE/p+J459ybUcv+DX8rWKUHB32qq74p45ZoTjEm9R32vMwsRT
 LG5Oh8fkksONPS9A97nFmI7wO/MKj2kfDHYaETBQcagqzxJMsJTE+AbEOoiZegCptKuz
 F0dsacKkIfktfys0VSiVcKJXgxpbwVvGANCwC1wjg8TAnkR7YR2irXVhNSKkRxsjMeOZ
 +gXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761144629; x=1761749429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3ngZPbaDwZJ3E3qgfPsLGR0H4y0FqCGiSlAmIJaKZo=;
 b=gmmOKZCGIEzj3ui9qN/RIyZfpDKJm/sGWBlHBZmtBhjvbwbDyHurM4VBAb/kJ7mowX
 he66K3DfPS8qTFhgBH1w9OkaenDVqZC8T+zaliSIF4StTHCoY1CsKIXjXfsW2lncbUiN
 ixLL+5OcYQhEZJlkGzPK7Br2lbpBR4nSv8YQID1Tm54u2DIq7DeH075KT12I/znO36HB
 JvGoUlUe8YwlWlSfc1WcCCpNX61t/wyUjsk22m0R/rh+8WVwuW+35l7reUErpFgm//5f
 RMSc0YfJ1r4tEdArUGdf5T4Z0zFx6hzHSS5E13kqkWWQ7ahJd2Wx7HppXW+7xIYF4whw
 SfFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC6Tqk39Qn29BdwYnF6dFptYp9L69WhhJm76dhdGdO5OSOfLkt1RE/IEGqrMUkKkzdKHEjp0Tvquk4@nongnu.org
X-Gm-Message-State: AOJu0Yzfhb5WS16xKJ/H5UBjWS/Ykqrkff3WSXy8uVdrjm8wEwjXyUeE
 xv68f1rNjZrKEZWMhfT4n0t5esWnJ9mi/v1V9tMP2zQWFK/VGnr7JkoZbnJVFG3QT08=
X-Gm-Gg: ASbGncs4aqN59GmIAnWvU61RJVB9BDtDKX16bu/OSJlPAwKJNHq8B9kUhZsFcwSTG8i
 7b52NW8M/sueYyVPbfS9ILO8Yy2GxSMz8D+rg060zL6fYtSm5RG1BCAF+E+sfJsbgFe4sQwFjQ/
 QknmY4EMWdkNuTzeoqXt2kfPTJTjXlW8ooqb7sYcjev6NZpDwPWXQgmc7K4RcrOY/6Sqn6Zbd3D
 uhgt1C/F+KnBWan2IO0LwSHmcVaVLyVxv1KhlJwj6PhHCNoPCDTAob238ZTwAJWHJ1Je70Jks9K
 j3p8jf92Zs5yaaCEc+QP6pLOnRzQMZWGlsQn6neeQr7mdckID1kuY1ziSqIrI0s+3l1WT2cPZDZ
 LFugC4nCSDuTeyZwjOuC+z4atKIkbRCx2IEyX7giTnVDM2g+pUVpkOstBQGpQRFBk5mLZkE6Cs5
 FBLDobVT8sZs8X1OTnD+unj+hiOE2DbM/I/TVgkuph3OdiGjeblRtMzbkuWI9j
X-Google-Smtp-Source: AGHT+IHtYL2UYZnW2Z2tb6CcX9id3CCNeh+XNNnh/f0uVVwIc1E/B1zC05C+HEU3RWM/cM2BEnrGAw==
X-Received: by 2002:a05:600c:1907:b0:46e:206a:78cc with SMTP id
 5b1f17b1804b1-4711791c3b0mr179311735e9.28.1761144629314; 
 Wed, 22 Oct 2025 07:50:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c41ca845sm48831605e9.0.2025.10.22.07.50.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Oct 2025 07:50:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 7/7] hw/char: Simplify when qemu_chr_fe_write() could not write
Date: Wed, 22 Oct 2025 16:49:02 +0200
Message-ID: <20251022144903.74612-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022144903.74612-1-philmd@linaro.org>
References: <20251022144903.74612-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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


