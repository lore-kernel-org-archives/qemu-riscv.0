Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E96C28B27
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 20:41:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqeV4-0004Zx-UG; Fri, 07 Mar 2025 15:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUi-0004R4-6L
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 15:40:35 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUg-0001wb-4c
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 15:40:31 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2fea47bcb51so4929594a91.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Mar 2025 12:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741380029; x=1741984829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohIL3BV/104Xh7k2LK2qauY0LQOX7g9NVibMeK73rWw=;
 b=iKDatbPkWhloT8eiSVVqPgSX4g+PdBwKJUPPTfzSgCM3Bd2A1YElwIkOlFxcslY4m5
 lT2VHt0juxfjn7C0OeYnXnofCxxlWM40nR5dFsl6myXbHa96/GZYED3VxyiImxVVF2jx
 ZNmZYcv9mRB2OBPbIgvVosNfHxfQQJKCF0rr23EXnOZ85pq2ZJL2x45Jo5AzlaotuoDL
 OaorC9EE1KgDg7mTdWwkvXwo5+PGLTvHtY/eCNpPml616NLVGM+A8C33k5RuW6tOL7Nx
 N9TNgRVCB3MpgY34WnddRdgJZuXb2lpcF+1tjx7ytHCRDOUBN06HWGqhrK4rfpiBBFew
 hPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741380029; x=1741984829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohIL3BV/104Xh7k2LK2qauY0LQOX7g9NVibMeK73rWw=;
 b=d7982pTs6ph6BxQiV8nnOcw/o1GER/kiwlwAQIlK+EhVHn7OfTu/wzz1h6+mqQuE0u
 aqT/uAEdgXswQoIfQindU23E1kgR7eYHJJN/nwlxOw5/s4gRTQaDPVFp5BGTjzOa12Pb
 qdy1PtwiDWh1Nwp04n4LPUtbYLV09vcUMYAZtGi6ZUnewLa0CZZ/uBDYOnhBdAHYS0e7
 56zQLSmULxmTC7W3SDddavv6jVyXTou6M0bK7yMWHDv8wSKyuMx8AFq4KfHI848lz6zO
 0EKZ7Lbf4e7QGDQYPd5QCRO9xyPxvn8U0gGWB0PQ67DZQvTXyRGK9b39V3juBATw2yRa
 5M+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWylUEjkyGSY7XxQe3OQpry3vbxzV1yACBx/sRkeQcbXrKHnOZDyx1F29S6T70qGDKXbPyLK9ATJPz5@nongnu.org
X-Gm-Message-State: AOJu0YykiMTCxS6TBQEiOsv51dZgzPQQLcdlFFL0UYWZKOgNJ9KiIVqA
 pDlTFgKTQgMSHbJAsh5ib7wrs+tbynMttiCYlk2KSnFHCH+xV/kx6mRLkGbga9I=
X-Gm-Gg: ASbGncvIQIqy9RRUYbkgxvcW7NjfgtAzJufb5Ves+aE41rT4R+HS5HViJFisQ9nI4UH
 nCoN09ctFVyIePxkpYBgyF/5fCym1B6TtoYtyW6uL9agQXDT8dOdXF2LX/m0G575w5ro+CCi6RR
 ce4oKd42n+3PkDInhFuKXII4OOxsLZc2z5l7OfDWEUtecxdHxHBHsBrDDvOxf2gOWf7mH0E/zIw
 MDbIuDdKP+LGIhzqhfmAhg1gAaYRfw6k6jbAOrH8/kU14e6aqZIVpbXDrLeDq+NE97/OGbaeIP2
 gG+sZAt4bcnTQeuXezIawVxmoGNwI/OBxZROJ0mv1mVvWaVunR1PnKmVk6TC+e82EAv24zs4
X-Google-Smtp-Source: AGHT+IFk3jj2iAPKHY4isBHv3wjs/MjcPMcFZrxkF8h9RElGBzhuzD4hijmzclDd+QFr/KqNCz38ag==
X-Received: by 2002:a17:90b:2d83:b0:2ff:64a0:4a58 with SMTP id
 98e67ed59e1d1-2ff7cf14552mr6416174a91.22.1741380028710; 
 Fri, 07 Mar 2025 12:40:28 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff5aa3d3ccsm3270900a91.0.2025.03.07.12.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 12:40:28 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 3/4] hw/pci-host/designware: Implement
 PCIIOMMUOps.set_downstream_mr()
Date: Sat,  8 Mar 2025 04:39:36 +0800
Message-ID: <20250307203952.13871-4-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250307203952.13871-1-jason.chien@sifive.com>
References: <20250307203952.13871-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The original DesignWare PCIe host implementation could not connect with
an IOMMU, as both attempted to register PCIIOMMUOps.

This commit resolves the conflict by hooking PCIIOMMUOps.set_downstream_mr()
through designware_pcie_host_set_mr(), allowing the IOMMU to designate the
PCIe host's downstream memory region via pci_setup_iommu_downstream_mr()
without competing for PCIIOMMUOps.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/pci-host/designware.c         | 18 +++++++++++++++---
 include/hw/pci-host/designware.h |  2 ++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index c07740bfaa..fafbf90259 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -404,7 +404,6 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 {
     DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(dev);
     DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
-    MemoryRegion *host_mem = get_system_memory();
     MemoryRegion *address_space = &host->pci.memory;
     PCIBridge *br = PCI_BRIDGE(dev);
     DesignwarePCIEViewport *viewport;
@@ -445,7 +444,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
         viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
 
         source      = &host->pci.address_space_root;
-        destination = host_mem;
+        destination = &host->bridge_mr;
         direction   = "Inbound";
 
         /*
@@ -470,7 +469,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 
         destination = &host->pci.memory;
         direction   = "Outbound";
-        source      = host_mem;
+        source      = get_system_memory();
 
         /*
          * Configure MemoryRegion implementing CPU -> PCI memory
@@ -675,8 +674,16 @@ static AddressSpace *designware_pcie_host_set_iommu(PCIBus *bus, void *opaque,
     return &s->pci.address_space;
 }
 
+static void designware_pcie_host_set_mr(void *opaque, MemoryRegion *mr)
+{
+    DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(opaque);
+
+    memory_region_add_subregion_overlap(&s->bridge_mr, 0, mr, INT32_MAX);
+}
+
 static const PCIIOMMUOps designware_iommu_ops = {
     .get_address_space = designware_pcie_host_set_iommu,
+    .set_downstream_mr = designware_pcie_host_set_mr,
 };
 
 static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
@@ -713,6 +720,11 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
                                      TYPE_DESIGNWARE_PCIE_ROOT_BUS);
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
index a35a3bd06c..30f1598dbe 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -97,6 +97,8 @@ struct DesignwarePCIEHost {
     } pci;
 
     MemoryRegion mmio;
+    AddressSpace bridge_as;
+    MemoryRegion bridge_mr;
 };
 
 #endif /* DESIGNWARE_H */
-- 
2.43.2


