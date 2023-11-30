Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EE8C10DAA
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:37:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i5m-0002ho-1S; Thu, 30 Nov 2023 09:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i5j-0002di-VH; Thu, 30 Nov 2023 09:32:35 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i5i-00018C-8E; Thu, 30 Nov 2023 09:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354754; x=1732890754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rfkBnAETWygr5TaDQC+NvTNqfHDXa5mpCuKsaH8rIdY=;
 b=Ag1XePDD2FePUzSKmuUDpE7NF4gT9yhn41TTfIMQ4aTp0bfemOeaE+B/
 9cvZUJiAZWbnvVhF3XG+topf0XVoZA98fk3uBeZk2Nzso4Li3BKpAEVJz
 RL6vEqgsFeuH+rza1o54AwS/r0gv0Fuia6rzbZAvZMsK2N60Qv3nyNk0b
 uwURKY9ChtNgvA7tYOWWiOU6dEX4BgMFNnPomTFcobqxyIjTpSJTiACX8
 L5jRn99Mg8TGH0KEfrKXuna7B7Tw5le/iNU6EJobWWhqlxLdzM/hvshPy
 b6Vu4serM+JI3fWRftm/YSblHc04uI613usQYkthJ359MhteMaVfUXO+H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531551"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479531551"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:32:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729798"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942729798"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:58 -0800
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
Subject: [RFC 10/41] hw/core/topo: Add virtual method to update topology info
 for parent
Date: Thu, 30 Nov 2023 22:41:32 +0800
Message-Id: <20231130144203.2307629-11-zhao1.liu@linux.intel.com>
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

When a new topology device is inserted into the topology tree,
its'parents (including non-direct parent) need to update topology
information.

Add the virtual method to help parents on topology tree update
topology information statistics.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-topo.c         | 20 ++++++++++++++++++++
 include/hw/core/cpu-topo.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index 3e0c183388d8..e244f0a3564e 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -154,6 +154,20 @@ static void cpu_topo_build_hierarchy(CPUTopoState *topo, Error **errp)
     cpu_topo_refresh_free_child_index(parent);
 }
 
+static void cpu_topo_update_info(CPUTopoState *topo, bool is_realize)
+{
+    CPUTopoState *parent = topo->parent;
+    CPUTopoClass *tc;
+
+    while (parent) {
+        tc = CPU_TOPO_GET_CLASS(parent);
+        if (tc->update_topo_info) {
+            tc->update_topo_info(parent, topo, is_realize);
+        }
+        parent = parent->parent;
+    }
+}
+
 static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
 {
     Object *obj = OBJECT(topo);
@@ -178,6 +192,11 @@ static void cpu_topo_set_parent(CPUTopoState *topo, Error **errp)
 
     if (topo->parent) {
         cpu_topo_build_hierarchy(topo, errp);
+        if (*errp) {
+            return;
+        }
+
+        cpu_topo_update_info(topo, true);
     }
 }
 
@@ -203,6 +222,7 @@ static void cpu_topo_destroy_hierarchy(CPUTopoState *topo)
         return;
     }
 
+    cpu_topo_update_info(topo, false);
     QTAILQ_REMOVE(&parent->children, topo, sibling);
     parent->num_children--;
 
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index c0dfff9dc63b..79cd8606feca 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -44,6 +44,8 @@ OBJECT_DECLARE_TYPE(CPUTopoState, CPUTopoClass, CPU_TOPO)
 /**
  * CPUTopoClass:
  * @level: Topology level for this CPUTopoClass.
+ * @update_topo_info: Method to update topology information statistics when
+ *     new child (including direct child and non-direct child) is added.
  */
 struct CPUTopoClass {
     /*< private >*/
@@ -51,6 +53,8 @@ struct CPUTopoClass {
 
     /*< public >*/
     CPUTopoLevel level;
+    void (*update_topo_info)(CPUTopoState *parent, CPUTopoState *child,
+                             bool is_realize);
 };
 
 /**
-- 
2.34.1


