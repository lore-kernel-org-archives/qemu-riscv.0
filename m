Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqvoR-0002Fd-Ok
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 09:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1pqtph-0003Lw-Lr; Mon, 24 Apr 2023 06:54:10 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1pqtpe-0006pp-QB; Mon, 24 Apr 2023 06:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682333646; x=1713869646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bRXxsuGZgcawIOO9VN00Kaef8r1cEdk656Hli9LLctA=;
 b=F2BJX+FOprmnFEUwnhlxlcWNrpQFHmWnPa454Z8wPYNRJfvehTCcCZif
 w8CcSC+/MYm9nfGa39kCaPVp/HKPN+kvKM76z32g6OYub7mM3td5XzFvU
 bhg8JPITL6fWPN02C+IzwMvNKO2/2MyMKNA2tbyWn8z1m5/1fRjLBM9Mw
 mrNy5/9neLk7Wj0V9ty+ZOyq4ENOmLIzH6n8UtmMDaH8vgF9lZjQ0ejte
 GvchsTT7BKAh0tsUD2AqiynonqFJlvxE00NVWZa42AON/fHKTTWhuRZ5+
 nyqkHBvYfeC5EmociYaSJN8yjFxAg6XMxZODkZvB+x/YSVPtElNrowPli A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="349223257"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="349223257"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 03:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="762383355"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="762383355"
Received: from intel-optiplex-7090.sh.intel.com ([10.67.104.162])
 by fmsmga004.fm.intel.com with ESMTP; 24 Apr 2023 03:53:43 -0700
From: Yong Li <yong.li@intel.com>
To: qemu-devel@nongnu.org
Cc: Yong Li <yong.li@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2] hw/riscv/virt: Add a second UART for secure world
Date: Mon, 24 Apr 2023 18:53:41 +0800
Message-Id: <20230424105341.3474228-1-yong.li@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yong.li@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 10:54:10 -0000

The virt machine can have two UARTs and the second UART
can be used by the secure payload, firmware or OS residing
in secure world.

Signed-off-by: Yong Li <yong.li@intel.com>
---
 hw/riscv/virt.c         | 4 ++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..8e11c4b9b3 100644
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
@@ -1506,6 +1507,9 @@ static void virt_machine_init(MachineState *machine)
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


