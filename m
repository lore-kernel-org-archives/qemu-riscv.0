Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015A2C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:37:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i7k-0007PY-TD; Thu, 30 Nov 2023 09:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i7V-0006xN-Ot; Thu, 30 Nov 2023 09:34:26 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i7S-0001Un-Ct; Thu, 30 Nov 2023 09:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354862; x=1732890862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KYdyPQbbzxDFAf7dgOGDTufkcJTYeF0L4udr4i03f58=;
 b=nVrvZOQ2zLkvLt5zc8ZVitp4F2lAJYYQ8h/3qzfWoW1DVQSHCf2z1Rc2
 ZY7lB/2RolYIauH4MmK8UoWWPCjFSoKkUIg5M8axmfXQzKOs4kO5dB6X5
 b4L5K6vhIdabnxupL4uSx5jQ2w7/L+LcqjRwCUwHKBlZbps+Z7B+uEiik
 4mLGQTaQ8IKKS9re6pSsoAVjqxkLby+cvtwle1w16lrA0u97jSkZUPloM
 BDYav9fCPYUT5CCLJCMFNsItvuJ7+qEuwhvmvXla5GqDYu8E9ivjxtZjt
 /lPdP8dPID0SVeJvSPDrzMcqeEdURJL0KdwWjAt04UuFu8LqsnjbJmJm7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532180"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479532180"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:34:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730082"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942730082"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:09 -0800
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
Subject: [RFC 24/41] hw/cpu/socket: Abstract cpu-socket level as topology
 device
Date: Thu, 30 Nov 2023 22:41:46 +0800
Message-Id: <20231130144203.2307629-25-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
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

Abstract socket level as a topology device "cpu-socket" to allow user to
create socket level topology from cli and later the cpu-sockets could be
added into topology tree.

In addition, mark the cpu-socket as DEVICE_CATEGORY_CPU_DEF category to
indicate it belongs to the basic CPU definition and should be created
from cli before board initialization.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS             |  2 ++
 hw/cpu/meson.build      |  2 +-
 hw/cpu/socket.c         | 46 +++++++++++++++++++++++++++++++++++++++++
 include/hw/cpu/socket.h | 38 ++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 hw/cpu/socket.c
 create mode 100644 include/hw/cpu/socket.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 91d0936edb32..6a9fa0aeed0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1864,6 +1864,7 @@ F: hw/core/null-machine.c
 F: hw/core/numa.c
 F: hw/cpu/cluster.c
 F: hw/cpu/die.c
+F: hw/cpu/socket.c
 F: qapi/machine.json
 F: qapi/machine-common.json
 F: qapi/machine-target.json
@@ -1872,6 +1873,7 @@ F: include/hw/core/cpu.h
 F: include/hw/core/cpu-topo.h
 F: include/hw/cpu/cluster.h
 F: include/hw/cpu/die.h
+F: include/hw/cpu/socket.h
 F: include/sysemu/numa.h
 F: tests/unit/test-smp-parse.c
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index e685fe1c7d8a..251724fea86c 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,4 +1,4 @@
-system_ss.add(files('core.c', 'cluster.c', 'die.c'))
+system_ss.add(files('core.c', 'cluster.c', 'die.c', 'socket.c'))
 
 system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
diff --git a/hw/cpu/socket.c b/hw/cpu/socket.c
new file mode 100644
index 000000000000..afd29f8a91c1
--- /dev/null
+++ b/hw/cpu/socket.c
@@ -0,0 +1,46 @@
+/*
+ * CPU socket abstract device
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
+#include "hw/cpu/socket.h"
+
+static void cpu_socket_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
+
+    tc->level = CPU_TOPO_SOCKET;
+}
+
+static const TypeInfo cpu_socket_type_info = {
+    .name = TYPE_CPU_SOCKET,
+    .parent = TYPE_CPU_TOPO,
+    .class_init = cpu_socket_class_init,
+    .instance_size = sizeof(CPUSocket),
+};
+
+static void cpu_socket_register_types(void)
+{
+    type_register_static(&cpu_socket_type_info);
+}
+
+type_init(cpu_socket_register_types)
diff --git a/include/hw/cpu/socket.h b/include/hw/cpu/socket.h
new file mode 100644
index 000000000000..897852903cd2
--- /dev/null
+++ b/include/hw/cpu/socket.h
@@ -0,0 +1,38 @@
+/*
+ * CPU socket abstract device
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
+#ifndef HW_CPU_SOCKET_H
+#define HW_CPU_SOCKET_H
+
+#include "hw/core/cpu-topo.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_CPU_SOCKET "cpu-socket"
+
+OBJECT_DECLARE_SIMPLE_TYPE(CPUSocket, CPU_SOCKET)
+
+struct CPUSocket {
+    /*< private >*/
+    CPUTopoState parent_obj;
+
+    /*< public >*/
+};
+
+#endif /* HW_CPU_SOCKET_H */
-- 
2.34.1


