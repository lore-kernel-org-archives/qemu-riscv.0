Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304CFC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:35:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i6L-0004Bq-Kt; Thu, 30 Nov 2023 09:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i6J-00043R-Ar; Thu, 30 Nov 2023 09:33:11 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i6H-0001I2-HS; Thu, 30 Nov 2023 09:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354789; x=1732890789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/4XB1+0XSfZXJW6ggYvVG8+UQ24RT1LIudOfD5YSaJw=;
 b=HasYQyEUkyVg21haLFRHGDdWbARruYDFjMYrLUFCSDFA7i3axlx1zrdK
 fu3NPHtZCxTw3A5pJhlnvwjnGuzUMT2IdFV9kHEIWh+4RLOgmKpyxz+fV
 HUgT1/mGJ+MJLDM7Yso4qoj+MM9pgumfhXFdSzWkRGgKdLBGM3yb/7WA7
 oM9DtHv+mt7dkM+lfQR1r5vcVeKEeZ4HtaEi/imu6Jp++uqNu4MPq4gxy
 RERmOGl/6JZCsCOg8h2ZqCXB7GP/sANyyIEGgHCrlThnXXmI2Jax3rhMa
 EFkvZfN5xrlNpmx4gfc2xTtjWaGooJ9RyU4Kks03V+K30LCwoJigisB/Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531860"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479531860"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:33:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729971"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942729971"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:32:54 -0800
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
Subject: [RFC 16/41] PPC/ppc-core: Limit plugged-threads and nr-threads to be
 equal
Date: Thu, 30 Nov 2023 22:41:38 +0800
Message-Id: <20231130144203.2307629-17-zhao1.liu@linux.intel.com>
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

PPC supports CPU hotplug at core granularity, thus ppc-core only accepts
all CPUs in a core are plugged.

Check if plugged_threads and nr_threads are equal when ppc-core
realizes.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/ppc/ppc_core.c         | 18 ++++++++++++++++++
 include/hw/ppc/ppc_core.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/hw/ppc/ppc_core.c b/hw/ppc/ppc_core.c
index 4433b54af506..3857f3150052 100644
--- a/hw/ppc/ppc_core.c
+++ b/hw/ppc/ppc_core.c
@@ -53,20 +53,38 @@ static void powerpc_core_prop_set_core_id(Object *obj, Visitor *v,
     core->core_id = value;
 }
 
+static void powerpc_core_realize(DeviceState *dev, Error **errp)
+{
+    CPUCore *core = CPU_CORE(dev);
+    PowerPCCoreClass *ppc_class = POWERPC_CORE_GET_CLASS(dev);
+
+    if (core->plugged_threads != -1 &&
+        core->nr_threads != core->plugged_threads) {
+        error_setg(errp, "nr_threads and plugged-threads must be equal");
+        return;
+    }
+
+    ppc_class->parent_realize(dev, errp);
+}
+
 static void powerpc_core_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCoreClass *ppc_class = POWERPC_CORE_CLASS(oc);
 
     object_class_property_add(oc, "core-id", "int",
                               powerpc_core_prop_get_core_id,
                               powerpc_core_prop_set_core_id,
                               NULL, NULL);
+    device_class_set_parent_realize(dc, powerpc_core_realize,
+                                    &ppc_class->parent_realize);
 }
 
 static const TypeInfo powerpc_core_type_info = {
     .name = TYPE_POWERPC_CORE,
     .parent = TYPE_CPU_CORE,
     .abstract = true,
+    .class_size = sizeof(PowerPCCoreClass),
     .class_init = powerpc_core_class_init,
     .instance_size = sizeof(PowerPCCore),
 };
diff --git a/include/hw/ppc/ppc_core.h b/include/hw/ppc/ppc_core.h
index bcc83e426e3f..1207d220872a 100644
--- a/include/hw/ppc/ppc_core.h
+++ b/include/hw/ppc/ppc_core.h
@@ -34,6 +34,7 @@ struct PowerPCCoreClass {
     CPUCoreClass parent_class;
 
     /*< public >*/
+    DeviceRealize parent_realize;
 };
 
 struct PowerPCCore {
-- 
2.34.1


