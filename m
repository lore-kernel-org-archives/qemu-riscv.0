Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrV-0004S5-FD
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:20:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrT-0004Oe-8i
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrL-0007sa-7A
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:47 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:43744)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrD-0007nZ-W9
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:37 -0500
Received: by mail-qt1-x833.google.com with SMTP id i7so17826471qtj.10
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=B2OUXWtoyq20lymvhtwIjTpztHbwOwadgrVPRgraXAk=;
	b=DWfKcv8COuZdj3hME3zB0DQapvOiV4Ot+yZgaqB5bwyMMa9xY+mdGtdn0lonvj0SPo
	CL94u7NMTYP888e8sAj/a5pfjWJPm+DneW4JutZEA4fzUmwNzfXDThZVzyoxHcUfcKTf
	/tnFAzOPgMtQ5hIzx+OHme1yG4Uny2Bi6OP+VGsHZ2+wTsC9TJNi5bBnsWmlbUDlWnu0
	avidV1UJuacb+2Z2Z75DY5riFXCRaTW5WejySf3fWAj8VTy7toZSfWaJar/tXx5UswTz
	figLZMOSg3fTN6dJWCR7BtdaJ4NOV4Z1t21DKlxAwHOWc0S1grPlTliqEq3EIC7ffn5a
	rH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=B2OUXWtoyq20lymvhtwIjTpztHbwOwadgrVPRgraXAk=;
	b=Iqqm9N5peWHeRd7ncFKZvVXza+/X+aspL+t7AqZ1ZiZhkoNxCKZ9T2ONUAnekHZ4rP
	n4ci3nsm+gfpTkc8UaWJSpvGbz5HF8k1vVyHEV8THrLbILpJLlA1VBXL6YmaFw64NXj5
	jNMhKfAd3Su5isIq2NDRXr96Coq+CrzeNi+7E/+k7deEJ6avahCWEd2yIINWSI7NbeGj
	xjVW0n2q7i88ZaHxv8VhpmGYFIO9//AikszsUySxSS0ECkL1ntp0rj21oywi5ww8QBN6
	f1wi/FzZUIDgMlfcsydOP5KWTF7+BaHAFApLs9V3MScL5LWwROfH8SEAvkktvdh/mtJV
	IkEg==
X-Gm-Message-State: AJcUukc1cL7rG+HBbhZqbQxuZkawV1m9n3c410izJJ2S2g4b3aOojHg4
	NM5wlU97CupfVouhdHEzD9RZPEfR4tI=
X-Google-Smtp-Source: ALg8bN5ZmdyePWoz0D8XP6oE7sBng7s+FVAcaHPT2eIsWMkiquSjbPIFSMcheEzmx35wiSUGMEuKbQ==
X-Received: by 2002:a0c:fd8a:: with SMTP id p10mr19375827qvr.48.1545844831754; 
	Wed, 26 Dec 2018 09:20:31 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	r16sm19613376qkh.71.2018.12.26.09.20.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:31 -0800 (PST)
Date: Wed, 26 Dec 2018 09:20:01 -0800
Message-Id: <20181226172005.26990-11-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::833
Subject: [Qemu-riscv] [PULL 10/14] RISC-V: Enable second UART on sifive_e
 and sifive_u
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
X-List-Received-Date: Wed, 26 Dec 2018 17:20:52 -0000

From: Michael Clark <mjc@sifive.com>

Previously the second UARTs on the sifive_e and sifive_u machines
where disabled due to check-qtest-riscv32 and check-qtest-riscv64
failures. Recent changes in the QEMU core serial code have
resolved these failures so the second UARTs can be instantiated.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_e.c | 5 ++---
 hw/riscv/sifive_u.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index cb513cc3bb50..5d9d65ff29ab 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -192,9 +192,8 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_E_QSPI0].base, memmap[SIFIVE_E_QSPI0].size);
     sifive_mmio_emulate(sys_mem, "riscv.sifive.e.pwm0",
         memmap[SIFIVE_E_PWM0].base, memmap[SIFIVE_E_PWM0].size);
-    /* sifive_uart_create(sys_mem, memmap[SIFIVE_E_UART1].base,
-        serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic),
-                                       SIFIVE_E_UART1_IRQ)); */
+    sifive_uart_create(sys_mem, memmap[SIFIVE_E_UART1].base,
+        serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_UART1_IRQ));
     sifive_mmio_emulate(sys_mem, "riscv.sifive.e.qspi1",
         memmap[SIFIVE_E_QSPI1].base, memmap[SIFIVE_E_QSPI1].size);
     sifive_mmio_emulate(sys_mem, "riscv.sifive.e.pwm1",
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 849fa2e6311a..3bd3b67507f8 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -368,9 +368,8 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_U_PLIC].size);
     sifive_uart_create(system_memory, memmap[SIFIVE_U_UART0].base,
         serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART0_IRQ));
-    /* sifive_uart_create(system_memory, memmap[SIFIVE_U_UART1].base,
-        serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic),
-                                       SIFIVE_U_UART1_IRQ)); */
+    sifive_uart_create(system_memory, memmap[SIFIVE_U_UART1].base,
+        serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART1_IRQ));
     sifive_clint_create(memmap[SIFIVE_U_CLINT].base,
         memmap[SIFIVE_U_CLINT].size, smp_cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
-- 
2.18.1


