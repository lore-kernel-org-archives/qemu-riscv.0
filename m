Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJpce-0000pf-8F
	for mharc-qemu-riscv@gnu.org; Tue, 09 Mar 2021 22:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lJpcc-0000mb-IZ; Tue, 09 Mar 2021 22:34:54 -0500
Received: from atcsqr.andestech.com ([60.248.187.195]:45043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lJpcT-0000JW-U7; Tue, 09 Mar 2021 22:34:54 -0500
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12A3YIUE085652;
 Wed, 10 Mar 2021 11:34:18 +0800 (GMT-8)
 (envelope-from dylan@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 10 Mar 2021 11:34:15 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <Alistair.Francis@wdc.com>, <palmer@dabbelt.com>,
 <sagark@eecs.berkeley.edu>, <kbastian@mail.uni-paderborn.de>,
 <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <alankao@andestech.com>, <ruinland@andestech.com>, Dylan Jhong
 <dylan@andestech.com>
Subject: [PATCH 2/3] Andes RISC-V PLMT
Date: Wed, 10 Mar 2021 11:33:57 +0800
Message-ID: <20210310033358.30499-3-dylan@andestech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310033358.30499-1-dylan@andestech.com>
References: <20210310033358.30499-1-dylan@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12A3YIUE085652
Received-SPF: pass client-ip=60.248.187.195; envelope-from=dylan@andestech.com;
 helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 10 Mar 2021 03:34:54 -0000

Andes PLMT (Platform-Level Machine Timer) device provides an
timer functionality and issues timer interrupts.

The Andes PLMT is implemented based on Andes's PLMT specification.

Signed-off-by: Dylan Jhong <dylan@andestech.com>
Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
---
 hw/timer/Kconfig              |   3 +
 hw/timer/andes_plmt.c         | 225 ++++++++++++++++++++++++++++++++++
 hw/timer/meson.build          |   1 +
 include/hw/timer/andes_plmt.h |  50 ++++++++
 4 files changed, 279 insertions(+)
 create mode 100644 hw/timer/andes_plmt.c
 create mode 100644 include/hw/timer/andes_plmt.h

diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 18936ef55b..d96814e5a4 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -1,3 +1,6 @@
+config ANDES_PLMT
+    bool
+
 config ARM_TIMER
     bool
     select PTIMER
diff --git a/hw/timer/andes_plmt.c b/hw/timer/andes_plmt.c
new file mode 100644
index 0000000000..a6adb05199
--- /dev/null
+++ b/hw/timer/andes_plmt.c
@@ -0,0 +1,225 @@
+/*
+ * Andes PLMT (Platform Level Machine Timer)
+ *
+ * Copyright (c) 2021 Andes Tech. Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/timer.h"
+#include "qemu/module.h"
+#include "hw/sysbus.h"
+#include "target/riscv/cpu.h"
+#include "hw/qdev-properties.h"
+#include "hw/timer/andes_plmt.h"
+
+static uint64_t andes_cpu_riscv_read_rtc(uint32_t timebase_freq)
+{
+    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+        timebase_freq, NANOSECONDS_PER_SECOND);
+}
+
+/*
+ * Called when timecmp is written to update the QEMU timer or immediately
+ * trigger timer interrupt if mtimecmp <= current timer value.
+ */
+static void
+andes_plmt_write_timecmp(RISCVCPU *cpu, uint64_t value)
+{
+    uint64_t next;
+    uint64_t diff;
+
+    uint64_t rtc_r = andes_cpu_riscv_read_rtc(ANDES_PLMT_TIMEBASE_FREQ);
+
+    cpu->env.timecmp = (uint64_t)value;
+    if (cpu->env.timecmp <= rtc_r) {
+        /*
+         * if we're setting an MTIMECMP value in the "past",
+         * immediately raise the timer interrupt
+         */
+        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+        return;
+    }
+
+    /* otherwise, set up the future timer interrupt */
+    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
+    diff = cpu->env.timecmp - rtc_r;
+    /* back to ns (note args switched in muldiv64) */
+    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+        muldiv64(diff, NANOSECONDS_PER_SECOND, ANDES_PLMT_TIMEBASE_FREQ);
+    timer_mod(cpu->env.timer, next);
+}
+
+/*
+ * Callback used when the timer set using timer_mod expires.
+ * Should raise the timer interrupt line
+ */
+static void
+andes_plmt_timer_cb(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+}
+
+static uint64_t
+andes_plmt_read(void *opaque, hwaddr addr, unsigned size)
+{
+    AndesPLMTState *plmt = opaque;
+    uint64_t rz = 0;
+
+    if ((addr >= (plmt->timecmp_base)) &&
+        (addr < (plmt->timecmp_base + (plmt->num_harts << 3)))) {
+        /* %8=0:timecmp_lo, %8=4:timecmp_hi */
+        size_t hartid = (addr - plmt->timecmp_base) >> 3;
+        CPUState *cpu = qemu_get_cpu(hartid);
+        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+        if (!env) {
+            error_report("plmt: invalid timecmp hartid: %zu", hartid);
+        } else if ((addr & 0x7) == 0) {
+            rz = env->timecmp & (unsigned long)0xFFFFFFFF;
+        } else if ((addr & 0x7) == 4) {
+            rz = (env->timecmp >> 32) & (unsigned long)0xFFFFFFFF;
+        } else {
+            error_report("plmt: invalid read: %08x", (uint32_t)addr);
+        }
+    } else if (addr == (plmt->time_base)) {
+        /* time_lo */
+        rz = andes_cpu_riscv_read_rtc(ANDES_PLMT_TIMEBASE_FREQ)
+                    & (unsigned long)0xFFFFFFFF;
+    } else if (addr == (plmt->time_base + 4)) {
+        /* time_hi */
+        rz = (andes_cpu_riscv_read_rtc(ANDES_PLMT_TIMEBASE_FREQ) >> 32)
+                    & (unsigned long)0xFFFFFFFF;
+    } else {
+        error_report("plmt: invalid read: %08x", (uint32_t)addr);
+    }
+
+    return rz;
+}
+
+static void
+andes_plmt_write(void *opaque, hwaddr addr, uint64_t value, unsigned size)
+{
+    AndesPLMTState *plmt = opaque;
+
+    if ((addr >= (plmt->timecmp_base)) &&
+        (addr < (plmt->timecmp_base + (plmt->num_harts << 3)))) {
+        /* %8=0:timecmp_lo, %8=4:timecmp_hi */
+        size_t hartid = (addr - plmt->timecmp_base) >> 3;
+        CPUState *cpu = qemu_get_cpu(hartid);
+        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+        if (!env) {
+            error_report("plmt: invalid timecmp hartid: %zu", hartid);
+        } else if ((addr & 0x7) == 0) {
+            uint64_t timecmp_hi = (unsigned long)env->timecmp >> 32;
+            andes_plmt_write_timecmp(RISCV_CPU(cpu),
+                (timecmp_hi << 32) | (value & (unsigned long)0xFFFFFFFF));
+        } else if ((addr & 0x7) == 4) {
+            uint64_t timecmp_lo = env->timecmp;
+            andes_plmt_write_timecmp(RISCV_CPU(cpu),
+                (value << 32) | (timecmp_lo & (unsigned long)0xFFFFFFFF));
+        } else {
+            error_report("plmt: invalid write: %08x", (uint32_t)addr);
+        }
+    } else if (addr == (plmt->time_base)) {
+        /* time_lo */
+        error_report("plmt: time_lo write not implemented");
+    } else if (addr == (plmt->time_base + 4)) {
+        /* time_hi */
+        error_report("plmt: time_hi write not implemented");
+    } else {
+        error_report("plmt: invalid write: %08x", (uint32_t)addr);
+    }
+}
+
+static const MemoryRegionOps andes_plmt_ops = {
+    .read = andes_plmt_read,
+    .write = andes_plmt_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8
+    }
+};
+
+static Property andes_plmt_properties[] = {
+    DEFINE_PROP_UINT32("num-harts", AndesPLMTState, num_harts, 0),
+    DEFINE_PROP_UINT32("time-base", AndesPLMTState, time_base, 0),
+    DEFINE_PROP_UINT32("timecmp-base", AndesPLMTState, timecmp_base, 0),
+    DEFINE_PROP_UINT32("aperture-size", AndesPLMTState, aperture_size, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void andes_plmt_realize(DeviceState *dev, Error **errp)
+{
+    AndesPLMTState *s = ANDES_PLMT(dev);
+    memory_region_init_io(&s->mmio, OBJECT(dev), &andes_plmt_ops, s,
+        TYPE_ANDES_PLMT, s->aperture_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+}
+
+static void andes_plmt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = andes_plmt_realize;
+    device_class_set_props(dc, andes_plmt_properties);
+}
+
+static const TypeInfo andes_plmt_info = {
+    .name = TYPE_ANDES_PLMT,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AndesPLMTState),
+    .class_init = andes_plmt_class_init,
+};
+
+static void andes_plmt_register_types(void)
+{
+    type_register_static(&andes_plmt_info);
+}
+
+type_init(andes_plmt_register_types)
+
+/*
+ * Create PLMT device.
+ */
+DeviceState*
+andes_plmt_create(hwaddr addr, hwaddr size, uint32_t num_harts,
+    uint32_t time_base, uint32_t timecmp_base)
+{
+    int i;
+    for (i = 0; i < num_harts; i++) {
+        CPUState *cpu = qemu_get_cpu(i);
+        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+        if (!env) {
+            continue;
+        }
+        riscv_cpu_set_rdtime_fn(env, andes_cpu_riscv_read_rtc,
+            ANDES_PLMT_TIMEBASE_FREQ);
+
+        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                  &andes_plmt_timer_cb, cpu);
+        env->timecmp = 0;
+    }
+
+    DeviceState *dev = qdev_new(TYPE_ANDES_PLMT);
+    qdev_prop_set_uint32(dev, "num-harts", num_harts);
+    qdev_prop_set_uint32(dev, "time-base", time_base);
+    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
+    qdev_prop_set_uint32(dev, "aperture-size", size);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    return dev;
+}
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 26c2701fd7..02c1f205cc 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -35,4 +35,5 @@ softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
 
+specific_ss.add(when: 'CONFIG_ANDES_PLMT', if_true: files('andes_plmt.c'))
 specific_ss.add(when: 'CONFIG_AVR_TIMER16', if_true: files('avr_timer16.c'))
diff --git a/include/hw/timer/andes_plmt.h b/include/hw/timer/andes_plmt.h
new file mode 100644
index 0000000000..8864013d6f
--- /dev/null
+++ b/include/hw/timer/andes_plmt.h
@@ -0,0 +1,50 @@
+/*
+ * Andes PLMT (Platform Level Machine Timer) interface
+ *
+ * Copyright (c) 2021 Andes Tech. Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_ANDES_PLMT_H
+#define HW_ANDES_PLMT_H
+
+#define TYPE_ANDES_PLMT "riscv.andes.plmt"
+
+#define ANDES_PLMT(obj) \
+    OBJECT_CHECK(AndesPLMTState, (obj), TYPE_ANDES_PLMT)
+
+typedef struct AndesPLMTState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t num_harts;
+    uint32_t time_base;
+    uint32_t timecmp_base;
+    uint32_t aperture_size;
+} AndesPLMTState;
+
+DeviceState *
+andes_plmt_create(hwaddr addr, hwaddr size, uint32_t num_harts,
+    uint32_t time_base, uint32_t timecmp_base);
+
+enum {
+    ANDES_PLMT_TIME_BASE = 0,
+    ANDES_PLMT_TIMECMP_BASE = 8,
+    ANDES_PLMT_MMIO_SIZE = 0x100000,
+    ANDES_PLMT_TIMEBASE_FREQ = 60 * 1000 * 1000
+};
+
+#endif
-- 
2.17.1


