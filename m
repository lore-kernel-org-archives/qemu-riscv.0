Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqvoX-0002Lq-6v
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 09:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1pqtnr-0000w5-C8; Mon, 24 Apr 2023 06:52:15 -0400
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1pqtna-0006MU-Ik; Mon, 24 Apr 2023 06:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682333518; x=1713869518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/QaQlEvjhN6xxRF5RZDN6Faa8uJF9kcPU/CsMrArPJk=;
 b=K8LRBSHsQx9pWN+TOBJzzbJQbBcXnuZOzRccNhMm4mN6+f8Xr/ZlARZZ
 K47XlILsav0ITgwKmDRuYSv9SesxoIW3Mq8yvWLkeu2iuXtSHW64ITHup
 9Up9dRz88haTxzL07SsvsinOL1iMt8fnNz5NlYnVqjHhOAbXmv8lPdI63
 /Uv9R0ca/dAtvkyib5Sd+l7wDC6xwHewZ2tqlLoq9yvrVmSw5EyiJqbTe
 PtKvQY7ckLKOFlIFrFfjV4jF5ZB4PgLSD12lWp0vNw813vXuU2oDVrKkO
 c4N2q53f+EwaFlglhgDVVPBGW5buEMdD+HeMFw3EzcZ30Prfp6eLMfD9f Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="374368436"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="374368436"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 03:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="782369487"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="782369487"
Received: from intel-optiplex-7090.sh.intel.com ([10.67.104.162])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2023 03:51:44 -0700
From: Yong Li <yong.li@intel.com>
To: qemu-devel@nongnu.org
Cc: Yong Li <yong.li@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] hw/riscv/virt: Add a second UART for secure world
Date: Mon, 24 Apr 2023 18:51:38 +0800
Message-Id: <20230424105139.3473939-1-yong.li@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yong.li@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 Apr 2023 09:00:57 -0400
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
X-List-Received-Date: Mon, 24 Apr 2023 10:52:15 -0000

The virt machine can have two UARTs and the second UART
can be used when host secure-mode support is enabled.

Signed-off-by: Yong Li <yong.li@intel.com>
---
 hw/riscv/virt.c         | 4 ++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b38b41e685..02475e1678 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
     [VIRT_UART0] =        { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
+    [VIRT_UART1] =        { 0x10002000,         0x100 },
     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
@@ -1508,6 +1509,9 @@ static void virt_machine_init(MachineState *machine)
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
+        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
+        serial_hd(1), DEVICE_LITTLE_ENDIAN);
 
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
         qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e5c474b26e..8d2f8f225d 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -74,6 +74,7 @@ enum {
     VIRT_APLIC_S,
     VIRT_UART0,
     VIRT_VIRTIO,
+    VIRT_UART1,
     VIRT_FW_CFG,
     VIRT_IMSIC_M,
     VIRT_IMSIC_S,
@@ -88,6 +89,7 @@ enum {
 enum {
     UART0_IRQ = 10,
     RTC_IRQ = 11,
+    UART1_IRQ = 12,
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
-- 
2.25.1


