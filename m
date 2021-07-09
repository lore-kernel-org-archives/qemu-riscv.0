Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hEj-0007aO-U0
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hEi-0007Xf-LW; Thu, 08 Jul 2021 23:31:32 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:20351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hEc-0006bj-Um; Thu, 08 Jul 2021 23:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625801485; x=1657337485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RhlKZ9j17LJcDAtKf/vTdfdaiQmZvsjUSYrAvS4f5+8=;
 b=CN+n8DvbTwdcaqwv3aQDz5r0zkJRC8cXh7ijWeUjPIMgA0FDE5vBmMzy
 YxZIXijYDmKdDLQKFQLevbVtLwv6ntxVKUrrQNAxlPvqnUUIBC4dINbwr
 YeM5Qit1Rr9rbDJdd8mCa8+QisnT0vZcM2keA8+nPx6lht8KdVkqEJ4qn
 khDh2umGdPitglYFfXZ0Wnno/uorSiDDSW7anC9MKfRHJ96alZN137L3P
 VyjpqG01zRH4u17gO2gvZ6kCB1ov1NYC9X4f3DkyijYCXOT2jWitxYBAw
 ZRy6YPQMETgW3JSaf2aeoGCtnLsrY+Gvt98RY+bYVYgvKIENCZLyVN/LX A==;
IronPort-SDR: WLjTO7mDXFdNjHHPsk5RPurRJYwoJ464RqelqOt/L6dR4QUxVefVyTPTUeaZ/4bC1NQvSlv9kI
 zXufrceRpjUfj9g8hq0MQ0Kq3OpWHhmLaLkbi7Ot0R1HDbKyZQRI4kzuk9kFUh5ZEQ2M34hDdS
 XS3kHYZcOsuHI+QciRFW0yoUF9x8fh+uXqd4/3t/uom1+Y9DpGXoP+6Qpstw5pqO3IWsxhf/mR
 seHtCp11KpgCFNNBE8jneJ0NLbQgHqAC5vOxQiCVYlGxUvw/lQ0UBL1BDRBZhYa+bF98iOXusB
 rLc=
X-IronPort-AV: E=Sophos;i="5.84,225,1620662400"; d="scan'208";a="174125082"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2021 11:31:23 +0800
IronPort-SDR: aEYzump55EN1AmA4Q0R7iaT1He3+okTVkb5B8Z87XJ2Ey6zVBqIQoDWM2+uDQ65ApwzX1H38xG
 6/764AePNM3v6bV6B2I+NbZ07tvsJhrTS53rBKSHQDfA8DGN+5Seef23XkyEHcVw/Iz/9SOAqW
 n4I+e22Bdomxip5P1GIR7Bd/CW01cUYXnMcOe2auUPXBcmA2hFKBtZ2zuEByA2NCN0fdMh6w5H
 feCxMX5f2TQTSnjkl36g/vmVB0wxlVQPHYe5yUdYbVhyeHofZZhLHbSs8PuWkoDPtU81dEi6Ha
 2qc2TLO2xBFjVEyrHccGUWRB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 20:08:22 -0700
IronPort-SDR: HI5rmOPOV62dd2/HvF3gMpRrvqhr7z9gHyhtd0lbukNLP/UnGSL949iOLBHE6KQh5NRsaeBSNt
 NeemUceOthilCTgKskU/ma68X0jslr5x6JRWEKpgAtiLtj47Zh1zSXxFrLCekvciPqeL/4yrmy
 ajmw2oB7JvMIOHYBzzihAZzFTKtW10zxQMgsDQOY4+ffUnVAAwmWzuu2C0PeIfJC53EBFFZQTD
 q57yW0Ws4rDZmLR1OaCkbxJinN1QIDGJLLq83KEbEsqwIuiMxQtmMFArpSKfL9iRZjJQbTHdm/
 YRw=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.107])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2021 20:31:19 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 4/5] hw/intc: sifive_plic: Convert the PLIC to use RISC-V
 CPU GPIO lines
Date: Fri,  9 Jul 2021 13:31:17 +1000
Message-Id: <a5f2909ca7fd9637ad90da0be9661f1e718e3dc5.1625801410.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=81790befc=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 09 Jul 2021 03:31:33 -0000

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the external MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/sifive_plic.h |  4 ++++
 hw/intc/sifive_plic.c         | 38 ++++++++++++++++++++++++++++-------
 hw/riscv/microchip_pfsoc.c    |  2 +-
 hw/riscv/shakti_c.c           |  3 ++-
 hw/riscv/sifive_e.c           |  2 +-
 hw/riscv/sifive_u.c           |  2 +-
 hw/riscv/virt.c               |  3 ++-
 7 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.h
index 1e451a270c..da1dc64c6d 100644
--- a/include/hw/intc/sifive_plic.h
+++ b/include/hw/intc/sifive_plic.h
@@ -72,9 +72,13 @@ struct SiFivePLICState {
     uint32_t context_base;
     uint32_t context_stride;
     uint32_t aperture_size;
+
+    qemu_irq *s_external_irqs;
+    qemu_irq *m_external_irqs;
 };
 
 DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
+    uint32_t num_harts,
     uint32_t hartid_base, uint32_t num_sources,
     uint32_t num_priorities, uint32_t priority_base,
     uint32_t pending_base, uint32_t enable_base,
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 78903beb06..dc17b55408 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -29,6 +29,7 @@
 #include "hw/intc/sifive_plic.h"
 #include "target/riscv/cpu.h"
 #include "migration/vmstate.h"
+#include "hw/irq.h"
 
 #define RISCV_DEBUG_PLIC 0
 
@@ -139,18 +140,22 @@ static void sifive_plic_update(SiFivePLICState *plic)
     for (addrid = 0; addrid < plic->num_addrs; addrid++) {
         uint32_t hartid = plic->addr_config[addrid].hartid;
         PLICMode mode = plic->addr_config[addrid].mode;
-        CPUState *cpu = qemu_get_cpu(hartid);
-        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
-        if (!env) {
-            continue;
-        }
         int level = sifive_plic_irqs_pending(plic, addrid);
+
         switch (mode) {
         case PLICMode_M:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
+            if (level) {
+                qemu_irq_raise(plic->m_external_irqs[hartid]);
+            } else {
+                qemu_irq_lower(plic->m_external_irqs[hartid]);
+            }
             break;
         case PLICMode_S:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
+            if (level) {
+                qemu_irq_raise(plic->s_external_irqs[hartid]);
+            } else {
+                qemu_irq_lower(plic->s_external_irqs[hartid]);
+            }
             break;
         default:
             break;
@@ -456,6 +461,12 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
     qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
 
+    plic->s_external_irqs = g_malloc(sizeof(qemu_irq) * plic->num_harts);
+    qdev_init_gpio_out(dev, plic->s_external_irqs, plic->num_harts);
+
+    plic->m_external_irqs = g_malloc(sizeof(qemu_irq) * plic->num_harts);
+    qdev_init_gpio_out(dev, plic->m_external_irqs, plic->num_harts);
+
     /* We can't allow the supervisor to control SEIP as this would allow the
      * supervisor to clear a pending external interrupt which will result in
      * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
@@ -520,6 +531,7 @@ type_init(sifive_plic_register_types)
  * Create PLIC device.
  */
 DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
+    uint32_t num_harts,
     uint32_t hartid_base, uint32_t num_sources,
     uint32_t num_priorities, uint32_t priority_base,
     uint32_t pending_base, uint32_t enable_base,
@@ -527,6 +539,8 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
     uint32_t context_stride, uint32_t aperture_size)
 {
     DeviceState *dev = qdev_new(TYPE_SIFIVE_PLIC);
+    int i;
+
     assert(enable_stride == (enable_stride & -enable_stride));
     assert(context_stride == (context_stride & -context_stride));
     qdev_prop_set_string(dev, "hart-config", hart_config);
@@ -542,5 +556,15 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
     qdev_prop_set_uint32(dev, "aperture-size", aperture_size);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    for (i = 0; i < num_harts; i++) {
+        CPUState *cpu = qemu_get_cpu(hartid_base + i);
+
+        qdev_connect_gpio_out_named(dev, NULL, i,
+                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
+        qdev_connect_gpio_out_named(dev, NULL, num_harts + i,
+                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
+    }
+
     return dev;
 }
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index eb8e79e0a1..eef55f69fd 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -274,7 +274,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
 
     /* PLIC */
     s->plic = sifive_plic_create(memmap[MICROCHIP_PFSOC_PLIC].base,
-        plic_hart_config, 0,
+        plic_hart_config, ms->smp.cpus, 0,
         MICROCHIP_PFSOC_PLIC_NUM_SOURCES,
         MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES,
         MICROCHIP_PFSOC_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 18f70fadaa..09d4e1433e 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -106,13 +106,14 @@ type_init(shakti_c_machine_type_info_register)
 
 static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(dev);
     MemoryRegion *system_memory = get_system_memory();
 
     sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
 
     sss->plic = sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base,
-        (char *)SHAKTI_C_PLIC_HART_CONFIG, 0,
+        (char *)SHAKTI_C_PLIC_HART_CONFIG, ms->smp.cpus, 0,
         SHAKTI_C_PLIC_NUM_SOURCES,
         SHAKTI_C_PLIC_NUM_PRIORITIES,
         SHAKTI_C_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index ddc658c8d6..03bff21527 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -198,7 +198,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
 
     /* MMIO */
     s->plic = sifive_plic_create(memmap[SIFIVE_E_DEV_PLIC].base,
-        (char *)SIFIVE_E_PLIC_HART_CONFIG, 0,
+        (char *)SIFIVE_E_PLIC_HART_CONFIG, ms->smp.cpus, 0,
         SIFIVE_E_PLIC_NUM_SOURCES,
         SIFIVE_E_PLIC_NUM_PRIORITIES,
         SIFIVE_E_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 273c86418c..6d1f9464c2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -829,7 +829,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
 
     /* MMIO */
     s->plic = sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,
-        plic_hart_config, 0,
+        plic_hart_config, ms->smp.cpus, 0,
         SIFIVE_U_PLIC_NUM_SOURCES,
         SIFIVE_U_PLIC_NUM_PRIORITIES,
         SIFIVE_U_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a3cd2599a..8bbafae429 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -548,6 +548,7 @@ static void virt_machine_init(MachineState *machine)
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
+    MachineState *ms = MACHINE(qdev_get_machine());
     char *plic_hart_config, *soc_name;
     size_t plic_hart_config_len;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
@@ -619,7 +620,7 @@ static void virt_machine_init(MachineState *machine)
         /* Per-socket PLIC */
         s->plic[i] = sifive_plic_create(
             memmap[VIRT_PLIC].base + i * memmap[VIRT_PLIC].size,
-            plic_hart_config, base_hartid,
+            plic_hart_config, ms->smp.cpus, base_hartid,
             VIRT_PLIC_NUM_SOURCES,
             VIRT_PLIC_NUM_PRIORITIES,
             VIRT_PLIC_PRIORITY_BASE,
-- 
2.31.1


