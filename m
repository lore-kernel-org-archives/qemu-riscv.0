Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D431C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:37:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxUx-000354-1Z; Mon, 06 Nov 2023 06:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxUU-0002Xs-BF
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:10:01 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxUQ-0005gD-Bl
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:58 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32dff08bbdbso3001348f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268993; x=1699873793; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/UYA9fxIVAJDV/ugwhxZLfTB1YL01/OCPxws1OIhgNw=;
 b=twhGE9uHJIOhRvFOenLm90pUF25nxRVTWx0JYDpC+/N8YiAOkdiwraE6+tgn+rYhOE
 coOC2fFY2iqRogMJcZhYSjiMCWA8M83HXCY92NV/p3e6nLzUuMAuimPw4xsTJzfVzUBO
 MOsHlH6/QcMqPwAl1pMCvYeGP+7wEGDLaYQSV7Al6owAtRxM1sRVh55//r0qpJ+7A05F
 qFs4KrMlq5gWxF7YGTxFlGXcrsLKaMOnPdXRB9LwHrE3ZMpDY3jbo0zugd2r7NzvtmHB
 9tmCTjrUai7KJQQZL345MrzfOt6YSrx0BTlP3gbDNBjDtoApEV0qTbKrCBlgQLcapnD1
 ZKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268993; x=1699873793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/UYA9fxIVAJDV/ugwhxZLfTB1YL01/OCPxws1OIhgNw=;
 b=XM3twSWxK5qTNlatnx+btlrk9UPn404gLVvmsQIKhwUXU7zEq8wvNzZsF55q9UQh2B
 X7tT5OInYOF/BUxYPViJMQobJ3Y94CwwE1lQ/TNw/K3Q2NQgQ3HBxdrrvIVdsbPzFDb5
 aVMsp/tZohX+b42DbTbdBHr2utGKIiYkKrQn+JwZnKdNpDjBRuurAbJKAcPIlVtLI8wr
 Vr3vyhkkkAF5nevCsFSFOPVWB7Dcv0Pwmbr7ta3eh1LUW3rmYSwWe2+QBi8aj5wvTx4b
 ZSFqayaoxFyQ0T7MBdtgsTE9zkp0YTPmCVg+VL9PITj7j+l4fArB2IocYHIRZlRdgJId
 BLvw==
X-Gm-Message-State: AOJu0YyRoBkYvoTQbKZovPlipNtGCBujm15v4XlVoNhzk5lTIWPANIM/
 ntOj//giuoGx0+ZrWII+UyOTPQ==
X-Google-Smtp-Source: AGHT+IEJYwaQv9zhCAnw87q6XL1cNQIMVWd4njIJAfgg35jyjWT0oa+xJ0fh+sg8SmmssH1mUhxHcw==
X-Received: by 2002:a05:6000:4021:b0:32d:b991:1a71 with SMTP id
 cp33-20020a056000402100b0032db9911a71mr27821328wrb.0.1699268992895; 
 Mon, 06 Nov 2023 03:09:52 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a5d58f2000000b0032da4c98ab2sm9102932wrd.35.2023.11.06.03.09.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:09:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Titus Rwantare <titusr@google.com>, Patrick Venture <venture@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 55/60] hw/i2c: pmbus: immediately clear faults on request
Date: Mon,  6 Nov 2023 12:03:27 +0100
Message-ID: <20231106110336.358-56-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

From: Titus Rwantare <titusr@google.com>

The probing process of the generic pmbus driver generates
faults to determine if functions are available. These faults
were not always cleared resulting in probe failures.

Reviewed-by: Patrick Venture <venture@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
Message-ID: <20231023-staging-pmbus-v3-v4-7-07a8cb7cd20a@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 3bce39e84e..481e158380 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -1244,6 +1244,11 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
     pmdev->in_buf = buf;
 
     pmdev->code = buf[0]; /* PMBus command code */
+
+    if (pmdev->code == PMBUS_CLEAR_FAULTS) {
+        pmbus_clear_faults(pmdev);
+    }
+
     if (len == 1) { /* Single length writes are command codes only */
         return 0;
     }
-- 
2.41.0


