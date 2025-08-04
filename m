Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F59C87FCF
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 19:22:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj0kB-0002tT-SB; Mon, 04 Aug 2025 15:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06Y-0001EY-9B
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:17 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06R-0001At-TN
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 14:40:13 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-76be8e4b59aso2178414b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754332806; x=1754937606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bB7IRnB2X72HyfFQdO8pk3Ty2DGMB4Kj1UdkMvzsUlw=;
 b=q4leUAtVs4wFdbHZDmDHGyTpxED5lmYCXwUWji3kUuqojVManVqTHwjxaM05zR4Kt+
 wWtrk2m6Q94CuGGfOyPwimI+gcHt6VFXxx6QTJy5cm8fDkTo3qGH8YUqDKYwF/6keraG
 S7D6pZwjBJeIP4KrdR1MxqdYIrUW9tLp83BowV/6rYoTzhVpbTvl3i3vTRnDyFfp/ScM
 7vDRvYs73gWdbwpDPECzVuA3+I+1C0lJMjM9Sxxx1g1YJYOWEh0/ZVCvVWCUuEYr9rsy
 KnW/C0YkfKSDtz3qRx9Jzt650V+kXb6w5L9/y9bFrTvakAY7J5l0gTUCNL35Xf3qr2NH
 O9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754332806; x=1754937606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bB7IRnB2X72HyfFQdO8pk3Ty2DGMB4Kj1UdkMvzsUlw=;
 b=ous9FUBAp+BDd1DiIc4mNwFr6fSDH6vZGRhusn1dMJp7SifqQRXRhGtnSgrCvcGx/Y
 PW2zqDPTsuuY1vGKk8ohUXvV0oFl5JXBj8PFQV3lz7+6x2eu79KgaboxokXomiD8EkdK
 BPWdg19ScjgNXLph4UhJQBBdx1jwvzQT1X71Zzu1RbI1UD3xkEgw/Ufz2bXi9hJua7qS
 DEtIt09K0YQ3LUnWpk8v5PrYPbn4oVgk6syBg1sA/CJzwkfXjOb4JxG2ooeRKfZU6r/d
 BIuaz2OurPZwOPHHBNFntVqIsi3zTSKvzDeTqX7UBOyAE0sA1mcZ17EMP7f/5UlgjUOz
 pPkA==
X-Gm-Message-State: AOJu0YxYaRSC7A+Q/lyWJm71ctlCBRJxonMR4lgimLvShp9B+903QTpV
 9+XxSnNlWNB1ne1H/2UCVlKIYJOaRljgMN+71nu5hq4vWswe8zKRXKvTFDqw+q0AEz0=
X-Gm-Gg: ASbGncuKEj7D9w0gK7Cq3q/uroPUemktEV4Nj74Tt1d5A4/9DHO+ma+hALspFPsBRvh
 5TVZLTyrAcn9LWNb6zgSJc6YNa6MKAG98jhnesQFD0rx9y3LqadAtXnEgJoxd6wnDtm4fToRElW
 hrgbE2o2DVju3MPLjqRgR7VHtM/dOfyvbAQOIBZAKTcnfF0AxpdJGEUoM52vdSDRBsgmPNlQ7Kx
 GoPJZTEOtbKujCG/4s6gIrOgXgIkJ2c4NkjsxCovWI/zzU4x0vM04ScWZ/ESZxD3NBdETkpyddj
 8eJZzO1X7Dc1y3OIXQaLk6mNgg3h11ZAx8Fs/N5tamlrdVLdzEJ5jG6ZtJvkI3FWaFxVYBsnb6F
 eWEiGd0A4bbPr9mClalFR3g==
X-Google-Smtp-Source: AGHT+IEYkGZM3k0ctQRWy6R3Zit6AC8O84fNQgxm3FWYumeodaFHzn1yK2QVOBU5TXfjz31HO9n39g==
X-Received: by 2002:a05:6a00:2d11:b0:76c:503:180d with SMTP id
 d2e1a72fcca58-76c05031c1fmr7477209b3a.8.1754332806414; 
 Mon, 04 Aug 2025 11:40:06 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd78875cesm9940171b3a.15.2025.08.04.11.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 11:40:06 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 10/12] semihosting/arm-compat-semi: eradicate target_long
Date: Mon,  4 Aug 2025 11:39:48 -0700
Message-ID: <20250804183950.3147154-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x430.google.com
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

We use int64_t or int32_t depending on ret size.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index f593239cc9a..55d7bf29ad6 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -501,10 +501,13 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_ISERROR:
+    {
         GET_ARG(0);
-        common_semi_set_ret(cs, (target_long)arg0 < 0);
+        bool ret = is_64bit_semihosting(env) ?
+                   (int64_t)arg0 < 0 : (int32_t)arg0 < 0;
+        common_semi_set_ret(cs, ret);
         break;
-
+    }
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
         semihost_sys_isatty(cs, common_semi_istty_cb, arg0);
-- 
2.47.2


