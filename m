Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7E2C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:34:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i6J-00043t-Fx; Thu, 30 Nov 2023 09:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i6H-0003yV-Fk; Thu, 30 Nov 2023 09:33:09 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i6E-0001EW-Bs; Thu, 30 Nov 2023 09:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354786; x=1732890786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HQNocPVaV+DgJS+Ld4DvaS6hVw4IdYUlBhgQdcIl19Q=;
 b=h5Rfb6iQTuIroyQoXUynoGRMPvKTIQtOHQPuV1lnHfqnNQ86qvbjMtXw
 ldhiGhtkxtHxBk7RT0WFAIAsF95V8DXvVIpVsYCTaLuaWwW4JG5aSEwXX
 iCtoChT9EzqHXG8masEvnyeck122QSu+kHINuL1ZgupxUjT9qXhDyKKvR
 y0SeXvLY+BKDTgB4RNgGTWvltWd4ndAb1PV+m7C9owwg6Fx/UD/r0/CS4
 Sl8MGNY+WOxBjAfV8udMcjd6RF003bZ5BN3meSQmWpxVn8cJtdvz9AQ6m
 F7jiMbwhadhBiC/yScfE3xBsp85SJKBeL8y7PzaUn67SjEwa+PgAyTXQy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531806"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479531806"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729932"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942729932"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:32:45 -0800
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
Subject: [RFC 15/41] hw/cpu/core: Allow to configure plugged threads for
 cpu-core
Date: Thu, 30 Nov 2023 22:41:37 +0800
Message-Id: <20231130144203.2307629-16-zhao1.liu@linux.intel.com>
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

When the core abstraction is applied for the architecture support CPU
hotplug, the plugged CPUs and unplugged CPUs are distributed among the
cores created in the topology tree.

Add plugged_threads field to help cpu-core decide to how many CPUs to
create.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/core.c                   | 33 +++++++++++++++++++++++++++++++++
 hw/ppc/pnv_core.c               |  6 +++++-
 hw/ppc/spapr_cpu_core.c         |  6 +++++-
 include/hw/cpu/core.h           |  9 +++++++++
 include/hw/ppc/pnv_core.h       |  2 ++
 include/hw/ppc/spapr_cpu_core.h |  2 ++
 6 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/hw/cpu/core.c b/hw/cpu/core.c
index 7e274d6aebb7..15546b5b2339 100644
--- a/hw/cpu/core.c
+++ b/hw/cpu/core.c
@@ -36,6 +36,20 @@ static void core_prop_set_nr_threads(Object *obj, Visitor *v, const char *name,
     core->nr_threads = value;
 }
 
+static void core_prop_set_plugged_threads(Object *obj, Visitor *v,
+                                          const char *name, void *opaque,
+                                          Error **errp)
+{
+    CPUCore *core = CPU_CORE(obj);
+    int64_t value;
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    core->plugged_threads = value;
+}
+
 static void cpu_core_instance_init(Object *obj)
 {
     CPUCore *core = CPU_CORE(obj);
@@ -48,6 +62,22 @@ static void cpu_core_instance_init(Object *obj)
     if (current_machine) {
         core->nr_threads = current_machine->smp.threads;
     }
+
+    core->plugged_threads = -1;
+}
+
+static void cpu_core_realize(DeviceState *dev, Error **errp)
+{
+    CPUCore *core = CPU_CORE(dev);
+
+    if (core->plugged_threads > core->nr_threads) {
+        error_setg(errp, "Plugged threads (plugged-threads: %d) must "
+                   "not be more than max threads (nr-threads: %d)",
+                   core->plugged_threads, core->nr_threads);
+        return;
+    } else if (core->plugged_threads == -1) {
+        core->plugged_threads = core->nr_threads;
+    }
 }
 
 static void cpu_core_class_init(ObjectClass *oc, void *data)
@@ -57,6 +87,9 @@ static void cpu_core_class_init(ObjectClass *oc, void *data)
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     object_class_property_add(oc, "nr-threads", "int", core_prop_get_nr_threads,
                               core_prop_set_nr_threads, NULL, NULL);
+    object_class_property_add(oc, "plugged-threads", "int", NULL,
+                              core_prop_set_plugged_threads, NULL, NULL);
+    dc->realize = cpu_core_realize;
 }
 
 static const TypeInfo cpu_core_type_info = {
diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index a90d1ec92bd8..8b75739697d1 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -276,6 +276,8 @@ static void pnv_core_realize(DeviceState *dev, Error **errp)
 
     assert(pc->chip);
 
+    pcc->parent_realize(dev, errp);
+
     pc->threads = g_new(PowerPCCPU *, cc->nr_threads);
     for (i = 0; i < cc->nr_threads; i++) {
         PowerPCCPU *cpu;
@@ -376,11 +378,13 @@ static void pnv_core_power10_class_init(ObjectClass *oc, void *data)
 static void pnv_core_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    PnvCoreClass *pcc = PNV_CORE_CLASS(oc);
 
-    dc->realize = pnv_core_realize;
     dc->unrealize = pnv_core_unrealize;
     device_class_set_props(dc, pnv_core_properties);
     dc->user_creatable = false;
+    device_class_set_parent_realize(dc, pnv_core_realize,
+                                    &pcc->parent_realize);
 }
 
 #define DEFINE_PNV_CORE_TYPE(family, cpu_model) \
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 7c2ea1424747..5533a386f350 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -331,6 +331,7 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
         (SpaprMachineState *) object_dynamic_cast(qdev_get_machine(),
                                                   TYPE_SPAPR_MACHINE);
     SpaprCpuCore *sc = SPAPR_CPU_CORE(OBJECT(dev));
+    SpaprCpuCoreClass *scc = SPAPR_CPU_CORE_GET_CLASS(sc);
     CPUCore *cc = CPU_CORE(OBJECT(dev));
     int i;
 
@@ -339,6 +340,8 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    scc->parent_realize(dev, errp);
+
     qemu_register_reset(spapr_cpu_core_reset_handler, sc);
     sc->threads = g_new0(PowerPCCPU *, cc->nr_threads);
     for (i = 0; i < cc->nr_threads; i++) {
@@ -363,11 +366,12 @@ static void spapr_cpu_core_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     SpaprCpuCoreClass *scc = SPAPR_CPU_CORE_CLASS(oc);
 
-    dc->realize = spapr_cpu_core_realize;
     dc->unrealize = spapr_cpu_core_unrealize;
     dc->reset = spapr_cpu_core_reset;
     device_class_set_props(dc, spapr_cpu_core_properties);
     scc->cpu_type = data;
+    device_class_set_parent_realize(dc, spapr_cpu_core_realize,
+                                    &scc->parent_realize);
 }
 
 #define DEFINE_SPAPR_CPU_CORE_TYPE(cpu_model) \
diff --git a/include/hw/cpu/core.h b/include/hw/cpu/core.h
index 17f117bd5225..87d50151ab01 100644
--- a/include/hw/cpu/core.h
+++ b/include/hw/cpu/core.h
@@ -21,7 +21,16 @@ struct CPUCore {
     DeviceState parent_obj;
 
     /*< public >*/
+    int core_id;
+
+    /* Maximum number of threads contained in this core. */
     int nr_threads;
+
+    /*
+     * How many threads should be plugged in this core via
+     * "-device"/"device_add"?
+     */
+    int plugged_threads;
 };
 
 #endif
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index 56c3f6b51f2f..3b9edf69f9fb 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -49,6 +49,8 @@ struct PnvCoreClass {
     /*< public >*/
     const MemoryRegionOps *xscom_ops;
     uint64_t xscom_size;
+
+    DeviceRealize parent_realize;
 };
 
 #define PNV_CORE_TYPE_SUFFIX "-" TYPE_PNV_CORE
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index db3e515051ca..dabdbd4bcbc9 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -37,6 +37,8 @@ struct SpaprCpuCoreClass {
 
     /*< public >*/
     const char *cpu_type;
+
+    DeviceRealize parent_realize;
 };
 
 const char *spapr_get_cpu_core_type(const char *cpu_type);
-- 
2.34.1


