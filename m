Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXss-000716-12
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsb-0006mJ-8G; Wed, 30 Mar 2022 08:56:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsY-0004YY-0h; Wed, 30 Mar 2022 08:56:52 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 9794D21CC1;
 Wed, 30 Mar 2022 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKvPP77QeCmqz1npcQBtAJ/AmH8Km0hFOkkSeWT72xg=;
 b=m/TBb0Jb44e1pZMczEMmZ7Hcczonlcd0cKMBYEwQTUURddUmT3Dxso5S61VxIoffUn/Vvg
 SJoP+D0STO7YQjwrRKUUEtp+jCWAgWB3ECqsnkSEUdcr/fiVTTxvsok3lIfWR66LYBiBoI
 VDdj8iy9KmSR/p2yvsMBic8Qdm3bClk=
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
Subject: [RFC PATCH 02/18] hw/cpu/cpus: introduce _cpus_ device
Date: Wed, 30 Mar 2022 14:56:23 +0200
Message-Id: <20220330125639.201937-3-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 30 Mar 2022 12:56:59 -0000

This object will be a _cpu-cluster_ generalization and
is meant to allow create cpus of the same type.

The main goal is that this object, on contrary to _cpu-cluster-_,
can be used to dynamically create cpus: it does not rely on
external code to populate the object with cpus.

Allowing the user to create a cpu cluster and each _cpu_
separately would be hard because of the following reasons:
+ cpu reset need to be handled
+ instantiation and realize of cpu-cluster and the cpus
  are interleaved
+ cpu cluster must contains only identical cpus and it seems
  difficult to check that at runtime.
Therefore we add a new type solving all this constraints.

_cpu-cluster_ will be updated to inherit from this class
in following commits.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/cpu/cpus.h |  71 +++++++++++++++++++++++
 hw/cpu/cpus.c         | 127 ++++++++++++++++++++++++++++++++++++++++++
 hw/cpu/meson.build    |   2 +-
 3 files changed, 199 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/cpu/cpus.h
 create mode 100644 hw/cpu/cpus.c

diff --git a/include/hw/cpu/cpus.h b/include/hw/cpu/cpus.h
new file mode 100644
index 0000000000..c65f568ef8
--- /dev/null
+++ b/include/hw/cpu/cpus.h
@@ -0,0 +1,71 @@
+/*
+ * QEMU CPUs type
+ *
+ * Copyright (c) 2022 GreenSocs
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_CPU_CPUS_H
+#define HW_CPU_CPUS_H
+
+#include "qemu/typedefs.h"
+#include "hw/qdev-core.h"
+#include "qom/object.h"
+
+/*
+ * This object represent several CPUs which are all identical.
+ *
+ * If CPUs are not identical (for example, Cortex-A53 and Cortex-A57 CPUs in an
+ * Arm big.LITTLE system) they should be in different groups. If the CPUs do
+ * not have the same view of memory (for example the main CPU and a management
+ * controller processor) they should be in different groups.
+ *
+ * This is an abstract class, subclasses are supposed to be created on
+ * per-architecture basis to handle the specifics of the cpu architecture.
+ * Subclasses are meant to be user-creatable (for cold-plug).
+ */
+
+#define TYPE_CPUS "cpus"
+OBJECT_DECLARE_TYPE(CpusState, CpusClass, CPUS)
+
+/**
+ * CpusState:
+ * @cpu_type: The type of cpu.
+ * @topology.cpus: The number of cpus in this group.
+ *      Explicity put this field into a topology structure in
+ *      order to eventually update this smoothly with a full
+ *      CpuTopology structure in the future.
+ * @cpus: Array of pointer to cpu objects.
+ */
+struct CpusState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+    char *cpu_type;
+    struct {
+        uint16_t cpus;
+    } topology;
+    CPUState **cpus;
+};
+
+typedef void (*CpusConfigureCpu)(CpusState *s, CPUState *cpu, unsigned idx);
+
+/**
+ * CpusClass:
+ * @base_cpu_type: base cpu type accepted by this cpu group
+ *     (the state cpu_type will be tested against it).
+ * @configure_cpu: method to configure a cpu (called between
+ *     cpu init and realize)
+ * @skip_cpus_creation: CPUCLuster do not rely on creating
+ *     cpus internally. This flag disables this feature.
+ */
+struct CpusClass {
+    DeviceClass parent_class;
+    const char *base_cpu_type;
+    CpusConfigureCpu configure_cpu;
+    bool skip_cpus_creation;
+};
+
+#endif /* HW_CPU_CPUS_H */
diff --git a/hw/cpu/cpus.c b/hw/cpu/cpus.c
new file mode 100644
index 0000000000..5fad1de2c7
--- /dev/null
+++ b/hw/cpu/cpus.c
@@ -0,0 +1,127 @@
+/*
+ * QEMU CPUs type
+ *
+ * Copyright (c) 2022 GreenSocs
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "qemu/cutils.h"
+#include "hw/cpu/cpus.h"
+#include "hw/core/cpu.h"
+#include "hw/resettable.h"
+#include "sysemu/reset.h"
+
+static Property cpus_properties[] = {
+    DEFINE_PROP_STRING("cpu-type", CpusState, cpu_type),
+    DEFINE_PROP_UINT16("num-cpus", CpusState, topology.cpus, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void cpus_reset(Object *obj)
+{
+    CpusState *s = CPUS(obj);
+    for (unsigned i = 0; i < s->topology.cpus; i++) {
+        cpu_reset(s->cpus[i]);
+    }
+}
+
+static void cpus_create_cpus(CpusState *s, Error **errp)
+{
+    Error *err = NULL;
+    CpusClass *cgc = CPUS_GET_CLASS(s);
+    s->cpus = g_new0(CPUState *, s->topology.cpus);
+
+    for (unsigned i = 0; i < s->topology.cpus; i++) {
+        CPUState *cpu = CPU(object_new(s->cpu_type));
+        s->cpus[i] = cpu;
+
+        /* set child property and release the initial ref */
+        object_property_add_child(OBJECT(s), "cpu[*]", OBJECT(cpu));
+        object_unref(OBJECT(cpu));
+
+        /* let subclass configure the cpu */
+        if (cgc->configure_cpu) {
+            cgc->configure_cpu(s, cpu, i);
+        }
+
+        /* finally realize the cpu */
+        qdev_realize(DEVICE(cpu), NULL, &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+    }
+}
+
+static void cpus_realize(DeviceState *dev, Error **errp)
+{
+    CpusState *s = CPUS(dev);
+    CpusClass *cgc = CPUS_GET_CLASS(s);
+
+    /* if subclass defined a base type, let's check it */
+    if (cgc->base_cpu_type &&
+        !object_class_dynamic_cast(object_class_by_name(s->cpu_type),
+                                   cgc->base_cpu_type)) {
+        error_setg(errp, "bad cpu-type '%s' (expected '%s')", s->cpu_type,
+                   cgc->base_cpu_type);
+        return;
+    }
+
+    if (s->topology.cpus == 0) {
+        error_setg(errp, "num-cpus is zero");
+        return;
+    }
+
+    /* create the cpus if needed */
+    if (!cgc->skip_cpus_creation) {
+        cpus_create_cpus(s, errp);
+        qemu_register_reset(resettable_cold_reset_fn, s);
+    }
+}
+
+static void cpus_finalize(Object *obj)
+{
+    CpusState *s = CPUS(obj);
+
+    g_free(s->cpus);
+}
+
+static void cpus_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    device_class_set_props(dc, cpus_properties);
+    dc->realize = cpus_realize;
+
+    rc->phases.exit = cpus_reset;
+
+    /*
+     * Subclasses are expected to be user-creatable.
+     * They may provide support to hotplug cpus, but they are
+     * not expected to be hotpluggable themselves.
+     */
+    dc->hotpluggable = false;
+}
+
+static const TypeInfo cpus_type_info = {
+    .name              = TYPE_CPUS,
+    .parent            = TYPE_DEVICE,
+    .abstract          = true,
+    .instance_size     = sizeof(CpusState),
+    .instance_finalize = cpus_finalize,
+    .class_size        = sizeof(CpusClass),
+    .class_init        = cpus_class_init,
+};
+
+static void cpus_register_types(void)
+{
+    type_register_static(&cpus_type_info);
+}
+
+type_init(cpus_register_types)
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index 9e52fee9e7..ca4dda4f88 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,4 +1,4 @@
-softmmu_ss.add(files('core.c', 'cluster.c'))
+softmmu_ss.add(files('core.c', 'cluster.c', 'cpus.c'))
 
 specific_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
 specific_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
-- 
2.35.1


