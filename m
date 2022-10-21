Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oll34-00017y-8m
	for mharc-qemu-riscv@gnu.org; Fri, 21 Oct 2022 01:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2x-00013G-9R; Fri, 21 Oct 2022 01:58:19 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2u-00074T-2z; Fri, 21 Oct 2022 01:58:19 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oll2n-001R0U-2V;
 Fri, 21 Oct 2022 06:58:09 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v5 3/6] hw/riscv: use qemu_fdt_setprop_strings() for string
 arrays
Date: Fri, 21 Oct 2022 06:58:05 +0100
Message-Id: <20221021055808.342055-4-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021055808.342055-1-qemu@ben.fluff.org>
References: <20221021055808.342055-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.4, PDS_RDNS_DYNAMIC_FP=0.01,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 21 Oct 2022 05:58:20 -0000

Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify the code.

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
---
v5: fix re-ordering in sifive_u
---
 hw/riscv/sifive_u.c | 18 +++++-------------
 hw/riscv/spike.c    |  7 ++-----
 hw/riscv/virt.c     | 25 ++++++-------------------
 3 files changed, 13 insertions(+), 37 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b139824aab..2e0e78cbee 100644
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
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_DEV_CLINT].base,
         0x0, memmap[SIFIVE_U_DEV_CLINT].size);
@@ -279,8 +272,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         (long)memmap[SIFIVE_U_DEV_PLIC].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
-    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
-        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
+    qemu_fdt_setprop_strings(fdt, nodename, "compatbile",
+                             "sifive,plic-1.0.0", "riscv,plic0");
     qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
         cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
@@ -426,8 +419,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
-    qemu_fdt_setprop_string_array(fdt, nodename, "clock-names",
-        (char **)&ethclk_names, ARRAY_SIZE(ethclk_names));
+    qemu_fdt_setprop_strings(fdt, nodename, "clock-names", "pclk", "hclk");
     qemu_fdt_setprop(fdt, nodename, "local-mac-address",
         s->soc.gem.conf.macaddr.a, ETH_ALEN);
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1e1d752c00..80480d4ab4 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -61,9 +61,6 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     uint32_t cpu_phandle, intc_phandle, phandle = 1;
     char *name, *mem_name, *clint_name, *clust_name;
     char *core_name, *cpu_name, *intc_name;
-    static const char * const clint_compat[2] = {
-        "sifive,clint0", "riscv,clint0"
-    };
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -161,8 +158,8 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             (memmap[SPIKE_CLINT].size * socket);
         clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
         qemu_fdt_add_subnode(fdt, clint_name);
-        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
-            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
+        qemu_fdt_setprop_strings(fdt, clint_name, "compatible",
+                                 "sifive,clint0", "riscv,clint0");
         qemu_fdt_setprop_cells(fdt, clint_name, "reg",
             0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..5c644212a2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -303,9 +303,6 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
     uint32_t *clint_cells;
     unsigned long clint_addr;
     MachineState *mc = MACHINE(s);
-    static const char * const clint_compat[2] = {
-        "sifive,clint0", "riscv,clint0"
-    };
 
     clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
 
@@ -319,9 +316,8 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
     clint_addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
     clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
     qemu_fdt_add_subnode(mc->fdt, clint_name);
-    qemu_fdt_setprop_string_array(mc->fdt, clint_name, "compatible",
-                                  (char **)&clint_compat,
-                                  ARRAY_SIZE(clint_compat));
+    qemu_fdt_setprop_strings(mc->fdt, clint_name, "compatible",
+                             "sifive,clint0", "riscv,clint0");
     qemu_fdt_setprop_cells(mc->fdt, clint_name, "reg",
         0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
     qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
@@ -430,9 +426,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     uint32_t *plic_cells;
     unsigned long plic_addr;
     MachineState *mc = MACHINE(s);
-    static const char * const plic_compat[2] = {
-        "sifive,plic-1.0.0", "riscv,plic0"
-    };
 
     if (kvm_enabled()) {
         plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
@@ -460,9 +453,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
         "#interrupt-cells", FDT_PLIC_INT_CELLS);
     qemu_fdt_setprop_cell(mc->fdt, plic_name,
         "#address-cells", FDT_PLIC_ADDR_CELLS);
-    qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
-                                  (char **)&plic_compat,
-                                  ARRAY_SIZE(plic_compat));
+    qemu_fdt_setprop_strings(mc->fdt, plic_name, "compatible",
+                             "sifive,plic-1.0.0", "riscv,plic0");
     qemu_fdt_setprop(mc->fdt, plic_name, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop(mc->fdt, plic_name, "interrupts-extended",
         plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
@@ -890,13 +882,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     name = g_strdup_printf("/soc/test@%lx",
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(mc->fdt, name);
-    {
-        static const char * const compat[3] = {
-            "sifive,test1", "sifive,test0", "syscon"
-        };
-        qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
-                                      (char **)&compat, ARRAY_SIZE(compat));
-    }
+    qemu_fdt_setprop_strings(mc->fdt, name, "compatible",
+                             "sifive,test1", "sifive,test0", "syscon");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
         0x0, memmap[VIRT_TEST].base, 0x0, memmap[VIRT_TEST].size);
     qemu_fdt_setprop_cell(mc->fdt, name, "phandle", test_phandle);
-- 
2.35.1


