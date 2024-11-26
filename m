Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200C8D3B985
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 11:24:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFteK-0003ks-1G; Tue, 26 Nov 2024 06:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteI-0003jC-CE
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:22:30 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteG-0002bj-I6
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:22:30 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso50436085e9.3
 for <qemu-riscv@nongnu.org>; Tue, 26 Nov 2024 03:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620147; x=1733224947; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XytEl+ZiAvdgFcp20ox+30b5Cy75Cc7byEhOtvETzBY=;
 b=ab6xEX7/KSPKZkv7SByMMrs0kYhVjUQBBrRexX3FJdSh4nnpyuts4vH/QREzROZ6YY
 GX6pRdpJxZJFN5g3A/xKSAaFXtvkp7eo1B1g2iZuYZr80xU8kM0MMSQoNfYimvYrS7vD
 5OzLv7yzecdjhWr11LqQsA6VlMJ1GPyILVu/gircI7+lUUoROLvRRGf5ZOlJEV8HTC7k
 3NiUupdMlVS37Y9+FEiYuKCciVKITRwF1kbgZjtc+1nOAayjGShQlGuyzX7XtAY9D0uX
 lY5Kjgo7B0bNL5PlFDxf9Z8DlwQqH21i51lpwMsbwB9RauvG++djPSre1dsfyJSugINY
 6lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620147; x=1733224947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XytEl+ZiAvdgFcp20ox+30b5Cy75Cc7byEhOtvETzBY=;
 b=dV2e2dOdpr66jCQoIkamscJ3qPMOaU17vt4l93CZpZpN3qpFG96F1WLEyBm/K5xe4a
 g/sh/RNR4mauSbTSfShF2Yb9TpIsN+K1wQr86+fKNkbnI+h9RFrhJVHDeZel9/lridQr
 i3lxH1FYt1vPnvGA4yl7EI5iKRKguWUgJS3m9H2GwlMhdvqEYzT9HgF+MJ3n71vaM90H
 QQaAcr1+Rrf292nw5Bdhucgpm/Ua7y1BcNL3eMJdvgdglcp98Xb3ioSwlfhZ8lbM6L5I
 D4QvDCNU/o5LQ1weUAxj1iS/X/GXPxD2kbVPLwvYFhB6SCu1Xj2Ab9dh3/He7y+Ohrmh
 Lz+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVf0KyJpxwTaQVOSoOzGBdkxUvdO4fhXX6zmgv4ceSSVH9S6/OXm/klcDPu75NHvu/T1qidDt0fY1Q@nongnu.org
X-Gm-Message-State: AOJu0YwMFvEglWf6elglD7IPVxDsm8d9IEX6HpXWJKDwAMu0G8lCVUDJ
 ApJ49K7PRj3mZ+HtlGH23qEfUSXE1lICOCR1egbpZfwQeYVn/RhyhAq4EdpUZKs=
X-Gm-Gg: ASbGncsW4HBRpVGrHTEvHnkWLi2idrv3voQcAmpQ6bg+sBMmeKSKkEH21oREjjo3zp4
 /yRVCXdjk9XAmNhO7oAPCd9WDQz1r5o39wvb5TfZNWZ9t7YPJjgX0iGJcm/86dh2U6KBSdPL3h2
 GG1cenDNe8o4oOREpl6ubM8dvW2FcDqM4lfrNIVnrjIhz+m5OSNvSfvvIxv1aIqyVhCkIsQ17+h
 qBVX7tZsLFKFmjPfygvtojCwIe/uhAaMl9JmMEZUnHwt67mc2+1uzB60ZAa684nGSmDi59X
X-Google-Smtp-Source: AGHT+IGvdJyMsroF/T4j2TdVAhYjrbc5PWwEABLMtA2phckCyIulZKolLG8ElIFyRkC+RNzR7RccbQ==
X-Received: by 2002:a05:600c:3b91:b0:434:a29d:6c71 with SMTP id
 5b1f17b1804b1-434a29d6d6bmr39357155e9.27.1732620147073; 
 Tue, 26 Nov 2024 03:22:27 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb25d74sm13208001f8f.47.2024.11.26.03.22.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 02/13] hw/pci-bridge: Initialize bridge with
 parent bus flags
Date: Tue, 26 Nov 2024 12:22:01 +0100
Message-ID: <20241126112212.64524-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
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

Bridged buses inherit their parent flag,
except they can not be a root.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-bridge/pci_expander_bridge.c | 8 ++++++--
 hw/pci/pci_bridge.c                 | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 07d411cff52..bbf615f544b 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -336,6 +336,7 @@ static bool pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
     PXBDev *pxb = PXB_DEV(dev);
     DeviceState *ds, *bds = NULL;
     PCIBus *bus;
+    PCIBus *parent_bus = pci_get_bus(dev);
     const char *dev_name = NULL;
     Error *local_err = NULL;
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -358,12 +359,15 @@ static bool pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
     ds = qdev_new(type == CXL ? TYPE_PXB_CXL_HOST : TYPE_PXB_HOST);
     if (type == PCIE) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
+        bus->flags = parent_bus->flags & ~PCI_BUS_IS_ROOT;
     } else if (type == CXL) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
+        bus->flags = parent_bus->flags & ~PCI_BUS_IS_ROOT;
         bus->flags |= PCI_BUS_CXL;
         PXB_CXL_DEV(dev)->cxl_host_bridge = PXB_CXL_HOST(ds);
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
+        bus->flags = parent_bus->flags & ~PCI_BUS_IS_ROOT;
         bds = qdev_new("pci-bridge");
         bds->id = g_strdup(dev_name);
         qdev_prop_set_uint8(bds, PCI_BRIDGE_DEV_PROP_CHASSIS_NR, pxb->bus_nr);
@@ -371,8 +375,8 @@ static bool pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
     }
 
     bus->parent_dev = dev;
-    bus->address_space_mem = pci_get_bus(dev)->address_space_mem;
-    bus->address_space_io = pci_get_bus(dev)->address_space_io;
+    bus->address_space_mem = parent_bus->address_space_mem;
+    bus->address_space_io = parent_bus->address_space_io;
     bus->map_irq = pxb_map_irq_fn;
 
     PCI_HOST_BRIDGE(ds)->bus = bus;
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 2c7bb1a5254..d47ded9e0cf 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -376,6 +376,7 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
 
     qbus_init(sec_bus, sizeof(br->sec_bus), typename, DEVICE(dev),
               br->bus_name);
+    sec_bus->flags = parent->flags & ~PCI_BUS_IS_ROOT;
     sec_bus->parent_dev = dev;
     sec_bus->map_irq = br->map_irq ? br->map_irq : pci_swizzle_map_irq_fn;
     sec_bus->address_space_mem = &br->address_space_mem;
-- 
2.45.2


