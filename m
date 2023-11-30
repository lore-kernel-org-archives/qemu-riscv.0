Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1276C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:36:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i87-0000CS-AI; Thu, 30 Nov 2023 09:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i85-0008Tr-2S; Thu, 30 Nov 2023 09:35:01 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i7u-0001Un-SP; Thu, 30 Nov 2023 09:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354890; x=1732890890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dK+ilj3Q1LqgiJ2/EiJWYjQp1qXfjG6+/g3hE8BTtcM=;
 b=CBoT00iUZavpZrRiU+b75R3pv+ggnBmPYkA3OVVGpHXlZXP8BkmReFDL
 nzeSWUyj86Om8LG3Oo1r9VMeI65OwpvuxWrFhU3VZceg2WWm7mprZPB8H
 /hEHgeFxedIEmnF1fz7PgisTHufE7jUa1IA57P/voCJv+8Q+JGgXzb5m7
 oPFy5gQUszeQtZMhjsq/A23VTZsykpJePbeOkHGAR2T1e2diCfKkTTvDt
 9gzJVjwnfi5vDparYIc7r+I74W4s8n8iRHof2pRhee2Img3sjbO/0g7wu
 uxg7XTPHEF1d5qGpP/m4t+cAiuWyGXXTtrnryn0gauXUGocEcnvUfdY2M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532284"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479532284"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730118"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942730118"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:37 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 27/41] hw/core/slot: Introduce CPU slot as the root of CPU
 topology
Date: Thu, 30 Nov 2023 22:41:49 +0800
Message-Id: <20231130144203.2307629-28-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Zhao Liu <zhao1.liu@intel.com>

Abstract the root of topology tree as a special topology device
"cpu-slot".

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS                |  2 ++
 hw/core/cpu-slot.c         | 48 ++++++++++++++++++++++++++++++++++++++
 hw/core/meson.build        |  1 +
 include/hw/core/cpu-slot.h | 38 ++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 hw/core/cpu-slot.c
 create mode 100644 include/hw/core/cpu-slot.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b373ff46ce3..ac08b5a8c4e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1856,6 +1856,7 @@ R: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Yanan Wang <wangyanan55@huawei.com>
 S: Supported
 F: hw/core/cpu.c
+F: hw/core/cpu-slot.c
 F: hw/core/cpu-topo.c
 F: hw/core/machine-qmp-cmds.c
 F: hw/core/machine.c
@@ -1872,6 +1873,7 @@ F: qapi/machine-common.json
 F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
+F: include/hw/core/cpu-slot.h
 F: include/hw/core/cpu-topo.h
 F: include/hw/cpu/book.h
 F: include/hw/cpu/cluster.h
diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
new file mode 100644
index 000000000000..5aef5b0189c2
--- /dev/null
+++ b/hw/core/cpu-slot.c
@@ -0,0 +1,48 @@
+/*
+ * CPU slot device abstraction
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/core/cpu-slot.h"
+
+static void cpu_slot_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
+    dc->user_creatable = false;
+
+    tc->level = CPU_TOPO_ROOT;
+}
+
+static const TypeInfo cpu_slot_type_info = {
+    .name = TYPE_CPU_SLOT,
+    .parent = TYPE_CPU_TOPO,
+    .class_init = cpu_slot_class_init,
+    .instance_size = sizeof(CPUSlot),
+};
+
+static void cpu_slot_register_types(void)
+{
+    type_register_static(&cpu_slot_type_info);
+}
+
+type_init(cpu_slot_register_types)
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 501d2529697e..3347c054e162 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -23,6 +23,7 @@ else
 endif
 
 common_ss.add(files('cpu-common.c'))
+common_ss.add(files('cpu-slot.c'))
 common_ss.add(files('cpu-topo.c'))
 common_ss.add(files('machine-smp.c'))
 system_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
new file mode 100644
index 000000000000..718c8ecaa751
--- /dev/null
+++ b/include/hw/core/cpu-slot.h
@@ -0,0 +1,38 @@
+/*
+ * CPU slot device abstraction
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef CPU_SLOT_H
+#define CPU_SLOT_H
+
+#include "hw/core/cpu-topo.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_CPU_SLOT "cpu-slot"
+
+OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
+
+struct CPUSlot {
+    /*< private >*/
+    CPUTopoState parent_obj;
+
+    /*< public >*/
+};
+
+#endif /* CPU_SLOT_H */
-- 
2.34.1


