Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01039C10DAA
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:37:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i9K-0002ob-0Q; Thu, 30 Nov 2023 09:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i98-0001jV-MO; Thu, 30 Nov 2023 09:36:07 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i90-0001tW-E1; Thu, 30 Nov 2023 09:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354958; x=1732890958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/v8heKKPYeoDkQz9adBaYazg44MH5EQbkce1fx19vRE=;
 b=ho2+FRa+OIviTDwySshVXwSE5mx0tXUzClJ9qIoZpSBjd8ZOTWghvEOC
 Z//8cLpwlI85ZzaE0OEJY8XiPSsr2WbbGSvxziaFMQWTqXDfbXfzubxP9
 EUZv6v9DsxQ8HNOjBQmyt3rzYiTNPfb5vk38X3irH0FJz2AAXaz0phAaR
 Zteq8PU9ytCe7C+/QNMq7cteAglCWKH7pZBmyiJevJvkqru8RcmPpZ3UF
 fuQtj0sOhLXF9J44Z+nEtaMXRn/t5ccYHWa/KITLeWi+/opmECySnXII0
 fMs+0rvN/3kVnjfTnu8+eSRbxHdVVFX+dOrhp1lkoj8QtZvzyJ4Z8xi2x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532517"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479532517"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:35:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730319"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942730319"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:44 -0800
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
Subject: [RFC 34/41] hw/core/topo: Implement user-child to collect topology
 device from cli
Date: Thu, 30 Nov 2023 22:41:56 +0800
Message-Id: <20231130144203.2307629-35-zhao1.liu@linux.intel.com>
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

Support user-child for topology devices.

This will affect these 2 aspects:
1. For the basic topology device (with DEVICE_CATEGORY_CPU_DEF
   category), user could specify "parent" to build the topology
   relationship from cli. And cpu-slot will collect all topology
   devices.

2. For the hotplug topology devices (ppc-core or CPUs of other arches),
   user-child could help to search the correct topology parent in
   topology tree with the index properties. This is compatible with
   the original behavior of inserting CPU/core from cli. And this
   requires arch to support QOM topology with a few arch-specific
   modifications, before this support, hotplugged CPUs/cores are
   inserted into cpu-slot by default.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 44 ++++++++++++++++++++++++++++++++++++++
 hw/core/cpu-topo.c         | 38 ++++++++++++++++++++++++++++++++
 include/hw/core/cpu-slot.h |  3 +++
 include/hw/core/cpu-topo.h |  4 ++++
 4 files changed, 89 insertions(+)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index 45b6aef0750a..413daa66aaad 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -559,3 +559,47 @@ bool machine_validate_cpu_topology(MachineState *ms, Error **errp)
 
     return true;
 }
+
+Object *cpu_slot_get_free_parent(CPUTopoState *child, Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+    CPUSlot *slot = ms->topo;
+
+    if (!slot) {
+        return NULL;
+    }
+
+    /*
+     * For CPUs and cores that support hotplug, the behavior is to specify
+     * some topology sub ids. This requires special handling.
+     */
+    if (level == mc->smp_props.possible_cpus_qom_granu) {
+        CPUTopoClass *child_tc = CPU_TOPO_GET_CLASS(child);
+
+        if (child_tc->search_parent_pre_plug) {
+            return child_tc->search_parent_pre_plug(child,
+                       CPU_TOPO(slot), errp);
+        }
+    }
+
+    /*
+     * For other topology devices, just collect them into CPU slot.
+     * The realize() of CPUTopoClass will check no "parent" option case.
+     */
+    return OBJECT(slot);
+}
+
+char *cpu_slot_name_future_child(CPUTopoState *child)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+    CPUSlot *slot = ms->topo;
+
+    if (!slot) {
+        return NULL;
+    }
+
+    return get_topo_global_name(&slot->stat, level);
+}
diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 351112ca7a73..143b0a148b17 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -20,8 +20,10 @@
 
 #include "qemu/osdep.h"
 
+#include "hw/core/cpu-slot.h"
 #include "hw/core/cpu-topo.h"
 #include "hw/qdev-properties.h"
+#include "monitor/user-child.h"
 #include "qapi/error.h"
 
 const char *cpu_topo_level_to_string(CPUTopoLevel level)
@@ -272,10 +274,38 @@ static void cpu_topo_unrealize(DeviceState *dev)
     }
 }
 
+/*
+ * Prefer to insert topology device into topology tree where the CPU
+ * slot is the root.
+ */
+static Object *cpu_topo_get_parent(UserChild *uc, Error **errp)
+{
+    return cpu_slot_get_free_parent(CPU_TOPO(uc), errp);
+}
+
+static char *cpu_topo_get_child_name(UserChild *uc, Object *parent)
+{
+    return cpu_slot_name_future_child(CPU_TOPO(uc));
+}
+
+/* Only check type. Other topology details with be checked at realize(). */
+static bool cpu_topo_check_user_parent(UserChild *uc, Object *parent)
+{
+    CPUTopoState *topo;
+
+    topo = (CPUTopoState *)object_dynamic_cast(parent, TYPE_CPU_TOPO);
+    if (!topo) {
+        return false;
+    }
+
+    return true;
+}
+
 static void cpu_topo_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUTopoClass *tc = CPU_TOPO_CLASS(oc);
+    UserChildClass *ucc = USER_CHILD_CLASS(oc);
 
     /* All topology devices belong to CPU property. */
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
@@ -290,6 +320,10 @@ static void cpu_topo_class_init(ObjectClass *oc, void *data)
     dc->hotpluggable = false;
 
     tc->level = CPU_TOPO_UNKNOWN;
+
+    ucc->get_parent = cpu_topo_get_parent;
+    ucc->get_child_name = cpu_topo_get_child_name;
+    ucc->check_parent = cpu_topo_check_user_parent;
 }
 
 static void cpu_topo_instance_init(Object *obj)
@@ -310,6 +344,10 @@ static const TypeInfo cpu_topo_type_info = {
     .class_init = cpu_topo_class_init,
     .instance_size = sizeof(CPUTopoState),
     .instance_init = cpu_topo_instance_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CHILD },
+        { }
+    }
 };
 
 static void cpu_topo_register_types(void)
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index 9e1c6d6b7ff2..1a63f55f52c3 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -102,4 +102,7 @@ void machine_plug_cpu_slot(MachineState *ms);
 void machine_create_smp_topo_tree(MachineState *ms, Error **errp);
 bool machine_validate_cpu_topology(MachineState *ms, Error **errp);
 
+Object *cpu_slot_get_free_parent(CPUTopoState *child, Error **errp);
+char *cpu_slot_name_future_child(CPUTopoState *child);
+
 #endif /* CPU_SLOT_H */
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index d27da0335c42..6cef26cce0b7 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -48,6 +48,8 @@ OBJECT_DECLARE_TYPE(CPUTopoState, CPUTopoClass, CPU_TOPO)
  *     new child (including direct child and non-direct child) is added.
  * @check_topo_child: Method to check the support for new child (including
  *     direct child and non-direct child) to be added.
+ * @search_parent_pre_plug: Method to search proper topology parent of @child
+ *     from @root.
  */
 struct CPUTopoClass {
     /*< private >*/
@@ -59,6 +61,8 @@ struct CPUTopoClass {
                              bool is_realize);
     void (*check_topo_child)(CPUTopoState *parent, CPUTopoState *child,
                              Error **errp);
+    Object *(*search_parent_pre_plug)(CPUTopoState *child, CPUTopoState *root,
+                                      Error **errp);
 };
 
 /**
-- 
2.34.1


