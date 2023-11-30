Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DEFC10DAA
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:34:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i5s-00031G-04; Thu, 30 Nov 2023 09:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i5q-0002t0-2c; Thu, 30 Nov 2023 09:32:42 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i5o-0001BS-4M; Thu, 30 Nov 2023 09:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354760; x=1732890760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=giqm05kbC3tYOPrffoLra7vHI+bWgR59/qNt+YCSQ+8=;
 b=g02N2G6gMNbxuYTy/MpXvk/tCF1JtxcYvoqJjbqmKbsgNmt688e6H3nX
 2fG5uXcRFQU9Rz50eLiXvJMFq98b1y0AcSRLfWyodbOACXXzWGir5EpX+
 R9RqjNTy1TvtBxghMfQgkPqV3y9L3uX3PA1kITasQ3oc00KOsWhDUx/0q
 ug0cRclDm/C2DCWz6SEJTpGaenvklSoexfiB9zRUbiAo4tht7sLBlo94z
 BuiYla+2W+nzDhapsAYeW+OZc8fH5iaJab2RV42tBwOXjmOmCk1aFdzv7
 GKoxFfYWknklgboGXWdDa+IziI2o18qG4mfwFYhcToQW+C/1a5sSgcpA+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531659"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479531659"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729853"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942729853"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:32:17 -0800
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
Subject: [RFC 12/41] hw/core/topo: Add helpers to traverse the CPU topology
 tree
Date: Thu, 30 Nov 2023 22:41:34 +0800
Message-Id: <20231130144203.2307629-13-zhao1.liu@linux.intel.com>
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

The topology devices will be organized as a topology tree. Each topology
device may have many topology children with lower topology level.

Add the helpers to traverse the CPU topology tree.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/cpu-topo.c         | 41 ++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu-topo.h | 13 ++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/hw/core/cpu-topo.c b/hw/core/cpu-topo.c
index cba2dc747e74..687a4cc566ec 100644
--- a/hw/core/cpu-topo.c
+++ b/hw/core/cpu-topo.c
@@ -318,3 +318,44 @@ static void cpu_topo_register_types(void)
 }
 
 type_init(cpu_topo_register_types)
+
+static int do_cpu_topo_child_foreach(CPUTopoState *topo,
+                                     unsigned long *levels,
+                                     topo_fn fn, void *opaque,
+                                     bool recurse)
+{
+    CPUTopoState *child;
+    int ret = TOPO_FOREACH_CONTINUE;
+
+    QTAILQ_FOREACH(child, &topo->children, sibling) {
+        if (!levels || (levels && test_bit(CPU_TOPO_LEVEL(child), levels))) {
+            ret = fn(child, opaque);
+            if (ret == TOPO_FOREACH_END || ret == TOPO_FOREACH_ERR) {
+                break;
+            } else if (ret == TOPO_FOREACH_SIBLING) {
+                continue;
+            }
+        }
+
+        if (recurse) {
+            ret = do_cpu_topo_child_foreach(child, levels, fn, opaque, recurse);
+            if (ret != TOPO_FOREACH_CONTINUE) {
+                break;
+            }
+        }
+    }
+    return ret;
+}
+
+int cpu_topo_child_foreach(CPUTopoState *topo, unsigned long *levels,
+                           topo_fn fn, void *opaque)
+{
+    return do_cpu_topo_child_foreach(topo, levels, fn, opaque, false);
+}
+
+int cpu_topo_child_foreach_recursive(CPUTopoState *topo,
+                                     unsigned long *levels,
+                                     topo_fn fn, void *opaque)
+{
+    return do_cpu_topo_child_foreach(topo, levels, fn, opaque, true);
+}
diff --git a/include/hw/core/cpu-topo.h b/include/hw/core/cpu-topo.h
index 1ffdb0be6d38..453bacbb558b 100644
--- a/include/hw/core/cpu-topo.h
+++ b/include/hw/core/cpu-topo.h
@@ -90,4 +90,17 @@ struct CPUTopoState {
 
 #define CPU_TOPO_LEVEL(topo)    (CPU_TOPO_GET_CLASS(topo)->level)
 
+#define TOPO_FOREACH_SIBLING         2
+#define TOPO_FOREACH_END             1
+#define TOPO_FOREACH_CONTINUE        0
+#define TOPO_FOREACH_ERR             -1
+
+typedef int (*topo_fn)(CPUTopoState *topo, void *opaque);
+
+int cpu_topo_child_foreach(CPUTopoState *topo, unsigned long *levels,
+                           topo_fn fn, void *opaque);
+int cpu_topo_child_foreach_recursive(CPUTopoState *topo,
+                                     unsigned long *levels,
+                                     topo_fn fn, void *opaque);
+
 #endif /* CPU_TOPO_H */
-- 
2.34.1


