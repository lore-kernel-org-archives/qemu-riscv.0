Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnNtQ-0003nH-Id
	for mharc-qemu-riscv@gnu.org; Wed, 17 Nov 2021 11:34:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtI-0003Sb-7B
 for qemu-riscv@nongnu.org; Wed, 17 Nov 2021 11:34:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtB-00088W-ND
 for qemu-riscv@nongnu.org; Wed, 17 Nov 2021 11:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n71huKi+yk6NL30jm1M2LsU8+cBgcad2WusbapSISfE=;
 b=ZSE62C+Fuf8NQ7H/gMv6VvPlSHvZJj1GQOqL/r7ZgydEmrZLAdwU0ZxI138kRBLR5fm6Jr
 EaOTR/Gl8szQ1qAv5/J17wTxOTIb4AudwKtC9d/Jb6/gNCkeYh5lYIPsiUG+1CRjfXzvEv
 uwUSqpIBNb0j2KKNLt02LewFQ4UVpVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-gpDRdBhPNaKBye0I5OYPcw-1; Wed, 17 Nov 2021 11:34:18 -0500
X-MC-Unique: gpDRdBhPNaKBye0I5OYPcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C0019251A0;
 Wed, 17 Nov 2021 16:34:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0731E60657;
 Wed, 17 Nov 2021 16:34:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 76B3711380AA; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v2 01/13] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
Date: Wed, 17 Nov 2021 17:33:57 +0100
Message-Id: <20211117163409.3587705-2-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Nov 2021 16:34:33 -0000

ssi_sd_realize() creates an "sd-card" device.  This is inappropriate,
and marked FIXME.

Move it to the boards that create these devices.  Prior art: commit
eb4f566bbb for device "generic-sdhci", and commit 26c607b86b for
device "pl181".

The device remains not user-creatable, because its users should (and
do) wire up its GPIO chip-select line.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/stellaris.c  | 15 ++++++++++++++-
 hw/riscv/sifive_u.c | 13 ++++++++++++-
 hw/sd/ssi-sd.c      | 29 +----------------------------
 3 files changed, 27 insertions(+), 30 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 78827ace6b..b6c8a5d609 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
+#include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
 #include "hw/arm/boot.h"
 #include "qemu/timer.h"
@@ -1157,6 +1158,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             void *bus;
             DeviceState *sddev;
             DeviceState *ssddev;
+            DriveInfo *dinfo;
+            DeviceState *carddev;
+            BlockBackend *blk;
 
             /*
              * Some boards have both an OLED controller and SD card connected to
@@ -1221,8 +1225,17 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
              *  - Make the ssd0323 OLED controller chipselect active-low
              */
             bus = qdev_get_child_bus(dev, "ssi");
-
             sddev = ssi_create_peripheral(bus, "ssi-sd");
+
+            dinfo = drive_get(IF_SD, 0, 0);
+            blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+            carddev = qdev_new(TYPE_SD_CARD);
+            qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
+            qdev_prop_set_bit(carddev, "spi", true);
+            qdev_realize_and_unref(carddev,
+                                   qdev_get_child_bus(sddev, "sd-bus"),
+                                   &error_fatal);
+
             ssddev = ssi_create_peripheral(bus, "ssd0323");
             gpio_out[GPIO_D][0] = qemu_irq_split(
                     qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 589ae72a59..a4ecadaf12 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -46,6 +46,7 @@
 #include "hw/char/serial.h"
 #include "hw/cpu/cluster.h"
 #include "hw/misc/unimp.h"
+#include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
 #include "target/riscv/cpu.h"
 #include "hw/riscv/riscv_hart.h"
@@ -536,7 +537,8 @@ static void sifive_u_machine_init(MachineState *machine)
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     DriveInfo *dinfo;
-    DeviceState *flash_dev, *sd_dev;
+    BlockBackend *blk;
+    DeviceState *flash_dev, *sd_dev, *card_dev;
     qemu_irq flash_cs, sd_cs;
 
     /* Initialize SoC */
@@ -686,6 +688,15 @@ static void sifive_u_machine_init(MachineState *machine)
 
     sd_cs = qdev_get_gpio_in_named(sd_dev, SSI_GPIO_CS, 0);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi2), 1, sd_cs);
+
+    dinfo = drive_get(IF_SD, 0, 0);
+    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+    card_dev = qdev_new(TYPE_SD_CARD);
+    qdev_prop_set_drive_err(card_dev, "drive", blk, &error_fatal);
+    qdev_prop_set_bit(card_dev, "spi", true);
+    qdev_realize_and_unref(card_dev,
+                           qdev_get_child_bus(sd_dev, "sd-bus"),
+                           &error_fatal);
 }
 
 static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index e60854eeef..167c03b780 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -368,36 +368,9 @@ static const VMStateDescription vmstate_ssi_sd = {
 
 static void ssi_sd_realize(SSIPeripheral *d, Error **errp)
 {
-    ERRP_GUARD();
     ssi_sd_state *s = SSI_SD(d);
-    DeviceState *carddev;
-    DriveInfo *dinfo;
 
     qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, DEVICE(d), "sd-bus");
-
-    /* Create and plug in the sd card */
-    /* FIXME use a qdev drive property instead of drive_get_next() */
-    dinfo = drive_get_next(IF_SD);
-    carddev = qdev_new(TYPE_SD_CARD);
-    if (dinfo) {
-        if (!qdev_prop_set_drive_err(carddev, "drive",
-                                     blk_by_legacy_dinfo(dinfo), errp)) {
-            goto fail;
-        }
-    }
-
-    if (!object_property_set_bool(OBJECT(carddev), "spi", true, errp)) {
-        goto fail;
-    }
-
-    if (!qdev_realize_and_unref(carddev, BUS(&s->sdbus), errp)) {
-        goto fail;
-    }
-
-    return;
-
-fail:
-    error_prepend(errp, "failed to init SD card: ");
 }
 
 static void ssi_sd_reset(DeviceState *dev)
@@ -426,7 +399,7 @@ static void ssi_sd_class_init(ObjectClass *klass, void *data)
     k->cs_polarity = SSI_CS_LOW;
     dc->vmsd = &vmstate_ssi_sd;
     dc->reset = ssi_sd_reset;
-    /* Reason: init() method uses drive_get_next() */
+    /* Reason: GPIO chip-select line should be wired up */
     dc->user_creatable = false;
 }
 
-- 
2.31.1


