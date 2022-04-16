Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngFLC-00022f-4T
	for mharc-qemu-riscv@gnu.org; Sun, 17 Apr 2022 20:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1ngCDC-00021j-CD; Sun, 17 Apr 2022 17:13:38 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:48562
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1ngCDA-0001bW-Je; Sun, 17 Apr 2022 17:13:38 -0400
Received: from localhost ([127.0.0.1] helo=luna)
 by hetzy.fluff.org with esmtp (Exim 4.89)
 (envelope-from <ben@luna.fluff.org>)
 id 1nfp7F-0008S0-DH; Sat, 16 Apr 2022 21:33:57 +0100
Received: from ben by luna with local (Exim 4.95)
 (envelope-from <ben@luna.fluff.org>) id 1nfo7w-002G1f-0o;
 Sat, 16 Apr 2022 20:30:36 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH 2/4] hw/riscv: use qemu_fdt_setprop_reg64() in sifive_u.c
Date: Sat, 16 Apr 2022 20:30:32 +0100
Message-Id: <20220416193034.538161-3-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220416193034.538161-1-qemu@ben.fluff.org>
References: <20220416193034.538161-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -0.6 (/)
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: ben@luna.fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: none client-ip=2a01:4f8:222:2004::3;
 envelope-from=ben@luna.fluff.org; helo=hetzy.fluff.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 17 Apr 2022 20:34:04 -0400
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
X-List-Received-Date: Sun, 17 Apr 2022 21:13:40 -0000

Use the qemu_fdt_setprop_reg64() to replace the code
that sets the property manually.

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
 hw/riscv/sifive_u.c | 41 +++++++++++------------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7fbc7dea42..1fe364cbb0 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -223,9 +223,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
         (char **)&clint_compat, ARRAY_SIZE(clint_compat));
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_CLINT].base,
-        0x0, memmap[SIFIVE_U_DEV_CLINT].size);
+    qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_CLINT]);
     qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
         cells, ms->smp.cpus * sizeof(uint32_t) * 4);
     g_free(cells);
@@ -235,9 +233,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         (long)memmap[SIFIVE_U_DEV_OTP].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_cell(fdt, nodename, "fuse-count", SIFIVE_U_OTP_REG_SIZE);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_OTP].base,
-        0x0, memmap[SIFIVE_U_DEV_OTP].size);
+    qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_OTP]);
     qemu_fdt_setprop_string(fdt, nodename, "compatible",
         "sifive,fu540-c000-otp");
     g_free(nodename);
@@ -250,9 +246,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "#clock-cells", 0x1);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         hfclk_phandle, rtcclk_phandle);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_PRCI].base,
-        0x0, memmap[SIFIVE_U_DEV_PRCI].size);
+    qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_PRCI]);
     qemu_fdt_setprop_string(fdt, nodename, "compatible",
         "sifive,fu540-c000-prci");
     g_free(nodename);
@@ -284,9 +278,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
         cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_PLIC].base,
-        0x0, memmap[SIFIVE_U_DEV_PLIC].size);
+    qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_PLIC]);
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
@@ -304,9 +296,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop_cell(fdt, nodename, "#gpio-cells", 2);
     qemu_fdt_setprop(fdt, nodename, "gpio-controller", NULL, 0);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_GPIO].base,
-        0x0, memmap[SIFIVE_U_DEV_GPIO].size);
+    qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_GPIO]);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_GPIO_IRQ0,
         SIFIVE_U_GPIO_IRQ1, SIFIVE_U_GPIO_IRQ2, SIFIVE_U_GPIO_IRQ3,
         SIFIVE_U_GPIO_IRQ4, SIFIVE_U_GPIO_IRQ5, SIFIVE_U_GPIO_IRQ6,
@@ -342,9 +332,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     nodename = g_strdup_printf("/soc/cache-controller@%lx",
         (long)memmap[SIFIVE_U_DEV_L2CC].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_L2CC].base,
-        0x0, memmap[SIFIVE_U_DEV_L2CC].size);
+    qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_L2CC]);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
         SIFIVE_U_L2CC_IRQ0, SIFIVE_U_L2CC_IRQ1, SIFIVE_U_L2CC_IRQ2);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
@@ -366,9 +354,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         prci_phandle, PRCI_CLK_TLCLK);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI2_IRQ);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_QSPI2].base,
-        0x0, memmap[SIFIVE_U_DEV_QSPI2].size);
+    qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_QSPI2]);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
     g_free(nodename);
 
@@ -391,9 +377,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         prci_phandle, PRCI_CLK_TLCLK);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI0_IRQ);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_QSPI0].base,
-        0x0, memmap[SIFIVE_U_DEV_QSPI0].size);
+    qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_QSPI0]);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
     g_free(nodename);
 
@@ -449,9 +433,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         (long)memmap[SIFIVE_U_DEV_PWM0].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,pwm0");
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_PWM0].base,
-        0x0, memmap[SIFIVE_U_DEV_PWM0].size);
+qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_PWM0]);
+
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
                            SIFIVE_U_PWM0_IRQ0, SIFIVE_U_PWM0_IRQ1,
@@ -496,9 +479,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         (long)memmap[SIFIVE_U_DEV_UART0].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,uart0");
-    qemu_fdt_setprop_cells(fdt, nodename, "reg",
-        0x0, memmap[SIFIVE_U_DEV_UART0].base,
-        0x0, memmap[SIFIVE_U_DEV_UART0].size);
+    qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_UART0]);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         prci_phandle, PRCI_CLK_TLCLK);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
-- 
2.35.1


