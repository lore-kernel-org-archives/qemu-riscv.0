Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRcMW-0001xa-1L
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=717634b45=alistair.francis@wdc.com>)
 id 1lRcMR-0001w8-NT; Wed, 31 Mar 2021 11:02:25 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:36989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=717634b45=alistair.francis@wdc.com>)
 id 1lRcMM-0000sX-So; Wed, 31 Mar 2021 11:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617202938; x=1648738938;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hKFp+bylPVe4wp7o5DBkmM7qX5ZutPc0mI1Kopxmqm0=;
 b=LKajSR4FI+twjsx6sl/zSMDtURwPCkcfMVZueBdRt+XNtSd0Hqgj6EBK
 O6SxnBQJw1biSD2/o16nvROomDmG4kg3gGOWFrf/MyrA2MBjnM3CXz9QW
 RTt4EbqJsLU/YfyGUz79AhLoNqU+r1xoEd2XyDI21ac+s1+ybZq94pII4
 Ya7eKMXm2HkvQS58o4hV93xAz9nWvBZqkst06OsY1+OGdgCxCnCS8iK68
 7UsWwb2y1DWw1JyD5Swu78D13wA3f9yuxt0pVpVI0AaOXYA+JLmcfTJpS
 VhiiuTJc20PsGkTgGtmBU1NOnNQ2pUgri7cyK/yDZR7ww8H9veJUlDvoZ A==;
IronPort-SDR: YqvAfCWYBgWgStdZ4nZ4Yl9faSkjNzYoKBI6a/ZifqlNBOBpoUfVvUO9T5Jy0+JY42T3A98nI4
 eDFTE/aTz/OxoXA6FaaPEU93Ooox5M26z+SZGEYnIHGsq6lDjPG42yiztnsMOxZMrf/Tea97JO
 fRbKZIdkVXGnJ1CvT2IIfPJR383T+gtJe44QgfYP7exolh0xZ0BZd4ocNaSWw8UwPS146hh61H
 lyogTAjAC10fTC2oTnTGYrSn77z83BakAqWYIpoi2HNsrI9GxKHcg7NUy4qN44l7qz475Vnw9r
 004=
X-IronPort-AV: E=Sophos;i="5.81,293,1610380800"; d="scan'208";a="274273432"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2021 23:02:01 +0800
IronPort-SDR: AapvxJ6p9NBdS2Pboh9tY03cC7lh846tCYT6ZfoUPr58ZrEU8HH3cYqbfR87nVenuHzwtQZb4s
 RYvD4vAi0Lwou4nrsCmWx8gmbE5L5uwrnSvPXlXhcEgPHJhE1As4pDYB025nroC8ZVSbGwua9c
 blaz1kcAIYtkyGuhWm8xvoFKHuxvxXig5N0nv/J0QDftDu935EFGwJKxUYdSDkbdwW58RWFxz5
 Q7P8nC9DgawG/YWlf3KHpfmX6H3Nx9wYhgDDXSSQXowgsUJSFmIhw3Q42wc9yUjAktxl2AFQ8G
 HZjTggHMsR8ww/Yj4fNkRJxQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 07:42:09 -0700
IronPort-SDR: Vtz/p9dopzKD8pp4K1rv3AQr9N6L3H5+rYHjweFegH86/tuV86m/GYMzmxjCz6G4c8uTr5JJxw
 BjAEEvIIUsCbctEQH9+vA+hS/0SBfNnfa6jl4azvbXeWMqke1aQRbCD3C7uOyVdTVk3GatdElz
 ciokFL8yWpTj3fVc18UngYHffbxNgga/jyzp1ORVCbmV9usjhKG3trmNN4H+LYQPtdWVxmuUCm
 yIEuxTdj3xeZ4fhDxT1yhqFGq5VBdXLgzhilS9VRwbYcIVqFnymlHzHeBiLCCqMihdTahHEMPa
 d60=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.72])
 by uls-op-cesaip01.wdc.com with ESMTP; 31 Mar 2021 08:02:00 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] hw/opentitan: Update the interrupt layout
Date: Wed, 31 Mar 2021 11:00:11 -0400
Message-Id: <e92b696f1809c9fa4410da2e9f23c414db5a6960.1617202791.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=717634b45=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 31 Mar 2021 15:02:27 -0000

Update the OpenTitan interrupt layout to match the latest OpenTitan
bitstreams. This involves changing the Ibex PLIC memory layout and the
UART interrupts.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 16 ++++++++--------
 hw/intc/ibex_plic.c          | 20 ++++++++++----------
 hw/riscv/opentitan.c         |  8 ++++----
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index a5ea3a5e4e..aab9bc9245 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -82,14 +82,14 @@ enum {
 };
 
 enum {
-    IBEX_UART_RX_PARITY_ERR_IRQ = 0x28,
-    IBEX_UART_RX_TIMEOUT_IRQ = 0x27,
-    IBEX_UART_RX_BREAK_ERR_IRQ = 0x26,
-    IBEX_UART_RX_FRAME_ERR_IRQ = 0x25,
-    IBEX_UART_RX_OVERFLOW_IRQ = 0x24,
-    IBEX_UART_TX_EMPTY_IRQ = 0x23,
-    IBEX_UART_RX_WATERMARK_IRQ = 0x22,
-    IBEX_UART_TX_WATERMARK_IRQ = 0x21,
+    IBEX_UART0_RX_PARITY_ERR_IRQ = 8,
+    IBEX_UART0_RX_TIMEOUT_IRQ = 7,
+    IBEX_UART0_RX_BREAK_ERR_IRQ = 6,
+    IBEX_UART0_RX_FRAME_ERR_IRQ = 5,
+    IBEX_UART0_RX_OVERFLOW_IRQ = 4,
+    IBEX_UART0_TX_EMPTY_IRQ = 3,
+    IBEX_UART0_RX_WATERMARK_IRQ = 2,
+    IBEX_UART0_TX_WATERMARK_IRQ = 1,
 };
 
 #endif
diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index c1b72fcab0..edf76e4f61 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -225,23 +225,23 @@ static void ibex_plic_irq_request(void *opaque, int irq, int level)
 
 static Property ibex_plic_properties[] = {
     DEFINE_PROP_UINT32("num-cpus", IbexPlicState, num_cpus, 1),
-    DEFINE_PROP_UINT32("num-sources", IbexPlicState, num_sources, 80),
+    DEFINE_PROP_UINT32("num-sources", IbexPlicState, num_sources, 176),
 
     DEFINE_PROP_UINT32("pending-base", IbexPlicState, pending_base, 0),
-    DEFINE_PROP_UINT32("pending-num", IbexPlicState, pending_num, 3),
+    DEFINE_PROP_UINT32("pending-num", IbexPlicState, pending_num, 6),
 
-    DEFINE_PROP_UINT32("source-base", IbexPlicState, source_base, 0x0c),
-    DEFINE_PROP_UINT32("source-num", IbexPlicState, source_num, 3),
+    DEFINE_PROP_UINT32("source-base", IbexPlicState, source_base, 0x18),
+    DEFINE_PROP_UINT32("source-num", IbexPlicState, source_num, 6),
 
-    DEFINE_PROP_UINT32("priority-base", IbexPlicState, priority_base, 0x18),
-    DEFINE_PROP_UINT32("priority-num", IbexPlicState, priority_num, 80),
+    DEFINE_PROP_UINT32("priority-base", IbexPlicState, priority_base, 0x30),
+    DEFINE_PROP_UINT32("priority-num", IbexPlicState, priority_num, 177),
 
-    DEFINE_PROP_UINT32("enable-base", IbexPlicState, enable_base, 0x200),
-    DEFINE_PROP_UINT32("enable-num", IbexPlicState, enable_num, 3),
+    DEFINE_PROP_UINT32("enable-base", IbexPlicState, enable_base, 0x300),
+    DEFINE_PROP_UINT32("enable-num", IbexPlicState, enable_num, 6),
 
-    DEFINE_PROP_UINT32("threshold-base", IbexPlicState, threshold_base, 0x20c),
+    DEFINE_PROP_UINT32("threshold-base", IbexPlicState, threshold_base, 0x318),
 
-    DEFINE_PROP_UINT32("claim-base", IbexPlicState, claim_base, 0x210),
+    DEFINE_PROP_UINT32("claim-base", IbexPlicState, claim_base, 0x31c),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index e168bffe69..30dca1ee91 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -149,16 +149,16 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart), 0, memmap[IBEX_DEV_UART].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        0, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_TX_WATERMARK_IRQ));
+                       IBEX_UART0_TX_WATERMARK_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        1, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_RX_WATERMARK_IRQ));
+                       IBEX_UART0_RX_WATERMARK_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        2, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_TX_EMPTY_IRQ));
+                       IBEX_UART0_TX_EMPTY_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        3, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_RX_OVERFLOW_IRQ));
+                       IBEX_UART0_RX_OVERFLOW_IRQ));
 
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
-- 
2.31.0


