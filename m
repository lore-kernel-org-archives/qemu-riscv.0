Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E98CCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 13:49:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7DPz-0002ev-Um; Fri, 10 Oct 2025 09:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPb-0002Rx-0F
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:43:59 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOq-00084N-69
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:43:58 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46f53f88e0bso12722345e9.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 06:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103782; x=1760708582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TwAzvO9gvcfrUDpFLGxwbVJ7FPHxQaLieV6nfbJhlno=;
 b=q4MWCMfQNBPXg3A6nbpj0bJXV1rOdBextWwOtk0+a2sAw6O5N0YZPIkI8vtsRF1PN7
 nAShrmlT2CV7qEFDgU35JQXWLTjqmSfDxz+g7cy8AUcZCbSYKYXaxRD1GCk80Gu2d6VG
 v8oxDY+92mWisUZdyb6xj/GHdMpbufw/xON/FedHC543e+FYRpcM8wdSISDXpu8gvZdi
 NvLV786qi4xZiduSjIRD4IhMiE09bEkgKG7tfD+D3raMxGUfa9bHIEDMKolRIOIaqj1T
 eHxofA0UGtZYFoK6k2/NPy2hd2bttkB8+B0YeqX3+1+4KLaIRdTQn/rZdyJ9ySiMGOEk
 hkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103782; x=1760708582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TwAzvO9gvcfrUDpFLGxwbVJ7FPHxQaLieV6nfbJhlno=;
 b=ZgViA/65C7Je81SDSpeniaqUoGWY1jrRdrhZzUPx+JiLvoQ7OOnWQTzw330tTYBRtI
 lAmmWiFay1XKT4b8nE1Gt9jvE6DmLnkAa4Ckqt60dtKwrc2fRaFfGwhqcsvWbakhmX85
 HNRWZgv6c0cqLsexVE7cdH2q74Xwg75a7WEjQ1WY4KOryj2vlbCTzaxXX/YadUbvBTJ2
 9FyHg63Z1QTO4RrqK3iyTFE6mrUzhEsoy4shYqTdivW6tnuiM/1ZSPro9KTa9W/xN0Ww
 HJa/rFaz0B9zWICS72F4shTZ5YbAj/MJqon9ySrmmXZJ3Pv6jFyHOC+bGumJMvw61P/G
 ISuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ8Z2KGAwrHVvguuY8jq4R9LMN/8f6BKWjbIdKDE9ZDZxD4QouVzz8AqQhiBv4KdnuIEPJey7/E+5T@nongnu.org
X-Gm-Message-State: AOJu0YwTd8YOgKS5GsM97efd3/JsHnY4SX2zBJ41mCe3q+2U8JS+Vkis
 yNM1q3Fiowk2y2dP/E7ar2b69JR5yAT5iAMDFVmUAQh9wLX38a0UR/5DMijsEDPL0Zw=
X-Gm-Gg: ASbGncvRSgtF9qktFnuD71Y5YWMsCF1XnAryfK6Fl2Y4KmgjmUNFwb21zVCgsyDItK6
 VtJj2GxSOeqRqsCU3dRO8BnnWC71qZRhS2tyfQ8/NyWp963EOjP8vmTbLFDWiazK0nDQk+tQ67k
 Fg9XZxFgzqV/uL+z3aOSKwSKNUCybJlkZQ1wj6BVSSrb5ZeWOXG9i6eZTk2dDNqFS2dEugNGgi8
 3FMKBbMgfOJx+0mjVuXPo93PT8T8RcEMWKtTIImF9RmnQNYif5fTePzynCLJCKzIKWF1CoKE5iT
 VtUVMSfTBeO+UjbYXGJkf7hbAqPoOz/SlSrIo+PMw32PefNZRHnVyo7whvDCka190I2DuDFcml/
 cXL8Mfcy54F2JsgDWyq3hkjATr1tBBFDuQoH+92bz9Lufjfy04cp9WX6MiKST1wzQn8JP3GE+zm
 9AbfY6cscCZvFVbviW+09rYuiZgAv1ng==
X-Google-Smtp-Source: AGHT+IHajMtSeTIEyh6n8MyR6pgrCZEB1nqfEHOw6v3cOEm9Bb6+kEevt48OwTYU3ThjT8h4iDk1yw==
X-Received: by 2002:a05:600c:1d18:b0:45f:2869:c3b2 with SMTP id
 5b1f17b1804b1-46fa9b1834dmr84819305e9.33.1760103782247; 
 Fri, 10 Oct 2025 06:43:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb497aec2sm48065605e9.1.2025.10.10.06.42.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/16] hw/core/loader: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
Date: Fri, 10 Oct 2025 15:42:15 +0200
Message-ID: <20251010134226.72221-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SUSPICIOUS_RECIPS=2.51,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/loader.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 477661a0255..aef10cb3f2b 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -491,7 +491,9 @@ ssize_t load_elf_ram_sym(const char *filename,
 
 static void bswap_uboot_header(uboot_image_header_t *hdr)
 {
-#if !HOST_BIG_ENDIAN
+    if (HOST_BIG_ENDIAN) {
+        return;
+    }
     bswap32s(&hdr->ih_magic);
     bswap32s(&hdr->ih_hcrc);
     bswap32s(&hdr->ih_time);
@@ -499,7 +501,6 @@ static void bswap_uboot_header(uboot_image_header_t *hdr)
     bswap32s(&hdr->ih_load);
     bswap32s(&hdr->ih_ep);
     bswap32s(&hdr->ih_dcrc);
-#endif
 }
 
 
-- 
2.51.0


