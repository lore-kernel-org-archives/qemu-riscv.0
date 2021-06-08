Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqlTE-0004bG-ME
	for mharc-qemu-riscv@gnu.org; Tue, 08 Jun 2021 19:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqlTD-0004Wt-6x; Tue, 08 Jun 2021 19:49:19 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:51222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqlTA-0001Ib-Dw; Tue, 08 Jun 2021 19:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623196156; x=1654732156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UZGmnLF3AM1tb7bRMLE/EwblweL+bBzbNtMzkOh0TDk=;
 b=qkAl0+W1LuiOCqsUfa9V5PnQAKWluMoh3h6ShGz24b5dEkuGCKQW3/TC
 C4Y9VPH6Zj1hZX+lzvF3DvJ2BPY0ElHBoJzvKq/F+e0Vuu8ZI0LaiEwA0
 6hnQyhdR7X5tcyj0oV71cFAg1ereHudNcH6J8FCg457aku2OrPYrfzkyz
 X9DKGpTg88Voonke75noofm4en2R/169gDZEkgyHATiSgs8fnHJo5h0St
 Y0Qu1bbgdIksSWr31OIOZhmHUnNeLtuKmsYuAZIyewrGFymmTOwX7pc//
 BcYuYm4zcasuUZABNCkAKkqRRTlu8+XxQlb+l2iONh526S81uXWDBxDkL A==;
IronPort-SDR: 9/nFd5UUyTQZJz4UDyNV+YZlFwPOmYW5pKUVdAfmlFvNWFO6xRat8R84FHE0fNuD3Rd+aNztxe
 k8jx5rh+3NGu7sidbA6Qk1R3X8gZGJwyab5dRt66tkFcjLZgCt6Z+O3k0wO64PE8tfHiF176BU
 8TY8Z87b/Gx/Mh1/CgAVfjVuXncm+SfDNNind4UtRLuLGj9k1g7CqMLA7IbJ8oCcz06oVgOIY6
 swRcHV8RND3crX/obkZDrKwPk8R8kKHsFc5K/c6iJWTohXY6GutxOhNWazViz+mHXnmyp+T+2E
 jyE=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; d="scan'208";a="282652330"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 07:49:14 +0800
IronPort-SDR: Qbq9FCFf3r2s7mpOum7Z47M2pzRi2UiHxIPwgmguLwcD0D9ncibnYwsPbjFt7rUp8ddh0GheWG
 yI4Y6e0Q4W9dgrDCW8B8pcc/iZN5HAcQyeXT/83/w7CPfRrihCSjyXNs0zGGA9VAbryOB+oI/T
 WJtO93zfg/IeCXvr6cpxK+xOnfECbyooq+pGV3FhBGgew6EU7otQzmhHto96Fk2MePcCcMP+vm
 fx11rRDeZEJssFUbAP6BHSnXF1kMdpE8fiOs5luBa/j/QuuhsK/FvHsjOdVr+Y17HBH+/eY083
 MmsQBauF8shrhrWoXrjYUdU9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 16:28:19 -0700
IronPort-SDR: 3VdOQjI85jErE/rmbDS+FCFOOR4ANopn49j6WIJzdi00J6d2/ab4lac4+jbU0L1HQMQpmbF2cp
 KfarETz15shkM00IYr83oIs2nsFGhpTe9Dete8JyapCYLcEDRjQVPV9+e6uintR/nE6nzO0ljp
 D5SCOkqZEQ/+N0h3NNkKejbo5zRv/nsLHYhBZdMVuqqTReNubxpNq820XC29tum6VoyRpsY6HA
 yGQGT+k7ALWa1FrWdnEgO1l+9+eI6G6IfCvIQmATaQhldrzp/IxWMkbZEqAgqQ0PV3rRHhRh9u
 hzI=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.83])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Jun 2021 16:49:12 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 2/3] hw/timer: Initial commit of Ibex Timer
Date: Wed,  9 Jun 2021 09:48:55 +1000
Message-Id: <b40ec8986ba8e7de3a3cf0ee4718b4868793be67.1623196022.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623196022.git.alistair.francis@wdc.com>
References: <cover.1623196022.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Tue, 08 Jun 2021 23:49:19 -0000

Add support for the Ibex timer. This is used with the RISC-V
mtime/mtimecmp similar to the SiFive CLINT.

We currently don't support changing the prescale or the timervalue.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/timer/ibex_timer.h |  52 ++++++
 hw/timer/ibex_timer.c         | 305 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   6 +-
 hw/timer/meson.build          |   1 +
 4 files changed, 360 insertions(+), 4 deletions(-)
 create mode 100644 include/hw/timer/ibex_timer.h
 create mode 100644 hw/timer/ibex_timer.c

diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
new file mode 100644
index 0000000000..6a43537003
--- /dev/null
+++ b/include/hw/timer/ibex_timer.h
@@ -0,0 +1,52 @@
+/*
+ * QEMU lowRISC Ibex Timer device
+ *
+ * Copyright (c) 2021 Western Digital
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_IBEX_TIMER_H
+#define HW_IBEX_TIMER_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_IBEX_TIMER "ibex-timer"
+OBJECT_DECLARE_SIMPLE_TYPE(IbexTimerState, IBEX_TIMER)
+
+struct IbexTimerState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+
+    uint32_t timer_ctrl;
+    uint32_t timer_cfg0;
+    uint32_t timer_compare_lower0;
+    uint32_t timer_compare_upper0;
+    uint32_t timer_intr_enable;
+    uint32_t timer_intr_state;
+    uint32_t timer_intr_test;
+
+    uint32_t timebase_freq;
+
+    qemu_irq irq;
+};
+#endif /* HW_IBEX_TIMER_H */
diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
new file mode 100644
index 0000000000..4d55eb5088
--- /dev/null
+++ b/hw/timer/ibex_timer.c
@@ -0,0 +1,305 @@
+/*
+ * QEMU lowRISC Ibex Timer device
+ *
+ * Copyright (c) 2021 Western Digital
+ *
+ * For details check the documentation here:
+ *    https://docs.opentitan.org/hw/ip/rv_timer/doc/
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/timer.h"
+#include "hw/timer/ibex_timer.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "target/riscv/cpu.h"
+#include "migration/vmstate.h"
+
+REG32(CTRL, 0x00)
+    FIELD(CTRL, ACTIVE, 0, 1)
+REG32(CFG0, 0x100)
+    FIELD(CFG0, PRESCALE, 0, 12)
+    FIELD(CFG0, STEP, 16, 8)
+REG32(LOWER0, 0x104)
+REG32(UPPER0, 0x108)
+REG32(COMPARE_LOWER0, 0x10C)
+REG32(COMPARE_UPPER0, 0x110)
+REG32(INTR_ENABLE, 0x114)
+    FIELD(INTR_ENABLE, IE_0, 0, 1)
+REG32(INTR_STATE, 0x118)
+    FIELD(INTR_STATE, IS_0, 0, 1)
+REG32(INTR_TEST, 0x11C)
+    FIELD(INTR_TEST, T_0, 0, 1)
+
+static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
+{
+    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                    timebase_freq, NANOSECONDS_PER_SECOND);
+}
+
+static void ibex_timer_update_irqs(IbexTimerState *s)
+{
+    CPUState *cs = qemu_get_cpu(0);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    uint64_t value = s->timer_compare_lower0 |
+                         ((uint64_t)s->timer_compare_upper0 << 32);
+    uint64_t next, diff;
+    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
+
+    if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
+        /* Timer isn't active */
+        return;
+    }
+
+    /* Update the CPUs mtimecmp */
+    cpu->env.timecmp = value;
+
+    if (cpu->env.timecmp <= now) {
+        /*
+         * If the mtimecmp was in the past raise the interrupt now.
+         */
+        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+        if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
+            s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
+            qemu_set_irq(s->irq, true);
+        }
+        return;
+    }
+
+    /* Setup a timer to trigger the interrupt in the future */
+    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
+    qemu_set_irq(s->irq, false);
+
+    diff = cpu->env.timecmp - now;
+    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                                 muldiv64(diff,
+                                          NANOSECONDS_PER_SECOND,
+                                          s->timebase_freq);
+
+    if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
+        /* We overflowed the timer, just set it as large as we can */
+        timer_mod(cpu->env.timer, 0x07FFFFFFFFFFFFFF);
+    } else {
+        timer_mod(cpu->env.timer, next);
+    }
+}
+
+static void ibex_timer_cb(void *opaque)
+{
+    IbexTimerState *s = opaque;
+    CPUState *cs = qemu_get_cpu(0);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+    if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
+        s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
+        qemu_set_irq(s->irq, true);
+    }
+}
+
+static void ibex_timer_reset(DeviceState *dev)
+{
+    IbexTimerState *s = IBEX_TIMER(dev);
+
+    CPUState *cpu = qemu_get_cpu(0);
+    CPURISCVState *env = cpu->env_ptr;
+    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                              &ibex_timer_cb, s);
+    env->timecmp = 0;
+
+    s->timer_ctrl = 0x00000000;
+    s->timer_cfg0 = 0x00010000;
+    s->timer_compare_lower0 = 0xFFFFFFFF;
+    s->timer_compare_upper0 = 0xFFFFFFFF;
+    s->timer_intr_enable = 0x00000000;
+    s->timer_intr_state = 0x00000000;
+    s->timer_intr_test = 0x00000000;
+
+    ibex_timer_update_irqs(s);
+}
+
+static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
+                                       unsigned int size)
+{
+    IbexTimerState *s = opaque;
+    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
+    uint64_t retvalue = 0;
+
+    switch (addr >> 2) {
+    case R_CTRL:
+        retvalue = s->timer_ctrl;
+        break;
+    case R_CFG0:
+        retvalue = s->timer_cfg0;
+        break;
+    case R_LOWER0:
+        retvalue = now;
+        break;
+    case R_UPPER0:
+        retvalue = now >> 32;
+        break;
+    case R_COMPARE_LOWER0:
+        retvalue = s->timer_compare_lower0;
+        break;
+    case R_COMPARE_UPPER0:
+        retvalue = s->timer_compare_upper0;
+        break;
+    case R_INTR_ENABLE:
+        retvalue = s->timer_intr_enable;
+        break;
+    case R_INTR_STATE:
+        retvalue = s->timer_intr_state;
+        break;
+    case R_INTR_TEST:
+        retvalue = s->timer_intr_test;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+        return 0;
+    }
+
+    return retvalue;
+}
+
+static void ibex_timer_write(void *opaque, hwaddr addr,
+                             uint64_t val64, unsigned int size)
+{
+    IbexTimerState *s = opaque;
+    uint32_t val = val64;
+
+    switch (addr >> 2) {
+    case R_CTRL:
+        s->timer_ctrl = val;
+        break;
+    case R_CFG0:
+        qemu_log_mask(LOG_UNIMP, "Changing prescale or step not supported");
+        s->timer_cfg0 = val;
+        break;
+    case R_LOWER0:
+        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
+        break;
+    case R_UPPER0:
+        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
+        break;
+    case R_COMPARE_LOWER0:
+        s->timer_compare_lower0 = val;
+        ibex_timer_update_irqs(s);
+        break;
+    case R_COMPARE_UPPER0:
+        s->timer_compare_upper0 = val;
+        ibex_timer_update_irqs(s);
+        break;
+    case R_INTR_ENABLE:
+        s->timer_intr_enable = val;
+        break;
+    case R_INTR_STATE:
+        /* Write 1 to clear */
+        s->timer_intr_state &= ~val;
+        break;
+    case R_INTR_TEST:
+        s->timer_intr_test = val;
+        if (s->timer_intr_enable &
+            s->timer_intr_test &
+            R_INTR_ENABLE_IE_0_MASK) {
+            s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
+            qemu_set_irq(s->irq, true);
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+    }
+}
+
+static const MemoryRegionOps ibex_timer_ops = {
+    .read = ibex_timer_read,
+    .write = ibex_timer_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+};
+
+static int ibex_timer_post_load(void *opaque, int version_id)
+{
+    IbexTimerState *s = opaque;
+
+    ibex_timer_update_irqs(s);
+    return 0;
+}
+
+static const VMStateDescription vmstate_ibex_timer = {
+    .name = TYPE_IBEX_TIMER,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = ibex_timer_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(timer_ctrl, IbexTimerState),
+        VMSTATE_UINT32(timer_cfg0, IbexTimerState),
+        VMSTATE_UINT32(timer_compare_lower0, IbexTimerState),
+        VMSTATE_UINT32(timer_compare_upper0, IbexTimerState),
+        VMSTATE_UINT32(timer_intr_enable, IbexTimerState),
+        VMSTATE_UINT32(timer_intr_state, IbexTimerState),
+        VMSTATE_UINT32(timer_intr_test, IbexTimerState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property ibex_timer_properties[] = {
+    DEFINE_PROP_UINT32("timebase-freq", IbexTimerState, timebase_freq, 10000),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ibex_timer_init(Object *obj)
+{
+    IbexTimerState *s = IBEX_TIMER(obj);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+
+    memory_region_init_io(&s->mmio, obj, &ibex_timer_ops, s,
+                          TYPE_IBEX_TIMER, 0x400);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static void ibex_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = ibex_timer_reset;
+    dc->vmsd = &vmstate_ibex_timer;
+    device_class_set_props(dc, ibex_timer_properties);
+}
+
+static const TypeInfo ibex_timer_info = {
+    .name          = TYPE_IBEX_TIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IbexTimerState),
+    .instance_init = ibex_timer_init,
+    .class_init    = ibex_timer_class_init,
+};
+
+static void ibex_timer_register_types(void)
+{
+    type_register_static(&ibex_timer_info);
+}
+
+type_init(ibex_timer_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9cd29042..b661c9c14e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1363,11 +1363,9 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: hw/riscv/opentitan.c
-F: hw/char/ibex_uart.c
-F: hw/intc/ibex_plic.c
+F: hw/*/ibex_*.c
 F: include/hw/riscv/opentitan.h
-F: include/hw/char/ibex_uart.h
-F: include/hw/intc/ibex_plic.h
+F: include/hw/*/ibex_*.h
 
 Microchip PolarFire SoC Icicle Kit
 M: Bin Meng <bin.meng@windriver.com>
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 157f540ecd..1aa3cd2284 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -33,5 +33,6 @@ softmmu_ss.add(when: 'CONFIG_SSE_COUNTER', if_true: files('sse-counter.c'))
 softmmu_ss.add(when: 'CONFIG_SSE_TIMER', if_true: files('sse-timer.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
+specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_timer.c'))
 
 specific_ss.add(when: 'CONFIG_AVR_TIMER16', if_true: files('avr_timer16.c'))
-- 
2.31.1


