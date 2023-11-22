Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD307C072A2
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 05:34:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5fsY-0006wn-9C; Wed, 22 Nov 2023 00:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1r5fsW-0006wB-17; Wed, 22 Nov 2023 00:34:24 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1r5fsL-0006bi-Qz; Wed, 22 Nov 2023 00:34:23 -0500
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 3AM5XOnW023743;
 Wed, 22 Nov 2023 13:33:24 +0800 (+08)
 (envelope-from ethan84@andestech.com)
Received: from ethan84-VirtualBox.andestech.com (10.0.12.51) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; 
 Wed, 22 Nov 2023 13:33:20 +0800
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <edgar.iglesias@gmail.com>,
 <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <in.meng@windriver.com>, <liweiwei@iscas.ac.cn>,
 <dbarboza@ventanamicro.com>, <hiwei_liu@linux.alibaba.com>,
 <qemu-riscv@nongnu.org>, <peterx@redhat.com>, <david@redhat.com>,
 Ethan Chen <ethan84@andestech.com>
Subject: [PATCH v4 4/4] hw/riscv/virt: Add IOPMP support
Date: Wed, 22 Nov 2023 13:32:51 +0800
Message-ID: <20231122053251.440723-5-ethan84@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122053251.440723-1-ethan84@andestech.com>
References: <20231122053251.440723-1-ethan84@andestech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.51]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3AM5XOnW023743
Received-SPF: pass client-ip=60.248.80.70; envelope-from=ethan84@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  Ethan Chen <ethan84@andestech.com>
From:  Ethan Chen via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

If a source device is connected to the IOPMP device, its memory access will be
checked by the IOPMP rule.

- Add 'iopmp=on' option to add an iopmp device and a dma device which is
  connected to the iopmp to machine. This option is assumed to be "off"
- Add 'iopmp_cascade=on' option to add second iopmp device which is cascaded by
  first iopmp device to machine. When iopmp option is "off", this option has no
  effect.

Signed-off-by: Ethan Chen <ethan84@andestech.com>
---
 docs/system/riscv/virt.rst | 11 +++++++
 hw/riscv/Kconfig           |  2 ++
 hw/riscv/virt.c            | 65 ++++++++++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h    | 10 +++++-
 4 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index f5fa7b8b29..e1b4aa4f94 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -111,6 +111,17 @@ The following machine-specific options are supported:
   having AIA IMSIC (i.e. "aia=aplic-imsic" selected). When not specified,
   the default number of per-HART VS-level AIA IMSIC pages is 0.
 
+- iopmp=[on|off]
+
+  When this option is "on".  An iopmp device and a dma device which is connected
+  to the iopmp are added to machine. This option is assumed to be "off".
+
+- iopmp_cascade=[on|off]
+
+  When this option is "on". Second iopmp device which is cascaded by first iopmp
+  device is added to machine. When iopmp option is "off", this option has no
+  effect. This option is assumed to be "off".
+
 Running Linux kernel
 --------------------
 
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index b6a5eb4452..c30a104aa4 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -45,6 +45,8 @@ config RISCV_VIRT
     select FW_CFG_DMA
     select PLATFORM_BUS
     select ACPI
+    select ATCDMAC300
+    select RISCV_IOPMP
 
 config SHAKTI_C
     bool
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c7fc97e273..92b748bfc7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -53,6 +53,8 @@
 #include "hw/display/ramfb.h"
 #include "hw/acpi/aml-build.h"
 #include "qapi/qapi-visit-common.h"
+#include "hw/misc/riscv_iopmp.h"
+#include "hw/dma/atcdmac300.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -97,6 +99,9 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_UART0] =        { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
+    [VIRT_IOPMP] =        { 0x10200000,      0x100000 },
+    [VIRT_IOPMP2] =       { 0x10300000,      0x100000 },
+    [VIRT_DMAC] =         { 0x10400000,      0x100000 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
     [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
@@ -1534,6 +1539,23 @@ static void virt_machine_init(MachineState *machine)
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
         qdev_get_gpio_in(mmio_irqchip, RTC_IRQ));
 
+    if (s->have_iopmp) {
+        /* IOPMP */
+        DeviceState *iopmp_dev = iopmp_create(memmap[VIRT_IOPMP].base,
+            qdev_get_gpio_in(DEVICE(mmio_irqchip), IOPMP_IRQ));
+        /* DMA with IOPMP */
+        DeviceState *dmac_dev = atcdmac300_create("atcdmac300",
+            memmap[VIRT_DMAC].base, memmap[VIRT_DMAC].size,
+            qdev_get_gpio_in(DEVICE(mmio_irqchip), DMAC_IRQ));
+        atcdmac300_connect_iopmp(dmac_dev, &(IOPMP(iopmp_dev)->iopmp_as),
+            (StreamSink *)&(IOPMP(iopmp_dev)->transaction_info_sink), 0);
+        if (s->have_iopmp_cascade) {
+            DeviceState *iopmp_dev2 = iopmp_create(memmap[VIRT_IOPMP2].base,
+                qdev_get_gpio_in(DEVICE(mmio_irqchip), IOPMP2_IRQ));
+            cascade_iopmp(iopmp_dev, iopmp_dev2);
+        }
+    }
+
     for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
         /* Map legacy -drive if=pflash to machine properties */
         pflash_cfi01_legacy_drive(s->flash[i],
@@ -1628,6 +1650,35 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
     s->have_aclint = value;
 }
 
+static bool virt_get_iopmp(Object *obj, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    return s->have_iopmp;
+}
+
+static void virt_set_iopmp(Object *obj, bool value, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    s->have_iopmp = value;
+}
+
+static bool virt_get_iopmp_cascade(Object *obj, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    return s->have_iopmp_cascade;
+}
+
+static void virt_set_iopmp_cascade(Object *obj, bool value, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    s->have_iopmp_cascade = value;
+}
+
+
 bool virt_is_acpi_enabled(RISCVVirtState *s)
 {
     return s->acpi != ON_OFF_AUTO_OFF;
@@ -1730,6 +1781,20 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                               NULL, NULL);
     object_class_property_set_description(oc, "acpi",
                                           "Enable ACPI");
+
+    object_class_property_add_bool(oc, "iopmp", virt_get_iopmp,
+                                   virt_set_iopmp);
+    object_class_property_set_description(oc, "iopmp",
+                                          "Set on/off to enable/disable "
+                                          "iopmp device");
+
+    object_class_property_add_bool(oc, "iopmp-cascade",
+                                   virt_get_iopmp_cascade,
+                                   virt_set_iopmp_cascade);
+    object_class_property_set_description(oc, "iopmp-cascade",
+                                          "Set on/off to enable/disable "
+                                          "iopmp2 device which is cascaded by "
+                                          "iopmp1 device");
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e5c474b26e..5fa2944d29 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -54,6 +54,8 @@ struct RISCVVirtState {
 
     int fdt_size;
     bool have_aclint;
+    bool have_iopmp;
+    bool have_iopmp_cascade;
     RISCVVirtAIAType aia_type;
     int aia_guests;
     char *oem_id;
@@ -82,12 +84,18 @@ enum {
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
     VIRT_PLATFORM_BUS,
-    VIRT_PCIE_ECAM
+    VIRT_PCIE_ECAM,
+    VIRT_IOPMP,
+    VIRT_IOPMP2,
+    VIRT_DMAC,
 };
 
 enum {
     UART0_IRQ = 10,
     RTC_IRQ = 11,
+    DMAC_IRQ = 12,
+    IOPMP_IRQ = 13,
+    IOPMP2_IRQ = 14,
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
-- 
2.34.1


