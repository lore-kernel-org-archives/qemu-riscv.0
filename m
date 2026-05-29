Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA01ACD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 12:51:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSwg7-0004qS-Av; Fri, 29 May 2026 08:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>) id 1wSwg5-0004oK-Gr
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 08:51:05 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>) id 1wSwg3-0006Hs-HQ
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 08:51:05 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-36b88b76318so1062867a91.2
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780059062; x=1780663862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s0L4tLl7I6tkMcpsKUvTPNAYZl4B+x0G3/28gkcjtDM=;
 b=kFc/YFMq6bZ7Gaw6JGpdxJGMk+Od+6lT06RyzU5rgbxm4MIgNoDlPmOPvc5/DoPKFz
 2jCQyowbDgH9EVaovjRHhy2Q6EdvgwkBNpheXhYhou97zhylG+idhPLh9MpaEyxgEGf2
 73jd5YBYdQOxe8Ub9kkcvY5/jvp2R1371XmS/+7UjWCxuhA9XY9DmVp5dK71yJXsFRmD
 bkSaqqdm0vgEpvm/THiz4QqD7oZGMCs+Is4dLK6+NEhhvLoJXN0irE3YmsV3GkKwtD21
 xE5Rxf6LXH98H+VRuUn5Qyi3jezEqqRqtlLxpSx8l1Rvi57Ti2iEsXTq30luryq8JPap
 AnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780059062; x=1780663862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s0L4tLl7I6tkMcpsKUvTPNAYZl4B+x0G3/28gkcjtDM=;
 b=DtS2cGWP+qoEib2vUlOeBZ41iP1J/VHmYJf1JTG6ymdVo6UXbAor76zRrGkflWlpbn
 twfYlEOxedAzdvFCByqmau8ZdBUao04t3VPYHB/bbVozJF6+SlIqq4XEHuZskqXvDx+N
 w3OgsEu2wUzmvMik29E34PL+BXpFPTUX8CJny/YPqBIQLhs+hQ6YjvYNvH0bTWUwdlhk
 SBfod8kbrgIRqegnuCevfSma3jM9ITRWsCgpQnS5BNSjZK2rnt3W0FS5GhwJ1cz1/Nvb
 v5mKZMvBJ2+oJyVLnLLqxTn+HMHIKIy14r+3MDpJMQWZ8N9EjXa1yxuOHYaKP/BN24XY
 6DpQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+OqyYA8Cd+DuSsBRJqWrj5IVm3mL3Z6w/Hnc8hlnzyK6SioR33HEhzdUBCpwphDyVtX8fq2dTFWdBM@nongnu.org
X-Gm-Message-State: AOJu0Ywvq79rmjJU9mgkYHkHmr5UpotVx4PX0lrne4CeULv4EHtnTmia
 TAuo+wIv8DAiHlmTAWRQ+fH+RY8ml4Q8cCi7MbYKyCJFwURReiowiefb
X-Gm-Gg: Acq92OFhAAyZv1+xg3szz69u72EpK4QIdkU5oasvPMRZqVKY57QN//Rukwr56N+ltpr
 nFXtTiczMUyfUOHkBr7Q64KJ3wJmJRxnumgss07bVxe2doG2xAfqxfstQ5C4Fxby3HbWje81Gof
 vySvp8yEEUL/NCF6xSH8NOcPREgU5DtGac8dbtjaVqG4ur1kDBug+67Vgc0niyn+k5/uqOqpYq6
 OXT2TI2ZC/Q6NnwOkQexdKmUaQTPU43iOw4egXUunqlPoV7O7gf7FeyIM5IfEEVQYgT1crrGJrG
 0SGZ8U957XJZNqYDUXIJ52GwxoV3hXU1OVtF0+MryJgP/UwRIxgBPcGOdtbL2sh9lGjU3cZR7Gv
 35JAeROMgBvzFoK8KAwLIhzcqhGVs+dNyYfkVpJNGaSVmMdxmeSTxIYIigAYzYhMW9cKKT/alTx
 KZzXqdAeBHfArRJm6MnPAJlQQZ3CmEz/1z89smXmWlZL6U7fxpsawO2SKee92MFE4qWhvG8lR+p
 L96fnJn7X+p4ogJNIc=
X-Received: by 2002:a17:90b:184b:b0:366:479e:63a5 with SMTP id
 98e67ed59e1d1-36bbcc160f0mr3504077a91.2.1780059062043; 
 Fri, 29 May 2026 05:51:02 -0700 (PDT)
Received: from localhost (124.158.97.178.qld.leaptel.network. [124.158.97.178])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc6a34ca9sm1823751a91.9.2026.05.29.05.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 05:51:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Nutty Liu <nutty.liu@hotmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 04/10] hw/riscv/aia: Provide number of irq sources
Date: Fri, 29 May 2026 05:50:29 -0700
Message-ID: <20260529125036.728206-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529125036.728206-1-npiggin@gmail.com>
References: <20260529125036.728206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Joel Stanley <joel@jms.id.au>

Instead of hard coding the number of IRQ sources used by the APLIC pass
it in as a parameter. This allows other machines to configure this as
required.

The maximum number of sources is 1023.

Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/riscv/aia.c             |  8 ++++++--
 hw/riscv/aia.h             |  3 +--
 hw/riscv/virt-acpi-build.c | 25 ++++++++++++++++---------
 hw/riscv/virt.c            |  2 ++
 include/hw/riscv/virt.h    |  1 +
 5 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
index c724612a50..82ea9d48ea 100644
--- a/hw/riscv/aia.c
+++ b/hw/riscv/aia.c
@@ -25,6 +25,7 @@ uint32_t imsic_num_bits(uint32_t count)
 }
 
 DeviceState *riscv_create_aia(bool msimode, int aia_guests,
+                             uint16_t num_sources,
                              const MemMapEntry *aplic_m,
                              const MemMapEntry *aplic_s,
                              const MemMapEntry *imsic_m,
@@ -38,6 +39,9 @@ DeviceState *riscv_create_aia(bool msimode, int aia_guests,
     DeviceState *aplic_s_dev = NULL;
     DeviceState *aplic_m_dev = NULL;
 
+    /* The RISC-V Advanced Interrupt Architecture, Chapter 1.2. Limits */
+    g_assert(num_sources <= 1023);
+
     if (msimode) {
         if (!kvm_enabled()) {
             /* Per-socket M-level IMSICs */
@@ -66,7 +70,7 @@ DeviceState *riscv_create_aia(bool msimode, int aia_guests,
                                      aplic_m->size,
                                      (msimode) ? 0 : base_hartid,
                                      (msimode) ? 0 : hart_count,
-                                     VIRT_IRQCHIP_NUM_SOURCES,
+                                     num_sources,
                                      num_prio_bits,
                                      msimode, true, NULL);
     }
@@ -77,7 +81,7 @@ DeviceState *riscv_create_aia(bool msimode, int aia_guests,
                                  aplic_s->size,
                                  (msimode) ? 0 : base_hartid,
                                  (msimode) ? 0 : hart_count,
-                                 VIRT_IRQCHIP_NUM_SOURCES,
+                                 num_sources,
                                  num_prio_bits,
                                  msimode, false, aplic_m_dev);
 
diff --git a/hw/riscv/aia.h b/hw/riscv/aia.h
index dbb8333402..5ad0a902be 100644
--- a/hw/riscv/aia.h
+++ b/hw/riscv/aia.h
@@ -11,11 +11,10 @@
 
 #include "exec/hwaddr.h"
 
-#define VIRT_IRQCHIP_NUM_SOURCES 96
-
 uint32_t imsic_num_bits(uint32_t count);
 
 DeviceState *riscv_create_aia(bool msimode, int aia_guests,
+                             uint16_t num_sources,
                              const MemMapEntry *aplic_m,
                              const MemMapEntry *aplic_s,
                              const MemMapEntry *imsic_m,
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index e3da874924..db3ea4f03a 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -146,6 +146,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
 }
 
 static void acpi_dsdt_add_plic_aplic(Aml *scope, uint8_t socket_count,
+                                     uint16_t num_sources,
                                      uint64_t mmio_base, uint64_t mmio_size,
                                      const char *hid)
 {
@@ -153,9 +154,12 @@ static void acpi_dsdt_add_plic_aplic(Aml *scope, uint8_t socket_count,
     uint32_t gsi_base;
     uint8_t  socket;
 
+    /* The RISC-V Advanced Interrupt Architecture, Chapter 1.2. Limits */
+    g_assert(num_sources <= 1023);
+
     for (socket = 0; socket < socket_count; socket++) {
         plic_aplic_addr = mmio_base + mmio_size * socket;
-        gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
+        gsi_base = num_sources * socket;
         Aml *dev = aml_device("IC%.02X", socket);
         aml_append(dev, aml_name_decl("_HID", aml_string("%s", hid)));
         aml_append(dev, aml_name_decl("_UID", aml_int(socket)));
@@ -474,10 +478,13 @@ static void build_dsdt(GArray *table_data,
     socket_count = riscv_socket_count(ms);
 
     if (s->aia_type == VIRT_AIA_TYPE_NONE) {
-        acpi_dsdt_add_plic_aplic(scope, socket_count, memmap[VIRT_PLIC].base,
-                                 memmap[VIRT_PLIC].size, "RSCV0001");
+        acpi_dsdt_add_plic_aplic(scope, socket_count, s->num_sources,
+                                 memmap[VIRT_PLIC].base,
+                                 memmap[VIRT_PLIC].size,
+                                 "RSCV0001");
     } else {
-        acpi_dsdt_add_plic_aplic(scope, socket_count, memmap[VIRT_APLIC_S].base,
+        acpi_dsdt_add_plic_aplic(scope, socket_count, s->num_sources,
+                                 memmap[VIRT_APLIC_S].base,
                                  memmap[VIRT_APLIC_S].size, "RSCV0002");
     }
 
@@ -494,15 +501,15 @@ static void build_dsdt(GArray *table_data,
     } else if (socket_count == 2) {
         virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
                              memmap[VIRT_VIRTIO].size,
-                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
+                             VIRTIO_IRQ + s->num_sources, 0,
                              VIRTIO_COUNT);
-        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + s->num_sources);
     } else {
         virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
                              memmap[VIRT_VIRTIO].size,
-                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
+                             VIRTIO_IRQ + s->num_sources, 0,
                              VIRTIO_COUNT);
-        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES * 2);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + s->num_sources * 2);
     }
 
     aml_append(dsdt, scope);
@@ -581,7 +588,7 @@ static void build_madt(GArray *table_data,
         for (socket = 0; socket < riscv_socket_count(ms); socket++) {
             aplic_addr = s->memmap[VIRT_APLIC_S].base +
                              s->memmap[VIRT_APLIC_S].size * socket;
-            gsi_base = VIRT_IRQCHIP_NUM_SOURCES * socket;
+            gsi_base = s->num_sources * socket;
             build_append_int_noprefix(table_data, 0x1A, 1);    /* Type */
             build_append_int_noprefix(table_data, 36, 1);      /* Length */
             build_append_int_noprefix(table_data, 1, 1);       /* Version */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 614220a0ce..4cd941a6aa 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1549,6 +1549,7 @@ static void virt_machine_init(MachineState *machine)
         } else {
             s->irqchip[i] = riscv_create_aia(s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC,
                                              s->aia_guests,
+                                             s->num_sources,
                                              &s->memmap[VIRT_APLIC_M],
                                              &s->memmap[VIRT_APLIC_S],
                                              &s->memmap[VIRT_IMSIC_M],
@@ -1705,6 +1706,7 @@ static void virt_machine_instance_init(Object *obj)
     s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     s->acpi = ON_OFF_AUTO_AUTO;
     s->iommu_sys = ON_OFF_AUTO_AUTO;
+    s->num_sources = VIRT_IRQCHIP_NUM_SOURCES;
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index ad858deb76..36a2def410 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -64,6 +64,7 @@ struct RISCVVirtState {
     struct GPEXHost *gpex_host;
     OnOffAuto iommu_sys;
     uint16_t pci_iommu_bdf;
+    uint16_t num_sources;
 };
 
 enum {
-- 
2.53.0


