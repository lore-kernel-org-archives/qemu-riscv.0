Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E5AC10DC3
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:38:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i93-0001iI-VJ; Thu, 30 Nov 2023 09:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i8P-000160-5z; Thu, 30 Nov 2023 09:35:21 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i8N-0001qi-0i; Thu, 30 Nov 2023 09:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354919; x=1732890919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HnOAO3NMx1dRMWQIeSpDRtg/0be+6N1pOpK/5nWbTXE=;
 b=DU//5S62izPMvrZxFxAZ+lXRnPSNs+WPPZo3blL01HjQnSB+k0fbnken
 SPWJSMf6BdFDdQVGIkQ/Nkf2AM8r474YR8K3mti69JfmDfMomfR2DL1iE
 eZ1NYFdDxgipBwVhx6s12tyUvhRoj5W07EEFmHToWCjEiv+xCpUETKPCc
 JUJyMUQigyrZ5UXyFR+zuMe1z9xxWtV9xNPHz18YKczbHY6FmqCimC+AE
 tvczfUfokmf0/ACnITmMTIHHebLoB7FF/d90TA7mjrnwXyM45GRirpTn5
 uxz1x3amwbukUmGBQBCeohOb+ZdkqfSCyvIfWacvMPaedJ2zucc7F3RHW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532380"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479532380"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730225"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942730225"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:05 -0800
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
Subject: [RFC 30/41] hw/core/slot: Check topology child to be added under CPU
 slot
Date: Thu, 30 Nov 2023 22:41:52 +0800
Message-Id: <20231130144203.2307629-31-zhao1.liu@linux.intel.com>
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

Implement CPUTopoClass.check_topo_child() in cpu-slot to be compatible
with the limitations of the current smp topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 37 +++++++++++++++++++++++++++++++++++++
 hw/core/cpu-topo.c         |  2 +-
 include/hw/core/cpu-slot.h |  2 ++
 include/hw/core/cpu-topo.h |  1 +
 4 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index e8e6f4d25532..2a796ad5b6e7 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 
 #include "hw/core/cpu-slot.h"
+#include "qapi/error.h"
 
 static inline
 CPUTopoStatEntry *get_topo_stat_entry(CPUTopoStat *stat,
@@ -94,6 +95,37 @@ static void cpu_slot_update_topo_info(CPUTopoState *root, CPUTopoState *child,
     }
 }
 
+static void cpu_slot_check_topo_support(CPUTopoState *root, CPUTopoState *child,
+                                        Error **errp)
+{
+    CPUSlot *slot = CPU_SLOT(root);
+    CPUTopoLevel child_level = CPU_TOPO_LEVEL(child);
+
+    if (!test_bit(child_level, slot->supported_levels)) {
+        error_setg(errp, "cpu topo: the level %s is not supported",
+                   cpu_topo_level_to_string(child_level));
+        return;
+    }
+
+    /*
+     * Currently we doesn't support hybrid topology. For SMP topology,
+     * each child under the same parent are same type.
+     */
+    if (child->parent->num_children) {
+        CPUTopoState *sibling = QTAILQ_FIRST(&child->parent->children);
+        const char *sibling_type = object_get_typename(OBJECT(sibling));
+        const char *child_type = object_get_typename(OBJECT(child));
+
+        if (strcmp(sibling_type, child_type)) {
+            error_setg(errp, "Invalid smp topology: different CPU "
+                       "topology types (%s child vs %s sibling) "
+                       "under the same parent (%s).",
+                       child_type, sibling_type,
+                       object_get_typename(OBJECT(child->parent)));
+        }
+    }
+}
+
 static void cpu_slot_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -104,6 +136,7 @@ static void cpu_slot_class_init(ObjectClass *oc, void *data)
 
     tc->level = CPU_TOPO_ROOT;
     tc->update_topo_info = cpu_slot_update_topo_info;
+    tc->check_topo_child = cpu_slot_check_topo_support;
 }
 
 static void cpu_slot_instance_init(Object *obj)
@@ -112,6 +145,10 @@ static void cpu_slot_instance_init(Object *obj)
 
     QTAILQ_INIT(&slot->cores);
     set_bit(CPU_TOPO_ROOT, slot->stat.curr_levels);
+
+    /* Set all levels by default. */
+    bitmap_fill(slot->supported_levels, USER_AVAIL_LEVEL_NUM);
+    clear_bit(CPU_TOPO_UNKNOWN, slot->supported_levels);
 }
 
 static const TypeInfo cpu_slot_type_info = {
diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 687a4cc566ec..351112ca7a73 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -24,7 +24,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
-static const char *cpu_topo_level_to_string(CPUTopoLevel level)
+const char *cpu_topo_level_to_string(CPUTopoLevel level)
 {
     switch (level) {
     case CPU_TOPO_UNKNOWN:
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index fa2bd4af247d..7bf51988afb3 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -77,6 +77,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
  *     queues for other topology levels to facilitate traversal
  *     when necessary.
  * @stat: Statistical topology information for topology tree.
+ * @supported_levels: Supported topology levels for topology tree.
  */
 struct CPUSlot {
     /*< private >*/
@@ -85,6 +86,7 @@ struct CPUSlot {
     /*< public >*/
     QTAILQ_HEAD(, CPUCore) cores;
     CPUTopoStat stat;
+    DECLARE_BITMAP(supported_levels, USER_AVAIL_LEVEL_NUM);
 };
 
 #endif /* CPU_SLOT_H */
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index 453bacbb558b..d27da0335c42 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -102,5 +102,6 @@ int cpu_topo_child_foreach(CPUTopoState *topo, unsigned long *levels,
 int cpu_topo_child_foreach_recursive(CPUTopoState *topo,
                                      unsigned long *levels,
                                      topo_fn fn, void *opaque);
+const char *cpu_topo_level_to_string(CPUTopoLevel level);
 
 #endif /* CPU_TOPO_H */
-- 
2.34.1


