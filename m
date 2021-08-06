Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mC78s-0001OH-FK
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 17:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC78q-0001EL-5P
 for qemu-riscv@nongnu.org; Fri, 06 Aug 2021 17:12:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC78i-00048z-FL
 for qemu-riscv@nongnu.org; Fri, 06 Aug 2021 17:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3TYJMvJLr52fbH9Tdl7fMQmRlet3OeQJSSv6ote2AY=;
 b=Wi+xJDWR7tgAAk11w2bz74jOGJB//s/FrdTcjHb50MoQIddTUDZl81XYUHPVRoGdkpVIS9
 1sKQAU7uloS0XVE+rbqbeiJCUwVf4dozmpDUNtDkskoSXwNL3B7gI6+8nJV2VNctyA6kM5
 pjzqVqPFB9vEUROFQhZuWuP9rLTMK7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-5Kh7wRNhP5OSF8l5OiIg7g-1; Fri, 06 Aug 2021 17:12:21 -0400
X-MC-Unique: 5Kh7wRNhP5OSF8l5OiIg7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DAF4760C0;
 Fri,  6 Aug 2021 21:12:15 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 535EE9329;
 Fri,  6 Aug 2021 21:11:50 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <huth@tuxfamily.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Corey Minyard <minyard@acm.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-6.2 05/12] [automated] Move QOM typedefs and add missing
 includes
Date: Fri,  6 Aug 2021 17:11:20 -0400
Message-Id: <20210806211127.646908-6-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 06 Aug 2021 21:12:32 -0000

Some typedefs and macros are defined after the type check macros.
This makes it difficult to automatically replace their
definitions with OBJECT_DECLARE_TYPE.

Patch generated using:

 $ ./scripts/codeconverter/converter.py -i --pattern=MoveSymbols \
    $(git grep -l '' -- '*.[ch]')

which will:
- split "typdef struct { ... } TypedefName" declarations
- move the typedefs and #defines above the type check macros
- add missing #include "qom/object.h" lines if necessary

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Thomas Huth <huth@tuxfamily.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>
Cc: Bandan Das <bsd@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>
Cc: Klaus Jensen <its@irrelevant.dk>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vijai Kumar K <vijai@behindbytes.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Corey Minyard <minyard@acm.org>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: "Hervé Poussineau" <hpoussin@reactos.org>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-ppc@nongnu.org
---
 hw/nvme/nvme.h                              |  6 ++++--
 hw/usb/hcd-uhci.h                           |  1 +
 hw/usb/hcd-xhci-pci.h                       |  6 ++++--
 hw/usb/hcd-xhci-sysbus.h                    |  6 ++++--
 hw/usb/u2f.h                                |  6 ++++--
 include/hw/acpi/acpi_dev_interface.h        |  2 +-
 include/hw/adc/npcm7xx_adc.h                |  1 +
 include/hw/arm/linux-boot-if.h              |  2 +-
 include/hw/arm/npcm7xx.h                    | 11 +++++++----
 include/hw/char/shakti_uart.h               |  6 ++++--
 include/hw/core/accel-cpu.h                 |  1 +
 include/hw/dma/sifive_pdma.h                |  1 +
 include/hw/dma/xlnx_csu_dma.h               |  1 +
 include/hw/fw-path-provider.h               |  2 +-
 include/hw/gpio/npcm7xx_gpio.h              |  1 +
 include/hw/hotplug.h                        |  2 +-
 include/hw/i2c/npcm7xx_smbus.h              |  1 +
 include/hw/intc/intc.h                      |  2 +-
 include/hw/intc/m68k_irqc.h                 |  6 ++++--
 include/hw/intc/sifive_clint.h              |  6 ++++--
 include/hw/ipmi/ipmi.h                      |  2 +-
 include/hw/mem/memory-device.h              |  2 +-
 include/hw/mem/npcm7xx_mc.h                 |  1 +
 include/hw/misc/aspeed_lpc.h                |  6 ++++--
 include/hw/misc/bcm2835_cprman.h            |  1 +
 include/hw/misc/bcm2835_cprman_internals.h  |  1 +
 include/hw/misc/mchp_pfsoc_dmc.h            |  1 +
 include/hw/misc/mchp_pfsoc_ioscb.h          |  1 +
 include/hw/misc/mchp_pfsoc_sysreg.h         |  1 +
 include/hw/misc/npcm7xx_clk.h               |  1 +
 include/hw/misc/npcm7xx_gcr.h               |  1 +
 include/hw/misc/npcm7xx_pwm.h               |  1 +
 include/hw/misc/npcm7xx_rng.h               |  1 +
 include/hw/misc/xlnx-versal-xramc.h         |  6 ++++--
 include/hw/net/npcm7xx_emc.h                |  1 +
 include/hw/net/xlnx-zynqmp-can.h            |  6 ++++--
 include/hw/nmi.h                            |  2 +-
 include/hw/nvram/npcm7xx_otp.h              |  1 +
 include/hw/ppc/spapr_drc.h                  | 15 +++++++++------
 include/hw/ppc/spapr_xive.h                 | 11 +++++++----
 include/hw/ppc/vof.h                        |  1 +
 include/hw/rdma/rdma.h                      |  2 +-
 include/hw/riscv/microchip_pfsoc.h          |  1 +
 include/hw/riscv/shakti_c.h                 | 11 +++++++----
 include/hw/riscv/sifive_e.h                 |  6 ++++--
 include/hw/riscv/sifive_u.h                 | 11 +++++++----
 include/hw/rtc/m48t59.h                     |  2 +-
 include/hw/sd/cadence_sdhci.h               |  1 +
 include/hw/ssi/npcm7xx_fiu.h                |  1 +
 include/hw/ssi/sifive_spi.h                 |  6 ++++--
 include/hw/stream.h                         |  2 +-
 include/hw/timer/npcm7xx_timer.h            |  1 +
 include/hw/tricore/tricore_testdevice.h     |  6 ++++--
 include/hw/usb/hcd-dwc3.h                   |  6 ++++--
 include/hw/usb/msd.h                        |  1 +
 include/hw/usb/xlnx-usb-subsystem.h         |  6 ++++--
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  6 ++++--
 include/hw/vmstate-if.h                     |  2 +-
 include/hw/watchdog/sbsa_gwdt.h             |  6 ++++--
 include/qom/object_interfaces.h             |  2 +-
 include/sysemu/tpm.h                        |  2 +-
 target/arm/idau.h                           |  2 +-
 target/hexagon/cpu.h                        | 11 +++++++----
 accel/tcg/tcg-all.c                         |  1 +
 chardev/char-parallel.c                     |  1 +
 hw/arm/bcm2836.c                            |  1 +
 hw/m68k/mcf5206.c                           |  1 +
 hw/mem/sparse-mem.c                         |  6 ++++--
 hw/mips/loongson3_virt.c                    |  1 +
 hw/misc/npcm7xx_clk.c                       |  1 +
 hw/misc/sbsa_ec.c                           |  1 +
 hw/net/can/ctucan_pci.c                     |  1 +
 hw/nvram/npcm7xx_otp.c                      |  1 +
 hw/s390x/vhost-user-fs-ccw.c                |  1 +
 hw/sensor/adm1272.c                         |  6 ++++--
 hw/sensor/max34451.c                        |  6 ++++--
 hw/usb/u2f-emulated.c                       |  1 +
 hw/usb/u2f-passthru.c                       |  1 +
 hw/virtio/vhost-user-i2c-pci.c              |  1 +
 tests/unit/check-qom-interface.c            |  2 +-
 ui/vdagent.c                                |  1 +
 81 files changed, 179 insertions(+), 82 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 83ffabade4c..5ddcd783055 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -23,6 +23,7 @@
 #include "hw/block/block.h"
 
 #include "block/nvme.h"
+#include "qom/object.h"
 
 #define NVME_MAX_CONTROLLERS 32
 #define NVME_MAX_NAMESPACES  256
@@ -41,10 +42,11 @@ typedef struct NvmeBus {
 } NvmeBus;
 
 #define TYPE_NVME_SUBSYS "nvme-subsys"
+typedef struct NvmeSubsystem NvmeSubsystem;
 #define NVME_SUBSYS(obj) \
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 
-typedef struct NvmeSubsystem {
+struct NvmeSubsystem {
     DeviceState parent_obj;
     NvmeBus     bus;
     uint8_t     subnqn[256];
@@ -55,7 +57,7 @@ typedef struct NvmeSubsystem {
     struct {
         char *nqn;
     } params;
-} NvmeSubsystem;
+};
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
 void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n);
diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index e61d8fcb192..57d0d574644 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -32,6 +32,7 @@
 #include "qemu/timer.h"
 #include "hw/pci/pci.h"
 #include "hw/usb.h"
+#include "qom/object.h"
 
 typedef struct UHCIQueue UHCIQueue;
 
diff --git a/hw/usb/hcd-xhci-pci.h b/hw/usb/hcd-xhci-pci.h
index c193f794439..0cfe630a5ce 100644
--- a/hw/usb/hcd-xhci-pci.h
+++ b/hw/usb/hcd-xhci-pci.h
@@ -26,19 +26,21 @@
 
 #include "hw/usb.h"
 #include "hcd-xhci.h"
+#include "qom/object.h"
 
 #define TYPE_XHCI_PCI "pci-xhci"
+typedef struct XHCIPciState XHCIPciState;
 #define XHCI_PCI(obj) \
     OBJECT_CHECK(XHCIPciState, (obj), TYPE_XHCI_PCI)
 
 
-typedef struct XHCIPciState {
+struct XHCIPciState {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
     XHCIState xhci;
     OnOffAuto msi;
     OnOffAuto msix;
-} XHCIPciState;
+};
 
 #endif
diff --git a/hw/usb/hcd-xhci-sysbus.h b/hw/usb/hcd-xhci-sysbus.h
index fdfcbbee3bf..7661c811fd1 100644
--- a/hw/usb/hcd-xhci-sysbus.h
+++ b/hw/usb/hcd-xhci-sysbus.h
@@ -14,18 +14,20 @@
 #include "hw/usb.h"
 #include "hcd-xhci.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
+typedef struct XHCISysbusState XHCISysbusState;
 #define XHCI_SYSBUS(obj) \
     OBJECT_CHECK(XHCISysbusState, (obj), TYPE_XHCI_SYSBUS)
 
 
-typedef struct XHCISysbusState {
+struct XHCISysbusState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
     XHCIState xhci;
     qemu_irq *irq;
-} XHCISysbusState;
+};
 
 void xhci_sysbus_reset(DeviceState *dev);
 #endif
diff --git a/hw/usb/u2f.h b/hw/usb/u2f.h
index db30f3586bf..705d5c43ce6 100644
--- a/hw/usb/u2f.h
+++ b/hw/usb/u2f.h
@@ -27,6 +27,7 @@
 #define U2F_H
 
 #include "hw/qdev-core.h"
+#include "qom/object.h"
 
 #define U2FHID_PACKET_SIZE 64
 #define U2FHID_PENDING_IN_NUM 32
@@ -35,6 +36,7 @@ typedef struct U2FKeyState U2FKeyState;
 typedef struct U2FKeyInfo U2FKeyInfo;
 
 #define TYPE_U2F_KEY "u2f-key"
+typedef struct U2FKeyClass U2FKeyClass;
 #define U2F_KEY(obj) \
     OBJECT_CHECK(U2FKeyState, (obj), TYPE_U2F_KEY)
 #define U2F_KEY_CLASS(klass) \
@@ -46,7 +48,7 @@ typedef struct U2FKeyInfo U2FKeyInfo;
  * Callbacks to be used by the U2F key base device (i.e. hw/u2f.c)
  * to interact with its variants (i.e. hw/u2f-*.c)
  */
-typedef struct U2FKeyClass {
+struct U2FKeyClass {
     /*< private >*/
     USBDeviceClass parent_class;
 
@@ -55,7 +57,7 @@ typedef struct U2FKeyClass {
                             const uint8_t packet[U2FHID_PACKET_SIZE]);
     void (*realize)(U2FKeyState *key, Error **errp);
     void (*unrealize)(U2FKeyState *key);
-} U2FKeyClass;
+};
 
 /*
  * State of the U2F key base device (i.e. hw/u2f.c)
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 769ff55c7ee..c9c7c17e043 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -21,11 +21,11 @@ typedef enum {
 typedef struct AcpiDeviceIfClass AcpiDeviceIfClass;
 DECLARE_CLASS_CHECKERS(AcpiDeviceIfClass, ACPI_DEVICE_IF,
                        TYPE_ACPI_DEVICE_IF)
+typedef struct AcpiDeviceIf AcpiDeviceIf;
 #define ACPI_DEVICE_IF(obj) \
      INTERFACE_CHECK(AcpiDeviceIf, (obj), \
                      TYPE_ACPI_DEVICE_IF)
 
-typedef struct AcpiDeviceIf AcpiDeviceIf;
 
 void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event);
 
diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h
index 8e5a1897b4b..874cfbd6ce3 100644
--- a/include/hw/adc/npcm7xx_adc.h
+++ b/include/hw/adc/npcm7xx_adc.h
@@ -20,6 +20,7 @@
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 #define NPCM7XX_ADC_NUM_INPUTS      8
 /**
diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-boot-if.h
index c85f33b2c51..295e282c36e 100644
--- a/include/hw/arm/linux-boot-if.h
+++ b/include/hw/arm/linux-boot-if.h
@@ -12,10 +12,10 @@
 typedef struct ARMLinuxBootIfClass ARMLinuxBootIfClass;
 DECLARE_CLASS_CHECKERS(ARMLinuxBootIfClass, ARM_LINUX_BOOT_IF,
                        TYPE_ARM_LINUX_BOOT_IF)
+typedef struct ARMLinuxBootIf ARMLinuxBootIf;
 #define ARM_LINUX_BOOT_IF(obj) \
     INTERFACE_CHECK(ARMLinuxBootIf, (obj), TYPE_ARM_LINUX_BOOT_IF)
 
-typedef struct ARMLinuxBootIf ARMLinuxBootIf;
 
 struct ARMLinuxBootIfClass {
     /*< private >*/
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 61ecc57ab90..dc802c1645c 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -35,6 +35,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "hw/usb/hcd-ohci.h"
 #include "target/arm/cpu.h"
+#include "qom/object.h"
 
 #define NPCM7XX_MAX_NUM_CPUS    (2)
 
@@ -62,14 +63,15 @@ typedef struct NPCM7xxMachine {
 } NPCM7xxMachine;
 
 #define TYPE_NPCM7XX_MACHINE MACHINE_TYPE_NAME("npcm7xx")
+typedef struct NPCM7xxMachineClass NPCM7xxMachineClass;
 #define NPCM7XX_MACHINE(obj)                                            \
     OBJECT_CHECK(NPCM7xxMachine, (obj), TYPE_NPCM7XX_MACHINE)
 
-typedef struct NPCM7xxMachineClass {
+struct NPCM7xxMachineClass {
     MachineClass        parent;
 
     const char          *soc_type;
-} NPCM7xxMachineClass;
+};
 
 #define NPCM7XX_MACHINE_CLASS(klass)                                    \
     OBJECT_CLASS_CHECK(NPCM7xxMachineClass, (klass), TYPE_NPCM7XX_MACHINE)
@@ -106,19 +108,20 @@ typedef struct NPCM7xxState {
 } NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
+typedef struct NPCM7xxClass NPCM7xxClass;
 #define NPCM7XX(obj)    OBJECT_CHECK(NPCM7xxState, (obj), TYPE_NPCM7XX)
 
 #define TYPE_NPCM730    "npcm730"
 #define TYPE_NPCM750    "npcm750"
 
-typedef struct NPCM7xxClass {
+struct NPCM7xxClass {
     DeviceClass         parent;
 
     /* Bitmask of modules that are permanently disabled on this chip. */
     uint32_t            disabled_modules;
     /* Number of CPU cores enabled in this SoC class (may be 1 or 2). */
     uint32_t            num_cpus;
-} NPCM7xxClass;
+};
 
 #define NPCM7XX_CLASS(klass)                                            \
     OBJECT_CLASS_CHECK(NPCM7xxClass, (klass), TYPE_NPCM7XX)
diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h
index 25f7cbcaa55..be7a93fb14d 100644
--- a/include/hw/char/shakti_uart.h
+++ b/include/hw/char/shakti_uart.h
@@ -27,6 +27,7 @@
 
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
+#include "qom/object.h"
 
 #define SHAKTI_UART_BAUD        0x00
 #define SHAKTI_UART_TX          0x04
@@ -48,10 +49,11 @@
 #define SHAKTI_UART_CONTROL_DEFAULT 0x0100
 
 #define TYPE_SHAKTI_UART "shakti-uart"
+typedef struct ShaktiUartState ShaktiUartState;
 #define SHAKTI_UART(obj) \
     OBJECT_CHECK(ShaktiUartState, (obj), TYPE_SHAKTI_UART)
 
-typedef struct ShaktiUartState {
+struct ShaktiUartState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -69,6 +71,6 @@ typedef struct ShaktiUartState {
     uint32_t uart_rx_threshold;
 
     CharBackend chr;
-} ShaktiUartState;
+};
 
 #endif /* HW_SHAKTI_UART_H */
diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
index 5dbfd799553..0b7b3f6df3e 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/hw/core/accel-cpu.h
@@ -10,6 +10,7 @@
 
 #ifndef ACCEL_CPU_H
 #define ACCEL_CPU_H
+#include "qom/object.h"
 
 /*
  * This header is used to define new accelerator-specific target-specific
diff --git a/include/hw/dma/sifive_pdma.h b/include/hw/dma/sifive_pdma.h
index e319bbd6c40..a62908dd0f2 100644
--- a/include/hw/dma/sifive_pdma.h
+++ b/include/hw/dma/sifive_pdma.h
@@ -22,6 +22,7 @@
 
 #ifndef SIFIVE_PDMA_H
 #define SIFIVE_PDMA_H
+#include "qom/object.h"
 
 struct sifive_pdma_chan {
     uint32_t control;
diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 204d94c6737..804ca5958d0 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -20,6 +20,7 @@
 
 #ifndef XLNX_CSU_DMA_H
 #define XLNX_CSU_DMA_H
+#include "qom/object.h"
 
 #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
 
diff --git a/include/hw/fw-path-provider.h b/include/hw/fw-path-provider.h
index 8e1d45651cf..33d91daed52 100644
--- a/include/hw/fw-path-provider.h
+++ b/include/hw/fw-path-provider.h
@@ -25,10 +25,10 @@
 typedef struct FWPathProviderClass FWPathProviderClass;
 DECLARE_CLASS_CHECKERS(FWPathProviderClass, FW_PATH_PROVIDER,
                        TYPE_FW_PATH_PROVIDER)
+typedef struct FWPathProvider FWPathProvider;
 #define FW_PATH_PROVIDER(obj) \
      INTERFACE_CHECK(FWPathProvider, (obj), TYPE_FW_PATH_PROVIDER)
 
-typedef struct FWPathProvider FWPathProvider;
 
 struct FWPathProviderClass {
     InterfaceClass parent_class;
diff --git a/include/hw/gpio/npcm7xx_gpio.h b/include/hw/gpio/npcm7xx_gpio.h
index b1d771bd776..c4e5b4a353e 100644
--- a/include/hw/gpio/npcm7xx_gpio.h
+++ b/include/hw/gpio/npcm7xx_gpio.h
@@ -17,6 +17,7 @@
 
 #include "exec/memory.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /* Number of pins managed by each controller. */
 #define NPCM7XX_GPIO_NR_PINS (32)
diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index e15f59c8b3c..75d32d69e2b 100644
--- a/include/hw/hotplug.h
+++ b/include/hw/hotplug.h
@@ -19,10 +19,10 @@
 typedef struct HotplugHandlerClass HotplugHandlerClass;
 DECLARE_CLASS_CHECKERS(HotplugHandlerClass, HOTPLUG_HANDLER,
                        TYPE_HOTPLUG_HANDLER)
+typedef struct HotplugHandler HotplugHandler;
 #define HOTPLUG_HANDLER(obj) \
      INTERFACE_CHECK(HotplugHandler, (obj), TYPE_HOTPLUG_HANDLER)
 
-typedef struct HotplugHandler HotplugHandler;
 
 /**
  * hotplug_fn:
diff --git a/include/hw/i2c/npcm7xx_smbus.h b/include/hw/i2c/npcm7xx_smbus.h
index 7d59ee917eb..8030d78f69c 100644
--- a/include/hw/i2c/npcm7xx_smbus.h
+++ b/include/hw/i2c/npcm7xx_smbus.h
@@ -20,6 +20,7 @@
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /*
  * Number of addresses this module contains. Do not change this without
diff --git a/include/hw/intc/intc.h b/include/hw/intc/intc.h
index 7018f608ca5..7c57c3a0379 100644
--- a/include/hw/intc/intc.h
+++ b/include/hw/intc/intc.h
@@ -8,11 +8,11 @@
 typedef struct InterruptStatsProviderClass InterruptStatsProviderClass;
 DECLARE_CLASS_CHECKERS(InterruptStatsProviderClass, INTERRUPT_STATS_PROVIDER,
                        TYPE_INTERRUPT_STATS_PROVIDER)
+typedef struct InterruptStatsProvider InterruptStatsProvider;
 #define INTERRUPT_STATS_PROVIDER(obj) \
     INTERFACE_CHECK(InterruptStatsProvider, (obj), \
                     TYPE_INTERRUPT_STATS_PROVIDER)
 
-typedef struct InterruptStatsProvider InterruptStatsProvider;
 
 struct InterruptStatsProviderClass {
     InterfaceClass parent;
diff --git a/include/hw/intc/m68k_irqc.h b/include/hw/intc/m68k_irqc.h
index dbcfcfc2e00..460d8a5a8d3 100644
--- a/include/hw/intc/m68k_irqc.h
+++ b/include/hw/intc/m68k_irqc.h
@@ -11,8 +11,10 @@
 #define M68K_IRQC_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_M68K_IRQC "m68k-irq-controller"
+typedef struct M68KIRQCState M68KIRQCState;
 #define M68K_IRQC(obj) OBJECT_CHECK(M68KIRQCState, (obj), \
                                     TYPE_M68K_IRQC)
 
@@ -29,13 +31,13 @@ enum {
 };
 #define M68K_IRQC_LEVEL_NUM (M68K_IRQC_LEVEL_7 - M68K_IRQC_LEVEL_1 + 1)
 
-typedef struct M68KIRQCState {
+struct M68KIRQCState {
     SysBusDevice parent_obj;
 
     uint8_t ipr;
 
     /* statistics */
     uint64_t stats_irq_count[M68K_IRQC_LEVEL_NUM];
-} M68KIRQCState;
+};
 
 #endif
diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clint.h
index a30be0f3d6f..8e005e130f1 100644
--- a/include/hw/intc/sifive_clint.h
+++ b/include/hw/intc/sifive_clint.h
@@ -21,13 +21,15 @@
 #define HW_SIFIVE_CLINT_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_SIFIVE_CLINT "riscv.sifive.clint"
 
+typedef struct SiFiveCLINTState SiFiveCLINTState;
 #define SIFIVE_CLINT(obj) \
     OBJECT_CHECK(SiFiveCLINTState, (obj), TYPE_SIFIVE_CLINT)
 
-typedef struct SiFiveCLINTState {
+struct SiFiveCLINTState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -40,7 +42,7 @@ typedef struct SiFiveCLINTState {
     uint32_t time_base;
     uint32_t aperture_size;
     uint32_t timebase_freq;
-} SiFiveCLINTState;
+};
 
 DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
     uint32_t hartid_base, uint32_t num_harts, uint32_t sip_base,
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index 77a7213ed93..d655352fa95 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -109,13 +109,13 @@ uint32_t ipmi_next_uuid(void);
  * and the BMC.
  */
 #define TYPE_IPMI_INTERFACE "ipmi-interface"
+typedef struct IPMIInterface IPMIInterface;
 #define IPMI_INTERFACE(obj) \
      INTERFACE_CHECK(IPMIInterface, (obj), TYPE_IPMI_INTERFACE)
 typedef struct IPMIInterfaceClass IPMIInterfaceClass;
 DECLARE_CLASS_CHECKERS(IPMIInterfaceClass, IPMI_INTERFACE,
                        TYPE_IPMI_INTERFACE)
 
-typedef struct IPMIInterface IPMIInterface;
 
 struct IPMIInterfaceClass {
     InterfaceClass parent;
diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index 48d2611fc5e..a83428209b9 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -22,10 +22,10 @@
 typedef struct MemoryDeviceClass MemoryDeviceClass;
 DECLARE_CLASS_CHECKERS(MemoryDeviceClass, MEMORY_DEVICE,
                        TYPE_MEMORY_DEVICE)
+typedef struct MemoryDeviceState MemoryDeviceState;
 #define MEMORY_DEVICE(obj) \
      INTERFACE_CHECK(MemoryDeviceState, (obj), TYPE_MEMORY_DEVICE)
 
-typedef struct MemoryDeviceState MemoryDeviceState;
 
 /**
  * MemoryDeviceClass:
diff --git a/include/hw/mem/npcm7xx_mc.h b/include/hw/mem/npcm7xx_mc.h
index 7ed38be2431..83787f6fa57 100644
--- a/include/hw/mem/npcm7xx_mc.h
+++ b/include/hw/mem/npcm7xx_mc.h
@@ -18,6 +18,7 @@
 
 #include "exec/memory.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /**
  * struct NPCM7xxMCState - Device state for the memory controller.
diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_lpc.h
index df418cfcd36..def617b9772 100644
--- a/include/hw/misc/aspeed_lpc.h
+++ b/include/hw/misc/aspeed_lpc.h
@@ -13,8 +13,10 @@
 #include "hw/sysbus.h"
 
 #include <stdint.h>
+#include "qom/object.h"
 
 #define TYPE_ASPEED_LPC "aspeed.lpc"
+typedef struct AspeedLPCState AspeedLPCState;
 #define ASPEED_LPC(obj) OBJECT_CHECK(AspeedLPCState, (obj), TYPE_ASPEED_LPC)
 
 #define ASPEED_LPC_NR_REGS      (0x260 >> 2)
@@ -29,7 +31,7 @@ enum aspeed_lpc_subdevice {
 
 #define ASPEED_LPC_NR_SUBDEVS   5
 
-typedef struct AspeedLPCState {
+struct AspeedLPCState {
     /* <private> */
     SysBusDevice parent;
 
@@ -42,6 +44,6 @@ typedef struct AspeedLPCState {
 
     uint32_t regs[ASPEED_LPC_NR_REGS];
     uint32_t hicr7;
-} AspeedLPCState;
+};
 
 #endif /* _ASPEED_LPC_H_ */
diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
index 3df4ceedd2e..ba4b441dce5 100644
--- a/include/hw/misc/bcm2835_cprman.h
+++ b/include/hw/misc/bcm2835_cprman.h
@@ -11,6 +11,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/qdev-clock.h"
+#include "qom/object.h"
 
 #define TYPE_BCM2835_CPRMAN "bcm2835-cprman"
 
diff --git a/include/hw/misc/bcm2835_cprman_internals.h b/include/hw/misc/bcm2835_cprman_internals.h
index 339759b3071..f5410580bff 100644
--- a/include/hw/misc/bcm2835_cprman_internals.h
+++ b/include/hw/misc/bcm2835_cprman_internals.h
@@ -11,6 +11,7 @@
 
 #include "hw/registerfields.h"
 #include "hw/misc/bcm2835_cprman.h"
+#include "qom/object.h"
 
 #define TYPE_CPRMAN_PLL "bcm2835-cprman-pll"
 #define TYPE_CPRMAN_PLL_CHANNEL "bcm2835-cprman-pll-channel"
diff --git a/include/hw/misc/mchp_pfsoc_dmc.h b/include/hw/misc/mchp_pfsoc_dmc.h
index 2baa1413b0c..979527957ea 100644
--- a/include/hw/misc/mchp_pfsoc_dmc.h
+++ b/include/hw/misc/mchp_pfsoc_dmc.h
@@ -22,6 +22,7 @@
 
 #ifndef MCHP_PFSOC_DMC_H
 #define MCHP_PFSOC_DMC_H
+#include "qom/object.h"
 
 /* DDR SGMII PHY module */
 
diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
index 9235523e334..519b897250f 100644
--- a/include/hw/misc/mchp_pfsoc_ioscb.h
+++ b/include/hw/misc/mchp_pfsoc_ioscb.h
@@ -22,6 +22,7 @@
 
 #ifndef MCHP_PFSOC_IOSCB_H
 #define MCHP_PFSOC_IOSCB_H
+#include "qom/object.h"
 
 typedef struct MchpPfSoCIoscbState {
     SysBusDevice parent;
diff --git a/include/hw/misc/mchp_pfsoc_sysreg.h b/include/hw/misc/mchp_pfsoc_sysreg.h
index 546ba68f6a1..d6803be9485 100644
--- a/include/hw/misc/mchp_pfsoc_sysreg.h
+++ b/include/hw/misc/mchp_pfsoc_sysreg.h
@@ -22,6 +22,7 @@
 
 #ifndef MCHP_PFSOC_SYSREG_H
 #define MCHP_PFSOC_SYSREG_H
+#include "qom/object.h"
 
 #define MCHP_PFSOC_SYSREG_REG_SIZE  0x2000
 
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
index d5c8d16ca42..a849345620e 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -19,6 +19,7 @@
 #include "exec/memory.h"
 #include "hw/clock.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /*
  * Number of registers in our device state structure. Don't change this without
diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index 13109d9d324..482768c8e76 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -18,6 +18,7 @@
 
 #include "exec/memory.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /*
  * Number of registers in our device state structure. Don't change this without
diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h
index 7ad632a93a1..c6643bd04fd 100644
--- a/include/hw/misc/npcm7xx_pwm.h
+++ b/include/hw/misc/npcm7xx_pwm.h
@@ -19,6 +19,7 @@
 #include "hw/clock.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
+#include "qom/object.h"
 
 /* Each PWM module holds 4 PWM channels. */
 #define NPCM7XX_PWM_PER_MODULE 4
diff --git a/include/hw/misc/npcm7xx_rng.h b/include/hw/misc/npcm7xx_rng.h
index 5e85fd439d8..1d20293608a 100644
--- a/include/hw/misc/npcm7xx_rng.h
+++ b/include/hw/misc/npcm7xx_rng.h
@@ -17,6 +17,7 @@
 #define NPCM7XX_RNG_H
 
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 typedef struct NPCM7xxRNGState {
     SysBusDevice parent;
diff --git a/include/hw/misc/xlnx-versal-xramc.h b/include/hw/misc/xlnx-versal-xramc.h
index d3d1862676f..ba0d0f3c5af 100644
--- a/include/hw/misc/xlnx-versal-xramc.h
+++ b/include/hw/misc/xlnx-versal-xramc.h
@@ -11,9 +11,11 @@
 
 #include "hw/sysbus.h"
 #include "hw/register.h"
+#include "qom/object.h"
 
 #define TYPE_XLNX_XRAM_CTRL "xlnx.versal-xramc"
 
+typedef struct XlnxXramCtrl XlnxXramCtrl;
 #define XLNX_XRAM_CTRL(obj) \
      OBJECT_CHECK(XlnxXramCtrl, (obj), TYPE_XLNX_XRAM_CTRL)
 
@@ -80,7 +82,7 @@ REG32(XRAM_SAFETY_CHK, 0xff8)
 
 #define XRAM_CTRL_R_MAX (R_XRAM_SAFETY_CHK + 1)
 
-typedef struct XlnxXramCtrl {
+struct XlnxXramCtrl {
     SysBusDevice parent_obj;
     MemoryRegion ram;
     qemu_irq irq;
@@ -93,5 +95,5 @@ typedef struct XlnxXramCtrl {
     RegisterInfoArray *reg_array;
     uint32_t regs[XRAM_CTRL_R_MAX];
     RegisterInfo regs_info[XRAM_CTRL_R_MAX];
-} XlnxXramCtrl;
+};
 #endif
diff --git a/include/hw/net/npcm7xx_emc.h b/include/hw/net/npcm7xx_emc.h
index eac7f298167..5b676f669cd 100644
--- a/include/hw/net/npcm7xx_emc.h
+++ b/include/hw/net/npcm7xx_emc.h
@@ -20,6 +20,7 @@
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "net/net.h"
+#include "qom/object.h"
 
 /* 32-bit register indices. */
 enum NPCM7xxPWMRegister {
diff --git a/include/hw/net/xlnx-zynqmp-can.h b/include/hw/net/xlnx-zynqmp-can.h
index eb1558708bb..3d80c7455db 100644
--- a/include/hw/net/xlnx-zynqmp-can.h
+++ b/include/hw/net/xlnx-zynqmp-can.h
@@ -36,9 +36,11 @@
 #include "qemu/fifo32.h"
 #include "hw/ptimer.h"
 #include "hw/qdev-clock.h"
+#include "qom/object.h"
 
 #define TYPE_XLNX_ZYNQMP_CAN "xlnx.zynqmp-can"
 
+typedef struct XlnxZynqMPCANState XlnxZynqMPCANState;
 #define XLNX_ZYNQMP_CAN(obj) \
      OBJECT_CHECK(XlnxZynqMPCANState, (obj), TYPE_XLNX_ZYNQMP_CAN)
 
@@ -52,7 +54,7 @@
 #define CAN_FRAME_SIZE     4
 #define RXFIFO_SIZE        (MAILBOX_CAPACITY * CAN_FRAME_SIZE)
 
-typedef struct XlnxZynqMPCANState {
+struct XlnxZynqMPCANState {
     SysBusDevice        parent_obj;
     MemoryRegion        iomem;
 
@@ -73,6 +75,6 @@ typedef struct XlnxZynqMPCANState {
     Fifo32              txhpb_fifo;
 
     ptimer_state        *can_timer;
-} XlnxZynqMPCANState;
+};
 
 #endif
diff --git a/include/hw/nmi.h b/include/hw/nmi.h
index fff41bebc69..529ab736f8f 100644
--- a/include/hw/nmi.h
+++ b/include/hw/nmi.h
@@ -29,10 +29,10 @@
 typedef struct NMIClass NMIClass;
 DECLARE_CLASS_CHECKERS(NMIClass, NMI,
                        TYPE_NMI)
+typedef struct NMIState NMIState;
 #define NMI(obj) \
      INTERFACE_CHECK(NMIState, (obj), TYPE_NMI)
 
-typedef struct NMIState NMIState;
 
 struct NMIClass {
     InterfaceClass parent_class;
diff --git a/include/hw/nvram/npcm7xx_otp.h b/include/hw/nvram/npcm7xx_otp.h
index 156bbd151ab..32c73845ff3 100644
--- a/include/hw/nvram/npcm7xx_otp.h
+++ b/include/hw/nvram/npcm7xx_otp.h
@@ -18,6 +18,7 @@
 
 #include "exec/memory.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /* Each OTP module holds 8192 bits of one-time programmable storage */
 #define NPCM7XX_OTP_ARRAY_BITS (8192)
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 02a63b36666..83019d3f672 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -20,6 +20,8 @@
 #include "qapi/error.h"
 
 #define TYPE_SPAPR_DR_CONNECTOR "spapr-dr-connector"
+typedef struct SpaprDrc SpaprDrc;
+typedef struct SpaprDrcClass SpaprDrcClass;
 #define SPAPR_DR_CONNECTOR_GET_CLASS(obj) \
         OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DR_CONNECTOR)
 #define SPAPR_DR_CONNECTOR_CLASS(klass) \
@@ -29,6 +31,7 @@
                                              TYPE_SPAPR_DR_CONNECTOR)
 
 #define TYPE_SPAPR_DRC_PHYSICAL "spapr-drc-physical"
+typedef struct SpaprDrcPhysical SpaprDrcPhysical;
 #define SPAPR_DRC_PHYSICAL(obj) OBJECT_CHECK(SpaprDrcPhysical, (obj), \
                                              TYPE_SPAPR_DRC_PHYSICAL)
 
@@ -168,7 +171,7 @@ typedef enum {
     SPAPR_DRC_STATE_PHYSICAL_CONFIGURED = 8,
 } SpaprDrcState;
 
-typedef struct SpaprDrc {
+struct SpaprDrc {
     /*< private >*/
     DeviceState parent;
 
@@ -187,11 +190,11 @@ typedef struct SpaprDrc {
     bool unplug_requested;
     void *fdt;
     int fdt_start_offset;
-} SpaprDrc;
+};
 
 struct SpaprMachineState;
 
-typedef struct SpaprDrcClass {
+struct SpaprDrcClass {
     /*< private >*/
     DeviceClass parent;
     SpaprDrcState empty_state;
@@ -209,15 +212,15 @@ typedef struct SpaprDrcClass {
 
     int (*dt_populate)(SpaprDrc *drc, struct SpaprMachineState *spapr,
                        void *fdt, int *fdt_start_offset, Error **errp);
-} SpaprDrcClass;
+};
 
-typedef struct SpaprDrcPhysical {
+struct SpaprDrcPhysical {
     /*< private >*/
     SpaprDrc parent;
 
     /* DR-indicator */
     uint32_t dr_indicator;
-} SpaprDrcPhysical;
+};
 
 static inline bool spapr_drc_hotplugged(DeviceState *dev)
 {
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index b282960ad90..d1371b2dbba 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -12,15 +12,18 @@
 
 #include "hw/ppc/spapr_irq.h"
 #include "hw/ppc/xive.h"
+#include "qom/object.h"
 
 #define TYPE_SPAPR_XIVE "spapr-xive"
+typedef struct SpaprXive SpaprXive;
+typedef struct SpaprXiveClass SpaprXiveClass;
 #define SPAPR_XIVE(obj) OBJECT_CHECK(SpaprXive, (obj), TYPE_SPAPR_XIVE)
 #define SPAPR_XIVE_CLASS(klass)                                         \
     OBJECT_CLASS_CHECK(SpaprXiveClass, (klass), TYPE_SPAPR_XIVE)
 #define SPAPR_XIVE_GET_CLASS(obj)                               \
     OBJECT_GET_CLASS(SpaprXiveClass, (obj), TYPE_SPAPR_XIVE)
 
-typedef struct SpaprXive {
+struct SpaprXive {
     XiveRouter    parent;
 
     /* Internal interrupt source for IPIs and virtual devices */
@@ -51,13 +54,13 @@ typedef struct SpaprXive {
     VMChangeStateEntry *change;
 
     uint8_t       hv_prio;
-} SpaprXive;
+};
 
-typedef struct SpaprXiveClass {
+struct SpaprXiveClass {
     XiveRouterClass parent;
 
     DeviceRealize parent_realize;
-} SpaprXiveClass;
+};
 
 /*
  * The sPAPR machine has a unique XIVE IC device. Assign a fixed value
diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
index 97fdef758bf..dd2b11ed6be 100644
--- a/include/hw/ppc/vof.h
+++ b/include/hw/ppc/vof.h
@@ -5,6 +5,7 @@
  */
 #ifndef HW_VOF_H
 #define HW_VOF_H
+#include "qom/object.h"
 
 typedef struct Vof {
     uint64_t top_addr; /* copied from rma_size */
diff --git a/include/hw/rdma/rdma.h b/include/hw/rdma/rdma.h
index e77e43a1709..e64104d631e 100644
--- a/include/hw/rdma/rdma.h
+++ b/include/hw/rdma/rdma.h
@@ -22,11 +22,11 @@
 typedef struct RdmaProviderClass RdmaProviderClass;
 DECLARE_CLASS_CHECKERS(RdmaProviderClass, RDMA_PROVIDER,
                        INTERFACE_RDMA_PROVIDER)
+typedef struct RdmaProvider RdmaProvider;
 #define RDMA_PROVIDER(obj) \
     INTERFACE_CHECK(RdmaProvider, (obj), \
                     INTERFACE_RDMA_PROVIDER)
 
-typedef struct RdmaProvider RdmaProvider;
 
 struct RdmaProviderClass {
     InterfaceClass parent;
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index d30916f45d4..3f83f9d98da 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -29,6 +29,7 @@
 #include "hw/misc/mchp_pfsoc_sysreg.h"
 #include "hw/net/cadence_gem.h"
 #include "hw/sd/cadence_sdhci.h"
+#include "qom/object.h"
 
 typedef struct MicrochipPFSoCState {
     /*< private >*/
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index 50a2b790860..e07bca3a357 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -22,12 +22,14 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/boards.h"
 #include "hw/char/shakti_uart.h"
+#include "qom/object.h"
 
 #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
+typedef struct ShaktiCSoCState ShaktiCSoCState;
 #define RISCV_SHAKTI_SOC(obj) \
     OBJECT_CHECK(ShaktiCSoCState, (obj), TYPE_RISCV_SHAKTI_SOC)
 
-typedef struct ShaktiCSoCState {
+struct ShaktiCSoCState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -37,18 +39,19 @@ typedef struct ShaktiCSoCState {
     ShaktiUartState uart;
     MemoryRegion rom;
 
-} ShaktiCSoCState;
+};
 
 #define TYPE_RISCV_SHAKTI_MACHINE MACHINE_TYPE_NAME("shakti_c")
+typedef struct ShaktiCMachineState ShaktiCMachineState;
 #define RISCV_SHAKTI_MACHINE(obj) \
     OBJECT_CHECK(ShaktiCMachineState, (obj), TYPE_RISCV_SHAKTI_MACHINE)
-typedef struct ShaktiCMachineState {
+struct ShaktiCMachineState {
     /*< private >*/
     MachineState parent_obj;
 
     /*< public >*/
     ShaktiCSoCState soc;
-} ShaktiCMachineState;
+};
 
 enum {
     SHAKTI_C_ROM,
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805c..e654e2dfec6 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -22,12 +22,14 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/gpio/sifive_gpio.h"
+#include "qom/object.h"
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
+typedef struct SiFiveESoCState SiFiveESoCState;
 #define RISCV_E_SOC(obj) \
     OBJECT_CHECK(SiFiveESoCState, (obj), TYPE_RISCV_E_SOC)
 
-typedef struct SiFiveESoCState {
+struct SiFiveESoCState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -37,7 +39,7 @@ typedef struct SiFiveESoCState {
     SIFIVEGPIOState gpio;
     MemoryRegion xip_mem;
     MemoryRegion mask_rom;
-} SiFiveESoCState;
+};
 
 typedef struct SiFiveEState {
     /*< private >*/
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 2656b39808a..ef050a22dc2 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -27,12 +27,14 @@
 #include "hw/misc/sifive_u_otp.h"
 #include "hw/misc/sifive_u_prci.h"
 #include "hw/ssi/sifive_spi.h"
+#include "qom/object.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
+typedef struct SiFiveUSoCState SiFiveUSoCState;
 #define RISCV_U_SOC(obj) \
     OBJECT_CHECK(SiFiveUSoCState, (obj), TYPE_RISCV_U_SOC)
 
-typedef struct SiFiveUSoCState {
+struct SiFiveUSoCState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -52,13 +54,14 @@ typedef struct SiFiveUSoCState {
 
     uint32_t serial;
     char *cpu_type;
-} SiFiveUSoCState;
+};
 
 #define TYPE_RISCV_U_MACHINE MACHINE_TYPE_NAME("sifive_u")
+typedef struct SiFiveUState SiFiveUState;
 #define RISCV_U_MACHINE(obj) \
     OBJECT_CHECK(SiFiveUState, (obj), TYPE_RISCV_U_MACHINE)
 
-typedef struct SiFiveUState {
+struct SiFiveUState {
     /*< private >*/
     MachineState parent_obj;
 
@@ -71,7 +74,7 @@ typedef struct SiFiveUState {
     bool start_in_flash;
     uint32_t msel;
     uint32_t serial;
-} SiFiveUState;
+};
 
 enum {
     SIFIVE_U_DEV_DEBUG,
diff --git a/include/hw/rtc/m48t59.h b/include/hw/rtc/m48t59.h
index d9b45eb1612..0b5beb9e2d6 100644
--- a/include/hw/rtc/m48t59.h
+++ b/include/hw/rtc/m48t59.h
@@ -34,10 +34,10 @@
 typedef struct NvramClass NvramClass;
 DECLARE_CLASS_CHECKERS(NvramClass, NVRAM,
                        TYPE_NVRAM)
+typedef struct Nvram Nvram;
 #define NVRAM(obj) \
     INTERFACE_CHECK(Nvram, (obj), TYPE_NVRAM)
 
-typedef struct Nvram Nvram;
 
 struct NvramClass {
     InterfaceClass parent;
diff --git a/include/hw/sd/cadence_sdhci.h b/include/hw/sd/cadence_sdhci.h
index cd8288b7d80..c890e285fca 100644
--- a/include/hw/sd/cadence_sdhci.h
+++ b/include/hw/sd/cadence_sdhci.h
@@ -24,6 +24,7 @@
 #define CADENCE_SDHCI_H
 
 #include "hw/sd/sdhci.h"
+#include "qom/object.h"
 
 #define CADENCE_SDHCI_REG_SIZE  0x100
 #define CADENCE_SDHCI_NUM_REGS  (CADENCE_SDHCI_REG_SIZE / sizeof(uint32_t))
diff --git a/include/hw/ssi/npcm7xx_fiu.h b/include/hw/ssi/npcm7xx_fiu.h
index a3a17042896..01597ea8954 100644
--- a/include/hw/ssi/npcm7xx_fiu.h
+++ b/include/hw/ssi/npcm7xx_fiu.h
@@ -18,6 +18,7 @@
 
 #include "hw/ssi/ssi.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /*
  * Number of registers in our device state structure. Don't change this without
diff --git a/include/hw/ssi/sifive_spi.h b/include/hw/ssi/sifive_spi.h
index 47d0d6a47cc..6ed73ccfef0 100644
--- a/include/hw/ssi/sifive_spi.h
+++ b/include/hw/ssi/sifive_spi.h
@@ -21,13 +21,15 @@
 
 #ifndef HW_SIFIVE_SPI_H
 #define HW_SIFIVE_SPI_H
+#include "qom/object.h"
 
 #define SIFIVE_SPI_REG_NUM  (0x78 / 4)
 
 #define TYPE_SIFIVE_SPI "sifive.spi"
+typedef struct SiFiveSPIState SiFiveSPIState;
 #define SIFIVE_SPI(obj) OBJECT_CHECK(SiFiveSPIState, (obj), TYPE_SIFIVE_SPI)
 
-typedef struct SiFiveSPIState {
+struct SiFiveSPIState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
@@ -42,6 +44,6 @@ typedef struct SiFiveSPIState {
     Fifo8 rx_fifo;
 
     uint32_t regs[SIFIVE_SPI_REG_NUM];
-} SiFiveSPIState;
+};
 
 #endif /* HW_SIFIVE_SPI_H */
diff --git a/include/hw/stream.h b/include/hw/stream.h
index f166facb090..3190cc0dc73 100644
--- a/include/hw/stream.h
+++ b/include/hw/stream.h
@@ -8,10 +8,10 @@
 typedef struct StreamSinkClass StreamSinkClass;
 DECLARE_CLASS_CHECKERS(StreamSinkClass, STREAM_SINK,
                        TYPE_STREAM_SINK)
+typedef struct StreamSink StreamSink;
 #define STREAM_SINK(obj) \
      INTERFACE_CHECK(StreamSink, (obj), TYPE_STREAM_SINK)
 
-typedef struct StreamSink StreamSink;
 
 typedef void (*StreamCanPushNotifyFn)(void *opaque);
 
diff --git a/include/hw/timer/npcm7xx_timer.h b/include/hw/timer/npcm7xx_timer.h
index d45c051b56a..d06b14acdc0 100644
--- a/include/hw/timer/npcm7xx_timer.h
+++ b/include/hw/timer/npcm7xx_timer.h
@@ -19,6 +19,7 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
+#include "qom/object.h"
 
 /* Each Timer Module (TIM) instance holds five 25 MHz timers. */
 #define NPCM7XX_TIMERS_PER_CTRL (5)
diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
index e93c883872d..f6a2dd25320 100644
--- a/include/hw/tricore/tricore_testdevice.h
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -21,18 +21,20 @@
 
 #include "hw/sysbus.h"
 #include "hw/hw.h"
+#include "qom/object.h"
 
 #define TYPE_TRICORE_TESTDEVICE "tricore_testdevice"
+typedef struct TriCoreTestDeviceState TriCoreTestDeviceState;
 #define TRICORE_TESTDEVICE(obj) \
     OBJECT_CHECK(TriCoreTestDeviceState, (obj), TYPE_TRICORE_TESTDEVICE)
 
-typedef struct TriCoreTestDeviceState {
+struct TriCoreTestDeviceState {
     /* <private> */
     SysBusDevice parent_obj;
 
     /* <public> */
     MemoryRegion iomem;
 
-} TriCoreTestDeviceState;
+};
 
 #endif
diff --git a/include/hw/usb/hcd-dwc3.h b/include/hw/usb/hcd-dwc3.h
index 7c804d536d5..799a701bae3 100644
--- a/include/hw/usb/hcd-dwc3.h
+++ b/include/hw/usb/hcd-dwc3.h
@@ -28,16 +28,18 @@
 
 #include "hw/usb/hcd-xhci.h"
 #include "hw/usb/hcd-xhci-sysbus.h"
+#include "qom/object.h"
 
 #define TYPE_USB_DWC3 "usb_dwc3"
 
+typedef struct USBDWC3 USBDWC3;
 #define USB_DWC3(obj) \
      OBJECT_CHECK(USBDWC3, (obj), TYPE_USB_DWC3)
 
 #define USB_DWC3_R_MAX ((0x530 / 4) + 1)
 #define DWC3_SIZE 0x10000
 
-typedef struct USBDWC3 {
+struct USBDWC3 {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
     XHCISysbusState sysbus_xhci;
@@ -50,6 +52,6 @@ typedef struct USBDWC3 {
         uint32_t    dwc_usb3_user;
     } cfg;
 
-} USBDWC3;
+};
 
 #endif
diff --git a/include/hw/usb/msd.h b/include/hw/usb/msd.h
index 7538c54569b..82c8b48d561 100644
--- a/include/hw/usb/msd.h
+++ b/include/hw/usb/msd.h
@@ -9,6 +9,7 @@
 
 #include "hw/usb.h"
 #include "hw/scsi/scsi.h"
+#include "qom/object.h"
 
 enum USBMSDMode {
     USB_MSDM_CBW, /* Command Block.  */
diff --git a/include/hw/usb/xlnx-usb-subsystem.h b/include/hw/usb/xlnx-usb-subsystem.h
index 999e423951a..e6175146817 100644
--- a/include/hw/usb/xlnx-usb-subsystem.h
+++ b/include/hw/usb/xlnx-usb-subsystem.h
@@ -27,19 +27,21 @@
 
 #include "hw/usb/xlnx-versal-usb2-ctrl-regs.h"
 #include "hw/usb/hcd-dwc3.h"
+#include "qom/object.h"
 
 #define TYPE_XILINX_VERSAL_USB2 "xlnx.versal-usb2"
 
+typedef struct VersalUsb2 VersalUsb2;
 #define VERSAL_USB2(obj) \
      OBJECT_CHECK(VersalUsb2, (obj), TYPE_XILINX_VERSAL_USB2)
 
-typedef struct VersalUsb2 {
+struct VersalUsb2 {
     SysBusDevice parent_obj;
     MemoryRegion dwc3_mr;
     MemoryRegion usb2Ctrl_mr;
 
     VersalUsb2CtrlRegs usb2Ctrl;
     USBDWC3 dwc3;
-} VersalUsb2;
+};
 
 #endif
diff --git a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
index b76dce04195..7848cac6c1c 100644
--- a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
+++ b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
@@ -25,21 +25,23 @@
 
 #ifndef XLNX_USB2_REGS_H
 #define XLNX_USB2_REGS_H
+#include "qom/object.h"
 
 #define TYPE_XILINX_VERSAL_USB2_CTRL_REGS "xlnx.versal-usb2-ctrl-regs"
 
+typedef struct VersalUsb2CtrlRegs VersalUsb2CtrlRegs;
 #define XILINX_VERSAL_USB2_CTRL_REGS(obj) \
      OBJECT_CHECK(VersalUsb2CtrlRegs, (obj), TYPE_XILINX_VERSAL_USB2_CTRL_REGS)
 
 #define USB2_REGS_R_MAX ((0x78 / 4) + 1)
 
-typedef struct VersalUsb2CtrlRegs {
+struct VersalUsb2CtrlRegs {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
     qemu_irq irq_ir;
 
     uint32_t regs[USB2_REGS_R_MAX];
     RegisterInfo regs_info[USB2_REGS_R_MAX];
-} VersalUsb2CtrlRegs;
+};
 
 #endif
diff --git a/include/hw/vmstate-if.h b/include/hw/vmstate-if.h
index 52df571d17a..0250956967c 100644
--- a/include/hw/vmstate-if.h
+++ b/include/hw/vmstate-if.h
@@ -16,10 +16,10 @@
 typedef struct VMStateIfClass VMStateIfClass;
 DECLARE_CLASS_CHECKERS(VMStateIfClass, VMSTATE_IF,
                        TYPE_VMSTATE_IF)
+typedef struct VMStateIf VMStateIf;
 #define VMSTATE_IF(obj)                             \
     INTERFACE_CHECK(VMStateIf, (obj), TYPE_VMSTATE_IF)
 
-typedef struct VMStateIf VMStateIf;
 
 struct VMStateIfClass {
     InterfaceClass parent_class;
diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
index dcb13bc29dc..babb120f5d3 100644
--- a/include/hw/watchdog/sbsa_gwdt.h
+++ b/include/hw/watchdog/sbsa_gwdt.h
@@ -15,8 +15,10 @@
 #include "qemu/bitops.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
+#include "qom/object.h"
 
 #define TYPE_WDT_SBSA "sbsa_gwdt"
+typedef struct SBSA_GWDTState SBSA_GWDTState;
 #define SBSA_GWDT(obj) \
     OBJECT_CHECK(SBSA_GWDTState, (obj), TYPE_WDT_SBSA)
 
@@ -53,7 +55,7 @@
 
 #define SBSA_TIMER_FREQ      62500000 /* Hz */
 
-typedef struct SBSA_GWDTState {
+struct SBSA_GWDTState {
     /* <private> */
     SysBusDevice parent_obj;
 
@@ -70,6 +72,6 @@ typedef struct SBSA_GWDTState {
     uint32_t woru;
     uint32_t wcvl;
     uint32_t wcvu;
-} SBSA_GWDTState;
+};
 
 #endif /* WDT_SBSA_GWDT_H */
diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 81541e20801..57d5f6c0532 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -10,11 +10,11 @@
 typedef struct UserCreatableClass UserCreatableClass;
 DECLARE_CLASS_CHECKERS(UserCreatableClass, USER_CREATABLE,
                        TYPE_USER_CREATABLE)
+typedef struct UserCreatable UserCreatable;
 #define USER_CREATABLE(obj) \
      INTERFACE_CHECK(UserCreatable, (obj), \
                      TYPE_USER_CREATABLE)
 
-typedef struct UserCreatable UserCreatable;
 
 /**
  * UserCreatableClass:
diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 68b2206463c..4a02a8e0266 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -31,10 +31,10 @@ typedef enum TPMVersion {
 typedef struct TPMIfClass TPMIfClass;
 DECLARE_CLASS_CHECKERS(TPMIfClass, TPM_IF,
                        TYPE_TPM_IF)
+typedef struct TPMIf TPMIf;
 #define TPM_IF(obj)                             \
     INTERFACE_CHECK(TPMIf, (obj), TYPE_TPM_IF)
 
-typedef struct TPMIf TPMIf;
 
 struct TPMIfClass {
     InterfaceClass parent_class;
diff --git a/target/arm/idau.h b/target/arm/idau.h
index 0ef5251971d..600ac9066cf 100644
--- a/target/arm/idau.h
+++ b/target/arm/idau.h
@@ -31,13 +31,13 @@
 #include "qom/object.h"
 
 #define TYPE_IDAU_INTERFACE "idau-interface"
+typedef struct IDAUInterface IDAUInterface;
 #define IDAU_INTERFACE(obj) \
     INTERFACE_CHECK(IDAUInterface, (obj), TYPE_IDAU_INTERFACE)
 typedef struct IDAUInterfaceClass IDAUInterfaceClass;
 DECLARE_CLASS_CHECKERS(IDAUInterfaceClass, IDAU_INTERFACE,
                        TYPE_IDAU_INTERFACE)
 
-typedef struct IDAUInterface IDAUInterface;
 
 #define IREGION_NOTVALID -1
 
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 2855dd38816..20928b9efa5 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -17,6 +17,7 @@
 
 #ifndef HEXAGON_CPU_H
 #define HEXAGON_CPU_H
+#include "qom/object.h"
 
 /* Forward declaration needed by some of the header files */
 typedef struct CPUHexagonState CPUHexagonState;
@@ -101,6 +102,8 @@ struct CPUHexagonState {
     target_ulong gather_issued;
 };
 
+typedef struct HexagonCPUClass HexagonCPUClass;
+typedef struct HexagonCPU HexagonCPU;
 #define HEXAGON_CPU_CLASS(klass) \
     OBJECT_CLASS_CHECK(HexagonCPUClass, (klass), TYPE_HEXAGON_CPU)
 #define HEXAGON_CPU(obj) \
@@ -108,15 +111,15 @@ struct CPUHexagonState {
 #define HEXAGON_CPU_GET_CLASS(obj) \
     OBJECT_GET_CLASS(HexagonCPUClass, (obj), TYPE_HEXAGON_CPU)
 
-typedef struct HexagonCPUClass {
+struct HexagonCPUClass {
     /*< private >*/
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
-} HexagonCPUClass;
+};
 
-typedef struct HexagonCPU {
+struct HexagonCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -125,7 +128,7 @@ typedef struct HexagonCPU {
 
     bool lldb_compat;
     target_ulong lldb_stack_adjust;
-} HexagonCPU;
+};
 
 #include "cpu_bits.h"
 
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index c0812e5dfd6..3ee6aaff265 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -33,6 +33,7 @@
 #include "qemu/accel.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qemu/units.h"
+#include "qom/object.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/boards.h"
 #endif
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index acf9fb8afa0..dcbf6177a1e 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include <sys/ioctl.h>
+#include "qom/object.h"
 
 #ifdef CONFIG_BSD
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index f894338fc6a..4394c0d67c6 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -15,6 +15,7 @@
 #include "hw/arm/bcm2836.h"
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 struct BCM283XClass {
     /*< private >*/
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 72a815dbbd0..bd7e328435a 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -17,6 +17,7 @@
 #include "hw/ptimer.h"
 #include "sysemu/sysemu.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /* General purpose timer module.  */
 typedef struct {
diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
index e6640eb8e72..0d8c0327258 100644
--- a/hw/mem/sparse-mem.c
+++ b/hw/mem/sparse-mem.c
@@ -18,11 +18,13 @@
 #include "qemu/units.h"
 #include "sysemu/qtest.h"
 #include "hw/mem/sparse-mem.h"
+#include "qom/object.h"
 
+typedef struct SparseMemState SparseMemState;
 #define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
 #define SPARSE_BLOCK_SIZE 0x1000
 
-typedef struct SparseMemState {
+struct SparseMemState {
     SysBusDevice parent_obj;
     MemoryRegion mmio;
     uint64_t baseaddr;
@@ -30,7 +32,7 @@ typedef struct SparseMemState {
     uint64_t size_used;
     uint64_t maxsize;
     GHashTable *mapped;
-} SparseMemState;
+};
 
 typedef struct sparse_mem_block {
     uint8_t data[SPARSE_BLOCK_SIZE];
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index ae192db0c8b..abcc01e4087 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -52,6 +52,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "qemu/error-report.h"
+#include "qom/object.h"
 
 #define PM_CNTL_MODE          0x10
 
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index 0b61070c52f..da6b14c545d 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -27,6 +27,7 @@
 #include "qemu/units.h"
 #include "trace.h"
 #include "sysemu/watchdog.h"
+#include "qom/object.h"
 
 /*
  * The reference clock hz, and the SECCNT and CNTR25M registers in this module,
diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 9e3c40a23dc..846b2ff905a 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -15,6 +15,7 @@
 #include "qemu/log.h"
 #include "hw/sysbus.h"
 #include "sysemu/runstate.h"
+#include "qom/object.h"
 
 typedef struct SECUREECState {
     SysBusDevice parent_obj;
diff --git a/hw/net/can/ctucan_pci.c b/hw/net/can/ctucan_pci.c
index f1c86cd06a7..1f277a7c363 100644
--- a/hw/net/can/ctucan_pci.c
+++ b/hw/net/can/ctucan_pci.c
@@ -40,6 +40,7 @@
 #include "net/can_emu.h"
 
 #include "ctucan_core.h"
+#include "qom/object.h"
 
 #define TYPE_CTUCAN_PCI_DEV "ctucan_pci"
 
diff --git a/hw/nvram/npcm7xx_otp.c b/hw/nvram/npcm7xx_otp.c
index c61f2fc1aa2..52b9482419e 100644
--- a/hw/nvram/npcm7xx_otp.c
+++ b/hw/nvram/npcm7xx_otp.c
@@ -23,6 +23,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/units.h"
+#include "qom/object.h"
 
 /* Each module has 4 KiB of register space. Only a fraction of it is used. */
 #define NPCM7XX_OTP_REGS_SIZE (4 * KiB)
diff --git a/hw/s390x/vhost-user-fs-ccw.c b/hw/s390x/vhost-user-fs-ccw.c
index 6c6f2692930..7d573156780 100644
--- a/hw/s390x/vhost-user-fs-ccw.c
+++ b/hw/s390x/vhost-user-fs-ccw.c
@@ -12,6 +12,7 @@
 #include "qapi/error.h"
 #include "hw/virtio/vhost-user-fs.h"
 #include "virtio-ccw.h"
+#include "qom/object.h"
 
 typedef struct VHostUserFSCcw {
     VirtioCcwDevice parent_obj;
diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
index 7310c769be2..80365dbd780 100644
--- a/hw/sensor/adm1272.c
+++ b/hw/sensor/adm1272.c
@@ -16,8 +16,10 @@
 #include "qapi/visitor.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_ADM1272 "adm1272"
+typedef struct ADM1272State ADM1272State;
 #define ADM1272(obj) OBJECT_CHECK(ADM1272State, (obj), TYPE_ADM1272)
 
 #define ADM1272_RESTART_TIME            0xCC
@@ -70,7 +72,7 @@
 #define ADM1272_IOUT_OFFSET             0x5000
 
 
-typedef struct ADM1272State {
+struct ADM1272State {
     PMBusDevice parent;
 
     uint64_t ein_ext;
@@ -96,7 +98,7 @@ typedef struct ADM1272State {
 
     uint16_t strt_up_iout_lim;
 
-} ADM1272State;
+};
 
 static const PMBusCoefficients adm1272_coefficients[] = {
     [0] = { 6770, 0, -2 },        /* voltage, vrange 60V */
diff --git a/hw/sensor/max34451.c b/hw/sensor/max34451.c
index a91d8bd487c..5d50e46b5ba 100644
--- a/hw/sensor/max34451.c
+++ b/hw/sensor/max34451.c
@@ -14,8 +14,10 @@
 #include "qapi/visitor.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qom/object.h"
 
 #define TYPE_MAX34451 "max34451"
+typedef struct MAX34451State MAX34451State;
 #define MAX34451(obj) OBJECT_CHECK(MAX34451State, (obj), TYPE_MAX34451)
 
 #define MAX34451_MFR_MODE               0xD1
@@ -134,7 +136,7 @@
  * @vout_scale: scale ADC reading to actual device reading if different
  * @iout_cal_gain: set ratio of the voltage at the ADC input to sensed current
  */
-typedef struct MAX34451State {
+struct MAX34451State {
     PMBusDevice parent;
 
     uint16_t power_good_on[MAX34451_NUM_PWR_DEVICES];
@@ -168,7 +170,7 @@ typedef struct MAX34451State {
     uint16_t temp_sensor_config[MAX34451_NUM_TEMP_DEVICES];
     uint16_t store_single;
     uint16_t crc;
-} MAX34451State;
+};
 
 
 static void max34451_check_limits(MAX34451State *s)
diff --git a/hw/usb/u2f-emulated.c b/hw/usb/u2f-emulated.c
index 9151feb63d4..7c092e7a93f 100644
--- a/hw/usb/u2f-emulated.c
+++ b/hw/usb/u2f-emulated.c
@@ -34,6 +34,7 @@
 #include <u2f-emu/u2f-emu.h>
 
 #include "u2f.h"
+#include "qom/object.h"
 
 /* Counter which sync with a file */
 struct synced_counter {
diff --git a/hw/usb/u2f-passthru.c b/hw/usb/u2f-passthru.c
index fc93429c9c0..954b8aa3c9b 100644
--- a/hw/usb/u2f-passthru.c
+++ b/hw/usb/u2f-passthru.c
@@ -33,6 +33,7 @@
 #include "migration/vmstate.h"
 
 #include "u2f.h"
+#include "qom/object.h"
 
 #ifdef CONFIG_LIBUDEV
 #include <libudev.h>
diff --git a/hw/virtio/vhost-user-i2c-pci.c b/hw/virtio/vhost-user-i2c-pci.c
index 70b7b65fd97..dd25e593545 100644
--- a/hw/virtio/vhost-user-i2c-pci.c
+++ b/hw/virtio/vhost-user-i2c-pci.c
@@ -10,6 +10,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-i2c.h"
 #include "virtio-pci.h"
+#include "qom/object.h"
 
 struct VHostUserI2CPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/tests/unit/check-qom-interface.c b/tests/unit/check-qom-interface.c
index c99be97ed8b..4f534d09085 100644
--- a/tests/unit/check-qom-interface.c
+++ b/tests/unit/check-qom-interface.c
@@ -19,10 +19,10 @@
 typedef struct TestIfClass TestIfClass;
 DECLARE_CLASS_CHECKERS(TestIfClass, TEST_IF,
                        TYPE_TEST_IF)
+typedef struct TestIf TestIf;
 #define TEST_IF(obj) \
      INTERFACE_CHECK(TestIf, (obj), TYPE_TEST_IF)
 
-typedef struct TestIf TestIf;
 
 struct TestIfClass {
     InterfaceClass parent_class;
diff --git a/ui/vdagent.c b/ui/vdagent.c
index a253a8fe63a..1ca30a97958 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -15,6 +15,7 @@
 #include "qapi/qapi-types-ui.h"
 
 #include "spice/vd_agent.h"
+#include "qom/object.h"
 
 #define VDAGENT_BUFFER_LIMIT (1 * MiB)
 #define VDAGENT_MOUSE_DEFAULT true
-- 
2.31.1


