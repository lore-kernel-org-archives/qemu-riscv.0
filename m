Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC651C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:32:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i58-0001eg-JG; Thu, 30 Nov 2023 09:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i54-0001d3-5x; Thu, 30 Nov 2023 09:31:54 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i52-000157-KU; Thu, 30 Nov 2023 09:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354712; x=1732890712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FvkKzJCE6FUWENQ9f97m08P62P/QoMoZpAQ1rnP03oI=;
 b=HtfMqBHHZUN7GgJRWat9fIWsFbhJkMP4kLDyPJrkFVSgc68P71B6J9KH
 h4MDq+Da2PJF8O8mzW2oB7HcQtW9oQaBJzWha7RJrHOxgHxUajKXquZ5+
 k5SFchDNnnduvUwiL7l5Leg5heYe7kOS2aCbeACzpETnW/WU5jZiyR5CO
 ZByDc/4VqhgrTLErOHeCmuc1L954soYl7YZJ6bEQwOYnmhUVkeQ9dfZDQ
 Aj50DQIlBTJ64MBaIY+469zRzDq97JDKlDhbz187rR/cAOp7cM35d1N7y
 5VF7AFFvaQfOsz6AT5X7J1LB9tt5XSvqXlKoIjfUcn9HOGsNw3es/4S0l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531156"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479531156"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729654"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942729654"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:10 -0800
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
Subject: [RFC 05/41] qdev: Set device parent and id after setting properties
Date: Thu, 30 Nov 2023 22:41:27 +0800
Message-Id: <20231130144203.2307629-6-zhao1.liu@linux.intel.com>
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

The properties setting does not conflict with the creation of child<>
property.

Pre-setting the device's properties can help the device's parent
selection. Some topology devices (e.g., CPUs that support hotplug)
usually define topology sub indexes as properties, and the selection of
their parent needs to be based on these proteries.

Move qdev_set_id() after properties setting to help the next user-child
introduction.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 system/qdev-monitor.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 7ee33a50142a..107411bb50cc 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -700,14 +700,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
         }
     }
 
-    /*
-     * set dev's parent and register its id.
-     * If it fails it means the id is already taken.
-     */
     id = g_strdup(qdict_get_try_str(opts, "id"));
-    if (!qdev_set_id(dev, id, errp)) {
-        goto err_del_dev;
-    }
 
     /* set properties */
     dev->opts = qdict_clone_shallow(opts);
@@ -721,6 +714,14 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
         goto err_del_dev;
     }
 
+    /*
+     * set dev's parent and register its id.
+     * If it fails it means the id is already taken.
+     */
+    if (!qdev_set_id(dev, id, errp)) {
+        goto err_del_dev;
+    }
+
     if (!qdev_realize(dev, bus, errp)) {
         goto err_del_dev;
     }
-- 
2.34.1


