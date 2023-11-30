Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02088C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:32:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i5e-0002MN-Os; Thu, 30 Nov 2023 09:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i5c-0002Ce-MQ; Thu, 30 Nov 2023 09:32:28 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i5Z-00018C-R6; Thu, 30 Nov 2023 09:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354745; x=1732890745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zcorAWDLgR7QueFdQsmIMfIxo58a5rqxmGG3Y6CdsHI=;
 b=BHQusIU/dLjU7NIEFO13j/KoSWNdsI89J3t8B9uBenczJR1PmTV8FBLm
 E+ahwlmHKBlzwa/iZqQxhUBjic7ds+AAPrO9R5H+q7O77VBGHJjTmswfd
 BTEbjWhbo3q3CqVZbQ4XINjGAu8BO549AFEZlGI3g6yCFb/bx6VvpMmUG
 cXpnY2RuaT07IlBdECwHVDfU+VbKPQGxfth0hudjh4wLdyASHe9LXoswi
 QJc1MBj7MaPiD/Oq6G7ODk4xQLtt73mMyalO6wxMisttEb8xw4F/xnPU6
 6+8cg7H5cXSIcLhjUFbW2W1vKgDlbk2VKCyytVbSo8u6zagME+9U3J5ZQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531490"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479531490"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729745"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942729745"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:48 -0800
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
Subject: [RFC 09/41] hw/core/topo: Support topology index for topology device
Date: Thu, 30 Nov 2023 22:41:31 +0800
Message-Id: <20231130144203.2307629-10-zhao1.liu@linux.intel.com>
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

Topology index is used to identify the topology child under the same
parent topology device.

This field corresponds to the topology sub index (e.g., socket-id/
core-id/thread-id) used for addressing.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-topo.c         | 77 ++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu-topo.h |  6 +++
 2 files changed, 83 insertions(+)

diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 4428b979a5dc..3e0c183388d8 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -50,6 +50,66 @@ static const char *cpu_topo_level_to_string(CPUTopoLevel level)
     return NULL;
 }
 
+static void cpu_topo_refresh_free_child_index(CPUTopoState *topo)
+{
+    CPUTopoState *child;
+
+    /*
+     * Fast way: Assume that the index grows sequentially and that there
+     * are no "index hole" in the previous children.
+     *
+     * The previous check on num_children ensures that free_child_index + 1
+     * does not hit the max_children limit.
+     */
+    if (topo->free_child_index + 1 == topo->num_children) {
+        topo->free_child_index++;
+        return;
+    }
+
+    /* Slow way: Search the "index hole". The index hole must be found. */
+    for (int index = 0; index < topo->num_children; index++) {
+        bool existed = false;
+
+        QTAILQ_FOREACH(child, &topo->children, sibling) {
+            if (child->index == index) {
+                existed = true;
+                break;
+            }
+        }
+
+        if (!existed) {
+            topo->free_child_index = index;
+            return;
+        }
+    }
+}
+
+static void cpu_topo_validate_index(CPUTopoState *topo, Error **errp)
+{
+    CPUTopoState *parent = topo->parent, *child;
+
+    if (topo->index < 0) {
+        error_setg(errp, "Invalid topology index (%d).",
+                   topo->index);
+        return;
+    }
+
+    if (parent->max_children && topo->index >= parent->max_children) {
+        error_setg(errp, "Invalid topology index (%d): "
+                   "The maximum index is %d.",
+                   topo->index, parent->max_children);
+        return;
+    }
+
+    QTAILQ_FOREACH(child, &topo->children, sibling) {
+        if (child->index == topo->index) {
+            error_setg(errp, "Duplicate topology index (%d)",
+                       topo->index);
+            return;
+        }
+    }
+}
+
 static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
 {
     CPUTopoState *parent = topo->parent;
@@ -80,7 +140,18 @@ static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
     }
 
     parent->num_children++;
+    if (topo->index == UNASSIGNED_TOPO_INDEX) {
+        topo->index = parent->free_child_index;
+    } else if (topo->index != parent->free_child_index) {
+        /* The index has been set, then we need to validate it. */
+        cpu_topo_validate_index(topo, errp);
+        if (*errp) {
+            return;
+        }
+    }
+
     QTAILQ_INSERT_TAIL(&parent->children, topo, sibling);
+    cpu_topo_refresh_free_child_index(parent);
 }
 
 static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
@@ -135,6 +206,10 @@ static void cpu_topo_destroy_hierarchy(CPUTopoState *topo)
     QTAILQ_REMOVE(&parent->children, topo, sibling);
     parent->num_children--;
 
+    if (topo->index < parent->free_child_index) {
+        parent->free_child_index = topo->index;
+    }
+
     if (!parent->num_children) {
         parent->child_level = CPU_TOPO_UNKNOWN;
     }
@@ -180,6 +255,8 @@ static void cpu_topo_instance_init(Object *obj)
     CPUTopoState *topo = CPU_TOPO(obj);
     QTAILQ_INIT(&topo->children);
 
+    topo->index = UNASSIGNED_TOPO_INDEX;
+    topo->free_child_index = 0;
     topo->child_level = CPU_TOPO_UNKNOWN;
 }
 
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index ebcbdd854da5..c0dfff9dc63b 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -24,6 +24,8 @@
 #include "hw/qdev-core.h"
 #include "qemu/queue.h"
 
+#define UNASSIGNED_TOPO_INDEX -1
+
 typedef enum CPUTopoLevel {
     CPU_TOPO_UNKNOWN,
     CPU_TOPO_THREAD,
@@ -53,6 +55,8 @@ struct CPUTopoClass {
 
 /**
  * CPUTopoState:
+ * @index: Topology index within parent's topology queue.
+ * @free_child_index: Cached free index to be specified for next child.
  * @num_children: Number of topology children under this topology device.
  * @max_children: Maximum number of children allowed to be inserted under
  *     this topology device.
@@ -66,6 +70,8 @@ struct CPUTopoState {
     DeviceState parent_obj;
 
     /*< public >*/
+    int index;
+    int free_child_index;
     int num_children;
     int max_children;
     CPUTopoLevel child_level;
-- 
2.34.1


