Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hEX-0007DS-NI
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hEU-0006z3-Rs; Thu, 08 Jul 2021 23:31:18 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:30630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hES-0006YC-Jr; Thu, 08 Jul 2021 23:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625801476; x=1657337476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6c/KZWs3N+qXZkARwm1MYqVBGr2JMpddi+z+do71ivk=;
 b=JXpAP0tYLxpmT4d4toZcfDVsszRWBw8b97gB+H2MW6sE+l3Kft51RBv6
 0OlgFL/amTKWuQoTNCDSix6RTD1cKJa7iPrOsd58mocmIlxG320TjXdNg
 eHi2v7759zANgJJrGGHaNM1Yi4GHdrsh5kiigk5AZ5Cb1oBISwVyVGw/w
 lGBLX7xRaOmN+5wvUOqgZszldIDMBfOzTUgn7VPplHmktOM/TsQWKEOrN
 0JMy9tjq78qhDObOtQLpNmOQLslbFmxiYcKpuHc4ZvK5SuNdvy2vMH5ei
 IVed7san3AkUAFmlPBrpK8K43iMVcmHcHgz4xddN6wk/ZHf41dZjzVssm w==;
IronPort-SDR: BTowxxGPGUiO395tujgXYEehguwKPwCHWHABBfBmEEu7I5tzr98N3zJy3C2u7MrKv9cgQ62zuc
 uxts308YO1+XJ03jSCuPeoxVgORXEL3q5b2C0f7vrmDlo4UHF4+93wyrBL/KHvjLqdFwa9VAeQ
 qsQ9q9TABtkUR3kzbO4JaEc71tfJRREWxHb2FI5x9kRV304RHFTrwDEt98BHglWNtAoWxTOKyb
 qwzs3y/QX/wOREoXFYmSYa7LCyQOrchqnvKkNM7YE2y752yEk3pnB6eCOfM0+AIOIcQZpl7UuZ
 PLM=
X-IronPort-AV: E=Sophos;i="5.84,225,1620662400"; d="scan'208";a="173363596"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2021 11:31:14 +0800
IronPort-SDR: Ig2ScRhWhkONe3C35jk6p6tNc0KWwal/3PvFYtclwMem/OnUY9NBhMnHigReMjAO+G12D1t3c6
 rJdptd/ur5XNQiUpSh7iiYqu+AGi38A/5PVoKhVntbzOlGXhPYybjZkVTKQ9LJPPKGv/H3n6BQ
 S02QEZ4PFgIUCBY8zNwmO7XBPiSY7P7az7iecLtmqH6awKl21MP9YffX+/6GQSwiqfRxTcTyc1
 jgZy+QLoqvCXsPPBmbtS1Ofk2gvE6KKwg8r4hWngyRdR/xCPNvm7fPDHFuV7BmKw3L3uJKz0tW
 Eyo6awOwjP7WmxkEoj9d4+BZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 20:08:12 -0700
IronPort-SDR: HclBgfyK5GsIzKpNNK7bLceN9AI9xMU3X/T6jpmnbGv4hRodmWi+b8U8s07ZOF7GZjaxtwI2sL
 2mRZh0vyYRrPgOSHVzb0IR7MWjC/teLFQSLLlUtopdaHhQTSQl00N/ioNxihoSsTOmcJTAKJrU
 2r8Q//EFFlVmN7byrjYmQDi6YGF2Va84/EeTreNDJGOtR5OhRij7w5chrN0aeoY7sdsT38Hs7B
 qt+BwK5ggWt8HmdWbzUQvzg/BRKfBQ3NISgbs1/tP4frb0QD1K7RbzxNG6O86yE2EoAmci0E9q
 nLw=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.107])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Jul 2021 20:31:10 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 3/5] hw/intc: ibex_plic: Convert the PLIC to use RISC-V CPU
 GPIO lines
Date: Fri,  9 Jul 2021 13:31:08 +1000
Message-Id: <d3e146a837ee7de3a7b74c7b6ad9021a4a7e6633.1625801410.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=81790befc=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Fri, 09 Jul 2021 03:31:19 -0000

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the external MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/ibex_plic.h |  2 ++
 hw/intc/ibex_plic.c         | 19 +++++++++----------
 hw/riscv/opentitan.c        |  8 ++++++++
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
index 7fc495db99..d596436e06 100644
--- a/include/hw/intc/ibex_plic.h
+++ b/include/hw/intc/ibex_plic.h
@@ -60,6 +60,8 @@ struct IbexPlicState {
     uint32_t threshold_base;
 
     uint32_t claim_base;
+
+    qemu_irq *external_irqs;
 };
 
 #endif /* HW_IBEX_PLIC_H */
diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index edf76e4f61..ae40f10ca1 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -27,6 +27,7 @@
 #include "target/riscv/cpu_bits.h"
 #include "target/riscv/cpu.h"
 #include "hw/intc/ibex_plic.h"
+#include "hw/irq.h"
 
 static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
 {
@@ -92,19 +93,14 @@ static bool ibex_plic_irqs_pending(IbexPlicState *s, uint32_t context)
 
 static void ibex_plic_update(IbexPlicState *s)
 {
-    CPUState *cpu;
-    int level, i;
+    int i;
 
     for (i = 0; i < s->num_cpus; i++) {
-        cpu = qemu_get_cpu(i);
-
-        if (!cpu) {
-            continue;
+        if (ibex_plic_irqs_pending(s, 0)) {
+            qemu_irq_raise(s->external_irqs[i]);
+        } else {
+            qemu_irq_lower(s->external_irqs[i]);
         }
-
-        level = ibex_plic_irqs_pending(s, 0);
-
-        riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
     }
 }
 
@@ -268,6 +264,9 @@ static void ibex_plic_realize(DeviceState *dev, Error **errp)
 
     qdev_init_gpio_in(dev, ibex_plic_irq_request, s->num_sources);
 
+    s->external_irqs = g_malloc(sizeof(qemu_irq) * s->num_cpus);
+    qdev_init_gpio_out(dev, s->external_irqs, s->num_cpus);
+
     /*
      * We can't allow the supervisor to control SEIP as this would allow the
      * supervisor to clear a pending external interrupt which will result in
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index c5a7e3bacb..88a0200972 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -116,6 +116,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     MachineState *ms = MACHINE(qdev_get_machine());
     LowRISCIbexSoCState *s = RISCV_IBEX_SOC(dev_soc);
     MemoryRegion *sys_mem = get_system_memory();
+    int i;
 
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
@@ -142,6 +143,13 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->plic), 0, memmap[IBEX_DEV_PLIC].base);
 
+    for (i = 0; i < ms->smp.cpus; i++) {
+        CPUState *cpu = qemu_get_cpu(i);
+
+        qdev_connect_gpio_out_named(DEVICE(&s->plic), NULL, 0,
+                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
+    }
+
     /* UART */
     qdev_prop_set_chr(DEVICE(&(s->uart)), "chardev", serial_hd(0));
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->uart), errp)) {
-- 
2.31.1


