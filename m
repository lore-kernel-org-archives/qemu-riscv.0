Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHTNX-0006Wl-Ba
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 12:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNV-0006WL-Tc
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 12:34:37 -0500
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNT-0004oe-Py
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 12:34:37 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 d2-20020a4ab202000000b004ae3035538bso7401239ooo.12
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 09:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vy8CbnCfCpZHBfHuhum/KGkrk83FiLhw4q6dFETlloo=;
 b=DYYKxHt1FaGRrh7I6JN0hc2fVnNam50zDuCmpgt4uS7BMVsUeUiT3zfa4LXcfKqap4
 DH7G5WNFvhBV7a677x+auT8pn4gzVG99aThkk3ldIZ0/DyuWHwqKS89C7J2QFZHmpjVL
 3ofbyshdtEvr7joBfQG49OVQ3Xk/84Se0OrtAySE5w90Zy5J4QAQTkJZseou8bQtDmui
 0FwpDlgCsDcTXIvm7rVDcF7yr54zien25dlvDK8Kso1cakdZ0q1WzsI07LPssmIJEfqJ
 fhqofRMFuHm3WluYBQsZUod3RzicubNLacfrKW/Q4LIirFDaYwPOU1+kLX6PYPQMDFNR
 inIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vy8CbnCfCpZHBfHuhum/KGkrk83FiLhw4q6dFETlloo=;
 b=vyO23DzUgb9s0jzMUXYQyjfeDUyHL3izHsqurQEmYtVney7BPfUTiPy/tr7l3I5H0d
 RCJ9rniDSyeWtMTUIIjxl+/z9BXR0WG/TvjHTwFN1jWG538eapLhRZ+OPcD2S5vbYDNL
 T4N+HV2Y5xHYBSI1MnGzZvODpS95LoA7l8yrBCuygFrZoECZ8K2D+xYKCM+Uf3Kh1lSE
 mkVXIfJHeQR+4C7kM45ZPBTwmKx8PYXbvDvtLymNBGw8ldbevePw7iUAtHszmDjoCb3Z
 fUXXLVPG2fxrUPvUm9OjAuubMhKc5VyAB56Hi233fPH1a2OltrLf3LG7qU9MZkgots9C
 basA==
X-Gm-Message-State: AFqh2krdFP3pKNa7uRNuyc8FXZ2gcy5zlQiwfa66swMhWlxfFU8jXb98
 IpRcd3BU6z4hPevZYaN/IwetxQ==
X-Google-Smtp-Source: AMrXdXvEqQJYe1vgJMHS5NDQUe6VOdOzgVzlPPKct0OHVu1aiLM+ReFn9AYNqyzWqLKkiAWk0kYJFg==
X-Received: by 2002:a4a:d0d9:0:b0:4f1:e491:c80 with SMTP id
 u25-20020a4ad0d9000000b004f1e4910c80mr166706oor.2.1673890474731; 
 Mon, 16 Jan 2023 09:34:34 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 f23-20020a4ae617000000b0049fd5c02d25sm1353802oot.12.2023.01.16.09.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 09:34:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 4/6] hw/riscv/virt.c: calculate socket count once in
 create_fdt_imsic()
Date: Mon, 16 Jan 2023 14:34:18 -0300
Message-Id: <20230116173420.1146808-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 16 Jan 2023 17:34:38 -0000

riscv_socket_count() returns either ms->numa_state->num_nodes or 1
depending on NUMA support. In any case the value can be retrieved only
once and used in the rest of the function.

This will also alleviate the rename we're going to do next by reducing
the instances of MachineState 'mc' inside hw/riscv/virt.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index cbba0b8930..8ff89c217f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -505,13 +505,14 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     int cpu, socket;
     char *imsic_name;
     MachineState *mc = MACHINE(s);
+    int socket_count = riscv_socket_count(mc);
     uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
     uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
 
     *msi_m_phandle = (*phandle)++;
     *msi_s_phandle = (*phandle)++;
     imsic_cells = g_new0(uint32_t, mc->smp.cpus * 2);
-    imsic_regs = g_new0(uint32_t, riscv_socket_count(mc) * 4);
+    imsic_regs = g_new0(uint32_t, socket_count * 4);
 
     /* M-level IMSIC node */
     for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
@@ -519,7 +520,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
         imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
     }
     imsic_max_hart_per_socket = 0;
-    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+    for (socket = 0; socket < socket_count; socket++) {
         imsic_addr = memmap[VIRT_IMSIC_M].base +
                      socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
@@ -545,14 +546,14 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
         imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
     qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
-        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+        socket_count * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    if (riscv_socket_count(mc) > 1) {
+    if (socket_count > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
             imsic_num_bits(imsic_max_hart_per_socket));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
-            imsic_num_bits(riscv_socket_count(mc)));
+            imsic_num_bits(socket_count));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
@@ -567,7 +568,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     }
     imsic_guest_bits = imsic_num_bits(s->aia_guests + 1);
     imsic_max_hart_per_socket = 0;
-    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+    for (socket = 0; socket < socket_count; socket++) {
         imsic_addr = memmap[VIRT_IMSIC_S].base +
                      socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
@@ -594,18 +595,18 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
         imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
     qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
-        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+        socket_count * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
     if (imsic_guest_bits) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bits",
             imsic_guest_bits);
     }
-    if (riscv_socket_count(mc) > 1) {
+    if (socket_count > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
             imsic_num_bits(imsic_max_hart_per_socket));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
-            imsic_num_bits(riscv_socket_count(mc)));
+            imsic_num_bits(socket_count));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
@@ -733,6 +734,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     MachineState *mc = MACHINE(s);
     uint32_t msi_m_phandle = 0, msi_s_phandle = 0;
     uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
+    int socket_count = riscv_socket_count(mc);
 
     qemu_fdt_add_subnode(mc->fdt, "/cpus");
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
@@ -744,7 +746,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     intc_phandles = g_new0(uint32_t, mc->smp.cpus);
 
     phandle_pos = mc->smp.cpus;
-    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+    for (socket = (socket_count - 1); socket >= 0; socket--) {
         phandle_pos -= s->soc[socket].num_harts;
 
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
@@ -775,7 +777,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     }
 
     phandle_pos = mc->smp.cpus;
-    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+    for (socket = (socket_count - 1); socket >= 0; socket--) {
         phandle_pos -= s->soc[socket].num_harts;
 
         if (s->aia_type == VIRT_AIA_TYPE_NONE) {
@@ -790,7 +792,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
 
     g_free(intc_phandles);
 
-    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+    for (socket = 0; socket < socket_count; socket++) {
         if (socket == 0) {
             *irq_mmio_phandle = xplic_phandles[socket];
             *irq_virtio_phandle = xplic_phandles[socket];
@@ -1051,7 +1053,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 
     /* Pass seed to RNG */
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed",
+                     rng_seed, sizeof(rng_seed));
 }
 
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
@@ -1335,9 +1338,10 @@ static void virt_machine_init(MachineState *machine)
     char *soc_name;
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
+    int socket_count = riscv_socket_count(machine);
 
     /* Check socket count limit */
-    if (VIRT_SOCKETS_MAX < riscv_socket_count(machine)) {
+    if (VIRT_SOCKETS_MAX < socket_count) {
         error_report("number of sockets/nodes should be less than %d",
             VIRT_SOCKETS_MAX);
         exit(1);
@@ -1345,7 +1349,7 @@ static void virt_machine_init(MachineState *machine)
 
     /* Initialize sockets */
     mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
-    for (i = 0; i < riscv_socket_count(machine); i++) {
+    for (i = 0; i < socket_count; i++) {
         if (!riscv_socket_check_hartids(machine, i)) {
             error_report("discontinuous hartids in socket%d", i);
             exit(1);
-- 
2.39.0


