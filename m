Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUSWk-0007HN-6r
	for mharc-qemu-riscv@gnu.org; Wed, 05 Dec 2018 03:27:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anup@brainfault.org>) id 1gUSWh-0007Fu-GL
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 03:27:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anup@brainfault.org>) id 1gUSWd-0005t4-I2
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 03:27:22 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41675)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anup@brainfault.org>) id 1gUSWc-0005sM-P0
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 03:27:19 -0500
Received: by mail-pg1-x542.google.com with SMTP id 70so8674138pgh.8
	for <qemu-riscv@nongnu.org>; Wed, 05 Dec 2018 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=brainfault-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2CI8xLFjzwd/QtoF8z6vh9Y7B9tYVWZ8qg5tKBAIgrY=;
	b=NTMj/B13mU/ME29IPpBeDk+jryhrWd9ySwTZ0zdyOajStqpYGL+8Rj46X1QymnOLWS
	zMfhLDn2ImaELOEXVy7TsIrMsXDC3h9/AymaXHTETG0JrcevaJynaspoVJkCzXRuEFVj
	XF+sy4dI31gDq16iH+V+iBr2u0uGqFOr7ZdHgLKlBwnWUpfTAg7T9GWCnv8dflpSdDFF
	bWjFAIMMfLPEg+bPv14KKgEAWXqHJTBTZbur9i0UMga5z6a6wldxMUeMXr7Fn6iMWdIK
	imaAQNfSPDJRmCEq7VU9+nRtAOKkktUPJih0aW06qwxKZdn+58xp8/FX+aNOm0FESMWy
	HXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2CI8xLFjzwd/QtoF8z6vh9Y7B9tYVWZ8qg5tKBAIgrY=;
	b=KXI/UDfL7lm+z8WL2OvqPrw2qzwowQmgiwZGiHsCZe6+86yZaO5fAfH9vLBKDSpall
	XetIgbJXhbtOfs7/v2kg7jbzCPXJMQVhBVipg7f87nwfQs9S8KPM/4/IlG8gA+lOI75g
	IUiLsLFwX3SvlHZqunPdErL9a01oJqY/UyKlouw246pWzqP5j7PCs12VzEaSi+hy2R6/
	MMMcCiZfRroUkNWj1Hx4QjRdDW1I/j3bZFsG7GoBYL8xqrvukIgk8XS0dkvHsY2iDc60
	yFl6psn2mTISwbqAwLz8DljoKojePL5TV7uhmeWbYS/IP+LGoVGyLH+/ZmcpnCIYaN31
	K3Fw==
X-Gm-Message-State: AA+aEWaR3d/vB7vGnVIl1nsEv4qqAj50Q2QyWLHS+93r2CurR3aMNrRz
	YH49AItDPiPmTxwFeBm0uQKRbFX4AX0=
X-Google-Smtp-Source: AFSGD/Uq/ARFas+DVh0/P8HGDdwC47OUEwUUtKyua2oI5JBxVncUtd43QWtK37xL7tL7FQ8zhxETRw==
X-Received: by 2002:a62:ae12:: with SMTP id q18mr23462496pff.126.1543998436444;
	Wed, 05 Dec 2018 00:27:16 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.50.107])
	by smtp.googlemail.com with ESMTPSA id
	19sm33410406pfs.108.2018.12.05.00.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 00:27:15 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: qemu-riscv@nongnu.org
Cc: Anup Patel <anup@brainfault.org>
Date: Wed,  5 Dec 2018 13:57:03 +0530
Message-Id: <20181205082703.13945-2-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181205082703.13945-1-anup@brainfault.org>
References: <20181205082703.13945-1-anup@brainfault.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PATCH 2/2] hw/riscv/sifive_u: Set 'clock-frequency'
 DT property for SiFive UART
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
X-List-Received-Date: Wed, 05 Dec 2018 08:27:25 -0000

The 'clock-frequency' DT property is required by U-Boot to compute
divider value. This patch sets 'clock-frequency' DT property of
SiFive UART DT node (similar to virt machine).

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 hw/riscv/sifive_u.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b3a4352986..5fa666fefc 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -238,6 +238,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_UART0].base,
         0x0, memmap[SIFIVE_U_UART0].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+        SIFIVE_U_CLOCK_FREQ / 2);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", 1);
 
-- 
2.17.1


