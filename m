Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6ETs-0007VU-6w
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6ETq-0006q3-EG
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGo-0005V4-AE
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:55:06 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGo-0005Up-4j
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:55:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h8so13785880pgp.6
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=1SyDM/qdCRzCh+lWvsUL7MN72la+HsLqQuB53k1Hdyg=;
	b=NAWCCyAe/IdX+dP98ANB1jmV7ooHKAjJwAecUEFlN6ADPgK3IX+NGxl9BS6NyDN3pT
	zvzd8Cl7riORZ7OXtkLL41PUzgONIuZ8quJUA3RZbgzSyGdvhE72ALuQoSbL7+3bPZt6
	E/yvhoeJUY8hcC0LZmXFja5gFERyKq9MYMfUiyrjVJBifXEyIZQWQ6LrOj6pDuK2p1y1
	/QfvwoWKqNU/ldwS3mwReE0O1DRwYgRHFudsa6aV0jGwz0gAj6HT4+vUhG0DZyQTnJuD
	QCvaD4sEm9aLcPlHWu5gHO+PsTly53QojT4bcpVH2zLkBzdbfrP47K4YvlES8JUisl/0
	zo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=1SyDM/qdCRzCh+lWvsUL7MN72la+HsLqQuB53k1Hdyg=;
	b=f5mVSGQj4t7rf8pXjDSkCMZUt0ppAFA9v5RIbQrj9LHTurk87a9R2xYwV7K4+EG72u
	xtv/JRiRnpbrgnGCFyZsum9GXlkitXnsTRUZIl0edIvrOfWGjB46CdMVB9m6XW8Sz6ev
	P8LB9DaOCWpO05K2W1qGJVu/WLh9Q+zZqD6fpwNXQU7ekYkb1ffiY8+2vrs9mRQwGqpr
	qf3tPTzGDfhlgdBPNf7gpJq8GICK597//vbQO8QSqZ5XRShr21orjXfqMonFoD8WjPYO
	lVfn30K/pZyHfv2l65UcQzckAAdnthxTEDxV/EIBl8fe8LWECzl71r5dkKmElaiBHW9D
	/jyQ==
X-Gm-Message-State: APjAAAU9ryHFgDW+3Ah2wmy0w9ZZuX/Gb8zDppj6MKfR3Qlrbhmjtu6/
	SQMAKCtfKP8nsd0572XyJyl89lf8M5HzLPu7
X-Google-Smtp-Source: APXvYqxo1rJUcXqBv2T4il4+8LrruGaf7qN1Z0LIh3IHHYruJKyDLBH2L9ejuPiORV4ETLEfiRSq0w==
X-Received: by 2002:a63:ff0f:: with SMTP id k15mr2156159pgi.301.1553000105014; 
	Tue, 19 Mar 2019 05:55:05 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	c130sm22896821pfb.145.2019.03.19.05.55.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:55:04 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:48:02 -0700
Message-Id: <20190319124803.13826-19-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52b
Subject: [Qemu-riscv] [PULL 18/19] riscv: sifive_uart: Generate TX interrupt
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:35 -0000

From: Bin Meng <bmeng.cn@gmail.com>

At present the sifive uart model only generates RX interrupt. This
updates it to generate TX interrupt so that it is more useful.

Note the TX fifo is still unimplemented.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_uart.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index 456a3d3697c2..3b3f94f51ddf 100644
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
2.19.2


