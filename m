Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452E2C47079
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:58:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmU9-0005MF-D8; Fri, 05 Jan 2024 10:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSN-0008Ta-Mg
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:59 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSL-00010C-U0
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:49:59 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d8e7a50c1so18998405e9.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469796; x=1705074596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8Y9INkkzpXAHIBaDV6X4EdXcLZoAOfyToK+IgBwRCs=;
 b=trG9EbVhTGYocEygqSoykHHDkh1JoR0PUhzxazvHz7oZ+PleHicBzuXNFOjxTqEdDK
 8By/C6OFTFxt2LuM7D35vPSxPo5QBx5ucQfRiq4Z5tiBTgUDo/1P2XckLZAGMtk4LQ/l
 2Keu9fXhHLFt+ix/xtuFH/axA4ea7Ne4l9ybsrDQU/mbkD8y3vIuS+eFtm+7MzX6zad1
 vR9ZifAi9/DdS8gdg56M0j/w/alidI2k/fsSif4vcdnbGqB1ZlhHqUMF1h2LwRMzawVi
 UOYQs7Dogxrk8Lq4RoqKbjkyP4HscJ4Np4DT561c6jjxMWMM9I0ZFYUGyzODoK/yfwKE
 gitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469796; x=1705074596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8Y9INkkzpXAHIBaDV6X4EdXcLZoAOfyToK+IgBwRCs=;
 b=UcZGTzUCoDLzw3MrastE1vf56Hzi5ImwKsNmISzToByAJzUlqmbdj+AX3zSLg0CtZl
 aOx9Z+ypo+bqU9OZgoNaWQJJaKA1mYw1bCVMI2Nh6LMQ9HA5sfAvaEmVQA3dbbG7E8DQ
 07PBcYF+BKVQ7001PE+BmLnYi9dJ4+d/zwsBysymVl5gksaKLiuTq2h4oLww0ReGhkGh
 a9Te7XzUOiI1i7ZRZKzjPOyhr92aHn1D48j7Ua8QPSVjJF0Y7KbEbucohyAIs35RlWpJ
 KRu32jIK3eSOURooXHzl940z77SsuOcn8TJxdMz8xVDgZNM2m1oSa/FaTIFqHXwFvz5H
 7Jww==
X-Gm-Message-State: AOJu0YwNZAa1AMCBHGk7E2HsxR2GFPkKKo/7CijB3FqlJkQYWfJpIUXd
 5EcgHGhcNZ5rVEf28c4msmVYiM29sZn8TSrVtzREYz5k5uY=
X-Google-Smtp-Source: AGHT+IHw0jYoJSp6nOLr/q7TJz51rOTiU2htIhCuA9C4AKWA0eKPJWeM8l6XSCJiD5tt4EEsS5RiJg==
X-Received: by 2002:a05:600c:a02:b0:40c:45e:f89a with SMTP id
 z2-20020a05600c0a0200b0040c045ef89amr1280111wmp.50.1704469796358; 
 Fri, 05 Jan 2024 07:49:56 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b0040d94b65342sm1927739wmo.48.2024.01.05.07.49.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 67/71] hw/nvram: Simplify memory_region_init_rom_device() calls
Date: Fri,  5 Jan 2024 16:43:00 +0100
Message-ID: <20240105154307.21385-68-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, arg5, arg6, errp;
@@
-   memory_region_init_rom_device(mr, owner, arg3, arg4, arg5, arg6, &errp);
    if (
-       errp
+       !memory_region_init_rom_device(mr, owner, arg3, arg4, arg5, arg6, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-25-philmd@linaro.org>
---
 hw/nvram/nrf51_nvm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
index ed8b836074..73564f7e6e 100644
--- a/hw/nvram/nrf51_nvm.c
+++ b/hw/nvram/nrf51_nvm.c
@@ -336,12 +336,9 @@ static void nrf51_nvm_init(Object *obj)
 static void nrf51_nvm_realize(DeviceState *dev, Error **errp)
 {
     NRF51NVMState *s = NRF51_NVM(dev);
-    Error *err = NULL;
 
-    memory_region_init_rom_device(&s->flash, OBJECT(dev), &flash_ops, s,
-        "nrf51_soc.flash", s->flash_size, &err);
-    if (err) {
-        error_propagate(errp, err);
+    if (!memory_region_init_rom_device(&s->flash, OBJECT(dev), &flash_ops, s,
+                                       "nrf51_soc.flash", s->flash_size, errp)) {
         return;
     }
 
-- 
2.41.0


