Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnJ0s-0002Js-Cx
	for mharc-qemu-riscv@gnu.org; Sun, 30 May 2021 06:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1lnJ0p-0002IP-0T; Sun, 30 May 2021 06:49:43 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:35090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1lnJ0m-0001LE-NM; Sun, 30 May 2021 06:49:42 -0400
Received: from fornax.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id D9C7C2078C;
 Sun, 30 May 2021 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1622371774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpmDxxxQw54UxyXP00z4yoCWjDmkpwmExjscuG+5mrs=;
 b=MPmzk2ksuOHEgzKtmZoaAAIGm7kDg3riUQUGQYeeY4UUdWcKT9l95eN+XJtDMeDIprR4zo
 DHA+/WdLj42bKcOv4Mp+IGj/iucOdIspx4O1XeaVzdkzbXbRxgM5p6ajBew5+P3MWh82bS
 nAWitSmMA2WlGlWnUyCSlBc5NF46e6I=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 luc.michel@greensocs.com, mark.burton@greensocs.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
Subject: [PATCH v2 1/2] hw/char: sifive_uart
Date: Sun, 30 May 2021 12:49:21 +0200
Message-Id: <20210530104922.466175-2-lukas.juenger@greensocs.com>
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
X-List-Received-Date: Sun, 30 May 2021 10:49:43 -0000

Make function names consistent

Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>
---
 hw/char/sifive_uart.c | 44 +++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index fe12666789..101d68d8cf 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -31,7 +31,7 @@
  */
 
 /* Returns the state of the IP (interrupt pending) register */
-static uint64_t uart_ip(SiFiveUARTState *s)
+static uint64_t sifive_uart_ip(SiFiveUARTState *s)
 {
     uint64_t ret = 0;
 
@@ -48,7 +48,7 @@ static uint64_t uart_ip(SiFiveUARTState *s)
     return ret;
 }
 
-static void update_irq(SiFiveUARTState *s)
+static void sifive_uart_update_irq(SiFiveUARTState *s)
 {
     int cond = 0;
     if ((s->ie & SIFIVE_UART_IE_TXWM) ||
@@ -63,7 +63,7 @@ static void update_irq(SiFiveUARTState *s)
 }
 
 static uint64_t
-uart_read(void *opaque, hwaddr addr, unsigned int size)
+sifive_uart_read(void *opaque, hwaddr addr, unsigned int size)
 {
     SiFiveUARTState *s = opaque;
     unsigned char r;
@@ -74,7 +74,7 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
             memmove(s->rx_fifo, s->rx_fifo + 1, s->rx_fifo_len - 1);
             s->rx_fifo_len--;
             qemu_chr_fe_accept_input(&s->chr);
-            update_irq(s);
+            sifive_uart_update_irq(s);
             return r;
         }
         return 0x80000000;
@@ -84,7 +84,7 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
     case SIFIVE_UART_IE:
         return s->ie;
     case SIFIVE_UART_IP:
-        return uart_ip(s);
+        return sifive_uart_ip(s);
     case SIFIVE_UART_TXCTRL:
         return s->txctrl;
     case SIFIVE_UART_RXCTRL:
@@ -99,8 +99,8 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
 }
 
 static void
-uart_write(void *opaque, hwaddr addr,
-           uint64_t val64, unsigned int size)
+sifive_uart_write(void *opaque, hwaddr addr,
+                  uint64_t val64, unsigned int size)
 {
     SiFiveUARTState *s = opaque;
     uint32_t value = val64;
@@ -109,11 +109,11 @@ uart_write(void *opaque, hwaddr addr,
     switch (addr) {
     case SIFIVE_UART_TXFIFO:
         qemu_chr_fe_write(&s->chr, &ch, 1);
-        update_irq(s);
+        sifive_uart_update_irq(s);
         return;
     case SIFIVE_UART_IE:
         s->ie = val64;
-        update_irq(s);
+        sifive_uart_update_irq(s);
         return;
     case SIFIVE_UART_TXCTRL:
         s->txctrl = val64;
@@ -129,9 +129,9 @@ uart_write(void *opaque, hwaddr addr,
                   __func__, (int)addr, (int)value);
 }
 
-static const MemoryRegionOps uart_ops = {
-    .read = uart_read,
-    .write = uart_write,
+static const MemoryRegionOps sifive_uart_ops = {
+    .read = sifive_uart_read,
+    .write = sifive_uart_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .min_access_size = 4,
@@ -139,7 +139,7 @@ static const MemoryRegionOps uart_ops = {
     }
 };
 
-static void uart_rx(void *opaque, const uint8_t *buf, int size)
+static void sifive_uart_rx(void *opaque, const uint8_t *buf, int size)
 {
     SiFiveUARTState *s = opaque;
 
@@ -150,26 +150,26 @@ static void uart_rx(void *opaque, const uint8_t *buf, int size)
     }
     s->rx_fifo[s->rx_fifo_len++] = *buf;
 
-    update_irq(s);
+    sifive_uart_update_irq(s);
 }
 
-static int uart_can_rx(void *opaque)
+static int sifive_uart_can_rx(void *opaque)
 {
     SiFiveUARTState *s = opaque;
 
     return s->rx_fifo_len < sizeof(s->rx_fifo);
 }
 
-static void uart_event(void *opaque, QEMUChrEvent event)
+static void sifive_uart_event(void *opaque, QEMUChrEvent event)
 {
 }
 
-static int uart_be_change(void *opaque)
+static int sifive_uart_be_change(void *opaque)
 {
     SiFiveUARTState *s = opaque;
 
-    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
-        uart_be_change, s, NULL, true);
+    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
+            sifive_uart_event, sifive_uart_be_change, s, NULL, true);
 
     return 0;
 }
@@ -183,9 +183,9 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
     SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
     s->irq = irq;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
-        uart_be_change, s, NULL, true);
-    memory_region_init_io(&s->mmio, NULL, &uart_ops, s,
+    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx,
+            sifive_uart_event, sifive_uart_be_change, s, NULL, true);
+    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
                           TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
     memory_region_add_subregion(address_space, base, &s->mmio);
     return s;
-- 
2.31.1


