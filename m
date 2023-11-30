Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F402BC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:39:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i7M-0006Sy-MN; Thu, 30 Nov 2023 09:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i6x-0005zY-Vz; Thu, 30 Nov 2023 09:33:57 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i6v-0001RT-7l; Thu, 30 Nov 2023 09:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354829; x=1732890829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tVF0CmmcOBEuYyYp6LOjwJOc13qp/jolnKC9SQQ9zpo=;
 b=iuRtElay4mAE7FyVUEtPe003Cf8Glto2UManH4hBv2JTPkrSKS9YMaKI
 xfJt8lWvuI/QXcpxWhfuMHigIHrhxc9yWASysSlrpti/JKbWxgyZIWQVU
 WkI46x5IPzOQS+MFp1dBSz3l3ynOeviwhUSpeQvZfaTzdd3MHKU0uiEUV
 OnD3RDKHBAKA4KV6/YGGXO13Uh/dUVep4M4RPnutRu+aXJ4OkVP0xSrsy
 jrimARPbe0/HQhz+80YiDhNQ5hx0IW42NQhntKQJVD+d7ogUtFZdq1cGf
 RbTtA18p+Vu7CAzegA2o+40UM/bfD+UqT7I2x7exnnlmS/nOS4tTPXNGA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532010"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479532010"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:33:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730040"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942730040"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:33:32 -0800
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
Subject: [RFC 20/41] hw/cpu/cluster: Descript cluster is not only used for TCG
 in comment
Date: Thu, 30 Nov 2023 22:41:42 +0800
Message-Id: <20231130144203.2307629-21-zhao1.liu@linux.intel.com>
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

Update the comment to make the cpu-cluster description more general for
both TCG and accel cases.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/cluster.c         |  2 +-
 include/hw/cpu/cluster.h | 20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 340cfad9f8f1..27ab9e25a265 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -1,5 +1,5 @@
 /*
- * QEMU CPU cluster
+ * CPU cluster abstract device
  *
  * Copyright (c) 2018 GreenSocs SAS
  *
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index c038f05ddc9f..b3185e2f2566 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -1,5 +1,5 @@
 /*
- * QEMU CPU cluster
+ * CPU cluster abstract device
  *
  * Copyright (c) 2018 GreenSocs SAS
  *
@@ -24,17 +24,27 @@
 #include "qom/object.h"
 
 /*
- * CPU Cluster type
+ * # CPU Cluster
  *
- * A cluster is a group of CPUs which are all identical and have the same view
- * of the rest of the system. It is mainly an internal QEMU representation and
- * does not necessarily match with the notion of clusters on the real hardware.
+ * A cluster is a group of CPUs, that is, a level above the CPU (or Core).
+ *
+ * - For accel case, it's a CPU topology level concept above cores, in which
+ * the cores may share some resources (L2 cache or some others like L3
+ * cache tags, depending on the Archs). It is used to emulate the physical
+ * CPU cluster/module.
+ *
+ * - For TCG, cluster is used to organize CPUs directly without core. In one
+ * cluster, CPUs are all identical and have the same view of the rest of the
+ * system. It is mainly an internal QEMU representation and may not necessarily
+ * match with the notion of clusters on the real hardware.
  *
  * If CPUs are not identical (for example, Cortex-A53 and Cortex-A57 CPUs in an
  * Arm big.LITTLE system) they should be in different clusters. If the CPUs do
  * not have the same view of memory (for example the main CPU and a management
  * controller processor) they should be in different clusters.
  *
+ * # Use case for cluster in TCG
+ *
  * A cluster is created by creating an object of TYPE_CPU_CLUSTER, and then
  * adding the CPUs to it as QOM child objects (e.g. using the
  * object_initialize_child() or object_property_add_child() functions).
-- 
2.34.1


