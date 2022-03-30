Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXsv-0007G6-VE
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsh-0006ph-TL; Wed, 30 Mar 2022 08:56:59 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsd-0004aK-Rh; Wed, 30 Mar 2022 08:56:59 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id C51E821EC4;
 Wed, 30 Mar 2022 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TgBVOB8eywUWF0TVbBTwx1TADUqjp1LphGlG4SRhzoM=;
 b=EIPsTyJwptR+MBsVJSBb8zWtDXhzw3/g17r84ODSRPLTULZ8yNe4fIjy3Gu5o7dIw6zLTY
 Tjz9rHmdKBZ8SRKUJ6E569IgmEKnxBr5ybdsI7rU5lC0fRmk0yJEI+1SmMt2hKpV48+hfJ
 a2x/o+AHkJWD/fbWZmrQJPsGyusps3Y=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH 09/18] hw/arm/xlnx-zynqmp: convert cpu clusters to arm_cpus
Date: Wed, 30 Mar 2022 14:56:30 +0200
Message-Id: <20220330125639.201937-10-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Mar 2022 12:57:03 -0000

qom-path of cpus are changed:
+ "apu-cluster/apu-cpu[n]" to "apu/cpu[n]"
+ "rpu-cluster/rpu-cpu[n]" to "rpu/cpu[n]"

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/arm/xlnx-zynqmp.h |   8 +--
 hw/arm/xlnx-zynqmp.c         | 121 +++++++++++++----------------------
 2 files changed, 48 insertions(+), 81 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 9d9a9d0bf9..1bcc3f9356 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -31,7 +31,7 @@
 #include "hw/display/xlnx_dp.h"
 #include "hw/intc/xlnx-zynqmp-ipi.h"
 #include "hw/rtc/xlnx-zynqmp-rtc.h"
-#include "hw/cpu/cluster.h"
+#include "hw/arm/arm_cpus.h"
 #include "target/arm/cpu.h"
 #include "qom/object.h"
 #include "net/can_emu.h"
@@ -94,10 +94,8 @@ struct XlnxZynqMPState {
     DeviceState parent_obj;
 
     /*< public >*/
-    CPUClusterState apu_cluster;
-    CPUClusterState rpu_cluster;
-    ARMCPU apu_cpu[XLNX_ZYNQMP_NUM_APU_CPUS];
-    ARMCPU rpu_cpu[XLNX_ZYNQMP_NUM_RPU_CPUS];
+    ArmCpusState apu;
+    ArmCpusState rpu;
     GICState gic;
     MemoryRegion gic_mr[XLNX_ZYNQMP_GIC_REGIONS][XLNX_ZYNQMP_GIC_ALIASES];
 
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 5bfe285a19..fa0c093733 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -25,6 +25,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
 #include "kvm_arm.h"
+#include "hw/arm/arm_cpus.h"
 
 #define GIC_NUM_SPI_INTR 160
 
@@ -201,7 +202,7 @@ static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
 static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
                                    const char *boot_cpu, Error **errp)
 {
-    int i;
+    unsigned boot_idx;
     int num_rpus = MIN(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS,
                        XLNX_ZYNQMP_NUM_RPU_CPUS);
 
@@ -210,36 +211,21 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
         return;
     }
 
-    object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
-                            TYPE_CPU_CLUSTER);
-    qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
-
-    for (i = 0; i < num_rpus; i++) {
-        const char *name;
-
-        object_initialize_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
-                                &s->rpu_cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-r5f"));
-
-        name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
-        if (strcmp(name, boot_cpu)) {
-            /*
-             * Secondary CPUs start in powered-down state.
-             */
-            object_property_set_bool(OBJECT(&s->rpu_cpu[i]),
-                                     "start-powered-off", true, &error_abort);
-        } else {
-            s->boot_cpu_ptr = &s->rpu_cpu[i];
-        }
-
-        object_property_set_bool(OBJECT(&s->rpu_cpu[i]), "reset-hivecs", true,
-                                 &error_abort);
-        if (!qdev_realize(DEVICE(&s->rpu_cpu[i]), NULL, errp)) {
-            return;
-        }
+    /* apus are already created, rpus will have cluster-id 1 */
+    object_initialize_child(OBJECT(s), "rpu", &s->rpu, TYPE_ARM_CPUS);
+    qdev_prop_set_uint32(DEVICE(&s->rpu), "num-cpus", num_rpus);
+    qdev_prop_set_string(DEVICE(&s->rpu), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-r5f"));
+    qdev_prop_set_bit(DEVICE(&s->rpu), "reset-hivecs", true);
+    qdev_prop_set_bit(DEVICE(&s->rpu), "start-powered-off", true);
+
+    qdev_realize(DEVICE(&s->rpu), NULL, &error_fatal);
+
+    if (sscanf(boot_cpu, "rpu-cpu[%u]", &boot_idx) && boot_idx < num_rpus) {
+        s->boot_cpu_ptr = arm_cpus_get_cpu(&s->rpu, boot_idx);
+        object_property_set_bool(OBJECT(s->boot_cpu_ptr), "start-powered-on",
+                                 true, &error_abort);
     }
-
-    qdev_realize(DEVICE(&s->rpu_cluster), NULL, &error_fatal);
 }
 
 static void xlnx_zynqmp_create_bbram(XlnxZynqMPState *s, qemu_irq *gic)
@@ -296,7 +282,8 @@ static void xlnx_zynqmp_create_apu_ctrl(XlnxZynqMPState *s, qemu_irq *gic)
         g_autofree gchar *name = g_strdup_printf("cpu%d", i);
 
         object_property_set_link(OBJECT(&s->apu_ctrl), name,
-                                 OBJECT(&s->apu_cpu[i]), &error_abort);
+                                 OBJECT(arm_cpus_get_cpu(&s->apu, i)),
+                                 &error_abort);
     }
 
     sysbus_realize(sbd, &error_fatal);
@@ -349,15 +336,10 @@ static void xlnx_zynqmp_init(Object *obj)
     int i;
     int num_apus = MIN(ms->smp.cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
 
-    object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
-                            TYPE_CPU_CLUSTER);
-    qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
-
-    for (i = 0; i < num_apus; i++) {
-        object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
-                                &s->apu_cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a53"));
-    }
+    object_initialize_child(obj, "apu", &s->apu, TYPE_ARM_CPUS);
+    qdev_prop_set_uint32(DEVICE(&s->apu), "num-cpus", num_apus);
+    qdev_prop_set_string(DEVICE(&s->apu), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-a53"));
 
     object_initialize_child(obj, "gic", &s->gic, gic_class_name());
 
@@ -416,6 +398,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     MemoryRegion *system_memory = get_system_memory();
     uint8_t i;
     uint64_t ram_size;
+    unsigned boot_idx;
     int num_apus = MIN(ms->smp.cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
     const char *boot_cpu = s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
     ram_addr_t ddr_low_size, ddr_high_size;
@@ -474,34 +457,19 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_bit(DEVICE(&s->gic),
                       "has-virtualization-extensions", s->virt);
 
-    qdev_realize(DEVICE(&s->apu_cluster), NULL, &error_fatal);
-
-    /* Realize APUs before realizing the GIC. KVM requires this.  */
-    for (i = 0; i < num_apus; i++) {
-        const char *name;
-
-        name = object_get_canonical_path_component(OBJECT(&s->apu_cpu[i]));
-        if (strcmp(name, boot_cpu)) {
-            /*
-             * Secondary CPUs start in powered-down state.
-             */
-            object_property_set_bool(OBJECT(&s->apu_cpu[i]),
-                                     "start-powered-off", true, &error_abort);
-        } else {
-            s->boot_cpu_ptr = &s->apu_cpu[i];
-        }
-
-        object_property_set_bool(OBJECT(&s->apu_cpu[i]), "has_el3", s->secure,
-                                 NULL);
-        object_property_set_bool(OBJECT(&s->apu_cpu[i]), "has_el2", s->virt,
-                                 NULL);
-        object_property_set_int(OBJECT(&s->apu_cpu[i]), "reset-cbar",
-                                GIC_BASE_ADDR, &error_abort);
-        object_property_set_int(OBJECT(&s->apu_cpu[i]), "core-count",
-                                num_apus, &error_abort);
-        if (!qdev_realize(DEVICE(&s->apu_cpu[i]), NULL, errp)) {
-            return;
-        }
+    /* Realize APUs before realizing the GIC. KVM requires this. */
+    qdev_prop_set_bit(DEVICE(&s->apu), "start-powered-off", true);
+    qdev_prop_set_bit(DEVICE(&s->apu), "has_el3", s->secure);
+    qdev_prop_set_bit(DEVICE(&s->apu), "has_el2", s->virt);
+    qdev_prop_set_uint64(DEVICE(&s->apu), "reset-cbar", GIC_BASE_ADDR);
+    if (!qdev_realize(DEVICE(&s->apu), NULL, errp)) {
+        return;
+    }
+    /* ensure boot cpu will start */
+    if (sscanf(boot_cpu, "apu-cpu[%u]", &boot_idx) && boot_idx < num_apus) {
+        s->boot_cpu_ptr = arm_cpus_get_cpu(&s->apu, boot_idx);
+        object_property_set_bool(OBJECT(s->boot_cpu_ptr), "start-powered-off",
+                                 false, &error_abort);
     }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
@@ -533,32 +501,33 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
 
     for (i = 0; i < num_apus; i++) {
+        ARMCPU *apu_cpu = arm_cpus_get_cpu(&s->apu, i);
         qemu_irq irq;
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
-                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                           qdev_get_gpio_in(DEVICE(apu_cpu),
                                             ARM_CPU_IRQ));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus,
-                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                           qdev_get_gpio_in(DEVICE(apu_cpu),
                                             ARM_CPU_FIQ));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus * 2,
-                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                           qdev_get_gpio_in(DEVICE(apu_cpu),
                                             ARM_CPU_VIRQ));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus * 3,
-                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                           qdev_get_gpio_in(DEVICE(apu_cpu),
                                             ARM_CPU_VFIQ));
         irq = qdev_get_gpio_in(DEVICE(&s->gic),
                                arm_gic_ppi_index(i, ARM_PHYS_TIMER_PPI));
-        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_PHYS, irq);
+        qdev_connect_gpio_out(DEVICE(apu_cpu), GTIMER_PHYS, irq);
         irq = qdev_get_gpio_in(DEVICE(&s->gic),
                                arm_gic_ppi_index(i, ARM_VIRT_TIMER_PPI));
-        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_VIRT, irq);
+        qdev_connect_gpio_out(DEVICE(apu_cpu), GTIMER_VIRT, irq);
         irq = qdev_get_gpio_in(DEVICE(&s->gic),
                                arm_gic_ppi_index(i, ARM_HYP_TIMER_PPI));
-        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_HYP, irq);
+        qdev_connect_gpio_out(DEVICE(apu_cpu), GTIMER_HYP, irq);
         irq = qdev_get_gpio_in(DEVICE(&s->gic),
                                arm_gic_ppi_index(i, ARM_SEC_TIMER_PPI));
-        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_SEC, irq);
+        qdev_connect_gpio_out(DEVICE(apu_cpu), GTIMER_SEC, irq);
 
         if (s->virt) {
             irq = qdev_get_gpio_in(DEVICE(&s->gic),
-- 
2.35.1


