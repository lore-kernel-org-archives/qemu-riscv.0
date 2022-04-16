Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngFLG-0002ET-Pg
	for mharc-qemu-riscv@gnu.org; Sun, 17 Apr 2022 20:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1ngCD9-0001wf-Im; Sun, 17 Apr 2022 17:13:36 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:48562
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1ngCD7-0001bW-VD; Sun, 17 Apr 2022 17:13:35 -0400
Received: from localhost ([127.0.0.1] helo=luna)
 by hetzy.fluff.org with esmtp (Exim 4.89)
 (envelope-from <ben@luna.fluff.org>)
 id 1nfp7D-0008Ro-Aj; Sat, 16 Apr 2022 21:33:55 +0100
Received: from ben by luna with local (Exim 4.95)
 (envelope-from <ben@luna.fluff.org>) id 1nfo7w-002G1l-3F;
 Sat, 16 Apr 2022 20:30:36 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH 4/4] hw/riscv: use qemu_fdt_setprop_strings() in sifive_u.c
Date: Sat, 16 Apr 2022 20:30:34 +0100
Message-Id: <20220416193034.538161-5-qemu@ben.fluff.org>
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
X-List-Received-Date: Sun, 17 Apr 2022 21:13:36 -0000

Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify
the code.

Signed-off-by; Ben Dooks <qemu@ben.fluff.org>
---
 hw/riscv/sifive_u.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 1fe364cbb0..b00086d86e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -103,13 +103,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     char *nodename;
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
-    static const char * const ethclk_names[2] = { "pclk", "hclk" };
-    static const char * const clint_compat[2] = {
-        "sifive,clint0", "riscv,clint0"
-    };
-    static const char * const plic_compat[2] = {
-        "sifive,plic-1.0.0", "riscv,plic0"
-    };
 
     if (ms->dtb) {
         fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
@@ -221,8 +214,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     nodename = g_strdup_printf("/soc/clint@%lx",
         (long)memmap[SIFIVE_U_DEV_CLINT].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
-        (char **)&clint_compat, ARRAY_SIZE(clint_compat));
+    qemu_fdt_setprop_strings(fdt, nodename, "compatible",
+                             "sifive,clint0", "riscv,clint0");
     qemu_fdt_setprop_reg64(fdt, nodename, &memmap[SIFIVE_U_DEV_CLINT]);
     qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
         cells, ms->smp.cpus * sizeof(uint32_t) * 4);
@@ -273,8 +266,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         (long)memmap[SIFIVE_U_DEV_PLIC].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
-    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
-        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
+    //qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
+    //    (char **)&plic_compat, ARRAY_SIZE(plic_compat));
+    qemu_fdt_setprop_strings(fdt, nodename, "compatbile",
+                             "sifive,plic-1.0.0", "riscv,plic0");
     qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
         cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
@@ -410,8 +405,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
-    qemu_fdt_setprop_string_array(fdt, nodename, "clock-names",
-        (char **)&ethclk_names, ARRAY_SIZE(ethclk_names));
+    qemu_fdt_setprop_strings(fdt, nodename, "clock-names", "pclk", "hclk");
     qemu_fdt_setprop(fdt, nodename, "local-mac-address",
         s->soc.gem.conf.macaddr.a, ETH_ALEN);
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
-- 
2.35.1


