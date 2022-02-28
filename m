Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOWuV-0006SO-Tl
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 22:41:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=051f0bf02=alistair.francis@opensource.wdc.com>)
 id 1nOWuU-0006QL-OA
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 22:41:18 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:7978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=051f0bf02=alistair.francis@opensource.wdc.com>)
 id 1nOWuS-0001S9-LX
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 22:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646019675; x=1677555675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ibx6xEMCZv0aI/r6pCQ1XkRGKVvKHL/J27dgkZZ/MSk=;
 b=pFAIQ4hD7zjgdyM9SIHkyBst72I85XoWdd8UlnlzxbtS2JLsHkzr/O0Y
 /tbqnCg/9xTGBmR7iHbOOvFUUKWnDU+r6PdFonmq+cfL3hVxt2BSBoO0o
 4n40fXxZCN3ab+8QgttZx6y4jiNA8qkIY5U3NQ2T+2Epb9na1ailOwhiC
 IE665rrw6SDP0s4LwY3vgp5509uAmGcVIo5oyNtM2wmNcKZEGHorM8T8g
 e0vYgYydcDnZmrOnNLdrpLWN+2w35LUALmh++UrQqvGIi713m3sh1LqaG
 MGElxynY7byKp2+O1260mfbiKe00td8tGxDLkL1Q5PMC/IJ8TDHECfVBw w==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643644800"; d="scan'208";a="198906087"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Feb 2022 11:41:10 +0800
IronPort-SDR: wTPKHVmec6Z8f/EHqGwrL1eORdBHehA/GGulfJRApKYJmJGvEiW7HkcBDceeT6YtGy3kY93uJg
 TGHj1jgZrLLI3iRahPBkyU026VqsfZ5EkDPx0a8WjK93F/tU5o56JQPn5zrXSBRmKadpOs+HSA
 dYCDPb6CPilzlLjsVA05eMVOkeiE0gPfNwn7hxRprZ5B8i8LVIXS/Mtde7uRmdmDwbHdTG3DmS
 cpp+jm/34Jkn8UmaPyiVMMmIHNKG+RHS06qR63QZXEm2FfDSfrTM7purbuv1faOgXA7MrLrO3e
 Vahlm6E3eDzUcYGehh1t+9X3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 19:13:41 -0800
IronPort-SDR: jDgt0Ihe5+r6p6Fwje/0mzAEd1c51CGKApRl6SpQZqjU6eR6IA8Eg8o55y2DHxFThBvu4A3a8t
 RH/bMpZ6x8c8HmUPZw5tAYdjaLbDcpoSBG4cDAmv1E2k6bcmQELihlCDAOQpz74pTtjENBl4Mn
 U/RwelBqbFkZ9AnPtj5wZWwoF6t/zoH1XVsfX7apDJuPJRvfq0N9FPcHOaLLEHqYQHgbYj0HtD
 /lS0s5MHh/O3+8PTr1s/h7P4k4PRSDnvK3OBG62tvatsDD/t4XF4y6rQ8UlG1UKoVeOMtZ7RXY
 Mw0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 19:41:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K6R4R0vTPz1SVp1
 for <qemu-riscv@nongnu.org>; Sun, 27 Feb 2022 19:41:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646019670; x=1648611671; bh=ibx6xEMCZv0aI/r6pC
 Q1XkRGKVvKHL/J27dgkZZ/MSk=; b=m2m9E07FscIZyW+dVwBWc9ePqHGiTYx2YO
 xNjESgl0oHbI23+fo1BLG7a1yzIcWapsmGtCSBnMXOJwS1pA6QSDy9E1RgqYQO65
 AlokDwkKIfotgFFri0L77O6Gms292HOVIb2e8njpPJ8HKTZhqCYUXmbeu2RaHvOp
 PL0LVmkVNCCZk35L6ap5XFkdkBvzb7aokbyeZqjRztVIKRmrzZEUpi3a/Hf4jsgP
 hlDZSDWrUTPYhj4U/RTC4ib8PI4vdZJ8FVcGZzXuuv4rOYrgX3DGSYuKuetMhsfG
 Y8zH83ZS19UZ05L0s0uHc+MNVuoU9deIv6f4f0hFj+j4niV6vDqA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id sLvqtdjFstcY for <qemu-riscv@nongnu.org>;
 Sun, 27 Feb 2022 19:41:10 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.100])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K6R4K3Q2gz1Rwrw;
 Sun, 27 Feb 2022 19:41:04 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH v2 2/2] riscv: opentitan: Connect opentitan SPI Host
Date: Mon, 28 Feb 2022 13:40:47 +1000
Message-Id: <20220228034047.34612-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228034047.34612-1-alistair.francis@opensource.wdc.com>
References: <20220228034047.34612-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=051f0bf02=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 03:41:19 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Conenct spi host[1/0] to opentitan.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/riscv/opentitan.c         | 36 ++++++++++++++++++++++++++++++++----
 include/hw/riscv/opentitan.h | 12 +++++++++++-
 2 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 833624d66c..2d401dcb23 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -120,11 +120,18 @@ static void lowrisc_ibex_soc_init(Object *obj)
     object_initialize_child(obj, "uart", &s->uart, TYPE_IBEX_UART);
=20
     object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
+
+    for (int i =3D 0; i < OPENTITAN_NUM_SPI_HOSTS; i++) {
+        object_initialize_child(obj, "spi_host[*]", &s->spi_host[i],
+                                TYPE_IBEX_SPI_HOST);
+    }
 }
=20
 static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
 {
     const MemMapEntry *memmap =3D ibex_memmap;
+    DeviceState *dev;
+    SysBusDevice *busdev;
     MachineState *ms =3D MACHINE(qdev_get_machine());
     LowRISCIbexSoCState *s =3D RISCV_IBEX_SOC(dev_soc);
     MemoryRegion *sys_mem =3D get_system_memory();
@@ -209,14 +216,35 @@ static void lowrisc_ibex_soc_realize(DeviceState *d=
ev_soc, Error **errp)
                           qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
                                            IRQ_M_TIMER));
=20
+    /* SPI-Hosts */
+    for (int i =3D 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
+        dev =3D DEVICE(&(s->spi_host[i]));
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi_host[i]), errp)) {
+            return;
+        }
+        busdev =3D SYS_BUS_DEVICE(dev);
+        sysbus_mmio_map(busdev, 0, memmap[IBEX_DEV_SPI_HOST0 + i].base);
+
+        switch (i) {
+        case OPENTITAN_SPI_HOST0:
+            sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
+                                IBEX_SPI_HOST0_ERR_IRQ));
+            sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
+                                IBEX_SPI_HOST0_SPI_EVENT_IRQ));
+            break;
+        case OPENTITAN_SPI_HOST1:
+            sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
+                                IBEX_SPI_HOST1_ERR_IRQ));
+            sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
+                                IBEX_SPI_HOST1_SPI_EVENT_IRQ));
+            break;
+        }
+    }
+
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
     create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
         memmap[IBEX_DEV_SPI_DEVICE].base, memmap[IBEX_DEV_SPI_DEVICE].si=
ze);
-    create_unimplemented_device("riscv.lowrisc.ibex.spi_host0",
-        memmap[IBEX_DEV_SPI_HOST0].base, memmap[IBEX_DEV_SPI_HOST0].size=
);
-    create_unimplemented_device("riscv.lowrisc.ibex.spi_host1",
-        memmap[IBEX_DEV_SPI_HOST1].base, memmap[IBEX_DEV_SPI_HOST1].size=
);
     create_unimplemented_device("riscv.lowrisc.ibex.i2c",
         memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 00da9ded43..3a3f412ef8 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -1,7 +1,7 @@
 /*
  * QEMU RISC-V Board Compatible with OpenTitan FPGA platform
  *
- * Copyright (c) 2020 Western Digital
+ * Copyright (c) 2022 Western Digital
  *
  * This program is free software; you can redistribute it and/or modify =
it
  * under the terms and conditions of the GNU General Public License,
@@ -23,11 +23,16 @@
 #include "hw/intc/sifive_plic.h"
 #include "hw/char/ibex_uart.h"
 #include "hw/timer/ibex_timer.h"
+#include "hw/ssi/ibex_spi_host.h"
 #include "qom/object.h"
=20
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
 OBJECT_DECLARE_SIMPLE_TYPE(LowRISCIbexSoCState, RISCV_IBEX_SOC)
=20
+#define OPENTITAN_NUM_SPI_HOSTS 2
+#define OPENTITAN_SPI_HOST0 0
+#define OPENTITAN_SPI_HOST1 1
+
 struct LowRISCIbexSoCState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -37,6 +42,7 @@ struct LowRISCIbexSoCState {
     SiFivePLICState plic;
     IbexUartState uart;
     IbexTimerState timer;
+    IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
=20
     MemoryRegion flash_mem;
     MemoryRegion rom;
@@ -90,6 +96,10 @@ enum {
=20
 enum {
     IBEX_TIMER_TIMEREXPIRED0_0 =3D 126,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ =3D 153,
+    IBEX_SPI_HOST1_ERR_IRQ =3D 152,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ =3D 151,
+    IBEX_SPI_HOST0_ERR_IRQ =3D 150,
     IBEX_UART0_RX_PARITY_ERR_IRQ =3D 8,
     IBEX_UART0_RX_TIMEOUT_IRQ =3D 7,
     IBEX_UART0_RX_BREAK_ERR_IRQ =3D 6,
--=20
2.35.1


