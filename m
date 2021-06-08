Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqlTc-0005de-Fg
	for mharc-qemu-riscv@gnu.org; Tue, 08 Jun 2021 19:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqlTa-0005ZG-Am; Tue, 08 Jun 2021 19:49:42 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:21951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqlTY-0001ak-DP; Tue, 08 Jun 2021 19:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623196179; x=1654732179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xTEoGHLr1Z95aPHndo9ofnAcrSBmjpwgE+iOVm8LAJE=;
 b=TmkbqXs4tMq8Df6MgjL/Gb7ek3P5Bk+HWE4dE//zoqnCdxSxZWyAfzO7
 X/vyM5BfeNwG16dXViQtW0YVaJkZdxYw9WRtqBlO/D9+/GZHosjxiHb+f
 N5+8NSQkwmUQeSfU0wbTeYC6PoBYIoJsK6BdTpoTmuz3yPuNBqRyLaB/b
 Q/hnZYh5QL2mzDNRUFF2rOz2XrHOoDEgA6xQvVIIMYTDwVrp2hHblzLKW
 FXitBq//xY1YuqgbyO/zD/dn5xgrJTkk7HVqW6JXRhUK6hNMVlSz7A8Rf
 0AyhtevdWlMiXt8a1lRe1LHAai/vNHte7Vz02IuIDHoApmsAgOHmTfzrO A==;
IronPort-SDR: 32LuroljRxZ4RKhIJTYwF8fIgk+ftS0mmGOKpKAHhtAOk90K8cALtKc5jAfzxVPb4XuP8sH9YK
 k5ahEgDMvw7/TU5EOoCarLngwYzCyHIDhAmOLt7WmB9wIRGeLzyzG5KthNCrvhDWmxWWZVkHQN
 CmXEmcln9HKw778LYtXv6e9O0Q09ncR40fFft2DHwRhQUTdpsE6PQlWkLjwrq8e4h/9o7JTwxM
 WW68/qw3vO0KeakC7shipa4uJn5T50u0I/Hb4mZM9CvS56iiKDE3zHFzCyN3r2HNKpCdJdYSrC
 dMI=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; d="scan'208";a="175980866"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 07:49:37 +0800
IronPort-SDR: QWhWnVf5BPSQClHE41rQ1ZRmwL1RQS17yEA3znSDgWgfaCF/GsztEts3X+FCDTLuNe0PYoxG51
 cOjVIruZBYLy6d84AUVzXHUKqxJa8xzQfmVcP6Z7cSdu1gyICc3cf1fo6fs35/ay0pU+nhC7z9
 VIUj52K8iHEo17trP/H/Vbc80YQcFN9AKFu5GnySiwQtzXwy54zBNFW0Da9cYXEA7KfFzdBvvx
 G+E5ErzpgiBCm3tWfHKbU81zDKnP4+XPVb9I4adUe1i6Ood8C3BwX2i/GH7JxlfjHxn5qa4ewQ
 GRPz8Y4GBhuFj+k+p2fWqnKW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 16:28:43 -0700
IronPort-SDR: kgW75y2gBwWLsnIc45LXD9Qp3WbZqCGm8WgquTWC7rnQ2LlLfCqpAzs2ELhrtcnOAtX8sgVnnD
 urOvprI6HaaPIgno5/WsFyAZdAHT62Q9HMc37yx3BS5kx9727aA+q0wx/EWF7+9TNkZ2jVlp2M
 9tXUaquOuMkBFejiqKJsx3Bzhin2nNs1Rb8d1rkhV+NDuXwdb9wwMlivHii3aD+wOXv2Pf7Zow
 x6s4Fq4RtURml3fw4bhsJNCSCLVcZs0XI+ZCtcdmtxV6Y+c3BGX8JtJjOacH4wD4d/GxuEvlq7
 /eU=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.83])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jun 2021 16:49:35 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 3/3] hw/riscv: OpenTitan: Connect the mtime and mtimecmp
 timer
Date: Wed,  9 Jun 2021 09:49:17 +1000
Message-Id: <0f539904158bfd88ac0aa5d604d07df41ce8be60.1623196022.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623196022.git.alistair.francis@wdc.com>
References: <cover.1623196022.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Tue, 08 Jun 2021 23:49:42 -0000

Connect the Ibex timer to the OpenTitan machine. The timer can trigger
the RISC-V MIE interrupt as well as a custom device interrupt.

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


