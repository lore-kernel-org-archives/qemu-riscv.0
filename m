Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5QlP-0003RE-UI
	for mharc-qemu-riscv@gnu.org; Sun, 17 Mar 2019 04:03:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h5QlO-0003R3-7i
	for qemu-riscv@nongnu.org; Sun, 17 Mar 2019 04:03:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h5QlN-0004y3-Ed
	for qemu-riscv@nongnu.org; Sun, 17 Mar 2019 04:03:22 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36195)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
	id 1h5QlN-0004x1-4V; Sun, 17 Mar 2019 04:03:21 -0400
Received: by mail-pg1-x543.google.com with SMTP id r124so9289880pgr.3;
	Sun, 17 Mar 2019 01:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1f3hMlG+smdy7QoDSj89gXWpJwklHuAzeeOC5rLIymE=;
	b=fpIdgEO82gCxL+m8mXUJbeUVYgOlpcwmjMvqUP/JX9jAoKjar0RsOSyXbkuOf42Mny
	Cnw6VaWWaPgIsJcn2aGfOuRv9NXiU1MwTo/SG939rIEPKDwp5a5UyTe9a644vTzp2lcs
	jOEAZdOHcytTi/4H8E1HUqqDWETwaK0hh21O3Mlp3hm8TpdnI4QjD5Qpqba6J3V6GRdK
	ghGj0TdXqfgMJW84qXmo6gDaP8KNnwlKkeCd4FHvBVGkxSPL8zXw9yoiLTuSCp6kwZ14
	B0kouzdK/vnvKezXRsDWG5d5V/K4woZIg7IVa+YGPrjAdtcVzE+hxIKrww+5KS/sKzsQ
	ZFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1f3hMlG+smdy7QoDSj89gXWpJwklHuAzeeOC5rLIymE=;
	b=r+vwHJqhiu7dgW+qPABilbcggxyw97pTQlB72NB1SKpx1fUHeYKrkgXQNdDJUJn3oV
	Ba4Gv1+vTjqUXGH7O7JZxDXWPx82Rcz00SPKx/pFCdwIkCL18m2HTH2ZB23R0pQF5SLz
	Xe0Eh3eAWuoIsHDyEwdvgN4zdaefPfNUalqWbwLgTSX/SVapds/tsIdFio/OZTY6whaN
	JM+nOKx5ABvBm2ZTKVQKuw+r2qfdrTJb4Xhpvc4myv/kXU+yLUwLqYOdqCsxqjHrPicq
	xv7+c7MbdD/w+BndeUEzL1GnX3QzGFgSxU4+rNue2eK1qI0R4d1XQHQac7k7NoxRtgiD
	gbZA==
X-Gm-Message-State: APjAAAVs8M/NXKUPOu1LzKF6eeu6jffI1gD95QxRdcR30v/lefWilc/M
	WzhQno9TnBZoMn7VCRkxNmI/EqthTrw=
X-Google-Smtp-Source: APXvYqxpPgB6XNXxN/TVBt9E+fqZRThe8rUhZ79qUxLlHKSgQ2ICUu1zEV6JmyEStb3Mgy4xhvKFUw==
X-Received: by 2002:a17:902:ba8d:: with SMTP id
	k13mr13640433pls.15.1552809798422; 
	Sun, 17 Mar 2019 01:03:18 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
	[147.11.224.80]) by smtp.gmail.com with ESMTPSA id
	g12sm24897149pfd.72.2019.03.17.01.03.17
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Sun, 17 Mar 2019 01:03:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Date: Sun, 17 Mar 2019 01:03:11 -0700
Message-Id: <1552809791-7714-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1552809791-7714-1-git-send-email-bmeng.cn@gmail.com>
References: <1552809791-7714-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PATCH 2/2] riscv: sifive_u: Correct UART0's IRQ in
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
X-List-Received-Date: Sun, 17 Mar 2019 08:03:23 -0000

The UART0's interrupt vector is wrongly set to 1 in the device tree.
Use SIFIVE_U_UART0_IRQ instead.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7bc2582..57741c2 100644
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
2.7.4


