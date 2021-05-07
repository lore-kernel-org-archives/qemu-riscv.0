Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lf0Sy-000806-Ip
	for mharc-qemu-riscv@gnu.org; Fri, 07 May 2021 09:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgY-0004ac-Nr; Fri, 07 May 2021 04:18:10 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:50028 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgS-0005jn-JQ; Fri, 07 May 2021 04:18:10 -0400
Received: from localhost.localdomain (unknown [121.232.13.213])
 by APP-05 (Coremail) with SMTP id zQCowAB3fSnh9pRgTQ5HAQ--.1834S4;
 Fri, 07 May 2021 16:14:27 +0800 (CST)
From: wangjunqiang <wangjunqiang@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 alapha23@gmail.com, liweiwei@iscas.ac.cn,
 wangjunqiang <wangjunqiang@iscas.ac.cn>
Subject: [RFC PATCH 2/5] hw/intc: Add Nuclei ECLIC device
Date: Fri,  7 May 2021 16:16:51 +0800
Message-Id: <20210507081654.11056-3-wangjunqiang@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
References: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
X-CM-TRANSID: zQCowAB3fSnh9pRgTQ5HAQ--.1834S4
X-Coremail-Antispam: 1UD129KBjvAXoWfJw13tFykJrykZrW3Gry8Zrb_yoW8CFyUCo
 WfAr4DJ395Xr4UXrsakF1UGry7WF1ayFWYqFs7Wr4qyF18ZwnxX3yDKa43ZF4SvrZ8KrWx
 ZryagFs3Xrs3JF1fn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYZ7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r15M28IrcIa0x
 kI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
 jcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
 0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
 Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU1yCJDUUUU
X-Originating-IP: [121.232.13.213]
X-CM-SenderInfo: pzdqwy5xqtxt1qj6x2xfdvhtffof0/1tbiBgcOAF0TfNHfbQAAse
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

This patch provides an implementation of Nuclei ECLIC Device.
Nuclei processor core have been equipped with an Enhanced Core Local
Interrupt Controller (ECLIC), which is optimized based on the RISC-V
standard CLIC, to manage all interrupt sources.

https://doc.nucleisys.com/nuclei_spec/isa/eclic.html
---
 hw/intc/Kconfig                |   3 +
 hw/intc/meson.build            |   1 +
 hw/intc/nuclei_eclic.c         | 437 +++++++++++++++++++++++++++++++++
 include/hw/intc/nuclei_eclic.h | 115 +++++++++
 4 files changed, 556 insertions(+)
 create mode 100644 hw/intc/nuclei_eclic.c
 create mode 100644 include/hw/intc/nuclei_eclic.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index f4694088a4..eab30f6ffd 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -73,3 +73,6 @@ config GOLDFISH_PIC
 
 config M68K_IRQC
     bool
+
+config NUCLEI_ECLIC
+    bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 1c299039f6..7577ba69d2 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -50,6 +50,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
 specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
+specific_ss.add(when: 'CONFIG_NUCLEI_ECLIC', if_true: files('nuclei_eclic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
 		if_true: files('xics_kvm.c'))
diff --git a/hw/intc/nuclei_eclic.c b/hw/intc/nuclei_eclic.c
new file mode 100644
index 0000000000..52de83cb1d
--- /dev/null
+++ b/hw/intc/nuclei_eclic.c
@@ -0,0 +1,437 @@
+/*
+ * NUCLEI ECLIC(Enhanced Core Local Interrupt Controller)
+ *
+ * Copyright (c) 2020 Gao ZhiYuan <alapha23@gmail.com>
+ * Copyright (c) 2020-2021 PLCT Lab.All rights reserved.
+ *
+ * This provides a parameterizable interrupt controller based on NucLei's ECLIC.
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
+#include "qemu/module.h"
+#include "qemu/error-report.h"
+#include "hw/sysbus.h"
+#include "hw/pci/msi.h"
+#include "hw/boards.h"
+#include "hw/qdev-properties.h"
+#include "target/riscv/cpu.h"
+#include "sysemu/sysemu.h"
+#include "hw/intc/nuclei_eclic.h"
+#include "qapi/error.h"
+
+#define RISCV_DEBUG_ECLIC 0
+
+static void riscv_cpu_eclic_interrupt(RISCVCPU *cpu, int exccode)
+{
+    CPURISCVState *env = &cpu->env;
+    bool locked = false;
+
+    env->exccode = exccode;
+
+    if (!qemu_mutex_iothread_locked()) {
+        locked = true;
+        qemu_mutex_lock_iothread();
+    }
+
+    if (exccode != -1) {
+        env->irq_pending = true;
+        cpu_interrupt(CPU(cpu), CPU_INTERRUPT_ECLIC);
+    } else {
+        env->irq_pending = false;
+        cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_ECLIC);
+    }
+
+    if (locked) {
+        qemu_mutex_unlock_iothread();
+    }
+}
+
+static int level_compare(NucLeiECLICState *eclic,
+                         ECLICPendingInterrupt *irq1,
+                         ECLICPendingInterrupt *irq2)
+{
+    if (irq1->level == irq2->level) {
+        if (irq1->prio == irq2->prio) {
+            if (irq1->irq >= irq2->irq) {
+                return 0;
+            } else {
+                return 1;
+            }
+        } else if (irq1->prio > irq2->level) {
+            return 0;
+        } else {
+            return 1;
+        }
+    } else if (irq1->level > irq2->level) {
+        return 0;
+    } else {
+        return 1;
+    }
+}
+
+static void nuclei_eclic_next_interrupt(void *eclic_ptr)
+{
+    RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(0));
+    CPURISCVState *env = &cpu->env;
+    NucLeiECLICState *eclic = (NucLeiECLICState *)eclic_ptr;
+    ECLICPendingInterrupt *active;
+    target_ulong mil;
+    int shv;
+
+    QLIST_FOREACH(active, &eclic->pending_list, next)
+    {
+        if (active->enable) {
+            mil = get_field(env->mintstatus, MINTSTATUS_MIL);
+            if (active->level >= eclic->mth && active->level > mil) {
+                shv = eclic->clicintattr[active->irq] & 0x1;
+                eclic->active_count++;
+                riscv_cpu_eclic_interrupt(cpu,
+                                          (active->irq & 0xFFF) | (shv << 12) | (active->level << 13));
+                return;
+            }
+        }
+    }
+}
+
+static void nuclei_eclic_update_intmth(NucLeiECLICState *eclic,
+                                       int irq, int mth)
+{
+    eclic->mth = mth;
+    nuclei_eclic_next_interrupt(eclic);
+}
+
+static void update_eclic_int_info(NucLeiECLICState *eclic, int irq)
+{
+    int level_width = (eclic->cliccfg >> 1) & 0xF;
+    if (level_width > CLICINTCTLBITS) {
+        level_width = CLICINTCTLBITS;
+    }
+    int prio_width = CLICINTCTLBITS - level_width;
+
+    if (level_width == 0) {
+        eclic->clicintlist[irq].level = 255;
+    } else {
+        eclic->clicintlist[irq].level = ((
+                                             (eclic->clicintctl[irq] >> (8 - level_width)) &
+                                             ~((char)0x80 >> (8 - level_width)))
+                                         << (8 - level_width)) |
+                                        (0xff >> level_width);
+    }
+
+    if (prio_width == 0) {
+        eclic->clicintlist[irq].prio = 0;
+    } else {
+        eclic->clicintlist[irq].prio =
+            (eclic->clicintctl[irq] >> (8 - level_width)) &
+            ~(0x80 >> (8 - prio_width));
+    }
+
+    eclic->clicintlist[irq].enable = eclic->clicintie[irq] & 0x1;
+    eclic->clicintlist[irq].trigger = (eclic->clicintattr[irq] >> 1) & 0x3;
+}
+
+static void eclic_remove_pending_list(NucLeiECLICState *eclic, int irq)
+{
+    QLIST_REMOVE(&eclic->clicintlist[irq], next);
+}
+
+static void eclic_insert_pending_list(NucLeiECLICState *eclic, int irq)
+{
+    ECLICPendingInterrupt *node;
+    if (QLIST_EMPTY(&eclic->pending_list)) {
+        QLIST_INSERT_HEAD(&eclic->pending_list, &eclic->clicintlist[irq], next);
+    } else {
+        QLIST_FOREACH(node, &eclic->pending_list, next)
+        {
+            if (level_compare(eclic, node, &eclic->clicintlist[irq])) {
+                QLIST_INSERT_BEFORE(node, &eclic->clicintlist[irq], next);
+                break;
+            } else if (node->next.le_next == NULL) {
+                QLIST_INSERT_AFTER(node, &eclic->clicintlist[irq], next);
+                break;
+            }
+        }
+    }
+}
+
+static void nuclei_eclic_update_intip(NucLeiECLICState *eclic, int irq, int new_intip)
+{
+
+    int old_intip = eclic->clicintlist[irq].sig;
+    int trigger = (eclic->clicintattr[irq] >> 1) & 0x3;
+    if (((trigger == 0) && new_intip) ||
+        ((trigger == 1) && !old_intip && new_intip) ||
+        ((trigger == 3) && old_intip && !new_intip)) {
+        eclic->clicintip[irq] = 1;
+        eclic->clicintlist[irq].sig = new_intip;
+        eclic_insert_pending_list(eclic, irq);
+    } else {
+        if (eclic->clicintip[irq]) {
+            eclic_remove_pending_list(eclic, irq);
+        }
+        eclic->clicintip[irq] = 0;
+        eclic->clicintlist[irq].sig = new_intip;
+    }
+
+    nuclei_eclic_next_interrupt(eclic);
+}
+
+static void nuclei_eclic_update_intie(NucLeiECLICState *eclic,
+                                      int irq, int new_intie)
+{
+    eclic->clicintie[irq] = new_intie;
+    update_eclic_int_info(eclic, irq);
+    nuclei_eclic_next_interrupt(eclic);
+}
+
+static void nuclei_eclic_update_intattr(NucLeiECLICState *eclic,
+                                        int irq, int new_intattr)
+{
+    eclic->clicintattr[irq] = new_intattr;
+    update_eclic_int_info(eclic, irq);
+    nuclei_eclic_next_interrupt(eclic);
+}
+
+static void nuclei_eclic_update_intctl(NucLeiECLICState *eclic,
+                                       int irq, int new_intctl)
+{
+    eclic->clicintctl[irq] = new_intctl;
+    update_eclic_int_info(eclic, irq);
+    nuclei_eclic_next_interrupt(eclic);
+}
+
+qemu_irq nuclei_eclic_get_irq(DeviceState *dev, int irq)
+{
+    NucLeiECLICState *eclic = NUCLEI_ECLIC(dev);
+    return eclic->irqs[irq];
+}
+
+static uint64_t nuclei_eclic_read(void *opaque, hwaddr offset, unsigned size)
+{
+    NucLeiECLICState *eclic = NUCLEI_ECLIC(opaque);
+    uint64_t value = 0;
+    uint32_t id = 0;
+    if (offset >= NUCLEI_ECLIC_REG_CLICINTIP_BASE) {
+        if ((offset - 0x1000) % 4 == 0) {
+            id = (offset - 0x1000) / 4;
+        } else if ((offset - 0x1001) % 4 == 0) {
+            id = (offset - 0x1001) / 4;
+        } else if ((offset - 0x1002) % 4 == 0) {
+            id = (offset - 0x1002) / 4;
+        } else if ((offset - 0x1003) % 4 == 0) {
+            id = (offset - 0x1003) / 4;
+        }
+        offset = offset - 4 * id;
+    }
+
+    switch (offset) {
+    case NUCLEI_ECLIC_REG_CLICCFG:
+        value = eclic->cliccfg & 0xFF;
+        break;
+    case NUCLEI_ECLIC_REG_CLICINFO:
+        value = (CLICINTCTLBITS << 21) & 0xFFFFFFFF;
+        break;
+    case NUCLEI_ECLIC_REG_MTH:
+        value = eclic->mth & 0xFF;
+        break;
+    case NUCLEI_ECLIC_REG_CLICINTIP_BASE:
+        value = eclic->clicintip[id] & 0xFF;
+        break;
+    case NUCLEI_ECLIC_REG_CLICINTIE_BASE:
+        value = eclic->clicintie[id] & 0xFF;
+        break;
+    case NUCLEI_ECLIC_REG_CLICINTATTR_BASE:
+        value = eclic->clicintattr[id] & 0xFF;
+        break;
+    case NUCLEI_ECLIC_REG_CLICINTCTL_BASE:
+        value = eclic->clicintctl[id] & 0xFF;
+        break;
+    default:
+        break;
+    }
+
+    return value;
+}
+
+static void nuclei_eclic_write(void *opaque, hwaddr offset, uint64_t value,
+                               unsigned size)
+{
+    NucLeiECLICState *eclic = NUCLEI_ECLIC(opaque);
+    uint32_t id = 0;
+    if (offset >= NUCLEI_ECLIC_REG_CLICINTIP_BASE) {
+
+        if ((offset - 0x1000) % 4 == 0) {
+            id = (offset - 0x1000) / 4;
+        } else if ((offset - 0x1001) % 4 == 0) {
+            id = (offset - 0x1001) / 4;
+        } else if ((offset - 0x1002) % 4 == 0) {
+            id = (offset - 0x1002) / 4;
+        } else if ((offset - 0x1003) % 4 == 0) {
+            id = (offset - 0x1003) / 4;
+        }
+        offset = offset - 4 * id;
+    }
+    switch (offset) {
+    case NUCLEI_ECLIC_REG_CLICCFG:
+        eclic->cliccfg = value & 0xFF;
+        for (id = 0; id < eclic->num_sources; id++) {
+            update_eclic_int_info(eclic, id);
+        }
+        break;
+    case NUCLEI_ECLIC_REG_MTH:
+        nuclei_eclic_update_intmth(eclic, id, value & 0xFF);
+        break;
+    case NUCLEI_ECLIC_REG_CLICINTIP_BASE:
+        if ((eclic->clicintlist[id].trigger & 0x1) != 0) {
+            if ((eclic->clicintip[id] == 0) && (value & 0x1) == 1) {
+                eclic->clicintip[id] = 1;
+                eclic_insert_pending_list(eclic, id);
+            } else if ((eclic->clicintip[id] == 1) && (value & 0x1) == 0) {
+                eclic->clicintip[id] = 0;
+                eclic_remove_pending_list(eclic, id);
+            }
+        }
+        nuclei_eclic_next_interrupt(eclic);
+        break;
+    case NUCLEI_ECLIC_REG_CLICINTIE_BASE:
+        nuclei_eclic_update_intie(eclic, id, value & 0xFF);
+        break;
+    case NUCLEI_ECLIC_REG_CLICINTATTR_BASE:
+        nuclei_eclic_update_intattr(eclic, id, value & 0xFF);
+        break;
+    case NUCLEI_ECLIC_REG_CLICINTCTL_BASE:
+        nuclei_eclic_update_intctl(eclic, id, value & 0xFF);
+        break;
+    default:
+        break;
+    }
+}
+
+static const MemoryRegionOps nuclei_eclic_ops = {
+    .read = nuclei_eclic_read,
+    .write = nuclei_eclic_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+void riscv_cpu_eclic_clean_pending(void *eclic_ptr, int irq)
+{
+    NucLeiECLICState *eclic = (NucLeiECLICState *)eclic_ptr;
+    if ((eclic->clicintlist[irq].trigger & 0x1) != 0 && irq >= 0) {
+        eclic->clicintip[irq] = 0;
+        eclic_remove_pending_list(eclic, irq);
+    }
+}
+
+void riscv_cpu_eclic_get_next_interrupt(void *eclic_ptr)
+{
+    NucLeiECLICState *eclic = (NucLeiECLICState *)eclic_ptr;
+    nuclei_eclic_next_interrupt(eclic);
+}
+
+
+
+static void nuclei_eclic_irq_request(void *opaque, int id, int new_intip)
+{
+    NucLeiECLICState *eclic = NUCLEI_ECLIC(opaque);
+    nuclei_eclic_update_intip(eclic, id, new_intip);
+}
+
+static void nuclei_eclic_realize(DeviceState *dev, Error **errp)
+{
+    NucLeiECLICState *eclic = NUCLEI_ECLIC(dev);
+    int id;
+
+    memory_region_init_io(&eclic->mmio, OBJECT(dev), &nuclei_eclic_ops, eclic,
+                          TYPE_NUCLEI_ECLIC, eclic->aperture_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &eclic->mmio);
+
+    eclic->clicintip = g_new0(uint8_t, eclic->num_sources);
+    eclic->clicintlist = g_new0(ECLICPendingInterrupt, eclic->num_sources);
+    eclic->clicintie = g_new0(uint8_t, eclic->num_sources);
+    eclic->clicintattr = g_new0(uint8_t, eclic->num_sources);
+    eclic->clicintctl = g_new0(uint8_t, eclic->num_sources);
+    eclic->irqs = g_new0(qemu_irq, eclic->num_sources);
+    QLIST_INIT(&eclic->pending_list);
+    for (id = 0; id < eclic->num_sources; id++) {
+        eclic->clicintlist[id].irq = id;
+        update_eclic_int_info(eclic, id);
+    }
+    eclic->active_count = 0;
+
+    /* Init ECLIC IRQ */
+    eclic->irqs[Internal_SysTimerSW_IRQn] =
+        qemu_allocate_irq(nuclei_eclic_irq_request,
+                          eclic, Internal_SysTimerSW_IRQn);
+    eclic->irqs[Internal_SysTimer_IRQn] =
+        qemu_allocate_irq(nuclei_eclic_irq_request,
+                          eclic, Internal_SysTimer_IRQn);
+
+    for (id = Internal_Reserved_Max_IRQn; id < eclic->num_sources; id++) {
+        eclic->irqs[id] = qemu_allocate_irq(nuclei_eclic_irq_request,
+                                            eclic, id);
+    }
+
+    RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(0));
+    cpu->env.eclic = eclic;
+}
+
+static Property nuclei_eclic_properties[] = {
+    DEFINE_PROP_UINT32("aperture-size", NucLeiECLICState, aperture_size, 0),
+    DEFINE_PROP_UINT32("num-sources", NucLeiECLICState, num_sources, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void nuclei_eclic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, nuclei_eclic_properties);
+    dc->realize = nuclei_eclic_realize;
+}
+
+static const TypeInfo nuclei_eclic_info = {
+    .name = TYPE_NUCLEI_ECLIC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(NucLeiECLICState),
+    .class_init = nuclei_eclic_class_init,
+};
+
+static void nuclei_eclic_register_types(void)
+{
+    type_register_static(&nuclei_eclic_info);
+}
+
+type_init(nuclei_eclic_register_types);
+
+void nuclei_eclic_systimer_cb(DeviceState *dev)
+{
+    NucLeiECLICState *eclic = NUCLEI_ECLIC(dev);
+    nuclei_eclic_irq_request(eclic, Internal_SysTimer_IRQn, 1);
+}
+
+DeviceState *nuclei_eclic_create(hwaddr addr,
+                                 uint32_t aperture_size, uint32_t num_sources)
+{
+    DeviceState *dev = qdev_new(TYPE_NUCLEI_ECLIC);
+
+    qdev_prop_set_uint32(dev, "aperture-size", aperture_size);
+    qdev_prop_set_uint32(dev, "num-sources", num_sources);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    return dev;
+}
diff --git a/include/hw/intc/nuclei_eclic.h b/include/hw/intc/nuclei_eclic.h
new file mode 100644
index 0000000000..18b25485b9
--- /dev/null
+++ b/include/hw/intc/nuclei_eclic.h
@@ -0,0 +1,115 @@
+/*
+ * NUCLEI ECLIC (Enhanced Core Local Interrupt Controller) interface
+ *
+ * Copyright (c) 2020 Gao ZhiYuan <alapha23@gmail.com>
+ * Copyright (c) 2020-2021 PLCT Lab.All rights reserved.
+ *
+ * This provides a parameterizable interrupt controller based on NucLei's ECLIC.
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
+#ifndef HW_NUCLEI_ECLIC_H
+#define HW_NUCLEI_ECLIC_H
+
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+
+#define TYPE_NUCLEI_ECLIC "riscv.nuclei.eclic"
+
+#define INTERRUPT_SOURCE_MIN_ID (18)
+#define INTERRUPT_SOURCE_MAX_ID (4096)
+
+typedef struct NucLeiECLICState NucLeiECLICState;
+DECLARE_INSTANCE_CHECKER(NucLeiECLICState, NUCLEI_ECLIC,
+                         TYPE_NUCLEI_ECLIC)
+
+typedef struct ECLICPendingInterrupt {
+    int irq;
+    int prio;
+    int level;
+    int enable;
+    int trigger;
+    int sig;
+    QLIST_ENTRY(ECLICPendingInterrupt) next;
+} ECLICPendingInterrupt;
+
+#define NUCLEI_ECLIC_REG_CLICCFG          0x0000
+#define NUCLEI_ECLIC_REG_CLICINFO         0x0004
+#define NUCLEI_ECLIC_REG_MTH              0x000b
+#define NUCLEI_ECLIC_REG_CLICINTIP_BASE   0x1000
+#define NUCLEI_ECLIC_REG_CLICINTIE_BASE   0x1001
+#define NUCLEI_ECLIC_REG_CLICINTATTR_BASE 0x1002
+#define NUCLEI_ECLIC_REG_CLICINTCTL_BASE  0x1003
+
+#define CLICINTCTLBITS 0x6
+
+typedef struct NucLeiECLICState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+
+    uint32_t num_sources; /* 4-1024 */
+
+    /* config */
+    uint32_t sources_id;
+    uint8_t cliccfg; /*  nlbits(1~4) */
+    uint32_t clicinfo;
+    uint8_t mth; /* mth(0~7) */
+    uint8_t *clicintip;
+    uint8_t *clicintie;
+    uint8_t *clicintattr; /* shv(0) trig(1~2)*/
+    uint8_t *clicintctl;
+    ECLICPendingInterrupt *clicintlist;
+    uint32_t aperture_size;
+
+    QLIST_HEAD(, ECLICPendingInterrupt)
+    pending_list;
+    size_t active_count;
+
+    /* ECLIC IRQ handlers */
+    qemu_irq *irqs;
+
+} NucLeiECLICState;
+
+enum {
+    Internal_Reserved0_IRQn = 0,     /*!<  Internal reserved */
+    Internal_Reserved1_IRQn = 1,     /*!<  Internal reserved */
+    Internal_Reserved2_IRQn = 2,     /*!<  Internal reserved */
+    Internal_SysTimerSW_IRQn = 3,    /*!<  System Timer SW interrupt */
+    Internal_Reserved3_IRQn = 4,     /*!<  Internal reserved */
+    Internal_Reserved4_IRQn = 5,     /*!<  Internal reserved */
+    Internal_Reserved5_IRQn = 6,     /*!<  Internal reserved */
+    Internal_SysTimer_IRQn = 7,      /*!<  System Timer Interrupt */
+    Internal_Reserved6_IRQn = 8,     /*!<  Internal reserved */
+    Internal_Reserved7_IRQn = 9,     /*!<  Internal reserved */
+    Internal_Reserved8_IRQn = 10,    /*!<  Internal reserved */
+    Internal_Reserved9_IRQn = 11,    /*!<  Internal reserved */
+    Internal_Reserved10_IRQn = 12,   /*!<  Internal reserved */
+    Internal_Reserved11_IRQn = 13,   /*!<  Internal reserved */
+    Internal_Reserved12_IRQn = 14,   /*!<  Internal reserved */
+    Internal_Reserved13_IRQn = 15,   /*!<  Internal reserved */
+    Internal_Reserved14_IRQn = 16,   /*!<  Internal reserved */
+    Internal_BusError_IRQn = 17,     /*!<  Bus Error interrupt */
+    Internal_PerfMon_IRQn = 18,      /*!<  Performance Monitor */
+    Internal_Reserved_Max_IRQn = 19, /*!<  Internal reserved  Max */
+};
+
+DeviceState *nuclei_eclic_create(hwaddr addr,
+                                 uint32_t aperture_size, uint32_t num_sources);
+qemu_irq nuclei_eclic_get_irq(DeviceState *dev, int irq);
+void nuclei_eclic_systimer_cb(DeviceState *dev);
+
+#endif
-- 
2.17.1


