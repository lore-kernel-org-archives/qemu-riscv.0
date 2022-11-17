Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovnnW-0001qX-Qz
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 17:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1ovnnR-0001oL-NN; Thu, 17 Nov 2022 17:55:49 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1ovnnP-0001FV-Kc; Thu, 17 Nov 2022 17:55:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 225F8621A3;
 Thu, 17 Nov 2022 22:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66567C43141;
 Thu, 17 Nov 2022 22:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668725745;
 bh=EszqmYpUjCR7b2utA3vNBGRBQrCxqby49ePn6jzbhGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dIHlGIeA5cVHK//cKuZ9UzBlx2QK+JYhgWoZ0qpUWv8TfKmTC1+KXuZwoENesK6Qo
 Hd4etoOxp9ysU9kKMEMOND7Ev64WoxjaPmOWW5xgy4lo+pYGGIcvgKIBfgtA1b8V2w
 BVBLpU39fnyjc9LGzIc/f2rRcIOe6Ir9yXlGi7zsBiLx7qbTulhEAovR+Dh5zkeA8+
 R7YCbI9WefsaenrSdS2O952nTtKdIFY92S4ggI+dtTDe2BSBsrU2fJl9DUPanb3cV0
 wY91hIINLfu96VeMDKEqUN3cS+GsniKvv2CDw1z01CTMNeZMv+7yox2lFH0xsWdVCv
 yGkq5mgj0sTRg==
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/3] hw/{misc,
 riscv}: pfsoc: add system controller as unimplemented
Date: Thu, 17 Nov 2022 22:55:18 +0000
Message-Id: <20221117225518.4102575-4-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221117225518.4102575-1-conor@kernel.org>
References: <20221117225518.4102575-1-conor@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=conor@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 17 Nov 2022 22:55:50 -0000

From: Conor Dooley <conor.dooley@microchip.com>

The system controller on PolarFire SoC is access via a mailbox. The
control registers for this mailbox lie in the "IOSCB" region & the
interrupt is cleared via write to the "SYSREG" region. It also has a
QSPI controller, usually connected to a flash chip, that is used for
storing FPGA bitstreams and used for In-Application Programming (IAP).

Linux has an implementation of the system controller, through which the
hwrng is accessed, leading to load/store access faults.

Add the QSPI as unimplemented and a very basic (effectively
unimplemented) version of the system controller's mailbox. Rather than
purely marking the regions as unimplemented, service the mailbox
requests by reporting failures and raising the interrupt so a guest can
better handle the lack of support.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/misc/mchp_pfsoc_ioscb.c          | 72 ++++++++++++++++++++++++++++-
 hw/misc/mchp_pfsoc_sysreg.c         | 18 ++++++--
 hw/riscv/microchip_pfsoc.c          |  6 +++
 include/hw/misc/mchp_pfsoc_ioscb.h  |  3 ++
 include/hw/misc/mchp_pfsoc_sysreg.h |  1 +
 include/hw/riscv/microchip_pfsoc.h  |  1 +
 6 files changed, 95 insertions(+), 6 deletions(-)

diff --git a/hw/misc/mchp_pfsoc_ioscb.c b/hw/misc/mchp_pfsoc_ioscb.c
index f976e42f72..a71d134295 100644
--- a/hw/misc/mchp_pfsoc_ioscb.c
+++ b/hw/misc/mchp_pfsoc_ioscb.c
@@ -24,6 +24,7 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
+#include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/misc/mchp_pfsoc_ioscb.h"
 
@@ -34,6 +35,9 @@
 #define IOSCB_WHOLE_REG_SIZE        0x10000000
 #define IOSCB_SUBMOD_REG_SIZE       0x1000
 #define IOSCB_CCC_REG_SIZE          0x2000000
+#define IOSCB_CTRL_REG_SIZE         0x800
+#define IOSCB_QSPIXIP_REG_SIZE      0x200
+
 
 /*
  * There are many sub-modules in the IOSCB module.
@@ -45,6 +49,8 @@
 #define IOSCB_LANE01_BASE           0x06500000
 #define IOSCB_LANE23_BASE           0x06510000
 #define IOSCB_CTRL_BASE             0x07020000
+#define IOSCB_QSPIXIP_BASE          0x07020100
+#define IOSCB_MAILBOX_BASE          0x07020800
 #define IOSCB_CFG_BASE              0x07080000
 #define IOSCB_CCC_BASE              0x08000000
 #define IOSCB_PLL_MSS_BASE          0x0E001000
@@ -143,6 +149,58 @@ static const MemoryRegionOps mchp_pfsoc_io_calib_ddr_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+#define SERVICES_CR             0x50
+#define SERVICES_SR             0x54
+#define SERVICES_STATUS_SHIFT   16
+
+static uint64_t mchp_pfsoc_ctrl_read(void *opaque, hwaddr offset,
+                                     unsigned size)
+{
+    uint32_t val = 0;
+
+    switch (offset) {
+    case SERVICES_SR:
+        /*
+         * Although some services have no error codes, most do. All services
+         * that do implement errors, begin their error codes at 1. Treat all
+         * service requests as failures & return 1.
+         * See the "PolarFire® FPGA and PolarFire SoC FPGA System Services"
+         * user guide for more information on service error codes.
+         */
+        val = 1u << SERVICES_STATUS_SHIFT;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device read "
+                      "(size %d, offset 0x%" HWADDR_PRIx ")\n",
+                      __func__, size, offset);
+    }
+
+    return val;
+}
+
+static void mchp_pfsoc_ctrl_write(void *opaque, hwaddr offset,
+                                  uint64_t value, unsigned size)
+{
+    MchpPfSoCIoscbState *s = opaque;
+
+    switch (offset) {
+    case SERVICES_CR:
+        qemu_irq_raise(s->irq);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
+                      "(size %d, value 0x%" PRIx64
+                      ", offset 0x%" HWADDR_PRIx ")\n",
+                      __func__, size, value, offset);
+    }
+}
+
+static const MemoryRegionOps mchp_pfsoc_ctrl_ops = {
+    .read = mchp_pfsoc_ctrl_read,
+    .write = mchp_pfsoc_ctrl_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
 static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
 {
     MchpPfSoCIoscbState *s = MCHP_PFSOC_IOSCB(dev);
@@ -162,10 +220,18 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
                           "mchp.pfsoc.ioscb.lane23", IOSCB_SUBMOD_REG_SIZE);
     memory_region_add_subregion(&s->container, IOSCB_LANE23_BASE, &s->lane23);
 
-    memory_region_init_io(&s->ctrl, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
-                          "mchp.pfsoc.ioscb.ctrl", IOSCB_SUBMOD_REG_SIZE);
+    memory_region_init_io(&s->ctrl, OBJECT(s), &mchp_pfsoc_ctrl_ops, s,
+                          "mchp.pfsoc.ioscb.ctrl", IOSCB_CTRL_REG_SIZE);
     memory_region_add_subregion(&s->container, IOSCB_CTRL_BASE, &s->ctrl);
 
+    memory_region_init_io(&s->qspixip, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
+                          "mchp.pfsoc.ioscb.qspixip", IOSCB_QSPIXIP_REG_SIZE);
+    memory_region_add_subregion(&s->container, IOSCB_QSPIXIP_BASE, &s->qspixip);
+
+    memory_region_init_io(&s->mailbox, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
+                          "mchp.pfsoc.ioscb.mailbox", IOSCB_SUBMOD_REG_SIZE);
+    memory_region_add_subregion(&s->container, IOSCB_MAILBOX_BASE, &s->mailbox);
+
     memory_region_init_io(&s->cfg, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
                           "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_SIZE);
     memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->cfg);
@@ -222,6 +288,8 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
                           IOSCB_SUBMOD_REG_SIZE);
     memory_region_add_subregion(&s->container, IOSCB_IO_CALIB_SGMII_BASE,
                                 &s->io_calib_sgmii);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 }
 
 static void mchp_pfsoc_ioscb_class_init(ObjectClass *klass, void *data)
diff --git a/hw/misc/mchp_pfsoc_sysreg.c b/hw/misc/mchp_pfsoc_sysreg.c
index 89571eded5..7876fe0c5b 100644
--- a/hw/misc/mchp_pfsoc_sysreg.c
+++ b/hw/misc/mchp_pfsoc_sysreg.c
@@ -24,10 +24,12 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
+#include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/misc/mchp_pfsoc_sysreg.h"
 
 #define ENVM_CR         0xb8
+#define MESSAGE_INT     0x118c
 
 static uint64_t mchp_pfsoc_sysreg_read(void *opaque, hwaddr offset,
                                        unsigned size)
@@ -52,10 +54,17 @@ static uint64_t mchp_pfsoc_sysreg_read(void *opaque, hwaddr offset,
 static void mchp_pfsoc_sysreg_write(void *opaque, hwaddr offset,
                                     uint64_t value, unsigned size)
 {
-    qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
-                  "(size %d, value 0x%" PRIx64
-                  ", offset 0x%" HWADDR_PRIx ")\n",
-                  __func__, size, value, offset);
+    MchpPfSoCSysregState *s = opaque;
+    switch (offset) {
+    case MESSAGE_INT:
+        qemu_irq_lower(s->irq);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
+                      "(size %d, value 0x%" PRIx64
+                      ", offset 0x%" HWADDR_PRIx ")\n",
+                      __func__, size, value, offset);
+    }
 }
 
 static const MemoryRegionOps mchp_pfsoc_sysreg_ops = {
@@ -73,6 +82,7 @@ static void mchp_pfsoc_sysreg_realize(DeviceState *dev, Error **errp)
                           "mchp.pfsoc.sysreg",
                           MCHP_PFSOC_SYSREG_REG_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->sysreg);
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 }
 
 static void mchp_pfsoc_sysreg_class_init(ObjectClass *klass, void *data)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 2a24e3437a..b10321b564 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -306,6 +306,9 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->sysreg), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysreg), 0,
                     memmap[MICROCHIP_PFSOC_SYSREG].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sysreg), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic),
+                       MICROCHIP_PFSOC_MAILBOX_IRQ));
 
     /* AXISW */
     create_unimplemented_device("microchip.pfsoc.axisw",
@@ -459,6 +462,9 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->ioscb), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
                     memmap[MICROCHIP_PFSOC_IOSCB].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ioscb), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic),
+                       MICROCHIP_PFSOC_MAILBOX_IRQ));
 
     /* FPGA Fabric */
     create_unimplemented_device("microchip.pfsoc.fabricfic3",
diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
index 687b213742..a1104862c8 100644
--- a/include/hw/misc/mchp_pfsoc_ioscb.h
+++ b/include/hw/misc/mchp_pfsoc_ioscb.h
@@ -29,6 +29,8 @@ typedef struct MchpPfSoCIoscbState {
     MemoryRegion lane01;
     MemoryRegion lane23;
     MemoryRegion ctrl;
+    MemoryRegion qspixip;
+    MemoryRegion mailbox;
     MemoryRegion cfg;
     MemoryRegion ccc;
     MemoryRegion pll_mss;
@@ -41,6 +43,7 @@ typedef struct MchpPfSoCIoscbState {
     MemoryRegion cfm_sgmii;
     MemoryRegion bc_sgmii;
     MemoryRegion io_calib_sgmii;
+    qemu_irq irq;
 } MchpPfSoCIoscbState;
 
 #define TYPE_MCHP_PFSOC_IOSCB "mchp.pfsoc.ioscb"
diff --git a/include/hw/misc/mchp_pfsoc_sysreg.h b/include/hw/misc/mchp_pfsoc_sysreg.h
index 546ba68f6a..3cebe40ea9 100644
--- a/include/hw/misc/mchp_pfsoc_sysreg.h
+++ b/include/hw/misc/mchp_pfsoc_sysreg.h
@@ -28,6 +28,7 @@
 typedef struct MchpPfSoCSysregState {
     SysBusDevice parent;
     MemoryRegion sysreg;
+    qemu_irq irq;
 } MchpPfSoCSysregState;
 
 #define TYPE_MCHP_PFSOC_SYSREG "mchp.pfsoc.sysreg"
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 7e7950dd36..69a686b54a 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -147,6 +147,7 @@ enum {
     MICROCHIP_PFSOC_MMUART2_IRQ = 92,
     MICROCHIP_PFSOC_MMUART3_IRQ = 93,
     MICROCHIP_PFSOC_MMUART4_IRQ = 94,
+    MICROCHIP_PFSOC_MAILBOX_IRQ = 96,
 };
 
 #define MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT    1
-- 
2.37.2


