Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mC7A2-0003ya-8q
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 17:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79z-0003q8-9J
 for qemu-riscv@nongnu.org; Fri, 06 Aug 2021 17:13:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79u-0005PH-VN
 for qemu-riscv@nongnu.org; Fri, 06 Aug 2021 17:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LsHKYT+ND0y4w4fvIKISo/PluqqTTZQCST2QDq9sSXQ=;
 b=QRXpfySVsaTQFhRR81q5ZdiyLRIBTWiFQ94s5iFCHNDyyLVYpwaoXXA8s9rxUC1RE28Uzv
 gI7nvL7R+VsDo0ORYrAtmEiy01EktJeZcaRpoSxhi/Mm9q2YdVkYnHdih7iFbB7eJPQfAH
 2cafRzPHZSFUcWRv9tf6IINsN98Ebvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-zJOGXsDdOeio1annj4sFEw-1; Fri, 06 Aug 2021 17:13:36 -0400
X-MC-Unique: zJOGXsDdOeio1annj4sFEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93C71760C0;
 Fri,  6 Aug 2021 21:13:32 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 585945D9D5;
 Fri,  6 Aug 2021 21:13:12 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Vijai Kumar K <vijai@behindbytes.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-6.2 12/12] [automated] Use OBJECT_DECLARE_SIMPLE_TYPE when
 possible
Date: Fri,  6 Aug 2021 17:11:27 -0400
Message-Id: <20210806211127.646908-13-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-List-Received-Date: Fri, 06 Aug 2021 21:13:44 -0000

Replace typedef + DECLARE_INSTANCE_CHECKER with
equivalent OBJECT_DECLARE_SIMPLE_TYPE macro.

Generated using:

$ ./scripts/codeconverter/converter.py -i \
  --pattern=AddObjectDeclareSimpleType $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Thomas Huth <huth@tuxfamily.org>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>
Cc: Klaus Jensen <its@irrelevant.dk>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vijai Kumar K <vijai@behindbytes.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-ppc@nongnu.org
---
 hw/nvme/nvme.h                              | 10 +++-------
 hw/usb/hcd-xhci-pci.h                       |  4 +---
 hw/usb/hcd-xhci-sysbus.h                    |  4 +---
 include/hw/adc/npcm7xx_adc.h                |  4 +---
 include/hw/char/shakti_uart.h               |  4 +---
 include/hw/dma/sifive_pdma.h                |  4 +---
 include/hw/dma/xlnx_csu_dma.h               |  4 +---
 include/hw/gpio/sifive_gpio.h               |  4 +---
 include/hw/intc/m68k_irqc.h                 |  4 +---
 include/hw/intc/sifive_clint.h              |  4 +---
 include/hw/intc/sifive_plic.h               |  4 +---
 include/hw/misc/aspeed_lpc.h                |  4 +---
 include/hw/misc/bcm2835_cprman_internals.h  | 12 ++++--------
 include/hw/misc/led.h                       |  3 +--
 include/hw/misc/mchp_pfsoc_dmc.h            |  8 ++------
 include/hw/misc/mchp_pfsoc_ioscb.h          |  4 +---
 include/hw/misc/mchp_pfsoc_sysreg.h         |  4 +---
 include/hw/misc/npcm7xx_clk.h               |  3 +--
 include/hw/misc/npcm7xx_gcr.h               |  4 +---
 include/hw/misc/npcm7xx_mft.h               |  4 +---
 include/hw/misc/npcm7xx_pwm.h               |  3 +--
 include/hw/misc/sifive_e_prci.h             |  4 +---
 include/hw/misc/sifive_test.h               |  4 +---
 include/hw/misc/sifive_u_otp.h              |  4 +---
 include/hw/misc/sifive_u_prci.h             |  4 +---
 include/hw/misc/xlnx-versal-xramc.h         |  4 +---
 include/hw/net/npcm7xx_emc.h                |  4 +---
 include/hw/net/xlnx-zynqmp-can.h            |  4 +---
 include/hw/ppc/spapr_drc.h                  |  4 +---
 include/hw/register.h                       |  3 +--
 include/hw/riscv/microchip_pfsoc.h          |  4 +---
 include/hw/riscv/shakti_c.h                 |  8 ++------
 include/hw/riscv/sifive_e.h                 |  4 +---
 include/hw/riscv/sifive_u.h                 |  4 +---
 include/hw/sd/cadence_sdhci.h               |  4 +---
 include/hw/ssi/sifive_spi.h                 |  4 +---
 include/hw/timer/npcm7xx_timer.h            |  3 +--
 include/hw/tricore/tricore_testdevice.h     |  4 +---
 include/hw/usb/hcd-dwc3.h                   |  4 +---
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  4 +---
 hw/m68k/mcf5206.c                           |  4 +---
 hw/mips/boston.c                            |  4 +---
 hw/misc/npcm7xx_clk.c                       |  9 +++------
 hw/net/can/ctucan_pci.c                     |  4 +---
 hw/s390x/vhost-user-fs-ccw.c                |  4 +---
 hw/sensor/adm1272.c                         |  4 +---
 hw/sensor/max34451.c                        |  4 +---
 47 files changed, 56 insertions(+), 154 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index c4c43da5c17..a9ee5c4f1de 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -42,9 +42,7 @@ typedef struct NvmeBus {
 } NvmeBus;
 
 #define TYPE_NVME_SUBSYS "nvme-subsys"
-typedef struct NvmeSubsystem NvmeSubsystem;
-DECLARE_INSTANCE_CHECKER(NvmeSubsystem, NVME_SUBSYS,
-                         TYPE_NVME_SUBSYS)
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeSubsystem, NVME_SUBSYS)
 
 struct NvmeSubsystem {
     DeviceState parent_obj;
@@ -83,8 +81,7 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
 }
 
 #define TYPE_NVME_NS "nvme-ns"
-DECLARE_INSTANCE_CHECKER(NvmeNamespace, NVME_NS,
-                         TYPE_NVME_NS)
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeNamespace, NVME_NS)
 
 typedef struct NvmeZone {
     NvmeZoneDescr   d;
@@ -377,8 +374,7 @@ typedef struct NvmeCQueue {
 } NvmeCQueue;
 
 #define TYPE_NVME "nvme"
-DECLARE_INSTANCE_CHECKER(NvmeCtrl, NVME,
-                         TYPE_NVME)
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeCtrl, NVME)
 
 typedef struct NvmeParams {
     char     *serial;
diff --git a/hw/usb/hcd-xhci-pci.h b/hw/usb/hcd-xhci-pci.h
index d83aad82e04..2ad2eeefb7f 100644
--- a/hw/usb/hcd-xhci-pci.h
+++ b/hw/usb/hcd-xhci-pci.h
@@ -29,9 +29,7 @@
 #include "qom/object.h"
 
 #define TYPE_XHCI_PCI "pci-xhci"
-typedef struct XHCIPciState XHCIPciState;
-DECLARE_INSTANCE_CHECKER(XHCIPciState, XHCI_PCI,
-                         TYPE_XHCI_PCI)
+OBJECT_DECLARE_SIMPLE_TYPE(XHCIPciState, XHCI_PCI)
 
 
 struct XHCIPciState {
diff --git a/hw/usb/hcd-xhci-sysbus.h b/hw/usb/hcd-xhci-sysbus.h
index 561e5144e05..512d4a40e19 100644
--- a/hw/usb/hcd-xhci-sysbus.h
+++ b/hw/usb/hcd-xhci-sysbus.h
@@ -16,9 +16,7 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
-typedef struct XHCISysbusState XHCISysbusState;
-DECLARE_INSTANCE_CHECKER(XHCISysbusState, XHCI_SYSBUS,
-                         TYPE_XHCI_SYSBUS)
+OBJECT_DECLARE_SIMPLE_TYPE(XHCISysbusState, XHCI_SYSBUS)
 
 
 struct XHCISysbusState {
diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h
index b694adece6a..08992229f09 100644
--- a/include/hw/adc/npcm7xx_adc.h
+++ b/include/hw/adc/npcm7xx_adc.h
@@ -62,10 +62,8 @@ struct NPCM7xxADCState {
 
     uint16_t     calibration_r_values[NPCM7XX_ADC_NUM_CALIB];
 };
-typedef struct NPCM7xxADCState NPCM7xxADCState;
 
 #define TYPE_NPCM7XX_ADC "npcm7xx-adc"
-DECLARE_INSTANCE_CHECKER(NPCM7xxADCState, NPCM7XX_ADC,
-                         TYPE_NPCM7XX_ADC)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxADCState, NPCM7XX_ADC)
 
 #endif /* NPCM7XX_ADC_H */
diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h
index 9bec3062af0..2c305562e78 100644
--- a/include/hw/char/shakti_uart.h
+++ b/include/hw/char/shakti_uart.h
@@ -49,9 +49,7 @@
 #define SHAKTI_UART_CONTROL_DEFAULT 0x0100
 
 #define TYPE_SHAKTI_UART "shakti-uart"
-typedef struct ShaktiUartState ShaktiUartState;
-DECLARE_INSTANCE_CHECKER(ShaktiUartState, SHAKTI_UART,
-                         TYPE_SHAKTI_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(ShaktiUartState, SHAKTI_UART)
 
 struct ShaktiUartState {
     /* <private> */
diff --git a/include/hw/dma/sifive_pdma.h b/include/hw/dma/sifive_pdma.h
index d81526cfc2f..f1fb9093358 100644
--- a/include/hw/dma/sifive_pdma.h
+++ b/include/hw/dma/sifive_pdma.h
@@ -49,11 +49,9 @@ struct SiFivePDMAState {
 
     struct sifive_pdma_chan chan[SIFIVE_PDMA_CHANS];
 };
-typedef struct SiFivePDMAState SiFivePDMAState;
 
 #define TYPE_SIFIVE_PDMA    "sifive.pdma"
 
-DECLARE_INSTANCE_CHECKER(SiFivePDMAState, SIFIVE_PDMA,
-                         TYPE_SIFIVE_PDMA)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFivePDMAState, SIFIVE_PDMA)
 
 #endif /* SIFIVE_PDMA_H */
diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 36433d189ac..1ef9f36f89d 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -46,9 +46,7 @@ struct XlnxCSUDMA {
     uint32_t regs[XLNX_CSU_DMA_R_MAX];
     RegisterInfo regs_info[XLNX_CSU_DMA_R_MAX];
 };
-typedef struct XlnxCSUDMA XlnxCSUDMA;
 
-DECLARE_INSTANCE_CHECKER(XlnxCSUDMA, XLNX_CSU_DMA,
-                         TYPE_XLNX_CSU_DMA)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxCSUDMA, XLNX_CSU_DMA)
 
 #endif
diff --git a/include/hw/gpio/sifive_gpio.h b/include/hw/gpio/sifive_gpio.h
index fc53785c9d0..6c44e33fbe3 100644
--- a/include/hw/gpio/sifive_gpio.h
+++ b/include/hw/gpio/sifive_gpio.h
@@ -18,9 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_SIFIVE_GPIO "sifive_soc.gpio"
-typedef struct SIFIVEGPIOState SIFIVEGPIOState;
-DECLARE_INSTANCE_CHECKER(SIFIVEGPIOState, SIFIVE_GPIO,
-                         TYPE_SIFIVE_GPIO)
+OBJECT_DECLARE_SIMPLE_TYPE(SIFIVEGPIOState, SIFIVE_GPIO)
 
 #define SIFIVE_GPIO_PINS 32
 
diff --git a/include/hw/intc/m68k_irqc.h b/include/hw/intc/m68k_irqc.h
index 843cec3c666..4cb19918134 100644
--- a/include/hw/intc/m68k_irqc.h
+++ b/include/hw/intc/m68k_irqc.h
@@ -14,9 +14,7 @@
 #include "qom/object.h"
 
 #define TYPE_M68K_IRQC "m68k-irq-controller"
-typedef struct M68KIRQCState M68KIRQCState;
-DECLARE_INSTANCE_CHECKER(M68KIRQCState, M68K_IRQC,
-                         TYPE_M68K_IRQC)
+OBJECT_DECLARE_SIMPLE_TYPE(M68KIRQCState, M68K_IRQC)
 
 #define M68K_IRQC_AUTOVECTOR_BASE 25
 
diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clint.h
index c7df3f7f2b3..349f5ad14dd 100644
--- a/include/hw/intc/sifive_clint.h
+++ b/include/hw/intc/sifive_clint.h
@@ -25,9 +25,7 @@
 
 #define TYPE_SIFIVE_CLINT "riscv.sifive.clint"
 
-typedef struct SiFiveCLINTState SiFiveCLINTState;
-DECLARE_INSTANCE_CHECKER(SiFiveCLINTState, SIFIVE_CLINT,
-                         TYPE_SIFIVE_CLINT)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveCLINTState, SIFIVE_CLINT)
 
 struct SiFiveCLINTState {
     /*< private >*/
diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.h
index 1e451a270c7..0cdb7d584c9 100644
--- a/include/hw/intc/sifive_plic.h
+++ b/include/hw/intc/sifive_plic.h
@@ -26,9 +26,7 @@
 
 #define TYPE_SIFIVE_PLIC "riscv.sifive.plic"
 
-typedef struct SiFivePLICState SiFivePLICState;
-DECLARE_INSTANCE_CHECKER(SiFivePLICState, SIFIVE_PLIC,
-                         TYPE_SIFIVE_PLIC)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFivePLICState, SIFIVE_PLIC)
 
 typedef enum PLICMode {
     PLICMode_U,
diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_lpc.h
index d8e5af6296b..dd6a63e6a53 100644
--- a/include/hw/misc/aspeed_lpc.h
+++ b/include/hw/misc/aspeed_lpc.h
@@ -16,9 +16,7 @@
 #include "qom/object.h"
 
 #define TYPE_ASPEED_LPC "aspeed.lpc"
-typedef struct AspeedLPCState AspeedLPCState;
-DECLARE_INSTANCE_CHECKER(AspeedLPCState, ASPEED_LPC,
-                         TYPE_ASPEED_LPC)
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedLPCState, ASPEED_LPC)
 
 #define ASPEED_LPC_NR_REGS      (0x260 >> 2)
 
diff --git a/include/hw/misc/bcm2835_cprman_internals.h b/include/hw/misc/bcm2835_cprman_internals.h
index f5410580bff..db297e5b18c 100644
--- a/include/hw/misc/bcm2835_cprman_internals.h
+++ b/include/hw/misc/bcm2835_cprman_internals.h
@@ -18,14 +18,10 @@
 #define TYPE_CPRMAN_CLOCK_MUX "bcm2835-cprman-clock-mux"
 #define TYPE_CPRMAN_DSI0HSCK_MUX "bcm2835-cprman-dsi0hsck-mux"
 
-DECLARE_INSTANCE_CHECKER(CprmanPllState, CPRMAN_PLL,
-                         TYPE_CPRMAN_PLL)
-DECLARE_INSTANCE_CHECKER(CprmanPllChannelState, CPRMAN_PLL_CHANNEL,
-                         TYPE_CPRMAN_PLL_CHANNEL)
-DECLARE_INSTANCE_CHECKER(CprmanClockMuxState, CPRMAN_CLOCK_MUX,
-                         TYPE_CPRMAN_CLOCK_MUX)
-DECLARE_INSTANCE_CHECKER(CprmanDsi0HsckMuxState, CPRMAN_DSI0HSCK_MUX,
-                         TYPE_CPRMAN_DSI0HSCK_MUX)
+OBJECT_DECLARE_SIMPLE_TYPE(CprmanPllState, CPRMAN_PLL)
+OBJECT_DECLARE_SIMPLE_TYPE(CprmanPllChannelState, CPRMAN_PLL_CHANNEL)
+OBJECT_DECLARE_SIMPLE_TYPE(CprmanClockMuxState, CPRMAN_CLOCK_MUX)
+OBJECT_DECLARE_SIMPLE_TYPE(CprmanDsi0HsckMuxState, CPRMAN_DSI0HSCK_MUX)
 
 /* Register map */
 
diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
index 29c08795708..b4a090db3bf 100644
--- a/include/hw/misc/led.h
+++ b/include/hw/misc/led.h
@@ -51,8 +51,7 @@ struct LEDState {
      */
     bool gpio_active_high;
 };
-typedef struct LEDState LEDState;
-DECLARE_INSTANCE_CHECKER(LEDState, LED, TYPE_LED)
+OBJECT_DECLARE_SIMPLE_TYPE(LEDState, LED)
 
 /**
  * led_set_intensity: Set the intensity of a LED device
diff --git a/include/hw/misc/mchp_pfsoc_dmc.h b/include/hw/misc/mchp_pfsoc_dmc.h
index 3a0e3bbba76..ece1dfe6954 100644
--- a/include/hw/misc/mchp_pfsoc_dmc.h
+++ b/include/hw/misc/mchp_pfsoc_dmc.h
@@ -32,12 +32,10 @@ struct MchpPfSoCDdrSgmiiPhyState {
     SysBusDevice parent;
     MemoryRegion sgmii_phy;
 };
-typedef struct MchpPfSoCDdrSgmiiPhyState MchpPfSoCDdrSgmiiPhyState;
 
 #define TYPE_MCHP_PFSOC_DDR_SGMII_PHY "mchp.pfsoc.ddr_sgmii_phy"
 
-DECLARE_INSTANCE_CHECKER(MchpPfSoCDdrSgmiiPhyState, MCHP_PFSOC_DDR_SGMII_PHY,
-                         TYPE_MCHP_PFSOC_DDR_SGMII_PHY)
+OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCDdrSgmiiPhyState, MCHP_PFSOC_DDR_SGMII_PHY)
 
 /* DDR CFG module */
 
@@ -47,11 +45,9 @@ struct MchpPfSoCDdrCfgState {
     SysBusDevice parent;
     MemoryRegion cfg;
 };
-typedef struct MchpPfSoCDdrCfgState MchpPfSoCDdrCfgState;
 
 #define TYPE_MCHP_PFSOC_DDR_CFG "mchp.pfsoc.ddr_cfg"
 
-DECLARE_INSTANCE_CHECKER(MchpPfSoCDdrCfgState, MCHP_PFSOC_DDR_CFG,
-                         TYPE_MCHP_PFSOC_DDR_CFG)
+OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCDdrCfgState, MCHP_PFSOC_DDR_CFG)
 
 #endif /* MCHP_PFSOC_DMC_H */
diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
index 18ef5ff1739..d6d8e18b2c5 100644
--- a/include/hw/misc/mchp_pfsoc_ioscb.h
+++ b/include/hw/misc/mchp_pfsoc_ioscb.h
@@ -42,11 +42,9 @@ struct MchpPfSoCIoscbState {
     MemoryRegion bc_sgmii;
     MemoryRegion io_calib_sgmii;
 };
-typedef struct MchpPfSoCIoscbState MchpPfSoCIoscbState;
 
 #define TYPE_MCHP_PFSOC_IOSCB "mchp.pfsoc.ioscb"
 
-DECLARE_INSTANCE_CHECKER(MchpPfSoCIoscbState, MCHP_PFSOC_IOSCB,
-                         TYPE_MCHP_PFSOC_IOSCB)
+OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCIoscbState, MCHP_PFSOC_IOSCB)
 
 #endif /* MCHP_PFSOC_IOSCB_H */
diff --git a/include/hw/misc/mchp_pfsoc_sysreg.h b/include/hw/misc/mchp_pfsoc_sysreg.h
index c842cf7e716..b17b6f8831c 100644
--- a/include/hw/misc/mchp_pfsoc_sysreg.h
+++ b/include/hw/misc/mchp_pfsoc_sysreg.h
@@ -30,11 +30,9 @@ struct MchpPfSoCSysregState {
     SysBusDevice parent;
     MemoryRegion sysreg;
 };
-typedef struct MchpPfSoCSysregState MchpPfSoCSysregState;
 
 #define TYPE_MCHP_PFSOC_SYSREG "mchp.pfsoc.sysreg"
 
-DECLARE_INSTANCE_CHECKER(MchpPfSoCSysregState, MCHP_PFSOC_SYSREG,
-                         TYPE_MCHP_PFSOC_SYSREG)
+OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCSysregState, MCHP_PFSOC_SYSREG)
 
 #endif /* MCHP_PFSOC_SYSREG_H */
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
index 023a1aed7a9..93b441c42e3 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -179,7 +179,6 @@ struct NPCM7xxCLKState {
 };
 
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
-DECLARE_INSTANCE_CHECKER(NPCM7xxCLKState, NPCM7XX_CLK,
-                         TYPE_NPCM7XX_CLK)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxCLKState, NPCM7XX_CLK)
 
 #endif /* NPCM7XX_CLK_H */
diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index eed59f94f91..b20fa2618a1 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -37,10 +37,8 @@ struct NPCM7xxGCRState {
     uint32_t reset_mdlr;
     uint32_t reset_intcr3;
 };
-typedef struct NPCM7xxGCRState NPCM7xxGCRState;
 
 #define TYPE_NPCM7XX_GCR "npcm7xx-gcr"
-DECLARE_INSTANCE_CHECKER(NPCM7xxGCRState, NPCM7XX_GCR,
-                         TYPE_NPCM7XX_GCR)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxGCRState, NPCM7XX_GCR)
 
 #endif /* NPCM7XX_GCR_H */
diff --git a/include/hw/misc/npcm7xx_mft.h b/include/hw/misc/npcm7xx_mft.h
index a351cf9b2be..d6384382cea 100644
--- a/include/hw/misc/npcm7xx_mft.h
+++ b/include/hw/misc/npcm7xx_mft.h
@@ -62,10 +62,8 @@ struct NPCM7xxMFTState {
     uint32_t    max_rpm[NPCM7XX_MFT_FANIN_COUNT];
     uint32_t    duty[NPCM7XX_MFT_FANIN_COUNT];
 };
-typedef struct NPCM7xxMFTState NPCM7xxMFTState;
 
 #define TYPE_NPCM7XX_MFT "npcm7xx-mft"
-DECLARE_INSTANCE_CHECKER(NPCM7xxMFTState, NPCM7XX_MFT,
-                         TYPE_NPCM7XX_MFT)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxMFTState, NPCM7XX_MFT)
 
 #endif /* NPCM7XX_MFT_H */
diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h
index 3be975e1ee4..e4a2336dc9a 100644
--- a/include/hw/misc/npcm7xx_pwm.h
+++ b/include/hw/misc/npcm7xx_pwm.h
@@ -102,7 +102,6 @@ struct NPCM7xxPWMState {
 };
 
 #define TYPE_NPCM7XX_PWM "npcm7xx-pwm"
-DECLARE_INSTANCE_CHECKER(NPCM7xxPWMState, NPCM7XX_PWM,
-                         TYPE_NPCM7XX_PWM)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxPWMState, NPCM7XX_PWM)
 
 #endif /* NPCM7XX_PWM_H */
diff --git a/include/hw/misc/sifive_e_prci.h b/include/hw/misc/sifive_e_prci.h
index 262ca16181b..a29cb259179 100644
--- a/include/hw/misc/sifive_e_prci.h
+++ b/include/hw/misc/sifive_e_prci.h
@@ -52,9 +52,7 @@ enum {
 
 #define TYPE_SIFIVE_E_PRCI      "riscv.sifive.e.prci"
 
-typedef struct SiFiveEPRCIState SiFiveEPRCIState;
-DECLARE_INSTANCE_CHECKER(SiFiveEPRCIState, SIFIVE_E_PRCI,
-                         TYPE_SIFIVE_E_PRCI)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveEPRCIState, SIFIVE_E_PRCI)
 
 struct SiFiveEPRCIState {
     /*< private >*/
diff --git a/include/hw/misc/sifive_test.h b/include/hw/misc/sifive_test.h
index 88a38d00c59..0e5e760f290 100644
--- a/include/hw/misc/sifive_test.h
+++ b/include/hw/misc/sifive_test.h
@@ -24,9 +24,7 @@
 
 #define TYPE_SIFIVE_TEST "riscv.sifive.test"
 
-typedef struct SiFiveTestState SiFiveTestState;
-DECLARE_INSTANCE_CHECKER(SiFiveTestState, SIFIVE_TEST,
-                         TYPE_SIFIVE_TEST)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveTestState, SIFIVE_TEST)
 
 struct SiFiveTestState {
     /*< private >*/
diff --git a/include/hw/misc/sifive_u_otp.h b/include/hw/misc/sifive_u_otp.h
index 5d0d7df455f..a80fd858f94 100644
--- a/include/hw/misc/sifive_u_otp.h
+++ b/include/hw/misc/sifive_u_otp.h
@@ -53,9 +53,7 @@
 
 #define TYPE_SIFIVE_U_OTP           "riscv.sifive.u.otp"
 
-typedef struct SiFiveUOTPState SiFiveUOTPState;
-DECLARE_INSTANCE_CHECKER(SiFiveUOTPState, SIFIVE_U_OTP,
-                         TYPE_SIFIVE_U_OTP)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveUOTPState, SIFIVE_U_OTP)
 
 struct SiFiveUOTPState {
     /*< private >*/
diff --git a/include/hw/misc/sifive_u_prci.h b/include/hw/misc/sifive_u_prci.h
index d9ebf40b7fa..5ea9a7325ca 100644
--- a/include/hw/misc/sifive_u_prci.h
+++ b/include/hw/misc/sifive_u_prci.h
@@ -59,9 +59,7 @@
 
 #define TYPE_SIFIVE_U_PRCI      "riscv.sifive.u.prci"
 
-typedef struct SiFiveUPRCIState SiFiveUPRCIState;
-DECLARE_INSTANCE_CHECKER(SiFiveUPRCIState, SIFIVE_U_PRCI,
-                         TYPE_SIFIVE_U_PRCI)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveUPRCIState, SIFIVE_U_PRCI)
 
 struct SiFiveUPRCIState {
     /*< private >*/
diff --git a/include/hw/misc/xlnx-versal-xramc.h b/include/hw/misc/xlnx-versal-xramc.h
index fc5a12165cf..7d58656a586 100644
--- a/include/hw/misc/xlnx-versal-xramc.h
+++ b/include/hw/misc/xlnx-versal-xramc.h
@@ -15,9 +15,7 @@
 
 #define TYPE_XLNX_XRAM_CTRL "xlnx.versal-xramc"
 
-typedef struct XlnxXramCtrl XlnxXramCtrl;
-DECLARE_INSTANCE_CHECKER(XlnxXramCtrl, XLNX_XRAM_CTRL,
-                         TYPE_XLNX_XRAM_CTRL)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxXramCtrl, XLNX_XRAM_CTRL)
 
 REG32(XRAM_ERR_CTRL, 0x0)
     FIELD(XRAM_ERR_CTRL, UE_RES, 3, 1)
diff --git a/include/hw/net/npcm7xx_emc.h b/include/hw/net/npcm7xx_emc.h
index bdf06c69dde..94f1cd159d8 100644
--- a/include/hw/net/npcm7xx_emc.h
+++ b/include/hw/net/npcm7xx_emc.h
@@ -278,10 +278,8 @@ struct NPCM7xxEMCState {
     bool rx_active;
 };
 
-typedef struct NPCM7xxEMCState NPCM7xxEMCState;
 
 #define TYPE_NPCM7XX_EMC "npcm7xx-emc"
-DECLARE_INSTANCE_CHECKER(NPCM7xxEMCState, NPCM7XX_EMC,
-                         TYPE_NPCM7XX_EMC)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxEMCState, NPCM7XX_EMC)
 
 #endif /* NPCM7XX_EMC_H */
diff --git a/include/hw/net/xlnx-zynqmp-can.h b/include/hw/net/xlnx-zynqmp-can.h
index 4a1fa166571..6283e865148 100644
--- a/include/hw/net/xlnx-zynqmp-can.h
+++ b/include/hw/net/xlnx-zynqmp-can.h
@@ -40,9 +40,7 @@
 
 #define TYPE_XLNX_ZYNQMP_CAN "xlnx.zynqmp-can"
 
-typedef struct XlnxZynqMPCANState XlnxZynqMPCANState;
-DECLARE_INSTANCE_CHECKER(XlnxZynqMPCANState, XLNX_ZYNQMP_CAN,
-                         TYPE_XLNX_ZYNQMP_CAN)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPCANState, XLNX_ZYNQMP_CAN)
 
 #define MAX_CAN_CTRLS      2
 #define XLNX_ZYNQMP_CAN_R_MAX     (0x84 / 4)
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index ff876fd74ca..700abe0874c 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -23,9 +23,7 @@
 OBJECT_DECLARE_TYPE(SpaprDrc, SpaprDrcClass, SPAPR_DR_CONNECTOR)
 
 #define TYPE_SPAPR_DRC_PHYSICAL "spapr-drc-physical"
-typedef struct SpaprDrcPhysical SpaprDrcPhysical;
-DECLARE_INSTANCE_CHECKER(SpaprDrcPhysical, SPAPR_DRC_PHYSICAL,
-                         TYPE_SPAPR_DRC_PHYSICAL)
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprDrcPhysical, SPAPR_DRC_PHYSICAL)
 
 #define TYPE_SPAPR_DRC_LOGICAL "spapr-drc-logical"
 
diff --git a/include/hw/register.h b/include/hw/register.h
index b480e3882cd..1af762682b7 100644
--- a/include/hw/register.h
+++ b/include/hw/register.h
@@ -88,8 +88,7 @@ struct RegisterInfo {
 };
 
 #define TYPE_REGISTER "qemu-register"
-DECLARE_INSTANCE_CHECKER(RegisterInfo, REGISTER,
-                         TYPE_REGISTER)
+OBJECT_DECLARE_SIMPLE_TYPE(RegisterInfo, REGISTER)
 
 /**
  * This structure is used to group all of the individual registers which are
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 3a29a48019e..7996fceade4 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -55,11 +55,9 @@ struct MicrochipPFSoCState {
     CadenceGEMState gem1;
     CadenceSDHCIState sdhci;
 };
-typedef struct MicrochipPFSoCState MicrochipPFSoCState;
 
 #define TYPE_MICROCHIP_PFSOC    "microchip.pfsoc"
-DECLARE_INSTANCE_CHECKER(MicrochipPFSoCState, MICROCHIP_PFSOC,
-                         TYPE_MICROCHIP_PFSOC)
+OBJECT_DECLARE_SIMPLE_TYPE(MicrochipPFSoCState, MICROCHIP_PFSOC)
 
 struct MicrochipIcicleKitState {
     /*< private >*/
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index 6733eca2303..e8e051ee7e9 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
-typedef struct ShaktiCSoCState ShaktiCSoCState;
-DECLARE_INSTANCE_CHECKER(ShaktiCSoCState, RISCV_SHAKTI_SOC,
-                         TYPE_RISCV_SHAKTI_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(ShaktiCSoCState, RISCV_SHAKTI_SOC)
 
 struct ShaktiCSoCState {
     /*< private >*/
@@ -42,9 +40,7 @@ struct ShaktiCSoCState {
 };
 
 #define TYPE_RISCV_SHAKTI_MACHINE MACHINE_TYPE_NAME("shakti_c")
-typedef struct ShaktiCMachineState ShaktiCMachineState;
-DECLARE_INSTANCE_CHECKER(ShaktiCMachineState, RISCV_SHAKTI_MACHINE,
-                         TYPE_RISCV_SHAKTI_MACHINE)
+OBJECT_DECLARE_SIMPLE_TYPE(ShaktiCMachineState, RISCV_SHAKTI_MACHINE)
 struct ShaktiCMachineState {
     /*< private >*/
     MachineState parent_obj;
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 22abd643753..44744d16fbd 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -25,9 +25,7 @@
 #include "qom/object.h"
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
-typedef struct SiFiveESoCState SiFiveESoCState;
-DECLARE_INSTANCE_CHECKER(SiFiveESoCState, RISCV_E_SOC,
-                         TYPE_RISCV_E_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveESoCState, RISCV_E_SOC)
 
 struct SiFiveESoCState {
     /*< private >*/
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index d974043a36d..fff7d61ef5b 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -30,9 +30,7 @@
 #include "qom/object.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
-typedef struct SiFiveUSoCState SiFiveUSoCState;
-DECLARE_INSTANCE_CHECKER(SiFiveUSoCState, RISCV_U_SOC,
-                         TYPE_RISCV_U_SOC)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveUSoCState, RISCV_U_SOC)
 
 struct SiFiveUSoCState {
     /*< private >*/
diff --git a/include/hw/sd/cadence_sdhci.h b/include/hw/sd/cadence_sdhci.h
index 6d6a2d9c0da..22cffb854ea 100644
--- a/include/hw/sd/cadence_sdhci.h
+++ b/include/hw/sd/cadence_sdhci.h
@@ -40,10 +40,8 @@ struct CadenceSDHCIState {
 
     SDHCIState sdhci;
 };
-typedef struct CadenceSDHCIState CadenceSDHCIState;
 
 #define TYPE_CADENCE_SDHCI  "cadence.sdhci"
-DECLARE_INSTANCE_CHECKER(CadenceSDHCIState, CADENCE_SDHCI,
-                         TYPE_CADENCE_SDHCI)
+OBJECT_DECLARE_SIMPLE_TYPE(CadenceSDHCIState, CADENCE_SDHCI)
 
 #endif /* CADENCE_SDHCI_H */
diff --git a/include/hw/ssi/sifive_spi.h b/include/hw/ssi/sifive_spi.h
index d32deaea0ec..c4f744230f2 100644
--- a/include/hw/ssi/sifive_spi.h
+++ b/include/hw/ssi/sifive_spi.h
@@ -26,9 +26,7 @@
 #define SIFIVE_SPI_REG_NUM  (0x78 / 4)
 
 #define TYPE_SIFIVE_SPI "sifive.spi"
-typedef struct SiFiveSPIState SiFiveSPIState;
-DECLARE_INSTANCE_CHECKER(SiFiveSPIState, SIFIVE_SPI,
-                         TYPE_SIFIVE_SPI)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveSPIState, SIFIVE_SPI)
 
 struct SiFiveSPIState {
     SysBusDevice parent_obj;
diff --git a/include/hw/timer/npcm7xx_timer.h b/include/hw/timer/npcm7xx_timer.h
index ff1985f5ca5..8d41b66e966 100644
--- a/include/hw/timer/npcm7xx_timer.h
+++ b/include/hw/timer/npcm7xx_timer.h
@@ -108,7 +108,6 @@ struct NPCM7xxTimerCtrlState {
 };
 
 #define TYPE_NPCM7XX_TIMER "npcm7xx-timer"
-DECLARE_INSTANCE_CHECKER(NPCM7xxTimerCtrlState, NPCM7XX_TIMER,
-                         TYPE_NPCM7XX_TIMER)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxTimerCtrlState, NPCM7XX_TIMER)
 
 #endif /* NPCM7XX_TIMER_H */
diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
index 4d68f129cc1..f1266c85401 100644
--- a/include/hw/tricore/tricore_testdevice.h
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -24,9 +24,7 @@
 #include "qom/object.h"
 
 #define TYPE_TRICORE_TESTDEVICE "tricore_testdevice"
-typedef struct TriCoreTestDeviceState TriCoreTestDeviceState;
-DECLARE_INSTANCE_CHECKER(TriCoreTestDeviceState, TRICORE_TESTDEVICE,
-                         TYPE_TRICORE_TESTDEVICE)
+OBJECT_DECLARE_SIMPLE_TYPE(TriCoreTestDeviceState, TRICORE_TESTDEVICE)
 
 struct TriCoreTestDeviceState {
     /* <private> */
diff --git a/include/hw/usb/hcd-dwc3.h b/include/hw/usb/hcd-dwc3.h
index 20402a9ad0b..9f2e64ee498 100644
--- a/include/hw/usb/hcd-dwc3.h
+++ b/include/hw/usb/hcd-dwc3.h
@@ -32,9 +32,7 @@
 
 #define TYPE_USB_DWC3 "usb_dwc3"
 
-typedef struct USBDWC3 USBDWC3;
-DECLARE_INSTANCE_CHECKER(USBDWC3, USB_DWC3,
-                         TYPE_USB_DWC3)
+OBJECT_DECLARE_SIMPLE_TYPE(USBDWC3, USB_DWC3)
 
 #define USB_DWC3_R_MAX ((0x530 / 4) + 1)
 #define DWC3_SIZE 0x10000
diff --git a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
index 701302ad044..2576193e673 100644
--- a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
+++ b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
@@ -29,9 +29,7 @@
 
 #define TYPE_XILINX_VERSAL_USB2_CTRL_REGS "xlnx.versal-usb2-ctrl-regs"
 
-typedef struct VersalUsb2CtrlRegs VersalUsb2CtrlRegs;
-DECLARE_INSTANCE_CHECKER(VersalUsb2CtrlRegs, XILINX_VERSAL_USB2_CTRL_REGS,
-                         TYPE_XILINX_VERSAL_USB2_CTRL_REGS)
+OBJECT_DECLARE_SIMPLE_TYPE(VersalUsb2CtrlRegs, XILINX_VERSAL_USB2_CTRL_REGS)
 
 #define USB2_REGS_R_MAX ((0x78 / 4) + 1)
 
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 165ab56eeaa..ee064e185c5 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -179,10 +179,8 @@ struct m5206_mbar_state {
     /* Include the UART vector registers here.  */
     uint8_t uivr[2];
 };
-typedef struct m5206_mbar_state m5206_mbar_state;
 
-DECLARE_INSTANCE_CHECKER(m5206_mbar_state, MCF5206_MBAR,
-                         TYPE_MCF5206_MBAR)
+OBJECT_DECLARE_SIMPLE_TYPE(m5206_mbar_state, MCF5206_MBAR)
 
 /* Interrupt controller.  */
 
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 20b06865b2b..fa8b23d2694 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -44,9 +44,7 @@
 #include "qom/object.h"
 
 #define TYPE_BOSTON "mips-boston"
-typedef struct BostonState BostonState;
-DECLARE_INSTANCE_CHECKER(BostonState, BOSTON,
-                         TYPE_BOSTON)
+OBJECT_DECLARE_SIMPLE_TYPE(BostonState, BOSTON)
 
 struct BostonState {
     SysBusDevice parent_obj;
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index 5247acfeb5a..4dd60fff03f 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -110,14 +110,11 @@ static const uint32_t cold_reset_values[NPCM7XX_CLK_NR_REGS] = {
 /* Clock converter functions */
 
 #define TYPE_NPCM7XX_CLOCK_PLL "npcm7xx-clock-pll"
-DECLARE_INSTANCE_CHECKER(NPCM7xxClockPLLState, NPCM7XX_CLOCK_PLL,
-                         TYPE_NPCM7XX_CLOCK_PLL)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxClockPLLState, NPCM7XX_CLOCK_PLL)
 #define TYPE_NPCM7XX_CLOCK_SEL "npcm7xx-clock-sel"
-DECLARE_INSTANCE_CHECKER(NPCM7xxClockSELState, NPCM7XX_CLOCK_SEL,
-                         TYPE_NPCM7XX_CLOCK_SEL)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxClockSELState, NPCM7XX_CLOCK_SEL)
 #define TYPE_NPCM7XX_CLOCK_DIVIDER "npcm7xx-clock-divider"
-DECLARE_INSTANCE_CHECKER(NPCM7xxClockDividerState, NPCM7XX_CLOCK_DIVIDER,
-                         TYPE_NPCM7XX_CLOCK_DIVIDER)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxClockDividerState, NPCM7XX_CLOCK_DIVIDER)
 
 static void npcm7xx_clk_update_pll(void *opaque)
 {
diff --git a/hw/net/can/ctucan_pci.c b/hw/net/can/ctucan_pci.c
index 1f277a7c363..4ce36dfa976 100644
--- a/hw/net/can/ctucan_pci.c
+++ b/hw/net/can/ctucan_pci.c
@@ -44,9 +44,7 @@
 
 #define TYPE_CTUCAN_PCI_DEV "ctucan_pci"
 
-typedef struct CtuCanPCIState CtuCanPCIState;
-DECLARE_INSTANCE_CHECKER(CtuCanPCIState, CTUCAN_PCI_DEV,
-                         TYPE_CTUCAN_PCI_DEV)
+OBJECT_DECLARE_SIMPLE_TYPE(CtuCanPCIState, CTUCAN_PCI_DEV)
 
 #define CTUCAN_PCI_CORE_COUNT     2
 #define CTUCAN_PCI_CORE_RANGE     0x10000
diff --git a/hw/s390x/vhost-user-fs-ccw.c b/hw/s390x/vhost-user-fs-ccw.c
index 5a72a22d48f..e905849a580 100644
--- a/hw/s390x/vhost-user-fs-ccw.c
+++ b/hw/s390x/vhost-user-fs-ccw.c
@@ -18,11 +18,9 @@ struct VHostUserFSCcw {
     VirtioCcwDevice parent_obj;
     VHostUserFS vdev;
 };
-typedef struct VHostUserFSCcw VHostUserFSCcw;
 
 #define TYPE_VHOST_USER_FS_CCW "vhost-user-fs-ccw"
-DECLARE_INSTANCE_CHECKER(VHostUserFSCcw, VHOST_USER_FS_CCW,
-                         TYPE_VHOST_USER_FS_CCW)
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserFSCcw, VHOST_USER_FS_CCW)
 
 
 static Property vhost_user_fs_ccw_properties[] = {
diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
index a678174b18c..cbed43adb64 100644
--- a/hw/sensor/adm1272.c
+++ b/hw/sensor/adm1272.c
@@ -19,9 +19,7 @@
 #include "qom/object.h"
 
 #define TYPE_ADM1272 "adm1272"
-typedef struct ADM1272State ADM1272State;
-DECLARE_INSTANCE_CHECKER(ADM1272State, ADM1272,
-                         TYPE_ADM1272)
+OBJECT_DECLARE_SIMPLE_TYPE(ADM1272State, ADM1272)
 
 #define ADM1272_RESTART_TIME            0xCC
 #define ADM1272_MFR_PEAK_IOUT           0xD0
diff --git a/hw/sensor/max34451.c b/hw/sensor/max34451.c
index 864f0bfc736..918c78b0f21 100644
--- a/hw/sensor/max34451.c
+++ b/hw/sensor/max34451.c
@@ -17,9 +17,7 @@
 #include "qom/object.h"
 
 #define TYPE_MAX34451 "max34451"
-typedef struct MAX34451State MAX34451State;
-DECLARE_INSTANCE_CHECKER(MAX34451State, MAX34451,
-                         TYPE_MAX34451)
+OBJECT_DECLARE_SIMPLE_TYPE(MAX34451State, MAX34451)
 
 #define MAX34451_MFR_MODE               0xD1
 #define MAX34451_MFR_PSEN_CONFIG        0xD2
-- 
2.31.1


