Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C085C10DAA
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:37:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i7P-0006r3-Vg; Thu, 30 Nov 2023 09:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i7G-00068Z-6I; Thu, 30 Nov 2023 09:34:10 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i7A-0001Un-Ub; Thu, 30 Nov 2023 09:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354844; x=1732890844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ojKaeiijveA4rQSsZpp2eyLul8UTXwtywNBoYac3pw0=;
 b=KffefMi63af5nmZYTDhlpSDBuIGsay1Zvuzoft0mO3rkUpO+P2Ys70Cr
 kyXYZ6+zISYNsrdxGsGuHIginbLoa8u/9/mbbckVZ7Ccd/ZeO8uEBHmBI
 RBYchHff4EpAUQn3v8v70ypfXtNy3OVEst+BgPM2SguywgzTYEGsAolIi
 S1FJBRRXXPNdp+zVrI0mI+c41sC1RjHg/ll8a6/EnRvWDwEY/BgLFLxSG
 ng33F7gTc79udonbrZ/mNJKXA1c3+V+rKYB8iUZ5G3nyCcePC1QrdeN2v
 oEKlTd0Ak3MQ5USTLxvhy8m+qfM5Rnd6h9HUDnwP99gKvObk5Gy/oTrGl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532120"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479532120"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:34:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730060"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942730060"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:33:50 -0800
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
Subject: [RFC 22/41] hw/cpu/cluster: Convert cpu-cluster from general device
 to topology device
Date: Thu, 30 Nov 2023 22:41:44 +0800
Message-Id: <20231130144203.2307629-23-zhao1.liu@linux.intel.com>
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

Convert cpu-cluster to topology device then user could create cluster
level topology from cli and later the cpu-clusters could be added into
topology tree.

In addition, mark the cpu-cluster as DEVICE_CATEGORY_CPU_DEF category to
indicate it belongs to the basic CPU definition and should be created
from cli before board initialization.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/cluster.c         | 11 +++++++++--
 include/hw/cpu/cluster.h |  7 +++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 8a666c27d151..adf0ef23e8d4 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -86,15 +86,21 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
     if (cc->tcg_clu_ops->collect_cpus) {
         cc->tcg_clu_ops->collect_cpus(cluster, errp);
     }
+
+    cc->parent_realize(dev, errp);
 }
 
 static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    CPUTopoClass *tc = CPU_TOPO_CLASS(klass);
     CPUClusterClass *cc = CPU_CLUSTER_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_CPU_DEF, dc->categories);
     device_class_set_props(dc, cpu_cluster_properties);
-    dc->realize = cpu_cluster_realize;
+    device_class_set_parent_realize(dc, cpu_cluster_realize,
+                                    &cc->parent_realize);
+    tc->level = CPU_TOPO_CLUSTER;
 
 #ifdef CONFIG_TCG
     cc->tcg_clu_ops = &common_cluster_tcg_ops;
@@ -103,8 +109,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo cpu_cluster_type_info = {
     .name = TYPE_CPU_CLUSTER,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_CPU_TOPO,
     .instance_size = sizeof(CPUCluster),
+    .class_size = sizeof(CPUClusterClass),
     .class_init = cpu_cluster_class_init,
 };
 
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index b3185e2f2566..888993c36da4 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -20,6 +20,7 @@
 #ifndef HW_CPU_CLUSTER_H
 #define HW_CPU_CLUSTER_H
 
+#include "hw/core/cpu-topo.h"
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
@@ -84,11 +85,13 @@ struct TCGClusterOps {
 
 struct CPUClusterClass {
     /*< private >*/
-    DeviceClass parent_class;
+    CPUTopoClass parent_class;
 
     /*< public >*/
     /* when TCG is not available, this pointer is NULL */
     const struct TCGClusterOps *tcg_clu_ops;
+
+    DeviceRealize parent_realize;
 };
 
 /**
@@ -100,7 +103,7 @@ struct CPUClusterClass {
  */
 struct CPUCluster {
     /*< private >*/
-    DeviceState parent_obj;
+    CPUTopoState parent_obj;
 
     /*< public >*/
     uint32_t cluster_id;
-- 
2.34.1


