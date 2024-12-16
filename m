Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6063AE7716A
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 00:51:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tMzJG-0001Kd-Tu; Sun, 15 Dec 2024 19:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJ8-0001HB-H4
 for qemu-riscv@nongnu.org; Sun, 15 Dec 2024 19:49:58 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJ6-00074c-5c
 for qemu-riscv@nongnu.org; Sun, 15 Dec 2024 19:49:58 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-725ecc42d43so2988023b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 15 Dec 2024 16:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734310193; x=1734914993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMz5z1qtJxQUJErlLKkRHU3+t7ygQhiQ+P8RsAR7bug=;
 b=IxL8Ja5XX3u+LXmSva3zRNf2X3uv19ueFIxz/Ns72fh558qe5zcWpK86Xu8fu88vox
 OIBorXodUf/vwsAhpFHstBpXHdiMK0qs9E31CoaI7jzpr93d6/GhWKoVbjYp2P/pxIJT
 TrpSJaQz1dVUaLZJneUUPnqZ9GK+A8OFCvkdgNRF/J70p+VgdtUovLLL3PY35LkmQlc0
 ohRZRi9ybDCo0t7NPpSPQN4uhzVh5wZY4JrJEvkQkWi0ftMa03eH3PQ0H82VMSVlRC+o
 6P53oTLmqdSJKdGtnB0k3tRtqBbIc2wAFur/iV/wkwrVbQhKG3JMoC9MMaxX+nvIR8dc
 KkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734310193; x=1734914993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gMz5z1qtJxQUJErlLKkRHU3+t7ygQhiQ+P8RsAR7bug=;
 b=LCQwrDe+VsmAmkhm0svtzlsm8fQGSER6+l7MCI0IGypUxZoCVpQ/qkQohffTBRch2h
 EQFRK3bLg0WltvoaAZY8LowOUd66oUf4WLzfdgX6ignvM//LRPWQC+MYxIpwVgzlV7S1
 kTqsagKjtRQ6HAqcDQZzLJ/sgBvMvBbOQCezxCmLHmn6srG2k8puYlH/rOOTDFiL4gUP
 pUPQVBaPNg/a26atpzNkuDy8j8ZcribImlhBjHUXGYezs8YHLJptc7k3oBbU5KpfdnR0
 AYk9BfGZK6j0vPJ4f+0WE1PsH7aiOndStbgjNn9HV6wh1VO4SlRplFuawsZSLtiRMXMx
 Z52w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfQFW5fKbI46AkBsUpUNp+C2mPsAi5MQCyl4XA09nWDihW6H9RM3P6v9TZ92Zmhu7zU88Zi5vqMDRQ@nongnu.org
X-Gm-Message-State: AOJu0YwTWaUL1V09Jnp9kK2IIeRXSteyGakTAJR55Jt6DdFKvct4zTuP
 Lywyw+Jqejk5O9V9pYwfFKVKpvxQ+Lvl/rL1BCVDYZV2W8GczrwV5VwNVd1Ypgs=
X-Gm-Gg: ASbGncsiBthLe0D6j7NWD3yYVaBPUI8Hp2YNohR0DDmTH1FzooB0qXn8JzRyPnZJhgl
 MNlm+WgD4b2Qwrk1q+NW/hJh2thksACR2ccbe/Hg8siqiMI//ukSY0irJMEgWsBSImixCiJQSjH
 54bf9Cw0+1WnXLDnu6tcw9WLVtv3LB7a7A+mAH55tYJvj/NSf7ikj8aHmUn39kvZQ7KILAlfVNS
 QoHEtb3N+OvkechI4qJE6T6kgCJH2jXkyOiWXuewXHVaGYeBAOX/uUMh4unGFni5qlVpu6u2jP4
 r8SAxR0g
X-Google-Smtp-Source: AGHT+IEHMPO7YkCWAGkSD7eI5KSN8Gv9wkinIu6eD/GvMxdLAFbKpvB3We7N+j/JoyzyEAQJ1Z9X/Q==
X-Received: by 2002:a05:6a20:9143:b0:1e1:9f77:da92 with SMTP id
 adf61e73a8af0-1e1dfde6d4dmr14073191637.33.1734310193247; 
 Sun, 15 Dec 2024 16:49:53 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm3059586a12.47.2024.12.15.16.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 16:49:52 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [RFC PATCH 3/6] hw/pci-host: Enable DW PCIe host to send memory
 transactions over specific mr
Date: Mon, 16 Dec 2024 08:48:54 +0800
Message-ID: <20241216004857.9367-4-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241216004857.9367-1-jason.chien@sifive.com>
References: <20241216004857.9367-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x436.google.com
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

Current Designware PCIe host cannot connect to an IOMMU, since it has
registered PCIIOMMUOps.get_address_space() and an IOMMU cannot overwrite
PCIIOMMUOps.get_address_space() without breaking the PCIe translation
rules.

This commit implements designware_pcie_host_set_mem(), which is used to
register PCIIOMMUOps.set_memory_region(), so an IOMMU can designate the
downstream memory region for the PCIe devices.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/pci-host/designware.c         | 18 +++++++++++++++---
 include/hw/pci-host/designware.h |  2 ++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index c3fc37b904..8afe447562 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -395,7 +395,6 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 {
     DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(dev);
     DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
-    MemoryRegion *host_mem = get_system_memory();
     MemoryRegion *address_space = &host->pci.memory;
     PCIBridge *br = PCI_BRIDGE(dev);
     DesignwarePCIEViewport *viewport;
@@ -436,7 +435,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
         viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
 
         source      = &host->pci.address_space_root;
-        destination = host_mem;
+        destination = &host->bridge_mr;
         direction   = "Inbound";
 
         /*
@@ -461,7 +460,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 
         destination = &host->pci.memory;
         direction   = "Outbound";
-        source      = host_mem;
+        source      = get_system_memory();
 
         /*
          * Configure MemoryRegion implementing CPU -> PCI memory
@@ -666,8 +665,16 @@ static AddressSpace *designware_pcie_host_set_iommu(PCIBus *bus, void *opaque,
     return &s->pci.address_space;
 }
 
+void designware_pcie_host_set_mem(void *opaque, MemoryRegion *mr)
+{
+    DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(opaque);
+
+    memory_region_add_subregion_overlap(&s->bridge_mr, 0, mr, INT32_MAX);
+}
+
 static const PCIIOMMUOps designware_iommu_ops = {
     .get_address_space = designware_pcie_host_set_iommu,
+    .set_memory_region = designware_pcie_host_set_mem,
 };
 
 static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
@@ -703,6 +710,11 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
                                      TYPE_PCIE_BUS);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
+    memory_region_init(&s->bridge_mr, OBJECT(s),
+                       "pcie-bus-bridge-memory", UINT64_MAX);
+    memory_region_add_subregion(&s->bridge_mr, 0x0, get_system_memory());
+    address_space_init(&s->bridge_as, &s->bridge_mr, "pcie-bus-bridge-space");
+
     memory_region_init(&s->pci.address_space_root,
                        OBJECT(s),
                        "pcie-bus-address-space-root",
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index c484e377a8..9562a4ff96 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -89,6 +89,8 @@ struct DesignwarePCIEHost {
     } pci;
 
     MemoryRegion mmio;
+    AddressSpace bridge_as;
+    MemoryRegion bridge_mr;
 };
 
 #endif /* DESIGNWARE_H */
-- 
2.43.2


