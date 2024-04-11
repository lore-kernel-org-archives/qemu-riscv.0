Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E822CD128A
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 10:45:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ruruM-0002lJ-0o; Thu, 11 Apr 2024 06:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruK-0002kg-6d
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 06:43:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruI-0004Aj-Ok
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 06:43:51 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-346b96f1483so269217f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Apr 2024 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832229; x=1713437029; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3g1QSRg86bxVtcxnKKn01h0Ac3fWVT80PO+fMEEjTc=;
 b=ujZpLNuGHK2mgdbNq1+2c8R/e0NYK1eJuktMVqdvKiJhiB4WtUPEa8yu1DKTX9KJu6
 iH3B8pl8mwtJE3vId/+Xvaz9Eyy53LyIZLniC92hpKueuIJ9gXidZVC+yYgSSS6SzpfR
 HHPINm0UkW+MKIFrPbo+M0FriOEdFfbvIDWpoSAPMiqq8/iOUcrsV8i+tYCvQNX+/8sC
 DQu4PnehSbTywx1gtfTnnqFRQ2T2teeXLgdQ0+1b5C048d8GuPevS1kigPRLqteMFuQB
 +ob8Y0yH/Q8fvaWpcAEKS+ZpHNraGxM6Ns7yTXb5LoNRzsPBIM6W1zEwKo/zQwqNlVA9
 9izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832229; x=1713437029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3g1QSRg86bxVtcxnKKn01h0Ac3fWVT80PO+fMEEjTc=;
 b=NZB5LURdxiusllt32qY7Ae5f4cgrSHw4hJrRoIsqXeaj5tAPImvTWMQdPg5om0peHy
 5q7V12g55PNw6+oMYP8hYGN9HPUUuQjxgrvEvyIrSB3xTz1JQe7+CaGSPMD05bYeKHeg
 WrZHPe/etfqz2PG0KVSLWKMMdKU6bEmetaQQRsX2ZQupVUp4GIJ9YiaCcroT/chAdYIY
 c/zUgh/p61QscJReP5SPfOCzpplehWtw3FM5sBCEu+MOZcvRxePpOK4abKwTaK02Ekhw
 f1WT3bowcDf/5ZocENMgtnC/wz+WelEJWAlVImAwHjSZNyv8EXiov1BoQNxJb2jkWvH/
 gxDQ==
X-Gm-Message-State: AOJu0Yzu7QjHOteLm2I5w+o8MRBxOXbD7dHnEwhjhW3ek3b2dnk+KYzw
 cERGtVYUPRELxgAymrm8trBrP/GbgPVUBDHV254Gc0e/MM7rRyU4wKhPssZZyFw=
X-Google-Smtp-Source: AGHT+IFE1VighhGsxizlW1KVNqq6FJI4NrlkdeqVvnU3HOZQW/MzQeccuj1xC3nxBApNspbdHZsN6A==
X-Received: by 2002:a5d:456d:0:b0:346:65dd:5580 with SMTP id
 a13-20020a5d456d000000b0034665dd5580mr1693002wrc.3.1712832229124; 
 Thu, 11 Apr 2024 03:43:49 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a5d6245000000b0034334af2957sm1469250wrv.37.2024.04.11.03.43.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:43:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/9] disas/m68k: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:43:32 +0200
Message-ID: <20240411104340.6617-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411104340.6617-1-philmd@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/m68k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/m68k.c b/disas/m68k.c
index 1f16e295ab..800b4145ac 100644
--- a/disas/m68k.c
+++ b/disas/m68k.c
@@ -1000,7 +1000,7 @@ print_indexed (int basereg,
 
   /* Generate the text for the index register.
      Where this will be output is not yet determined.  */
-  sprintf (buf, "%s:%c%s",
+  snprintf(buf, sizeof(buf), "%s:%c%s",
 	   reg_names[(word >> 12) & 0xf],
 	   (word & 0x800) ? 'l' : 'w',
 	   scales[(word >> 9) & 3]);
-- 
2.41.0


