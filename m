Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217DACCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:15:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNFs-0007FI-6P; Fri, 24 Oct 2025 15:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNFo-0007E2-51
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:15:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNFk-0007Jt-FK
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:15:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso24853305e9.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333307; x=1761938107; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mty3IBivH6Vnk+xdMuiwBkLnhhTV1D3AWcAhgKsnzI8=;
 b=O2A9iXcCJbkisWGAjWfIBmNOC1GcrXu3C3JnF9szEq/B2T8/doAyRCzDTlPTWklH5+
 3i/+9OPdCzuhxVhOkXxQnhEQLdE7lw9XAQSzi8/KiiNgO7NoiZLh48wlVduH1FZ2BlWq
 mHH9AdH8AUgwlKe1dY12CZNJJCneMZm3+SAeh84tGyIFOVsUw5yhsb6v/bzC93CrOvqU
 WyUEPD4SgOl0VbztnAJCigmM9Uu6WxVn4hvRWGYLyR6pwTZ0QS5g1SIy16ASWgNbDz/J
 lJulh9uW0zh071HifU7D5ZMOL/UFJtqMaqWlXpEH0aa7ClBe0BlD2RNlex3xSDGW8YSl
 k8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333307; x=1761938107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mty3IBivH6Vnk+xdMuiwBkLnhhTV1D3AWcAhgKsnzI8=;
 b=tz0Tv9bqSCz29mpgSOjUeZhibf+dU3OV39ikuq9LUrgK1Sw+kgAovrvebmyMAUzNH/
 mXxFv9hWZNLAriOg0RrskLN7ef/hAZ1ykSssSdbBMacPFMN5nKuqihy+qKJDFyAf/maW
 WeRz8NUPyPBcu5/iHDyF3d+T6Q5RbmTQZrd9Pif76pReDPKd3XMT6KrLvTADgbStXOsn
 ZP1ZsbtQ1l9J+a+PlzPUWnj+/FTaCNTlc1eRXMrRYAFK0cR4k749HM8Ncr9idt5cMbRg
 WPIrZg6wvKwKxnKQTZUZlcqyqckxUUnK3b9fBtCodL/wXCvoWIP7AAmoJv4O1ocmiPll
 /W2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/iligGF9osDpP6rsp3bblB8ar+NE7BBR9oAal0ilSotoXY73RnMf2ZTAK/+pWfhhvPYYyaCbjNQSx@nongnu.org
X-Gm-Message-State: AOJu0YyYf3dGy3eolnwq5rPvo8bdZGOaokavuGuvwog5AYfHqgGphfvS
 fzzOZ7ZCr+p1MRky6haThis9NLRJYrcdxuQnWpsAnDCWKVPkxIOsWNYvzcvKp829gYc=
X-Gm-Gg: ASbGncsAtBOXmNDHjQ4mo8yE4jZSRef7QMUefWnx5JZUO2jZ0VYvwgnL/MlcbmmEXOV
 nrViaeD7RhRVQsr+jzR1jGOJ0N0VtFv050t4pMXnzMB8qwB6VFwXUTumA+775jktN2rgNk8fYz5
 eX9HHWlZNhz/xUVRXfFarA1JrapEl1+x1BmJ7Y4M2HlTSehO1RvRcoiBve6rCRqtZ1Urx4UHE8D
 7BOLAWLIEh5ln7oiT42ZWITa9jczDxkaDjJZC/k+H29J8Rm3/ae2Kss3wwtKQWgBL+OwaFcUl01
 TJriV4sU0f6dD9qJLaz5Qb9DDwttJaA/tzFvp4MPM0ZytnYyXCP98fYOS8R60cnAl8gOJkmJGVg
 Y9KDDfRU/n7Nay+igP3x5u3crCINTebcPxovR5ndJyw00v+q0xUJPII3VdKfXDgbfZcdTYJQX/7
 5CCu0XuvxaXtm0+ZxheBjW301Wdm/Tj4aYAni6ImsymE3Kpg/OOg==
X-Google-Smtp-Source: AGHT+IHJPulElC4lE3QAPYJe+DLg06Uu2ObsGTptGP/SwFf6wsdthQIWa17PhJOf2v9TAr2kywqJKw==
X-Received: by 2002:a05:600c:35c3:b0:471:5bf:cd02 with SMTP id
 5b1f17b1804b1-475d2e83b91mr31895795e9.11.1761333306698; 
 Fri, 24 Oct 2025 12:15:06 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf2ef9fsm105040325e9.13.2025.10.24.12.15.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:15:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 07/27] hw/sysbus: Add sysbus_has_pio() and
 sysbus_pio_get_address()
Date: Fri, 24 Oct 2025 21:03:54 +0200
Message-ID: <20251024190416.8803-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
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

Similarly to sysbus_has_mmio() and sysbus_mmio_get_region(),
add sysbus_has_pio() and sysbus_pio_get_address() for PIO.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sysbus.h |  2 ++
 hw/core/sysbus.c    | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 69eb62e29c8..07a307b5ca0 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -71,6 +71,7 @@ typedef void FindSysbusDeviceFunc(SysBusDevice *sbdev, void *opaque);
 
 void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory);
 MemoryRegion *sysbus_mmio_get_region(const SysBusDevice *dev, int n);
+uint32_t sysbus_pio_get_address(const SysBusDevice *dev, int n);
 void sysbus_init_irq(SysBusDevice *dev, qemu_irq *p);
 void sysbus_pass_irq(SysBusDevice *dev, SysBusDevice *target);
 void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size);
@@ -78,6 +79,7 @@ void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size);
 
 bool sysbus_has_irq(const SysBusDevice *dev, int n);
 bool sysbus_has_mmio(const SysBusDevice *dev, unsigned int n);
+bool sysbus_has_pio(const SysBusDevice *dev, unsigned int n);
 void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
 bool sysbus_is_irq_connected(const SysBusDevice *dev, int n);
 qemu_irq sysbus_get_connected_irq(const SysBusDevice *dev, int n);
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index d33be6b2b52..1dbc345a3ef 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -206,6 +206,17 @@ void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size)
     }
 }
 
+bool sysbus_has_pio(const SysBusDevice *dev, unsigned int n)
+{
+    return (n < dev->num_pio);
+}
+
+uint32_t sysbus_pio_get_address(const SysBusDevice *dev, int n)
+{
+    assert(n >= 0 && n < QDEV_MAX_PIO);
+    return dev->pio[n];
+}
+
 /* The purpose of preserving this empty realize function
  * is to prevent the parent_realize field of some subclasses
  * from being set to NULL to break the normal init/realize
-- 
2.51.0


