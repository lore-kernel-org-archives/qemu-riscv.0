Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4HPA-0000mE-Mv
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jan 2021 01:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HP9-0000kn-RP; Tue, 26 Jan 2021 01:00:43 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HP7-0001TZ-F7; Tue, 26 Jan 2021 01:00:43 -0500
Received: by mail-pj1-x102f.google.com with SMTP id e9so1609329pjj.0;
 Mon, 25 Jan 2021 22:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HuNWMDHqGG+hRJwi1+cd0oN29gIyiEQDQI3q6sZVeEE=;
 b=lxPYIEws4xphtDjK5U6BxoeHk9Lvh57d2VVehOHpcbgtz+x6+QNvp2DcjpD2BHbCm+
 r8UN+PEzyI45BQeHM1N5ffpNvcA6m5c4So/3XqIC6BiAqig5vSg2un+Z1XHKNEFT0DIf
 YEmR385PUjLhT7TvAxJlihZNTgAOCf733pjtZMUaYy3HYyPpbKNgnlZxfo0AsW/lQg/A
 dqzzfScJCxoDVNA1mAeoJVeD0HPuBpybV0R84xGw/Z8Iu96c5awBmnS3bH8cI1Mx9tCJ
 G0LBMgaGxz+SBAo38zPpKnm9K22o3IdCJUEEnKwz6odfu0kYHubLVBpJJFryuipxW4Aw
 yIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HuNWMDHqGG+hRJwi1+cd0oN29gIyiEQDQI3q6sZVeEE=;
 b=D4uOC9BhCiN9sFgQ/93JC/pKSh6DI1ekeS/DulkLz4utfrXYW6s2NhNbTu54nQztrh
 XeouPfyJ4rUPopgrmSlmEUlbtAxSHcGyKwG2nZI/CXie9NQHLdiJuq6bL0x9cB2iCoA0
 7+HNVKnqy8VRtDtle8cYe57oa1VuQWpZb4pNUzKZ8lsrlR8zvb6g7RlaydT2uIwLmPvD
 JFQXBscVUwX15aE5hM/CPwPXbxaAW7bagEg5C1uaDqt4EAXOhmQCgwMBSgLSZwxqCYn7
 VmZogVVj+tb9smxYYHhw9TJ4R7rP8TNiIsRr0ad2mvTyyXLT+1WGoR7RBQLk7GY10CV9
 +4uw==
X-Gm-Message-State: AOAM532AQiAmmLJGpsIYzLYsIJ9qyZG+NJK82uEOPkXdIZVRbvgHM4YY
 T2A44lQKmSBzJmV5Rg9gsMQ8Ob14GxOVtQ==
X-Google-Smtp-Source: ABdhPJxD04SP49hxcPadcI2Hwu/nHcRdlG1rFoZIUIFQ9TG4eLsAbA/S8E5LTPvH1ET8TIGph6xVNA==
X-Received: by 2002:a17:902:b906:b029:df:ec2e:b49d with SMTP id
 bf6-20020a170902b906b02900dfec2eb49dmr4271368plb.77.1611640839662; 
 Mon, 25 Jan 2021 22:00:39 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id k10sm12471076pfk.0.2021.01.25.22.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 22:00:39 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 4/9] hw/riscv: sifive_u: Add QSPI0 controller and connect a
 flash
Date: Tue, 26 Jan 2021 14:00:02 +0800
Message-Id: <20210126060007.12904-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126060007.12904-1-bmeng.cn@gmail.com>
References: <20210126060007.12904-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 26 Jan 2021 06:00:44 -0000

From: Bin Meng <bin.meng@windriver.com>

This adds the QSPI0 controller to the SoC, and connects an ISSI
25WP256 flash to it. The generation of corresponding device tree
source fragment is also added.

Since the direct memory-mapped mode is not supported by the SiFive
SPI model, the <reg> property does not populate the second group
which represents the memory mapped address of the SPI flash.

With this commit, upstream U-Boot for the SiFive HiFive Unleashed
board can boot on QEMU 'sifive_u' out of the box. This allows users
to develop and test the recommended RISC-V boot flow with a real
world use case: ZSBL (in QEMU) loads U-Boot SPL from SPI flash to
L2LIM, then U-Boot SPL loads the payload from SPI flash that is
combined with OpenSBI fw_dynamic firmware and U-Boot proper.

Specify machine property `msel` to 6 to allow booting from the SPI
flash. U-Boot spl is directly loaded via `-bios`, and subsequent
payload is stored in the SPI flash image. Example command line:

$ qemu-system-riscv64 -nographic -M sifive_u,msel=6 -smp 5 -m 8G \
    -bios u-boot-spl.bin -drive file=spi-nor.img,if=mtd

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v2)

Changes in v2:
- Correct the "connects" typo in the commit message
- Mention in the commit message that <reg> property does not populate
  the second group which represents the memory mapped address of the
  SPI flash

 include/hw/riscv/sifive_u.h |  4 +++
 hw/riscv/sifive_u.c         | 52 +++++++++++++++++++++++++++++++++++++
 hw/riscv/Kconfig            |  2 ++
 3 files changed, 58 insertions(+)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index a9f7b4a084..8824b7c031 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -26,6 +26,7 @@
 #include "hw/gpio/sifive_gpio.h"
 #include "hw/misc/sifive_u_otp.h"
 #include "hw/misc/sifive_u_prci.h"
+#include "hw/ssi/sifive_spi.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -45,6 +46,7 @@ typedef struct SiFiveUSoCState {
     SIFIVEGPIOState gpio;
     SiFiveUOTPState otp;
     SiFivePDMAState dma;
+    SiFiveSPIState spi0;
     CadenceGEMState gem;
 
     uint32_t serial;
@@ -82,6 +84,7 @@ enum {
     SIFIVE_U_DEV_UART0,
     SIFIVE_U_DEV_UART1,
     SIFIVE_U_DEV_GPIO,
+    SIFIVE_U_DEV_QSPI0,
     SIFIVE_U_DEV_OTP,
     SIFIVE_U_DEV_DMC,
     SIFIVE_U_DEV_FLASH0,
@@ -120,6 +123,7 @@ enum {
     SIFIVE_U_PDMA_IRQ5 = 28,
     SIFIVE_U_PDMA_IRQ6 = 29,
     SIFIVE_U_PDMA_IRQ7 = 30,
+    SIFIVE_U_QSPI0_IRQ = 51,
     SIFIVE_U_GEM_IRQ = 0x35
 };
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 59b61cea01..43a0e983d2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -15,6 +15,7 @@
  * 5) OTP (One-Time Programmable) memory with stored serial number
  * 6) GEM (Gigabit Ethernet Controller) and management block
  * 7) DMA (Direct Memory Access Controller)
+ * 8) SPI0 connected to an SPI flash
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -44,6 +45,7 @@
 #include "hw/char/serial.h"
 #include "hw/cpu/cluster.h"
 #include "hw/misc/unimp.h"
+#include "hw/ssi/ssi.h"
 #include "target/riscv/cpu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_u.h"
@@ -74,6 +76,7 @@ static const struct MemmapEntry {
     [SIFIVE_U_DEV_PRCI] =     { 0x10000000,     0x1000 },
     [SIFIVE_U_DEV_UART0] =    { 0x10010000,     0x1000 },
     [SIFIVE_U_DEV_UART1] =    { 0x10011000,     0x1000 },
+    [SIFIVE_U_DEV_QSPI0] =    { 0x10040000,     0x1000 },
     [SIFIVE_U_DEV_GPIO] =     { 0x10060000,     0x1000 },
     [SIFIVE_U_DEV_OTP] =      { 0x10070000,     0x1000 },
     [SIFIVE_U_DEV_GEM] =      { 0x10090000,     0x2000 },
@@ -342,6 +345,32 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
                             "sifive,fu540-c000-ccache");
     g_free(nodename);
 
+    nodename = g_strdup_printf("/soc/spi@%lx",
+        (long)memmap[SIFIVE_U_DEV_QSPI0].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        prci_phandle, PRCI_CLK_TLCLK);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI0_IRQ);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_DEV_QSPI0].base,
+        0x0, memmap[SIFIVE_U_DEV_QSPI0].size);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/soc/spi@%lx/flash@0",
+        (long)memmap[SIFIVE_U_DEV_QSPI0].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "spi-rx-bus-width", 4);
+    qemu_fdt_setprop_cell(fdt, nodename, "spi-tx-bus-width", 4);
+    qemu_fdt_setprop(fdt, nodename, "m25p,fast-read", NULL, 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "spi-max-frequency", 50000000);
+    qemu_fdt_setprop_cell(fdt, nodename, "reg", 0);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "jedec,spi-nor");
+    g_free(nodename);
+
     phy_phandle = phandle++;
     nodename = g_strdup_printf("/soc/ethernet@%lx",
         (long)memmap[SIFIVE_U_DEV_GEM].base);
@@ -439,6 +468,9 @@ static void sifive_u_machine_init(MachineState *machine)
     int i;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
+    DriveInfo *dinfo;
+    DeviceState *flash_dev;
+    qemu_irq flash_cs;
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
@@ -571,6 +603,19 @@ static void sifive_u_machine_init(MachineState *machine)
     riscv_rom_copy_firmware_info(machine, memmap[SIFIVE_U_DEV_MROM].base,
                                  memmap[SIFIVE_U_DEV_MROM].size,
                                  sizeof(reset_vec), kernel_entry);
+
+    /* Connect an SPI flash to SPI0 */
+    flash_dev = qdev_new("is25wp256");
+    dinfo = drive_get_next(IF_MTD);
+    if (dinfo) {
+        qdev_prop_set_drive_err(flash_dev, "drive",
+                                blk_by_legacy_dinfo(dinfo),
+                                &error_fatal);
+    }
+    qdev_realize_and_unref(flash_dev, BUS(s->soc.spi0.spi), &error_fatal);
+
+    flash_cs = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi0), 1, flash_cs);
 }
 
 static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
@@ -680,6 +725,7 @@ static void sifive_u_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gem", &s->gem, TYPE_CADENCE_GEM);
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_SIFIVE_GPIO);
     object_initialize_child(obj, "pdma", &s->dma, TYPE_SIFIVE_PDMA);
+    object_initialize_child(obj, "spi0", &s->spi0, TYPE_SIFIVE_SPI);
 }
 
 static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
@@ -827,6 +873,12 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
 
     create_unimplemented_device("riscv.sifive.u.l2cc",
         memmap[SIFIVE_U_DEV_L2CC].base, memmap[SIFIVE_U_DEV_L2CC].size);
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->spi0), errp);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi0), 0,
+                    memmap[SIFIVE_U_DEV_QSPI0].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi0), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_QSPI0_IRQ));
 }
 
 static Property sifive_u_soc_props[] = {
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index facb0cbacc..6330297b4e 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -52,9 +52,11 @@ config SIFIVE_U
     select SIFIVE_GPIO
     select SIFIVE_PDMA
     select SIFIVE_PLIC
+    select SIFIVE_SPI
     select SIFIVE_UART
     select SIFIVE_U_OTP
     select SIFIVE_U_PRCI
+    select SSI_M25P80
     select UNIMP
 
 config SPIKE
-- 
2.25.1


