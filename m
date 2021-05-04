Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldxzE-0001BK-Fx
	for mharc-qemu-riscv@gnu.org; Tue, 04 May 2021 12:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1ldx5L-0008W3-OU; Tue, 04 May 2021 11:35:43 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:43534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1ldx53-0004PP-OW; Tue, 04 May 2021 11:35:43 -0400
Received: from cygnus.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id C32662076C;
 Tue,  4 May 2021 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620142523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GItDIgX5IxHTLGTu4YPKLRMhwzCW6SKSzwAheXo2OwM=;
 b=vemSBEqExjrwR8KspH2dXb8+peFkCcxgOf4CmzUlBF6YShrN89xTDPNeyBOaasZFL7BxTX
 5WTNrcxtKiluLOxvYuq0V6S4lGe6Xjj40zXijiR79zZQt9wuI3Pq2WCj4SDdKs9es6rJNz
 l7AlKXvgywmloSBmhn3nh0KBKBp2Rdk=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 luc.michel@greensocs.com, mark.burton@greensocs.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
Subject: [PATCH 1/2] Consistent function names for sifive uart read and write
 function
Date: Tue,  4 May 2021 17:34:55 +0200
Message-Id: <20210504153456.927083-2-lukas.juenger@greensocs.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504153456.927083-1-lukas.juenger@greensocs.com>
References: <20210504153456.927083-1-lukas.juenger@greensocs.com>
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
X-Mailman-Approved-At: Tue, 04 May 2021 12:33:06 -0400
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
X-List-Received-Date: Tue, 04 May 2021 15:35:44 -0000

Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>
---
 hw/char/sifive_uart.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 3a00ba7f00..cb70374ead 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -65,7 +65,7 @@ static void update_irq(SiFiveUARTState *s)
 }
 
 static uint64_t
-uart_read(void *opaque, hwaddr addr, unsigned int size)
+sifive_uart_read(void *opaque, hwaddr addr, unsigned int size)
 {
     SiFiveUARTState *s = opaque;
     unsigned char r;
@@ -101,8 +101,8 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
 }
 
 static void
-uart_write(void *opaque, hwaddr addr,
-           uint64_t val64, unsigned int size)
+sifive_uart_write(void *opaque, hwaddr addr,
+                  uint64_t val64, unsigned int size)
 {
     SiFiveUARTState *s = opaque;
     uint32_t value = val64;
@@ -131,9 +131,9 @@ uart_write(void *opaque, hwaddr addr,
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
@@ -187,7 +187,7 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
     qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
         uart_be_change, s, NULL, true);
-    memory_region_init_io(&s->mmio, NULL, &uart_ops, s,
+    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
                           TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
     memory_region_add_subregion(address_space, base, &s->mmio);
     return s;
-- 
2.30.2


