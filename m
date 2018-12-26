Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrV-0004Rh-8u
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:20:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrT-0004Og-8u
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrL-0007tV-Ga
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:47 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:41305)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrE-0007kH-3t
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:39 -0500
Received: by mail-qt1-x843.google.com with SMTP id l12so17809839qtf.8
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=s8TQWdfmNT9BwGooMFuCxfyNF1ywYtDH9Swp6HiUmKk=;
	b=DFBjFo5Xlho89FS3sp9ihcTS2r/gSrYbxIFKttkSnXgdoOYtrBsEu4V1KEUniD9moA
	aUa6kAmQSdfk48nwqHqlrdxH3qnhHw8zrmNCT/7MY9+qzO2KvAd+JMtv5ppSZRV0989O
	tw3ZIRwEeh9iwUwrCdrUbhkmzYEdi0vmw59dGt8ZdmgHgDL+Np6awBB6DzNe9/0PTaes
	w/WBlSUZGkfH5WYc13xyPhOcyH7jXdrjQV9/Ql+WJ1VCjVWuXmiQP/S3RhC4xnCHPkOv
	YTNFUahrjmdgqhio/Ji223lY0PUlXRq1J2ELsWNLNoHF8OzCapXk1WQ65HFFLh1pnxD7
	MQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=s8TQWdfmNT9BwGooMFuCxfyNF1ywYtDH9Swp6HiUmKk=;
	b=aoXgFefSrdPNf/6fkeir/UvieEimYi1zMa38Obkrt77iCFT9CdHHb727KtdMgV72Rd
	g5c6zmO5xCZcThrjw9gg56rArV9tJLRWiT614TWsZf4hCp7CEY+L5/Q57njVyTvI8qeP
	8xs20S+rR5BwtTLrThdGoJzDht2QmbBt27/6rCnpyZa7SeYcLpOKWFYTyjRPJpgbb7xV
	CoswQvwIj2qYqXXcbb4v/FysShympOxcebDr5xTIMXDNziYlrY/Q2o2zoHy3qFkx3zf5
	DMtGwcYyNuaCjgavXfm5xtr2oRHoobxn9BcEER6hQ7hMQvVUkZTaZYPxHUuTnBbuVCLe
	/euQ==
X-Gm-Message-State: AJcUukfVGsD2fXcjMjsgXu+Lr5lCToEnbOSL1F0cPJTCaF6IMA15Ko3W
	tu5Qtm3e0m7/quM8CTm3Fd/XfLFoZB8=
X-Google-Smtp-Source: ALg8bN7xKNN6tketP1Qu1TFxG+vJEods9uBT1qec+bQrlfYPMXlrNjxa/KofWgJLYew2EqtJcsc37Q==
X-Received: by 2002:a0c:9626:: with SMTP id 35mr19230099qvx.207.1545844824480; 
	Wed, 26 Dec 2018 09:20:24 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	p47sm17472931qta.36.2018.12.26.09.20.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:23 -0800 (PST)
Date: Wed, 26 Dec 2018 09:19:57 -0800
Message-Id: <20181226172005.26990-7-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: [Qemu-riscv] [PULL 06/14] sifive_u: Set 'clock-frequency' DT
 property for SiFive UART
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

From: Anup Patel <anup@brainfault.org>

The 'clock-frequency' DT property is required by U-Boot to compute
the divider value. This patch sets the 'clock-frequency' DT property
of the SiFive UART device tree node (similar to virt machine).

Signed-off-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 5c41ee5017e4..849fa2e6311a 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -241,6 +241,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_UART0].base,
         0x0, memmap[SIFIVE_U_UART0].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+                          SIFIVE_U_CLOCK_FREQ / 2);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", 1);
 
-- 
2.18.1


