Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHBYc-0000yT-Au
	for mharc-qemu-riscv@gnu.org; Wed, 25 Mar 2020 15:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYS-0000c2-EN
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:19:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYP-00008F-P0
 for qemu-riscv@nongnu.org; Wed, 25 Mar 2020 15:19:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45164)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBY5-0008KB-6S; Wed, 25 Mar 2020 15:18:45 -0400
Received: by mail-wr1-x434.google.com with SMTP id t7so4630603wrw.12;
 Wed, 25 Mar 2020 12:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4kiIC5lo8LMjfx4QypRFj4ZCNBWHZLJD1nJLY4etCk=;
 b=TD7KDGHiYFucyDcZtSGToWPcXlYdOxCQkTM5UAaZVovKtIeNVhLD71H6npGGveTmnO
 psJZv6RxBIHhwYmFqFY4C/Br9KDk/hVjXb0hVOZ8Osu6vcL0iLuOfoWKVvzALvvxJPhT
 rtt0Gw80WBVZO9wzlqSxxv0xGKEuxUbqvy4DxahHYDH7oSCQC62SqaGIhCirGKRJk823
 mHPCdcIzk+0axYW/oJoUFwRcriAocdK7/6ZUpfDUeYlA3hnAdQieNuMHFLY4L+lFrAmt
 4Z9jl/9STFWilAJqPnVqyhfsSldjEi1MaiRIDZqQrhbPHwDdKE80uM2GZWEhQuMq6Gmn
 zNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b4kiIC5lo8LMjfx4QypRFj4ZCNBWHZLJD1nJLY4etCk=;
 b=t5iyXE0Gh1w7mPzL5MHz0BtZhot0ppqsxKVKw5fp6T7StlB42yChT67CtxVp+k+Xjy
 zzfUJsvUujqhy5Tfaxu5r2B/hbBVG1qaY9Yi+z+22UuxmYgFYO3nzBqnKVrd0vtC9yp2
 IYOwdYzIDczi5NsG4346YDykYSF0+PWIvBK46CDCS8Sx4R13OtWiF1cGE/vsTpgA4AFv
 AFxtUOLT32YkvNfBEoKTYZc6oFjbNEo14f+2wl+MKXHpL9llTHOppq3xuMYKZzenHXkW
 zgy8v7cUMzCsB1dKXanrVxXWGTJ+1n69Nrf8TuZ7/9m9jzElh6rxXXU8IkXrwCsvsLnJ
 /Q/w==
X-Gm-Message-State: ANhLgQ3h+Hjut5RQX5526xJOw9jOu4fywKVHyFbjFWZrfRjsahzSrGBI
 HYT8j+QG1M2x7FVFaKMn5Q7T5+pnN9M=
X-Google-Smtp-Source: ADFU+vvS9l7lL621rMyd+mf9dmm+wXaQIqCWSXopgfZ69s7e6jWDkc90efzS343tz4B5iXBQvdnnXQ==
X-Received: by 2002:a5d:4cc5:: with SMTP id c5mr4812027wrt.136.1585163923354; 
 Wed, 25 Mar 2020 12:18:43 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r17sm6345672wrx.46.2020.03.25.12.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 12:18:42 -0700 (PDT)
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
Subject: [PATCH-for-5.0 03/12] hw/arm/fsl-imx: Add missing error-propagation
 code
Date: Wed, 25 Mar 2020 20:18:21 +0100
Message-Id: <20200325191830.16553-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200325191830.16553-1-f4bug@amsat.org>
References: <20200325191830.16553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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
X-List-Received-Date: Wed, 25 Mar 2020 19:19:17 -0000

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/object_property_missing_error_propagate.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx25.c | 8 ++++++++
 hw/arm/fsl-imx6.c  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 6f1a82ce3d..c915a2106d 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -92,247 +92,255 @@ static void fsl_imx25_init(Object *obj)
 static void fsl_imx25_realize(DeviceState *dev, Error **errp)
 {
     FslIMX25State *s = FSL_IMX25(dev);
     uint8_t i;
     Error *err = NULL;
 
     object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     object_property_set_bool(OBJECT(&s->avic), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->avic), 0, FSL_IMX25_AVIC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->avic), 0,
                        qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->avic), 1,
                        qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
 
     object_property_set_bool(OBJECT(&s->ccm), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccm), 0, FSL_IMX25_CCM_ADDR);
 
     /* Initialize all UARTs */
     for (i = 0; i < FSL_IMX25_NUM_UARTS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } serial_table[FSL_IMX25_NUM_UARTS] = {
             { FSL_IMX25_UART1_ADDR, FSL_IMX25_UART1_IRQ },
             { FSL_IMX25_UART2_ADDR, FSL_IMX25_UART2_IRQ },
             { FSL_IMX25_UART3_ADDR, FSL_IMX25_UART3_IRQ },
             { FSL_IMX25_UART4_ADDR, FSL_IMX25_UART4_IRQ },
             { FSL_IMX25_UART5_ADDR, FSL_IMX25_UART5_IRQ }
         };
 
         qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", serial_hd(i));
 
         object_property_set_bool(OBJECT(&s->uart[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart[i]), 0, serial_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->avic),
                                             serial_table[i].irq));
     }
 
     /* Initialize all GPT timers */
     for (i = 0; i < FSL_IMX25_NUM_GPTS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } gpt_table[FSL_IMX25_NUM_GPTS] = {
             { FSL_IMX25_GPT1_ADDR, FSL_IMX25_GPT1_IRQ },
             { FSL_IMX25_GPT2_ADDR, FSL_IMX25_GPT2_IRQ },
             { FSL_IMX25_GPT3_ADDR, FSL_IMX25_GPT3_IRQ },
             { FSL_IMX25_GPT4_ADDR, FSL_IMX25_GPT4_IRQ }
         };
 
         s->gpt[i].ccm = IMX_CCM(&s->ccm);
 
         object_property_set_bool(OBJECT(&s->gpt[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt[i]), 0, gpt_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->avic),
                                             gpt_table[i].irq));
     }
 
     /* Initialize all EPIT timers */
     for (i = 0; i < FSL_IMX25_NUM_EPITS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } epit_table[FSL_IMX25_NUM_EPITS] = {
             { FSL_IMX25_EPIT1_ADDR, FSL_IMX25_EPIT1_IRQ },
             { FSL_IMX25_EPIT2_ADDR, FSL_IMX25_EPIT2_IRQ }
         };
 
         s->epit[i].ccm = IMX_CCM(&s->ccm);
 
         object_property_set_bool(OBJECT(&s->epit[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->epit[i]), 0, epit_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->epit[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->avic),
                                             epit_table[i].irq));
     }
 
     qdev_set_nic_properties(DEVICE(&s->fec), &nd_table[0]);
 
     object_property_set_bool(OBJECT(&s->fec), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->fec), 0, FSL_IMX25_FEC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fec), 0,
                        qdev_get_gpio_in(DEVICE(&s->avic), FSL_IMX25_FEC_IRQ));
 
     object_property_set_bool(OBJECT(&s->rngc), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->rngc), 0, FSL_IMX25_RNGC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rngc), 0,
                        qdev_get_gpio_in(DEVICE(&s->avic), FSL_IMX25_RNGC_IRQ));
 
     /* Initialize all I2C */
     for (i = 0; i < FSL_IMX25_NUM_I2CS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } i2c_table[FSL_IMX25_NUM_I2CS] = {
             { FSL_IMX25_I2C1_ADDR, FSL_IMX25_I2C1_IRQ },
             { FSL_IMX25_I2C2_ADDR, FSL_IMX25_I2C2_IRQ },
             { FSL_IMX25_I2C3_ADDR, FSL_IMX25_I2C3_IRQ }
         };
 
         object_property_set_bool(OBJECT(&s->i2c[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c[i]), 0, i2c_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->avic),
                                             i2c_table[i].irq));
     }
 
     /* Initialize all GPIOs */
     for (i = 0; i < FSL_IMX25_NUM_GPIOS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } gpio_table[FSL_IMX25_NUM_GPIOS] = {
             { FSL_IMX25_GPIO1_ADDR, FSL_IMX25_GPIO1_IRQ },
             { FSL_IMX25_GPIO2_ADDR, FSL_IMX25_GPIO2_IRQ },
             { FSL_IMX25_GPIO3_ADDR, FSL_IMX25_GPIO3_IRQ },
             { FSL_IMX25_GPIO4_ADDR, FSL_IMX25_GPIO4_IRQ }
         };
 
         object_property_set_bool(OBJECT(&s->gpio[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0, gpio_table[i].addr);
         /* Connect GPIO IRQ to PIC */
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->avic),
                                             gpio_table[i].irq));
     }
 
     /* Initialize all SDHC */
     for (i = 0; i < FSL_IMX25_NUM_ESDHCS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } esdhc_table[FSL_IMX25_NUM_ESDHCS] = {
             { FSL_IMX25_ESDHC1_ADDR, FSL_IMX25_ESDHC1_IRQ },
             { FSL_IMX25_ESDHC2_ADDR, FSL_IMX25_ESDHC2_IRQ },
         };
 
         object_property_set_uint(OBJECT(&s->esdhc[i]), 2, "sd-spec-version",
                                  &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_uint(OBJECT(&s->esdhc[i]), IMX25_ESDHC_CAPABILITIES,
                                  "capareg", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->esdhc[i]), 0, esdhc_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->esdhc[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->avic),
                                             esdhc_table[i].irq));
     }
 
     /* USB */
     for (i = 0; i < FSL_IMX25_NUM_USBS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } usb_table[FSL_IMX25_NUM_USBS] = {
             { FSL_IMX25_USB1_ADDR, FSL_IMX25_USB1_IRQ },
             { FSL_IMX25_USB2_ADDR, FSL_IMX25_USB2_IRQ },
         };
 
         object_property_set_bool(OBJECT(&s->usb[i]), true, "realized",
                                  &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0, usb_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->avic),
                                             usb_table[i].irq));
     }
 
     /* initialize 2 x 16 KB ROM */
     memory_region_init_rom(&s->rom[0], OBJECT(dev), "imx25.rom0",
                            FSL_IMX25_ROM0_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_ROM0_ADDR,
                                 &s->rom[0]);
     memory_region_init_rom(&s->rom[1], OBJECT(dev), "imx25.rom1",
                            FSL_IMX25_ROM1_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_ROM1_ADDR,
                                 &s->rom[1]);
 
     /* initialize internal RAM (128 KB) */
     memory_region_init_ram(&s->iram, NULL, "imx25.iram", FSL_IMX25_IRAM_SIZE,
                            &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_IRAM_ADDR,
                                 &s->iram);
 
     /* internal RAM (128 KB) is aliased over 128 MB - 128 KB */
     memory_region_init_alias(&s->iram_alias, OBJECT(dev), "imx25.iram_alias",
                              &s->iram, 0, FSL_IMX25_IRAM_ALIAS_SIZE);
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_IRAM_ALIAS_ADDR,
                                 &s->iram_alias);
 }
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 13f1bf23a6..71b2729298 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -116,363 +116,371 @@ static void fsl_imx6_init(Object *obj)
 static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX6State *s = FSL_IMX6(dev);
     uint16_t i;
     Error *err = NULL;
     unsigned int smp_cpus = ms->smp.cpus;
 
     if (smp_cpus > FSL_IMX6_NUM_CPUS) {
         error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
                    TYPE_FSL_IMX6, FSL_IMX6_NUM_CPUS, smp_cpus);
         return;
     }
 
     for (i = 0; i < smp_cpus; i++) {
 
         /* On uniprocessor, the CBAR is set to 0 */
         if (smp_cpus > 1) {
             object_property_set_int(OBJECT(&s->cpu[i]), FSL_IMX6_A9MPCORE_ADDR,
                                     "reset-cbar", &error_abort);
         }
 
         /* All CPU but CPU 0 start in power off mode */
         if (i) {
             object_property_set_bool(OBJECT(&s->cpu[i]), true,
                                      "start-powered-off", &error_abort);
         }
 
         object_property_set_bool(OBJECT(&s->cpu[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
     }
 
     object_property_set_int(OBJECT(&s->a9mpcore), smp_cpus, "num-cpu",
                             &error_abort);
 
     object_property_set_int(OBJECT(&s->a9mpcore),
                             FSL_IMX6_MAX_IRQ + GIC_INTERNAL, "num-irq",
                             &error_abort);
 
     object_property_set_bool(OBJECT(&s->a9mpcore), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a9mpcore), 0, FSL_IMX6_A9MPCORE_ADDR);
 
     for (i = 0; i < smp_cpus; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i,
                            qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_IRQ));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i + smp_cpus,
                            qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_FIQ));
     }
 
     object_property_set_bool(OBJECT(&s->ccm), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccm), 0, FSL_IMX6_CCM_ADDR);
 
     object_property_set_bool(OBJECT(&s->src), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->src), 0, FSL_IMX6_SRC_ADDR);
 
     /* Initialize all UARTs */
     for (i = 0; i < FSL_IMX6_NUM_UARTS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } serial_table[FSL_IMX6_NUM_UARTS] = {
             { FSL_IMX6_UART1_ADDR, FSL_IMX6_UART1_IRQ },
             { FSL_IMX6_UART2_ADDR, FSL_IMX6_UART2_IRQ },
             { FSL_IMX6_UART3_ADDR, FSL_IMX6_UART3_IRQ },
             { FSL_IMX6_UART4_ADDR, FSL_IMX6_UART4_IRQ },
             { FSL_IMX6_UART5_ADDR, FSL_IMX6_UART5_IRQ },
         };
 
         qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", serial_hd(i));
 
         object_property_set_bool(OBJECT(&s->uart[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart[i]), 0, serial_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             serial_table[i].irq));
     }
 
     s->gpt.ccm = IMX_CCM(&s->ccm);
 
     object_property_set_bool(OBJECT(&s->gpt), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
 
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt), 0, FSL_IMX6_GPT_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt), 0,
                        qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                         FSL_IMX6_GPT_IRQ));
 
     /* Initialize all EPIT timers */
     for (i = 0; i < FSL_IMX6_NUM_EPITS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } epit_table[FSL_IMX6_NUM_EPITS] = {
             { FSL_IMX6_EPIT1_ADDR, FSL_IMX6_EPIT1_IRQ },
             { FSL_IMX6_EPIT2_ADDR, FSL_IMX6_EPIT2_IRQ },
         };
 
         s->epit[i].ccm = IMX_CCM(&s->ccm);
 
         object_property_set_bool(OBJECT(&s->epit[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->epit[i]), 0, epit_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->epit[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             epit_table[i].irq));
     }
 
     /* Initialize all I2C */
     for (i = 0; i < FSL_IMX6_NUM_I2CS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } i2c_table[FSL_IMX6_NUM_I2CS] = {
             { FSL_IMX6_I2C1_ADDR, FSL_IMX6_I2C1_IRQ },
             { FSL_IMX6_I2C2_ADDR, FSL_IMX6_I2C2_IRQ },
             { FSL_IMX6_I2C3_ADDR, FSL_IMX6_I2C3_IRQ }
         };
 
         object_property_set_bool(OBJECT(&s->i2c[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c[i]), 0, i2c_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             i2c_table[i].irq));
     }
 
     /* Initialize all GPIOs */
     for (i = 0; i < FSL_IMX6_NUM_GPIOS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq_low;
             unsigned int irq_high;
         } gpio_table[FSL_IMX6_NUM_GPIOS] = {
             {
                 FSL_IMX6_GPIO1_ADDR,
                 FSL_IMX6_GPIO1_LOW_IRQ,
                 FSL_IMX6_GPIO1_HIGH_IRQ
             },
             {
                 FSL_IMX6_GPIO2_ADDR,
                 FSL_IMX6_GPIO2_LOW_IRQ,
                 FSL_IMX6_GPIO2_HIGH_IRQ
             },
             {
                 FSL_IMX6_GPIO3_ADDR,
                 FSL_IMX6_GPIO3_LOW_IRQ,
                 FSL_IMX6_GPIO3_HIGH_IRQ
             },
             {
                 FSL_IMX6_GPIO4_ADDR,
                 FSL_IMX6_GPIO4_LOW_IRQ,
                 FSL_IMX6_GPIO4_HIGH_IRQ
             },
             {
                 FSL_IMX6_GPIO5_ADDR,
                 FSL_IMX6_GPIO5_LOW_IRQ,
                 FSL_IMX6_GPIO5_HIGH_IRQ
             },
             {
                 FSL_IMX6_GPIO6_ADDR,
                 FSL_IMX6_GPIO6_LOW_IRQ,
                 FSL_IMX6_GPIO6_HIGH_IRQ
             },
             {
                 FSL_IMX6_GPIO7_ADDR,
                 FSL_IMX6_GPIO7_LOW_IRQ,
                 FSL_IMX6_GPIO7_HIGH_IRQ
             },
         };
 
         object_property_set_bool(OBJECT(&s->gpio[i]), true, "has-edge-sel",
                                  &error_abort);
         object_property_set_bool(OBJECT(&s->gpio[i]), true, "has-upper-pin-irq",
                                  &error_abort);
         object_property_set_bool(OBJECT(&s->gpio[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0, gpio_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             gpio_table[i].irq_low));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 1,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             gpio_table[i].irq_high));
     }
 
     /* Initialize all SDHC */
     for (i = 0; i < FSL_IMX6_NUM_ESDHCS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } esdhc_table[FSL_IMX6_NUM_ESDHCS] = {
             { FSL_IMX6_uSDHC1_ADDR, FSL_IMX6_uSDHC1_IRQ },
             { FSL_IMX6_uSDHC2_ADDR, FSL_IMX6_uSDHC2_IRQ },
             { FSL_IMX6_uSDHC3_ADDR, FSL_IMX6_uSDHC3_IRQ },
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
 
         /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
         object_property_set_uint(OBJECT(&s->esdhc[i]), 3, "sd-spec-version",
                                  &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_uint(OBJECT(&s->esdhc[i]), IMX6_ESDHC_CAPABILITIES,
                                  "capareg", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->esdhc[i]), 0, esdhc_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->esdhc[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             esdhc_table[i].irq));
     }
 
     /* USB */
     for (i = 0; i < FSL_IMX6_NUM_USB_PHYS; i++) {
         object_property_set_bool(OBJECT(&s->usbphy[i]), true, "realized",
                                  &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usbphy[i]), 0,
                         FSL_IMX6_USBPHY1_ADDR + i * 0x1000);
     }
     for (i = 0; i < FSL_IMX6_NUM_USBS; i++) {
         static const int FSL_IMX6_USBn_IRQ[] = {
             FSL_IMX6_USB_OTG_IRQ,
             FSL_IMX6_USB_HOST1_IRQ,
             FSL_IMX6_USB_HOST2_IRQ,
             FSL_IMX6_USB_HOST3_IRQ,
         };
 
         object_property_set_bool(OBJECT(&s->usb[i]), true, "realized",
                                  &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
                         FSL_IMX6_USBOH3_USB_ADDR + i * 0x200);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             FSL_IMX6_USBn_IRQ[i]));
     }
 
     /* Initialize all ECSPI */
     for (i = 0; i < FSL_IMX6_NUM_ECSPIS; i++) {
         static const struct {
             hwaddr addr;
             unsigned int irq;
         } spi_table[FSL_IMX6_NUM_ECSPIS] = {
             { FSL_IMX6_eCSPI1_ADDR, FSL_IMX6_ECSPI1_IRQ },
             { FSL_IMX6_eCSPI2_ADDR, FSL_IMX6_ECSPI2_IRQ },
             { FSL_IMX6_eCSPI3_ADDR, FSL_IMX6_ECSPI3_IRQ },
             { FSL_IMX6_eCSPI4_ADDR, FSL_IMX6_ECSPI4_IRQ },
             { FSL_IMX6_eCSPI5_ADDR, FSL_IMX6_ECSPI5_IRQ },
         };
 
         /* Initialize the SPI */
         object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                             spi_table[i].irq));
     }
 
     qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
     object_property_set_bool(OBJECT(&s->eth), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth), 0, FSL_IMX6_ENET_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth), 0,
                        qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                         FSL_IMX6_ENET_MAC_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth), 1,
                        qdev_get_gpio_in(DEVICE(&s->a9mpcore),
                                         FSL_IMX6_ENET_MAC_1588_IRQ));
 
     /*
      * Watchdog
      */
     for (i = 0; i < FSL_IMX6_NUM_WDTS; i++) {
         static const hwaddr FSL_IMX6_WDOGn_ADDR[FSL_IMX6_NUM_WDTS] = {
             FSL_IMX6_WDOG1_ADDR,
             FSL_IMX6_WDOG2_ADDR,
         };
 
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized",
                                  &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0, FSL_IMX6_WDOGn_ADDR[i]);
     }
 
     /* ROM memory */
     memory_region_init_rom(&s->rom, OBJECT(dev), "imx6.rom",
                            FSL_IMX6_ROM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_ROM_ADDR,
                                 &s->rom);
 
     /* CAAM memory */
     memory_region_init_rom(&s->caam, OBJECT(dev), "imx6.caam",
                            FSL_IMX6_CAAM_MEM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_CAAM_MEM_ADDR,
                                 &s->caam);
 
     /* OCRAM memory */
     memory_region_init_ram(&s->ocram, NULL, "imx6.ocram", FSL_IMX6_OCRAM_SIZE,
                            &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_OCRAM_ADDR,
                                 &s->ocram);
 
     /* internal OCRAM (256 KB) is aliased over 1 MB */
     memory_region_init_alias(&s->ocram_alias, OBJECT(dev), "imx6.ocram_alias",
                              &s->ocram, 0, FSL_IMX6_OCRAM_ALIAS_SIZE);
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_OCRAM_ALIAS_ADDR,
                                 &s->ocram_alias);
 }
-- 
2.21.1


