Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6ETp-0007Sh-9K
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6ETm-00078U-C6
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGr-0005WC-C4
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:55:10 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34479)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGr-0005Vv-6Q
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:55:09 -0400
Received: by mail-pg1-x542.google.com with SMTP id v12so13827080pgq.1
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=mT/w4mK1ltk1Z+/Eg8Ia5fwAoDmAMM6ATAhNNM6SUlI=;
	b=PdXZANHfQGOZgfY3NZ6tNel5jqqtczDTXzhYWs5DH0NAQrF9NdRuWiTQP9yQBT8P+F
	8pJbC755yHI2D5oygL/jxEDml7kOVRi8lg/BcmIO/NvNV5c5zYjZvxRa02bwtlOWC9LH
	JU91Q9kfXX20JxzV/fl4yJEkAD2kAdXCf9EJyuTJHUzeHxXZtPf3Sv85Ik6bXwfe+tmM
	f3iZA2gmpqayrWQc0Aa6ljnFlU5fFk9sJsnum9r26mDV1lJTbWXMuHh6OmS46xjeNWuq
	kwlmxEq1p42Jc8hSDqA2IwKVB3621BQoduxy3dL7Fxge5isGv7HMUhInKG3AAs9tl0bx
	QAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=mT/w4mK1ltk1Z+/Eg8Ia5fwAoDmAMM6ATAhNNM6SUlI=;
	b=b0JCogXfr6OoBhS1Cpw6OXw99aJ0DlZGKOPtQ6A/v5Olb3OYXM0LLIh0BoESLqFcdI
	kZNcrJKBr+wti9L5nVQ9PNmDPW8Vye1un5kgvTjPEKJKKNX4eF1OgFtiZ/bG4VvSF8Vs
	x2HqS36abSpx5G46rY2OhIpz9Pm81qdOEWS/XeLb7cbmcHN4gLxo8zbx57poAzswxYvl
	Lk4m5IxP3BttfZnFoErNoX2H5HX6EGK4Sh9eS0A1rxZI9wBCZ8uXnosv22YW/YR1ka/E
	n76P9X0YBOJ64QKJDEoOqucxqp7apx4KIQFgucZBMwZbS0O9hF2mSYzkSjt6F+K70cEA
	LfiA==
X-Gm-Message-State: APjAAAV3Eu9p+nPEbWUZUYNVKTaShPo+2VmD/9sUQNeIwQ+YY+4YzKvI
	9VoBHZCW3Zr3VVbm6xc93nBDE7QsO7+9C+mN
X-Google-Smtp-Source: APXvYqyKFNc92BlsFpJupwRy4ZtfV0w3luYIBTLXyewoqaa5y6ygR/FvMqugFy9Z6pzhURmLkipmdQ==
X-Received: by 2002:a17:902:2848:: with SMTP id
	e66mr1950070plb.181.1553000108095; 
	Tue, 19 Mar 2019 05:55:08 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	p6sm22109961pgd.69.2019.03.19.05.55.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:55:07 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:48:03 -0700
Message-Id: <20190319124803.13826-20-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PULL 19/19] riscv: sifive_u: Correct UART0's IRQ in
 the device tree
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:31 -0000

From: Bin Meng <bmeng.cn@gmail.com>

The UART0's interrupt vector is wrongly set to 1 in the device tree.
Use SIFIVE_U_UART0_IRQ instead.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 3199238ba01e..5ecc47cea35d 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -244,7 +244,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
                           SIFIVE_U_CLOCK_FREQ / 2);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-parent", plic_phandle);
-    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", 1);
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_UART0_IRQ);
 
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
-- 
2.19.2


