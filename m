Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB7CCD1284
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 10:46:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ruruX-0002oK-8c; Thu, 11 Apr 2024 06:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruV-0002nq-Me
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 06:44:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruU-0004GR-4g
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 06:44:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3442f4e098bso407058f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Apr 2024 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832240; x=1713437040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eBldt31TQRcaP3wXP9WMxXOJNX8RudxIC5CYlIBA8B4=;
 b=QIGlN3GoWfotiLT8p59Mbl8d/yjYxdPX5UhHMTw2ElgLAEK1CmaXOR8OWpYvIvpiXR
 pI/icNE4dRlY+pUypjHplgUDoJoW00AZLoTKUclaljRXgKOwlZYPcuF23eS5ezZN8lx1
 RhylBSH7BWRq3gcsGgHh1ccF5i95BFYs/+0i9q0uTBg+MrRkpIwif4PziZI5hYBJqzhn
 KCGaBiP2HMFMC/x4eGh1i9hFP0zybIH9FJPh2iO+JD4xgz3EyVnndIbOnk9fNgndIGhS
 7DEWZmbH69T4nSOkDkcehkkruszKn6GKeVk8azFmBc0heNfZUP20bvg6+YJZshGBf4ko
 9yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832240; x=1713437040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eBldt31TQRcaP3wXP9WMxXOJNX8RudxIC5CYlIBA8B4=;
 b=J5sF67NzU7W7/9P3N2uuFH1/7jG17npHhJu6wWL4b5TQl4gt11R2uZ6ncyRgunsQW6
 3Hp35zvoF8oug0USSzgd0cE2IstqYgeWPH0eiKs46W9tL57iRwA5sKW/DlLai+jcix05
 dhIc1nAfsJm5JxcCm3J7KqIHXDGb2kGEy4XcsmQP2vWF/VbGcqfAP8sPodRH9qKlFh3k
 Qfe88cZw4YoRtKSLaYymlKcDwJNn0tN4GGA+Hg5bwaHz5cJSFII54j0wJClroaTsxlzB
 d8UXMpLVsrfnFFyNreI4uVmQUDYRSDnxAQeIQUqMLosCeu7LK/PUqThVZzHKCvPLiMZ0
 /v8g==
X-Gm-Message-State: AOJu0YxzL8DQ03ea2vejhzu0ZcINEWIaQ+vL6Ce8HIpmJ3DyK54pOi6F
 Vpn3dOBiUNGkkm4DQot+eBKJ9Zs7mqTWCFWPvWcCjDgXTVcaUQPMFnLj74gWwHY=
X-Google-Smtp-Source: AGHT+IHTKef8x8l+HWwJqlxqjS8rJcShg6NF4xdr4UJuYgIS1JcPL26jDzJF3/06ZC/kb4ZpNSS6XA==
X-Received: by 2002:adf:fb43:0:b0:346:41a7:2fc2 with SMTP id
 c3-20020adffb43000000b0034641a72fc2mr1924813wrs.32.1712832240706; 
 Thu, 11 Apr 2024 03:44:00 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfe3c9000000b00344a8f9cf18sm1481628wrm.7.2024.04.11.03.43.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:44:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH 3/9] disas/riscv: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:43:34 +0200
Message-ID: <20240411104340.6617-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411104340.6617-1-philmd@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/riscv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index e236c8b5b7..fec09e9922 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -4966,7 +4966,7 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
         case 'v': {
             char nbuf[32] = {0};
             const int sew = 1 << (((dec->vzimm >> 3) & 0b111) + 3);
-            sprintf(nbuf, "%d", sew);
+            snprintf(nbuf, sizeof(nbuf), "%d", sew);
             const int lmul = dec->vzimm & 0b11;
             const int flmul = (dec->vzimm >> 2) & 1;
             const char *vta = (dec->vzimm >> 6) & 1 ? "ta" : "tu";
@@ -4977,18 +4977,18 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
             if (flmul) {
                 switch (lmul) {
                 case 3:
-                    sprintf(nbuf, "f2");
+                    snprintf(nbuf, sizeof(nbuf), "f2");
                     break;
                 case 2:
-                    sprintf(nbuf, "f4");
+                    snprintf(nbuf, sizeof(nbuf), "f4");
                     break;
                 case 1:
-                    sprintf(nbuf, "f8");
+                    snprintf(nbuf, sizeof(nbuf), "f8");
                 break;
                 }
                 append(buf, nbuf, buflen);
             } else {
-                sprintf(nbuf, "%d", 1 << lmul);
+                snprintf(nbuf, sizeof(nbuf), "%d", 1 << lmul);
                 append(buf, nbuf, buflen);
             }
             append(buf, ",", buflen);
-- 
2.41.0


