Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrd-0004dt-4j
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:21:01 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrZ-0004Y4-GB
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrX-0007yM-1K
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:57 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:38145)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrW-0007pO-IB
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:54 -0500
Received: by mail-qt1-x82e.google.com with SMTP id p17so17844507qtl.5
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=hyFKLTSb77qzNF4QDUUCWeoj0xmol6QqxX9W/65dMcg=;
	b=fuIGjUUqw0KLP4uB7anzMs3S3/rhGpOdJ/d2gei39Bap6iYahZixG540IPwgwcYY55
	6jT/QniPxiSm0cOLgEMfLFO+v2AiDxWL0AxT4SjDcoYXYmOCYAV2IBGl7XYQSt0Zyg7T
	AX86Ob93nWcTuzuiEjqLWpUQrJo0+51DrtjAOgqjNH4JkVEJHC2FBi1QWKd9bYHMRhOv
	bWuW2gSU2u3HgwrWqYqu0VMrAwbDSMvmyjv7CYGg4cw/XS/lDMga8YjnezkdiWEI1Goe
	/r/+CXUqgdNfw2TiOJlSADaenwn4BFcdVw7/X5EcQKAhrVKvyCjJRi+G3dxgUzMXIVyv
	yuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=hyFKLTSb77qzNF4QDUUCWeoj0xmol6QqxX9W/65dMcg=;
	b=l22ZBE+PnsiE6ELI3pqKTYAdRAWfVkNuRd0yVY/nOCm2hwkOo3DMI3mwswQRdOMSeo
	c+jjt6ctAVJ24w0EqYDRr/QfMK14byXlxlWowsfFuoU1S88y7H0Nv8i+vywpR81BEr4V
	l0exqV//fz+vD8h0xbDgVGmXlTHPBTIMSzZT/p14R3pSTkCelInqxj5e0+KpNfTkYlqa
	miKUxbEfNwfV1i1j2UsWHfOinR7ZVgPG5TLhAp1dQvpQbAHR6YWoxCT1FJykJcdFY5Rx
	+h40ayp03RF5iShhuPnC6eZOSLnp2eNF7YAO0viuesAwhj4w1mMwyVCGhJ3vMM9Ziwhx
	L05A==
X-Gm-Message-State: AJcUukcalzSbhLzmbb7tNIWM3Owz/wY2qALB3bKoR0kJ26wLuaF2x6Mv
	igk1BrN68gq/7oq6QDze/CywEG7sTuQ=
X-Google-Smtp-Source: ALg8bN5mO5m36lY8JcuQYa/8aiccuXYELdSgc1FzIC4Jg/asjJpsCWFqpQcXxXtbpQctGNo+f1HG1A==
X-Received: by 2002:a0c:981b:: with SMTP id c27mr20001179qvd.184.1545844833772;
	Wed, 26 Dec 2018 09:20:33 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	q42sm16936317qkh.56.2018.12.26.09.20.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:32 -0800 (PST)
Date: Wed, 26 Dec 2018 09:20:02 -0800
Message-Id: <20181226172005.26990-12-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Nathaniel Graff <nathaniel.graff@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::82e
Subject: [Qemu-riscv] [PULL 11/14] sifive_uart: Implement interrupt pending
 register
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Dec 2018 17:20:59 -0000

From: Nathaniel Graff <nathaniel.graff@sifive.com>

The watermark bits are set in the interrupt pending register according
to the configuration of txcnt and rxcnt in the txctrl and rxctrl
registers.

Since the UART TX does not implement a FIFO, the txwm bit is set as long
as the TX watermark level is greater than zero.

Signed-off-by: Nathaniel Graff <nathaniel.graff@sifive.com>
Reviewed-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_uart.c         | 24 +++++++++++++++++++-----
 include/hw/riscv/sifive_uart.h |  3 +++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index b0c3798cf274..456a3d3697c2 100644
--- a/hw/riscv/sifive_uart.c
+++ b/hw/riscv/sifive_uart.c
@@ -28,12 +28,26 @@
  * Not yet implemented:
  *
  * Transmit FIFO using "qemu/fifo8.h"
- * SIFIVE_UART_IE_TXWM interrupts
- * SIFIVE_UART_IE_RXWM interrupts must honor fifo watermark
- * Rx FIFO watermark interrupt trigger threshold
- * Tx FIFO watermark interrupt trigger threshold.
  */
 
+/* Returns the state of the IP (interrupt pending) register */
+static uint64_t uart_ip(SiFiveUARTState *s)
+{
+    uint64_t ret = 0;
+
+    uint64_t txcnt = SIFIVE_UART_GET_TXCNT(s->txctrl);
+    uint64_t rxcnt = SIFIVE_UART_GET_RXCNT(s->rxctrl);
+
+    if (txcnt != 0) {
+        ret |= SIFIVE_UART_IP_TXWM;
+    }
+    if (s->rx_fifo_len > rxcnt) {
+        ret |= SIFIVE_UART_IP_RXWM;
+    }
+
+    return ret;
+}
+
 static void update_irq(SiFiveUARTState *s)
 {
     int cond = 0;
@@ -69,7 +83,7 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
     case SIFIVE_UART_IE:
         return s->ie;
     case SIFIVE_UART_IP:
-        return s->rx_fifo_len ? SIFIVE_UART_IP_RXWM : 0;
+        return uart_ip(s);
     case SIFIVE_UART_TXCTRL:
         return s->txctrl;
     case SIFIVE_UART_RXCTRL:
diff --git a/include/hw/riscv/sifive_uart.h b/include/hw/riscv/sifive_uart.h
index 504f18a60f1b..c8dc1c57fd0b 100644
--- a/include/hw/riscv/sifive_uart.h
+++ b/include/hw/riscv/sifive_uart.h
@@ -43,6 +43,9 @@ enum {
     SIFIVE_UART_IP_RXWM       = 2  /* Receive watermark interrupt pending */
 };
 
+#define SIFIVE_UART_GET_TXCNT(txctrl)   ((txctrl >> 16) & 0x7)
+#define SIFIVE_UART_GET_RXCNT(rxctrl)   ((rxctrl >> 16) & 0x7)
+
 #define TYPE_SIFIVE_UART "riscv.sifive.uart"
 
 #define SIFIVE_UART(obj) \
-- 
2.18.1


