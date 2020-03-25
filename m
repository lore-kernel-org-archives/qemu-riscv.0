Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHBYJ-0000L4-Tq
	for mharc-qemu-riscv@gnu.org; Wed, 25 Mar 2020 15:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYE-0000Ad-IV
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:18:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYC-0008Pg-Qa
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:18:54 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33555)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBY1-0008I4-VB; Wed, 25 Mar 2020 15:18:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id a25so4753865wrd.0;
 Wed, 25 Mar 2020 12:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8yPGDXJm798UrCxUOiQor4+AbZXIPYYexJrMJiTmsiE=;
 b=bSZmvO9fA0Rdt86RuTRa8dBQUHPcxfTO63JpNIUBd4hyv8UAkT6Doo9Gk08mZtqOKe
 BKDL+NM7YqGLfiWTPT2QCiIW4lmH0bJbzMVjxhlQl9dhuFPV9jPJdJfIrHrYbtOO9HU1
 8A1IgN+mN71bWrZr/pWWqHghOamKSYtRGu1xYXvK3ljRgojnYFw5R1QL1kRPiNnAN1Y5
 LuzuI11hN+ZehLWTB/VNxGi2Z7aiqBxy3uPuliUKRww+hl3xmRmIjsw4M7Eqzf3XPqac
 8MkyXOXOniQ5aOwCzfWkbPJV41QdQr6TQPqAbJ/4KS20cQLhiRcV8SBHQr+IJ/xRSByT
 5y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8yPGDXJm798UrCxUOiQor4+AbZXIPYYexJrMJiTmsiE=;
 b=FKL5RR7z9v9xidRE6fXvnuHS7CIxo08aHbIAxAO+Lqc4OX0PNpdD6G/gcVVP3kWGzO
 B3aIQIkRbGhmaqx9Byu3e3iWbAVq9UYes5A3U21BdYPgW+ZFxo0XXDxjXfThNWpfzF/r
 qKMpp1lfpFGVZeU2aU/KrHiNH/MFeFHpxbMq3FlzMeb9euRziho9DFoX8oIKYtld7b+z
 tb/vSYdtVFdi1nJQ0OBD5lks/WkmVTXzizcn8KkqDJ6nxHkBRIxbFvILg+rabrycG1Gx
 oaj3VZxO5P827Mpbgo4a7rZGe1R+l35rmxBPKs0761j57GNpQxerhNXagAPztzJpVpiS
 e19w==
X-Gm-Message-State: ANhLgQ2EHQpHgLurNdcbj+HNMpeM+FHImnai/zNEKTeSIsNJljxmcl/5
 N1EkdaJLkv5V74lACqKRxm4QHwo9R6Q=
X-Google-Smtp-Source: ADFU+vtAu7HeBAYn0I/Cm9qvdFP0POqkVUjTEcWbYZSOUHxoH44ZMoaQW9V0rLALgtIGdbYJJl2X3g==
X-Received: by 2002:adf:8187:: with SMTP id 7mr5272025wra.358.1585163920496;
 Wed, 25 Mar 2020 12:18:40 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r17sm6345672wrx.46.2020.03.25.12.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 12:18:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.0 02/12] hw/arm/bcm2835_peripherals: Add missing
 error-propagation code
Date: Wed, 25 Mar 2020 20:18:20 +0100
Message-Id: <20200325191830.16553-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200325191830.16553-1-f4bug@amsat.org>
References: <20200325191830.16553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
X-List-Received-Date: Wed, 25 Mar 2020 19:18:56 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/object_property_missing_error_propagate.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index edcaa4916d..a111e91069 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -133,254 +133,262 @@ static void bcm2835_peripherals_init(Object *obj)
 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
 {
     BCM2835PeripheralState *s = BCM2835_PERIPHERALS(dev);
     Object *obj;
     MemoryRegion *ram;
     Error *err = NULL;
     uint64_t ram_size, vcram_size;
     int n;
 
     obj = object_property_get_link(OBJECT(dev), "ram", &err);
     if (obj == NULL) {
         error_setg(errp, "%s: required ram link not found: %s",
                    __func__, error_get_pretty(err));
         return;
     }
 
     ram = MEMORY_REGION(obj);
     ram_size = memory_region_size(ram);
 
     /* Map peripherals and RAM into the GPU address space. */
     memory_region_init_alias(&s->peri_mr_alias, OBJECT(s),
                              "bcm2835-peripherals", &s->peri_mr, 0,
                              memory_region_size(&s->peri_mr));
 
     memory_region_add_subregion_overlap(&s->gpu_bus_mr, BCM2835_VC_PERI_BASE,
                                         &s->peri_mr_alias, 1);
 
     /* RAM is aliased four times (different cache configurations) on the GPU */
     for (n = 0; n < 4; n++) {
         memory_region_init_alias(&s->ram_alias[n], OBJECT(s),
                                  "bcm2835-gpu-ram-alias[*]", ram, 0, ram_size);
         memory_region_add_subregion_overlap(&s->gpu_bus_mr, (hwaddr)n << 30,
                                             &s->ram_alias[n], 0);
     }
 
     /* Interrupt Controller */
     object_property_set_bool(OBJECT(&s->ic), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->peri_mr, ARMCTRL_IC_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ic), 0));
     sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
 
     /* Sys Timer */
     object_property_set_bool(OBJECT(&s->systmr), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
                                INTERRUPT_ARM_TIMER));
 
     /* UART0 */
     qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
     object_property_set_bool(OBJECT(&s->uart0), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->peri_mr, UART0_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart0), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart0), 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_UART0));
 
     /* AUX / UART1 */
     qdev_prop_set_chr(DEVICE(&s->aux), "chardev", serial_hd(1));
 
     object_property_set_bool(OBJECT(&s->aux), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->peri_mr, AUX_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->aux), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->aux), 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_AUX));
 
     /* Mailboxes */
     object_property_set_bool(OBJECT(&s->mboxes), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->peri_mr, ARMCTRL_0_SBM_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mboxes), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->mboxes), 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
                                INTERRUPT_ARM_MAILBOX));
 
     /* Framebuffer */
     vcram_size = object_property_get_uint(OBJECT(s), "vcram-size", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     object_property_set_uint(OBJECT(&s->fb), ram_size - vcram_size,
                              "vcram-base", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     object_property_set_bool(OBJECT(&s->fb), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->mbox_mr, MBOX_CHAN_FB << MBOX_AS_CHAN_SHIFT,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->fb), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fb), 0,
                        qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_FB));
 
     /* Property channel */
     object_property_set_bool(OBJECT(&s->property), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->mbox_mr,
                 MBOX_CHAN_PROPERTY << MBOX_AS_CHAN_SHIFT,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->property), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->property), 0,
                       qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_PROPERTY));
 
     /* Random Number Generator */
     object_property_set_bool(OBJECT(&s->rng), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
 
     /* Extended Mass Media Controller
      *
      * Compatible with:
      * - SD Host Controller Specification Version 3.0 Draft 1.0
      * - SDIO Specification Version 3.0
      * - MMC Specification Version 4.4
      *
      * For the exact details please refer to the Arasan documentation:
      *   SD3.0_Host_AHB_eMMC4.4_Usersguide_ver5.9_jan11_10.pdf
      */
     object_property_set_uint(OBJECT(&s->sdhci), 3, "sd-spec-version", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_uint(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
                              &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
                              &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     object_property_set_bool(OBJECT(&s->sdhci), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->peri_mr, EMMC1_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhci), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_ARASANSDIO));
 
     /* SDHOST */
     object_property_set_bool(OBJECT(&s->sdhost), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->peri_mr, MMCI0_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhost), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhost), 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_SDIO));
 
     /* DMA Channels */
     object_property_set_bool(OBJECT(&s->dma), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->peri_mr, DMA_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 0));
     memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
 
     for (n = 0; n <= 12; n++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
                            qdev_get_gpio_in_named(DEVICE(&s->ic),
                                                   BCM2835_IC_GPU_IRQ,
                                                   INTERRUPT_DMA0 + n));
     }
 
     /* THERMAL */
     object_property_set_bool(OBJECT(&s->thermal), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     memory_region_add_subregion(&s->peri_mr, THERMAL_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->thermal), 0));
 
     /* GPIO */
     object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     memory_region_add_subregion(&s->peri_mr, GPIO_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
 
     object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus",
                               &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
     create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
     create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
     create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
     create_unimp(s, &s->spi[0], "bcm2835-spi0", SPI0_OFFSET, 0x20);
     create_unimp(s, &s->bscsl, "bcm2835-spis", BSC_SL_OFFSET, 0x100);
     create_unimp(s, &s->i2c[0], "bcm2835-i2c0", BSC0_OFFSET, 0x20);
     create_unimp(s, &s->i2c[1], "bcm2835-i2c1", BSC1_OFFSET, 0x20);
     create_unimp(s, &s->i2c[2], "bcm2835-i2c2", BSC2_OFFSET, 0x20);
     create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
     create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
     create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
     create_unimp(s, &s->dwc2, "dwc-usb2", USB_OTG_OFFSET, 0x1000);
     create_unimp(s, &s->sdramc, "bcm2835-sdramc", SDRAMC_OFFSET, 0x100);
 }
-- 
2.21.1


