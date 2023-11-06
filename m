Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1A7C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:28:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxV9-0003Q3-KU; Mon, 06 Nov 2023 06:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxUi-0002dw-9G
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:10:17 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxUe-0005vI-PZ
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:10:11 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507c78d258fso5608142e87.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699269006; x=1699873806; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ut7p2F8ycBCH0WfVrPlQ2F/inhGj3Q9WVzKOY6zxb1o=;
 b=dZiqZ6SuCWJhRp09kzqGFqJ9zpa1LI1jj7bXZsewcO+Xf1YVLsAPUQz5h6ZPjBLmU7
 IPYaodMFu/QrDrvIHxaHme7IRucrgm8ZM108cx4uUawG6445kiU3v9t6obBpkzhpsgdZ
 q1JWjJOfGccPz0obOS7uMCRX3WIPpiyDCKFfQot17sfm76CHI/co96rgdZvu9fXoZ9Vq
 kzjk0CwugvWFnRl+EG8ghlS2S4a2fkGpcy2ZKrbo/2Oa//Rnv03xZi+IlM9nH+6dc/03
 /K1WEjn/aWiVc7jkhWrjfJFxFKhPGrB70gMhpqDiQQcfzPvOrt3G91Pfargd8iuOKMq1
 qSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699269006; x=1699873806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ut7p2F8ycBCH0WfVrPlQ2F/inhGj3Q9WVzKOY6zxb1o=;
 b=oU2usxlcV3nOlmaWVYeQoSf2yl6WmrMpkygC6HSTOmmDW3FPzNlnAt9KSxFzZt66oN
 XUmVVQfKb146X/KWEySugSjaeaadUDFo6OqzNOdz0kV9GEEXJpMzE20ocl6iOPQbrWdV
 vWbFO40CUZRyVfba3ftyCHwXLe/E5cbFB6yDoiRFJrosFADqwJ9af3WJX4pTuBCl6w6Y
 R1g6m0dAXcOTivURgIy4051cbznMquhYAJs9vNz3cem3FcuEjT7Xw22jrVdnB0i+Xp5Q
 LgbcXHcvDoW+zwVs+IG3Q+vYzSpELhM5hRc6Yyt/3AL8h2/5BPsN2ZjqZLUcbdHQYjLe
 G7sQ==
X-Gm-Message-State: AOJu0YzTE9kztzWuVnVJJTBNTpciXJkDHZb3aAoLOIFkvkzKVRkVV2Iq
 aNk3HWuJShP6+7/b/OgRAjKGnA==
X-Google-Smtp-Source: AGHT+IFV61WUgaftWSmxlAIXL8iGaW0THkIGj/tNK5wYBo9dUSgSqDELMeQc5HMjnGPaXiCVpA73WA==
X-Received: by 2002:a05:6512:1599:b0:508:1470:6168 with SMTP id
 bp25-20020a056512159900b0050814706168mr25813290lfb.57.1699269006155; 
 Mon, 06 Nov 2023 03:10:06 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 l9-20020adfe589000000b0032f7d7ec4adsm9119404wrm.92.2023.11.06.03.10.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:10:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PULL 57/60] MAINTAINERS: Add include/hw/timer/tmu012.h to the SH4
 R2D section
Date: Mon,  6 Nov 2023 12:03:29 +0100
Message-ID: <20231106110336.358-58-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
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

From: Thomas Huth <thuth@redhat.com>

tmu012.h is the header that belongs to hw/timer/sh_timer.c, so we
should list it in the same section as sh_timer.c.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-ID: <20231026080011.156325-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c01c2e6ec0..3014e768f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1617,6 +1617,7 @@ F: hw/intc/sh_intc.c
 F: hw/pci-host/sh_pci.c
 F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
+F: include/hw/timer/tmu012.h
 
 Shix
 R: Yoshinori Sato <ysato@users.sourceforge.jp>
-- 
2.41.0


