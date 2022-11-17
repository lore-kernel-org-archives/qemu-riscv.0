Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovnnS-0001oo-CQ
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 17:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1ovnnR-0001no-E4; Thu, 17 Nov 2022 17:55:49 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1ovnnP-0001FN-AK; Thu, 17 Nov 2022 17:55:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4BEECB82210;
 Thu, 17 Nov 2022 22:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E61FC433D6;
 Thu, 17 Nov 2022 22:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668725744;
 bh=zR0jCnbJnp3LkN8QZW4X2GqLM7t7O2qej/bQ26ETpVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hfvE4WOX6spx8Lfv+pWceJM/Sw0UNEAC6xfrBzzGGbsE/0kLIIxXtDkYERIP2pYV2
 mvvAcJ2LzJnR4EqecJ5zJBMRj83UBnICpDznR0zt/eeNNIK1d5Q0+cERjBTPtW+eND
 MFLpG70AxJaf6clTTK9dLUqwsrHcqGF/tD4tIdiVW6dWyK0CSsYnaEXxMjOEwEaNbX
 glDdk63awx+SJuZg85CjsuJLGoZ/h7JJhO9ZuYl6qHrA+w9AZjMzalt3dEWrkPUTqX
 blYH12RI4JsKeizYvgmy/N/kkgP+vajpFTBZqOVwzFzgYfRsbnMwbIpBTWEL5B2dXQ
 ZqiBI/gnN4luA==
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/3] hw/riscv: pfsoc: add missing FICs as unimplemented
Date: Thu, 17 Nov 2022 22:55:17 +0000
Message-Id: <20221117225518.4102575-3-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221117225518.4102575-1-conor@kernel.org>
References: <20221117225518.4102575-1-conor@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75; envelope-from=conor@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 17 Nov 2022 22:55:49 -0000

From: Conor Dooley <conor.dooley@microchip.com>

The Fabric Interconnect Controllers provide interfaces between the FPGA
fabric and the core complex. There are 5 FICs on PolarFire SoC, numbered
0 through 4. FIC2 is an AXI4 slave interface from the FPGA fabric and
does not show up on the MSS memory map. FIC4 is dedicated to the User
Crypto Processor and does not show up on the MSS memory map either.

FIC 0, 1 & 3 do show up in the MSS memory map and neither FICs 0 or 1
are represented in QEMU, leading to load access violations while booting
Linux for Icicle if PCIe is enabled as the root port is connected via
either FIC 0 or 1.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/microchip_pfsoc.c         | 115 ++++++++++++++++-------------
 include/hw/riscv/microchip_pfsoc.h |   2 +
 2 files changed, 65 insertions(+), 52 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index a821263d4f..2a24e3437a 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -86,58 +86,61 @@
  *     describes the complete IOSCB modules memory maps
  */
 static const MemMapEntry microchip_pfsoc_memmap[] = {
-    [MICROCHIP_PFSOC_RSVD0] =           {        0x0,      0x100 },
-    [MICROCHIP_PFSOC_DEBUG] =           {      0x100,      0xf00 },
-    [MICROCHIP_PFSOC_E51_DTIM] =        {  0x1000000,     0x2000 },
-    [MICROCHIP_PFSOC_BUSERR_UNIT0] =    {  0x1700000,     0x1000 },
-    [MICROCHIP_PFSOC_BUSERR_UNIT1] =    {  0x1701000,     0x1000 },
-    [MICROCHIP_PFSOC_BUSERR_UNIT2] =    {  0x1702000,     0x1000 },
-    [MICROCHIP_PFSOC_BUSERR_UNIT3] =    {  0x1703000,     0x1000 },
-    [MICROCHIP_PFSOC_BUSERR_UNIT4] =    {  0x1704000,     0x1000 },
-    [MICROCHIP_PFSOC_CLINT] =           {  0x2000000,    0x10000 },
-    [MICROCHIP_PFSOC_L2CC] =            {  0x2010000,     0x1000 },
-    [MICROCHIP_PFSOC_DMA] =             {  0x3000000,   0x100000 },
-    [MICROCHIP_PFSOC_L2LIM] =           {  0x8000000,  0x2000000 },
-    [MICROCHIP_PFSOC_PLIC] =            {  0xc000000,  0x4000000 },
-    [MICROCHIP_PFSOC_MMUART0] =         { 0x20000000,     0x1000 },
-    [MICROCHIP_PFSOC_WDOG0] =           { 0x20001000,     0x1000 },
-    [MICROCHIP_PFSOC_SYSREG] =          { 0x20002000,     0x2000 },
-    [MICROCHIP_PFSOC_AXISW] =           { 0x20004000,     0x1000 },
-    [MICROCHIP_PFSOC_MPUCFG] =          { 0x20005000,     0x1000 },
-    [MICROCHIP_PFSOC_FMETER] =          { 0x20006000,     0x1000 },
-    [MICROCHIP_PFSOC_DDR_SGMII_PHY] =   { 0x20007000,     0x1000 },
-    [MICROCHIP_PFSOC_EMMC_SD] =         { 0x20008000,     0x1000 },
-    [MICROCHIP_PFSOC_DDR_CFG] =         { 0x20080000,    0x40000 },
-    [MICROCHIP_PFSOC_MMUART1] =         { 0x20100000,     0x1000 },
-    [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
-    [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
-    [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,     0x1000 },
-    [MICROCHIP_PFSOC_WDOG1] =           { 0x20101000,     0x1000 },
-    [MICROCHIP_PFSOC_WDOG2] =           { 0x20103000,     0x1000 },
-    [MICROCHIP_PFSOC_WDOG3] =           { 0x20105000,     0x1000 },
-    [MICROCHIP_PFSOC_WDOG4] =           { 0x20106000,     0x1000 },
-    [MICROCHIP_PFSOC_SPI0] =            { 0x20108000,     0x1000 },
-    [MICROCHIP_PFSOC_SPI1] =            { 0x20109000,     0x1000 },
-    [MICROCHIP_PFSOC_I2C0] =            { 0x2010a000,     0x1000 },
-    [MICROCHIP_PFSOC_I2C1] =            { 0x2010b000,     0x1000 },
-    [MICROCHIP_PFSOC_CAN0] =            { 0x2010c000,     0x1000 },
-    [MICROCHIP_PFSOC_CAN1] =            { 0x2010d000,     0x1000 },
-    [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,     0x2000 },
-    [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,     0x2000 },
-    [MICROCHIP_PFSOC_GPIO0] =           { 0x20120000,     0x1000 },
-    [MICROCHIP_PFSOC_GPIO1] =           { 0x20121000,     0x1000 },
-    [MICROCHIP_PFSOC_GPIO2] =           { 0x20122000,     0x1000 },
-    [MICROCHIP_PFSOC_RTC] =             { 0x20124000,     0x1000 },
-    [MICROCHIP_PFSOC_ENVM_CFG] =        { 0x20200000,     0x1000 },
-    [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
-    [MICROCHIP_PFSOC_USB] =             { 0x20201000,     0x1000 },
-    [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
-    [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000, 0x10000000 },
-    [MICROCHIP_PFSOC_FABRIC_FIC3] =     { 0x40000000, 0x20000000 },
-    [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000, 0x40000000 },
-    [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000, 0x40000000 },
-    [MICROCHIP_PFSOC_DRAM_HI] =       { 0x1000000000,        0x0 },
-    [MICROCHIP_PFSOC_DRAM_HI_ALIAS] = { 0x1400000000,        0x0 },
+    [MICROCHIP_PFSOC_RSVD0] =           {        0x0,        0x100 },
+    [MICROCHIP_PFSOC_DEBUG] =           {      0x100,        0xf00 },
+    [MICROCHIP_PFSOC_E51_DTIM] =        {  0x1000000,       0x2000 },
+    [MICROCHIP_PFSOC_BUSERR_UNIT0] =    {  0x1700000,       0x1000 },
+    [MICROCHIP_PFSOC_BUSERR_UNIT1] =    {  0x1701000,       0x1000 },
+    [MICROCHIP_PFSOC_BUSERR_UNIT2] =    {  0x1702000,       0x1000 },
+    [MICROCHIP_PFSOC_BUSERR_UNIT3] =    {  0x1703000,       0x1000 },
+    [MICROCHIP_PFSOC_BUSERR_UNIT4] =    {  0x1704000,       0x1000 },
+    [MICROCHIP_PFSOC_CLINT] =           {  0x2000000,      0x10000 },
+    [MICROCHIP_PFSOC_L2CC] =            {  0x2010000,       0x1000 },
+    [MICROCHIP_PFSOC_DMA] =             {  0x3000000,     0x100000 },
+    [MICROCHIP_PFSOC_L2LIM] =           {  0x8000000,    0x2000000 },
+    [MICROCHIP_PFSOC_PLIC] =            {  0xc000000,    0x4000000 },
+    [MICROCHIP_PFSOC_MMUART0] =         { 0x20000000,       0x1000 },
+    [MICROCHIP_PFSOC_WDOG0] =           { 0x20001000,       0x1000 },
+    [MICROCHIP_PFSOC_SYSREG] =          { 0x20002000,       0x2000 },
+    [MICROCHIP_PFSOC_AXISW] =           { 0x20004000,       0x1000 },
+    [MICROCHIP_PFSOC_MPUCFG] =          { 0x20005000,       0x1000 },
+    [MICROCHIP_PFSOC_FMETER] =          { 0x20006000,       0x1000 },
+    [MICROCHIP_PFSOC_DDR_SGMII_PHY] =   { 0x20007000,       0x1000 },
+    [MICROCHIP_PFSOC_EMMC_SD] =         { 0x20008000,       0x1000 },
+    [MICROCHIP_PFSOC_DDR_CFG] =         { 0x20080000,      0x40000 },
+    [MICROCHIP_PFSOC_MMUART1] =         { 0x20100000,       0x1000 },
+    [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,       0x1000 },
+    [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,       0x1000 },
+    [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,       0x1000 },
+    [MICROCHIP_PFSOC_WDOG1] =           { 0x20101000,       0x1000 },
+    [MICROCHIP_PFSOC_WDOG2] =           { 0x20103000,       0x1000 },
+    [MICROCHIP_PFSOC_WDOG3] =           { 0x20105000,       0x1000 },
+    [MICROCHIP_PFSOC_WDOG4] =           { 0x20106000,       0x1000 },
+    [MICROCHIP_PFSOC_SPI0] =            { 0x20108000,       0x1000 },
+    [MICROCHIP_PFSOC_SPI1] =            { 0x20109000,       0x1000 },
+    [MICROCHIP_PFSOC_I2C0] =            { 0x2010a000,       0x1000 },
+    [MICROCHIP_PFSOC_I2C1] =            { 0x2010b000,       0x1000 },
+    [MICROCHIP_PFSOC_CAN0] =            { 0x2010c000,       0x1000 },
+    [MICROCHIP_PFSOC_CAN1] =            { 0x2010d000,       0x1000 },
+    [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,       0x2000 },
+    [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,       0x2000 },
+    [MICROCHIP_PFSOC_GPIO0] =           { 0x20120000,       0x1000 },
+    [MICROCHIP_PFSOC_GPIO1] =           { 0x20121000,       0x1000 },
+    [MICROCHIP_PFSOC_GPIO2] =           { 0x20122000,       0x1000 },
+    [MICROCHIP_PFSOC_RTC] =             { 0x20124000,       0x1000 },
+    [MICROCHIP_PFSOC_ENVM_CFG] =        { 0x20200000,       0x1000 },
+    [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,      0x20000 },
+    [MICROCHIP_PFSOC_USB] =             { 0x20201000,       0x1000 },
+    [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,    0x1000000 },
+    [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000,   0x10000000 },
+    [MICROCHIP_PFSOC_FABRIC_FIC0] =   { 0x2000000000, 0x1000000000 },
+    [MICROCHIP_PFSOC_FABRIC_FIC1] =   { 0x3000000000, 0x1000000000 },
+    [MICROCHIP_PFSOC_FABRIC_FIC3] =     { 0x40000000,   0x20000000 },
+    [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000,   0x40000000 },
+    [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000,   0x40000000 },
+    [MICROCHIP_PFSOC_DRAM_HI] =       { 0x1000000000,          0x0 },
+    [MICROCHIP_PFSOC_DRAM_HI_ALIAS] = { 0x1400000000,          0x0 },
+
 };
 
 static void microchip_pfsoc_soc_instance_init(Object *obj)
@@ -461,6 +464,14 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("microchip.pfsoc.fabricfic3",
         memmap[MICROCHIP_PFSOC_FABRIC_FIC3].base,
         memmap[MICROCHIP_PFSOC_FABRIC_FIC3].size);
+    /* FPGA Fabric */
+    create_unimplemented_device("microchip.pfsoc.fabricfic0",
+        memmap[MICROCHIP_PFSOC_FABRIC_FIC0].base,
+        memmap[MICROCHIP_PFSOC_FABRIC_FIC0].size);
+    /* FPGA Fabric */
+    create_unimplemented_device("microchip.pfsoc.fabricfic1",
+        memmap[MICROCHIP_PFSOC_FABRIC_FIC1].base,
+        memmap[MICROCHIP_PFSOC_FABRIC_FIC1].size);
 
     /* QSPI Flash */
     memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index a757b240e0..7e7950dd36 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -121,6 +121,8 @@ enum {
     MICROCHIP_PFSOC_USB,
     MICROCHIP_PFSOC_QSPI_XIP,
     MICROCHIP_PFSOC_IOSCB,
+    MICROCHIP_PFSOC_FABRIC_FIC0,
+    MICROCHIP_PFSOC_FABRIC_FIC1,
     MICROCHIP_PFSOC_FABRIC_FIC3,
     MICROCHIP_PFSOC_DRAM_LO,
     MICROCHIP_PFSOC_DRAM_LO_ALIAS,
-- 
2.37.2


