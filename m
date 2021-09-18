Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRekb-0003Hi-PH
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 14:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mReka-0003Gy-40; Sat, 18 Sep 2021 14:07:44 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRekY-0000k7-Dt; Sat, 18 Sep 2021 14:07:43 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso12416143wme.4; 
 Sat, 18 Sep 2021 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gJ+ibvD1s7i/IrJylRwwhVtXf/pCdtBLBeoQ9ccQB0M=;
 b=UTd3Qs2JvqU24q7zUk/8lyXRAhiTGAtNRomsZg/Cdr84vHWUyus/pt3vVBEqEL9iCp
 tVCRUat/BM+7eVfKrUjeDcGlHiqD9Xc+d9q0S1Vnx/LUUGWkxGQsKYLO0antHMWAkHhm
 J/uGgWEVLdrtsv6j9ibjIk9g90dJgTiJZbdA15kkW/y6lot9hgKtxChZrPCHVjqRMTBw
 w5pW7IDP5bdayWDRGWSRuOj+gt5K93Sl1/StKihBogbCPUsqzTFEOJEJJQ0L2AXN0so9
 tp9Pqt9V6KAJpkQZPzz7DuNZ0+5m8NY9KeVfTYYVrwrLtr/Mg2D3pNcvB1hmLpDScAwf
 6Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gJ+ibvD1s7i/IrJylRwwhVtXf/pCdtBLBeoQ9ccQB0M=;
 b=4w6JyGKUTUAooQDIxau4ZxXQfRqtlmqZb89TxcCnabZpDD47oY/u2tq77iSsZWOL43
 JenqlrRvtVt9d7/baDGTE0z14R+SV0G4ZmYdJg/6cepbQVkO0GuC51E0VLikPjVU4CHX
 DShDu7iIEhEtk3c/84dTnJNUCm4/JZ5f5e9IWzLTqtQL08tuHVCAWyJlaQOAZ12y6h/O
 cTDNNq/z7sDCpAjvMCo/ChATj2gFn8GrE/jpCVFnGrLNoltEfTe5+GWuoL7uQfUvC7K1
 jxGDys51Yl2hzen+BYvBs+0IItcaOQTnADTx1YUW7yBo7AugSrazTM5WI/SQu/MkZfPW
 UA1A==
X-Gm-Message-State: AOAM533CD+tGISa4xoCZmEYeLTMeqRfQWz75wq3fwqT6/Fdkbtrkca6Q
 9Yp5OczcjTXZbgAvMiGP7T/5055qxO8=
X-Google-Smtp-Source: ABdhPJyDfPd6Hu0h4B1eqpm9GBJMwxJpK92CHnxMXXEZgqudHABaznQ+z1F/IMXAgL1owgDG+yyrqQ==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr16618274wmj.27.1631988460224; 
 Sat, 18 Sep 2021 11:07:40 -0700 (PDT)
Received: from x1w.. (14.red-83-35-25.dynamicip.rima-tde.net. [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id m29sm11148304wrb.89.2021.09.18.11.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:07:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
Date: Sat, 18 Sep 2021 20:07:38 +0200
Message-Id: <20210918180738.2506799-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
X-List-Received-Date: Sat, 18 Sep 2021 18:07:44 -0000

- Embed SerialMM in MchpPfSoCMMUartState and QOM-initialize it
- Alias SERIAL_MM 'chardev' property on MCHP_PFSOC_UART
- Forward SerialMM sysbus IRQ in mchp_pfsoc_mmuart_realize()
- Keep mchp_pfsoc_mmuart_create() behavior

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/char/mchp_pfsoc_mmuart.h | 16 ++++--
 hw/char/mchp_pfsoc_mmuart.c         | 77 +++++++++++++++++++++++------
 2 files changed, 73 insertions(+), 20 deletions(-)

diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_pfsoc_mmuart.h
index f61990215f0..b484b7ea5e4 100644
--- a/include/hw/char/mchp_pfsoc_mmuart.h
+++ b/include/hw/char/mchp_pfsoc_mmuart.h
@@ -28,16 +28,22 @@
 #ifndef HW_MCHP_PFSOC_MMUART_H
 #define HW_MCHP_PFSOC_MMUART_H
 
+#include "hw/sysbus.h"
 #include "hw/char/serial.h"
 
 #define MCHP_PFSOC_MMUART_REG_SIZE  52
 
-typedef struct MchpPfSoCMMUartState {
-    MemoryRegion iomem;
-    hwaddr base;
-    qemu_irq irq;
+#define TYPE_MCHP_PFSOC_UART "mchp.pfsoc.uart"
+OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCMMUartState, MCHP_PFSOC_UART)
 
-    SerialMM *serial;
+typedef struct MchpPfSoCMMUartState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    SerialMM serial_mm;
 
     uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
 } MchpPfSoCMMUartState;
diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
index 2facf85c2d8..74404e047d4 100644
--- a/hw/char/mchp_pfsoc_mmuart.c
+++ b/hw/char/mchp_pfsoc_mmuart.c
@@ -22,8 +22,9 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "chardev/char.h"
+#include "qapi/error.h"
 #include "hw/char/mchp_pfsoc_mmuart.h"
+#include "hw/qdev-properties.h"
 
 static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsigned size)
 {
@@ -63,23 +64,69 @@ static const MemoryRegionOps mchp_pfsoc_mmuart_ops = {
     },
 };
 
-MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
-    hwaddr base, qemu_irq irq, Chardev *chr)
+static void mchp_pfsoc_mmuart_init(Object *obj)
 {
-    MchpPfSoCMMUartState *s;
-
-    s = g_new0(MchpPfSoCMMUartState, 1);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    MchpPfSoCMMUartState *s = MCHP_PFSOC_UART(obj);
 
     memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
                           "mchp.pfsoc.mmuart", 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
 
-    s->base = base;
-    s->irq = irq;
-
-    s->serial = serial_mm_init(sysmem, base, 2, irq, 399193, chr,
-                               DEVICE_LITTLE_ENDIAN);
-
-    memory_region_add_subregion(sysmem, base + 0x20, &s->iomem);
-
-    return s;
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
+    sysbus_pass_irq(SYS_BUS_DEVICE(dev), SYS_BUS_DEVICE(&s->serial_mm));
+    memory_region_add_subregion(&s->iomem, 0x20,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->serial_mm), 0));
+}
+
+static void mchp_pfsoc_mmuart_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = mchp_pfsoc_mmuart_realize;
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


