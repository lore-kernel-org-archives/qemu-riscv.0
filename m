Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3ZGf-00051L-Me
	for mharc-qemu-riscv@gnu.org; Wed, 14 Jul 2021 03:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZGZ-0004yH-WA; Wed, 14 Jul 2021 03:25:14 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:58315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZGX-0007Y4-Ou; Wed, 14 Jul 2021 03:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626247518; x=1657783518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UthoiwzbLQtBUVh9bXNXc+4p1ASTcTxTmBlt/hjknT8=;
 b=YAZ33gZdBlVCtFYb5Yn3SAxZXDRGowFrDxelE/UP9Kubdz9M7iCiXvhC
 yIw6jx/eiUxrwbL0T5ehv486vU9YaFH/LrN9XZT7xzZ5ZVH8NiRsF5O5W
 ttyRAiRt2xjM77D/PocOOJ2UIEa4m63tLS1d3couD/a8f8KPTzQR8AAKd
 SQzyAzJy48EQ3A5F2JYhOug8Wc3VbOgKCLjIOOvrq8soQ1ni+WmjqEjjO
 nVJvRCmKDJZG+2jn4IPaLnySwQRNOFIQAAmoKnMp9cIbCA4ATv3Ne2jvG
 yYS+MfrqE5Ik0cRr1RfxjiHfmGdfmTJi11ukRHcFwmDZ8Gtd5SrMCz/c8 A==;
IronPort-SDR: A0CIsQuwr9ZCXsxQBO55SffbD6XSQiAosKc/ikIUBoSjKBBnNC1X6EodTx4R3ty1Iw4vjmcHgu
 txwg+6YommBD3Sn7jzCvPsKTsK2SXdJBIWt5T+6fdflFZXtqmM36mclkQ8fXIOW89lHMwmiUwO
 2PFeNi3dm390Kfyrg73vkEL/yQania/MaCMUZG97TlH2yU3VZcLlC3IFNO9PElHKYAvwXk5NHr
 mKLjIgqc7dE9SDijBOtYo2T6krPy53M/6SmQPN1nd8VnTUgff5lLxLUKWXqBdEIh5BsmOLrHDJ
 Yyw=
X-IronPort-AV: E=Sophos;i="5.84,238,1620662400"; d="scan'208";a="278349828"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2021 15:25:16 +0800
IronPort-SDR: iprGFcreH4H/BMhQZRv2JJsZDNB2idI1C2DMkQMYiKaDeZReZ//zIW5GgeHQN/Sjuh4uYmzc0m
 aa8IS3WCFmUvThtPLH8XmgIDCsG3frmwrkNPP8PFGAoy4EhwioMnFwttlBIQbWjdYVlMle6cbB
 L98Or8ii2qTDQSTwxv30Of371lnQBBdI6W5jvGEwByXOZ3WhhFMfn/5NjTME9WFDd+A0suQw9Y
 8ogGgOmhRjHClKPb/lSRFy5eXm/J0sPKI0bCQJjPyfk45D+bV7ZXdBR9M4ElcmloaT/2IUJAyY
 TmkkU3Y+4UN6kL937CwhWwTB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 00:03:12 -0700
IronPort-SDR: Zr0F2Qbl7WNa+MKXcpHij7oiDnQAo1M8YEmBGuMy9eqY9E7ek2AG8qDS/MUtzdWKQbLmLNCwde
 qLV42dkfyKu9+YPYAAAKuFdwXJ3aFZspx3nz97ZZ4vhL2pWlfvtnaMYc5d96v3r8gML6BC/LGH
 BLk6I5sjEl553QoEu/oDb4D1455g8i+jufMRsxoAQE9wVvqRp94CaANZ7d8aF8gXfsjRMPwMP3
 jWogErxzPolSePYt7XnxZg4ReGbDqgSMEhq4AzDUBqtp6BjLTvIf6saGiYxbLgMjPOGcgBss4b
 bYA=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.112])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Jul 2021 00:25:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 4/5] hw/intc: sifive_plic: Convert the PLIC to use RISC-V
 CPU GPIO lines
Date: Wed, 14 Jul 2021 17:25:02 +1000
Message-Id: <389a6f1d9b73c6a8ee7c2e62c8324ee0dc135302.1626247467.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
References: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=8220343f1=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Wed, 14 Jul 2021 07:25:14 -0000

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the external MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/sifive_plic.h |  4 ++++
 hw/intc/sifive_plic.c         | 30 +++++++++++++++++++++++-------
 hw/riscv/microchip_pfsoc.c    |  2 +-
 hw/riscv/shakti_c.c           |  3 ++-
 hw/riscv/sifive_e.c           |  2 +-
 hw/riscv/sifive_u.c           |  2 +-
 hw/riscv/virt.c               |  2 +-
 7 files changed, 33 insertions(+), 12 deletions(-)

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
index 78903beb06..7a795f0a61 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -29,6 +29,7 @@
 #include "hw/intc/sifive_plic.h"
 #include "target/riscv/cpu.h"
 #include "migration/vmstate.h"
+#include "hw/irq.h"
 
 #define RISCV_DEBUG_PLIC 0
 
@@ -139,18 +140,14 @@ static void sifive_plic_update(SiFivePLICState *plic)
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
+            qemu_set_irq(plic->m_external_irqs[hartid - plic->hartid_base], level);
             break;
         case PLICMode_S:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
+            qemu_set_irq(plic->s_external_irqs[hartid - plic->hartid_base], level);
             break;
         default:
             break;
@@ -456,6 +453,12 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
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
@@ -520,6 +523,7 @@ type_init(sifive_plic_register_types)
  * Create PLIC device.
  */
 DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
+    uint32_t num_harts,
     uint32_t hartid_base, uint32_t num_sources,
     uint32_t num_priorities, uint32_t priority_base,
     uint32_t pending_base, uint32_t enable_base,
@@ -527,6 +531,8 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
     uint32_t context_stride, uint32_t aperture_size)
 {
     DeviceState *dev = qdev_new(TYPE_SIFIVE_PLIC);
+    int i;
+
     assert(enable_stride == (enable_stride & -enable_stride));
     assert(context_stride == (context_stride & -context_stride));
     qdev_prop_set_string(dev, "hart-config", hart_config);
@@ -542,5 +548,15 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
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
index 4a3cd2599a..4db40bacae 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -619,7 +619,7 @@ static void virt_machine_init(MachineState *machine)
         /* Per-socket PLIC */
         s->plic[i] = sifive_plic_create(
             memmap[VIRT_PLIC].base + i * memmap[VIRT_PLIC].size,
-            plic_hart_config, base_hartid,
+            plic_hart_config, hart_count, base_hartid,
             VIRT_PLIC_NUM_SOURCES,
             VIRT_PLIC_NUM_PRIORITIES,
             VIRT_PLIC_PRIORITY_BASE,
-- 
2.31.1


