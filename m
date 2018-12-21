Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNHT-0001iS-1A
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:04:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHN-0001eA-Pg
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHM-0004DX-Rt
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:01 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:41493)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNHM-0004AF-Gz
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:00 -0500
Received: by mail-qt1-x82b.google.com with SMTP id l12so6164386qtf.8
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=hyFKLTSb77qzNF4QDUUCWeoj0xmol6QqxX9W/65dMcg=;
	b=cmKgD5s+f5bVxuLUuh7EuY60IzmrE9pvrF84eCGsP3/vVsoKidQIcT8Alf+OufTkuI
	Ev1eNrZA1wM0tKxMDi1VexWlBzaj//4DMEqx/hHKMELtlDDNqhMKqfwvCdWJtC79oEO0
	RWaH+vUYYJMmgpMf8v/UwY2mAJlbl+VJ/2yxhgHr4g4A0QCtnzp0tLXj8Ltt7mDYGBJV
	2KRZXLoqFffLrpnikRss2O7kZN8nC8UdqpBuTclciXSqLSxEHX9xaO+0WuXewrpvxXif
	4LO4f5ZSgKtNBE9vKFEh+9VhaPNQbZ5vXfNQel4D+5P3ZKtViSINmu7mWCv4kn1CU9eA
	QsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=hyFKLTSb77qzNF4QDUUCWeoj0xmol6QqxX9W/65dMcg=;
	b=fvLNq3e9vXOu7XNDNsvV+wlD7dRrQrbnEvIEtCGOLIsLVb6OEJJoQ0TEqQuJQAL1B+
	n6VSzCZhmBziqI5Qrf6QbqESMCCEcmIXnbASRBJIpBWw40cg9xs/sZfcAbY5skxAtYrh
	rLZ2u8kFRUuIRIQTH734tPaR6N4qzEPuv7GMyaP/IYuZHih9ushkuVf0AHyh19t5IHgA
	RrnWcrkfORDeQGOgYi2iImZhz2BsGsqUGVSAacuCF85ISjen1Kk1vzBMpeO1KHfXr0dO
	YEPvRkVqszg6g/TWUcfQMhQCClmCO+Djkg5AJ6VCDwTfXnVgnNHEeLP86lj0MhC7SxlZ
	3UYw==
X-Gm-Message-State: AJcUukebpJNe8JUlmSlJR8ZqptiCc05cGJRBOzZL2JgpWivLnEd2lkcj
	X1DBD55M692S1s1To09jE2NdCg==
X-Google-Smtp-Source: ALg8bN7Xmi20i6LsBDMgJx35Ss2FJURaPJvGL6q3K2AOVUS22dXPdHQzx6lyPcIYmPubppIdQrwD7g==
X-Received: by 2002:a0c:b61b:: with SMTP id f27mr2961031qve.174.1545408233057; 
	Fri, 21 Dec 2018 08:03:53 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id 86sm6419107qky.92.2018.12.21.08.03.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:52 -0800 (PST)
Date: Fri, 21 Dec 2018 08:03:04 -0800
Message-Id: <20181221160307.14819-12-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Nathaniel Graff <nathaniel.graff@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::82b
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
X-List-Received-Date: Fri, 21 Dec 2018 16:04:02 -0000

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


