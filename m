Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnJ1R-0002dx-FH
	for mharc-qemu-riscv@gnu.org; Sun, 30 May 2021 06:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1lnJ0q-0002It-9n; Sun, 30 May 2021 06:49:44 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:35112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1lnJ0m-0001MU-Uh; Sun, 30 May 2021 06:49:43 -0400
Received: from fornax.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 299F42089E;
 Sun, 30 May 2021 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1622371775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdEHYRbQuDE0es/AbLBFsfZ7HIPr78oILEQpaVGqivw=;
 b=KAFd5/QP3AzPGOJjtxR2Q0xo0r6E4v1s/2gAgcEsUq8OmueyUvAC79qLhwFIjzHrBKWGxb
 5dpS+u8dYsireJ13Y9H5pYGQK5vHiq94XgqDVwYM+RzaPF3BWWxOpcbVKXT9Paoqmoev88
 fUqIBpiRiBI7haEz/UjG5rOfEnt6WZ4=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 luc.michel@greensocs.com, mark.burton@greensocs.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
Subject: [PATCH v2 2/2] hw/char: sifive_uart
Date: Sun, 30 May 2021 12:49:22 +0200
Message-Id: <20210530104922.466175-3-lukas.juenger@greensocs.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210530104922.466175-1-lukas.juenger@greensocs.com>
References: <20210530104922.466175-1-lukas.juenger@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=lukas.juenger@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 30 May 2021 10:49:45 -0000

QOMify sifive_uart model

Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>
---
 include/hw/char/sifive_uart.h |  6 +--
 hw/char/sifive_uart.c         | 72 ++++++++++++++++++++++++++++++-----
 2 files changed, 65 insertions(+), 13 deletions(-)

diff --git a/include/hw/char/sifive_uart.h b/include/hw/char/sifive_uart.h
index 3e962be659..45d66b1db5 100644
--- a/include/hw/char/sifive_uart.h
+++ b/include/hw/char/sifive_uart.h
@@ -21,6 +21,7 @@
 #define HW_SIFIVE_UART_H
 
 #include "chardev/char-fe.h"
+#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
@@ -51,10 +52,7 @@ enum {
 #define SIFIVE_UART_GET_RXCNT(rxctrl)   ((rxctrl >> 16) & 0x7)
 
 #define TYPE_SIFIVE_UART "riscv.sifive.uart"
-
-typedef struct SiFiveUARTState SiFiveUARTState;
-DECLARE_INSTANCE_CHECKER(SiFiveUARTState, SIFIVE_UART,
-                         TYPE_SIFIVE_UART)
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveUARTState, SIFIVE_UART)
 
 struct SiFiveUARTState {
     /*< private >*/
diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 101d68d8cf..7f0ee8d77d 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -23,6 +23,7 @@
 #include "chardev/char-fe.h"
 #include "hw/irq.h"
 #include "hw/char/sifive_uart.h"
+#include "hw/qdev-properties-system.h"
 
 /*
  * Not yet implemented:
@@ -174,19 +175,72 @@ static int sifive_uart_be_change(void *opaque)
     return 0;
 }
 
+static Property sifive_uart_properties[] = {
+    DEFINE_PROP_CHR("chardev", SiFiveUARTState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sifive_uart_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    SiFiveUARTState *s = SIFIVE_UART(obj);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_uart_ops, s,
+                          TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
+    sysbus_init_mmio(sbd, &s->mmio);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void sifive_uart_realize(DeviceState *dev, Error **errp)
+{
+    SiFiveUARTState *s = SIFIVE_UART(dev);
+
+    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
+            sifive_uart_event, sifive_uart_be_change, s, NULL, true);
+
+}
+
+static void sifive_uart_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = sifive_uart_realize;
+    device_class_set_props(dc, sifive_uart_properties);
+}
+
+static const TypeInfo sifive_uart_info = {
+    .name          = TYPE_SIFIVE_UART,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SiFiveUARTState),
+    .instance_init = sifive_uart_init,
+    .class_init    = sifive_uart_class_init,
+};
+
+static void sifive_uart_register_types(void)
+{
+    type_register_static(&sifive_uart_info);
+}
+
+type_init(sifive_uart_register_types)
+
 /*
  * Create UART device.
  */
 SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
     Chardev *chr, qemu_irq irq)
 {
-    SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
-    s->irq = irq;
-    qemu_chr_fe_init(&s->chr, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
-            sifive_uart_event, sifive_uart_be_change, s, NULL, true);
-    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
-                          TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
-    memory_region_add_subregion(address_space, base, &s->mmio);
-    return s;
+    DeviceState *dev;
+    SysBusDevice *s;
+    SiFiveUARTState *r;
+
+    dev = qdev_new("riscv.sifive.uart");
+    s = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", chr);
+    sysbus_realize_and_unref(s, &error_fatal);
+    memory_region_add_subregion(address_space, base,
+                                sysbus_mmio_get_region(s, 0));
+    sysbus_connect_irq(s, 0, irq);
+
+    r = SIFIVE_UART(dev);
+    return r;
 }
-- 
2.31.1


