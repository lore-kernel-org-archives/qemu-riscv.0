Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieZjd-0005V0-LK
	for mharc-qemu-riscv@gnu.org; Tue, 10 Dec 2019 02:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ieZjb-0005RZ-6U
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2019 02:15:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ieZja-0004nO-7N
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2019 02:15:03 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2221 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ieZjX-0004hM-TR; Tue, 10 Dec 2019 02:15:00 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8A972C0906A1D809EC9F;
 Tue, 10 Dec 2019 15:14:54 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Tue, 10 Dec 2019 15:14:44 +0800
From: <pannengyuan@huawei.com>
To: <palmer@dabbelt.com>, <Alistair.Francis@wdc.com>,
 <sagark@eecs.berkeley.edu>, <kbastian@mail.uni-paderborn.de>
CC: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>,
 <zhang.zhanghailiang@huawei.com>, Pan Nengyuan <pannengyuan@huawei.com>
Subject: [PATCH] riscv/sifive_u: fix a memory leak in soc_realize()
Date: Tue, 10 Dec 2019 15:14:37 +0800
Message-ID: <1575962077-28800-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Dec 2019 07:15:04 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

Fix a minor memory leak in riscv_sifive_u_soc_realize()

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 hw/riscv/sifive_u.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 0140e95..0e12b3c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -542,6 +542,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         SIFIVE_U_PLIC_CONTEXT_BASE,
         SIFIVE_U_PLIC_CONTEXT_STRIDE,
         memmap[SIFIVE_U_PLIC].size);
+    g_free(plic_hart_config);
     sifive_uart_create(system_memory, memmap[SIFIVE_U_UART0].base,
         serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART0_IRQ));
     sifive_uart_create(system_memory, memmap[SIFIVE_U_UART1].base,
-- 
2.7.2.windows.1



