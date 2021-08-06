Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mC79b-0002v5-Ix
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 17:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79X-0002qL-Pt
 for qemu-riscv@nongnu.org; Fri, 06 Aug 2021 17:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79S-0004vC-Ki
 for qemu-riscv@nongnu.org; Fri, 06 Aug 2021 17:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5E8RN7wSoOqhEc5sEHRQKDZCT2gGTBet99eQqd52Uk=;
 b=SdDcTG1Ns8KyT+q17Gq6+ea3o6UdET/TyFVwaZqOk7AZ2qafRJJzrEtPjMuPrX3GinUPE1
 oV+qsvHNoX44H0Tpl/OP+859Z8fg4uskstJyMgCyvRdhfbz0S7qcPw+zOJKa8zZ5wfCpb6
 dPn9NRTVN7S1HJFF7s8Jv67u+GGLySw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-iWDiH6AjN-S5E3cFCtkgSw-1; Fri, 06 Aug 2021 17:13:03 -0400
X-MC-Unique: iWDiH6AjN-S5E3cFCtkgSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92C26801AE7;
 Fri,  6 Aug 2021 21:12:59 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 408736A05F;
 Fri,  6 Aug 2021 21:12:37 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Patrick Venture <venture@google.com>, Thomas Huth <huth@tuxfamily.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, Vijai Kumar K <vijai@behindbytes.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Jason Wang <jasowang@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-6.2 07/12] [automated] Use DECLARE_*CHECKER* macros when
 possible
Date: Fri,  6 Aug 2021 17:11:22 -0400
Message-Id: <20210806211127.646908-8-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 06 Aug 2021 21:13:17 -0000

Converting existing QOM types to OBJECT_DECLARE_TYPE is not
always trivial (due to inconsistent type/macro naming schemes),
but at least converting existing manual QOM type checking macros
to use DECLARE_*CHECKER* is a simpler process, and should at
least discourage people from defining new QOM type checker macros
manually.

Generated using:

  $ ./scripts/codeconverter/converter.py -i \
    --pattern=TypeCheckMacro $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Patrick Venture <venture@google.com>
Cc: Thomas Huth <huth@tuxfamily.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>
Cc: Bandan Das <bsd@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>
Cc: Klaus Jensen <its@irrelevant.dk>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
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
Cc: Jason Wang <jasowang@redhat.com>
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-ppc@nongnu.org
---
 hw/nvme/nvme.h                              | 12 ++++++------
 hw/usb/hcd-xhci-pci.h                       |  4 ++--
 hw/usb/hcd-xhci-sysbus.h                    |  4 ++--
 hw/usb/u2f.h                                |  8 ++------
 include/hw/adc/npcm7xx_adc.h                |  4 ++--
 include/hw/arm/npcm7xx.h                    | 15 ++++-----------
 include/hw/char/shakti_uart.h               |  4 ++--
 include/hw/dma/sifive_pdma.h                |  4 ++--
 include/hw/dma/xlnx_csu_dma.h               |  4 ++--
 include/hw/gpio/npcm7xx_gpio.h              |  4 ++--
 include/hw/i2c/npcm7xx_smbus.h              |  4 ++--
 include/hw/intc/m68k_irqc.h                 |  4 ++--
 include/hw/intc/sifive_clint.h              |  4 ++--
 include/hw/mem/npcm7xx_mc.h                 |  3 ++-
 include/hw/misc/aspeed_lpc.h                |  3 ++-
 include/hw/misc/mchp_pfsoc_dmc.h            | 10 ++++------
 include/hw/misc/mchp_pfsoc_ioscb.h          |  4 ++--
 include/hw/misc/mchp_pfsoc_sysreg.h         |  5 ++---
 include/hw/misc/npcm7xx_clk.h               |  3 ++-
 include/hw/misc/npcm7xx_gcr.h               |  3 ++-
 include/hw/misc/npcm7xx_mft.h               |  4 ++--
 include/hw/misc/npcm7xx_pwm.h               |  4 ++--
 include/hw/misc/npcm7xx_rng.h               |  3 ++-
 include/hw/misc/xlnx-versal-xramc.h         |  4 ++--
 include/hw/net/npcm7xx_emc.h                |  4 ++--
 include/hw/net/xlnx-zynqmp-can.h            |  4 ++--
 include/hw/nvram/npcm7xx_otp.h              |  3 ++-
 include/hw/ppc/spapr_drc.h                  | 13 ++++---------
 include/hw/ppc/spapr_xive.h                 |  7 ++-----
 include/hw/riscv/microchip_pfsoc.h          |  9 ++++-----
 include/hw/riscv/shakti_c.h                 |  8 ++++----
 include/hw/riscv/sifive_e.h                 |  8 ++++----
 include/hw/riscv/sifive_u.h                 |  8 ++++----
 include/hw/sd/cadence_sdhci.h               |  4 ++--
 include/hw/ssi/npcm7xx_fiu.h                |  3 ++-
 include/hw/ssi/sifive_spi.h                 |  3 ++-
 include/hw/timer/npcm7xx_timer.h            |  4 ++--
 include/hw/tricore/tricore_testdevice.h     |  4 ++--
 include/hw/usb/hcd-dwc3.h                   |  4 ++--
 include/hw/usb/xlnx-usb-subsystem.h         |  4 ++--
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  4 ++--
 include/hw/watchdog/sbsa_gwdt.h             |  4 ++--
 include/qemu/accel.h                        |  8 ++------
 target/hexagon/cpu.h                        |  8 ++------
 chardev/char-parallel.c                     |  6 ++----
 hw/i2c/i2c_mux_pca954x.c                    |  4 ++--
 hw/m68k/mcf5206.c                           |  3 ++-
 hw/mem/sparse-mem.c                         |  3 ++-
 hw/misc/sbsa_ec.c                           |  3 ++-
 hw/s390x/vhost-user-fs-ccw.c                |  4 ++--
 hw/sensor/adm1272.c                         |  3 ++-
 hw/sensor/max34451.c                        |  3 ++-
 hw/usb/u2f-emulated.c                       |  4 ++--
 hw/usb/u2f-passthru.c                       |  4 ++--
 54 files changed, 126 insertions(+), 146 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 0840f585d6e..c4c43da5c17 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -43,8 +43,8 @@ typedef struct NvmeBus {
 
 #define TYPE_NVME_SUBSYS "nvme-subsys"
 typedef struct NvmeSubsystem NvmeSubsystem;
-#define NVME_SUBSYS(obj) \
-    OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
+DECLARE_INSTANCE_CHECKER(NvmeSubsystem, NVME_SUBSYS,
+                         TYPE_NVME_SUBSYS)
 
 struct NvmeSubsystem {
     DeviceState parent_obj;
@@ -83,8 +83,8 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
 }
 
 #define TYPE_NVME_NS "nvme-ns"
-#define NVME_NS(obj) \
-    OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
+DECLARE_INSTANCE_CHECKER(NvmeNamespace, NVME_NS,
+                         TYPE_NVME_NS)
 
 typedef struct NvmeZone {
     NvmeZoneDescr   d;
@@ -377,8 +377,8 @@ typedef struct NvmeCQueue {
 } NvmeCQueue;
 
 #define TYPE_NVME "nvme"
-#define NVME(obj) \
-        OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
+DECLARE_INSTANCE_CHECKER(NvmeCtrl, NVME,
+                         TYPE_NVME)
 
 typedef struct NvmeParams {
     char     *serial;
diff --git a/hw/usb/hcd-xhci-pci.h b/hw/usb/hcd-xhci-pci.h
index 0cfe630a5ce..d83aad82e04 100644
--- a/hw/usb/hcd-xhci-pci.h
+++ b/hw/usb/hcd-xhci-pci.h
@@ -30,8 +30,8 @@
 
 #define TYPE_XHCI_PCI "pci-xhci"
 typedef struct XHCIPciState XHCIPciState;
-#define XHCI_PCI(obj) \
-    OBJECT_CHECK(XHCIPciState, (obj), TYPE_XHCI_PCI)
+DECLARE_INSTANCE_CHECKER(XHCIPciState, XHCI_PCI,
+                         TYPE_XHCI_PCI)
 
 
 struct XHCIPciState {
diff --git a/hw/usb/hcd-xhci-sysbus.h b/hw/usb/hcd-xhci-sysbus.h
index 7661c811fd1..561e5144e05 100644
--- a/hw/usb/hcd-xhci-sysbus.h
+++ b/hw/usb/hcd-xhci-sysbus.h
@@ -17,8 +17,8 @@
 #include "qom/object.h"
 
 typedef struct XHCISysbusState XHCISysbusState;
-#define XHCI_SYSBUS(obj) \
-    OBJECT_CHECK(XHCISysbusState, (obj), TYPE_XHCI_SYSBUS)
+DECLARE_INSTANCE_CHECKER(XHCISysbusState, XHCI_SYSBUS,
+                         TYPE_XHCI_SYSBUS)
 
 
 struct XHCISysbusState {
diff --git a/hw/usb/u2f.h b/hw/usb/u2f.h
index 7191a23ee1a..5767ca8fac9 100644
--- a/hw/usb/u2f.h
+++ b/hw/usb/u2f.h
@@ -37,12 +37,8 @@ typedef struct U2FKeyInfo U2FKeyInfo;
 
 #define TYPE_U2F_KEY "u2f-key"
 typedef struct U2FKeyClass U2FKeyClass;
-#define U2F_KEY(obj) \
-    OBJECT_CHECK(U2FKeyState, (obj), TYPE_U2F_KEY)
-#define U2F_KEY_CLASS(klass) \
-    OBJECT_CLASS_CHECK(U2FKeyClass, (klass), TYPE_U2F_KEY)
-#define U2F_KEY_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(U2FKeyClass, (obj), TYPE_U2F_KEY)
+DECLARE_OBJ_CHECKERS(U2FKeyState, U2FKeyClass,
+                     U2F_KEY, TYPE_U2F_KEY)
 
 /*
  * Callbacks to be used by the U2F key base device (i.e. hw/u2f.c)
diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h
index 835d13f5b0d..b694adece6a 100644
--- a/include/hw/adc/npcm7xx_adc.h
+++ b/include/hw/adc/npcm7xx_adc.h
@@ -65,7 +65,7 @@ struct NPCM7xxADCState {
 typedef struct NPCM7xxADCState NPCM7xxADCState;
 
 #define TYPE_NPCM7XX_ADC "npcm7xx-adc"
-#define NPCM7XX_ADC(obj) \
-    OBJECT_CHECK(NPCM7xxADCState, (obj), TYPE_NPCM7XX_ADC)
+DECLARE_INSTANCE_CHECKER(NPCM7xxADCState, NPCM7XX_ADC,
+                         TYPE_NPCM7XX_ADC)
 
 #endif /* NPCM7XX_ADC_H */
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 697d2957590..310b3d89ed8 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -65,8 +65,8 @@ typedef struct NPCM7xxMachine NPCM7xxMachine;
 
 #define TYPE_NPCM7XX_MACHINE MACHINE_TYPE_NAME("npcm7xx")
 typedef struct NPCM7xxMachineClass NPCM7xxMachineClass;
-#define NPCM7XX_MACHINE(obj)                                            \
-    OBJECT_CHECK(NPCM7xxMachine, (obj), TYPE_NPCM7XX_MACHINE)
+DECLARE_OBJ_CHECKERS(NPCM7xxMachine, NPCM7xxMachineClass,
+                     NPCM7XX_MACHINE, TYPE_NPCM7XX_MACHINE)
 
 struct NPCM7xxMachineClass {
     MachineClass        parent;
@@ -74,10 +74,6 @@ struct NPCM7xxMachineClass {
     const char          *soc_type;
 };
 
-#define NPCM7XX_MACHINE_CLASS(klass)                                    \
-    OBJECT_CLASS_CHECK(NPCM7xxMachineClass, (klass), TYPE_NPCM7XX_MACHINE)
-#define NPCM7XX_MACHINE_GET_CLASS(obj)                                  \
-    OBJECT_GET_CLASS(NPCM7xxMachineClass, (obj), TYPE_NPCM7XX_MACHINE)
 
 struct NPCM7xxState {
     DeviceState         parent;
@@ -111,7 +107,8 @@ typedef struct NPCM7xxState NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
 typedef struct NPCM7xxClass NPCM7xxClass;
-#define NPCM7XX(obj)    OBJECT_CHECK(NPCM7xxState, (obj), TYPE_NPCM7XX)
+DECLARE_OBJ_CHECKERS(NPCM7xxState, NPCM7xxClass,
+                     NPCM7XX, TYPE_NPCM7XX)
 
 #define TYPE_NPCM730    "npcm730"
 #define TYPE_NPCM750    "npcm750"
@@ -125,10 +122,6 @@ struct NPCM7xxClass {
     uint32_t            num_cpus;
 };
 
-#define NPCM7XX_CLASS(klass)                                            \
-    OBJECT_CLASS_CHECK(NPCM7xxClass, (klass), TYPE_NPCM7XX)
-#define NPCM7XX_GET_CLASS(obj)                                          \
-    OBJECT_GET_CLASS(NPCM7xxClass, (obj), TYPE_NPCM7XX)
 
 /**
  * npcm7xx_load_kernel - Loads memory with everything needed to boot
diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h
index be7a93fb14d..9bec3062af0 100644
--- a/include/hw/char/shakti_uart.h
+++ b/include/hw/char/shakti_uart.h
@@ -50,8 +50,8 @@
 
 #define TYPE_SHAKTI_UART "shakti-uart"
 typedef struct ShaktiUartState ShaktiUartState;
-#define SHAKTI_UART(obj) \
-    OBJECT_CHECK(ShaktiUartState, (obj), TYPE_SHAKTI_UART)
+DECLARE_INSTANCE_CHECKER(ShaktiUartState, SHAKTI_UART,
+                         TYPE_SHAKTI_UART)
 
 struct ShaktiUartState {
     /* <private> */
diff --git a/include/hw/dma/sifive_pdma.h b/include/hw/dma/sifive_pdma.h
index 76b4b45d0a4..d81526cfc2f 100644
--- a/include/hw/dma/sifive_pdma.h
+++ b/include/hw/dma/sifive_pdma.h
@@ -53,7 +53,7 @@ typedef struct SiFivePDMAState SiFivePDMAState;
 
 #define TYPE_SIFIVE_PDMA    "sifive.pdma"
 
-#define SIFIVE_PDMA(obj)    \
-    OBJECT_CHECK(SiFivePDMAState, (obj), TYPE_SIFIVE_PDMA)
+DECLARE_INSTANCE_CHECKER(SiFivePDMAState, SIFIVE_PDMA,
+                         TYPE_SIFIVE_PDMA)
 
 #endif /* SIFIVE_PDMA_H */
diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index f8d88e2ebee..36433d189ac 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -48,7 +48,7 @@ struct XlnxCSUDMA {
 };
 typedef struct XlnxCSUDMA XlnxCSUDMA;
 
-#define XLNX_CSU_DMA(obj) \
-    OBJECT_CHECK(XlnxCSUDMA, (obj), TYPE_XLNX_CSU_DMA)
+DECLARE_INSTANCE_CHECKER(XlnxCSUDMA, XLNX_CSU_DMA,
+                         TYPE_XLNX_CSU_DMA)
 
 #endif
diff --git a/include/hw/gpio/npcm7xx_gpio.h b/include/hw/gpio/npcm7xx_gpio.h
index e45cf45e78e..cfc9baefce5 100644
--- a/include/hw/gpio/npcm7xx_gpio.h
+++ b/include/hw/gpio/npcm7xx_gpio.h
@@ -51,7 +51,7 @@ struct NPCM7xxGPIOState {
 typedef struct NPCM7xxGPIOState NPCM7xxGPIOState;
 
 #define TYPE_NPCM7XX_GPIO "npcm7xx-gpio"
-#define NPCM7XX_GPIO(obj) \
-    OBJECT_CHECK(NPCM7xxGPIOState, (obj), TYPE_NPCM7XX_GPIO)
+DECLARE_INSTANCE_CHECKER(NPCM7xxGPIOState, NPCM7XX_GPIO,
+                         TYPE_NPCM7XX_GPIO)
 
 #endif /* NPCM7XX_GPIO_H */
diff --git a/include/hw/i2c/npcm7xx_smbus.h b/include/hw/i2c/npcm7xx_smbus.h
index ef64c6748a7..aa5e1d84b41 100644
--- a/include/hw/i2c/npcm7xx_smbus.h
+++ b/include/hw/i2c/npcm7xx_smbus.h
@@ -109,7 +109,7 @@ struct NPCM7xxSMBusState {
 typedef struct NPCM7xxSMBusState NPCM7xxSMBusState;
 
 #define TYPE_NPCM7XX_SMBUS "npcm7xx-smbus"
-#define NPCM7XX_SMBUS(obj) OBJECT_CHECK(NPCM7xxSMBusState, (obj), \
-                                        TYPE_NPCM7XX_SMBUS)
+DECLARE_INSTANCE_CHECKER(NPCM7xxSMBusState, NPCM7XX_SMBUS,
+                         TYPE_NPCM7XX_SMBUS)
 
 #endif /* NPCM7XX_SMBUS_H */
diff --git a/include/hw/intc/m68k_irqc.h b/include/hw/intc/m68k_irqc.h
index 460d8a5a8d3..843cec3c666 100644
--- a/include/hw/intc/m68k_irqc.h
+++ b/include/hw/intc/m68k_irqc.h
@@ -15,8 +15,8 @@
 
 #define TYPE_M68K_IRQC "m68k-irq-controller"
 typedef struct M68KIRQCState M68KIRQCState;
-#define M68K_IRQC(obj) OBJECT_CHECK(M68KIRQCState, (obj), \
-                                    TYPE_M68K_IRQC)
+DECLARE_INSTANCE_CHECKER(M68KIRQCState, M68K_IRQC,
+                         TYPE_M68K_IRQC)
 
 #define M68K_IRQC_AUTOVECTOR_BASE 25
 
diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clint.h
index 8e005e130f1..c7df3f7f2b3 100644
--- a/include/hw/intc/sifive_clint.h
+++ b/include/hw/intc/sifive_clint.h
@@ -26,8 +26,8 @@
 #define TYPE_SIFIVE_CLINT "riscv.sifive.clint"
 
 typedef struct SiFiveCLINTState SiFiveCLINTState;
-#define SIFIVE_CLINT(obj) \
-    OBJECT_CHECK(SiFiveCLINTState, (obj), TYPE_SIFIVE_CLINT)
+DECLARE_INSTANCE_CHECKER(SiFiveCLINTState, SIFIVE_CLINT,
+                         TYPE_SIFIVE_CLINT)
 
 struct SiFiveCLINTState {
     /*< private >*/
diff --git a/include/hw/mem/npcm7xx_mc.h b/include/hw/mem/npcm7xx_mc.h
index e0a9d3b0de9..bec8ebc45ef 100644
--- a/include/hw/mem/npcm7xx_mc.h
+++ b/include/hw/mem/npcm7xx_mc.h
@@ -33,6 +33,7 @@ struct NPCM7xxMCState {
 typedef struct NPCM7xxMCState NPCM7xxMCState;
 
 #define TYPE_NPCM7XX_MC "npcm7xx-mc"
-#define NPCM7XX_MC(obj) OBJECT_CHECK(NPCM7xxMCState, (obj), TYPE_NPCM7XX_MC)
+DECLARE_INSTANCE_CHECKER(NPCM7xxMCState, NPCM7XX_MC,
+                         TYPE_NPCM7XX_MC)
 
 #endif /* NPCM7XX_MC_H */
diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_lpc.h
index def617b9772..d8e5af6296b 100644
--- a/include/hw/misc/aspeed_lpc.h
+++ b/include/hw/misc/aspeed_lpc.h
@@ -17,7 +17,8 @@
 
 #define TYPE_ASPEED_LPC "aspeed.lpc"
 typedef struct AspeedLPCState AspeedLPCState;
-#define ASPEED_LPC(obj) OBJECT_CHECK(AspeedLPCState, (obj), TYPE_ASPEED_LPC)
+DECLARE_INSTANCE_CHECKER(AspeedLPCState, ASPEED_LPC,
+                         TYPE_ASPEED_LPC)
 
 #define ASPEED_LPC_NR_REGS      (0x260 >> 2)
 
diff --git a/include/hw/misc/mchp_pfsoc_dmc.h b/include/hw/misc/mchp_pfsoc_dmc.h
index 28cfe3e1e23..3a0e3bbba76 100644
--- a/include/hw/misc/mchp_pfsoc_dmc.h
+++ b/include/hw/misc/mchp_pfsoc_dmc.h
@@ -36,9 +36,8 @@ typedef struct MchpPfSoCDdrSgmiiPhyState MchpPfSoCDdrSgmiiPhyState;
 
 #define TYPE_MCHP_PFSOC_DDR_SGMII_PHY "mchp.pfsoc.ddr_sgmii_phy"
 
-#define MCHP_PFSOC_DDR_SGMII_PHY(obj) \
-    OBJECT_CHECK(MchpPfSoCDdrSgmiiPhyState, (obj), \
-                 TYPE_MCHP_PFSOC_DDR_SGMII_PHY)
+DECLARE_INSTANCE_CHECKER(MchpPfSoCDdrSgmiiPhyState, MCHP_PFSOC_DDR_SGMII_PHY,
+                         TYPE_MCHP_PFSOC_DDR_SGMII_PHY)
 
 /* DDR CFG module */
 
@@ -52,8 +51,7 @@ typedef struct MchpPfSoCDdrCfgState MchpPfSoCDdrCfgState;
 
 #define TYPE_MCHP_PFSOC_DDR_CFG "mchp.pfsoc.ddr_cfg"
 
-#define MCHP_PFSOC_DDR_CFG(obj) \
-    OBJECT_CHECK(MchpPfSoCDdrCfgState, (obj), \
-                 TYPE_MCHP_PFSOC_DDR_CFG)
+DECLARE_INSTANCE_CHECKER(MchpPfSoCDdrCfgState, MCHP_PFSOC_DDR_CFG,
+                         TYPE_MCHP_PFSOC_DDR_CFG)
 
 #endif /* MCHP_PFSOC_DMC_H */
diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
index 95b0b9069dd..18ef5ff1739 100644
--- a/include/hw/misc/mchp_pfsoc_ioscb.h
+++ b/include/hw/misc/mchp_pfsoc_ioscb.h
@@ -46,7 +46,7 @@ typedef struct MchpPfSoCIoscbState MchpPfSoCIoscbState;
 
 #define TYPE_MCHP_PFSOC_IOSCB "mchp.pfsoc.ioscb"
 
-#define MCHP_PFSOC_IOSCB(obj) \
-    OBJECT_CHECK(MchpPfSoCIoscbState, (obj), TYPE_MCHP_PFSOC_IOSCB)
+DECLARE_INSTANCE_CHECKER(MchpPfSoCIoscbState, MCHP_PFSOC_IOSCB,
+                         TYPE_MCHP_PFSOC_IOSCB)
 
 #endif /* MCHP_PFSOC_IOSCB_H */
diff --git a/include/hw/misc/mchp_pfsoc_sysreg.h b/include/hw/misc/mchp_pfsoc_sysreg.h
index adce8d869c4..c842cf7e716 100644
--- a/include/hw/misc/mchp_pfsoc_sysreg.h
+++ b/include/hw/misc/mchp_pfsoc_sysreg.h
@@ -34,8 +34,7 @@ typedef struct MchpPfSoCSysregState MchpPfSoCSysregState;
 
 #define TYPE_MCHP_PFSOC_SYSREG "mchp.pfsoc.sysreg"
 
-#define MCHP_PFSOC_SYSREG(obj) \
-    OBJECT_CHECK(MchpPfSoCSysregState, (obj), \
-                 TYPE_MCHP_PFSOC_SYSREG)
+DECLARE_INSTANCE_CHECKER(MchpPfSoCSysregState, MCHP_PFSOC_SYSREG,
+                         TYPE_MCHP_PFSOC_SYSREG)
 
 #endif /* MCHP_PFSOC_SYSREG_H */
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
index 80b651c7e44..023a1aed7a9 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -179,6 +179,7 @@ struct NPCM7xxCLKState {
 };
 
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
-#define NPCM7XX_CLK(obj) OBJECT_CHECK(NPCM7xxCLKState, (obj), TYPE_NPCM7XX_CLK)
+DECLARE_INSTANCE_CHECKER(NPCM7xxCLKState, NPCM7XX_CLK,
+                         TYPE_NPCM7XX_CLK)
 
 #endif /* NPCM7XX_CLK_H */
diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index b5c573ec8f2..eed59f94f91 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -40,6 +40,7 @@ struct NPCM7xxGCRState {
 typedef struct NPCM7xxGCRState NPCM7xxGCRState;
 
 #define TYPE_NPCM7XX_GCR "npcm7xx-gcr"
-#define NPCM7XX_GCR(obj) OBJECT_CHECK(NPCM7xxGCRState, (obj), TYPE_NPCM7XX_GCR)
+DECLARE_INSTANCE_CHECKER(NPCM7xxGCRState, NPCM7XX_GCR,
+                         TYPE_NPCM7XX_GCR)
 
 #endif /* NPCM7XX_GCR_H */
diff --git a/include/hw/misc/npcm7xx_mft.h b/include/hw/misc/npcm7xx_mft.h
index 3f7bd2a9c6a..a351cf9b2be 100644
--- a/include/hw/misc/npcm7xx_mft.h
+++ b/include/hw/misc/npcm7xx_mft.h
@@ -65,7 +65,7 @@ struct NPCM7xxMFTState {
 typedef struct NPCM7xxMFTState NPCM7xxMFTState;
 
 #define TYPE_NPCM7XX_MFT "npcm7xx-mft"
-#define NPCM7XX_MFT(obj) \
-    OBJECT_CHECK(NPCM7xxMFTState, (obj), TYPE_NPCM7XX_MFT)
+DECLARE_INSTANCE_CHECKER(NPCM7xxMFTState, NPCM7XX_MFT,
+                         TYPE_NPCM7XX_MFT)
 
 #endif /* NPCM7XX_MFT_H */
diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h
index c6643bd04fd..3be975e1ee4 100644
--- a/include/hw/misc/npcm7xx_pwm.h
+++ b/include/hw/misc/npcm7xx_pwm.h
@@ -102,7 +102,7 @@ struct NPCM7xxPWMState {
 };
 
 #define TYPE_NPCM7XX_PWM "npcm7xx-pwm"
-#define NPCM7XX_PWM(obj) \
-    OBJECT_CHECK(NPCM7xxPWMState, (obj), TYPE_NPCM7XX_PWM)
+DECLARE_INSTANCE_CHECKER(NPCM7xxPWMState, NPCM7XX_PWM,
+                         TYPE_NPCM7XX_PWM)
 
 #endif /* NPCM7XX_PWM_H */
diff --git a/include/hw/misc/npcm7xx_rng.h b/include/hw/misc/npcm7xx_rng.h
index 27122001f4b..e1f798a4bed 100644
--- a/include/hw/misc/npcm7xx_rng.h
+++ b/include/hw/misc/npcm7xx_rng.h
@@ -31,6 +31,7 @@ struct NPCM7xxRNGState {
 typedef struct NPCM7xxRNGState NPCM7xxRNGState;
 
 #define TYPE_NPCM7XX_RNG "npcm7xx-rng"
-#define NPCM7XX_RNG(obj) OBJECT_CHECK(NPCM7xxRNGState, (obj), TYPE_NPCM7XX_RNG)
+DECLARE_INSTANCE_CHECKER(NPCM7xxRNGState, NPCM7XX_RNG,
+                         TYPE_NPCM7XX_RNG)
 
 #endif /* NPCM7XX_RNG_H */
diff --git a/include/hw/misc/xlnx-versal-xramc.h b/include/hw/misc/xlnx-versal-xramc.h
index ba0d0f3c5af..fc5a12165cf 100644
--- a/include/hw/misc/xlnx-versal-xramc.h
+++ b/include/hw/misc/xlnx-versal-xramc.h
@@ -16,8 +16,8 @@
 #define TYPE_XLNX_XRAM_CTRL "xlnx.versal-xramc"
 
 typedef struct XlnxXramCtrl XlnxXramCtrl;
-#define XLNX_XRAM_CTRL(obj) \
-     OBJECT_CHECK(XlnxXramCtrl, (obj), TYPE_XLNX_XRAM_CTRL)
+DECLARE_INSTANCE_CHECKER(XlnxXramCtrl, XLNX_XRAM_CTRL,
+                         TYPE_XLNX_XRAM_CTRL)
 
 REG32(XRAM_ERR_CTRL, 0x0)
     FIELD(XRAM_ERR_CTRL, UE_RES, 3, 1)
diff --git a/include/hw/net/npcm7xx_emc.h b/include/hw/net/npcm7xx_emc.h
index 5b676f669cd..bdf06c69dde 100644
--- a/include/hw/net/npcm7xx_emc.h
+++ b/include/hw/net/npcm7xx_emc.h
@@ -281,7 +281,7 @@ struct NPCM7xxEMCState {
 typedef struct NPCM7xxEMCState NPCM7xxEMCState;
 
 #define TYPE_NPCM7XX_EMC "npcm7xx-emc"
-#define NPCM7XX_EMC(obj) \
-    OBJECT_CHECK(NPCM7xxEMCState, (obj), TYPE_NPCM7XX_EMC)
+DECLARE_INSTANCE_CHECKER(NPCM7xxEMCState, NPCM7XX_EMC,
+                         TYPE_NPCM7XX_EMC)
 
 #endif /* NPCM7XX_EMC_H */
diff --git a/include/hw/net/xlnx-zynqmp-can.h b/include/hw/net/xlnx-zynqmp-can.h
index 3d80c7455db..4a1fa166571 100644
--- a/include/hw/net/xlnx-zynqmp-can.h
+++ b/include/hw/net/xlnx-zynqmp-can.h
@@ -41,8 +41,8 @@
 #define TYPE_XLNX_ZYNQMP_CAN "xlnx.zynqmp-can"
 
 typedef struct XlnxZynqMPCANState XlnxZynqMPCANState;
-#define XLNX_ZYNQMP_CAN(obj) \
-     OBJECT_CHECK(XlnxZynqMPCANState, (obj), TYPE_XLNX_ZYNQMP_CAN)
+DECLARE_INSTANCE_CHECKER(XlnxZynqMPCANState, XLNX_ZYNQMP_CAN,
+                         TYPE_XLNX_ZYNQMP_CAN)
 
 #define MAX_CAN_CTRLS      2
 #define XLNX_ZYNQMP_CAN_R_MAX     (0x84 / 4)
diff --git a/include/hw/nvram/npcm7xx_otp.h b/include/hw/nvram/npcm7xx_otp.h
index 0ab1d5bae48..4cfc6577e87 100644
--- a/include/hw/nvram/npcm7xx_otp.h
+++ b/include/hw/nvram/npcm7xx_otp.h
@@ -58,7 +58,8 @@ struct NPCM7xxOTPState {
 typedef struct NPCM7xxOTPState NPCM7xxOTPState;
 
 #define TYPE_NPCM7XX_OTP "npcm7xx-otp"
-#define NPCM7XX_OTP(obj) OBJECT_CHECK(NPCM7xxOTPState, (obj), TYPE_NPCM7XX_OTP)
+DECLARE_INSTANCE_CHECKER(NPCM7xxOTPState, NPCM7XX_OTP,
+                         TYPE_NPCM7XX_OTP)
 
 #define TYPE_NPCM7XX_KEY_STORAGE "npcm7xx-key-storage"
 #define TYPE_NPCM7XX_FUSE_ARRAY "npcm7xx-fuse-array"
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 83019d3f672..540439812f0 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -22,18 +22,13 @@
 #define TYPE_SPAPR_DR_CONNECTOR "spapr-dr-connector"
 typedef struct SpaprDrc SpaprDrc;
 typedef struct SpaprDrcClass SpaprDrcClass;
-#define SPAPR_DR_CONNECTOR_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DR_CONNECTOR)
-#define SPAPR_DR_CONNECTOR_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, \
-                           TYPE_SPAPR_DR_CONNECTOR)
-#define SPAPR_DR_CONNECTOR(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                             TYPE_SPAPR_DR_CONNECTOR)
+DECLARE_OBJ_CHECKERS(SpaprDrc, SpaprDrcClass,
+                     SPAPR_DR_CONNECTOR, TYPE_SPAPR_DR_CONNECTOR)
 
 #define TYPE_SPAPR_DRC_PHYSICAL "spapr-drc-physical"
 typedef struct SpaprDrcPhysical SpaprDrcPhysical;
-#define SPAPR_DRC_PHYSICAL(obj) OBJECT_CHECK(SpaprDrcPhysical, (obj), \
-                                             TYPE_SPAPR_DRC_PHYSICAL)
+DECLARE_INSTANCE_CHECKER(SpaprDrcPhysical, SPAPR_DRC_PHYSICAL,
+                         TYPE_SPAPR_DRC_PHYSICAL)
 
 #define TYPE_SPAPR_DRC_LOGICAL "spapr-drc-logical"
 
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index d1371b2dbba..333095c3fd9 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -17,11 +17,8 @@
 #define TYPE_SPAPR_XIVE "spapr-xive"
 typedef struct SpaprXive SpaprXive;
 typedef struct SpaprXiveClass SpaprXiveClass;
-#define SPAPR_XIVE(obj) OBJECT_CHECK(SpaprXive, (obj), TYPE_SPAPR_XIVE)
-#define SPAPR_XIVE_CLASS(klass)                                         \
-    OBJECT_CLASS_CHECK(SpaprXiveClass, (klass), TYPE_SPAPR_XIVE)
-#define SPAPR_XIVE_GET_CLASS(obj)                               \
-    OBJECT_GET_CLASS(SpaprXiveClass, (obj), TYPE_SPAPR_XIVE)
+DECLARE_OBJ_CHECKERS(SpaprXive, SpaprXiveClass,
+                     SPAPR_XIVE, TYPE_SPAPR_XIVE)
 
 struct SpaprXive {
     XiveRouter    parent;
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index b30fb1191d9..3a29a48019e 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -58,8 +58,8 @@ struct MicrochipPFSoCState {
 typedef struct MicrochipPFSoCState MicrochipPFSoCState;
 
 #define TYPE_MICROCHIP_PFSOC    "microchip.pfsoc"
-#define MICROCHIP_PFSOC(obj) \
-    OBJECT_CHECK(MicrochipPFSoCState, (obj), TYPE_MICROCHIP_PFSOC)
+DECLARE_INSTANCE_CHECKER(MicrochipPFSoCState, MICROCHIP_PFSOC,
+                         TYPE_MICROCHIP_PFSOC)
 
 struct MicrochipIcicleKitState {
     /*< private >*/
@@ -72,9 +72,8 @@ typedef struct MicrochipIcicleKitState MicrochipIcicleKitState;
 
 #define TYPE_MICROCHIP_ICICLE_KIT_MACHINE \
     MACHINE_TYPE_NAME("microchip-icicle-kit")
-#define MICROCHIP_ICICLE_KIT_MACHINE(obj) \
-    OBJECT_CHECK(MicrochipIcicleKitState, (obj), \
-                 TYPE_MICROCHIP_ICICLE_KIT_MACHINE)
+DECLARE_INSTANCE_CHECKER(MicrochipIcicleKitState, MICROCHIP_ICICLE_KIT_MACHINE,
+                         TYPE_MICROCHIP_ICICLE_KIT_MACHINE)
 
 enum {
     MICROCHIP_PFSOC_RSVD0,
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index e07bca3a357..6733eca2303 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -26,8 +26,8 @@
 
 #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
 typedef struct ShaktiCSoCState ShaktiCSoCState;
-#define RISCV_SHAKTI_SOC(obj) \
-    OBJECT_CHECK(ShaktiCSoCState, (obj), TYPE_RISCV_SHAKTI_SOC)
+DECLARE_INSTANCE_CHECKER(ShaktiCSoCState, RISCV_SHAKTI_SOC,
+                         TYPE_RISCV_SHAKTI_SOC)
 
 struct ShaktiCSoCState {
     /*< private >*/
@@ -43,8 +43,8 @@ struct ShaktiCSoCState {
 
 #define TYPE_RISCV_SHAKTI_MACHINE MACHINE_TYPE_NAME("shakti_c")
 typedef struct ShaktiCMachineState ShaktiCMachineState;
-#define RISCV_SHAKTI_MACHINE(obj) \
-    OBJECT_CHECK(ShaktiCMachineState, (obj), TYPE_RISCV_SHAKTI_MACHINE)
+DECLARE_INSTANCE_CHECKER(ShaktiCMachineState, RISCV_SHAKTI_MACHINE,
+                         TYPE_RISCV_SHAKTI_MACHINE)
 struct ShaktiCMachineState {
     /*< private >*/
     MachineState parent_obj;
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 9c9ce14a4b4..22abd643753 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -26,8 +26,8 @@
 
 #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
 typedef struct SiFiveESoCState SiFiveESoCState;
-#define RISCV_E_SOC(obj) \
-    OBJECT_CHECK(SiFiveESoCState, (obj), TYPE_RISCV_E_SOC)
+DECLARE_INSTANCE_CHECKER(SiFiveESoCState, RISCV_E_SOC,
+                         TYPE_RISCV_E_SOC)
 
 struct SiFiveESoCState {
     /*< private >*/
@@ -52,8 +52,8 @@ struct SiFiveEState {
 typedef struct SiFiveEState SiFiveEState;
 
 #define TYPE_RISCV_E_MACHINE MACHINE_TYPE_NAME("sifive_e")
-#define RISCV_E_MACHINE(obj) \
-    OBJECT_CHECK(SiFiveEState, (obj), TYPE_RISCV_E_MACHINE)
+DECLARE_INSTANCE_CHECKER(SiFiveEState, RISCV_E_MACHINE,
+                         TYPE_RISCV_E_MACHINE)
 
 enum {
     SIFIVE_E_DEV_DEBUG,
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index ef050a22dc2..d974043a36d 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -31,8 +31,8 @@
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 typedef struct SiFiveUSoCState SiFiveUSoCState;
-#define RISCV_U_SOC(obj) \
-    OBJECT_CHECK(SiFiveUSoCState, (obj), TYPE_RISCV_U_SOC)
+DECLARE_INSTANCE_CHECKER(SiFiveUSoCState, RISCV_U_SOC,
+                         TYPE_RISCV_U_SOC)
 
 struct SiFiveUSoCState {
     /*< private >*/
@@ -58,8 +58,8 @@ struct SiFiveUSoCState {
 
 #define TYPE_RISCV_U_MACHINE MACHINE_TYPE_NAME("sifive_u")
 typedef struct SiFiveUState SiFiveUState;
-#define RISCV_U_MACHINE(obj) \
-    OBJECT_CHECK(SiFiveUState, (obj), TYPE_RISCV_U_MACHINE)
+DECLARE_INSTANCE_CHECKER(SiFiveUState, RISCV_U_MACHINE,
+                         TYPE_RISCV_U_MACHINE)
 
 struct SiFiveUState {
     /*< private >*/
diff --git a/include/hw/sd/cadence_sdhci.h b/include/hw/sd/cadence_sdhci.h
index 75c174f357a..6d6a2d9c0da 100644
--- a/include/hw/sd/cadence_sdhci.h
+++ b/include/hw/sd/cadence_sdhci.h
@@ -43,7 +43,7 @@ struct CadenceSDHCIState {
 typedef struct CadenceSDHCIState CadenceSDHCIState;
 
 #define TYPE_CADENCE_SDHCI  "cadence.sdhci"
-#define CADENCE_SDHCI(obj)  OBJECT_CHECK(CadenceSDHCIState, (obj), \
-                                         TYPE_CADENCE_SDHCI)
+DECLARE_INSTANCE_CHECKER(CadenceSDHCIState, CADENCE_SDHCI,
+                         TYPE_CADENCE_SDHCI)
 
 #endif /* CADENCE_SDHCI_H */
diff --git a/include/hw/ssi/npcm7xx_fiu.h b/include/hw/ssi/npcm7xx_fiu.h
index 01597ea8954..6503da5b37a 100644
--- a/include/hw/ssi/npcm7xx_fiu.h
+++ b/include/hw/ssi/npcm7xx_fiu.h
@@ -69,6 +69,7 @@ struct NPCM7xxFIUState {
 };
 
 #define TYPE_NPCM7XX_FIU "npcm7xx-fiu"
-#define NPCM7XX_FIU(obj) OBJECT_CHECK(NPCM7xxFIUState, (obj), TYPE_NPCM7XX_FIU)
+DECLARE_INSTANCE_CHECKER(NPCM7xxFIUState, NPCM7XX_FIU,
+                         TYPE_NPCM7XX_FIU)
 
 #endif /* NPCM7XX_FIU_H */
diff --git a/include/hw/ssi/sifive_spi.h b/include/hw/ssi/sifive_spi.h
index 6ed73ccfef0..d32deaea0ec 100644
--- a/include/hw/ssi/sifive_spi.h
+++ b/include/hw/ssi/sifive_spi.h
@@ -27,7 +27,8 @@
 
 #define TYPE_SIFIVE_SPI "sifive.spi"
 typedef struct SiFiveSPIState SiFiveSPIState;
-#define SIFIVE_SPI(obj) OBJECT_CHECK(SiFiveSPIState, (obj), TYPE_SIFIVE_SPI)
+DECLARE_INSTANCE_CHECKER(SiFiveSPIState, SIFIVE_SPI,
+                         TYPE_SIFIVE_SPI)
 
 struct SiFiveSPIState {
     SysBusDevice parent_obj;
diff --git a/include/hw/timer/npcm7xx_timer.h b/include/hw/timer/npcm7xx_timer.h
index d06b14acdc0..ff1985f5ca5 100644
--- a/include/hw/timer/npcm7xx_timer.h
+++ b/include/hw/timer/npcm7xx_timer.h
@@ -108,7 +108,7 @@ struct NPCM7xxTimerCtrlState {
 };
 
 #define TYPE_NPCM7XX_TIMER "npcm7xx-timer"
-#define NPCM7XX_TIMER(obj)                                              \
-    OBJECT_CHECK(NPCM7xxTimerCtrlState, (obj), TYPE_NPCM7XX_TIMER)
+DECLARE_INSTANCE_CHECKER(NPCM7xxTimerCtrlState, NPCM7XX_TIMER,
+                         TYPE_NPCM7XX_TIMER)
 
 #endif /* NPCM7XX_TIMER_H */
diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
index f6a2dd25320..4d68f129cc1 100644
--- a/include/hw/tricore/tricore_testdevice.h
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -25,8 +25,8 @@
 
 #define TYPE_TRICORE_TESTDEVICE "tricore_testdevice"
 typedef struct TriCoreTestDeviceState TriCoreTestDeviceState;
-#define TRICORE_TESTDEVICE(obj) \
-    OBJECT_CHECK(TriCoreTestDeviceState, (obj), TYPE_TRICORE_TESTDEVICE)
+DECLARE_INSTANCE_CHECKER(TriCoreTestDeviceState, TRICORE_TESTDEVICE,
+                         TYPE_TRICORE_TESTDEVICE)
 
 struct TriCoreTestDeviceState {
     /* <private> */
diff --git a/include/hw/usb/hcd-dwc3.h b/include/hw/usb/hcd-dwc3.h
index 799a701bae3..20402a9ad0b 100644
--- a/include/hw/usb/hcd-dwc3.h
+++ b/include/hw/usb/hcd-dwc3.h
@@ -33,8 +33,8 @@
 #define TYPE_USB_DWC3 "usb_dwc3"
 
 typedef struct USBDWC3 USBDWC3;
-#define USB_DWC3(obj) \
-     OBJECT_CHECK(USBDWC3, (obj), TYPE_USB_DWC3)
+DECLARE_INSTANCE_CHECKER(USBDWC3, USB_DWC3,
+                         TYPE_USB_DWC3)
 
 #define USB_DWC3_R_MAX ((0x530 / 4) + 1)
 #define DWC3_SIZE 0x10000
diff --git a/include/hw/usb/xlnx-usb-subsystem.h b/include/hw/usb/xlnx-usb-subsystem.h
index e6175146817..8278f6e052a 100644
--- a/include/hw/usb/xlnx-usb-subsystem.h
+++ b/include/hw/usb/xlnx-usb-subsystem.h
@@ -32,8 +32,8 @@
 #define TYPE_XILINX_VERSAL_USB2 "xlnx.versal-usb2"
 
 typedef struct VersalUsb2 VersalUsb2;
-#define VERSAL_USB2(obj) \
-     OBJECT_CHECK(VersalUsb2, (obj), TYPE_XILINX_VERSAL_USB2)
+DECLARE_INSTANCE_CHECKER(VersalUsb2, VERSAL_USB2,
+                         TYPE_XILINX_VERSAL_USB2)
 
 struct VersalUsb2 {
     SysBusDevice parent_obj;
diff --git a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
index 7848cac6c1c..701302ad044 100644
--- a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
+++ b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
@@ -30,8 +30,8 @@
 #define TYPE_XILINX_VERSAL_USB2_CTRL_REGS "xlnx.versal-usb2-ctrl-regs"
 
 typedef struct VersalUsb2CtrlRegs VersalUsb2CtrlRegs;
-#define XILINX_VERSAL_USB2_CTRL_REGS(obj) \
-     OBJECT_CHECK(VersalUsb2CtrlRegs, (obj), TYPE_XILINX_VERSAL_USB2_CTRL_REGS)
+DECLARE_INSTANCE_CHECKER(VersalUsb2CtrlRegs, XILINX_VERSAL_USB2_CTRL_REGS,
+                         TYPE_XILINX_VERSAL_USB2_CTRL_REGS)
 
 #define USB2_REGS_R_MAX ((0x78 / 4) + 1)
 
diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
index babb120f5d3..d41da751cf7 100644
--- a/include/hw/watchdog/sbsa_gwdt.h
+++ b/include/hw/watchdog/sbsa_gwdt.h
@@ -19,8 +19,8 @@
 
 #define TYPE_WDT_SBSA "sbsa_gwdt"
 typedef struct SBSA_GWDTState SBSA_GWDTState;
-#define SBSA_GWDT(obj) \
-    OBJECT_CHECK(SBSA_GWDTState, (obj), TYPE_WDT_SBSA)
+DECLARE_INSTANCE_CHECKER(SBSA_GWDTState, SBSA_GWDT,
+                         TYPE_WDT_SBSA)
 
 /* SBSA Generic Watchdog register definitions */
 /* refresh frame */
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index c18f43a3a8c..8dc4ccc39ef 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -61,12 +61,8 @@ typedef struct AccelClass AccelClass;
 #define ACCEL_CLASS_SUFFIX  "-" TYPE_ACCEL_BASE
 #define ACCEL_CLASS_NAME(a) (a ACCEL_CLASS_SUFFIX)
 
-#define ACCEL_BASE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(AccelClass, (klass), TYPE_ACCEL_BASE)
-#define ACCEL_BASE(obj) \
-    OBJECT_CHECK(AccelState, (obj), TYPE_ACCEL_BASE)
-#define ACCEL_BASE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(AccelClass, (obj), TYPE_ACCEL_BASE)
+DECLARE_OBJ_CHECKERS(AccelState, AccelClass,
+                     ACCEL_BASE, TYPE_ACCEL_BASE)
 
 AccelClass *accel_find(const char *opt_name);
 AccelState *current_accel(void);
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 20928b9efa5..30462497c6e 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -104,12 +104,8 @@ struct CPUHexagonState {
 
 typedef struct HexagonCPUClass HexagonCPUClass;
 typedef struct HexagonCPU HexagonCPU;
-#define HEXAGON_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(HexagonCPUClass, (klass), TYPE_HEXAGON_CPU)
-#define HEXAGON_CPU(obj) \
-    OBJECT_CHECK(HexagonCPU, (obj), TYPE_HEXAGON_CPU)
-#define HEXAGON_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(HexagonCPUClass, (obj), TYPE_HEXAGON_CPU)
+DECLARE_OBJ_CHECKERS(HexagonCPU, HexagonCPUClass,
+                     HEXAGON_CPU, TYPE_HEXAGON_CPU)
 
 struct HexagonCPUClass {
     /*< private >*/
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index bebe0507053..66e4589b2b2 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -57,8 +57,8 @@ struct ParallelChardev {
 };
 typedef struct ParallelChardev ParallelChardev;
 
-#define PARALLEL_CHARDEV(obj) \
-    OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
+DECLARE_INSTANCE_CHECKER(ParallelChardev, PARALLEL_CHARDEV,
+                         TYPE_CHARDEV_PARALLEL)
 
 static int pp_hw_mode(ParallelChardev *s, uint16_t mode)
 {
@@ -185,8 +185,6 @@ struct ParallelChardev {
 };
 typedef struct ParallelChardev ParallelChardev;
 
-#define PARALLEL_CHARDEV(obj)                                   \
-    OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
 
 static int pp_ioctl(Chardev *chr, int cmd, void *arg)
 {
diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 40b4c44a5df..f95c5127643 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -46,8 +46,8 @@ struct Pca954xChannel {
 typedef struct Pca954xChannel Pca954xChannel;
 
 #define TYPE_PCA954X_CHANNEL "pca954x-channel"
-#define PCA954X_CHANNEL(obj) \
-    OBJECT_CHECK(Pca954xChannel, (obj), TYPE_PCA954X_CHANNEL)
+DECLARE_INSTANCE_CHECKER(Pca954xChannel, PCA954X_CHANNEL,
+                         TYPE_PCA954X_CHANNEL)
 
 /*
  * struct Pca954xState - The pca954x state object.
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index b8001fdcf5e..165ab56eeaa 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -181,7 +181,8 @@ struct m5206_mbar_state {
 };
 typedef struct m5206_mbar_state m5206_mbar_state;
 
-#define MCF5206_MBAR(obj) OBJECT_CHECK(m5206_mbar_state, (obj), TYPE_MCF5206_MBAR)
+DECLARE_INSTANCE_CHECKER(m5206_mbar_state, MCF5206_MBAR,
+                         TYPE_MCF5206_MBAR)
 
 /* Interrupt controller.  */
 
diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
index 0d8c0327258..2cc34cc91cf 100644
--- a/hw/mem/sparse-mem.c
+++ b/hw/mem/sparse-mem.c
@@ -21,7 +21,8 @@
 #include "qom/object.h"
 
 typedef struct SparseMemState SparseMemState;
-#define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
+DECLARE_INSTANCE_CHECKER(SparseMemState, SPARSE_MEM,
+                         TYPE_SPARSE_MEM)
 #define SPARSE_BLOCK_SIZE 0x1000
 
 struct SparseMemState {
diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index e4b79e98866..f60273a6e27 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -24,7 +24,8 @@ struct SECUREECState {
 typedef struct SECUREECState SECUREECState;
 
 #define TYPE_SBSA_EC      "sbsa-ec"
-#define SECURE_EC(obj) OBJECT_CHECK(SECUREECState, (obj), TYPE_SBSA_EC)
+DECLARE_INSTANCE_CHECKER(SECUREECState, SECURE_EC,
+                         TYPE_SBSA_EC)
 
 enum sbsa_ec_powerstates {
     SBSA_EC_CMD_POWEROFF = 0x01,
diff --git a/hw/s390x/vhost-user-fs-ccw.c b/hw/s390x/vhost-user-fs-ccw.c
index 254153860dc..5a72a22d48f 100644
--- a/hw/s390x/vhost-user-fs-ccw.c
+++ b/hw/s390x/vhost-user-fs-ccw.c
@@ -21,8 +21,8 @@ struct VHostUserFSCcw {
 typedef struct VHostUserFSCcw VHostUserFSCcw;
 
 #define TYPE_VHOST_USER_FS_CCW "vhost-user-fs-ccw"
-#define VHOST_USER_FS_CCW(obj) \
-        OBJECT_CHECK(VHostUserFSCcw, (obj), TYPE_VHOST_USER_FS_CCW)
+DECLARE_INSTANCE_CHECKER(VHostUserFSCcw, VHOST_USER_FS_CCW,
+                         TYPE_VHOST_USER_FS_CCW)
 
 
 static Property vhost_user_fs_ccw_properties[] = {
diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
index 80365dbd780..a678174b18c 100644
--- a/hw/sensor/adm1272.c
+++ b/hw/sensor/adm1272.c
@@ -20,7 +20,8 @@
 
 #define TYPE_ADM1272 "adm1272"
 typedef struct ADM1272State ADM1272State;
-#define ADM1272(obj) OBJECT_CHECK(ADM1272State, (obj), TYPE_ADM1272)
+DECLARE_INSTANCE_CHECKER(ADM1272State, ADM1272,
+                         TYPE_ADM1272)
 
 #define ADM1272_RESTART_TIME            0xCC
 #define ADM1272_MFR_PEAK_IOUT           0xD0
diff --git a/hw/sensor/max34451.c b/hw/sensor/max34451.c
index 5d50e46b5ba..864f0bfc736 100644
--- a/hw/sensor/max34451.c
+++ b/hw/sensor/max34451.c
@@ -18,7 +18,8 @@
 
 #define TYPE_MAX34451 "max34451"
 typedef struct MAX34451State MAX34451State;
-#define MAX34451(obj) OBJECT_CHECK(MAX34451State, (obj), TYPE_MAX34451)
+DECLARE_INSTANCE_CHECKER(MAX34451State, MAX34451,
+                         TYPE_MAX34451)
 
 #define MAX34451_MFR_MODE               0xD1
 #define MAX34451_MFR_PSEN_CONFIG        0xD2
diff --git a/hw/usb/u2f-emulated.c b/hw/usb/u2f-emulated.c
index 7c092e7a93f..f35865d42dd 100644
--- a/hw/usb/u2f-emulated.c
+++ b/hw/usb/u2f-emulated.c
@@ -99,8 +99,8 @@ struct U2FEmulatedState {
 };
 
 #define TYPE_U2F_EMULATED "u2f-emulated"
-#define EMULATED_U2F_KEY(obj) \
-    OBJECT_CHECK(U2FEmulatedState, (obj), TYPE_U2F_EMULATED)
+DECLARE_INSTANCE_CHECKER(U2FEmulatedState, EMULATED_U2F_KEY,
+                         TYPE_U2F_EMULATED)
 
 static void u2f_emulated_reset(U2FEmulatedState *key)
 {
diff --git a/hw/usb/u2f-passthru.c b/hw/usb/u2f-passthru.c
index 954b8aa3c9b..7daaac19844 100644
--- a/hw/usb/u2f-passthru.c
+++ b/hw/usb/u2f-passthru.c
@@ -77,8 +77,8 @@ struct U2FPassthruState {
 };
 
 #define TYPE_U2F_PASSTHRU "u2f-passthru"
-#define PASSTHRU_U2F_KEY(obj) \
-    OBJECT_CHECK(U2FPassthruState, (obj), TYPE_U2F_PASSTHRU)
+DECLARE_INSTANCE_CHECKER(U2FPassthruState, PASSTHRU_U2F_KEY,
+                         TYPE_U2F_PASSTHRU)
 
 /* Init packet sizes */
 #define PACKET_INIT_HEADER_SIZE 7
-- 
2.31.1


