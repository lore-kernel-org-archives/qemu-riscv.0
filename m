Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lu8vH-0003ej-Rl
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jun 2021 03:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=79658353d=alistair.francis@wdc.com>)
 id 1lu8vF-0003cd-A5; Fri, 18 Jun 2021 03:28:13 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:17485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=79658353d=alistair.francis@wdc.com>)
 id 1lu8vA-0005rR-1O; Fri, 18 Jun 2021 03:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624001287; x=1655537287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y2Y6FkOU22r3V/yhzReTuiG5g3sBVRF35gXBdNdzRhA=;
 b=P9kKpVup7OhKrnp6giH/4YWe4AmTTOdY4iUaH6bTh58NwBYWZeLCo3Q4
 QRgzS6JpvkZ6Md8E0DR09XuQyw48mR2RsHkZkKBQbzaXdkdnWsPmapvet
 SXDlKd1rAzrNiuarhALbotW5hdQNThKUPaS3fsgLvq6SiAiQqR160O0Ot
 x9Tts5SvJcBfEq0sXX2meTcSwuF7sK5EJk7+ZXwplQh6Uz0FdaSvOa04p
 3WcYfQO/15TJuAAs+y9yzNOIZil0wb+VFobORwsEymk9Cly1hCS+n5OCP
 zDLdKtN3c45HIjPBYoI5qsCytOgEgm46OHqEHt1jltVfCJWeTX7jS7Kv9 g==;
IronPort-SDR: l6x3D51chQF6kd1p9UhjdR3Hmuk34BgAzPjrjFXp1y/jcTTVbI37fXcRlK0DMCfwRaftkC7J1E
 TF8BsD8AGHcRPTOGBJTCVvxD8uw6Ho3aMuo3WI1Yp+bNHgflLymvTx3yaAYxnRvFv7TWuiavtU
 HQZUuuIpB/htGyDbzt8JYP/N6/sGdyu2qNjYwmADhjMhIXyYjV1uuKYGkaA1PF6Miym8DGZysJ
 Owqw+1gE46BAr4ZY/K8Xut+q5AX5y3W63tGexacN+/eHGt8TW/7O9B3W7jpCkuDCM8F7bm0StQ
 xI8=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="172284382"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2021 15:28:04 +0800
IronPort-SDR: FKf1vxai3spgoVNFH8Fh45c2TnTwdOJlhySyps/akNMiKqDpx1BCrFQ0t9fUHceg3VVd6Qp+SV
 fwWFJSo2n4EFF46rGgd3s9XlBPE2HL6FwhNv3clq3TXWGXuwcU/DcK69XOcxn3eMKDZSzKcUK+
 IAMeGQSLGJUG1iCvXkum52qzqW2dslvEdj4xyBhJsZfOgu0qOTZfj6Bq0Wlikgoa3ndYDIcpPo
 xOBAHhm/+AnQVU4HVocnMwQhMRpFDdKAzRmopkJz0ZO7rUCIGYH0pS1y4aD9Z8zTsR9IX3ch0O
 S3Gy+EqinKUZ+L2ne2vTgyTL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 00:05:30 -0700
IronPort-SDR: C6PftyYnw3pcuTEoHRWfe58ZeoEHEarLeNnxLvoFJSdkLcIGZloZpSdBwcrDGaC9/n4Omz5k98
 exJf1g2ECoo1F4tRP6H2j386eF41d2LWvZJTi4kENLG9aoZmGoEr6eXA05BZF54dO3mfofBGRf
 JYLwsAcZYijaF7h/yH7WEib1NM39OnMOR9lI3AGw3IGvw2OqVHxCfn4ZNIK94AKiOnACJy92Yd
 VnSE/CsQfK9kqjqex+jVFVnzgiCWjmU5d703n55dnM4SMzNsKMxm55lKeFdI85waWRxDZDgdLW
 BR4=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.95])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Jun 2021 00:28:02 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 3/3] hw/riscv: OpenTitan: Connect the mtime and mtimecmp
 timer
Date: Fri, 18 Jun 2021 17:28:01 +1000
Message-Id: <5e7f4e9b4537f863bcb8db1264b840b56ef2a929.1624001156.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624001156.git.alistair.francis@wdc.com>
References: <cover.1624001156.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=79658353d=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Fri, 18 Jun 2021 07:28:14 -0000

Connect the Ibex timer to the OpenTitan machine. The timer can trigger
the RISC-V MIE interrupt as well as a custom device interrupt.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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


