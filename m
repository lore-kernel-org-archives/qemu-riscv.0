Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3ZGJ-0004QV-LV
	for mharc-qemu-riscv@gnu.org; Wed, 14 Jul 2021 03:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZGI-0004PJ-Qe; Wed, 14 Jul 2021 03:24:54 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:37162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZGG-0007LD-Gi; Wed, 14 Jul 2021 03:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626247492; x=1657783492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VjHj56vum6MlPtczkLtNzIuDgo2GZwTmgWkz10TT0cQ=;
 b=QpEFq5XuEmJ1ujcTE8J94GNCBQiHcNx+jpw/+32Vx0FrarY7UiZJMjZz
 cNHH4OyOS4PAdILtDLwnRfkaR6xL7I9PBKDqnNCzNlX1w2WO5D5VU6B+a
 Tt4O7aFvwcEvqFeTHMKMP4puIZ9xDPYOLzFFoEIWwGH6uby5oyKk1xLKf
 Yo6MD0y3MCUL88bd9pMMqVWv9CmDw0gQW2Csuc538ydzCCaoyX7zaWG4c
 fMmEDKrEgKBCxItvncxVgvPyJbofAQpsEMV+tBryY1VIUVrJSyLLd3zNT
 ac433N1+4sWVZzaDHux/kan8sGJvBA+ap5FU5xjxHPWcEukRHzE8NtI2N w==;
IronPort-SDR: 2Tssb2Fy8R671PaBSBDG4HXIye25w7v138Rh6tnzI+16WOd/lWXwUThAsx+7E/2W6foHypN7PA
 VE/xilWfSq/aA0X/2KhEheUYv8/STCIZrt7pFAUmMKBY9XDepWQMaXKW4lNdwSjbG9aqKFxB6w
 xu8qLrRaRFIXAXkCR5ObvOKhIpK00N63FDjA0lSKDXt+igplxyvv3izugLuWfVvN60O9wQrZ/S
 2v64wbktaaqMTPahF8XlOhMCRlD68qjYYlMeP47Qa0et1BIDoJCDRr0PrBRyHt/zIWR8Aybsoi
 LVU=
X-IronPort-AV: E=Sophos;i="5.84,238,1620662400"; d="scan'208";a="286068373"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2021 15:24:50 +0800
IronPort-SDR: By4zLhbsPHXP+BdvXbVi4AD98KaWhYBFmQD8s6JvIsJ7LMYyQkiQUhbPQD7hCf+K8xVFFJCp1J
 7VMIlOtJN4tmznfQwAGmx9Dsma8ogO6Hj4eepDx0EuQnF3E39DlP5ngZiHtaFzCF6AWob5gr1b
 wbV1QFotmpwEwTPr/NVQZl1VypFi/mt4ibutFmn3mEill3Qds7OJTlWWQtTAkEs6z0PlGtO2/o
 rJIeaX8ZUs9+VnPaCVLDZ2zNCOpG5SwECylq/+7VG2RWbbd4XfnZaxH7sxy3nDrVE7/IWtoBek
 o1/P2iJbdLltqLdmb9FXZyqX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 00:02:54 -0700
IronPort-SDR: CmiR/4B7tWVU9vVoyLWAHkbHwxnnmVxeKx/rhM2KfYZDqNAS/cNKPSG5YOih4ypBHwrn5y/wZz
 Ybgk8dqhbNsbnIeqEXa8p4qJCzI3n/CpNMrKBNkcVZNVvc8sydoOQA7jBI7MhUM7gIJXzeY69T
 Z/ygLqTks+qdxoDs4UjT9ZwSI2DLhjTKaMxCvVOZnXPcXQPKq9aTfPv4VxcJceH6wkyb7YiQTg
 qbQisLtHLuZuOGcWptb+imuXo5DDLhGVGPDMDbafSnUH+UEo+FR0+GvQAB4SvnqJ10pnk3h1f1
 mcc=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.112])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Jul 2021 00:24:46 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 2/5] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
Date: Wed, 14 Jul 2021 17:24:44 +1000
Message-Id: <f1335c317c3930706a9220271a012804ec6b0e04.1626247467.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
References: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=8220343f1=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 14 Jul 2021 07:24:55 -0000

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the timer and soft MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/sifive_clint.h |  2 +
 hw/intc/sifive_clint.c         | 68 ++++++++++++++++++++++++----------
 2 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clint.h
index a30be0f3d6..921b1561dd 100644
--- a/include/hw/intc/sifive_clint.h
+++ b/include/hw/intc/sifive_clint.h
@@ -40,6 +40,8 @@ typedef struct SiFiveCLINTState {
     uint32_t time_base;
     uint32_t aperture_size;
     uint32_t timebase_freq;
+    qemu_irq *timer_irqs;
+    qemu_irq *soft_irqs;
 } SiFiveCLINTState;
 
 DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
index 0f41e5ea1c..8a460fdf00 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/sifive_clint.c
@@ -28,6 +28,12 @@
 #include "hw/qdev-properties.h"
 #include "hw/intc/sifive_clint.h"
 #include "qemu/timer.h"
+#include "hw/irq.h"
+
+typedef struct sifive_clint_callback {
+    SiFiveCLINTState *s;
+    int num;
+} sifive_clint_callback;
 
 static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 {
@@ -39,7 +45,9 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
  * Called when timecmp is written to update the QEMU timer or immediately
  * trigger timer interrupt if mtimecmp <= current timer value.
  */
-static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
+static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cpu,
+                                       int hartid,
+                                       uint64_t value,
                                        uint32_t timebase_freq)
 {
     uint64_t next;
@@ -51,12 +59,12 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
     if (cpu->env.timecmp <= rtc_r) {
         /* if we're setting an MTIMECMP value in the "past",
            immediately raise the timer interrupt */
-        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+        qemu_irq_raise(s->timer_irqs[hartid - s->hartid_base]);
         return;
     }
 
     /* otherwise, set up the future timer interrupt */
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
+    qemu_irq_lower(s->timer_irqs[hartid - s->hartid_base]);
     diff = cpu->env.timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
@@ -70,8 +78,9 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
  */
 static void sifive_clint_timer_cb(void *opaque)
 {
-    RISCVCPU *cpu = opaque;
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+    sifive_clint_callback *state = opaque;
+
+    qemu_irq_raise(state->s->timer_irqs[state->num]);
 }
 
 /* CPU wants to read rtc or timecmp register */
@@ -137,7 +146,7 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
         if (!env) {
             error_report("clint: invalid timecmp hartid: %zu", hartid);
         } else if ((addr & 0x3) == 0) {
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(value));
+            qemu_set_irq(clint->soft_irqs[hartid - clint->hartid_base], value);
         } else {
             error_report("clint: invalid sip write: %08x", (uint32_t)addr);
         }
@@ -153,13 +162,13 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
         } else if ((addr & 0x7) == 0) {
             /* timecmp_lo */
             uint64_t timecmp_hi = env->timecmp >> 32;
-            sifive_clint_write_timecmp(RISCV_CPU(cpu),
+            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
                 timecmp_hi << 32 | (value & 0xFFFFFFFF), clint->timebase_freq);
             return;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
             uint64_t timecmp_lo = env->timecmp;
-            sifive_clint_write_timecmp(RISCV_CPU(cpu),
+            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
                 value << 32 | (timecmp_lo & 0xFFFFFFFF), clint->timebase_freq);
         } else {
             error_report("clint: invalid timecmp write: %08x", (uint32_t)addr);
@@ -205,6 +214,12 @@ static void sifive_clint_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_clint_ops, s,
                           TYPE_SIFIVE_CLINT, s->aperture_size);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+
+    s->timer_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
+    qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
+
+    s->soft_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
+    qdev_init_gpio_out(dev, s->soft_irqs, s->num_harts);
 }
 
 static void sifive_clint_class_init(ObjectClass *klass, void *data)
@@ -228,7 +243,6 @@ static void sifive_clint_register_types(void)
 
 type_init(sifive_clint_register_types)
 
-
 /*
  * Create CLINT device.
  */
@@ -238,29 +252,43 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
     bool provide_rdtime)
 {
     int i;
+
+    DeviceState *dev = qdev_new(TYPE_SIFIVE_CLINT);
+    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
+    qdev_prop_set_uint32(dev, "num-harts", num_harts);
+    qdev_prop_set_uint32(dev, "sip-base", sip_base);
+    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
+    qdev_prop_set_uint32(dev, "time-base", time_base);
+    qdev_prop_set_uint32(dev, "aperture-size", size);
+    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
     for (i = 0; i < num_harts; i++) {
         CPUState *cpu = qemu_get_cpu(hartid_base + i);
+        RISCVCPU *rvcpu = RISCV_CPU(cpu);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+        sifive_clint_callback *cb = g_malloc0(sizeof(sifive_clint_callback));
+
         if (!env) {
+            g_free(cb);
             continue;
         }
         if (provide_rdtime) {
             riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
         }
+
+        cb->s = SIFIVE_CLINT(dev);
+        cb->num = i;
         env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                  &sifive_clint_timer_cb, cpu);
+                                  &sifive_clint_timer_cb, cb);
         env->timecmp = 0;
+
+        qdev_connect_gpio_out_named(dev, NULL, i,
+                           qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
+        qdev_connect_gpio_out_named(dev, NULL, num_harts + i,
+                           qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_SOFT));
     }
 
-    DeviceState *dev = qdev_new(TYPE_SIFIVE_CLINT);
-    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
-    qdev_prop_set_uint32(dev, "num-harts", num_harts);
-    qdev_prop_set_uint32(dev, "sip-base", sip_base);
-    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
-    qdev_prop_set_uint32(dev, "time-base", time_base);
-    qdev_prop_set_uint32(dev, "aperture-size", size);
-    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
     return dev;
 }
-- 
2.31.1


