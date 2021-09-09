Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOHpw-00025p-CB
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 07:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mOHpr-0001zU-Md
 for qemu-riscv@nongnu.org; Thu, 09 Sep 2021 07:03:17 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mOHpW-0002BL-3t
 for qemu-riscv@nongnu.org; Thu, 09 Sep 2021 07:03:15 -0400
Received: by mail-pl1-x629.google.com with SMTP id j2so832287pll.1
 for <qemu-riscv@nongnu.org>; Thu, 09 Sep 2021 04:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5NHrdIm+qzEtlyJ5qmOFZJqQptyf2xAXatsCGWGnmVg=;
 b=jksOgri3WDNNdm1QMhRhSSkUpmUPQhzHZTMmU6OWBLbWoFYYuFZMAbDfBXOSq9e8VP
 itgpwKTxIfBdzqb71u6I5NVxn3yWOFqwn9bJurq23msOSqkCd32iuXy4qT15vVOnnKnn
 51pDLU3mEpCwytLsMHVZd/xKO/Ll2jVmSTJPOZZFOvC4kofqUZ3HkyaAt15xdu6WArSh
 4QWtN/2PoHcN16W1j2fZwqlYTtbISliMWCtl5ceVVEkMhf/uHwl7mvFo4QQnbNbZ4md2
 ITf1detssPJd+MexnkLbu4MwPBXZCRiQbi90cHFU2hopbkilIWHest5Q0I0ZxlJilJP1
 s0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5NHrdIm+qzEtlyJ5qmOFZJqQptyf2xAXatsCGWGnmVg=;
 b=IFHHcoA3IJVj39+mVoGjJE3u/a5KRzFAjBj9A9HuKT1RZEEuJXgDyKftrOoxz4//fn
 P1VkxgP1wYwZo39p4MW+0ngThyPxCX0pH6wN4LoyPSGLPWVRiB6HJcq5wEXF5Lt6gSSB
 sTTzE0AFk4JP/xzldbQDxNFVAWue3O1CWqCAmZ6tt6yMTT+zB8GfUczW0s3G1Hb1L48M
 JFnsLK9GOmLACzyb2YYPa1kd1PXVs1HhOFw4XHRM9wiDMBS3wtKmJX6oEZhBBaHvmAG8
 4I2sVzN7elys1a1AzJseeYhvgDoyk1mDoxhKhVzoE1A020jELC9+Yv5YulOVEod+d60h
 EF1w==
X-Gm-Message-State: AOAM532sBZcJyBBsH8Zo5FWFOczlcPcl2ZPdXH7k3k3uQ9F3rVRojcWg
 4zRAt6CUSnx3w1flcRpJxVDsGw==
X-Google-Smtp-Source: ABdhPJyqud9WxjT1wj9eeo8X7eSwy7aorjd3b1bZuxyxeeQLZM6xSAzWcShmx26nkHb+UfhkXJNBaQ==
X-Received: by 2002:a17:902:7d82:b0:13a:110a:842c with SMTP id
 a2-20020a1709027d8200b0013a110a842cmr2201606plm.36.1631185372616; 
 Thu, 09 Sep 2021 04:02:52 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.198.246])
 by smtp.googlemail.com with ESMTPSA id g19sm1894103pjl.25.2021.09.09.04.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 04:02:52 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [RFC PATCH v1 2/3] hw/pci: Add PCIe RCEC support
Date: Thu,  9 Sep 2021 16:32:20 +0530
Message-Id: <20210909110221.703-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210909110221.703-1-mchitale@ventanamicro.com>
References: <20210909110221.703-1-mchitale@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Sep 2021 11:03:17 -0000

This patch adds support for PCIe Root Complex Event Collector
(RCEC) emulation. Further, if a RCiEP supports AER capability
then a mapping is created for that RCiEP in the RCEC's
endpoint association capability.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 hw/pci/meson.build         |   2 +-
 hw/pci/pcie.c              |  18 ++++++
 hw/pci/pcie_aer.c          |   9 +++
 hw/pci/pcie_rcec.c         | 119 +++++++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h       |   1 +
 include/hw/pci/pci_ids.h   |   1 +
 include/hw/pci/pcie.h      |   1 +
 include/hw/pci/pcie_regs.h |   3 +
 8 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 hw/pci/pcie_rcec.c

diff --git a/hw/pci/meson.build b/hw/pci/meson.build
index 5c4bbac817..34ae7d4a44 100644
--- a/hw/pci/meson.build
+++ b/hw/pci/meson.build
@@ -11,7 +11,7 @@ pci_ss.add(files(
 # The functions in these modules can be used by devices too.  Since we
 # allow plugging PCIe devices into PCI buses, include them even if
 # CONFIG_PCI_EXPRESS=n.
-pci_ss.add(files('pcie.c', 'pcie_aer.c'))
+pci_ss.add(files('pcie.c', 'pcie_aer.c', 'pcie_rcec.c'))
 softmmu_ss.add(when: 'CONFIG_PCI_EXPRESS', if_true: files('pcie_port.c', 'pcie_host.c'))
 softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
 
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 017d5075ae..55938a1798 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -747,6 +747,24 @@ void pcie_cap_slot_push_attention_button(PCIDevice *dev)
     pcie_cap_slot_event(dev, PCI_EXP_HP_EV_ABP);
 }
 
+void pcie_rcec_ep_map(PCIDevice *dev)
+{
+    int devnum = PCI_SLOT(dev->devfn);
+    uint32_t ep_bitmap;
+    PCIDevice *rcec;
+    uint16_t cap;
+
+    /* RCEC is always expected to be at 00:01.0 */
+    rcec = pci_find_device(pci_get_bus(dev), 0, PCI_DEVFN(1,0));
+    if (!rcec)
+        return;
+
+    pcie_cap_deverr_init(dev);
+    cap = pcie_find_capability(rcec, PCI_EXT_CAP_ID_RCEC);
+    ep_bitmap = pci_get_long(rcec->config + cap + 0x4);
+    pci_set_long(rcec->config + cap + 0x4, ep_bitmap | 1 << devnum);
+}
+
 /* root control/capabilities/status. PME isn't emulated for now */
 void pcie_cap_root_init(PCIDevice *dev)
 {
diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 27f9cc56af..ba4a1e6d78 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -166,6 +166,15 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
         /* nothing */
         break;
     }
+
+    /*
+     * If this is a RCiEP, map it into the RCEC's endpoint association bitmap
+     * capability
+     */
+    if (pci_bus_is_express(pci_get_bus(dev))
+        && pci_bus_is_root(pci_get_bus(dev)))
+	    pcie_rcec_ep_map(dev);
+
     return 0;
 }
 
diff --git a/hw/pci/pcie_rcec.c b/hw/pci/pcie_rcec.c
new file mode 100644
index 0000000000..9a51d7b9b4
--- /dev/null
+++ b/hw/pci/pcie_rcec.c
@@ -0,0 +1,119 @@
+/*
+ * pcie_rcec.c
+ * PCIe Root Complex Event Collector emulation
+ *
+ * Copyright (c) 2021 Mayuresh Chitale <mchitale@ventanamicro.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/module.h"
+#include "qemu/range.h"
+#include "sysemu/sysemu.h"
+#include "hw/hw.h"
+#include "hw/pci/pci.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+
+#define TYPE_RCEC_DEVICE "pcie-rcec"
+#define PCIE_RCEC_EXP_CAP_OFF 0x40
+#define PCIE_RCEC_EP_ECAP_OFF 0x100
+#define PCIE_RCEC_AER_ECAP_OFF 0x120
+
+struct RcecState {
+    /*< private >*/
+    PCIDevice parent_obj;
+    /*< public >*/
+};
+
+
+static int pcie_rcec_cap_init(PCIDevice *dev, uint8_t offset)
+{
+    int rc;
+
+    dev->config[PCI_INTERRUPT_PIN] = 1;
+    rc = pcie_endpoint_cap_common_init(dev, offset,
+            PCI_EXP_VER2_SIZEOF, PCI_EXP_TYPE_RC_EC);
+    pcie_cap_root_init(dev);
+    pcie_cap_deverr_init(dev);
+
+    return rc;
+}
+
+static void pcie_rcec_ep_cap_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
+                  uint16_t size, Error **errp)
+{
+    pcie_add_capability(dev, PCI_EXT_CAP_ID_RCEC, cap_ver, offset, size);
+    /* Map device (bit) 1 which is RCEC by default */
+    pci_set_long(dev->config + offset + 0x4, 0x2);
+}
+
+static void pcie_rcec_realize(PCIDevice *pci_dev, Error **errp)
+{
+    if (pcie_rcec_cap_init(pci_dev, PCIE_RCEC_EXP_CAP_OFF) < 0)
+        hw_error("Failed to initialize RCEC express capability");
+
+    pcie_rcec_ep_cap_init(pci_dev, PCI_RCEC_EP_VER, PCIE_RCEC_EP_ECAP_OFF,
+        PCI_RCEC_EP_SIZEOF, errp);
+
+    if (pcie_aer_init(pci_dev, PCI_ERR_VER, PCIE_RCEC_AER_ECAP_OFF,
+        PCI_ERR_SIZEOF, errp) < 0)
+        hw_error("Failed to initialize RCEC AER capability");
+}
+
+static const VMStateDescription vmstate_rcec = {
+    .name = "rcec",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(parent_obj, struct RcecState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void rcec_class_init(ObjectClass *klass, void *data)
+{
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->desc = "QEMU generic RCEC";
+    dc->vmsd = &vmstate_rcec;
+    k->vendor_id = PCI_VENDOR_ID_REDHAT;
+    k->device_id = PCI_DEVICE_ID_REDHAT_RCEC;
+    k->revision = 0;
+    k->class_id = PCI_CLASS_SYSTEM_RCEC;
+    k->realize = pcie_rcec_realize;
+}
+
+static const TypeInfo pcie_rcec_info = {
+    .name = TYPE_RCEC_DEVICE,
+    .parent = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(struct RcecState),
+    .class_init = rcec_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { },
+    },
+};
+
+
+static void pcie_rcec_register_types(void)
+{
+    type_register_static(&pcie_rcec_info);
+}
+
+type_init(pcie_rcec_register_types)
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d0f4266e37..d580c9e6cf 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -109,6 +109,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
 #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
+#define PCI_DEVICE_ID_REDHAT_RCEC        0x0101
 
 #define FMT_PCIBUS                      PRIx64
 
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11abe22d46..d5214d2764 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -88,6 +88,7 @@
 #define PCI_CLASS_SYSTEM_RTC             0x0803
 #define PCI_CLASS_SYSTEM_PCI_HOTPLUG     0x0804
 #define PCI_CLASS_SYSTEM_SDHCI           0x0805
+#define PCI_CLASS_SYSTEM_RCEC            0x0807
 #define PCI_CLASS_SYSTEM_OTHER           0x0880
 
 #define PCI_BASE_CLASS_INPUT             0x09
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index b40b088604..482fefe704 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -149,4 +149,5 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
                                      DeviceState *dev, Error **errp);
 int pcie_endpoint_cap_common_init(PCIDevice *dev, uint8_t offset,
                                          uint8_t cap_size, uint8_t type);
+void pcie_rcec_ep_map(PCIDevice *dev);
 #endif /* QEMU_PCIE_H */
diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
index 1db86b0ec4..7b8f2616e9 100644
--- a/include/hw/pci/pcie_regs.h
+++ b/include/hw/pci/pcie_regs.h
@@ -179,4 +179,7 @@ typedef enum PCIExpLinkWidth {
 #define PCI_ACS_VER                     0x1
 #define PCI_ACS_SIZEOF                  8
 
+#define PCI_RCEC_EP_VER        1
+#define PCI_RCEC_EP_SIZEOF     0x8
+
 #endif /* QEMU_PCIE_REGS_H */
-- 
2.17.1


