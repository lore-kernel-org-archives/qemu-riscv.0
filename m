Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06847CD98F6
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 04:52:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1waRAY-0008PX-GL; Fri, 19 Jun 2026 00:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAR-0008N4-Ts
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:24 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAM-0005LF-Pl
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:23 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-84236f9b638so822403b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2026 21:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781844555; x=1782449355; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezWe0V+hpQoz0afaQTtTPcXO97/IEavyT3oijSMGGmM=;
 b=ef/f4pS8NILwBcv9V4lnJKeIXiN9zZ/dduqbvkc126diISak1wyMoEaM0yOSRT3gCI
 hJgonAsu4RkTXxaiV1MBd4RowWKckm15fln614aXpJ0aF2IP8eyHNiWEpU5eGMwrNvvE
 zQ4PHPHdeb0CYojvRz5YlpDSKCE5bejOFgJNZIrHDoGlOFd8+8ajtMRd3lSiCPMkfIWC
 /pA8gpBPlJ11I6vDRGXfWmKL4R0AjvFxpcveNSKZnbTG+FsOOXCOLwhErl3mmkGJwbPe
 QiqGwa6qqw3uKOoT12VBdq6A5FkUHI1idNNolbmHRHCJ8LGKkiN6RoAlHsccLW255IcP
 7kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781844555; x=1782449355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ezWe0V+hpQoz0afaQTtTPcXO97/IEavyT3oijSMGGmM=;
 b=pmLFmHIYyo6gwSrI5GZYPkIK+da0gv5pfQ/xTHBuJw5MMVsZWFPa2iAow1A23c9ldn
 1hfzpV3yOX/vemoZJZk+melAQKsGQu7gSzN5yxQGIE6n+1hf1ewooPu9tP4jL5imYRbo
 O6+JQXkCzacVVVx3funoW2VNTtJYi2JoSNwzltKkghKjk2h8hcNhm+ksJQFtJ+pfaN06
 K8KNJthaNWETWdq3B8FuKe6lEE40DR3wWjgOhG5F2qkTTF5wgkmOKNps4UMp3iTal3xV
 O/rZVRbXvb1JHqaduOqZrkcHJp7Ts68HaR5RKFgo6rRDDEcxFiSK4elFBAT7cO+DILrl
 NKIA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9KV6OTOfsRXH8xAcj/KbodoT3Y2VeHDuyxo8v2n+a9n99/uv0iQTtsTg2s+2qtw3Rtgrcam+PnvAWQ@nongnu.org
X-Gm-Message-State: AOJu0Yzv/B6y3M6/q52SwIb/w1/fV4lvEFtQvLh12nBwopWYEt9VmOIU
 +woAAnGEvMjHe3UPp/CGIgN3Dh1JeCHhvevUBpn8ZLZiqpI/re2Xb10M
X-Gm-Gg: AfdE7cln4IXKMK+f0/KNDuMdtDfVgDBkXOvC+fvZTRRuSvYB5XWdF+6Bj3mb9KV2j2/
 01F6ApfF6HZDfWG2VqwniacW8JdYT3FsxAMjCx8ZeeMbXNVBN7ccO6G9WHsOGO4o9BL63Ckvp+N
 +ULb2hjosVPYl2unBTGBD5g9ftFxzDt0f4tFXlM/7SUBDrapCK9Gj3YhgwEZ4RrfT5IX0SH4Cj5
 JgmAJCfXw80eWwd1JBMIykODkK1WIaIZHPQsUfAyuHHUZPXRtf0Pljy1MZ8bk4CdROGma9T0IKy
 T90NZJwC1I91B53kKWGu1e5js/MlnpRWp7ksGt0dktGGs86Hk465LAiPcwxuAKUCY9WyJ8B8ODr
 j3JLZTEaZA0XJ0Pv68xfPmFxpUqpcQcFfQkIj/xc7nkZah1ssWVw1remExGlJ/H6y3yz9+ixAkT
 012YnyfW4mTeFPHB2AlgqjuNvJeOJsiS5nahsZw887jx2NDFS4FzM2ITyuHAGt/iij73KhA3Ot4
 oF1C66EITQTAu5n+TI6zZmViRJQpRiM/tGHVryySA==
X-Received: by 2002:a05:6a00:1f11:b0:82f:48e:241c with SMTP id
 d2e1a72fcca58-845508860d7mr1874925b3a.23.1781844555285; 
 Thu, 18 Jun 2026 21:49:15 -0700 (PDT)
Received: from donnager-debian.. ([144.6.172.18])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8455363da44sm870141b3a.8.2026.06.18.21.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 21:49:14 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chris Rauer <crauer@google.com>, Alano Song <alanosong@163.com>,
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>,
 Nick Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 Nutty Liu <nutty.liu@hotmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v9 03/12] hw/riscv/virt: Move AIA initialisation to helper file
Date: Fri, 19 Jun 2026 14:18:27 +0930
Message-ID: <20260619044838.1054677-4-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619044838.1054677-1-joel@jms.id.au>
References: <20260619044838.1054677-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The AIA init will be used by any server class riscv machine. Separate it
out in order to share code with such systems.

The virt machine keeps machine specific #defines such as
VIRT_IRQCHIP_NUM_MSIS, VIRT_IRQCHIP_NUM_PRIO_BITS.

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/aia.h             | 26 +++++++++++
 include/hw/riscv/virt.h    |  1 -
 hw/riscv/aia.c             | 89 ++++++++++++++++++++++++++++++++++++++
 hw/riscv/virt-acpi-build.c |  2 +
 hw/riscv/virt.c            | 87 +++++--------------------------------
 hw/riscv/meson.build       |  1 +
 6 files changed, 129 insertions(+), 77 deletions(-)
 create mode 100644 hw/riscv/aia.h
 create mode 100644 hw/riscv/aia.c

diff --git a/hw/riscv/aia.h b/hw/riscv/aia.h
new file mode 100644
index 000000000000..dbb833340276
--- /dev/null
+++ b/hw/riscv/aia.h
@@ -0,0 +1,26 @@
+/*
+ * QEMU RISC-V Advanced Interrupt Architecture (AIA)
+ *
+ * Copyright (C) 2019 Western Digital Corporation or its affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_RISCV_AIA_H
+#define HW_RISCV_AIA_H
+
+#include "exec/hwaddr.h"
+
+#define VIRT_IRQCHIP_NUM_SOURCES 96
+
+uint32_t imsic_num_bits(uint32_t count);
+
+DeviceState *riscv_create_aia(bool msimode, int aia_guests,
+                             const MemMapEntry *aplic_m,
+                             const MemMapEntry *aplic_s,
+                             const MemMapEntry *imsic_m,
+                             const MemMapEntry *imsic_s,
+                             int socket, int base_hartid, int hart_count,
+                             uint32_t num_msis, uint32_t num_prio_bits);
+
+#endif
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 18a2a323a344..ad858deb76ad 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -135,7 +135,6 @@ enum {
 bool virt_is_acpi_enabled(RISCVVirtState *s);
 bool virt_is_iommu_sys_enabled(RISCVVirtState *s);
 void virt_acpi_setup(RISCVVirtState *vms);
-uint32_t imsic_num_bits(uint32_t count);
 
 /*
  * The virt machine physical address space used by some of the devices
diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
new file mode 100644
index 000000000000..c724612a50a5
--- /dev/null
+++ b/hw/riscv/aia.c
@@ -0,0 +1,89 @@
+/*
+ * QEMU RISC-V Advanced Interrupt Architecture (AIA)
+ *
+ * Copyright (C) 2019 Western Digital Corporation or its affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "system/kvm.h"
+#include "hw/intc/riscv_aplic.h"
+#include "hw/intc/riscv_imsic.h"
+
+#include "aia.h"
+
+uint32_t imsic_num_bits(uint32_t count)
+{
+    uint32_t ret = 0;
+
+    while (BIT(ret) < count) {
+        ret++;
+    }
+
+    return ret;
+}
+
+DeviceState *riscv_create_aia(bool msimode, int aia_guests,
+                             const MemMapEntry *aplic_m,
+                             const MemMapEntry *aplic_s,
+                             const MemMapEntry *imsic_m,
+                             const MemMapEntry *imsic_s,
+                             int socket, int base_hartid, int hart_count,
+                             uint32_t num_msis, uint32_t num_prio_bits)
+{
+    int i;
+    hwaddr addr = 0;
+    uint32_t guest_bits;
+    DeviceState *aplic_s_dev = NULL;
+    DeviceState *aplic_m_dev = NULL;
+
+    if (msimode) {
+        if (!kvm_enabled()) {
+            /* Per-socket M-level IMSICs */
+            addr = imsic_m->base + socket * (1U << IMSIC_MMIO_GROUP_MIN_SHIFT);
+            for (i = 0; i < hart_count; i++) {
+                riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
+                                   base_hartid + i, true, 1,
+                                   num_msis);
+            }
+        }
+
+        /* Per-socket S-level IMSICs */
+        guest_bits = imsic_num_bits(aia_guests + 1);
+        addr = imsic_s->base + socket * (1U << IMSIC_MMIO_GROUP_MIN_SHIFT);
+        for (i = 0; i < hart_count; i++) {
+            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(guest_bits),
+                               base_hartid + i, false, 1 + aia_guests,
+                               num_msis);
+        }
+    }
+
+    if (!kvm_enabled()) {
+        /* Per-socket M-level APLIC */
+        aplic_m_dev = riscv_aplic_create(aplic_m->base +
+                                     socket * aplic_m->size,
+                                     aplic_m->size,
+                                     (msimode) ? 0 : base_hartid,
+                                     (msimode) ? 0 : hart_count,
+                                     VIRT_IRQCHIP_NUM_SOURCES,
+                                     num_prio_bits,
+                                     msimode, true, NULL);
+    }
+
+    /* Per-socket S-level APLIC */
+    aplic_s_dev = riscv_aplic_create(aplic_s->base +
+                                 socket * aplic_s->size,
+                                 aplic_s->size,
+                                 (msimode) ? 0 : base_hartid,
+                                 (msimode) ? 0 : hart_count,
+                                 VIRT_IRQCHIP_NUM_SOURCES,
+                                 num_prio_bits,
+                                 msimode, false, aplic_m_dev);
+
+    if (kvm_enabled() && msimode) {
+        riscv_aplic_set_kvm_msicfgaddr(RISCV_APLIC(aplic_s_dev), addr);
+    }
+
+    return kvm_enabled() ? aplic_s_dev : aplic_m_dev;
+}
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 413d47d70ef1..e3da87492408 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -42,6 +42,8 @@
 #include "system/kvm.h"
 #include "system/reset.h"
 
+#include "aia.h"
+
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 #define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3b716509c448..84480da2953b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -61,6 +61,8 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/uefi/var-service-api.h"
 
+#include "aia.h"
+
 /* KVM AIA only supports APLIC MSI. APLIC Wired is always emulated by QEMU. */
 static bool virt_use_kvm_aia_aplic_imsic(RISCVVirtAIAType aia_type)
 {
@@ -388,17 +390,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     }
 }
 
-uint32_t imsic_num_bits(uint32_t count)
-{
-    uint32_t ret = 0;
-
-    while (BIT(ret) < count) {
-        ret++;
-    }
-
-    return ret;
-}
-
 static void create_fdt_one_imsic(RISCVVirtState *s, hwaddr base_addr,
                                  uint32_t *intc_phandles, uint32_t msi_phandle,
                                  bool m_mode, uint32_t imsic_guest_bits)
@@ -1163,68 +1154,6 @@ static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
              memmap[VIRT_PLIC].size);
 }
 
-static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
-                                    const MemMapEntry *memmap, int socket,
-                                    int base_hartid, int hart_count)
-{
-    int i;
-    hwaddr addr = 0;
-    uint32_t guest_bits;
-    DeviceState *aplic_s = NULL;
-    DeviceState *aplic_m = NULL;
-    bool msimode = aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
-
-    if (msimode) {
-        if (!kvm_enabled()) {
-            /* Per-socket M-level IMSICs */
-            addr = memmap[VIRT_IMSIC_M].base +
-                   socket * VIRT_IMSIC_GROUP_MAX_SIZE;
-            for (i = 0; i < hart_count; i++) {
-                riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
-                                   base_hartid + i, true, 1,
-                                   VIRT_IRQCHIP_NUM_MSIS);
-            }
-        }
-
-        /* Per-socket S-level IMSICs */
-        guest_bits = imsic_num_bits(aia_guests + 1);
-        addr = memmap[VIRT_IMSIC_S].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
-        for (i = 0; i < hart_count; i++) {
-            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(guest_bits),
-                               base_hartid + i, false, 1 + aia_guests,
-                               VIRT_IRQCHIP_NUM_MSIS);
-        }
-    }
-
-    if (!kvm_enabled()) {
-        /* Per-socket M-level APLIC */
-        aplic_m = riscv_aplic_create(memmap[VIRT_APLIC_M].base +
-                                     socket * memmap[VIRT_APLIC_M].size,
-                                     memmap[VIRT_APLIC_M].size,
-                                     (msimode) ? 0 : base_hartid,
-                                     (msimode) ? 0 : hart_count,
-                                     VIRT_IRQCHIP_NUM_SOURCES,
-                                     VIRT_IRQCHIP_NUM_PRIO_BITS,
-                                     msimode, true, NULL);
-    }
-
-    /* Per-socket S-level APLIC */
-    aplic_s = riscv_aplic_create(memmap[VIRT_APLIC_S].base +
-                                 socket * memmap[VIRT_APLIC_S].size,
-                                 memmap[VIRT_APLIC_S].size,
-                                 (msimode) ? 0 : base_hartid,
-                                 (msimode) ? 0 : hart_count,
-                                 VIRT_IRQCHIP_NUM_SOURCES,
-                                 VIRT_IRQCHIP_NUM_PRIO_BITS,
-                                 msimode, false, aplic_m);
-
-    if (kvm_enabled() && msimode) {
-        riscv_aplic_set_kvm_msicfgaddr(RISCV_APLIC(aplic_s), addr);
-    }
-
-    return kvm_enabled() ? aplic_s : aplic_m;
-}
-
 static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
 {
     DeviceState *dev;
@@ -1487,9 +1416,15 @@ static void virt_machine_init(MachineState *machine)
             s->irqchip[i] = virt_create_plic(s->memmap, i,
                                              base_hartid, hart_count);
         } else {
-            s->irqchip[i] = virt_create_aia(s->aia_type, s->aia_guests,
-                                            s->memmap, i, base_hartid,
-                                            hart_count);
+            s->irqchip[i] = riscv_create_aia(s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC,
+                                             s->aia_guests,
+                                             &s->memmap[VIRT_APLIC_M],
+                                             &s->memmap[VIRT_APLIC_S],
+                                             &s->memmap[VIRT_IMSIC_M],
+                                             &s->memmap[VIRT_IMSIC_S],
+                                             i, base_hartid, hart_count,
+                                             VIRT_IRQCHIP_NUM_MSIS,
+                                             VIRT_IRQCHIP_NUM_PRIO_BITS);
         }
 
         /* Try to use different IRQCHIP instance based device type */
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index b70a054579ae..798477b7882a 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -1,4 +1,5 @@
 riscv_ss = ss.source_set()
+riscv_ss.add(files('aia.c'))
 riscv_ss.add(files('boot.c'))
 riscv_ss.add(files('fdt-common.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
-- 
2.47.3


