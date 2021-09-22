Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4ug-00035N-TF
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4uY-0002bQ-9U; Wed, 22 Sep 2021 12:15:54 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4uV-0005JR-Ex; Wed, 22 Sep 2021 12:15:53 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 16B1021EBD;
 Wed, 22 Sep 2021 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKa7YpvCaHNP7B/Gx81xxfSEDEFxmlko5ypNT6F1RPs=;
 b=wtOmf1TGRi5+LsCZ7dTaWkdafLDUIQXjxY7cZKMSJPwbDnsncS8770qaxVmTeU8tVxHdsy
 98gXhs3KUKW1OrVqW4NQVrvc+Q9klOB56ADRcupW0/lzsumJ9QGaU1grDQEcXmiK54ZKOs
 5X4IsCXiqP+1fadiUoWHXRzy0Q+v+Wo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org,
 mark.burton@greensocs.com, mirela.grujic@greensocs.com, edgari@xilinx.com,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v2 04/16] softmmu/qdev-monitor: add error handling in
 qdev_set_id
Date: Wed, 22 Sep 2021 18:13:53 +0200
Message-Id: <20210922161405.140018-5-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Sep 2021 16:15:55 -0000

qdev_set_id() is mostly used when the user adds a device (using
-device cli option or device_add qmp command). This commit adds
an error parameter to handle the case where the given id is
already taken.

Also document the function and add a return value in order to
be able to capture success/failure: the function now returns the
id in case of success, or NULL in case of failure.

The commit modifies the 2 calling places (qdev-monitor and
xen-legacy-backend) to add the error object parameter.

Note that the id is, right now, guaranteed to be unique because
all ids came from the "device" QemuOptsList where the id is used
as key. This addition is a preparation for a future commit which
will relax the uniqueness.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/monitor/qdev.h      | 25 +++++++++++++++++++++++-
 hw/xen/xen-legacy-backend.c |  3 ++-
 softmmu/qdev-monitor.c      | 38 +++++++++++++++++++++++++++----------
 3 files changed, 54 insertions(+), 12 deletions(-)

diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index eaa947d73a..23c31f5296 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -9,6 +9,29 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
 
 int qdev_device_help(QemuOpts *opts);
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
-void qdev_set_id(DeviceState *dev, const char *id);
+
+/**
+ * qdev_set_id: parent the device and set its id if provided.
+ * @dev: device to handle
+ * @id: id to be given to the device, or NULL.
+ *
+ * Returns: the id of the device in case of success; otherwise NULL.
+ *
+ * @dev must be unrealized, unparented and must not have an id.
+ *
+ * If @id is non-NULL, this function tries to setup @dev qom path as
+ * "/peripheral/id". If @id is already taken, it fails. If it succeeds,
+ * the id field of @dev is set to @id (@dev now owns the given @id
+ * parameter).
+ *
+ * If @id is NULL, this function generates a unique name and setups @dev
+ * qom path as "/peripheral-anon/name". This name is not set as the id
+ * of @dev.
+ *
+ * Upon success, it returns the id/name (generated or provided). The
+ * returned string is owned by the corresponding child property and must
+ * not be freed by the caller.
+ */
+const char *qdev_set_id(DeviceState *dev, const char *id, Error **errp);
 
 #endif
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index dd8ae1452d..f541cfa0e9 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -276,7 +276,8 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
     xendev = g_malloc0(ops->size);
     object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
     OBJECT(xendev)->free = g_free;
-    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev));
+    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev),
+                &error_fatal);
     qdev_realize(DEVICE(xendev), xen_sysbus, &error_fatal);
     object_unref(OBJECT(xendev));
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 25275984bd..0007698ff3 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -578,22 +578,34 @@ static BusState *qbus_find(const char *path, Error **errp)
     return bus;
 }
 
-void qdev_set_id(DeviceState *dev, const char *id)
+const char *qdev_set_id(DeviceState *dev, const char *id, Error **errp)
 {
+    ObjectProperty *prop;
+
+    assert(!dev->id && !dev->realized);
+
+    /*
+     * object_property_[try_]add_child() below will assert the device
+     * has no parent
+     */
     if (id) {
-        dev->id = id;
-    }
-
-    if (dev->id) {
-        object_property_add_child(qdev_get_peripheral(), dev->id,
-                                  OBJECT(dev));
+        prop = object_property_try_add_child(qdev_get_peripheral(), id,
+                                             OBJECT(dev), NULL);
+        if (prop) {
+            dev->id = id;
+        } else {
+            error_setg(errp, "Duplicate device ID '%s'", id);
+            return NULL;
+        }
     } else {
         static int anon_count;
         gchar *name = g_strdup_printf("device[%d]", anon_count++);
-        object_property_add_child(qdev_get_peripheral_anon(), name,
-                                  OBJECT(dev));
+        prop = object_property_add_child(qdev_get_peripheral_anon(), name,
+                                         OBJECT(dev));
         g_free(name);
     }
+
+    return prop->name;
 }
 
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
@@ -677,7 +689,13 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    qdev_set_id(dev, qemu_opts_id(opts));
+    /*
+     * set dev's parent and register its id.
+     * If it fails it means the id is already taken.
+     */
+    if (!qdev_set_id(dev, qemu_opts_id(opts), errp)) {
+        goto err_del_dev;
+    }
 
     /* set properties */
     if (qemu_opt_foreach(opts, set_property, dev, errp)) {
-- 
2.33.0


