Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADF0CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:08:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCN8d-0003Lu-0z; Fri, 24 Oct 2025 15:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN8a-0003Hd-Vb
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:07:44 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN8I-0005Wi-2v
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:07:30 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-475dae5d473so1875105e9.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761332844; x=1761937644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xe5v3lt1asWPn9kptHJk/kzV1sk/igz/mIMd9PS7E3M=;
 b=PkS+equjvbNLag/r/tIkF0Y5PkVhDqRx7rXFx9KHSOJeap5Yo+xoNh1hAi4WL7HTkG
 1Y/hgfpvIVl1pw4ytkVbjG4CMtHfgMmdV/RiPiiEt0SiPP5GadAYNaqkjf4Z36kKudqh
 uckBe3dm9DCjTVHb+7h8A4rpWdtblXxU0vMgy6DjV7W8MLFHKZlj8l/d3KRAsTO6q/BH
 zeUehWFaR3lBg8iN19DlG4dGh5EKBVjkRKaBfxsLpYZ64VqyBMwbGRltqx6yQtXOotoF
 n8rDvrK6FXBiw/T5j3xhGR/s0OmtiF1T2YtcCoBYDpK7JGmY2BdWPfca+QXTPls2byhy
 2+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761332844; x=1761937644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xe5v3lt1asWPn9kptHJk/kzV1sk/igz/mIMd9PS7E3M=;
 b=b9PLhoPqQ9psBXfvLy+Xkee1TdmVbRsEFWgah8yHM6acxg9w7/A8OMw5pGy1LMalzK
 3g/LJAitpKA9EzWG6vkQm8JHEABu2RVJ8dyb0Dxe+vapamh8MFFF3KZqqFd4quJ5ac+V
 W0QW6yUn0UZfU+waYaxrJJcWMaSykiq8EjoRGelrSM1Qa14go8UxY1Lams+ZL5Sg2NvQ
 pxH1uTR2oi3Lgng0SpIc9biuyGLwEiOJpYjHiFFBKwbt8zndDbK4BlLFIzs054jNcTcY
 hz68rtgKM85XRU7+PVfg21214dSUXtL4RLKwX+nsDwTDghWv+rXHlBa0exlEjMmdevbv
 3tDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeuneWI3KP/Y73rV6VCZ/6C/fhO6ld3ajDakL/YdvfskAvD2/tDSk6c5H+4pyp2XuiNonru39Wh9LB@nongnu.org
X-Gm-Message-State: AOJu0Ywc6fbBmZGaeOIhz+Rx91diqPFyWXvzdukxT3al4yZElRNaVxbr
 YT2duNiXsSzIX4wPO+G79uN/jI0eeh5uGsffvQpSAniYlC/cl/atExIK7qb0zv2RCBQ=
X-Gm-Gg: ASbGncuKMu4/jJ42Awwy0XrKL5fvKEnFuSXpVXkBFHKCcF09/mnLRA32+TUsvf84ks8
 Fnc1HHAJi3vhm+CGFJx0pDKdzndJ5b3hGQnOU83durdy1jpcn7cYoNMFQv9o9fEiYjdAbO3/XIm
 XiOll2KXmQp1NZkJtheMNN9T0VeTwSt9C+Ep1YGXIUzuxIxtcqpN5CzVGIFUAUh9iegtmhibMu1
 39XilY5aFtWzc8gKoAngwHYwW+BATcpu/gMg1dGOJF6VVksDN3yuNfZrIPFweUbxpVBYJYZ68h4
 NeK1jmRvklUj+FfQzW98Aip1w+Mv2IHcZHVt2uOR0sTKhHx+NpE7vylEV0ofa4bAJfHoHQAcmbw
 5NZWxjZw9UujJFQ/35y4DQYkG/p+WSGxlz31Mhxdsug+D0NwO8PHe0u1zKW1z7WG/xUMS8oqO6q
 RulhSLzfup+4dovPCRx4RdK4mvCKO7nSUa4qb8NRLsekq8+I3CKZbVrCI7V9uX
X-Google-Smtp-Source: AGHT+IHHL42jq+kWv7bwkbCqhqJl6wI5+ZAIN94rhWy0oYxeiCcmfQP/ob7ihjyIdvV26ky8WlaCOg==
X-Received: by 2002:a05:600c:3488:b0:459:e398:ed89 with SMTP id
 5b1f17b1804b1-4711786c586mr210976455e9.1.1761332843600; 
 Fri, 24 Oct 2025 12:07:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428f709sm165005335e9.8.2025.10.24.12.07.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:07:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 02/27] hw/sysbus: Have various helpers take a const
 SysBusDevice argument
Date: Fri, 24 Oct 2025 21:03:49 +0200
Message-ID: <20251024190416.8803-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

These getters don't update any SysBusDevice internal fields,
make the argument const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sysbus.h | 10 +++++-----
 hw/core/sysbus.c    | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 18fde8a7b48..69eb62e29c8 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -70,17 +70,17 @@ struct SysBusDevice {
 typedef void FindSysbusDeviceFunc(SysBusDevice *sbdev, void *opaque);
 
 void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory);
-MemoryRegion *sysbus_mmio_get_region(SysBusDevice *dev, int n);
+MemoryRegion *sysbus_mmio_get_region(const SysBusDevice *dev, int n);
 void sysbus_init_irq(SysBusDevice *dev, qemu_irq *p);
 void sysbus_pass_irq(SysBusDevice *dev, SysBusDevice *target);
 void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size);
 
 
-bool sysbus_has_irq(SysBusDevice *dev, int n);
-bool sysbus_has_mmio(SysBusDevice *dev, unsigned int n);
+bool sysbus_has_irq(const SysBusDevice *dev, int n);
+bool sysbus_has_mmio(const SysBusDevice *dev, unsigned int n);
 void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
-bool sysbus_is_irq_connected(SysBusDevice *dev, int n);
-qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
+bool sysbus_is_irq_connected(const SysBusDevice *dev, int n);
+qemu_irq sysbus_get_connected_irq(const SysBusDevice *dev, int n);
 void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
 int sysbus_mmio_map_name(SysBusDevice *dev, const char*name, hwaddr addr);
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ec69e877a2c..ae447c1196a 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -80,7 +80,7 @@ static void system_bus_class_init(ObjectClass *klass, const void *data)
 }
 
 /* Check whether an IRQ source exists */
-bool sysbus_has_irq(SysBusDevice *dev, int n)
+bool sysbus_has_irq(const SysBusDevice *dev, int n)
 {
     char *prop = g_strdup_printf("%s[%d]", SYSBUS_DEVICE_GPIO_IRQ, n);
     ObjectProperty *r;
@@ -91,12 +91,12 @@ bool sysbus_has_irq(SysBusDevice *dev, int n)
     return (r != NULL);
 }
 
-bool sysbus_is_irq_connected(SysBusDevice *dev, int n)
+bool sysbus_is_irq_connected(const SysBusDevice *dev, int n)
 {
     return !!sysbus_get_connected_irq(dev, n);
 }
 
-qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n)
+qemu_irq sysbus_get_connected_irq(const SysBusDevice *dev, int n)
 {
     DeviceState *d = DEVICE(dev);
     return qdev_get_gpio_out_connector(d, SYSBUS_DEVICE_GPIO_IRQ, n);
@@ -114,7 +114,7 @@ void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq)
 }
 
 /* Check whether an MMIO region exists */
-bool sysbus_has_mmio(SysBusDevice *dev, unsigned int n)
+bool sysbus_has_mmio(const SysBusDevice *dev, unsigned int n)
 {
     return (n < dev->num_mmio);
 }
@@ -190,7 +190,7 @@ void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory)
     dev->mmio[n].memory = memory;
 }
 
-MemoryRegion *sysbus_mmio_get_region(SysBusDevice *dev, int n)
+MemoryRegion *sysbus_mmio_get_region(const SysBusDevice *dev, int n)
 {
     assert(n >= 0 && n < QDEV_MAX_MMIO);
     return dev->mmio[n].memory;
-- 
2.51.0


