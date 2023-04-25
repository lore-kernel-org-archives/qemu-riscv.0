Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prDCv-0006QU-Dh
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 03:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1prDCu-0006QB-2Y; Tue, 25 Apr 2023 03:35:24 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1prDCs-00056i-6s; Tue, 25 Apr 2023 03:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682408122; x=1713944122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TLMnYXqTat9IxUMTv1EyqeKrgwTAGMREdUpmfoNpMnI=;
 b=Icj208gS3A/fvL+4ojj4ttR/48QSQ6MBiDjHrOaP8XiqZsumBzU/zYWi
 1IpwSp6t+jtOQFHu7EPRomsNP0+KmX5pTcaoQzonrNSEAC2ZNZkjoUdHe
 ve4QL1ENTh7Cr5GSQrIsgwS0gMAAQZeVhHGFwx57YZ7CzQnY8//3MEFEk
 wOm+o0bC4gYU55uDEEcWDIN7POilyFTQFKTdib6iKJhgG34XM4UJl+nwW
 DxWNoy1ZPQzBe/BiGgsUURXfD4agu24x824XAVX7kWNOmSJqWBcyYbd96
 TfH2LijMfJjyGpx3gv8s5So6oAtM8HZ+4bYIHrfJxvn2cJA/absS2A5ZL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="432952425"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; d="scan'208";a="432952425"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 00:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="670785668"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; d="scan'208";a="670785668"
Received: from intel-optiplex-7090.sh.intel.com ([10.67.104.162])
 by orsmga006.jf.intel.com with ESMTP; 25 Apr 2023 00:35:14 -0700
From: Yong Li <yong.li@intel.com>
To: qemu-devel@nongnu.org
Cc: Yong Li <yong.li@intel.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v3] hw/riscv/virt: Add a second UART for secure world
Date: Tue, 25 Apr 2023 15:35:09 +0800
Message-Id: <20230425073509.3618388-1-yong.li@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yong.li@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 07:35:24 -0000

The virt machine can have two UARTs and the second UART
can be used by the secure payload, firmware or OS residing
in secure world. Will include the UART device to FDT in a
seperated patch.

Signed-off-by: Yong Li <yong.li@intel.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


