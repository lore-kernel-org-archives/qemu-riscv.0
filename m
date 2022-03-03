Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPdVJ-0004hn-C7
	for mharc-qemu-riscv@gnu.org; Wed, 02 Mar 2022 23:55:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPdVH-0004de-LD
 for qemu-riscv@nongnu.org; Wed, 02 Mar 2022 23:55:51 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:18437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPdVF-0005ag-M8
 for qemu-riscv@nongnu.org; Wed, 02 Mar 2022 23:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646283349; x=1677819349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ddrb8hSviwzG/99OD2CE+rV61eU9IXzLIrQw9CmJCyY=;
 b=YZc5oW2X+eE7Hod8oogVAlGI9/+kkQkJyMRCROMLP9wR+J8SZapfLmaU
 eDWhzZEwDqZ13aADYsBgGcFKHr96PmXWiXwrLSL2dhm6xHNhpy9Vo67Yj
 rBVL/s7L7fp3NhfLfdsrovQE4wxl2UF+5drHXxkNBAbljKvcBBS5sGjW4
 fDJVsdp435Vg3uGGfvP+WEF7bVsnx1C14TzwiqIIa1PKVuLuXM+IdGxQy
 v6RCG0aQLXLEbKeEgQqNu+p7oSWiW5c2jDqxysw0IviZJTmC2kg7KsxF+
 p4oAJYRotKa+TPxtKIyOLSKINf50TGnCqDPfPXSkbMG8nIRcDdRYJgdUS g==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="298480872"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 12:55:37 +0800
IronPort-SDR: MNYPe2ThHy0oAQ3NVDmKl+hT0DjLe0eDX1B+kOwei8u0YJPQycp2y4IJ+pb4XpqMCZ2ViSG3bJ
 J+DEudelSTcLQwW8ZS9LHZdGFqBkjsCf3TZuZNdDbtsvQo7ZfhuOlpkABg6oFSxA9l6A3Z1YAx
 T9Zfhr2Rt+JEVCbTS/+lpJSnV5+lx2xJYtegzRSvLGLPJ4DPefjlVtn0M4G0lh6sI2NutrLrkK
 edkoUd551B7HLqlPxKeYTxHribZ2JI+DuQ127/43FdIGxI7UZqV6AidFsn5ixnsXWReEZyKIgY
 BLJn3MRHmLouU8xoxrXFmmSa
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 20:26:59 -0800
IronPort-SDR: 4BCJnbMcLYS1znz/rf0J0b+8AN7XKc2fFt75Rl6FCEPxLkN7FS1T/YvnUMCt5zMRdZxvA3ZCIQ
 LQEl2EayNMmvuh9ONI5hd/kSw3dNYp1QoXh4Pbr4BrYB6OJof2Q8fGqgcAUzVyLiHGhYdkA4dH
 jJ6q809UUVFOoEOkJJ9Bqdf35Nr2Swov1D9wcJfnvdQGvDTdWSScKLJsv3o3CuCr+9RUAM9x0X
 AYKYV60OLlvMCODi0P2T9VOLMizOWRRbumE+4RjAzYZHPJqs5RflUl1qeSQBquiVyB2T6HBSEa
 SSE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 20:55:38 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8JZx21Zbz1SVp1
 for <qemu-riscv@nongnu.org>; Wed,  2 Mar 2022 20:55:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1646283336; x=1648875337; bh=Ddrb8hS
 viwzG/99OD2CE+rV61eU9IXzLIrQw9CmJCyY=; b=X6YPrk5lHdMUxs9saGOip02
 SiCmfDTY0blbrJwmQwoFFg4rUKqI+TkGFW1XXZYxnjx3Fq2yThd/vjvbSVpZmHM3
 PeyGvE32FOeKIuuod9Wyt1ejU7hANv4r/22ZJJZv4ELGiXAbfStown7e/vM8Y4nn
 /jHX202WkMPvkPF9+qU6bwyQsfTyCkcB5sWEH9BuTd+wQhThjW06XNuniNA+sViJ
 2irBDQQhByY7i6tahFhmVLJyqgcDfNGx8xla8k7LX9wFHgf7pB401dYmY8gTAmLD
 KdAfHKw+PA4HbdVWjkObyEDsBC2vK6V9PHOGLl/rQRF9LyW8cPPUhgkMmkUFPAA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LNEmVzddnFEv for <qemu-riscv@nongnu.org>;
 Wed,  2 Mar 2022 20:55:36 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8JZq3Z74z1Rwrw;
 Wed,  2 Mar 2022 20:55:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 2/2] riscv: opentitan: Connect opentitan SPI Host
Date: Thu,  3 Mar 2022 14:54:26 +1000
Message-Id: <20220303045426.511588-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303045426.511588-1-alistair.francis@opensource.wdc.com>
References: <20220303045426.511588-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 03 Mar 2022 04:55:51 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Connect spi host[1/0] to opentitan.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2 -> V3 Changes:
1. Fixup commit message typo.
In `opentitan.h`:
1. Revert copyright year change from 2022 to 2020
2. Moved `OPENTITAN_SPI_X` #defines into an enum
3. Sorted IBEX_X_IRQ enum in ascending order.

 hw/riscv/opentitan.c         | 36 ++++++++++++++++++++++++++++++++----
 include/hw/riscv/opentitan.h | 30 +++++++++++++++++++++---------
 2 files changed, 53 insertions(+), 13 deletions(-)

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
index 00da9ded43..68892cd8e5 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -23,11 +23,18 @@
 #include "hw/intc/sifive_plic.h"
 #include "hw/char/ibex_uart.h"
 #include "hw/timer/ibex_timer.h"
+#include "hw/ssi/ibex_spi_host.h"
 #include "qom/object.h"
=20
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
 OBJECT_DECLARE_SIMPLE_TYPE(LowRISCIbexSoCState, RISCV_IBEX_SOC)
=20
+enum {
+    OPENTITAN_SPI_HOST0,
+    OPENTITAN_SPI_HOST1,
+    OPENTITAN_NUM_SPI_HOSTS,
+};
+
 struct LowRISCIbexSoCState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -37,6 +44,7 @@ struct LowRISCIbexSoCState {
     SiFivePLICState plic;
     IbexUartState uart;
     IbexTimerState timer;
+    IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
=20
     MemoryRegion flash_mem;
     MemoryRegion rom;
@@ -89,15 +97,19 @@ enum {
 };
=20
 enum {
-    IBEX_TIMER_TIMEREXPIRED0_0 =3D 126,
-    IBEX_UART0_RX_PARITY_ERR_IRQ =3D 8,
-    IBEX_UART0_RX_TIMEOUT_IRQ =3D 7,
-    IBEX_UART0_RX_BREAK_ERR_IRQ =3D 6,
-    IBEX_UART0_RX_FRAME_ERR_IRQ =3D 5,
-    IBEX_UART0_RX_OVERFLOW_IRQ =3D 4,
-    IBEX_UART0_TX_EMPTY_IRQ =3D 3,
-    IBEX_UART0_RX_WATERMARK_IRQ =3D 2,
-    IBEX_UART0_TX_WATERMARK_IRQ =3D 1,
+    IBEX_UART0_TX_WATERMARK_IRQ   =3D 1,
+    IBEX_UART0_RX_WATERMARK_IRQ   =3D 2,
+    IBEX_UART0_TX_EMPTY_IRQ       =3D 3,
+    IBEX_UART0_RX_OVERFLOW_IRQ    =3D 4,
+    IBEX_UART0_RX_FRAME_ERR_IRQ   =3D 5,
+    IBEX_UART0_RX_BREAK_ERR_IRQ   =3D 6,
+    IBEX_UART0_RX_TIMEOUT_IRQ     =3D 7,
+    IBEX_UART0_RX_PARITY_ERR_IRQ  =3D 8,
+    IBEX_TIMER_TIMEREXPIRED0_0    =3D 126,
+    IBEX_SPI_HOST0_ERR_IRQ        =3D 150,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 151,
+    IBEX_SPI_HOST1_ERR_IRQ        =3D 152,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 153,
 };
=20
 #endif
--=20
2.35.1


