Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687CEC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:14:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxU9-0001ht-GC; Mon, 06 Nov 2023 06:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxU8-0001cX-IY
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:36 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxU6-0005XO-HR
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:36 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32db188e254so2655561f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268973; x=1699873773; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3MW0tyH68/nf1rlEHwZAluKpdYAi9tPVuWOS5/QAWBA=;
 b=I1XktIPOhYqdwG1Y9bMehrpjGF1Bhn/T6ILyWcoDrBvbvgqSRaVGUgXatQ9zhNBS0b
 cX+5K2AJST/kAOFELuJKUUtAzxjVw4riymyinZrF/DQecr82yB/ujWFnCXg5cKW3IYze
 06exFyiqsDs+Ogmnka/MaAxZtVJVCU0OpTmx8ZXALCfA3loaXtR907K7DeWpDVK4pkH0
 rnPql9yD/H6GA7NU90vK8/0kDvOiyQezAb4OpZGlEJKuhAKRo+2Oz3WNMtc5hQEjAEpO
 ckFUzFT705W897fAlZsqmtng7C9Rt+696kkVycSO0A3NoRpX6rVxDadlmrk8CsZ8DQL2
 cSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268973; x=1699873773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3MW0tyH68/nf1rlEHwZAluKpdYAi9tPVuWOS5/QAWBA=;
 b=N4bRXqtfLthTZFE2yUA6OJsQ6PjyfP0I1E37lsO4BzADHaF2+qFt+zFYfEnkBaXKTh
 6BLe+gyfS0Hre6NE6v1mDwXBdrDRI/GmFSyIKAH/T/IvkuZ5nMV2TSWniNbYfQEy7FrN
 U9IY6KYh0XR6PHaBj9opU/6OxjP1/VkCB+5gaQkNAnnQ6+6EH1yOzP6A/8UdGQrcr9Vc
 TxcW6xn5aaG0oppkFXZZGYPhlj/UnfTTUdpI2ViEpjbk5i29MTV0+oxsZ0BFx2tFkqoQ
 OxswZ4NFbpYBisthYOboo6isx4QF8yOjT9OYNhxfouhm0JDF4wlD38RJibbqNqG43Ikp
 zg5Q==
X-Gm-Message-State: AOJu0YxtJWCxeIaajUHuctYVVkIniwEJfIJ5+DkYjSmdYeEZbmnzkSe9
 LwaYmAS/Ed8MozdfiX2BxmW0Kg==
X-Google-Smtp-Source: AGHT+IHCaN+scNB/M2tnE4QgncjJleh2dLiQpvtBfLxKZsjTqp14NEV1WX9EdfcpHqTpyU/QLx/+rg==
X-Received: by 2002:a05:6000:2c5:b0:32f:7ae2:4165 with SMTP id
 o5-20020a05600002c500b0032f7ae24165mr27652837wry.9.1699268972999; 
 Mon, 06 Nov 2023 03:09:32 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a5d4708000000b0032d2f09d991sm9141944wrq.33.2023.11.06.03.09.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:09:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Titus Rwantare <titusr@google.com>, Benjamin Streb <bstreb@google.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 52/60] hw/i2c: pmbus: add VCAP register
Date: Mon,  6 Nov 2023 12:03:24 +0100
Message-ID: <20231106110336.358-53-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

VCAP is a register for devices with energy storage capacitors.

Reviewed-by: Benjamin Streb <bstreb@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
Message-ID: <20231023-staging-pmbus-v3-v4-4-07a8cb7cd20a@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i2c/pmbus_device.h | 1 +
 hw/i2c/pmbus_device.c         | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index ad431bdc7c..f195c11384 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -243,6 +243,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
 #define PB_HAS_VIN_RATING          BIT_ULL(13)
 #define PB_HAS_VOUT_RATING         BIT_ULL(14)
 #define PB_HAS_VOUT_MODE           BIT_ULL(15)
+#define PB_HAS_VCAP                BIT_ULL(16)
 #define PB_HAS_IOUT                BIT_ULL(21)
 #define PB_HAS_IIN                 BIT_ULL(22)
 #define PB_HAS_IOUT_RATING         BIT_ULL(23)
diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index c1d8c93056..3bce39e84e 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -906,6 +906,14 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_READ_VCAP:                 /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VCAP) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_vcap);
+        } else {
+            goto passthough;
+        }
+        break;
+
     case PMBUS_READ_VOUT:                 /* Read-Only word */
         if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
             pmbus_send16(pmdev, pmdev->pages[index].read_vout);
-- 
2.41.0


