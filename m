Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3ZGU-0004sh-81
	for mharc-qemu-riscv@gnu.org; Wed, 14 Jul 2021 03:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZGR-0004lo-Ui; Wed, 14 Jul 2021 03:25:03 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:17853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZGQ-0007Sz-2r; Wed, 14 Jul 2021 03:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626247501; x=1657783501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sPgmD1iNk+4mYxbFxG6vLhOE/fB/e/hVYChjwyzM0mI=;
 b=Wc71Tun2BTxEBdWHnA3Lk0NzobMUq7wR+hHoO/i8g6OcLIG7jiqsLPOC
 vUTm48xqGV9DtzZClHqpxyJnOol07GZVfmMuOn8oG8i6yMnn55XiUAdaI
 k0PfV2UfQrqd5wwzcdqa/fgiq+WaXeD02PHjeiIQbk8uu/OpmIwl6I/rx
 PoXhMezqwoHiPe4fWEzin0CAGn+y6hdy3pNtmXuaaY9lBn4gCnp/sXf3u
 /5w9c8EZ5B7nW7yTIqc2BOGVpqgYJxbI/QSYMby7+OZ8NW/j+kpJpyZ8k
 BDMVWgy4dkvASKavW80KKm2iIPGSRyg2VxFMaX2pzxzWKPO3qwYvxOfJo g==;
IronPort-SDR: CkJHCVWMDxLSxEvatw5yE2C+ueiwsjEgxpWpGYLqbmNBdK+1dxDE2pPvkZyobGtrkaAr/pWPDi
 Y4/S3g8SzWWvcvJsyk13TBGgMk9SB6AvmPI3gp9fVTTgePxASXCn76FitfmObLzoioRZccM24T
 GM+WIcL3Ozf9KqFqsA+bWZ/y3vozEKH3PPhA2X8UrUsAbfUBaVpSz1s7QXHNxeXcdQt7HzA0o7
 JNzoBEzEVuehSnASjJrki3/1ZDfuepGUPpttJCuEuf8D8MjTcLtgrxnL0cVaY3L4bDh7Efe76j
 Y/Q=
X-IronPort-AV: E=Sophos;i="5.84,238,1620662400"; d="scan'208";a="174533784"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2021 15:24:58 +0800
IronPort-SDR: YyF4VFO5wSV+pX5ItpUbWhNF9bjsr3kHQfdIDUUThyKlYO1NYFZasFRVExJuhixCfC/PwQ1/+6
 heorWWiB8XyO5jM2OYl4UMelW7h4zZd0v2IFyF6kOycsB+8ryEnZ7RlobEGrGcJxtiH4k0oC/o
 PUUTHmZbvY5QizbmHjd4t4Xf2PY7TrbGBwz8xgmIRC1zJJZgvIJDlPuzkSzC26iJewbJH6DJfa
 iOJl8ZTHsAsbAopgwxfHY7O89l4ANZEnFt7KQTPrPIRovbsy0hLhEt5NIJAr7YRsvhwqbqwf0V
 M8wH1LeqmdcfDb6crDjq6MVZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 00:01:42 -0700
IronPort-SDR: SW1PtH5lmUuY2/chUUc2rYur3Zhlshizynl7U4jtAlnuu1uvxv7s3LR/VwZLlVmsnyEit0C6Bp
 u+n8dSD9yeTMHJo5zAdQFXxuTt5vyhjlrFL6NYZssd8gQBlvavo90U9AD3ztbj7dvE0BIJC+dB
 wMUzwzityH4Krqw4pTYNNBBtayy6pHDBuq4An16PBYMtMDjhcnOL5QYkX2lRhLmiXYxtB25Ng8
 vqSVR9CZoLuzFOajLQWTkppFlZIwjjBZb9JiJ06O4ucXqoCG3kCtM4896NG3/O267nvdjsF0N/
 XIU=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.112])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Jul 2021 00:24:55 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 3/5] hw/intc: ibex_plic: Convert the PLIC to use RISC-V CPU
 GPIO lines
Date: Wed, 14 Jul 2021 17:24:53 +1000
Message-Id: <569c788eabb3729d561635f17a03fc21d4effc8b.1626247467.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
References: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=8220343f1=alistair.francis@wdc.com;
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
X-List-Received-Date: Wed, 14 Jul 2021 07:25:04 -0000

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the external MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/ibex_plic.h |  2 ++
 hw/intc/ibex_plic.c         | 17 ++++++-----------
 hw/riscv/opentitan.c        |  8 ++++++++
 3 files changed, 16 insertions(+), 11 deletions(-)

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
index edf76e4f61..ff430356f8 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -27,6 +27,7 @@
 #include "target/riscv/cpu_bits.h"
 #include "target/riscv/cpu.h"
 #include "hw/intc/ibex_plic.h"
+#include "hw/irq.h"
 
 static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
 {
@@ -92,19 +93,10 @@ static bool ibex_plic_irqs_pending(IbexPlicState *s, uint32_t context)
 
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
-        }
-
-        level = ibex_plic_irqs_pending(s, 0);
-
-        riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
+        qemu_set_irq(s->external_irqs[i], ibex_plic_irqs_pending(s, 0));
     }
 }
 
@@ -268,6 +260,9 @@ static void ibex_plic_realize(DeviceState *dev, Error **errp)
 
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


