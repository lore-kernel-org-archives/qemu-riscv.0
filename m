Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5QlQ-0003Rf-Rt
	for mharc-qemu-riscv@gnu.org; Sun, 17 Mar 2019 04:03:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h5QlO-0003R4-93
	for qemu-riscv@nongnu.org; Sun, 17 Mar 2019 04:03:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h5QlN-0004xv-By
	for qemu-riscv@nongnu.org; Sun, 17 Mar 2019 04:03:22 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41346)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
	id 1h5QlN-0004wf-2E; Sun, 17 Mar 2019 04:03:21 -0400
Received: by mail-pg1-x542.google.com with SMTP id k11so9262831pgb.8;
	Sun, 17 Mar 2019 01:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=uPmO1RMB4c1UjaaaWigMbkBziTHp/iTDV5WO6oALzlU=;
	b=f55KEcZiU/YL9b2zNLvVURJOeHAVBzSDFRe02jOyl966nf8pLqPsE23hl2eB2+yJNf
	RmBqlujaBJ3xoHXA94LFEac+ZE7ljLVDVtNVbaRzFznVYeJf25Yoy8JVq67SePkhEsMd
	ly0wU+yxoQcYJxP1z7vBWRLOXgV6Uu+txZtvMkWkqQEpIMKyD74gDKtzxs5+wuLORdgw
	FIuCHKJBYccv5WIHP/sq5r64HQp2PvmqBD0Z4U4w4W/6JmCCxJVXL8Yw1ZNAhSzBBSNZ
	ATruLriWwy3ihAbyPzwpI0CDUnXw4ohDtnLkn2Df8isDq7rK0hvg6G7Ar5QeRYXc71XK
	Q9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uPmO1RMB4c1UjaaaWigMbkBziTHp/iTDV5WO6oALzlU=;
	b=Kj4fowoo/59jojKu7/PjVMXRzNDJL0ACrQDY8b+VvRR7NhuxfvvHuyZnYPPv7/z0cy
	J6IWgxVmqxN7piI9HwLcuAVDwreV4e413yaomY2qSxMkJLUkq958vOEZK4QLCucB2PpH
	yAQbLpGAxP+fDAVdmKmtxw+4ncGF4TDHN1GBRsqaVCmRzGNP31O643IPbvICC51QCw1O
	MH2sTJ7g76JEQapkDWPfMlp06h9pcDcO0pwIHKXQQB5zVH34Ugnc/pFysO+StgtVv4Jw
	iGdhLZmUja0HivAqrCERJ71JDyAbityuS1WWlkkKbJfMttvVbOVU1kmiuNTiRtn0VgFa
	oP2Q==
X-Gm-Message-State: APjAAAXXzLi8I/LdatNuCxClgwaNw71EnAvXDUp7IyNSK/Qv6qjbwHiH
	VT2Sr1hYiPgKUovHICoISM5v2gbdttc=
X-Google-Smtp-Source: APXvYqxySjflYpo9bqX0x9RIHjGgkXI4RHxdxVMNCdODvGLRmJK62jHAE6DJ8C+uVQBqF6swa/gW8g==
X-Received: by 2002:a62:5142:: with SMTP id f63mr10929744pfb.57.1552809797440; 
	Sun, 17 Mar 2019 01:03:17 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
	[147.11.224.80]) by smtp.gmail.com with ESMTPSA id
	g12sm24897149pfd.72.2019.03.17.01.03.16
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Sun, 17 Mar 2019 01:03:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Date: Sun, 17 Mar 2019 01:03:10 -0700
Message-Id: <1552809791-7714-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PATCH 1/2] riscv: sifive_uart: Generate TX interrupt
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
X-List-Received-Date: Sun, 17 Mar 2019 08:03:23 -0000

At present the sifive uart model only generates RX interrupt. This
updates it to generate TX interrupt so that it is more useful.

Note the TX fifo is still unimplemented.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_uart.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index 456a3d3..3b3f94f 100644
--- a/hw/riscv/sifive_uart.c
+++ b/hw/riscv/sifive_uart.c
@@ -51,7 +51,8 @@ static uint64_t uart_ip(SiFiveUARTState *s)
 static void update_irq(SiFiveUARTState *s)
 {
     int cond = 0;
-    if ((s->ie & SIFIVE_UART_IE_RXWM) && s->rx_fifo_len) {
+    if ((s->ie & SIFIVE_UART_IE_TXWM) ||
+        ((s->ie & SIFIVE_UART_IE_RXWM) && s->rx_fifo_len)) {
         cond = 1;
     }
     if (cond) {
@@ -108,6 +109,7 @@ uart_write(void *opaque, hwaddr addr,
     switch (addr) {
     case SIFIVE_UART_TXFIFO:
         qemu_chr_fe_write(&s->chr, &ch, 1);
+        update_irq(s);
         return;
     case SIFIVE_UART_IE:
         s->ie = val64;
-- 
2.7.4


