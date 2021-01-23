Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GNM-0003sh-Gc
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GMT-0003Uc-6X; Sat, 23 Jan 2021 05:41:45 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:56250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GM6-0003GM-WA; Sat, 23 Jan 2021 05:41:44 -0500
Received: by mail-pj1-x102e.google.com with SMTP id j12so5373654pjy.5;
 Sat, 23 Jan 2021 02:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CRMA1MnKqvkEHxIrGAmR2UJfAUJXEXBwFdwyTK+WES4=;
 b=e4k5d/c6deZ3njIB3BjZgDjIRwtCNs6c703I6n5go6PQrNjCyfErxYHuRuKXbK6bNm
 pUJ1/3PaBE/h7D08NtCr2+PGA7BuEKCwEARZw4VOYu+Y6aG2wtuvnTxtWkT5vEbzF6bg
 zLdFl19akAR0/Nbt0Ad5w8gOKxO/LYztiAJjLIQ1XA0HLXNKOQJxkRpL7WU2kSn+ynju
 L7dSiR+8q/BJZZvTBMYNWcKjaO7Sf/vEFrKEfAgLepgWuuZHbCdC3e+lyvbV4A1fRjOe
 NG8aLOUjF3KItr3gew+1W9qBVc/3i4FJ7fnOe5uP0N/jcFTV1vw52cPhX86SHTpgViUM
 vnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRMA1MnKqvkEHxIrGAmR2UJfAUJXEXBwFdwyTK+WES4=;
 b=HyE1vmeB/NjtTZQ9lq9gx2ZF3dlHwjviOs/UhxJa/dj9gnnSMCB7A/HIyNHYAv3QlR
 iTmdQvjQHldJyXBe06jcKfGSDErcMgBK7ncSuGCZmGvz790KyR3I0tI/ih5ROFklk9sr
 98fb3xt7NCkrwW0Djlllhhv6LSWlfCqHjhwPGRcbD4dtknWjd+RG36eP0KeHo0F5DXCD
 CuDs4up/wGitTXvWK8Apxp4s2PTvqlYsC9uvYjUs7d2BgzVZtB/OnxusrlDVKTkQYP/R
 D2VWtyDvuO2lu1rq0Jg3VIzR+TO1U43h0nZauOlXZQ+G7aHTJDZlLr5dxI3JNshTxTNV
 56TA==
X-Gm-Message-State: AOAM5316UMMApcqWvJddQvVcy3F3V11aUyeg8MOcwsYXSuwKkUCOTlCb
 wdBmRuEQe8obSW9/KEOgnTg=
X-Google-Smtp-Source: ABdhPJyMiB5nJXdRXXoKjtSl301IW4Wmk7HkVxCrN2N92mFxrW0O75gYQNIpzaVMsxzsALt2a22HbQ==
X-Received: by 2002:a17:90a:2947:: with SMTP id x7mr22923pjf.157.1611398479078; 
 Sat, 23 Jan 2021 02:41:19 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:41:18 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 21/25] hw/riscv: sifive_u: Add QSPI2 controller and connect
 an SD card
Date: Sat, 23 Jan 2021 18:40:12 +0800
Message-Id: <20210123104016.17485-22-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:59 -0000

From: Bin Meng <bin.meng@windriver.com>

This adds the QSPI2 controller to the SoC, and connects an SD
card to it. The generation of corresponding device tree source
fragment is also added.

Specify machine property `msel` to 11 to boot the same upstream
U-Boot SPL and payload image for the SiFive HiFive Unleashed board.
Note subsequent payload is stored in the SD card image.

$ qemu-system-riscv64 -nographic -M sifive_u,msel=11 -smp 5 -m 8G \
    -bios u-boot-spl.bin -drive file=sdcard.img,if=sd

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- Correct the "connects" typo in the commit message

 include/hw/riscv/sifive_u.h |  3 +++
 hw/riscv/sifive_u.c         | 43 +++++++++++++++++++++++++++++++++++--
 hw/riscv/Kconfig            |  1 +
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 8824b7c031..de1464a2ce 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -47,6 +47,7 @@ typedef struct SiFiveUSoCState {
     SiFiveUOTPState otp;
     SiFivePDMAState dma;
     SiFiveSPIState spi0;
+    SiFiveSPIState spi2;
     CadenceGEMState gem;
 
     uint32_t serial;
@@ -85,6 +86,7 @@ enum {
     SIFIVE_U_DEV_UART1,
     SIFIVE_U_DEV_GPIO,
     SIFIVE_U_DEV_QSPI0,
+    SIFIVE_U_DEV_QSPI2,
     SIFIVE_U_DEV_OTP,
     SIFIVE_U_DEV_DMC,
     SIFIVE_U_DEV_FLASH0,
@@ -99,6 +101,7 @@ enum {
     SIFIVE_U_L2CC_IRQ2 = 3,
     SIFIVE_U_UART0_IRQ = 4,
     SIFIVE_U_UART1_IRQ = 5,
+    SIFIVE_U_QSPI2_IRQ = 6,
     SIFIVE_U_GPIO_IRQ0 = 7,
     SIFIVE_U_GPIO_IRQ1 = 8,
     SIFIVE_U_GPIO_IRQ2 = 9,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 43a0e983d2..6c1158a848 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -16,6 +16,7 @@
  * 6) GEM (Gigabit Ethernet Controller) and management block
  * 7) DMA (Direct Memory Access Controller)
  * 8) SPI0 connected to an SPI flash
+ * 9) SPI2 connected to an SD card
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -77,6 +78,7 @@ static const struct MemmapEntry {
     [SIFIVE_U_DEV_UART0] =    { 0x10010000,     0x1000 },
     [SIFIVE_U_DEV_UART1] =    { 0x10011000,     0x1000 },
     [SIFIVE_U_DEV_QSPI0] =    { 0x10040000,     0x1000 },
+    [SIFIVE_U_DEV_QSPI2] =    { 0x10050000,     0x1000 },
     [SIFIVE_U_DEV_GPIO] =     { 0x10060000,     0x1000 },
     [SIFIVE_U_DEV_OTP] =      { 0x10070000,     0x1000 },
     [SIFIVE_U_DEV_GEM] =      { 0x10090000,     0x2000 },
@@ -345,6 +347,31 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
                             "sifive,fu540-c000-ccache");
     g_free(nodename);
 
+    nodename = g_strdup_printf("/soc/spi@%lx",
+        (long)memmap[SIFIVE_U_DEV_QSPI2].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        prci_phandle, PRCI_CLK_TLCLK);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI2_IRQ);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_DEV_QSPI2].base,
+        0x0, memmap[SIFIVE_U_DEV_QSPI2].size);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/soc/spi@%lx/mmc@0",
+        (long)memmap[SIFIVE_U_DEV_QSPI2].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop(fdt, nodename, "disable-wp", NULL, 0);
+    qemu_fdt_setprop_cells(fdt, nodename, "voltage-ranges", 3300, 3300);
+    qemu_fdt_setprop_cell(fdt, nodename, "spi-max-frequency", 20000000);
+    qemu_fdt_setprop_cell(fdt, nodename, "reg", 0);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "mmc-spi-slot");
+    g_free(nodename);
+
     nodename = g_strdup_printf("/soc/spi@%lx",
         (long)memmap[SIFIVE_U_DEV_QSPI0].base);
     qemu_fdt_add_subnode(fdt, nodename);
@@ -469,8 +496,8 @@ static void sifive_u_machine_init(MachineState *machine)
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     DriveInfo *dinfo;
-    DeviceState *flash_dev;
-    qemu_irq flash_cs;
+    DeviceState *flash_dev, *sd_dev;
+    qemu_irq flash_cs, sd_cs;
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
@@ -616,6 +643,12 @@ static void sifive_u_machine_init(MachineState *machine)
 
     flash_cs = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi0), 1, flash_cs);
+
+    /* Connect an SD card to SPI2 */
+    sd_dev = ssi_create_peripheral(s->soc.spi2.spi, "ssi-sd");
+
+    sd_cs = qdev_get_gpio_in_named(sd_dev, SSI_GPIO_CS, 0);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi2), 1, sd_cs);
 }
 
 static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
@@ -726,6 +759,7 @@ static void sifive_u_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_SIFIVE_GPIO);
     object_initialize_child(obj, "pdma", &s->dma, TYPE_SIFIVE_PDMA);
     object_initialize_child(obj, "spi0", &s->spi0, TYPE_SIFIVE_SPI);
+    object_initialize_child(obj, "spi2", &s->spi2, TYPE_SIFIVE_SPI);
 }
 
 static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
@@ -879,6 +913,11 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
                     memmap[SIFIVE_U_DEV_QSPI0].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi0), 0,
                        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_QSPI0_IRQ));
+    sysbus_realize(SYS_BUS_DEVICE(&s->spi2), errp);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi2), 0,
+                    memmap[SIFIVE_U_DEV_QSPI2].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi2), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_QSPI2_IRQ));
 }
 
 static Property sifive_u_soc_props[] = {
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 6330297b4e..d139074b02 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -57,6 +57,7 @@ config SIFIVE_U
     select SIFIVE_U_OTP
     select SIFIVE_U_PRCI
     select SSI_M25P80
+    select SSI_SD
     select UNIMP
 
 config SPIKE
-- 
2.25.1


