Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXt0-0007Tc-DW
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXse-0006oT-Ai; Wed, 30 Mar 2022 08:56:59 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsb-0004Zg-Be; Wed, 30 Mar 2022 08:56:55 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 371AB21EC1;
 Wed, 30 Mar 2022 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H96vv1RcBAGoFgvB1HCk9RCwLFA8TM2qjMuhFojhGew=;
 b=xfXg4bxk57Fa1BbhihiAaRZLREESNXaV9HG3/3R7a13lWAaTN5VjOk9u3RY9v+8rgwzRog
 XYL6DfT40i2BgxHkfDpAJnc/yTZPvK0Q2TOczMQe+MYZx8RFjdCld4P5FFEgnDfp9vjkKD
 jCINTVviGCrLGmbEedUh5BsdmGvc2K8=
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
Subject: [RFC PATCH 08/18] hw/arm/arm_cpus: add arm_cpus device
Date: Wed, 30 Mar 2022 14:56:29 +0200
Message-Id: <20220330125639.201937-9-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 30 Mar 2022 12:57:01 -0000

This object can be used to create a group of homogeneous
arm cpus.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/arm/arm_cpus.h | 45 ++++++++++++++++++++++++++++
 hw/arm/arm_cpus.c         | 63 +++++++++++++++++++++++++++++++++++++++
 hw/arm/meson.build        |  1 +
 3 files changed, 109 insertions(+)
 create mode 100644 include/hw/arm/arm_cpus.h
 create mode 100644 hw/arm/arm_cpus.c

diff --git a/include/hw/arm/arm_cpus.h b/include/hw/arm/arm_cpus.h
new file mode 100644
index 0000000000..8c540d9853
--- /dev/null
+++ b/include/hw/arm/arm_cpus.h
@@ -0,0 +1,45 @@
+/*
+ * ARM CPUs
+ *
+ * Copyright (c) 2022 Greensocs
+ *
+ * This work is licensed under the terms of the GNU GPLv2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_ARM_CPUS_H
+#define HW_ARM_CPUS_H
+
+#include "hw/cpu/cpus.h"
+#include "target/arm/cpu.h"
+
+#define TYPE_ARM_CPUS "arm-cpus"
+OBJECT_DECLARE_SIMPLE_TYPE(ArmCpusState, ARM_CPUS)
+
+/**
+ * ArmCpusState:
+ * @reset_hivecs: use to initialize cpu's reset-hivecs
+ * @has_el3: use to initialize cpu's has_el3
+ * @has_el2: use to initialize cpu's has_el2
+ * @reset_cbar: use to initialize cpu's reset-cbar
+ */
+struct ArmCpusState {
+    CpusState parent_obj;
+
+    bool reset_hivecs;
+    bool has_el3;
+    bool has_el2;
+    uint64_t reset_cbar;
+};
+
+/*
+ * arm_cpus_get_cpu:
+ * Helper to get an ArmCpu from the container.
+ */
+static inline ARMCPU *arm_cpus_get_cpu(ArmCpusState *s, unsigned i)
+{
+    return ARM_CPU(CPUS(s)->cpus[i]);
+}
+
+#endif /* HW_ARM_CPUS_H */
diff --git a/hw/arm/arm_cpus.c b/hw/arm/arm_cpus.c
new file mode 100644
index 0000000000..ed6483f45b
--- /dev/null
+++ b/hw/arm/arm_cpus.c
@@ -0,0 +1,63 @@
+/*
+ * ARM CPUs
+ *
+ * Copyright (c) 2022 Greensocs
+ *
+ * This work is licensed under the terms of the GNU GPLv2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/arm/arm_cpus.h"
+#include "hw/cpu/cpus.h"
+#include "hw/qdev-properties.h"
+#include "cpu.h"
+
+static Property arm_cpus_props[] = {
+    /* FIXME: get the default values from the arm cpu object */
+    DEFINE_PROP_BOOL("reset-hivecs", ArmCpusState, reset_hivecs, false),
+    DEFINE_PROP_BOOL("has_el3", ArmCpusState, has_el3, false),
+    DEFINE_PROP_BOOL("has_el2", ArmCpusState, has_el2, false),
+    DEFINE_PROP_UINT64("reset-cbar", ArmCpusState, reset_cbar, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void arm_cpus_configure_cpu(CpusState *base, CPUState *cpu,
+                                   unsigned i)
+{
+    ArmCpusState *s = ARM_CPUS(base);
+    DeviceState *cpudev = DEVICE(cpu);
+
+    qdev_prop_set_uint32(cpudev, "core-count", base->topology.cpus);
+    qdev_prop_set_bit(cpudev, "reset-hivecs", s->reset_hivecs);
+    qdev_prop_set_bit(cpudev, "has_el3", s->has_el3);
+    qdev_prop_set_bit(cpudev, "has_el2", s->has_el2);
+    qdev_prop_set_uint64(cpudev, "reset-cbar", s->reset_cbar);
+}
+
+static void arm_cpus_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    CpusClass *cc = CPUS_CLASS(klass);
+
+    device_class_set_props(dc, arm_cpus_props);
+
+    cc->configure_cpu = arm_cpus_configure_cpu;
+    cc->base_cpu_type = TYPE_ARM_CPU;
+}
+
+static const TypeInfo arm_cpus_info = {
+    .name              = TYPE_ARM_CPUS,
+    .parent            = TYPE_CPUS,
+    .instance_size     = sizeof(ArmCpusState),
+    .class_init        = arm_cpus_class_init,
+};
+
+static void arm_cpus_register_types(void)
+{
+    type_register_static(&arm_cpus_info);
+}
+
+type_init(arm_cpus_register_types)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 721a8eb8be..feeb301c09 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -58,5 +58,6 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c', 'smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
+arm_ss.add(files('arm_cpus.c'))
 
 hw_arch += {'arm': arm_ss}
-- 
2.35.1


