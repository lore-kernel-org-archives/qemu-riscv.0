Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09213C10DAA
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:39:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i88-0000Ij-S9; Thu, 30 Nov 2023 09:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i86-0000BJ-WE; Thu, 30 Nov 2023 09:35:03 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i85-0001d0-3b; Thu, 30 Nov 2023 09:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354901; x=1732890901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FbB6vbX6bR4dqU1fCV07ghJ+c5nYYHlqh35CAqrTsmY=;
 b=B/nP++8jsG+K2z9pnGPDpayNbQ2YXtdACARmebKqiqXEGl2dBrcX2657
 +x9QBSlx/lW+m7eC7n0j/cto7yJ0HGWtogRPlwzdRUdDyRWm4b3hlV7kr
 RR2jmSPoh1YtS63KNKdQdrkKb9he9RXVOLzBDQXY3R3uSeGfmGDpzzkhR
 IxUoGFo4l/wJXoEJidYaie/2IxKy3KIlm/oH4TJkNgHQKiNVQpAzmmrUJ
 5cSP0OwXrF9xa9lMRLbozr+t7EBVzuFm/yyotH5eWr5aE/ZfZae/7cEjc
 vAy1XwoG/5jPlErXBfKWblmwi2Xffi4lpVjcQ/ChqzxP/u9adri9ir9iF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532317"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479532317"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:34:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730130"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942730130"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:34:47 -0800
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
Subject: [RFC 28/41] hw/core/slot: Maintain the core queue in CPU slot
Date: Thu, 30 Nov 2023 22:41:50 +0800
Message-Id: <20231130144203.2307629-29-zhao1.liu@linux.intel.com>
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

Maintain the cores queue at cpu-slot to facilitate direct traversal
of all cores.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 43 ++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu-slot.h |  9 ++++++++
 include/hw/cpu/core.h      |  2 ++
 3 files changed, 54 insertions(+)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index 5aef5b0189c2..a6b7d98dea18 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -22,6 +22,40 @@
 
 #include "hw/core/cpu-slot.h"
 
+static void cpu_slot_add_topo_info(CPUTopoState *root, CPUTopoState *child)
+{
+    CPUSlot *slot = CPU_SLOT(root);
+    CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+
+    if (level == CPU_TOPO_CORE) {
+        QTAILQ_INSERT_TAIL(&slot->cores, CPU_CORE(child), node);
+    }
+    return;
+}
+
+static void cpu_slot_del_topo_info(CPUTopoState *root, CPUTopoState *child)
+{
+    CPUSlot *slot = CPU_SLOT(root);
+    CPUTopoLevel level = CPU_TOPO_LEVEL(child);
+
+    if (level == CPU_TOPO_CORE) {
+        QTAILQ_REMOVE(&slot->cores, CPU_CORE(child), node);
+    }
+    return;
+}
+
+static void cpu_slot_update_topo_info(CPUTopoState *root, CPUTopoState *child,
+                                      bool is_realize)
+{
+    g_assert(child->parent);
+
+    if (is_realize) {
+        cpu_slot_add_topo_info(root, child);
+    } else {
+        cpu_slot_del_topo_info(root, child);
+    }
+}
+
 static void cpu_slot_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -31,12 +65,21 @@ static void cpu_slot_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = false;
 
     tc->level = CPU_TOPO_ROOT;
+    tc->update_topo_info = cpu_slot_update_topo_info;
+}
+
+static void cpu_slot_instance_init(Object *obj)
+{
+    CPUSlot *slot = CPU_SLOT(obj);
+
+    QTAILQ_INIT(&slot->cores);
 }
 
 static const TypeInfo cpu_slot_type_info = {
     .name = TYPE_CPU_SLOT,
     .parent = TYPE_CPU_TOPO,
     .class_init = cpu_slot_class_init,
+    .instance_init = cpu_slot_instance_init,
     .instance_size = sizeof(CPUSlot),
 };
 
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index 718c8ecaa751..d2a1160562be 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -22,17 +22,26 @@
 #define CPU_SLOT_H
 
 #include "hw/core/cpu-topo.h"
+#include "hw/cpu/core.h"
 #include "hw/qdev-core.h"
 
 #define TYPE_CPU_SLOT "cpu-slot"
 
 OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
 
+/**
+ * CPUSlot:
+ * @cores: Queue consisting of all the cores in the topology tree
+ *     where the cpu-slot is the root. cpu-slot can maintain similar
+ *     queues for other topology levels to facilitate traversal
+ *     when necessary.
+ */
 struct CPUSlot {
     /*< private >*/
     CPUTopoState parent_obj;
 
     /*< public >*/
+    QTAILQ_HEAD(, CPUCore) cores;
 };
 
 #endif /* CPU_SLOT_H */
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 591240861efb..65dc10931190 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -40,6 +40,8 @@ struct CPUCore {
      * "-device"/"device_add"?
      */
     int plugged_threads;
+
+    QTAILQ_ENTRY(CPUCore) node;
 };
 
 #endif
-- 
2.34.1


