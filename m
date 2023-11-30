Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C7FC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:33:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8i5P-0001kr-If; Thu, 30 Nov 2023 09:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i5O-0001k8-6X; Thu, 30 Nov 2023 09:32:14 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8i5L-00018C-4R; Thu, 30 Nov 2023 09:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354731; x=1732890731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vOtFxW4vj/U4kztv92p8xu/6iieeFFSa0l7Rf+yqZFI=;
 b=AhfhMEJUM+u9rmyvO32IPdp0wSYzhNAwN2WXM/wZ/RWr4kBSQd2eg/Wj
 BpZcqG6oGj4ExHNZDBK3IMUAmCSUVPz9U0DM7b8ajKczh9D7XlFdoXGBx
 QLAEmlzaUzldZY8fzqgw6+qX+GDNHKuEol+Fgs8L9mMM9fGyw0GQA8sUN
 UhFvCyOR+2y6PtX1WL8SoNPRkDaVHKD4LmhScBNWY6454m7tvaZsIvSaD
 vDU0xK+m0lCGqNqcN2NkIyVPNWdP3fWRvA53P/lmGxCBSMvq2R4Cl/MMm
 D2DYn+92Xx7CoNDmDe4rcCXKiD2A8jBLzQGMhpOQFudyShdR/T2GqRcf1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479531333"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479531333"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:31:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942729711"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942729711"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:31:29 -0800
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
Subject: [RFC 07/41] qdev: Introduce parent option in -device
Date: Thu, 30 Nov 2023 22:41:29 +0800
Message-Id: <20231130144203.2307629-8-zhao1.liu@linux.intel.com>
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

Currently, the devices added by "-device" are linked via bus, and are
set the parent as peripheral-anon or peripheral containers of the
machine.

But this is not enough for building CPU topology hierarchies as:
1. The relationship between different CPU hierarchies is child<>
   property other than link<> property, and they shouldn't be linked
   using the special bus.
2. The canonical path of device is built from the child<> property, and
   the well defined CPU topology hierarchies ask their canonical path to
   reflect the correct topological relationship.

With these, the child<> property support is needed for QDev interface to
allow user to configure proper parent in "-device".

Introduce the "parent" option in "-device" to create the child<>
property. This option asks for the device id of the parent device.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/xen/xen-legacy-backend.c |  2 +-
 include/monitor/qdev.h      |  3 ++-
 system/qdev-monitor.c       | 50 ++++++++++++++++++++++++++-----------
 3 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 124dd5f3d687..70ad11c6287e 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -184,7 +184,7 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
     object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
     OBJECT(xendev)->free = g_free;
     qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev),
-                &error_fatal);
+                NULL, &error_fatal);
     qdev_realize(DEVICE(xendev), xen_sysbus, &error_fatal);
     object_unref(OBJECT(xendev));
 
diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index f5fd6e6c1ffc..3d9d06158e5f 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -16,6 +16,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
  * qdev_set_id: parent the device and set its id if provided.
  * @dev: device to handle
  * @id: id to be given to the device, or NULL.
+ * @parent: parent to be set for the device, or NULL.
  *
  * Returns: the id of the device in case of success; otherwise NULL.
  *
@@ -34,6 +35,6 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
  * returned string is owned by the corresponding child property and must
  * not be freed by the caller.
  */
-const char *qdev_set_id(DeviceState *dev, char *id, Error **errp);
+const char *qdev_set_id(DeviceState *dev, char *id, char *parent, Error **errp);
 
 #endif
diff --git a/system/qdev-monitor.c b/system/qdev-monitor.c
index 0261937b8462..8f56113eef65 100644
--- a/system/qdev-monitor.c
+++ b/system/qdev-monitor.c
@@ -587,22 +587,33 @@ static BusState *qbus_find(const char *path, Error **errp)
 }
 
 static Object *qdev_find_peripheral_parent(DeviceState *dev,
+                                           char *parent_id,
                                            Error **errp)
 {
     Object *parent_obj, *obj = OBJECT(dev);
 
-    parent_obj = uc_provide_default_parent(obj, errp);
-    if (*errp) {
-        return NULL;
-    }
+    if (parent_id) {
+        parent_obj = object_resolve_path_from(qdev_get_peripheral(),
+                                              parent_id, NULL);
+        if (parent_obj) {
+            if (uc_check_user_parent(obj, parent_obj)) {
+                return parent_obj;
+            }
+        }
+    } else {
+        parent_obj = uc_provide_default_parent(obj, errp);
+        if (*errp) {
+            return NULL;
+        }
 
-    if (parent_obj) {
-        /*
-         * Non-anonymous parents (under "/peripheral") are allowed to
-         * be accessed to create child<> properties.
-         */
-        if (object_is_child_from(parent_obj, qdev_get_peripheral())) {
-            return parent_obj;
+        if (parent_obj) {
+            /*
+             * Non-anonymous parents (under "/peripheral") are allowed to
+             * be accessed to create child<> properties.
+             */
+            if (object_is_child_from(parent_obj, qdev_get_peripheral())) {
+                return parent_obj;
+            }
         }
     }
 
@@ -628,7 +639,8 @@ static bool qdev_pre_check_device_id(char *id, Error **errp)
 }
 
 /* Takes ownership of @id, will be freed when deleting the device */
-const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
+const char *qdev_set_id(DeviceState *dev, char *id,
+                        char *parent, Error **errp)
 {
     Object *parent_obj = NULL;
     ObjectProperty *prop;
@@ -639,7 +651,7 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
     uc = (UserChild *)object_dynamic_cast(OBJECT(dev), TYPE_USER_CHILD);
 
     if (uc) {
-        parent_obj = qdev_find_peripheral_parent(dev, errp);
+        parent_obj = qdev_find_peripheral_parent(dev, parent, errp);
         if (*errp) {
             goto err;
         }
@@ -655,6 +667,11 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
                 goto err;
             }
         }
+        g_free(parent);
+    } else if (parent) {
+        error_setg(errp, "Only the device implemented user-child "
+                   "interface supports `parent` option.");
+        goto err;
     }
 
     /*
@@ -684,6 +701,7 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
 
     return prop->name;
 err:
+    g_free(parent);
     g_free(id);
     return NULL;
 }
@@ -694,7 +712,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
     ERRP_GUARD();
     DeviceClass *dc;
     const char *driver, *path;
-    char *id;
+    char *id, *parent;
     DeviceState *dev = NULL;
     BusState *bus = NULL;
 
@@ -772,12 +790,14 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
     }
 
     id = g_strdup(qdict_get_try_str(opts, "id"));
+    parent = g_strdup(qdict_get_try_str(opts, "parent"));
 
     /* set properties */
     dev->opts = qdict_clone_shallow(opts);
     qdict_del(dev->opts, "driver");
     qdict_del(dev->opts, "bus");
     qdict_del(dev->opts, "id");
+    qdict_del(dev->opts, "parent");
 
     object_set_properties_from_keyval(&dev->parent_obj, dev->opts, from_json,
                                       errp);
@@ -789,7 +809,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts, long *category,
      * set dev's parent and register its id.
      * If it fails it means the id is already taken.
      */
-    if (!qdev_set_id(dev, id, errp)) {
+    if (!qdev_set_id(dev, id, parent, errp)) {
         goto err_del_dev;
     }
 
-- 
2.34.1


