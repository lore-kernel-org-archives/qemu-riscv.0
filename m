Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lf0T0-00084u-FL
	for mharc-qemu-riscv@gnu.org; Fri, 07 May 2021 09:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgW-0004a0-RT; Fri, 07 May 2021 04:18:08 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:50046 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgS-0005lP-Bn; Fri, 07 May 2021 04:18:08 -0400
Received: from localhost.localdomain (unknown [121.232.13.213])
 by APP-05 (Coremail) with SMTP id zQCowAB3fSnh9pRgTQ5HAQ--.1834S7;
 Fri, 07 May 2021 16:14:28 +0800 (CST)
From: wangjunqiang <wangjunqiang@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 alapha23@gmail.com, liweiwei@iscas.ac.cn,
 wangjunqiang <wangjunqiang@iscas.ac.cn>
Subject: [RFC PATCH 5/5] Nuclei FPGA Evaluation Kit MCU Machine
Date: Fri,  7 May 2021 16:16:54 +0800
Message-Id: <20210507081654.11056-6-wangjunqiang@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
References: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
X-CM-TRANSID: zQCowAB3fSnh9pRgTQ5HAQ--.1834S7
X-Coremail-Antispam: 1UD129KBjvAXoW3ZryfKFWDWFyUXFy7KF1fXrb_yoW8WrWUKo
 WfJFWfJFW8Gw15Zr4FkFyDGrZrWrnakF42q398CF93u3WxWF47WryrK34DJwsxJr1rGwn7
 XFWa9w47W3WDXrykn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
 Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
 84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJV
 WxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r43Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8
 Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0x
 vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU9F4iUUUUU=
X-Originating-IP: [121.232.13.213]
X-CM-SenderInfo: pzdqwy5xqtxt1qj6x2xfdvhtffof0/1tbiCgkOAFz4jlgX+wAAsT
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
X-List-Received-Date: Fri, 07 May 2021 08:18:09 -0000

This patch provides an implementation of Nuclei FPGA Evaluation Kit Board
as MCU mode. The Machine based on Nuclei's specification which has Customized
register. The following machine is implemented:

   -"Nuclei 100T": SYSTIMER, ECLIC, UART ...

Signed-off-by: Wang Junqiang <wangjunqiang@iscas.ac.cn>
---
 default-configs/devices/riscv32-softmmu.mak |   1 +
 default-configs/devices/riscv64-softmmu.mak |   1 +
 hw/riscv/Kconfig                            |   9 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/nuclei_n.c                         | 276 ++++++++++++++++++++
 include/hw/riscv/nuclei_n.h                 | 136 ++++++++++
 6 files changed, 424 insertions(+)
 create mode 100644 hw/riscv/nuclei_n.c
 create mode 100644 include/hw/riscv/nuclei_n.h

diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
index d847bd5692..52fb26ef01 100644
--- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -13,3 +13,4 @@ CONFIG_SIFIVE_E=y
 CONFIG_SIFIVE_U=y
 CONFIG_RISCV_VIRT=y
 CONFIG_OPENTITAN=y
+CONFIG_NUCLEI_N=y
\ No newline at end of file
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index d5eec75f05..ff688bbbc6 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -13,3 +13,4 @@ CONFIG_SIFIVE_E=y
 CONFIG_SIFIVE_U=y
 CONFIG_RISCV_VIRT=y
 CONFIG_MICROCHIP_PFSOC=y
+CONFIG_NUCLEI_N=y
\ No newline at end of file
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 1de18cdcf1..427ed3afd3 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -67,3 +67,12 @@ config SPIKE
     select MSI_NONBROKEN
     select SIFIVE_CLINT
     select SIFIVE_PLIC
+
+config NUCLEI_N
+    bool
+    select MSI_NONBROKEN
+    select NUCLEI_SYSTIMER
+    select NUCLEI_ECLIC
+    select SIFIVE_GPIO
+    select NUCLEI_UART
+    select UNIMP
\ No newline at end of file
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 275c0f7eb7..840c2852e2 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -8,5 +8,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
+riscv_ss.add(when: 'CONFIG_NUCLEI_N', if_true: files('nuclei_n.c'))
 
 hw_arch += {'riscv': riscv_ss}
diff --git a/hw/riscv/nuclei_n.c b/hw/riscv/nuclei_n.c
new file mode 100644
index 0000000000..a95b8a7d29
--- /dev/null
+++ b/hw/riscv/nuclei_n.c
@@ -0,0 +1,276 @@
+/*
+ * Nuclei N series  SOC machine interface
+ *
+ * Copyright (c) 2020 Gao ZhiYuan <alapha23@gmail.com>
+ * Copyright (c) 2020-2021 PLCT Lab.All rights reserved.
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
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "hw/sysbus.h"
+#include "target/riscv/cpu.h"
+#include "hw/misc/unimp.h"
+#include "hw/char/riscv_htif.h"
+#include "hw/riscv/riscv_hart.h"
+#include "hw/intc/nuclei_eclic.h"
+#include "hw/char/nuclei_uart.h"
+#include "hw/riscv/nuclei_n.h"
+#include "hw/riscv/boot.h"
+#include "chardev/char.h"
+#include "sysemu/arch_init.h"
+#include "sysemu/device_tree.h"
+#include "sysemu/qtest.h"
+#include "sysemu/sysemu.h"
+#include "exec/address-spaces.h"
+
+#include <libfdt.h>
+
+static const struct MemmapEntry {
+    hwaddr base;
+    hwaddr size;
+} nuclei_memmap[] = {
+    [HBIRD_DEBUG] = {0x0, 0x1000},
+    [HBIRD_ROM] = {0x1000, 0x1000},
+    [HBIRD_TIMER] = {0x2000000, 0x1000},
+    [HBIRD_ECLIC] = {0xc000000, 0x10000},
+    [HBIRD_GPIO] = {0x10012000, 0x1000},
+    [HBIRD_UART0] = {0x10013000, 0x1000},
+    [HBIRD_QSPI0] = {0x10014000, 0x1000},
+    [HBIRD_PWM0] = {0x10015000, 0x1000},
+    [HBIRD_UART1] = {0x10023000, 0x1000},
+    [HBIRD_QSPI1] = {0x10024000, 0x1000},
+    [HBIRD_PWM1] = {0x10025000, 0x1000},
+    [HBIRD_QSPI2] = {0x10034000, 0x1000},
+    [HBIRD_PWM2] = {0x10035000, 0x1000},
+    [HBIRD_XIP] = {0x20000000, 0x10000000},
+    [HBIRD_DRAM] = {0xa0000000, 0x0},
+    [HBIRD_ILM] = {0x80000000, 0x20000},
+    [HBIRD_DLM] = {0x90000000, 0x20000},
+};
+
+static void nuclei_machine_get_uint32_prop(Object *obj, Visitor *v,
+                                           const char *name, void *opaque,
+                                           Error **errp)
+{
+    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
+}
+
+static void nuclei_machine_set_uint32_prop(Object *obj, Visitor *v,
+                                           const char *name, void *opaque,
+                                           Error **errp)
+{
+    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
+}
+
+static void nuclei_board_init(MachineState *machine)
+{
+    const struct MemmapEntry *memmap = nuclei_memmap;
+    NucleiHBState *s = HBIRD_FPGA_MACHINE(machine);
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
+    MemoryRegion *flash = g_new(MemoryRegion, 1);
+    target_ulong start_addr = memmap[HBIRD_ILM].base;
+    int i;
+
+    /* TODO: Add qtest support */
+    /* Initialize SOC */
+    object_initialize_child(OBJECT(machine), "soc",
+                    &s->soc, TYPE_NUCLEI_HBIRD_SOC);
+    qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
+
+    memory_region_init_ram(&s->soc.ilm, NULL, "riscv.nuclei.ram.ilm",
+                           memmap[HBIRD_ILM].size, &error_fatal);
+    memory_region_add_subregion(system_memory,
+                                memmap[HBIRD_ILM].base, &s->soc.ilm);
+
+    memory_region_init_ram(&s->soc.dlm, NULL, "riscv.nuclei.ram.dlm",
+                           memmap[HBIRD_DLM].size, &error_fatal);
+    memory_region_add_subregion(system_memory,
+                                memmap[HBIRD_DLM].base, &s->soc.dlm);
+
+    /* register DRAM */
+    memory_region_init_ram(main_mem, NULL, "riscv.nuclei.dram",
+                           machine->ram_size, &error_fatal);
+    memory_region_add_subregion(system_memory, memmap[HBIRD_DRAM].base,
+                                main_mem);
+
+    /* Flash memory */
+    memory_region_init_ram(flash, NULL, "riscv.nuclei.xip",
+                           memmap[HBIRD_XIP].size, &error_fatal);
+    memory_region_add_subregion(system_memory, memmap[HBIRD_XIP].base,
+                                flash);
+
+    switch (s->msel) {
+    case MSEL_ILM:
+        start_addr = memmap[HBIRD_ILM].base;
+        break;
+    case MSEL_FLASH:
+        start_addr = memmap[HBIRD_XIP].base;
+        break;
+    case MSEL_FLASHXIP:
+        start_addr = memmap[HBIRD_XIP].base;
+        break;
+    case MSEL_DDR:
+        start_addr = memmap[HBIRD_DRAM].base;
+        break;
+    default:
+        start_addr = memmap[HBIRD_ILM].base;
+        break;
+    }
+
+    /* reset vector */
+    uint32_t reset_vec[8] = {
+        0x00000297, /* 1:  auipc  t0, %pcrel_hi(dtb) */
+        0x02028593, /*     addi   a1, t0, %pcrel_lo(1b) */
+        0xf1402573, /*     csrr   a0, mhartid  */
+#if defined(TARGET_RISCV32)
+        0x0182a283, /*     lw     t0, 24(t0) */
+#elif defined(TARGET_RISCV64)
+        0x0182b283, /*     ld     t0, 24(t0) */
+#endif
+        0x00028067, /*     jr     t0 */
+        0x00000000,
+        start_addr, /* start: .dword DRAM_BASE */
+        0x00000000,
+    };
+
+    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
+        reset_vec[i] = cpu_to_le32(reset_vec[i]);
+    }
+    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
+                          memmap[HBIRD_ROM].base, &address_space_memory);
+
+    /* boot rom */
+    if (machine->kernel_filename) {
+        riscv_load_kernel(machine->kernel_filename, start_addr, NULL);
+    }
+}
+
+static void nuclei_soc_init(Object *obj)
+{
+    NucleiHBSoCState *s = RISCV_NUCLEI_HBIRD_SOC(obj);
+
+    object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY);
+
+    object_initialize_child(obj, "riscv.nuclei.gpio",
+                            &s->gpio, TYPE_SIFIVE_GPIO);
+}
+
+static void nuclei_soc_realize(DeviceState *dev, Error **errp)
+{
+    const struct MemmapEntry *memmap = nuclei_memmap;
+    MachineState *ms = MACHINE(qdev_get_machine());
+    NucleiHBSoCState *s = RISCV_NUCLEI_HBIRD_SOC(dev);
+    MemoryRegion *sys_mem = get_system_memory();
+    Error *err = NULL;
+
+    object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
+                            &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
+
+    /* Mask ROM */
+    memory_region_init_rom(&s->internal_rom, OBJECT(dev), "riscv.nuclei.irom",
+                           memmap[HBIRD_ROM].size, &error_fatal);
+    memory_region_add_subregion(sys_mem,
+                                memmap[HBIRD_ROM].base, &s->internal_rom);
+
+    s->eclic = nuclei_eclic_create(memmap[HBIRD_ECLIC].base,
+                                   memmap[HBIRD_ECLIC].size, HBIRD_SOC_INT_MAX);
+
+    s->timer = nuclei_systimer_create(memmap[HBIRD_TIMER].base,
+                                      memmap[HBIRD_TIMER].size,
+                                      s->eclic,
+                                      NUCLEI_HBIRD_TIMEBASE_FREQ);
+
+    /* GPIO */
+    sysbus_realize(SYS_BUS_DEVICE(&s->gpio), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, memmap[HBIRD_GPIO].base);
+
+    nuclei_uart_create(sys_mem,
+                       memmap[HBIRD_UART0].base,
+                       memmap[HBIRD_UART0].size,
+                       serial_hd(0),
+                       nuclei_eclic_get_irq(DEVICE(s->eclic),
+                                            HBIRD_SOC_INT22_IRQn));
+}
+
+static void nuclei_machine_instance_init(Object *obj)
+{
+    NucleiHBState *s = HBIRD_FPGA_MACHINE(obj);
+
+    s->msel = 0;
+    object_property_add(obj, "msel", "uint32",
+                        nuclei_machine_get_uint32_prop,
+                        nuclei_machine_set_uint32_prop, NULL, &s->msel);
+    object_property_set_description(obj, "msel",
+                                    "Mode Select Startup");
+}
+
+static void nuclei_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Nuclei HummingBird Evaluation Kit";
+    mc->init = nuclei_board_init;
+    mc->max_cpus = 1;
+    mc->default_cpu_type = NUCLEI_N_CPU;
+}
+
+static const TypeInfo nuclei_machine_typeinfo = {
+    .name = MACHINE_TYPE_NAME("hbird_fpga"),
+    .parent = TYPE_MACHINE,
+    .class_init = nuclei_machine_class_init,
+    .instance_init = nuclei_machine_instance_init,
+    .instance_size = sizeof(NucleiHBState),
+};
+
+static void nuclei_machine_init_register_types(void)
+{
+    type_register_static(&nuclei_machine_typeinfo);
+}
+
+type_init(nuclei_machine_init_register_types)
+
+    static void nuclei_soc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    dc->realize = nuclei_soc_realize;
+    dc->user_creatable = false;
+}
+
+static const TypeInfo nuclei_soc_type_info = {
+    .name = TYPE_NUCLEI_HBIRD_SOC,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(NucleiHBSoCState),
+    .instance_init = nuclei_soc_init,
+    .class_init = nuclei_soc_class_init,
+};
+
+static void nuclei_soc_register_types(void)
+{
+    type_register_static(&nuclei_soc_type_info);
+}
+
+type_init(nuclei_soc_register_types)
diff --git a/include/hw/riscv/nuclei_n.h b/include/hw/riscv/nuclei_n.h
new file mode 100644
index 0000000000..83776c5c22
--- /dev/null
+++ b/include/hw/riscv/nuclei_n.h
@@ -0,0 +1,136 @@
+/*
+ * Nuclei U series  SOC machine interface
+ *
+ * Copyright (c) 2020 Gao ZhiYuan <alapha23@gmail.com>
+ * Copyright (c) 2020-2021 PLCT Lab.All rights reserved.
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
+#ifndef HW_RISCV_NUCLEI_HBIRD_H
+#define HW_RISCV_NUCLEI_HBIRD_H
+
+#include "hw/char/nuclei_uart.h"
+#include "hw/gpio/sifive_gpio.h"
+#include "hw/intc/nuclei_eclic.h"
+#include "hw/intc/nuclei_systimer.h"
+#include "hw/riscv/riscv_hart.h"
+#include "hw/sysbus.h"
+
+#define TYPE_NUCLEI_HBIRD_SOC "riscv.nuclei.hbird.soc"
+#define RISCV_NUCLEI_HBIRD_SOC(obj) \
+    OBJECT_CHECK(NucleiHBSoCState, (obj), TYPE_NUCLEI_HBIRD_SOC)
+
+typedef struct NucleiHBSoCState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    RISCVHartArrayState cpus;
+
+    DeviceState *eclic;
+    MemoryRegion ilm;
+    MemoryRegion dlm;
+    MemoryRegion internal_rom;
+    MemoryRegion xip_mem;
+
+    DeviceState *timer;
+    NucLeiUARTState uart;
+    SIFIVEGPIOState gpio;
+
+} NucleiHBSoCState;
+
+#define TYPE_HBIRD_FPGA_MACHINE MACHINE_TYPE_NAME("hbird_fpga")
+#define HBIRD_FPGA_MACHINE(obj) \
+    OBJECT_CHECK(NucleiHBState, (obj), TYPE_HBIRD_FPGA_MACHINE)
+
+typedef struct NucleiHBState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    NucleiHBSoCState soc;
+
+    uint32_t msel;
+} NucleiHBState;
+
+enum {
+    MSEL_ILM = 1,
+    MSEL_FLASH = 2,
+    MSEL_FLASHXIP = 3,
+    MSEL_DDR = 4
+};
+
+enum {
+    HBIRD_DEBUG,
+    HBIRD_ROM,
+    HBIRD_TIMER,
+    HBIRD_ECLIC,
+    HBIRD_GPIO,
+    HBIRD_UART0,
+    HBIRD_QSPI0,
+    HBIRD_PWM0,
+    HBIRD_UART1,
+    HBIRD_QSPI1,
+    HBIRD_PWM1,
+    HBIRD_QSPI2,
+    HBIRD_PWM2,
+    HBIRD_XIP,
+    HBIRD_DRAM,
+    HBIRD_ILM,
+    HBIRD_DLM
+};
+
+enum {
+    HBIRD_SOC_INT19_IRQn = 19, /*!< Device Interrupt */
+    HBIRD_SOC_INT20_IRQn = 20, /*!< Device Interrupt */
+    HBIRD_SOC_INT21_IRQn = 21, /*!< Device Interrupt */
+    HBIRD_SOC_INT22_IRQn = 22, /*!< Device Interrupt */
+    HBIRD_SOC_INT23_IRQn = 23, /*!< Device Interrupt */
+    HBIRD_SOC_INT24_IRQn = 24, /*!< Device Interrupt */
+    HBIRD_SOC_INT25_IRQn = 25, /*!< Device Interrupt */
+    HBIRD_SOC_INT26_IRQn = 26, /*!< Device Interrupt */
+    HBIRD_SOC_INT27_IRQn = 27, /*!< Device Interrupt */
+    HBIRD_SOC_INT28_IRQn = 28, /*!< Device Interrupt */
+    HBIRD_SOC_INT29_IRQn = 29, /*!< Device Interrupt */
+    HBIRD_SOC_INT30_IRQn = 30, /*!< Device Interrupt */
+    HBIRD_SOC_INT31_IRQn = 31, /*!< Device Interrupt */
+    HBIRD_SOC_INT32_IRQn = 32, /*!< Device Interrupt */
+    HBIRD_SOC_INT33_IRQn = 33, /*!< Device Interrupt */
+    HBIRD_SOC_INT34_IRQn = 34, /*!< Device Interrupt */
+    HBIRD_SOC_INT35_IRQn = 35, /*!< Device Interrupt */
+    HBIRD_SOC_INT36_IRQn = 36, /*!< Device Interrupt */
+    HBIRD_SOC_INT37_IRQn = 37, /*!< Device Interrupt */
+    HBIRD_SOC_INT38_IRQn = 38, /*!< Device Interrupt */
+    HBIRD_SOC_INT39_IRQn = 39, /*!< Device Interrupt */
+    HBIRD_SOC_INT40_IRQn = 40, /*!< Device Interrupt */
+    HBIRD_SOC_INT41_IRQn = 41, /*!< Device Interrupt */
+    HBIRD_SOC_INT42_IRQn = 42, /*!< Device Interrupt */
+    HBIRD_SOC_INT43_IRQn = 43, /*!< Device Interrupt */
+    HBIRD_SOC_INT44_IRQn = 44, /*!< Device Interrupt */
+    HBIRD_SOC_INT45_IRQn = 45, /*!< Device Interrupt */
+    HBIRD_SOC_INT46_IRQn = 46, /*!< Device Interrupt */
+    HBIRD_SOC_INT47_IRQn = 47, /*!< Device Interrupt */
+    HBIRD_SOC_INT48_IRQn = 48, /*!< Device Interrupt */
+    HBIRD_SOC_INT49_IRQn = 49, /*!< Device Interrupt */
+    HBIRD_SOC_INT50_IRQn = 50, /*!< Device Interrupt */
+    HBIRD_SOC_INT_MAX,
+};
+
+#if defined(TARGET_RISCV32)
+#define NUCLEI_N_CPU TYPE_RISCV_CPU_NUCLEI_N307FD
+#elif defined(TARGET_RISCV64)
+#define NUCLEI_N_CPU TYPE_RISCV_CPU_NUCLEI_NX600FD
+#endif
+
+#endif
-- 
2.17.1


