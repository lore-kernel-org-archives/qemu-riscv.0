Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DA9C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:48:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxTy-0000Ql-7l; Mon, 06 Nov 2023 06:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxTw-0000Cd-FH
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:24 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxTt-0005Pm-Hw
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:24 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso27312515e9.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268960; x=1699873760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3TRJ7mvtWFdvHNvT+G6kpqIlBzXe7wSn3LOLdu3gVg=;
 b=SQyhIko2VznGmqP3eJ8bayWLSd/SUGbpV/yedTmrjHaH/iph1e0y/d+iwUrGI81z2X
 RSrmb2mBx4rEyB0oG1bnLmFoT3SCU26BREhswEUGHgnLu6JCaL1fE40eiENccelZEJL0
 VhwgDD1OiLUjxSgQ3S0TA3U+bVuaiE9O6s9uw0XrwuHCBxMxk2ZnzyGomPYGT8997Hqt
 lWaV1VyhBoehAasHmOhFAG05k6iL6tLYlslQBqVwlK98Gibws5+6i/KmPWHmdHthX97n
 PlltvpfqtbHIRQYlFiUSVKbvyiDOuMg21PFa4GD8klyJixCLpQxCLeDnsWIRL2VHUUoJ
 EBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268960; x=1699873760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3TRJ7mvtWFdvHNvT+G6kpqIlBzXe7wSn3LOLdu3gVg=;
 b=OAG+vFRrf1Sc899plHq2oWimduFTgVhSPHp+ElKzHxocKyw93MBpy9AwrkhB3nqaj1
 mhSjzcfXpmY+mRoVQO48qtj18rgvIrT+aY/Yr73x94oflnjsBhL3RO5OY26PKLDSRINS
 8FeWBXbkQBmNefV/mgQ+Ch1bTk8dLvEDHKvhqs/XzCMG/zusnIAXXeDgRsMh3j3d+eTc
 4epMFuXfq4UbbYWexCjyMQx73L7Wg3Q0CGKlHcqa42DTsX88c6z4k5UIz/GInEmvIRsu
 6pNmjzUWHT/UGNky1bOwV+sIc7bT4u/yJ1Bbwtj1HbiKaZcsUt/uAyFFzcETk3RcyV/E
 TKXg==
X-Gm-Message-State: AOJu0YzOCKGgaA2kQSn7iJ/ba9vqjM8clgguovP9N3HCsIekwWx3zMk2
 4YPmhrJHnkjhQ0Z6sro2gyNGqw==
X-Google-Smtp-Source: AGHT+IF/QapXB/IOwC+mPuY/wRqr3XPsG7/5YWOQ5O+CSJmVp0xQfesuPuHXWRl4QaqtoFcKAg5Pqg==
X-Received: by 2002:a05:600c:46c8:b0:3ff:233f:2cfb with SMTP id
 q8-20020a05600c46c800b003ff233f2cfbmr23090503wmo.23.1699268960044; 
 Mon, 06 Nov 2023 03:09:20 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b00405d9a950a2sm11977070wmq.28.2023.11.06.03.09.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:09:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 50/60] hw/i2c: pmbus: add vout mode bitfields
Date: Mon,  6 Nov 2023 12:03:22 +0100
Message-ID: <20231106110336.358-51-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

The VOUT_MODE command is described in the PMBus Specification,
Part II, Ver 1.3 Section 8.3

VOUT_MODE has a three bit mode and 4 bit parameter, the three bit
mode determines whether voltages are formatted as uint16, uint16,
VID, and Direct modes. VID and Direct modes use the remaining 5 bits
to scale the voltage readings.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
Message-ID: <20231023-staging-pmbus-v3-v4-2-07a8cb7cd20a@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i2c/pmbus_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 7dc00cc4d9..2e95164aa1 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -444,6 +444,14 @@ typedef struct PMBusCoefficients {
     int32_t R;     /* exponent */
 } PMBusCoefficients;
 
+/**
+ * VOUT_Mode bit fields
+ */
+typedef struct PMBusVoutMode {
+    uint8_t  mode:3;
+    int8_t   exp:5;
+} PMBusVoutMode;
+
 /**
  * Convert sensor values to direct mode format
  *
-- 
2.41.0


