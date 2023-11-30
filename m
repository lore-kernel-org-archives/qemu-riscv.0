Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D749AC10DAA
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:39:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i9C-0001oy-Et; Thu, 30 Nov 2023 09:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i8d-0001Mn-MP; Thu, 30 Nov 2023 09:35:37 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i8Z-0001tW-Iw; Thu, 30 Nov 2023 09:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354931; x=1732890931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f8dzVIiaV15FUJhTAcShJBTihquI/MGo+GvFSgqbGOs=;
 b=CGADjJyleEKvWjqLrSJqVu4kQIgphAR6wQBD/Ifbpfz6FaifT2b2RMtv
 6RRLZSPtCxGEWieNH3cKDepxb7AIX+Tjv5VkxMn6wovUb+Ac6gfYpCLgr
 b/d+zRibQg31wk6uOJ685WQbiyMv/Loxx9gskj5FQamRVp3rY5c8oH8Ae
 +sqzovCYUgjtyVrDM2f9b2rdaMhNnkEXHj5TvkYetiiuIj6bsP0stUYIa
 xBuasb+QK9N60wOvYZjpcT7wJTUwoYXIyv7/Bf9OWH0cWJ/YwIjXj2LS4
 5o85lIY5LDZT/Xe7gf0b3aOZKf8R4meZ4v+lhIkDDZV8RdFVoBvGr4a2C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532412"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479532412"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730271"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942730271"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:15 -0800
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
Subject: [RFC 31/41] hw/machine: Plug cpu-slot into machine to maintain
 topology tree
Date: Thu, 30 Nov 2023 22:41:53 +0800
Message-Id: <20231130144203.2307629-32-zhao1.liu@linux.intel.com>
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

Add a cpu-slot in machine as the root of topology tree to maintain the
QOM topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-slot.c         | 31 +++++++++++++++++++++++++++++++
 include/hw/boards.h        |  2 ++
 include/hw/core/cpu-slot.h |  7 +++++++
 system/vl.c                |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/hw/core/cpu-slot.c b/hw/core/cpu-slot.c
index 2a796ad5b6e7..4b148440ed3d 100644
--- a/hw/core/cpu-slot.c
+++ b/hw/core/cpu-slot.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 
+#include "hw/boards.h"
 #include "hw/core/cpu-slot.h"
 #include "qapi/error.h"
 
@@ -165,3 +166,33 @@ static void cpu_slot_register_types(void)
 }
 
 type_init(cpu_slot_register_types)
+
+void machine_plug_cpu_slot(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    ms->topo = CPU_SLOT(qdev_new(TYPE_CPU_SLOT));
+
+    object_property_add_child(container_get(OBJECT(ms), "/peripheral"),
+                              "cpu-slot", OBJECT(ms->topo));
+    DEVICE(ms->topo)->id = g_strdup_printf("%s", "cpu-slot");
+
+    qdev_realize_and_unref(DEVICE(ms->topo), NULL, &error_abort);
+    ms->topo->ms = ms;
+
+    if (!mc->smp_props.clusters_supported) {
+        clear_bit(CPU_TOPO_CLUSTER, ms->topo->supported_levels);
+    }
+
+    if (!mc->smp_props.dies_supported) {
+        clear_bit(CPU_TOPO_DIE, ms->topo->supported_levels);
+    }
+
+    if (!mc->smp_props.books_supported) {
+        clear_bit(CPU_TOPO_BOOK, ms->topo->supported_levels);
+    }
+
+    if (!mc->smp_props.drawers_supported) {
+        clear_bit(CPU_TOPO_DRAWER, ms->topo->supported_levels);
+    }
+}
diff --git a/include/hw/boards.h b/include/hw/boards.h
index da85f86efb91..81a7b04ece86 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -10,6 +10,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "hw/core/cpu.h"
+#include "hw/core/cpu-slot.h"
 
 #define TYPE_MACHINE_SUFFIX "-machine"
 
@@ -398,6 +399,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
+    CPUSlot *topo;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
diff --git a/include/hw/core/cpu-slot.h b/include/hw/core/cpu-slot.h
index 7bf51988afb3..1361af4ccfc0 100644
--- a/include/hw/core/cpu-slot.h
+++ b/include/hw/core/cpu-slot.h
@@ -78,6 +78,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
  *     when necessary.
  * @stat: Statistical topology information for topology tree.
  * @supported_levels: Supported topology levels for topology tree.
+ * @ms: Machine in which this cpu-slot is plugged.
  */
 struct CPUSlot {
     /*< private >*/
@@ -87,6 +88,12 @@ struct CPUSlot {
     QTAILQ_HEAD(, CPUCore) cores;
     CPUTopoStat stat;
     DECLARE_BITMAP(supported_levels, USER_AVAIL_LEVEL_NUM);
+    MachineState *ms;
 };
 
+#define MACHINE_CORE_FOREACH(ms, core) \
+    QTAILQ_FOREACH((core), &(ms)->topo->cores, node)
+
+void machine_plug_cpu_slot(MachineState *ms);
+
 #endif /* CPU_SLOT_H */
diff --git a/system/vl.c b/system/vl.c
index 65add2fb2460..637f708d2265 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2128,6 +2128,8 @@ static void qemu_create_machine(QDict *qdict)
                                           false, &error_abort);
         qobject_unref(default_opts);
     }
+
+    machine_plug_cpu_slot(current_machine);
 }
 
 static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
-- 
2.34.1


