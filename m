Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E18C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:40:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i8f-0001Q2-Oz; Thu, 30 Nov 2023 09:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i8O-00015j-Vz; Thu, 30 Nov 2023 09:35:21 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i8H-0001pX-9K; Thu, 30 Nov 2023 09:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354913; x=1732890913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3aKtyhn4HEa/g5VVCwXVJ9czPMzUH1bTJvhs1x/p4jk=;
 b=XJtwbaKvtZzA19SeU6jvNVCAJTv4RvPC8IPNAlv2vuL6dJmXhaq42p0O
 /znPg6S/rXNUgIM9y4TP2bOnf6LLS0yPcUN8Jz+d7McxoxlZfWtBBX2ET
 DQdbxQg3LwX1t9L3W38Kv3qLdcSAt1Lw40JAA3AKK8WoxcusyMXdFEFLQ
 z808TcQ763jHNxFpwpDnfKJ2VlSjKqZkwXCJX0rQveGMlWhdDjdtDAG1R
 HQu6gEJCC82IW7JloKqS6IDr46yC8lmfNpBelg6hXdl4KJP/2vDARGum2
 8B+V8LObvzl86uKI/19FE5B/6koOhNcvsyHsV6lGKYD8X6MqKtVqxLyIU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532333"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479532333"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730181"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942730181"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:56 -0800
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
Subject: [RFC 29/41] hw/core/slot: Statistics topology information in CPU slot
Date: Thu, 30 Nov 2023 22:41:51 +0800
Message-Id: <20231130144203.2307629-30-zhao1.liu@linux.intel.com>
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
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The CPU slot, as the root of the topology tree, is responsible for
global topology information collection and updates.

When a new topology device is added to/deleted from the topology tree,
update the corresponding information in the slot.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 41 +++++++++++++++++++++++++++++++++++-
 include/hw/core/cpu-slot.h | 43 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index a6b7d98dea18..e8e6f4d25532 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -22,14 +22,44 @@
 
 #include "hw/core/cpu-slot.h"
 
+static inline
+CPUTopoStatEntry *get_topo_stat_entry(CPUTopoStat *stat,
+                                      CPUTopoLevel level)
+{
+    assert(level != CPU_TOPO_UNKNOWN);
+
+    return &stat->entries[TOPO_STAT_ENTRY_IDX(level)];
+}
+
 static void cpu_slot_add_topo_info(CPUTopoState *root, CPUTopoState *child)
 {
     CPUSlot *slot = CPU_SLOT(root);
     CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+    CPUTopoStatEntry *entry;
 
     if (level == CPU_TOPO_CORE) {
-        QTAILQ_INSERT_TAIL(&slot->cores, CPU_CORE(child), node);
+        CPUCore *core = CPU_CORE(child);
+        CPUTopoStatEntry *thread_entry;
+
+        QTAILQ_INSERT_TAIL(&slot->cores, core, node);
+
+        /* Max CPUs per core is pre-configured by "nr-threads". */
+        slot->stat.max_cpus += core->nr_threads;
+        slot->stat.pre_plugged_cpus += core->plugged_threads;
+
+        thread_entry = get_topo_stat_entry(&slot->stat, CPU_TOPO_THREAD);
+        if (child->max_children > thread_entry->max_units) {
+            thread_entry->max_units = child->max_children;
+        }
     }
+
+    entry = get_topo_stat_entry(&slot->stat, level);
+    entry->total_units++;
+    if (child->parent->num_children > entry->max_units) {
+        entry->max_units = child->parent->num_children;
+    }
+
+    set_bit(level, slot->stat.curr_levels);
     return;
 }
 
@@ -37,10 +67,18 @@ static void cpu_slot_del_topo_info(CPUTopoState *root, CPUTopoState *child)
 {
     CPUSlot *slot = CPU_SLOT(root);
     CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+    CPUTopoStatEntry *entry;
+
+    assert(level != CPU_TOPO_UNKNOWN);
 
     if (level == CPU_TOPO_CORE) {
         QTAILQ_REMOVE(&slot->cores, CPU_CORE(child), node);
     }
+
+    entry = get_topo_stat_entry(&slot->stat, level);
+    entry->total_units--;
+
+    /* No need to update entries[*].max_units and curr_levels. */
     return;
 }
 
@@ -73,6 +111,7 @@ static void cpu_slot_instance_init(Object *obj)
     CPUSlot *slot = CPU_SLOT(obj);
 
     QTAILQ_INIT(&slot->cores);
+    set_bit(CPU_TOPO_ROOT, slot->stat.curr_levels);
 }
 
 static const TypeInfo cpu_slot_type_info = {
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index d2a1160562be..fa2bd4af247d 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -25,6 +25,47 @@
 #include "hw/cpu/core.h"
 #include "hw/qdev-core.h"
 
+/**
+ * @USER_AVAIL_LEVEL_NUM: the number of total topology levels in topology
+ *                        bitmap, which includes CPU_TOPO_UNKNOWN.
+ */
+#define USER_AVAIL_LEVEL_NUM (CPU_TOPO_ROOT + 1)
+
+/**
+ * @VALID_LEVEL_NUM: the number of valid topology levels, which excludes
+ *                   CPU_TOPO_UNKNOWN and CPU_TOPO_ROOT.
+ */
+#define VALID_LEVEL_NUM (CPU_TOPO_ROOT - 1)
+
+#define TOPO_STAT_ENTRY_IDX(level) ((level) - 1)
+
+/**
+ * CPUTopoStatEntry:
+ * @total: Total number of topological units at the same level that are
+ *         currently inserted in CPU slot
+ * @max: Maximum number of topological units at the same level under the
+ *       parent topolofical container
+ */
+typedef struct CPUTopoStatEntry {
+    unsigned int total_units;
+    unsigned int max_units;
+} CPUTopoStatEntry;
+
+/**
+ * CPUTopoStat:
+ * @max_cpus: Maximum number of CPUs in CPU slot.
+ * @pre_plugged_cpus: Number of pre-plugged CPUs in CPU slot.
+ * @entries: Detail count information for valid topology levels under
+ *           CPU slot
+ * @curr_levels: Current CPU topology levels inserted in CPU slot
+ */
+typedef struct CPUTopoStat {
+    unsigned int max_cpus;
+    unsigned int pre_plugged_cpus;
+    CPUTopoStatEntry entries[VALID_LEVEL_NUM];
+    DECLARE_BITMAP(curr_levels, USER_AVAIL_LEVEL_NUM);
+} CPUTopoStat;
+
 #define TYPE_CPU_SLOT "cpu-slot"
 
 OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
@@ -35,6 +76,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
  *     where the cpu-slot is the root. cpu-slot can maintain similar
  *     queues for other topology levels to facilitate traversal
  *     when necessary.
+ * @stat: Statistical topology information for topology tree.
  */
 struct CPUSlot {
     /*< private >*/
@@ -42,6 +84,7 @@ struct CPUSlot {
 
     /*< public >*/
     QTAILQ_HEAD(, CPUCore) cores;
+    CPUTopoStat stat;
 };
 
 #endif /* CPU_SLOT_H */
-- 
2.34.1


