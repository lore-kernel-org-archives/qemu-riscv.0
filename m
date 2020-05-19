Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jb9yU-00058z-PV
	for mharc-qemu-riscv@gnu.org; Tue, 19 May 2020 17:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=401675184=alistair.francis@wdc.com>)
 id 1jb9yR-0004vs-9F; Tue, 19 May 2020 17:40:31 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:10362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=401675184=alistair.francis@wdc.com>)
 id 1jb9yM-0008RH-B7; Tue, 19 May 2020 17:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1589924451; x=1621460451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T8XWjoCBhSRh+2XM72PdhP1tX40TfKFy2wNJXAf94nc=;
 b=SPmIVJBlTu43P4wYfIFoA5sAQExu4Yn1LZXRB6D814vjObaOUIPC6fDl
 J1M2GfO4A+Cfu+bTiz5M1DJw4lZpub9xCmiM4NXPfYZ7cENAXcGT3LTJb
 MX0MpaVAK+pQ9m6CQ7ZMZyPWLaxgM/Z4pnbYRG2IktYH4eN6IraF28Crj
 8Up/2p2HIO9LuXDwsY9NHQSSHx0b6TIClwj1j/WQ4OVQWN5XlpNL1BADA
 gtBV82EwXd2LC6EndGJqUEZzXQzB9eafZX5jxtEBLlHLMt+pA6DCwR1XG
 5kmqAAL88Td4GXvSW/FuBy7Dpk7U9Wdy0S/nrNJWhULdP78yiOpSl7IJi Q==;
IronPort-SDR: WH2+AMm9dvjasVUaUKNy0tQQPfhv17emnElEj9hOH2kVziHk7mzWyNgu2PjCpfZkTX3Iu8+vR6
 w0pElZJ8/WRgr1GHBacqbebPMvG3iYbt4Kemj/OEOwoLPU5r/ysC4en+IiVC5+3/EDjJ4kqQ0o
 rJJNe7rx+1SV6RB8cdQTwsGPqGzdbK23p/bxVedYtGnCFUdEyGE77HuKAGQNjVSm66OWLMfckp
 EfiRNJiissGm5UEqwerK1OQbTVND/TKu8ZPdjod8bhT2WjQFgUXUyiedCpY1GOQag2NtGOKrMO
 bfo=
X-IronPort-AV: E=Sophos;i="5.73,411,1583164800"; d="scan'208";a="240814210"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 May 2020 05:40:34 +0800
IronPort-SDR: c3B6DngkAGBEpMCIFVuYQM0ru/rkW15zbj7Fhb7qNeH7U4AQYfHALQ0u+RRyZwq+k6zfM62eZR
 wZ6A4K53sZv7LuEyFzmgNHWsQomAAN1mY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 14:29:45 -0700
IronPort-SDR: N1rVSjNerjkXaCFajXnxxbcyrrD2LIQTydDmxzRp+0HuC786Y5gIlZe5uN2Y19Zx3E24plU4Ar
 PemXjgrriYAw==
WDCIronportException: Internal
Received: from usa005149.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.14])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 May 2020 14:40:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, alistair23@gmail.com,
 bmeng.cn@gmail.com, philmd@redhat.com
Subject: [PATCH v3 8/9] riscv/opentitan: Connect the UART device
Date: Tue, 19 May 2020 14:31:47 -0700
Message-Id: <eb6069a05d18f4a1c9c7dbc97a0c521ae4b3674f.1589923785.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1589923785.git.alistair.francis@wdc.com>
References: <cover.1589923785.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=401675184=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 17:39:51
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 19 May 2020 21:40:31 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
---
 include/hw/riscv/opentitan.h | 13 +++++++++++++
 hw/riscv/opentitan.c         | 24 ++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 8d6a09b696..825a3610bc 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -21,6 +21,7 @@
 
 #include "hw/riscv/riscv_hart.h"
 #include "hw/intc/ibex_plic.h"
+#include "hw/char/ibex_uart.h"
 
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
 #define RISCV_IBEX_SOC(obj) \
@@ -33,6 +34,7 @@ typedef struct LowRISCIbexSoCState {
     /*< public >*/
     RISCVHartArrayState cpus;
     IbexPlicState plic;
+    IbexUartState uart;
 
     MemoryRegion flash_mem;
     MemoryRegion rom;
@@ -63,4 +65,15 @@ enum {
     IBEX_USBDEV,
 };
 
+enum {
+    IBEX_UART_RX_PARITY_ERR_IRQ = 0x28,
+    IBEX_UART_RX_TIMEOUT_IRQ = 0x27,
+    IBEX_UART_RX_BREAK_ERR_IRQ = 0x26,
+    IBEX_UART_RX_FRAME_ERR_IRQ = 0x25,
+    IBEX_UART_RX_OVERFLOW_IRQ = 0x24,
+    IBEX_UART_TX_EMPTY_IRQ = 0x23,
+    IBEX_UART_RX_WATERMARK_IRQ = 0x22,
+    IBEX_UART_TX_WATERMARK_IRQ = 0x21
+};
+
 #endif
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 3926321d8c..a6c0b949ca 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -96,6 +96,9 @@ static void riscv_lowrisc_ibex_soc_init(Object *obj)
 
     sysbus_init_child_obj(obj, "plic", &s->plic,
                           sizeof(s->plic), TYPE_IBEX_PLIC);
+
+    sysbus_init_child_obj(obj, "uart", &s->uart,
+                          sizeof(s->uart), TYPE_IBEX_UART);
 }
 
 static void riscv_lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -137,8 +140,25 @@ static void riscv_lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(busdev, 0, memmap[IBEX_PLIC].base);
 
-    create_unimplemented_device("riscv.lowrisc.ibex.uart",
-        memmap[IBEX_UART].base, memmap[IBEX_UART].size);
+    /* UART */
+    dev = DEVICE(&(s->uart));
+    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
+    object_property_set_bool(OBJECT(&s->uart), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, memmap[IBEX_UART].base);
+    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(&s->plic),
+                       IBEX_UART_TX_WATERMARK_IRQ));
+    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(&s->plic),
+                       IBEX_UART_RX_WATERMARK_IRQ));
+    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(DEVICE(&s->plic),
+                       IBEX_UART_TX_EMPTY_IRQ));
+    sysbus_connect_irq(busdev, 3, qdev_get_gpio_in(DEVICE(&s->plic),
+                       IBEX_UART_RX_OVERFLOW_IRQ));
+
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_GPIO].base, memmap[IBEX_GPIO].size);
     create_unimplemented_device("riscv.lowrisc.ibex.spi",
-- 
2.26.2


