Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D3BCAC58E
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 16:07:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uwjpC-00058q-F8; Thu, 11 Sep 2025 12:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uwjp5-00056J-Hf
 for qemu-riscv@nongnu.org; Thu, 11 Sep 2025 12:07:00 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uwjp3-00068u-K8
 for qemu-riscv@nongnu.org; Thu, 11 Sep 2025 12:06:59 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b4e84a61055so647127a12.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Sep 2025 09:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757606816; x=1758211616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nZFC+ElBJPA1AjpB7Nc8nsuONRYfUOZ2+Qi69XrYzlo=;
 b=T8IPqNFVYH2c9c6igwPOIr09pj5mLTPwAZ5AerXgLqZ64kO2w2YfJpPIA47Tw5h77t
 ATufqBIfxaD3alcYgybbOIZ1+OhjBcrDr9o7JtOuV2sThvXT+R1ktSOo6v0N2XDrGsrp
 Y3eZIIMUa0REYdZvMLTn8+S8Q0+HuN7JajAXndgvGDZdnUdnjSJzoC+Jtp+BzChCk5/T
 q9DELiCKxqRJMBLBr3srlF5J1iQfSHuLuQ8LlHpxLT4D0cr/ggwQn7XWiMczra7vdGQH
 8q8vZ59JYmCVC3NwzgBuTq7+ZnZmYQmWgcMTKRtYJwyZam1LzpQiuFkhnQxVNNs2QEd3
 HUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757606816; x=1758211616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nZFC+ElBJPA1AjpB7Nc8nsuONRYfUOZ2+Qi69XrYzlo=;
 b=tOiOn4lCxC/n6+NtldGARQRgNZKCeCcuXk8Tns68Y7m0lywkQn2POPhNcCg3N05PB6
 PTSry7uPAK4RkSh4iWehV20Dyf3kNiiN96raNWr9oDy1JwTBJ8K4/XjBzQOqqFpZFvxj
 SuOXJm/OofrTe3hQcmkXjmEbgAJI93QsmvF3BMvSZ1SozSMSQpzGcBDjtgAzr4NuDy05
 qUq3ajm6yQmOIGo2b5yYVqt2oFTJvtf/VaLEGBts/kOQr/WHdRtnPp13F/64Rt9r3YO0
 Ij+wa1phU+xCRZfilj6iezYcvu8Nl07Rwm72RZhMaIQQaBSuRlXK51/+74tGk59lTb/Q
 6jcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUAYkv8uNs+DKHJxDKWtnky5k+JwBbSNgRPF6kwhSgTe21FpxXELRvMOMrGXQZL1maKk0Fv2lgTjDb@nongnu.org
X-Gm-Message-State: AOJu0YxFGAwrw2CeMjBE+uN1XTysnZoU0J1LGmmebHX9gxA3P8GWnPk6
 y/dPYaf1iT7JlM1rqjVOBPHSirJeWjfFn0aYbpZh62jzVjX+vTvttu7E7/5YTvdPI4M=
X-Gm-Gg: ASbGncuBN1rewJCtFmibwFCPqYlyZHnvRxK6bUoNBPa5LkALltTGAqHV9vQ9JlalGfb
 K4W1D+0+gdgvzN+WSC2Y4aZc6+PULbXiB+y+fGFsZ850exozTjuvA4q9KuxDbKcpLmIyqNm78uw
 /P/a+IWvASGN+o7Pu9sgNmJFhiMzuANLpzznGW7FC61GFSpSqUEFvvq3UWNJzxpjZvK3eUODfFx
 CKSZS1X9xDkGUc3Gh9ilFwx2E3X+SBdvl3CpE9UvHmxD+MisBcI2frPbsziSrkvQLay2czdEAty
 dl8BsAwmptu9LT/4yE77USr7JKC4QJrmDBhEtSMH+5T+yGGql/WLGj+i1ZHRbEcvDtX4CtGSUsL
 a6R/UAtKasbhaNpdGFyyqve33kEs5w7eY6uZBSsoMZ+Hr426QzHF2klDKJmftE368pY941KY=
X-Google-Smtp-Source: AGHT+IFjeu0KSReedT4gszyGkIA9bES2oc+Nw8PGZ3HYA1jB/xtHwMR3Y+uSYLOJPoCYD8WtWNIAgQ==
X-Received: by 2002:a17:903:b0b:b0:249:1156:31f3 with SMTP id
 d9443c01a7336-25d243e7fd8mr56435ad.8.1757606815906; 
 Thu, 11 Sep 2025 09:06:55 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd9903a2asm2618765a91.24.2025.09.11.09.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:06:55 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>,
 Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: [PATCH 1/4] hw/char: sifive_uart: Raise IRQ according to the Tx/Rx
 watermark thresholds
Date: Fri, 12 Sep 2025 00:06:43 +0800
Message-ID: <20250911160647.5710-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911160647.5710-1-frank.chang@sifive.com>
References: <20250911160647.5710-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Frank Chang <frank.chang@sifive.com>

Currently, the SiFive UART raises an IRQ whenever:

  1. ie.txwm is enabled.
  2. ie.rxwm is enabled and the Rx FIFO is not empty.

It does not check the watermark thresholds set by software. However,
since commit [1] changed the SiFive UART character printing from
synchronous to asynchronous, Tx overflows may occur, causing characters
to be dropped when running Linux because:

  1. The Linux SiFive UART driver sets the transmit watermark level to 1
     [2], meaning a transmit watermark interrupt is raised whenever a
     character is enqueued into the Tx FIFO.
  2. Upon receiving a transmit watermark interrupt, the Linux driver
     transfers up to a full Tx FIFO's worth of characters from the Linux
     serial transmit buffer [3], without checking the txdata.full flag
     before transferring multiple characters [4].

To fix this issue, we must honor the Tx/Rx watermark thresholds and
raise interrupts only when the Tx threshold is exceeded or the Rx
threshold is undercut.

[1] 53c1557b230986ab6320a58e1b2c26216ecd86d5
[2] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifive.c#L1039
[3] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifive.c#L538
[4] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifive.c#L291

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
---
 hw/char/sifive_uart.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 9bc697a67b5..138c31fcabf 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -35,16 +35,17 @@
  */
 
 /* Returns the state of the IP (interrupt pending) register */
-static uint64_t sifive_uart_ip(SiFiveUARTState *s)
+static uint32_t sifive_uart_ip(SiFiveUARTState *s)
 {
-    uint64_t ret = 0;
+    uint32_t ret = 0;
 
-    uint64_t txcnt = SIFIVE_UART_GET_TXCNT(s->txctrl);
-    uint64_t rxcnt = SIFIVE_UART_GET_RXCNT(s->rxctrl);
+    uint32_t txcnt = SIFIVE_UART_GET_TXCNT(s->txctrl);
+    uint32_t rxcnt = SIFIVE_UART_GET_RXCNT(s->rxctrl);
 
-    if (txcnt != 0) {
+    if (fifo8_num_used(&s->tx_fifo) < txcnt) {
         ret |= SIFIVE_UART_IP_TXWM;
     }
+
     if (s->rx_fifo_len > rxcnt) {
         ret |= SIFIVE_UART_IP_RXWM;
     }
@@ -55,15 +56,14 @@ static uint64_t sifive_uart_ip(SiFiveUARTState *s)
 static void sifive_uart_update_irq(SiFiveUARTState *s)
 {
     int cond = 0;
-    if ((s->ie & SIFIVE_UART_IE_TXWM) ||
-        ((s->ie & SIFIVE_UART_IE_RXWM) && s->rx_fifo_len)) {
+    uint32_t ip = sifive_uart_ip(s);
+
+    if (((ip & SIFIVE_UART_IP_TXWM) && (s->ie & SIFIVE_UART_IE_TXWM)) ||
+        ((ip & SIFIVE_UART_IP_RXWM) && (s->ie & SIFIVE_UART_IE_RXWM))) {
         cond = 1;
     }
-    if (cond) {
-        qemu_irq_raise(s->irq);
-    } else {
-        qemu_irq_lower(s->irq);
-    }
+
+    qemu_set_irq(s->irq, cond);
 }
 
 static gboolean sifive_uart_xmit(void *do_not_use, GIOCondition cond,
-- 
2.49.0


