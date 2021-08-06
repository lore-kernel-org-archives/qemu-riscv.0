Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mC796-0001nA-My
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 17:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC794-0001kE-71
 for qemu-riscv@nongnu.org; Fri, 06 Aug 2021 17:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC78z-0004RO-TM
 for qemu-riscv@nongnu.org; Fri, 06 Aug 2021 17:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QNBcX2elEfyLjzC7hV68RLuLqQcuIbW/X5vctrD8m3Y=;
 b=NQH+Y6uTgW1soU1e5phu381Qp7PtLUjoXWa06xySIWg3GV5x9XI7tLDVM3Rw5jcSNhMYXb
 uGVM9GpWmFdas0B9L7+Dn8ITesCb/6hU+2yoT2ugjclfEHn1pOxbcl8ePQ6r/WcfFZ8xp0
 Q2ktzrJLyqZ9fsDGSqrhVoCjROvAEgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-ISZUDHj8MZuK2DmhBDjruw-1; Fri, 06 Aug 2021 17:12:40 -0400
X-MC-Unique: ISZUDHj8MZuK2DmhBDjruw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97F901008061;
 Fri,  6 Aug 2021 21:12:36 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 290285C1A3;
 Fri,  6 Aug 2021 21:12:16 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Patrick Venture <venture@google.com>, Thomas Huth <huth@tuxfamily.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-6.2 06/12] [automated] Split QOM "typedef struct T { ... }
 T" declarations
Date: Fri,  6 Aug 2021 17:11:21 -0400
Message-Id: <20210806211127.646908-7-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-List-Received-Date: Fri, 06 Aug 2021 21:12:46 -0000

Automatically split struct definition and typedef declaration in
separate declarations, using a codeconverter rule.  The rule will
only touch declarations of structs/typedefs actually used by QOM
types.

This will make automated changes to use OBJECT_DECLARE* macros
easier to implement, because automated removal of typedef lines
will be easier and safer.

Generated using:

  $ ./scripts/codeconverter/converter.py -i \
    --pattern=QOMStructTypedefSplit $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Patrick Venture <venture@google.com>
Cc: Thomas Huth <huth@tuxfamily.org>
Cc: Keith Busch <kbusch@kernel.org>
Cc: Klaus Jensen <its@irrelevant.dk>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-ppc@nongnu.org
---
 hw/nvme/nvme.h                      | 10 ++++++----
 hw/usb/hcd-uhci.h                   |  5 +++--
 hw/usb/u2f.h                        |  5 +++--
 include/hw/adc/npcm7xx_adc.h        |  5 +++--
 include/hw/arm/npcm7xx.h            | 10 ++++++----
 include/hw/core/accel-cpu.h         |  5 +++--
 include/hw/dma/sifive_pdma.h        |  5 +++--
 include/hw/dma/xlnx_csu_dma.h       |  5 +++--
 include/hw/gpio/npcm7xx_gpio.h      |  5 +++--
 include/hw/i2c/npcm7xx_smbus.h      |  5 +++--
 include/hw/mem/npcm7xx_mc.h         |  5 +++--
 include/hw/misc/bcm2835_cprman.h    | 20 ++++++++++++--------
 include/hw/misc/mchp_pfsoc_dmc.h    | 10 ++++++----
 include/hw/misc/mchp_pfsoc_ioscb.h  |  5 +++--
 include/hw/misc/mchp_pfsoc_sysreg.h |  5 +++--
 include/hw/misc/npcm7xx_clk.h       | 15 +++++++++------
 include/hw/misc/npcm7xx_gcr.h       |  5 +++--
 include/hw/misc/npcm7xx_mft.h       |  5 +++--
 include/hw/misc/npcm7xx_rng.h       |  5 +++--
 include/hw/nvram/npcm7xx_otp.h      |  5 +++--
 include/hw/riscv/microchip_pfsoc.h  | 10 ++++++----
 include/hw/riscv/sifive_e.h         |  5 +++--
 include/hw/sd/cadence_sdhci.h       |  5 +++--
 include/qemu/accel.h                | 10 ++++++----
 chardev/char-parallel.c             | 10 ++++++----
 hw/i2c/i2c_mux_pca954x.c            |  5 +++--
 hw/m68k/mcf5206.c                   |  5 +++--
 hw/misc/sbsa_ec.c                   |  5 +++--
 hw/s390x/vhost-user-fs-ccw.c        |  5 +++--
 tests/qtest/pnv-xscom-test.c        |  5 +++--
 30 files changed, 123 insertions(+), 82 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 5ddcd783055..0840f585d6e 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -118,7 +118,7 @@ typedef struct NvmeNamespaceParams {
     uint32_t zd_extension_size;
 } NvmeNamespaceParams;
 
-typedef struct NvmeNamespace {
+struct NvmeNamespace {
     DeviceState  parent_obj;
     BlockConf    blkconf;
     int32_t      bootindex;
@@ -153,7 +153,8 @@ typedef struct NvmeNamespace {
     struct {
         uint32_t err_rec;
     } features;
-} NvmeNamespace;
+};
+typedef struct NvmeNamespace NvmeNamespace;
 
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
 {
@@ -395,7 +396,7 @@ typedef struct NvmeParams {
     bool     legacy_cmb;
 } NvmeParams;
 
-typedef struct NvmeCtrl {
+struct NvmeCtrl {
     PCIDevice    parent_obj;
     MemoryRegion bar0;
     MemoryRegion iomem;
@@ -462,7 +463,8 @@ typedef struct NvmeCtrl {
         };
         uint32_t    async_config;
     } features;
-} NvmeCtrl;
+};
+typedef struct NvmeCtrl NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
 {
diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index 57d0d574644..2597a6d2eb6 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -43,7 +43,7 @@ typedef struct UHCIPort {
     uint16_t ctrl;
 } UHCIPort;
 
-typedef struct UHCIState {
+struct UHCIState {
     PCIDevice dev;
     MemoryRegion io_bar;
     USBBus bus; /* Note unused when we're a companion controller */
@@ -73,7 +73,8 @@ typedef struct UHCIState {
     char *masterbus;
     uint32_t firstport;
     uint32_t maxframes;
-} UHCIState;
+};
+typedef struct UHCIState UHCIState;
 
 #define TYPE_UHCI "pci-uhci-usb"
 DECLARE_INSTANCE_CHECKER(UHCIState, UHCI, TYPE_UHCI)
diff --git a/hw/usb/u2f.h b/hw/usb/u2f.h
index 705d5c43ce6..7191a23ee1a 100644
--- a/hw/usb/u2f.h
+++ b/hw/usb/u2f.h
@@ -62,7 +62,7 @@ struct U2FKeyClass {
 /*
  * State of the U2F key base device (i.e. hw/u2f.c)
  */
-typedef struct U2FKeyState {
+struct U2FKeyState {
     USBDevice dev;
     USBEndpoint *ep;
     uint8_t idle;
@@ -72,7 +72,8 @@ typedef struct U2FKeyState {
     uint8_t pending_in_start;
     uint8_t pending_in_end;
     uint8_t pending_in_num;
-} U2FKeyState;
+};
+typedef struct U2FKeyState U2FKeyState;
 
 /*
  * API to be used by the U2F key device variants (i.e. hw/u2f-*.c)
diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h
index 874cfbd6ce3..835d13f5b0d 100644
--- a/include/hw/adc/npcm7xx_adc.h
+++ b/include/hw/adc/npcm7xx_adc.h
@@ -43,7 +43,7 @@
  * @iref: The internal reference voltage, initialized at launch time.
  * @rv: The calibrated output values of 0.5V and 1.5V for the ADC.
  */
-typedef struct NPCM7xxADCState {
+struct NPCM7xxADCState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -61,7 +61,8 @@ typedef struct NPCM7xxADCState {
     uint32_t     iref;
 
     uint16_t     calibration_r_values[NPCM7XX_ADC_NUM_CALIB];
-} NPCM7xxADCState;
+};
+typedef struct NPCM7xxADCState NPCM7xxADCState;
 
 #define TYPE_NPCM7XX_ADC "npcm7xx-adc"
 #define NPCM7XX_ADC(obj) \
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index dc802c1645c..697d2957590 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -52,7 +52,7 @@
 
 #define NPCM7XX_NR_PWM_MODULES 2
 
-typedef struct NPCM7xxMachine {
+struct NPCM7xxMachine {
     MachineState        parent;
     /*
      * PWM fan splitter. each splitter connects to one PWM output and
@@ -60,7 +60,8 @@ typedef struct NPCM7xxMachine {
      */
     SplitIRQ            fan_splitter[NPCM7XX_NR_PWM_MODULES *
                                      NPCM7XX_PWM_PER_MODULE];
-} NPCM7xxMachine;
+};
+typedef struct NPCM7xxMachine NPCM7xxMachine;
 
 #define TYPE_NPCM7XX_MACHINE MACHINE_TYPE_NAME("npcm7xx")
 typedef struct NPCM7xxMachineClass NPCM7xxMachineClass;
@@ -78,7 +79,7 @@ struct NPCM7xxMachineClass {
 #define NPCM7XX_MACHINE_GET_CLASS(obj)                                  \
     OBJECT_GET_CLASS(NPCM7xxMachineClass, (obj), TYPE_NPCM7XX_MACHINE)
 
-typedef struct NPCM7xxState {
+struct NPCM7xxState {
     DeviceState         parent;
 
     ARMCPU              cpu[NPCM7XX_MAX_NUM_CPUS];
@@ -105,7 +106,8 @@ typedef struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
-} NPCM7xxState;
+};
+typedef struct NPCM7xxState NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
 typedef struct NPCM7xxClass NPCM7xxClass;
diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
index 0b7b3f6df3e..b1f6fdb756b 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/hw/core/accel-cpu.h
@@ -26,7 +26,7 @@
 typedef struct AccelCPUClass AccelCPUClass;
 DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
 
-typedef struct AccelCPUClass {
+struct AccelCPUClass {
     /*< private >*/
     ObjectClass parent_class;
     /*< public >*/
@@ -34,6 +34,7 @@ typedef struct AccelCPUClass {
     void (*cpu_class_init)(CPUClass *cc);
     void (*cpu_instance_init)(CPUState *cpu);
     bool (*cpu_realizefn)(CPUState *cpu, Error **errp);
-} AccelCPUClass;
+};
+typedef struct AccelCPUClass AccelCPUClass;
 
 #endif /* ACCEL_CPU_H */
diff --git a/include/hw/dma/sifive_pdma.h b/include/hw/dma/sifive_pdma.h
index a62908dd0f2..76b4b45d0a4 100644
--- a/include/hw/dma/sifive_pdma.h
+++ b/include/hw/dma/sifive_pdma.h
@@ -42,13 +42,14 @@ struct sifive_pdma_chan {
 #define SIFIVE_PDMA_REG_SIZE        0x100000
 #define SIFIVE_PDMA_CHAN_NO(reg)    ((reg & (SIFIVE_PDMA_REG_SIZE - 1)) >> 12)
 
-typedef struct SiFivePDMAState {
+struct SiFivePDMAState {
     SysBusDevice parent;
     MemoryRegion iomem;
     qemu_irq irq[SIFIVE_PDMA_IRQS];
 
     struct sifive_pdma_chan chan[SIFIVE_PDMA_CHANS];
-} SiFivePDMAState;
+};
+typedef struct SiFivePDMAState SiFivePDMAState;
 
 #define TYPE_SIFIVE_PDMA    "sifive.pdma"
 
diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 804ca5958d0..f8d88e2ebee 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -26,7 +26,7 @@
 
 #define XLNX_CSU_DMA_R_MAX (0x2c / 4)
 
-typedef struct XlnxCSUDMA {
+struct XlnxCSUDMA {
     SysBusDevice busdev;
     MemoryRegion iomem;
     MemTxAttrs attr;
@@ -45,7 +45,8 @@ typedef struct XlnxCSUDMA {
 
     uint32_t regs[XLNX_CSU_DMA_R_MAX];
     RegisterInfo regs_info[XLNX_CSU_DMA_R_MAX];
-} XlnxCSUDMA;
+};
+typedef struct XlnxCSUDMA XlnxCSUDMA;
 
 #define XLNX_CSU_DMA(obj) \
     OBJECT_CHECK(XlnxCSUDMA, (obj), TYPE_XLNX_CSU_DMA)
diff --git a/include/hw/gpio/npcm7xx_gpio.h b/include/hw/gpio/npcm7xx_gpio.h
index c4e5b4a353e..e45cf45e78e 100644
--- a/include/hw/gpio/npcm7xx_gpio.h
+++ b/include/hw/gpio/npcm7xx_gpio.h
@@ -28,7 +28,7 @@
  */
 #define NPCM7XX_GPIO_NR_REGS (0x80 / sizeof(uint32_t))
 
-typedef struct NPCM7xxGPIOState {
+struct NPCM7xxGPIOState {
     SysBusDevice parent;
 
     /* Properties to be defined by the SoC */
@@ -47,7 +47,8 @@ typedef struct NPCM7xxGPIOState {
     uint32_t ext_driven;
 
     uint32_t regs[NPCM7XX_GPIO_NR_REGS];
-} NPCM7xxGPIOState;
+};
+typedef struct NPCM7xxGPIOState NPCM7xxGPIOState;
 
 #define TYPE_NPCM7XX_GPIO "npcm7xx-gpio"
 #define NPCM7XX_GPIO(obj) \
diff --git a/include/hw/i2c/npcm7xx_smbus.h b/include/hw/i2c/npcm7xx_smbus.h
index 8030d78f69c..ef64c6748a7 100644
--- a/include/hw/i2c/npcm7xx_smbus.h
+++ b/include/hw/i2c/npcm7xx_smbus.h
@@ -69,7 +69,7 @@ typedef enum NPCM7xxSMBusStatus {
  * @rx_cur: The current position of rx_fifo.
  * @status: The current status of the SMBus.
  */
-typedef struct NPCM7xxSMBusState {
+struct NPCM7xxSMBusState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -105,7 +105,8 @@ typedef struct NPCM7xxSMBusState {
     uint8_t      rx_cur;
 
     NPCM7xxSMBusStatus status;
-} NPCM7xxSMBusState;
+};
+typedef struct NPCM7xxSMBusState NPCM7xxSMBusState;
 
 #define TYPE_NPCM7XX_SMBUS "npcm7xx-smbus"
 #define NPCM7XX_SMBUS(obj) OBJECT_CHECK(NPCM7xxSMBusState, (obj), \
diff --git a/include/hw/mem/npcm7xx_mc.h b/include/hw/mem/npcm7xx_mc.h
index 83787f6fa57..e0a9d3b0de9 100644
--- a/include/hw/mem/npcm7xx_mc.h
+++ b/include/hw/mem/npcm7xx_mc.h
@@ -25,11 +25,12 @@
  * @parent: System bus device.
  * @mmio: Memory region through which registers are accessed.
  */
-typedef struct NPCM7xxMCState {
+struct NPCM7xxMCState {
     SysBusDevice parent;
 
     MemoryRegion mmio;
-} NPCM7xxMCState;
+};
+typedef struct NPCM7xxMCState NPCM7xxMCState;
 
 #define TYPE_NPCM7XX_MC "npcm7xx-mc"
 #define NPCM7XX_MC(obj) OBJECT_CHECK(NPCM7xxMCState, (obj), TYPE_NPCM7XX_MC)
diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
index ba4b441dce5..966c0b600ed 100644
--- a/include/hw/misc/bcm2835_cprman.h
+++ b/include/hw/misc/bcm2835_cprman.h
@@ -118,7 +118,7 @@ typedef enum CprmanClockMuxSource {
     CPRMAN_NUM_CLOCK_MUX_SRC
 } CprmanClockMuxSource;
 
-typedef struct CprmanPllState {
+struct CprmanPllState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -133,9 +133,10 @@ typedef struct CprmanPllState {
 
     Clock *xosc_in;
     Clock *out;
-} CprmanPllState;
+};
+typedef struct CprmanPllState CprmanPllState;
 
-typedef struct CprmanPllChannelState {
+struct CprmanPllChannelState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -151,9 +152,10 @@ typedef struct CprmanPllChannelState {
 
     Clock *pll_in;
     Clock *out;
-} CprmanPllChannelState;
+};
+typedef struct CprmanPllChannelState CprmanPllChannelState;
 
-typedef struct CprmanClockMuxState {
+struct CprmanClockMuxState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -173,9 +175,10 @@ typedef struct CprmanClockMuxState {
      * source number.
      */
     struct CprmanClockMuxState *backref[CPRMAN_NUM_CLOCK_MUX_SRC];
-} CprmanClockMuxState;
+};
+typedef struct CprmanClockMuxState CprmanClockMuxState;
 
-typedef struct CprmanDsi0HsckMuxState {
+struct CprmanDsi0HsckMuxState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -187,7 +190,8 @@ typedef struct CprmanDsi0HsckMuxState {
     Clock *plla_in;
     Clock *plld_in;
     Clock *out;
-} CprmanDsi0HsckMuxState;
+};
+typedef struct CprmanDsi0HsckMuxState CprmanDsi0HsckMuxState;
 
 struct BCM2835CprmanState {
     /*< private >*/
diff --git a/include/hw/misc/mchp_pfsoc_dmc.h b/include/hw/misc/mchp_pfsoc_dmc.h
index 979527957ea..28cfe3e1e23 100644
--- a/include/hw/misc/mchp_pfsoc_dmc.h
+++ b/include/hw/misc/mchp_pfsoc_dmc.h
@@ -28,10 +28,11 @@
 
 #define MCHP_PFSOC_DDR_SGMII_PHY_REG_SIZE   0x1000
 
-typedef struct MchpPfSoCDdrSgmiiPhyState {
+struct MchpPfSoCDdrSgmiiPhyState {
     SysBusDevice parent;
     MemoryRegion sgmii_phy;
-} MchpPfSoCDdrSgmiiPhyState;
+};
+typedef struct MchpPfSoCDdrSgmiiPhyState MchpPfSoCDdrSgmiiPhyState;
 
 #define TYPE_MCHP_PFSOC_DDR_SGMII_PHY "mchp.pfsoc.ddr_sgmii_phy"
 
@@ -43,10 +44,11 @@ typedef struct MchpPfSoCDdrSgmiiPhyState {
 
 #define MCHP_PFSOC_DDR_CFG_REG_SIZE         0x40000
 
-typedef struct MchpPfSoCDdrCfgState {
+struct MchpPfSoCDdrCfgState {
     SysBusDevice parent;
     MemoryRegion cfg;
-} MchpPfSoCDdrCfgState;
+};
+typedef struct MchpPfSoCDdrCfgState MchpPfSoCDdrCfgState;
 
 #define TYPE_MCHP_PFSOC_DDR_CFG "mchp.pfsoc.ddr_cfg"
 
diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
index 519b897250f..95b0b9069dd 100644
--- a/include/hw/misc/mchp_pfsoc_ioscb.h
+++ b/include/hw/misc/mchp_pfsoc_ioscb.h
@@ -24,7 +24,7 @@
 #define MCHP_PFSOC_IOSCB_H
 #include "qom/object.h"
 
-typedef struct MchpPfSoCIoscbState {
+struct MchpPfSoCIoscbState {
     SysBusDevice parent;
     MemoryRegion container;
     MemoryRegion lane01;
@@ -41,7 +41,8 @@ typedef struct MchpPfSoCIoscbState {
     MemoryRegion cfm_sgmii;
     MemoryRegion bc_sgmii;
     MemoryRegion io_calib_sgmii;
-} MchpPfSoCIoscbState;
+};
+typedef struct MchpPfSoCIoscbState MchpPfSoCIoscbState;
 
 #define TYPE_MCHP_PFSOC_IOSCB "mchp.pfsoc.ioscb"
 
diff --git a/include/hw/misc/mchp_pfsoc_sysreg.h b/include/hw/misc/mchp_pfsoc_sysreg.h
index d6803be9485..adce8d869c4 100644
--- a/include/hw/misc/mchp_pfsoc_sysreg.h
+++ b/include/hw/misc/mchp_pfsoc_sysreg.h
@@ -26,10 +26,11 @@
 
 #define MCHP_PFSOC_SYSREG_REG_SIZE  0x2000
 
-typedef struct MchpPfSoCSysregState {
+struct MchpPfSoCSysregState {
     SysBusDevice parent;
     MemoryRegion sysreg;
-} MchpPfSoCSysregState;
+};
+typedef struct MchpPfSoCSysregState MchpPfSoCSysregState;
 
 #define TYPE_MCHP_PFSOC_SYSREG "mchp.pfsoc.sysreg"
 
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
index a849345620e..80b651c7e44 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -91,7 +91,7 @@ typedef struct NPCM7xxCLKState NPCM7xxCLKState;
  * @clock_out: The output clock of this module.
  * @reg: The control registers for this PLL module.
  */
-typedef struct NPCM7xxClockPLLState {
+struct NPCM7xxClockPLLState {
     DeviceState parent;
 
     const char *name;
@@ -100,7 +100,8 @@ typedef struct NPCM7xxClockPLLState {
     Clock *clock_out;
 
     int reg;
-} NPCM7xxClockPLLState;
+};
+typedef struct NPCM7xxClockPLLState NPCM7xxClockPLLState;
 
 /**
  * struct NPCM7xxClockSELState - A SEL module in CLK module.
@@ -112,7 +113,7 @@ typedef struct NPCM7xxClockPLLState {
  * @offset: The offset of this module in the control register.
  * @len: The length of this module in the control register.
  */
-typedef struct NPCM7xxClockSELState {
+struct NPCM7xxClockSELState {
     DeviceState parent;
 
     const char *name;
@@ -123,7 +124,8 @@ typedef struct NPCM7xxClockSELState {
 
     int offset;
     int len;
-} NPCM7xxClockSELState;
+};
+typedef struct NPCM7xxClockSELState NPCM7xxClockSELState;
 
 /**
  * struct NPCM7xxClockDividerState - A Divider module in CLK module.
@@ -137,7 +139,7 @@ typedef struct NPCM7xxClockSELState {
  * @len: The length of the divisor in the control register.
  * @divisor: The divisor for a constant divisor
  */
-typedef struct NPCM7xxClockDividerState {
+struct NPCM7xxClockDividerState {
     DeviceState parent;
 
     const char *name;
@@ -154,7 +156,8 @@ typedef struct NPCM7xxClockDividerState {
         };
         int divisor;
     };
-} NPCM7xxClockDividerState;
+};
+typedef struct NPCM7xxClockDividerState NPCM7xxClockDividerState;
 
 struct NPCM7xxCLKState {
     SysBusDevice parent;
diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index 482768c8e76..b5c573ec8f2 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -26,7 +26,7 @@
  */
 #define NPCM7XX_GCR_NR_REGS (0x148 / sizeof(uint32_t))
 
-typedef struct NPCM7xxGCRState {
+struct NPCM7xxGCRState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -36,7 +36,8 @@ typedef struct NPCM7xxGCRState {
     uint32_t reset_pwron;
     uint32_t reset_mdlr;
     uint32_t reset_intcr3;
-} NPCM7xxGCRState;
+};
+typedef struct NPCM7xxGCRState NPCM7xxGCRState;
 
 #define TYPE_NPCM7XX_GCR "npcm7xx-gcr"
 #define NPCM7XX_GCR(obj) OBJECT_CHECK(NPCM7xxGCRState, (obj), TYPE_NPCM7XX_GCR)
diff --git a/include/hw/misc/npcm7xx_mft.h b/include/hw/misc/npcm7xx_mft.h
index 36785e3ba81..3f7bd2a9c6a 100644
--- a/include/hw/misc/npcm7xx_mft.h
+++ b/include/hw/misc/npcm7xx_mft.h
@@ -49,7 +49,7 @@
  * @max_rpm: The maximum rpm for fans. Order: A0, B0, A1, B1.
  * @duty: The duty cycles for fans, relative to NPCM7XX_PWM_MAX_DUTY.
  */
-typedef struct NPCM7xxMFTState {
+struct NPCM7xxMFTState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -61,7 +61,8 @@ typedef struct NPCM7xxMFTState {
 
     uint32_t    max_rpm[NPCM7XX_MFT_FANIN_COUNT];
     uint32_t    duty[NPCM7XX_MFT_FANIN_COUNT];
-} NPCM7xxMFTState;
+};
+typedef struct NPCM7xxMFTState NPCM7xxMFTState;
 
 #define TYPE_NPCM7XX_MFT "npcm7xx-mft"
 #define NPCM7XX_MFT(obj) \
diff --git a/include/hw/misc/npcm7xx_rng.h b/include/hw/misc/npcm7xx_rng.h
index 1d20293608a..27122001f4b 100644
--- a/include/hw/misc/npcm7xx_rng.h
+++ b/include/hw/misc/npcm7xx_rng.h
@@ -19,7 +19,7 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
-typedef struct NPCM7xxRNGState {
+struct NPCM7xxRNGState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -27,7 +27,8 @@ typedef struct NPCM7xxRNGState {
     uint8_t rngcs;
     uint8_t rngd;
     uint8_t rngmode;
-} NPCM7xxRNGState;
+};
+typedef struct NPCM7xxRNGState NPCM7xxRNGState;
 
 #define TYPE_NPCM7XX_RNG "npcm7xx-rng"
 #define NPCM7XX_RNG(obj) OBJECT_CHECK(NPCM7xxRNGState, (obj), TYPE_NPCM7XX_RNG)
diff --git a/include/hw/nvram/npcm7xx_otp.h b/include/hw/nvram/npcm7xx_otp.h
index 32c73845ff3..0ab1d5bae48 100644
--- a/include/hw/nvram/npcm7xx_otp.h
+++ b/include/hw/nvram/npcm7xx_otp.h
@@ -48,13 +48,14 @@
  * @regs: Register contents.
  * @array: OTP storage array.
  */
-typedef struct NPCM7xxOTPState {
+struct NPCM7xxOTPState {
     SysBusDevice parent;
 
     MemoryRegion mmio;
     uint32_t regs[NPCM7XX_OTP_NR_REGS];
     uint8_t array[NPCM7XX_OTP_ARRAY_BYTES];
-} NPCM7xxOTPState;
+};
+typedef struct NPCM7xxOTPState NPCM7xxOTPState;
 
 #define TYPE_NPCM7XX_OTP "npcm7xx-otp"
 #define NPCM7XX_OTP(obj) OBJECT_CHECK(NPCM7xxOTPState, (obj), TYPE_NPCM7XX_OTP)
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 3f83f9d98da..b30fb1191d9 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -31,7 +31,7 @@
 #include "hw/sd/cadence_sdhci.h"
 #include "qom/object.h"
 
-typedef struct MicrochipPFSoCState {
+struct MicrochipPFSoCState {
     /*< private >*/
     DeviceState parent_obj;
 
@@ -54,19 +54,21 @@ typedef struct MicrochipPFSoCState {
     CadenceGEMState gem0;
     CadenceGEMState gem1;
     CadenceSDHCIState sdhci;
-} MicrochipPFSoCState;
+};
+typedef struct MicrochipPFSoCState MicrochipPFSoCState;
 
 #define TYPE_MICROCHIP_PFSOC    "microchip.pfsoc"
 #define MICROCHIP_PFSOC(obj) \
     OBJECT_CHECK(MicrochipPFSoCState, (obj), TYPE_MICROCHIP_PFSOC)
 
-typedef struct MicrochipIcicleKitState {
+struct MicrochipIcicleKitState {
     /*< private >*/
     MachineState parent_obj;
 
     /*< public >*/
     MicrochipPFSoCState soc;
-} MicrochipIcicleKitState;
+};
+typedef struct MicrochipIcicleKitState MicrochipIcicleKitState;
 
 #define TYPE_MICROCHIP_ICICLE_KIT_MACHINE \
     MACHINE_TYPE_NAME("microchip-icicle-kit")
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index e654e2dfec6..9c9ce14a4b4 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -41,14 +41,15 @@ struct SiFiveESoCState {
     MemoryRegion mask_rom;
 };
 
-typedef struct SiFiveEState {
+struct SiFiveEState {
     /*< private >*/
     SysBusDevice parent_obj;
 
     /*< public >*/
     SiFiveESoCState soc;
     bool revb;
-} SiFiveEState;
+};
+typedef struct SiFiveEState SiFiveEState;
 
 #define TYPE_RISCV_E_MACHINE MACHINE_TYPE_NAME("sifive_e")
 #define RISCV_E_MACHINE(obj) \
diff --git a/include/hw/sd/cadence_sdhci.h b/include/hw/sd/cadence_sdhci.h
index c890e285fca..75c174f357a 100644
--- a/include/hw/sd/cadence_sdhci.h
+++ b/include/hw/sd/cadence_sdhci.h
@@ -29,7 +29,7 @@
 #define CADENCE_SDHCI_REG_SIZE  0x100
 #define CADENCE_SDHCI_NUM_REGS  (CADENCE_SDHCI_REG_SIZE / sizeof(uint32_t))
 
-typedef struct CadenceSDHCIState {
+struct CadenceSDHCIState {
     SysBusDevice parent;
 
     MemoryRegion container;
@@ -39,7 +39,8 @@ typedef struct CadenceSDHCIState {
     uint32_t regs[CADENCE_SDHCI_NUM_REGS];
 
     SDHCIState sdhci;
-} CadenceSDHCIState;
+};
+typedef struct CadenceSDHCIState CadenceSDHCIState;
 
 #define TYPE_CADENCE_SDHCI  "cadence.sdhci"
 #define CADENCE_SDHCI(obj)  OBJECT_CHECK(CadenceSDHCIState, (obj), \
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index cc915720494..c18f43a3a8c 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -26,12 +26,13 @@
 #include "qom/object.h"
 #include "exec/hwaddr.h"
 
-typedef struct AccelState {
+struct AccelState {
     /*< private >*/
     Object parent_obj;
-} AccelState;
+};
+typedef struct AccelState AccelState;
 
-typedef struct AccelClass {
+struct AccelClass {
     /*< private >*/
     ObjectClass parent_class;
     /*< public >*/
@@ -52,7 +53,8 @@ typedef struct AccelClass {
      * compat_props or user-provided global properties.
      */
     GPtrArray *compat_props;
-} AccelClass;
+};
+typedef struct AccelClass AccelClass;
 
 #define TYPE_ACCEL_BASE "accel"
 
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index dcbf6177a1e..bebe0507053 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -50,11 +50,12 @@
 
 #if defined(__linux__)
 
-typedef struct ParallelChardev {
+struct ParallelChardev {
     Chardev parent;
     int fd;
     int mode;
-} ParallelChardev;
+};
+typedef struct ParallelChardev ParallelChardev;
 
 #define PARALLEL_CHARDEV(obj) \
     OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
@@ -178,10 +179,11 @@ static void qemu_chr_open_pp_fd(Chardev *chr,
 
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
 
-typedef struct ParallelChardev {
+struct ParallelChardev {
     Chardev parent;
     int fd;
-} ParallelChardev;
+};
+typedef struct ParallelChardev ParallelChardev;
 
 #define PARALLEL_CHARDEV(obj)                                   \
     OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 847c59921cf..40b4c44a5df 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -36,13 +36,14 @@
  * @bus: The owned channel bus.
  * @enabled: Is this channel active?
  */
-typedef struct Pca954xChannel {
+struct Pca954xChannel {
     SysBusDevice parent;
 
     I2CBus       *bus;
 
     bool         enabled;
-} Pca954xChannel;
+};
+typedef struct Pca954xChannel Pca954xChannel;
 
 #define TYPE_PCA954X_CHANNEL "pca954x-channel"
 #define PCA954X_CHANNEL(obj) \
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index bd7e328435a..b8001fdcf5e 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -161,7 +161,7 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
 
 /* System Integration Module.  */
 
-typedef struct m5206_mbar_state {
+struct m5206_mbar_state {
     SysBusDevice parent_obj;
 
     M68kCPU *cpu;
@@ -178,7 +178,8 @@ typedef struct m5206_mbar_state {
     uint8_t par;
     /* Include the UART vector registers here.  */
     uint8_t uivr[2];
-} m5206_mbar_state;
+};
+typedef struct m5206_mbar_state m5206_mbar_state;
 
 #define MCF5206_MBAR(obj) OBJECT_CHECK(m5206_mbar_state, (obj), TYPE_MCF5206_MBAR)
 
diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 846b2ff905a..e4b79e98866 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -17,10 +17,11 @@
 #include "sysemu/runstate.h"
 #include "qom/object.h"
 
-typedef struct SECUREECState {
+struct SECUREECState {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
-} SECUREECState;
+};
+typedef struct SECUREECState SECUREECState;
 
 #define TYPE_SBSA_EC      "sbsa-ec"
 #define SECURE_EC(obj) OBJECT_CHECK(SECUREECState, (obj), TYPE_SBSA_EC)
diff --git a/hw/s390x/vhost-user-fs-ccw.c b/hw/s390x/vhost-user-fs-ccw.c
index 7d573156780..254153860dc 100644
--- a/hw/s390x/vhost-user-fs-ccw.c
+++ b/hw/s390x/vhost-user-fs-ccw.c
@@ -14,10 +14,11 @@
 #include "virtio-ccw.h"
 #include "qom/object.h"
 
-typedef struct VHostUserFSCcw {
+struct VHostUserFSCcw {
     VirtioCcwDevice parent_obj;
     VHostUserFS vdev;
-} VHostUserFSCcw;
+};
+typedef struct VHostUserFSCcw VHostUserFSCcw;
 
 #define TYPE_VHOST_USER_FS_CCW "vhost-user-fs-ccw"
 #define VHOST_USER_FS_CCW(obj) \
diff --git a/tests/qtest/pnv-xscom-test.c b/tests/qtest/pnv-xscom-test.c
index c8d40433620..1b13c046a9f 100644
--- a/tests/qtest/pnv-xscom-test.c
+++ b/tests/qtest/pnv-xscom-test.c
@@ -17,13 +17,14 @@ typedef enum PnvChipType {
     PNV_CHIP_POWER9,      /* AKA Nimbus */
 } PnvChipType;
 
-typedef struct PnvChip {
+struct PnvChip {
     PnvChipType chip_type;
     const char *cpu_model;
     uint64_t    xscom_base;
     uint64_t    cfam_id;
     uint32_t    first_core;
-} PnvChip;
+};
+typedef struct PnvChip PnvChip;
 
 static const PnvChip pnv_chips[] = {
     {
-- 
2.31.1


