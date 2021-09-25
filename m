Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mU7pB-0005mm-5p
	for mharc-qemu-riscv@gnu.org; Sat, 25 Sep 2021 09:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU7p0-0005hw-Td; Sat, 25 Sep 2021 09:34:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU7ow-0000La-D0; Sat, 25 Sep 2021 09:34:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d21so35947964wra.12;
 Sat, 25 Sep 2021 06:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b6QGRmQhDU8FF6ADnmxpod9FuARIY1Cf+w68oJokGzU=;
 b=U8OUkDUoE0kk8CcZBG64X0T8EdwalePjeZBqA8qwTGZJfjlRiGp5i51DzJ5dbgu5Da
 9lNhph7Qfoapq2leTUZOMrneGDyvHGtlLSQrTLI6oGvBcBVX9w1e2yGTlR4ftVc8BLDY
 dtW1iCmYQzQgYplKqAmUVJphH7CH5jtfXHv5OG11Nh4Eide/J3h9SMEHfWJgh7gqIAAu
 SD7uAQ+NRKPFBqiE0inO26v2KzM4CqgJIfD0VdFH/rrCdI1d02asQ5xYyQwFsALexiOM
 1e8UER2nps77Hdxksnd6LTHOtZUz/Ds6JfYWBDSrrRac3Tg+Af9l4V0fsldZTf2fyo68
 s1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b6QGRmQhDU8FF6ADnmxpod9FuARIY1Cf+w68oJokGzU=;
 b=x5AHAsJqOfpvyNmfgrHSseAl4cJsV4GLVt1YaGL/928KIbVRQ0RIPN+r43JNxsjh2N
 Tcpm3m1G8QScs/MSUG9qtt5bhsSgl+Nof5mCapFPjlGYHM7VClZ4pIHN0H4sLjhWdwXW
 JZeXWwFT6krM68aqFc2z4JxrJLC3VyPPfX3WdTdhhqKmj5t2gyfDD0qD81/3Q++CKFpX
 wM+8zXRXkw0tiP+Hbaz0JZ7m+fUjva5PUXFimvqNffERHatQed1UqtPZ32Bam4dNXXkd
 hR/Xr9Qt8P0Y673mAB4r4eOkM8KApyNzUAQnMU2FPR8tDNWO9JfcnMDbvsouLqRNR9VH
 WUgA==
X-Gm-Message-State: AOAM530eiObpmA7HI2ni5pCV+Y/ktpYeGyicrWeSx0A8etgDrOruDm2n
 Pl6u/fE2kPwURYdYdxwQeBW0WDv1FtM=
X-Google-Smtp-Source: ABdhPJwJeaZexEvLD2HsCaeHLXuER5kn+kLWsDGQ524v6mdF7Fsg0LaEX/usXU3qaLzxxX17jkv+IQ==
X-Received: by 2002:adf:ecd2:: with SMTP id s18mr16941594wro.99.1632576864520; 
 Sat, 25 Sep 2021 06:34:24 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o12sm10847045wms.15.2021.09.25.06.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 06:34:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair23@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/3] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
Date: Sat, 25 Sep 2021 15:34:07 +0200
Message-Id: <20210925133407.1259392-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925133407.1259392-1-f4bug@amsat.org>
References: <20210925133407.1259392-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 25 Sep 2021 13:34:32 -0000

- Embed SerialMM in MchpPfSoCMMUartState and QOM-initialize it
- Alias SERIAL_MM 'chardev' property on MCHP_PFSOC_UART
- Forward SerialMM sysbus IRQ in mchp_pfsoc_mmuart_realize()
- Add DeviceReset() method
- Add vmstate structure for migration
- Register device in 'input' category
- Keep mchp_pfsoc_mmuart_create() behavior

Note, serial_mm_init() calls qdev_set_legacy_instance_id().
This call is only needed for backwards-compatibility of incoming
migration data with old versions of QEMU which implemented migration
of devices with hand-rolled code. Since this device didn't previously
handle migration at all, then it doesn't need to set the legacy
instance ID.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Peter Maydell <peter.maydell@linaro.org>

I haven't kept Alistair R-b tag from v1.
---
 include/hw/char/mchp_pfsoc_mmuart.h |  12 +++-
 hw/char/mchp_pfsoc_mmuart.c         | 105 +++++++++++++++++++++++-----
 2 files changed, 97 insertions(+), 20 deletions(-)

diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_pfsoc_mmuart.h
index 864ac1a36b5..b0e14ca3554 100644
--- a/include/hw/char/mchp_pfsoc_mmuart.h
+++ b/include/hw/char/mchp_pfsoc_mmuart.h
@@ -28,17 +28,23 @@
 #ifndef HW_MCHP_PFSOC_MMUART_H
 #define HW_MCHP_PFSOC_MMUART_H
 
+#include "hw/sysbus.h"
 #include "hw/char/serial.h"
 
 #define MCHP_PFSOC_MMUART_REG_COUNT 13
 
+#define TYPE_MCHP_PFSOC_UART "mchp.pfsoc.uart"
+OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCMMUartState, MCHP_PFSOC_UART)
+
 typedef struct MchpPfSoCMMUartState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
     MemoryRegion container;
     MemoryRegion iomem;
-    hwaddr base;
-    qemu_irq irq;
 
-    SerialMM *serial;
+    SerialMM serial_mm;
 
     uint32_t reg[MCHP_PFSOC_MMUART_REG_COUNT];
 } MchpPfSoCMMUartState;
diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
index ea586559761..22f3e78eb9e 100644
--- a/hw/char/mchp_pfsoc_mmuart.c
+++ b/hw/char/mchp_pfsoc_mmuart.c
@@ -22,8 +22,10 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "chardev/char.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
 #include "hw/char/mchp_pfsoc_mmuart.h"
+#include "hw/qdev-properties.h"
 
 #define REGS_OFFSET 0x20
 
@@ -67,26 +69,95 @@ static const MemoryRegionOps mchp_pfsoc_mmuart_ops = {
     },
 };
 
-MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
-    hwaddr base, qemu_irq irq, Chardev *chr)
+static void mchp_pfsoc_mmuart_reset(DeviceState *dev)
 {
-    MchpPfSoCMMUartState *s;
+    MchpPfSoCMMUartState *s = MCHP_PFSOC_UART(dev);
 
-    s = g_new0(MchpPfSoCMMUartState, 1);
+    memset(s->reg, 0, sizeof(s->reg));
+    device_cold_reset(DEVICE(&s->serial_mm));
+}
 
-    memory_region_init(&s->container, NULL, "mchp.pfsoc.mmuart", 0x1000);
+static void mchp_pfsoc_mmuart_init(Object *obj)
+{
+    MchpPfSoCMMUartState *s = MCHP_PFSOC_UART(obj);
 
-    memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
+    object_initialize_child(obj, "serial-mm", &s->serial_mm, TYPE_SERIAL_MM);
+    object_property_add_alias(obj, "chardev", OBJECT(&s->serial_mm), "chardev");
+}
+
+static void mchp_pfsoc_mmuart_realize(DeviceState *dev, Error **errp)
+{
+    MchpPfSoCMMUartState *s = MCHP_PFSOC_UART(dev);
+
+    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "regshift", 2);
+    qdev_prop_set_uint32(DEVICE(&s->serial_mm), "baudbase", 399193);
+    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "endianness",
+                        DEVICE_LITTLE_ENDIAN);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->serial_mm), errp)) {
+        return;
+    }
+
+    sysbus_pass_irq(SYS_BUS_DEVICE(dev), SYS_BUS_DEVICE(&s->serial_mm));
+
+    memory_region_init(&s->container, OBJECT(s), "mchp.pfsoc.mmuart", 0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
+
+    memory_region_add_subregion(&s->container, 0,
+                    sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->serial_mm), 0));
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &mchp_pfsoc_mmuart_ops, s,
                           "mchp.pfsoc.mmuart.regs", 0x1000 - REGS_OFFSET);
     memory_region_add_subregion(&s->container, REGS_OFFSET, &s->iomem);
-
-    s->base = base;
-    s->irq = irq;
-
-    s->serial = serial_mm_init(&s->container, 0, 2, irq, 399193, chr,
-                               DEVICE_LITTLE_ENDIAN);
-
-    memory_region_add_subregion(sysmem, base, &s->container);
-
-    return s;
+}
+
+static const VMStateDescription mchp_pfsoc_mmuart_vmstate = {
+    .name = "mchp.pfsoc.uart",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(reg, MchpPfSoCMMUartState,
+                             MCHP_PFSOC_MMUART_REG_COUNT),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void mchp_pfsoc_mmuart_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = mchp_pfsoc_mmuart_realize;
+    dc->reset = mchp_pfsoc_mmuart_reset;
+    dc->vmsd = &mchp_pfsoc_mmuart_vmstate;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
+static const TypeInfo mchp_pfsoc_mmuart_info = {
+    .name          = TYPE_MCHP_PFSOC_UART,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MchpPfSoCMMUartState),
+    .instance_init = mchp_pfsoc_mmuart_init,
+    .class_init    = mchp_pfsoc_mmuart_class_init,
+};
+
+static void mchp_pfsoc_mmuart_register_types(void)
+{
+    type_register_static(&mchp_pfsoc_mmuart_info);
+}
+
+type_init(mchp_pfsoc_mmuart_register_types)
+
+MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
+                                               hwaddr base,
+                                               qemu_irq irq, Chardev *chr)
+{
+    DeviceState *dev = qdev_new(TYPE_MCHP_PFSOC_UART);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    qdev_prop_set_chr(dev, "chardev", chr);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(sysmem, base, sysbus_mmio_get_region(sbd, 0));
+    sysbus_connect_irq(sbd, 0, irq);
+
+    return MCHP_PFSOC_UART(dev);
 }
-- 
2.31.1


