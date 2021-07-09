Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hEQ-0006e9-18
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hEP-0006Yg-2k; Thu, 08 Jul 2021 23:31:13 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:57105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hEJ-0006UJ-4Y; Thu, 08 Jul 2021 23:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625801470; x=1657337470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Gw9STos6NBwpuzBXsW+NGiKKxmORegyUdoxl6UtuGM=;
 b=oXtJsw5NHYky4tpsZdAfimVmjvPo81h6usYyZnCv50kFPgzmeGPtbnSF
 6Mx3TZuFAq++l+9hj0h4FKcjfD/ZXtsdFXhglGXuKhZALXh+/zHT+RYzW
 MBWQQWbdTyk/rllZozWDN/XnxvyKhsxDnvGElijdgqShQaheMoU+evw6q
 Ob3pXTlmwYqbjmsmmZ6va4xRe2F9ea0Q8o5pT11XLSw9zWyInjdpWNrXn
 t8tEwIWJEyIhGYCeYZbQKexsn8sI1jjvyvCY0CmXDls1FUFtyBBxBfvud
 rplAPuQZU8dKOVcdk3y5AhySv0QZYBy512ij313aAQjloD/XXiNMXhIi6 A==;
IronPort-SDR: mDcTQxHF40eXpOwM1BM2oipQgTlF0K1GakG/vcR2WomdcNZzD7h3zyHc2Iv+mdGEAl+SwvYL6p
 kEl2Otd/DzARBxumdI0OXweDqpfNjqedya53DupzvZpantmHGwPMbMWoamiphzWFC2n8zu624N
 /Ezdwkd0nZuEZlFKq4HdJXCSMvGUs1S1bDNLE50rpe5ITL2x99EX+0EWOmp2dt9EMy5NVvYqRe
 beKj5MDvwB/PgOEU8WrKYq4ZcYJjR8DqxerLwU/TEJga69L8x5FCQHoBOuf4mVY9Z64zK6lafj
 6zs=
X-IronPort-AV: E=Sophos;i="5.84,225,1620662400"; d="scan'208";a="277931119"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2021 11:31:07 +0800
IronPort-SDR: 3adyX6TQx2BmJkknMrN0ssmhtMAE5TZnBYxNQ7TyspXlHfHsxiWlNYYUg1s//H7jCHC3xXIVBb
 WbPJwlIjLiOxbxW+vGx0ULuzo6B7glVkQNEoNyAC9RYRtTkofQ8M08crsuROSb8juIxzP49gZj
 ksxktRyeW8pINY/viXSfRP2cXtnuyVSIHyaWebfP69nA/pS55MbKnEBmgFCmVB3q6GB6jBI2za
 lXWrMqaxC/s2joc9c0BcSZMKYNnWZXjiEVs79gPL+o3HBIOAAW8rUgSMiT5AWO6Idb4JWVOnnC
 lNye8kKsG6J+nGvmYkOy5eG/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 20:08:03 -0700
IronPort-SDR: Eix23Zdt+n5gt6kQTRc6+KREs8Lw4RS5LSk+nEwrOOq+HoJQgvG7A2rlVur5gXK8hMO+K1vImX
 ruS5Di85gRlBYEtuudXp16mrBx1OKGbWR5LBrMVArtOyiceZ7XNA5JOJ9aWepwfovOJuiPaSos
 pTqi6ZVK+Aud9JwluXK8uqdnYWD/kKidi/3gYTlPqJvXErHohDDcJcq5VLsaOZnJnxi9eXktW5
 gOvZalaYfvvVVWgTSO8Ni0pARcGgZwqJ0AP9/XqGhW2KAoYRnxKLDJTDsDbIH1G/IRE7rGHSnS
 YVA=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.107])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2021 20:31:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/5] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
Date: Fri,  9 Jul 2021 13:30:59 +1000
Message-Id: <3a9be7f66702c6fb18ab09ad9db0fdd50b1a7df6.1625801410.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=81790befc=alistair.francis@wdc.com;
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
X-List-Received-Date: Fri, 09 Jul 2021 03:31:13 -0000

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the timer and soft MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/sifive_clint.h |  2 +
 hw/intc/sifive_clint.c         | 72 ++++++++++++++++++++++++----------
 2 files changed, 54 insertions(+), 20 deletions(-)

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
index 0f41e5ea1c..c635a47507 100644
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
+        qemu_irq_raise(s->timer_irqs[hartid]);
         return;
     }
 
     /* otherwise, set up the future timer interrupt */
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
+    qemu_irq_lower(s->timer_irqs[hartid]);
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
@@ -137,7 +146,11 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
         if (!env) {
             error_report("clint: invalid timecmp hartid: %zu", hartid);
         } else if ((addr & 0x3) == 0) {
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(value));
+            if (value) {
+                qemu_irq_raise(clint->soft_irqs[hartid]);
+            } else {
+                qemu_irq_lower(clint->soft_irqs[hartid]);
+            }
         } else {
             error_report("clint: invalid sip write: %08x", (uint32_t)addr);
         }
@@ -153,13 +166,13 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
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
@@ -205,6 +218,12 @@ static void sifive_clint_realize(DeviceState *dev, Error **errp)
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
@@ -228,7 +247,6 @@ static void sifive_clint_register_types(void)
 
 type_init(sifive_clint_register_types)
 
-
 /*
  * Create CLINT device.
  */
@@ -238,29 +256,43 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
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


