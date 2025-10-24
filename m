Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C80ECCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:10:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNBN-00055R-Mq; Fri, 24 Oct 2025 15:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNBI-00054g-Mf
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:10:32 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNBG-0005yO-PX
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:10:32 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47106fc51faso29082575e9.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333029; x=1761937829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfFJAb/KcoEMKci+o785xcZsNgBjcX1J9BbfpmwSLMI=;
 b=VmufCYqd1efBaAb38BREtu2GEJlFpuByifre4YKtIvxB93VpvtNQ3p+XyvedwNqX3j
 d//YKh1Tgf+fdBrO6jwggyyNqyTfgVJ5phAkiGiyVGr8KM+X+Xdv+JX0j21HfTLD21N+
 c/5Dr5VsdZIRaJjho0sNROCk230PnheiJMkqk2Gm+0rnsQCojls8dj9xz5oDQ9XaLtg9
 PXXiFaqXvtymyCeQBnbTDhcmEjpJh4BcxPBVnq5rVHb4Wr/ny4gUFeULaHiTxz3QsF73
 IUGm+aYsCZkup3fPP8pdXQpI8+wK2YLEmaiAxjYP9AiUzYluVzew/H8xVNjuuVGMXQCW
 0tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333029; x=1761937829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfFJAb/KcoEMKci+o785xcZsNgBjcX1J9BbfpmwSLMI=;
 b=eo8jIhNyYCqLiiIt25Gv7oE+9YYy8/udfPXczQIIu30BA5dldskSb9PK9RxaPIHuQF
 oMp7I+mSov5shwhIBiYBqCsmn7nICJVOkV7ugtKp7lIBek126cvH8QscBKJcYa5FMTzS
 Nk1JQzL0DUAl7/+Txsgx58ZtYQZBjf7FdPkRakhqFhzs2yhNbcFTRlROjteAWfZdYd6p
 e3wjxYqbE9zBLhHtEDV0dTme3s7TNbxKrQQXMqpBorVDrzDl/fwqw15/i2HofFKMp+g7
 JuRY4Y70vqZrIK+aaukuzL968jhNNVmobYib3jg/GUi/KZACPmU8hK3ta1E9NbsmiwV9
 zmeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMzgdZdmmkj9HDvZfI9Wi7UvgVaoChxLgGI3IMTk1HGqoZa8C6Buqur631+SiW2KNSY7gx4Fob2ki4@nongnu.org
X-Gm-Message-State: AOJu0Yxnq5+c2qZAjUOpcu4u09QTzI43oESZERMIzOjVJ0yRn8X5aEY5
 fChNWvyoy2KUv2pAYqcXNeYoR+x3s2J3tfvPabfiwpLlZVv8Q61yum0O7qSt6mC05Jg=
X-Gm-Gg: ASbGncsxm8X19ba3e67C33XUv0BXk80qT8fO1hneBgzr0W2y2ySnz7v8JCGaIsvnJUf
 fcf5DD55wjzBiA1FgdPY9o1lLcP1P250jU93iTNDKGOWTb4MrV6XqRQVfIRLG7agnqzJnWcxprN
 uHrBo9IjqK4Zcd09dSv94El6dQIxbiErskPsVMIaH57hHYcKGqtaVoEqFqHKqFnC0CUbZwz78oN
 fkzZ/14fVGEGJRSEnvvP6EaIfdHp9J0VggTySr00nmR1tGXtPzoQOB73I9NFYWWxG28qrVetJg6
 67QIiB6GEIcW/cAiRlb5dYcklT7Z3VtrwO9u+FlbiUOEMcaSNTe/sVIccnog1bljRUnSilkfB8D
 8JJnwtp/MegyGGoK4v5Oq7HJOnBChl40ev9VrXFRx8nM+iGZNer4bpXiie86xH+wfnIlO107N58
 p1fAQcoAYqsJ8h7Tz167tb2TYCciIPgCqrzWWN6O+CjaG/bg+e1Q==
X-Google-Smtp-Source: AGHT+IG/meHJkaNRhIs7e4BzP8Y0pKzZddPA0lObwZfKmDDtc5JNXAo708iuGM3repkxV4qyozv+mQ==
X-Received: by 2002:a05:600c:811b:b0:471:14b1:da13 with SMTP id
 5b1f17b1804b1-4711787dcfbmr208223115e9.14.1761333029128; 
 Fri, 24 Oct 2025 12:10:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4298b9963ccsm9027464f8f.7.2025.10.24.12.10.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:10:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 04/27] hw/i386/microvm: Use proper SysBus accessors
Date: Fri, 24 Oct 2025 21:03:51 +0200
Message-ID: <20251024190416.8803-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/microvm-dt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index cb27dfd732e..d7f49bc1b5f 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -71,7 +71,8 @@ static void dt_add_virtio(MicrovmMachineState *mms, VirtIOMMIOProxy *mmio)
         return;
     }
 
-    hwaddr base = dev->mmio[0].addr;
+    MemoryRegion *mr = sysbus_mmio_get_region(dev, 0);
+    hwaddr base = mr->addr;
     hwaddr size = 512;
     unsigned index = (base - VIRTIO_MMIO_BASE) / size;
     uint32_t irq = mms->virtio_irq_base + index;
@@ -150,7 +151,8 @@ static void dt_add_pcie(MicrovmMachineState *mms)
 
 static void dt_add_ioapic(MicrovmMachineState *mms, SysBusDevice *dev)
 {
-    hwaddr base = dev->mmio[0].addr;
+    MemoryRegion *mr = sysbus_mmio_get_region(dev, 0);
+    hwaddr base = mr->addr;
     char *nodename;
     uint32_t ph;
     int index;
-- 
2.51.0


