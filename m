Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNHW-0001lS-H1
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:04:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHP-0001gN-Eo
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHO-0004Fr-45
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:03 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:41502)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNHN-00049Q-MN
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:01 -0500
Received: by mail-qt1-x835.google.com with SMTP id l12so6164233qtf.8
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=B2OUXWtoyq20lymvhtwIjTpztHbwOwadgrVPRgraXAk=;
	b=lG34oRwqV27QZVQFS62nVbGlLN0ilrNf5huiEmhG5MFwjXZ4q+ynDPZgsYtGhiX1u/
	fuMuQ8kwZ4TkMv3NKJkgE+5nT2l+F4Xb3ZQ8SUQKFrroa3djwThYUhAHvgaRErWlwIFX
	B7tGHI4x6uVnXz+E3PKngWE797KFfzH9pt4xSR8GfGegOTtmc0mmAxjHl0BqhAzdqs9H
	n7Cv9iWj8sUgit03F2Z0I58WL7JMVCUtO6PmSDbRRmEWIuigyKojgQ2RaEssi7F+eTGY
	s7cZXioaCNTLHd+Lutmc+2/FBr8qp327r7tS3lk8XxjMXBezWqgNgvnfMap6Vmys8Y1C
	5lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=B2OUXWtoyq20lymvhtwIjTpztHbwOwadgrVPRgraXAk=;
	b=K7fnAExaIpn4WU//YGyG4BSPNqdyknOBztcNDdhr1Hi7yQmjTfUecbXrGEqpuy2tg2
	0Zmk+kw+XuMhheLb72BOIlKtHkuRmk8Fr+8ckl7OpVYnmZo1PdeR5FSeQlPg+zG/f821
	bF957pNHySinXpRyHPbjh6ixA9MRIW9NYgdfH0/8bsFewmaQCd1pY+ZBIlRUxkBEAKu9
	6M5qd16GVYA916Mhq4K20cubJwOSMtcxp2Q7KSNcz8w6nOgitTbHtEdMAy6IAVGtf6Zg
	gdX6+2tXQ9bBfhDm1ASci5v1C0QE9zFYzljuQsbrcxic9KC5DY5sXL82uMhaondB2qHX
	DA1Q==
X-Gm-Message-State: AJcUuke5v28N9gnCwNnlZLcGtQ/YwvDFv9FOVaOV1oNEEkgr7MsN7a3x
	2pc8eIsiIbzMR+d3ttcCG5S9Aw==
X-Google-Smtp-Source: ALg8bN5Q3O/fiRe0kBnCr/To/hMFbh2JU1tZ1C5ERE/+Je9/ikmlJCtiGrgrocWiVMNgd1H+ulgP6A==
X-Received: by 2002:ac8:1185:: with SMTP id d5mr2998294qtj.117.1545408231238; 
	Fri, 21 Dec 2018 08:03:51 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id 83sm7520617qkz.73.2018.12.21.08.03.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:50 -0800 (PST)
Date: Fri, 21 Dec 2018 08:03:03 -0800
Message-Id: <20181221160307.14819-11-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Michael Clark <mjc@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::835
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
X-List-Received-Date: Fri, 21 Dec 2018 16:04:04 -0000

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


