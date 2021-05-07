Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lf0Sy-00080n-Pu
	for mharc-qemu-riscv@gnu.org; Fri, 07 May 2021 09:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgW-0004Zx-JY; Fri, 07 May 2021 04:18:08 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:50026 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgS-0005jl-7t; Fri, 07 May 2021 04:18:08 -0400
Received: from localhost.localdomain (unknown [121.232.13.213])
 by APP-05 (Coremail) with SMTP id zQCowAB3fSnh9pRgTQ5HAQ--.1834S6;
 Fri, 07 May 2021 16:14:28 +0800 (CST)
From: wangjunqiang <wangjunqiang@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 alapha23@gmail.com, liweiwei@iscas.ac.cn,
 wangjunqiang <wangjunqiang@iscas.ac.cn>
Subject: [RFC PATCH 4/5] hw/char: Add Nuclei Uart
Date: Fri,  7 May 2021 16:16:53 +0800
Message-Id: <20210507081654.11056-5-wangjunqiang@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
References: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
X-CM-TRANSID: zQCowAB3fSnh9pRgTQ5HAQ--.1834S6
X-Coremail-Antispam: 1UD129KBjvJXoWxKF18KrW3GryDAFy3Gry7trb_yoWfWF4kpF
 W5CFy5Ka1UKF13G393Ga17JF4fJF1kAF1DWa4xG3yvvr47Kr40yF92gayavFWDArWfGr45
 AFZxXFWUG3W8XFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I
 8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYyxRDUUUU
X-Originating-IP: [121.232.13.213]
X-CM-SenderInfo: pzdqwy5xqtxt1qj6x2xfdvhtffof0/1tbiCwgOAFz4kC9qzQAAsx
Received-SPF: none client-ip=159.226.251.25;
 envelope-from=wangjunqiang@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 May 2021 09:24:22 -0400
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
X-List-Received-Date: Fri, 07 May 2021 08:18:08 -0000

This patch provides the initial implementation of Nuclei Uart
which is opensource in Nuclei's Hummingbird Project.

Signed-off-by: Wang Junqiang <wangjunqiang@iscas.ac.cn>
---
 hw/char/Kconfig               |   3 +
 hw/char/meson.build           |   1 +
 hw/char/nuclei_uart.c         | 208 ++++++++++++++++++++++++++++++++++
 include/hw/char/nuclei_uart.h |  73 ++++++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 hw/char/nuclei_uart.c
 create mode 100644 include/hw/char/nuclei_uart.h

diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 4cf36ac637..de003d0609 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -67,3 +67,6 @@ config SIFIVE_UART
 
 config GOLDFISH_TTY
     bool
+
+config NUCLEI_UART
+    bool
diff --git a/hw/char/meson.build b/hw/char/meson.build
index da5bb8b762..fd0a0a34f4 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -34,6 +34,7 @@ softmmu_ss.add(when: 'CONFIG_SIFIVE_UART', if_true: files('sifive_uart.c'))
 softmmu_ss.add(when: 'CONFIG_SH_SCI', if_true: files('sh_serial.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
+softmmu_ss.add(when: 'CONFIG_NUCLEI_UART', if_true: files('nuclei_uart.c'))
 
 specific_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
 specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
diff --git a/hw/char/nuclei_uart.c b/hw/char/nuclei_uart.c
new file mode 100644
index 0000000000..0b6bfa33a7
--- /dev/null
+++ b/hw/char/nuclei_uart.c
@@ -0,0 +1,208 @@
+/*
+ *  NUCLEI Hummingbird Evaluation Kit  100T/200T UART interface
+ *
+ * Copyright (c) 2020-2021 PLCT Lab.All rights reserved.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 3 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "hw/sysbus.h"
+#include "chardev/char.h"
+#include "chardev/char-fe.h"
+#include "hw/hw.h"
+#include "hw/irq.h"
+#include "hw/char/nuclei_uart.h"
+
+/*
+ * Not yet implemented:
+ *
+ * Transmit FIFO using "qemu/fifo8.h"
+ */
+static uint64_t uart_ip(NucLeiUARTState *s)
+{
+    uint64_t ret = 0;
+
+    uint64_t txcnt = NUCLEI_UART_GET_TXCNT(s->txctrl);
+    uint64_t rxcnt = NUCLEI_UART_GET_RXCNT(s->rxctrl);
+
+    if (txcnt != 0) {
+        ret |= NUCLEI_UART_IP_TXWM;
+    }
+    if (s->rx_fifo_len > rxcnt) {
+        ret |= NUCLEI_UART_IP_RXWM;
+    }
+
+    return ret;
+}
+
+static void update_irq(NucLeiUARTState *s)
+{
+    int cond = 0;
+    s->txctrl |= 0x1;
+    if (s->rx_fifo_len) {
+        s->rxctrl &= ~0x1;
+    } else {
+        s->rxctrl |= 0x1;
+    }
+
+    if ((s->ie & NUCLEI_UART_IE_TXWM) ||
+        ((s->ie & NUCLEI_UART_IE_RXWM) && s->rx_fifo_len)) {
+        cond = 1;
+    }
+
+    if (cond) {
+        qemu_irq_raise(s->irq);
+    } else {
+        qemu_irq_lower(s->irq);
+    }
+}
+
+static uint64_t
+uart_read(void *opaque, hwaddr offset, unsigned int size)
+{
+    NucLeiUARTState *s = opaque;
+    uint64_t value = 0;
+    uint8_t fifo_val;
+
+    switch (offset) {
+    case NUCLEI_UART_REG_TXDATA:
+        return 0;
+    case NUCLEI_UART_REG_RXDATA:
+        if (s->rx_fifo_len) {
+            fifo_val = s->rx_fifo[0];
+            memmove(s->rx_fifo, s->rx_fifo + 1, s->rx_fifo_len - 1);
+            s->rx_fifo_len--;
+            qemu_chr_fe_accept_input(&s->chr);
+            update_irq(s);
+            return fifo_val;
+        }
+        return 0x80000000;
+    case NUCLEI_UART_REG_TXCTRL:
+        value = s->txctrl;
+        break;
+    case NUCLEI_UART_REG_RXCTRL:
+        value = s->rxctrl;
+        break;
+    case NUCLEI_UART_REG_IE:
+        value = s->ie;
+        break;
+    case NUCLEI_UART_REG_IP:
+        value = uart_ip(s);
+        break;
+    case NUCLEI_UART_REG_DIV:
+        value = s->div;
+        break;
+    default:
+        break;
+    }
+    return value;
+}
+
+static void
+uart_write(void *opaque, hwaddr offset,
+           uint64_t value, unsigned int size)
+{
+    NucLeiUARTState *s = opaque;
+    unsigned char ch = value;
+
+    switch (offset) {
+    case NUCLEI_UART_REG_TXDATA:
+        qemu_chr_fe_write(&s->chr, &ch, 1);
+        update_irq(s);
+        break;
+    case NUCLEI_UART_REG_TXCTRL:
+        s->txctrl = value;
+        break;
+    case NUCLEI_UART_REG_RXCTRL:
+        s->rxctrl = value;
+        break;
+    case NUCLEI_UART_REG_IE:
+        s->ie = value;
+        update_irq(s);
+        break;
+    case NUCLEI_UART_REG_IP:
+        s->ip = value;
+        break;
+    case NUCLEI_UART_REG_DIV:
+        s->div = value;
+        break;
+    default:
+        break;
+    }
+}
+
+static const MemoryRegionOps uart_ops = {
+    .read = uart_read,
+    .write = uart_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+        }
+};
+
+static void uart_rx(void *opaque, const uint8_t *buf, int size)
+{
+    NucLeiUARTState *s = opaque;
+
+    /* Got a byte.  */
+    if (s->rx_fifo_len >= sizeof(s->rx_fifo)) {
+        printf("WARNING: UART dropped char.\n");
+        return;
+    }
+    s->rx_fifo[s->rx_fifo_len++] = *buf;
+
+    update_irq(s);
+}
+
+static int uart_can_rx(void *opaque)
+{
+    NucLeiUARTState *s = opaque;
+    return s->rx_fifo_len < sizeof(s->rx_fifo);
+}
+
+static void uart_event(void *opaque, QEMUChrEvent event)
+{
+}
+
+static int uart_be_change(void *opaque)
+{
+    NucLeiUARTState *s = opaque;
+
+    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
+                             uart_be_change, s, NULL, true);
+
+    return 0;
+}
+
+/*
+ * Create UART device.
+ */
+NucLeiUARTState *nuclei_uart_create(MemoryRegion *address_space,
+                    hwaddr base, uint64_t size, Chardev *chr, qemu_irq irq)
+{
+    NucLeiUARTState *s = g_malloc0(sizeof(NucLeiUARTState));
+    s->irq = irq;
+    qemu_chr_fe_init(&s->chr, chr, &error_abort);
+    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
+                             uart_be_change, s, NULL, true);
+    memory_region_init_io(&s->mmio, NULL, &uart_ops, s,
+                          TYPE_NUCLEI_UART, size);
+    memory_region_add_subregion(address_space, base, &s->mmio);
+
+    return s;
+}
diff --git a/include/hw/char/nuclei_uart.h b/include/hw/char/nuclei_uart.h
new file mode 100644
index 0000000000..a7f2c72fb7
--- /dev/null
+++ b/include/hw/char/nuclei_uart.h
@@ -0,0 +1,73 @@
+/*
+ *  NUCLEI Hummingbird Evaluation Kit  100T/200T UART interface
+ *
+ * Copyright (c) 2020-2021 PLCT Lab.All rights reserved.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 3 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_NUCLEI_UART_H
+#define HW_NUCLEI_UART_H
+
+#include "chardev/char-fe.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+
+#define TYPE_NUCLEI_UART "riscv.nuclei.uart"
+OBJECT_DECLARE_SIMPLE_TYPE(NucLeiUARTState, NUCLEI_UART)
+
+#define NUCLEI_UART_REG_TXDATA 0x000
+#define NUCLEI_UART_REG_RXDATA 0x004
+#define NUCLEI_UART_REG_TXCTRL 0x008
+#define NUCLEI_UART_REG_RXCTRL 0x00C
+#define NUCLEI_UART_REG_IE     0x010
+#define NUCLEI_UART_REG_IP     0x014
+#define NUCLEI_UART_REG_DIV    0x018
+
+#define NUCLEI_UART_GET_TXCNT(txctrl) (txctrl & 0x1)
+#define NUCLEI_UART_GET_RXCNT(rxctrl) (rxctrl & 0x1)
+
+enum {
+    NUCLEI_UART_IE_TXWM = 1, /* Transmit watermark interrupt enable */
+    NUCLEI_UART_IE_RXWM = 2  /* Receive watermark interrupt enable */
+};
+
+enum {
+    NUCLEI_UART_IP_TXWM = 1, /* Transmit watermark interrupt pending */
+    NUCLEI_UART_IP_RXWM = 2  /* Receive watermark interrupt pending */
+};
+
+typedef struct NucLeiUARTState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    qemu_irq irq;
+    MemoryRegion mmio;
+    CharBackend chr;
+    uint8_t rx_fifo[8];
+    unsigned int rx_fifo_len;
+
+    uint32_t txdata;
+    uint32_t rxdata;
+    uint32_t txctrl;
+    uint32_t rxctrl;
+    uint32_t ie;
+    uint32_t ip;
+    uint32_t div;
+} NucLeiUARTState;
+
+NucLeiUARTState *nuclei_uart_create(MemoryRegion *address_space,
+                    hwaddr base, uint64_t size, Chardev *chr, qemu_irq irq);
+#endif
-- 
2.17.1


