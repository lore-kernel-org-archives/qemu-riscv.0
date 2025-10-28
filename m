Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E20CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:29:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoRn-0003O9-04; Tue, 28 Oct 2025 14:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoRU-0003IV-BJ
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:29:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoRL-0003b5-Bu
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:29:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-475dd54d7cdso14165615e9.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676135; x=1762280935; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTqEXniC4Ziu9AqtErkRaLa7hxRjuJdoZvomCUqIauw=;
 b=aDWUqVV8D5iQ3Wozzsv6bTLZ2cZYn4Xrc6pIfmo+l3Ny7hUdlrDAipu87txrQjuqGc
 /x9zwZk3LYvV/plBBN2dt2hFBNbtbGtrrmO0yQUUh6yh8g5hl+yR3HQdPIP46ybM9Eg1
 iTqLpNtiTal9PRCgISSC2rSa/umsJCG2h2GGdDbOmy3N4Ni5Ft5gTGKTrjBrvagiLzRi
 z5iN119Ui06IyKTlJw6c/9c17K6pjozJIb0/DGGB5sq1yUQCW6WZBZefa3iBNjDeEKVG
 hp3hb0CKEQij1E6WCSiCl6iihnBRxjmtD8X/RmPHgH/B3mdSuS1Q5jetSwAVEisbI9oI
 M3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676135; x=1762280935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qTqEXniC4Ziu9AqtErkRaLa7hxRjuJdoZvomCUqIauw=;
 b=HEiF0hJZA/vyzLhsDmx+9kXAmqYL5Pl8rY3SYAP+Zy4KCMrk5TmKTqK9l1Qxn05kEH
 5laLofFe9gAomgnklsvHoWFgrgXMwMdlJ+ByAaVbucv++d4Rjw2GsmqDKhSYIjCP8l3f
 AM19wFJ+baDBpenc/Wdw6aqrbajx5HNu9P1Ybp3ECH1c9Sz6gbQcSapT3piVkiZ63Pw9
 RFduHS7dNGN8viOR+JoNP7dW7q5m2JRk/B5jUg2TOfX8UNQ2UGaKbDWIvjpFTYNVAEcR
 IsPHoghEmIpOTSHaiprvCHwuMUAHGiXBaDq614XSAcxoqeeLDvKoG9SxLC7Q7Q+5gt64
 ItPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqv4ha6N2pLpXfaf4miIf6Fv7b1aCuwPfJ5OC38HZTkkh+vUXzLBkx+8lys2gYXI3uPFmTRLikW7cI@nongnu.org
X-Gm-Message-State: AOJu0Yz0UMA9cVcULCXvOO1m+qzNZraROFkqJChBzapnefO2QOaEqMRL
 +Qqxts2e8wKvz6bI9vaR2dcvY58Bq1Wpk0D7K9TJckaFj3C4x/VuXbqcKMT9Y6pLhWg=
X-Gm-Gg: ASbGncv+c9yIV2RYLtSMBdakPmBVaxileXqg8L2hqSH9+cDKDTdj2ByrVFe4W6Hw8h0
 +mKX3y2n9NHIqf3tXaUP8IiNQJtY5gAT3PjyOyrB/g2G7Pi2HcF8hSmFxZwfp1WZSieuYyHIKzc
 0z7uFcJyuQHU34/vgt8pMN2+WTf9II42tQjfcEwIu9nuV2iya6OJW3h8//br8D6jczMMlqzQV6R
 cPe/QszSdVlG/j++QZXRefvA/yQ4MHS1YEoP7HAmNlit42ajzT7icFoVgAh5mub5c5VPRhOlp/V
 iBpEGOTKOPJlsf5F5qV5pZYUI8OAT1qZPuUdrkhNyTYZO+hXzUZxQV2rwvt4PWzZUByMp+rSfyc
 cLc9+rCIulHp7sWvC4FEmwnm8Tn0E2YwicNrRjzoPRTqYBPj4xEd42lLtWU2Jo8F2COm9P2SA1p
 tSkOUcRGrNLcYHLDIkZ3VcOCiGkvQDTUPFhG/PZg/RgmB8UxSo0VIVP0WyDBjJ
X-Google-Smtp-Source: AGHT+IGgEQmNZW/VdvN3gmZwK4t9JcBXVteP83+Z2Xlkr80E9yVxkFA6II8H4a1vEDcjbIXIvUnfIw==
X-Received: by 2002:a05:6000:40cb:b0:428:5673:11e0 with SMTP id
 ffacd0b85a97d-429aefb9d57mr38221f8f.40.1761676134968; 
 Tue, 28 Oct 2025 11:28:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771902981esm23762575e9.9.2025.10.28.11.28.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:28:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 13/25] hw/acpi: Use memory_region_get_address()
Date: Tue, 28 Oct 2025 19:12:47 +0100
Message-ID: <20251028181300.41475-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
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

MemoryRegion::addr is private data of MemoryRegion, use
memory_region_get_address() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/cxl.c                  | 8 ++++++--
 hw/i386/acpi-build.c           | 8 +++++---
 hw/loongarch/virt-acpi-build.c | 4 ++--
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 77c99dfb184..92c032851cc 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -105,6 +105,7 @@ static void cedt_build_chbs(GArray *table_data, PXBCXLDev *cxl)
     PXBDev *pxb = PXB_DEV(cxl);
     SysBusDevice *sbd = SYS_BUS_DEVICE(cxl->cxl_host_bridge);
     MemoryRegion *mr = sysbus_mmio_get_region(sbd, 0);
+    hwaddr container_base_addr = memory_region_get_address(mr->container);
 
     /* Type */
     build_append_int_noprefix(table_data, 0, 1);
@@ -125,7 +126,9 @@ static void cedt_build_chbs(GArray *table_data, PXBCXLDev *cxl)
     build_append_int_noprefix(table_data, 0, 4);
 
     /* Base - subregion within a container that is in PA space */
-    build_append_int_noprefix(table_data, mr->container->addr + mr->addr, 8);
+    build_append_int_noprefix(table_data,
+                              container_base_addr
+                              + memory_region_get_address(mr), 8);
 
     /* Length */
     build_append_int_noprefix(table_data, memory_region_size(mr), 8);
@@ -154,7 +157,8 @@ static void cedt_build_cfmws(CXLFixedWindow *fw, Aml *cedt)
     build_append_int_noprefix(table_data, 0, 4);
 
     /* Base HPA */
-    build_append_int_noprefix(table_data, fw->mr.addr, 8);
+    build_append_int_noprefix(table_data,
+                              memory_region_get_address(&fw->mr), 8);
 
     /* Window Size */
     build_append_int_noprefix(table_data, fw->size, 8);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9446a9f862c..201fdbb39f0 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1039,7 +1039,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             /* Handle the ranges for the PXB expanders */
             if (pci_bus_is_cxl(bus)) {
                 MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
-                uint64_t base = mr->addr;
+                hwaddr base = memory_region_get_address(mr);
 
                 cxl_present = true;
                 crs_range_insert(crs_range_set.mem_ranges, base,
@@ -1822,7 +1822,8 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     /* Capability offset */
     build_append_int_noprefix(table_data, s->pci->capab_offset, 2);
     /* IOMMU base address */
-    build_append_int_noprefix(table_data, s->mr_mmio.addr, 8);
+    build_append_int_noprefix(table_data,
+                              memory_region_get_address(&s->mr_mmio), 8);
     /* PCI Segment Group */
     build_append_int_noprefix(table_data, 0, 2);
     /* IOMMU info */
@@ -1857,7 +1858,8 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     /* Capability offset */
     build_append_int_noprefix(table_data, s->pci->capab_offset, 2);
     /* IOMMU base address */
-    build_append_int_noprefix(table_data, s->mr_mmio.addr, 8);
+    build_append_int_noprefix(table_data,
+                              memory_region_get_address(&s->mr_mmio), 8);
     /* PCI Segment Group */
     build_append_int_noprefix(table_data, 0, 2);
     /* IOMMU info */
diff --git a/hw/loongarch/virt-acpi-build.c b/hw/loongarch/virt-acpi-build.c
index 3694c9827f0..101d083ae6a 100644
--- a/hw/loongarch/virt-acpi-build.c
+++ b/hw/loongarch/virt-acpi-build.c
@@ -409,11 +409,11 @@ static void build_flash_aml(Aml *scope, LoongArchVirtMachineState *lvms)
     hwaddr flash1_size;
 
     flash_mem = pflash_cfi01_get_memory(lvms->flash[0]);
-    flash0_base = flash_mem->addr;
+    flash0_base = memory_region_get_address(flash_mem);
     flash0_size = memory_region_size(flash_mem);
 
     flash_mem = pflash_cfi01_get_memory(lvms->flash[1]);
-    flash1_base = flash_mem->addr;
+    flash1_base = memory_region_get_address(flash_mem);
     flash1_size = memory_region_size(flash_mem);
 
     dev = aml_device("FLS0");
-- 
2.51.0


