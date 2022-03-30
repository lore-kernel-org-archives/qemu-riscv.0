Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXtE-0008H1-AG
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXtC-00088Y-6p; Wed, 30 Mar 2022 08:57:30 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXtA-0004b1-Fk; Wed, 30 Mar 2022 08:57:29 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id EDFD821EC9;
 Wed, 30 Mar 2022 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EyTZ8CgHiE5Z4BgEF/1LTYkzku8ClDxFHoUWNpaJ2Hs=;
 b=VUIyqxKGf/yeZBptq3T3YWxj4C3eGc4I1hnI/1RCe7WXHZfguzFv+FAmhhNojTAxSt/mu6
 97vkjK62gZiNgE1pBZtSWLTXN5rlv8Zbf7ytlJjlOXDlZR2RBD5B+HMDI+VIW5rR2j4bDR
 ySa/y6ax1O6uEBknBOLYQ9+n/3Fw/As=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 13/18] hw/riscv/spike: prepare riscv_hart transition to
 cpus
Date: Wed, 30 Mar 2022 14:56:34 +0200
Message-Id: <20220330125639.201937-14-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 30 Mar 2022 12:57:31 -0000

+ Use riscv_array_get_num_harts instead of accessing num_harts field.
+ Use riscv_array_get_hart instead of accessing harts field.
+ Use riscv_hart_array_realize instead of sysbus_realize.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/riscv/spike.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index d059a67f9b..b75e3656e1 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -54,6 +54,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     uint64_t addr, size;
     unsigned long clint_addr;
     int cpu, socket;
+    unsigned num_harts;
     MachineState *mc = MACHINE(s);
     uint32_t *clint_cells;
     uint32_t cpu_phandle, intc_phandle, phandle = 1;
@@ -97,10 +98,10 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
         qemu_fdt_add_subnode(fdt, clust_name);
+        num_harts = riscv_array_get_num_harts(&s->soc[socket]);
+        clint_cells =  g_new0(uint32_t, num_harts * 4);
 
-        clint_cells =  g_new0(uint32_t, s->soc[socket].num_harts * 4);
-
-        for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
+        for (cpu = num_harts - 1; cpu >= 0; cpu--) {
             cpu_phandle = phandle++;
 
             cpu_name = g_strdup_printf("/cpus/cpu@%d",
@@ -111,7 +112,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             } else {
                 qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
             }
-            name = riscv_isa_string(&s->soc[socket].harts[cpu]);
+            name = riscv_isa_string(riscv_array_get_hart(&s->soc[socket], cpu));
             qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
             g_free(name);
             qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
@@ -164,7 +165,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
         qemu_fdt_setprop_cells(fdt, clint_name, "reg",
             0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
-            clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+            clint_cells, num_harts * sizeof(uint32_t) * 4);
         riscv_socket_fdt_write_id(mc, fdt, clint_name, socket);
 
         g_free(clint_name);
@@ -229,7 +230,7 @@ static void spike_board_init(MachineState *machine)
                                 base_hartid, &error_abort);
         object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
                                 hart_count, &error_abort);
-        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
+        riscv_hart_array_realize(&s->soc[i], &error_abort);
 
         /* Core Local Interruptor (timer and IPI) for each socket */
         riscv_aclint_swi_create(
@@ -311,7 +312,7 @@ static void spike_board_init(MachineState *machine)
 
     /* initialize HTIF using symbols found in load_kernel */
     htif_mm_init(system_memory, mask_rom,
-                 &s->soc[0].harts[0].env, serial_hd(0),
+                 &riscv_array_get_hart(&s->soc[0], 0)->env, serial_hd(0),
                  memmap[SPIKE_HTIF].base);
 }
 
-- 
2.35.1


