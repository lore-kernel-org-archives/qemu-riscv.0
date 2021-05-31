Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnZcp-0003zd-VH
	for mharc-qemu-riscv@gnu.org; Mon, 31 May 2021 00:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=778d471cf=alistair.francis@wdc.com>)
 id 1lnZco-0003vF-9V; Mon, 31 May 2021 00:34:02 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=778d471cf=alistair.francis@wdc.com>)
 id 1lnZcl-0002VK-1C; Mon, 31 May 2021 00:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622435639; x=1653971639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q9pHcvED0Oywp8QttAtL6iUyqk1/Ov2XIhKBMD+PYUU=;
 b=i5IvVVl55XA3yJJWa1wkme+LaN2sgd3vHSz1LBtH0XCEBe60YTBOrFlu
 EAmme7UjeH7Hf3zqCIrmehoz1/995QVA29yPYXdlM+ku1lBktpvTF9zS0
 BnolIspmuPGmruSRNttHzEOLCnyaxPmIxe/XyDZ0au9aqgp+IjV53joTu
 Ntv8aEf7i9j5xnIKO/LAIYrPTrgm1ABdzWUGkpE2pTGFt2ckbbcXTRJmz
 GTp1/Lu+ROfMAiAZwYzYMMxYdRqgIlsRi/sF7d3ZZtMf8UgLhB+bQe5Qi
 xzqIgHO7OEmjPvqGPvC81hW1CuNjw0fDkJ6Znf760VnxVED1ITCugdQAj g==;
IronPort-SDR: sTfqZE5I40e8hpt2/bZx0Rs0//m3rHWzW0Jz0X+Vs6/izFsotFW7u1zhD9xS9EB2oPWaRVpsek
 Sl7E3z+MLuicbBshzAyXoyMj1KAt67jjKufINYb+ZNl1RWWkDsKxaqKver9ZPLkgzUSzJlWA2y
 nDGSFjQZ6lC/l3w3qmI829wdqu0mFnwERLGduL1MF7Fwrr8t5XoCep+zMk2wrUVKH5i9aY/GXq
 no4hggPDSmefoXbLaKvf2r/itQTsauK1KY8o4VmuFRr6NZoAaxyO8AO7NTevGmsXeQ2OZLe9xD
 5mQ=
X-IronPort-AV: E=Sophos;i="5.83,236,1616428800"; d="scan'208";a="169414604"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2021 12:33:55 +0800
IronPort-SDR: WyQRQS5PH9sc18xwWkn+KKmyE6HMieLJQvTUOG8vjuNb2zelyUDjnnDti4FnM5LMITkzUwd6Fx
 Y1hdPMqkr7hXXWzkgHSbOXArVaC2cIGTekDVAON4HBMVzlj5T4Vs5iz78RilIuG+oF7jeM/gKt
 h1gb+ICL3jxCzF2Cdz5s7gtHBEfOLAG4H52g1UNElYnUuk4PE3teikW9UYRm3rv8Yxq8zwJZJ/
 3NCBzjc0mkwq+pSTv5O9Ev3yLpDKsNcEWkvf/38kbYr10IgOBE/dUFSFb/aMWSKH48BVsCtuWD
 scS9BcZQ+hddjp0XsPqu6g2/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2021 21:11:52 -0700
IronPort-SDR: vO1YbsPDAVZyqKyIvEp4W2otUV7i/ZLMv/G9TGeG2Wvl/P1PKfLiFSKcxoaISZc4P4vWCWl3qb
 hfeCKqkghBKhXWEknrycY3nr2f3xgFGDg08/aqut+Hteo34QvkXU35mv5dhqieHrMStsrIjz9G
 AA8vO+9tnOcyvku3kNDFotP6v24h/p+E35UAjMhgQv9kAveBokGWmHi2dE/9xsMOrgrCDqvtB0
 S74wto+ocnEVkrsUeRQvjiUu3z6ugPQU6UE2PzkisHox9KaEMGLUQE0Ks7KV/y0UezqUdp3wWn
 YM8=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.65])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 May 2021 21:33:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 3/3] hw/riscv: OpenTitan: Connect the mtime and mtimecmp
 timer
Date: Mon, 31 May 2021 14:33:51 +1000
Message-Id: <326d5fa6a311684be25803d4676690e4f60fe24c.1622435529.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622435529.git.alistair.francis@wdc.com>
References: <cover.1622435529.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=778d471cf=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Mon, 31 May 2021 04:34:03 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h |  5 ++++-
 hw/riscv/opentitan.c         | 14 +++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index aab9bc9245..86cceef698 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -22,6 +22,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/intc/ibex_plic.h"
 #include "hw/char/ibex_uart.h"
+#include "hw/timer/ibex_timer.h"
 #include "qom/object.h"
 
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
@@ -35,6 +36,7 @@ struct LowRISCIbexSoCState {
     RISCVHartArrayState cpus;
     IbexPlicState plic;
     IbexUartState uart;
+    IbexTimerState timer;
 
     MemoryRegion flash_mem;
     MemoryRegion rom;
@@ -57,7 +59,7 @@ enum {
     IBEX_DEV_SPI,
     IBEX_DEV_I2C,
     IBEX_DEV_PATTGEN,
-    IBEX_DEV_RV_TIMER,
+    IBEX_DEV_TIMER,
     IBEX_DEV_SENSOR_CTRL,
     IBEX_DEV_OTP_CTRL,
     IBEX_DEV_PWRMGR,
@@ -82,6 +84,7 @@ enum {
 };
 
 enum {
+    IBEX_TIMER_TIMEREXPIRED0_0 = 125,
     IBEX_UART0_RX_PARITY_ERR_IRQ = 8,
     IBEX_UART0_RX_TIMEOUT_IRQ = 7,
     IBEX_UART0_RX_BREAK_ERR_IRQ = 6,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 7545dcda9c..c5a7e3bacb 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -36,7 +36,7 @@ static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_SPI] =            {  0x40050000,  0x1000  },
     [IBEX_DEV_I2C] =            {  0x40080000,  0x1000  },
     [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x1000  },
-    [IBEX_DEV_RV_TIMER] =       {  0x40100000,  0x1000  },
+    [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
     [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x1000  },
@@ -106,6 +106,8 @@ static void lowrisc_ibex_soc_init(Object *obj)
     object_initialize_child(obj, "plic", &s->plic, TYPE_IBEX_PLIC);
 
     object_initialize_child(obj, "uart", &s->uart, TYPE_IBEX_UART);
+
+    object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
 }
 
 static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -159,6 +161,14 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                        3, qdev_get_gpio_in(DEVICE(&s->plic),
                        IBEX_UART0_RX_OVERFLOW_IRQ));
 
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer), 0, memmap[IBEX_DEV_TIMER].base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer),
+                       0, qdev_get_gpio_in(DEVICE(&s->plic),
+                       IBEX_TIMER_TIMEREXPIRED0_0));
+
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
     create_unimplemented_device("riscv.lowrisc.ibex.spi",
@@ -167,8 +177,6 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
     create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
         memmap[IBEX_DEV_PATTGEN].base, memmap[IBEX_DEV_PATTGEN].size);
-    create_unimplemented_device("riscv.lowrisc.ibex.rv_timer",
-        memmap[IBEX_DEV_RV_TIMER].base, memmap[IBEX_DEV_RV_TIMER].size);
     create_unimplemented_device("riscv.lowrisc.ibex.sensor_ctrl",
         memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].size);
     create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",
-- 
2.31.1


