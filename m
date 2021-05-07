Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lf0Sy-0007zA-8w
	for mharc-qemu-riscv@gnu.org; Fri, 07 May 2021 09:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgX-0004aM-RP; Fri, 07 May 2021 04:18:09 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:50030 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgS-0005jj-D6; Fri, 07 May 2021 04:18:09 -0400
Received: from localhost.localdomain (unknown [121.232.13.213])
 by APP-05 (Coremail) with SMTP id zQCowAB3fSnh9pRgTQ5HAQ--.1834S5;
 Fri, 07 May 2021 16:14:27 +0800 (CST)
From: wangjunqiang <wangjunqiang@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 alapha23@gmail.com, liweiwei@iscas.ac.cn,
 wangjunqiang <wangjunqiang@iscas.ac.cn>
Subject: [RFC PATCH 3/5] hw/intc: Add Nuclei Systimer
Date: Fri,  7 May 2021 16:16:52 +0800
Message-Id: <20210507081654.11056-4-wangjunqiang@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
References: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
X-CM-TRANSID: zQCowAB3fSnh9pRgTQ5HAQ--.1834S5
X-Coremail-Antispam: 1UD129KBjvJXoW3urykCw4DGw1fuFW5Ww4UArb_yoWktFWxpF
 WkKa43Kw1UGF47G397Cw1DXFn3JwsrCF4DJ3Z7Ca12kF47G348G34qkFWayFZ7AFWkWFWr
 JF95XF15GF45A3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8ZwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBWlkUUUUU=
X-Originating-IP: [121.232.13.213]
X-CM-SenderInfo: pzdqwy5xqtxt1qj6x2xfdvhtffof0/1tbiCwoOAFz4kC9qyQABs2
Received-SPF: none client-ip=159.226.251.25;
 envelope-from=wangjunqiang@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 May 2021 09:24:22 -0400
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
X-List-Received-Date: Fri, 07 May 2021 08:18:10 -0000

This patch provides an implementation of Nuclei Systimer,
which like clint. In MCU mode, It only work for hart-0.
MultiCore support will run on 200t board for Linux.

https://doc.nucleisys.com/nuclei_spec/isa/timer.html

Signed-off-by: Wang Junqiang <wangjunqiang@iscas.ac.cn>
---
 hw/intc/Kconfig                   |   3 +
 hw/intc/meson.build               |   1 +
 hw/intc/nuclei_systimer.c         | 254 ++++++++++++++++++++++++++++++
 include/hw/intc/nuclei_systimer.h |  70 ++++++++
 4 files changed, 328 insertions(+)
 create mode 100644 hw/intc/nuclei_systimer.c
 create mode 100644 include/hw/intc/nuclei_systimer.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index eab30f6ffd..70059d96fa 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -76,3 +76,6 @@ config M68K_IRQC
 
 config NUCLEI_ECLIC
     bool
+
+config NUCLEI_SYSTIMER
+    bool
\ No newline at end of file
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 7577ba69d2..d064f769ee 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -51,6 +51,7 @@ specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_NUCLEI_ECLIC', if_true: files('nuclei_eclic.c'))
+specific_ss.add(when: 'CONFIG_NUCLEI_SYSTIMER', if_true: files('nuclei_systimer.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
 		if_true: files('xics_kvm.c'))
diff --git a/hw/intc/nuclei_systimer.c b/hw/intc/nuclei_systimer.c
new file mode 100644
index 0000000000..7d5f97b54c
--- /dev/null
+++ b/hw/intc/nuclei_systimer.c
@@ -0,0 +1,254 @@
+/*
+ *  NUCLEI TIMER (Timer Unit) interface
+ *
+ * Copyright (c) 2020 Gao ZhiYuan <alapha23@gmail.com>
+ * Copyright (c) 2020-2021 PLCT Lab.All rights reserved.
+ *
+ * This provides a parameterizable timer controller based on NucLei's Systimer.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 3 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/timer.h"
+#include "target/riscv/cpu.h"
+#include "hw/intc/nuclei_systimer.h"
+#include "hw/intc/nuclei_eclic.h"
+#include "hw/registerfields.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+static uint64_t cpu_riscv_read_rtc(uint64_t timebase_freq)
+{
+    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                    timebase_freq, NANOSECONDS_PER_SECOND);
+}
+
+static void nuclei_timer_update_compare(NucLeiSYSTIMERState *s)
+{
+    CPUState *cpu = qemu_get_cpu(0);
+    CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+    uint64_t cmp, real_time;
+    int64_t diff;
+
+    real_time = s->mtime_lo | ((uint64_t)s->mtime_hi << 32);
+
+    cmp = (uint64_t)s->mtimecmp_lo | ((uint64_t)s->mtimecmp_hi << 32);
+    env->mtimecmp = cmp;
+    env->timecmp = cmp;
+
+    diff = cmp - real_time;
+
+    if (real_time >= cmp) {
+        qemu_set_irq(*(s->timer_irq), 1);
+    } else {
+        qemu_set_irq(*(s->timer_irq), 0);
+
+        if (s->mtimecmp_hi != 0xffffffff) {
+            uint64_t next_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+            muldiv64(diff, NANOSECONDS_PER_SECOND, s->timebase_freq);
+            timer_mod(env->mtimer, next_ns);
+        }
+    }
+}
+
+static void nuclei_timer_reset(DeviceState *dev)
+{
+    NucLeiSYSTIMERState *s = NUCLEI_SYSTIMER(dev);
+    s->mtime_lo = 0x0;
+    s->mtime_hi = 0x0;
+    s->mtimecmp_lo = 0xFFFFFFFF;
+    s->mtimecmp_hi = 0xFFFFFFFF;
+    s->mstop = 0x0;
+    s->mstop = 0x0;
+}
+
+static uint64_t nuclei_timer_read(void *opaque, hwaddr offset,
+                                  unsigned size)
+{
+    NucLeiSYSTIMERState *s = NUCLEI_SYSTIMER(opaque);
+    CPUState *cpu = qemu_get_cpu(0);
+    CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+    uint64_t value = 0;
+
+    switch (offset) {
+    case NUCLEI_SYSTIMER_REG_MTIMELO:
+        value = cpu_riscv_read_rtc(s->timebase_freq);
+        s->mtime_lo = value & 0xffffffff;
+        s->mtime_hi = (value >> 32) & 0xffffffff;
+        value = s->mtime_lo;
+        break;
+    case NUCLEI_SYSTIMER_REG_MTIMEHI:
+        value = s->mtime_hi;
+        break;
+    case NUCLEI_SYSTIMER_REG_MTIMECMPLO:
+        s->mtimecmp_lo = (env->mtimecmp) & 0xFFFFFFFF;
+        value = s->mtimecmp_lo;
+        break;
+    case NUCLEI_SYSTIMER_REG_MTIMECMPHI:
+        s->mtimecmp_hi = (env->mtimecmp >> 32) & 0xFFFFFFFF;
+        value = s->mtimecmp_hi;
+        break;
+    case NUCLEI_SYSTIMER_REG_MSFTRST:
+        break;
+    case NUCLEI_SYSTIMER_REG_MSTOP:
+        value = s->mstop;
+        break;
+    case NUCLEI_SYSTIMER_REG_MSIP:
+        value = s->msip;
+        break;
+    default:
+        break;
+    }
+    value &= 0xFFFFFFFF;
+    return value;
+
+}
+
+static void nuclei_timer_write(void *opaque, hwaddr offset,
+                               uint64_t value, unsigned size)
+{
+    NucLeiSYSTIMERState *s = NUCLEI_SYSTIMER(opaque);
+    CPUState *cpu = qemu_get_cpu(0);
+    CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+
+    value = value & 0xFFFFFFFF;
+    switch (offset) {
+    case NUCLEI_SYSTIMER_REG_MTIMELO:
+        s->mtime_lo = value;
+        env->mtimer->expire_time |= (value & 0xFFFFFFFF);
+        break;
+    case NUCLEI_SYSTIMER_REG_MTIMEHI:
+        s->mtime_hi = value;
+        env->mtimer->expire_time |= ((value << 32) & 0xFFFFFFFF);
+        break;
+    case NUCLEI_SYSTIMER_REG_MTIMECMPLO:
+        s->mtimecmp_lo = value;
+        s->mtimecmp_hi = 0xFFFFFFFF;
+        env->mtimecmp |= (value & 0xFFFFFFFF);
+        nuclei_timer_update_compare(s);
+        break;
+    case NUCLEI_SYSTIMER_REG_MTIMECMPHI:
+        s->mtimecmp_hi = value;
+        env->mtimecmp |= ((value << 32) & 0xFFFFFFFF);
+        nuclei_timer_update_compare(s);
+        break;
+    case NUCLEI_SYSTIMER_REG_MSFTRST:
+        if (!(value & 0x80000000) == 0) {
+            nuclei_timer_reset((DeviceState *)s);
+        }
+        break;
+    case NUCLEI_SYSTIMER_REG_MSTOP:
+        s->mstop = value;
+        break;
+    case NUCLEI_SYSTIMER_REG_MSIP:
+        s->msip = value;
+        if ((s->msip & 0x1) == 1) {
+            qemu_set_irq(*(s->soft_irq), 1);
+        } else {
+            qemu_set_irq(*(s->soft_irq), 0);
+        }
+
+        break;
+    default:
+        break;
+    }
+}
+
+static const MemoryRegionOps nuclei_timer_ops = {
+    .read = nuclei_timer_read,
+    .write = nuclei_timer_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static Property nuclei_systimer_properties[] = {
+    DEFINE_PROP_UINT32("aperture-size", NucLeiSYSTIMERState, aperture_size, 0),
+    DEFINE_PROP_UINT32("timebase-freq", NucLeiSYSTIMERState, timebase_freq, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void nuclei_timer_realize(DeviceState *dev, Error **errp)
+{
+    NucLeiSYSTIMERState *s = NUCLEI_SYSTIMER(dev);
+
+    if (s->aperture_size == 0) {
+        s->aperture_size = 0x1000;
+    }
+    memory_region_init_io(&s->iomem, OBJECT(dev), &nuclei_timer_ops,
+                          s, TYPE_NUCLEI_SYSTIMER, s->aperture_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
+}
+
+static void nuclei_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = nuclei_timer_realize;
+    dc->reset = nuclei_timer_reset;
+    dc->desc = "NucLei Systimer Timer";
+    device_class_set_props(dc, nuclei_systimer_properties);
+}
+
+static const TypeInfo nuclei_timer_info = {
+    .name = TYPE_NUCLEI_SYSTIMER,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(NucLeiSYSTIMERState),
+    .class_init = nuclei_timer_class_init,
+};
+
+static void nuclei_timer_register_types(void)
+{
+    type_register_static(&nuclei_timer_info);
+}
+type_init(nuclei_timer_register_types);
+
+static void nuclei_mtimecmp_cb(void *opaque)
+{
+    RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(0));
+    CPURISCVState *env = &cpu->env;
+    nuclei_eclic_systimer_cb(((RISCVCPU *)cpu)->env.eclic);
+    timer_del(env->mtimer);
+}
+
+DeviceState *nuclei_systimer_create(hwaddr addr, hwaddr size,
+                                    DeviceState *eclic, uint32_t timebase_freq)
+{
+    RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(0));
+    CPURISCVState *env = &cpu->env;
+
+    env->features |= (1ULL << RISCV_FEATURE_ECLIC);
+    env->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                               &nuclei_mtimecmp_cb, cpu);
+    env->mtimecmp = 0;
+
+    DeviceState *dev = qdev_new(TYPE_NUCLEI_SYSTIMER);
+    qdev_prop_set_uint32(dev, "aperture-size", size);
+    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    NucLeiSYSTIMERState *s = NUCLEI_SYSTIMER(dev);
+    if (eclic != NULL) {
+        s->eclic = eclic;
+        s->soft_irq = &(NUCLEI_ECLIC(eclic)->irqs[Internal_SysTimerSW_IRQn]);
+        s->timer_irq = &(NUCLEI_ECLIC(eclic)->irqs[Internal_SysTimer_IRQn]);
+    }
+    return dev;
+}
diff --git a/include/hw/intc/nuclei_systimer.h b/include/hw/intc/nuclei_systimer.h
new file mode 100644
index 0000000000..1f7756bb6f
--- /dev/null
+++ b/include/hw/intc/nuclei_systimer.h
@@ -0,0 +1,70 @@
+/*
+ *  NUCLEI TIMER (Timer Unit) interface
+ *
+ * Copyright (c) 2020 Gao ZhiYuan <alapha23@gmail.com>
+ * Copyright (c) 2020-2021 PLCT Lab.All rights reserved.
+ *
+ * This provides a parameterizable timer controller based on NucLei's Systimer.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 3 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef HW_NUCLEI_SYSTIMER_H
+#define HW_NUCLEI_SYSTIMER_H
+
+#include "hw/intc/nuclei_eclic.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+
+#define TYPE_NUCLEI_SYSTIMER "riscv.nuclei.systimer"
+
+#define NUCLEI_SYSTIMER(obj) \
+    OBJECT_CHECK(NucLeiSYSTIMERState, (obj), TYPE_NUCLEI_SYSTIMER)
+
+#define NUCLEI_SYSTIMER_REG_MTIMELO    0x0000
+#define NUCLEI_SYSTIMER_REG_MTIMEHI    0x0004
+#define NUCLEI_SYSTIMER_REG_MTIMECMPLO 0x0008
+#define NUCLEI_SYSTIMER_REG_MTIMECMPHI 0x000C
+#define NUCLEI_SYSTIMER_REG_MSFTRST    0xFF0
+#define NUCLEI_SYSTIMER_REG_MSTOP      0xFF8
+#define NUCLEI_SYSTIMER_REG_MSIP       0xFFC
+
+typedef struct NucLeiSYSTIMERState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    qemu_irq *timer_irq;
+    qemu_irq *soft_irq;
+
+    DeviceState *eclic;
+
+    uint32_t mtime_lo;
+    uint32_t mtime_hi;
+    uint32_t mtimecmp_lo;
+    uint32_t mtimecmp_hi;
+    uint32_t mstop;
+    uint32_t msip;
+
+    uint32_t aperture_size;
+    uint32_t timebase_freq;
+
+} NucLeiSYSTIMERState;
+
+#define NUCLEI_GD32_TIMEBASE_FREQ  (108000000 * 2)
+#define NUCLEI_HBIRD_TIMEBASE_FREQ (10000000)
+
+DeviceState *nuclei_systimer_create(hwaddr addr, hwaddr size,
+                                    DeviceState *eclic, uint32_t timebase_freq);
+#endif
-- 
2.17.1


