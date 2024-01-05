Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6B8C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:59:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmQu-00018B-3S; Fri, 05 Jan 2024 10:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPs-0005aB-E3
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:26 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPp-00047T-Lo
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:23 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3373bc6d625so1300953f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469640; x=1705074440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQqVZQAplGXwt087ddAaGknca/07pmUL/gFu1d2+27U=;
 b=rBQ6eBIXuAdfLu0GR0eKsWS8Azq3u6wuQt/JBZFPQA+UTw1BKa/4aqxs2MlLyDkxHa
 Dmybi4K6P90/kCOiGPp2usL4/dwMPfcqH+zZrUDqv3EyikR2zLsQtZHQE3qbcDGAOmEa
 wPZKoWXBjmPDfeF6OMULLPtdOE8ukQJD5SuD+86lD1MMo17Fgj7aIHczzKJvC9Jr14WL
 jnYu6MaFy2xKM7Ur1xTqjl1flVigApzvxBjIEOCWe1GaOlid4kY9wYAi6XpqqOhpODW0
 qyE9bL84xhawbACVPZSv2pzucEcTBZyYN8JEHUn1LA/5cPTOtZmhjD/1VlzqX1o2xpgN
 wgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469640; x=1705074440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iQqVZQAplGXwt087ddAaGknca/07pmUL/gFu1d2+27U=;
 b=uhemXx6IuAKdwTNCydC6XfaecxJcf323q+ETzyJAhyIIsdGugUM4tlGMhpqT1NXDo2
 AtiDYMDDo3CB14EULGBf9/NbH45w8xNXgIHcwU13lg92RQUReue+aPOEymbc3ewvcSLs
 /aOGunnQ9d8qxv6r0YOzAz8BZz8KWahMeAS8AeH/ipjW8PCMCZB+7uJXye8PxW8FJshU
 0PmzFefh22SWJlmaYNGM1fll7LWzHKoOGOj7Tt18QuVLfs0Kf6sqUny5zplbM35wZ8Bn
 tTe4F3creZDFF94et1tgW1ehNCiUCeBF3OVkMKbAy4WPOch5q0vljuFpXnIL43iKBrFy
 2Fng==
X-Gm-Message-State: AOJu0Yyqe09qX4i7ksjJpRMeSkKtC3sLV3nS0T6JDOW09YpCVcKg88Co
 wAhBE0lPnGY4/jyCblabkQfaYKGkDuCYQA==
X-Google-Smtp-Source: AGHT+IFR0sHSGxpKEI+Ag2hwXAsaEAvXTLccumut7zi7pHF38anQ7KYbLL7zcyI7JlDChab5stlH/g==
X-Received: by 2002:adf:ed8c:0:b0:337:d82:5106 with SMTP id
 c12-20020adfed8c000000b003370d825106mr1218971wro.99.1704469639779; 
 Fri, 05 Jan 2024 07:47:19 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 k7-20020a5d6d47000000b0033725783839sm1605061wri.110.2024.01.05.07.47.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 38/71] hw/arm/bcm2836: Simplify use of 'reset-cbar' property
Date: Fri,  5 Jan 2024 16:42:31 +0100
Message-ID: <20240105154307.21385-39-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

bcm2836_realize() is called by

 - bcm2836_class_init() which sets:

    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a7")

 - bcm2837_class_init() which sets:

    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a53")

Both Cortex-A7 / A53 have the ARM_FEATURE_CBAR set. If it isn't,
then this is a programming error: use &error_abort.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20231123143813.42632-3-philmd@linaro.org>
---
 hw/arm/bcm2836.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 166dc896c0..a1bd1406e1 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -131,10 +131,8 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
 
         /* set periphbase/CBAR value for CPU-local registers */
-        if (!object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",
-                                     bc->peri_base, errp)) {
-            return;
-        }
+        object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",
+                                bc->peri_base, &error_abort);
 
         /* start powered off if not enabled */
         if (!object_property_set_bool(OBJECT(&s->cpu[n].core),
-- 
2.41.0


