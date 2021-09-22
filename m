Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4ue-0002td-1n
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4ub-0002jo-J8; Wed, 22 Sep 2021 12:15:57 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4uZ-0005Lo-BC; Wed, 22 Sep 2021 12:15:57 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 8859E21EC6;
 Wed, 22 Sep 2021 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AlcBA0wPhQv7JVjfEB3jyBVlLhydcLHLk7mWNQnkSaw=;
 b=aNbmKAB3upukJdcXcsuRvB4jG/XeAjvN01JCf7FZfNOuG3Ym0/T3VOHAsNgbv3CyONvpfS
 mid9Yf6nHZMIKJQ8tXxHLaDcTTsVZesJe5TCDt+J3rfnHcViEzutj1BAJythr3C13zB3oI
 zK53p1V+hpk5h2HvFJykoc2d/cYBPPw=
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
Subject: [RFC PATCH v2 07/16] hw/core/machine: add
 machine_class_is_dynamic_sysbus_dev_allowed
Date: Wed, 22 Sep 2021 18:13:56 +0200
Message-Id: <20210922161405.140018-8-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 22 Sep 2021 16:15:58 -0000

Right now the allowance check for adding a sysbus device using
-device cli option (or device_add qmp command) is done well after
the device has been created. It is done during the machine init done
notifier: machine_init_notify() in hw/core/machine.c

This new function will allow us to check if a sysbus device type is
allowed to be dynamically created by the machine during the device
creation time.

Also make device_is_dynamic_sysbus() use the new function.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

In the context of our series, we need to be able to do the check at
device creation time to allow doing it depending on the current
MACHINE_INIT phase.
---
 include/hw/boards.h | 17 +++++++++++++++++
 hw/core/machine.c   | 15 ++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 463a5514f9..934443c1cd 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -51,6 +51,23 @@ void machine_set_cpu_numa_node(MachineState *machine,
  */
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
 
+/**
+ * machine_class_is_dynamic_sysbus_dev_allowed: Check if type is an allowed
+ * sysbus device type for the machine class.
+ * @mc: Machine class
+ * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
+ *
+ * Returns: true if @type is a type in the machine's list of
+ * dynamically pluggable sysbus devices; otherwise false.
+ *
+ * Check if the QOM type @type is in the list of allowed sysbus device
+ * types (see machine_class_allowed_dynamic_sysbus_dev()).
+ * Note that if @type is a subtype of a type which is in the list, it is
+ * allowed too.
+ */
+bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
+                                                 const char *type);
+
 /**
  * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
  * @mc: Machine class
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9125c9aad0..1a18912dc8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -545,18 +545,27 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
 
 bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
 {
-    bool allowed = false;
-    strList *wl;
     Object *obj = OBJECT(dev);
 
     if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
         return false;
     }
 
+    return machine_class_is_dynamic_sysbus_dev_allowed(mc,
+            object_get_typename(obj));
+}
+
+bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
+                                                 const char *type)
+{
+    bool allowed = false;
+    strList *wl;
+    ObjectClass *klass = object_class_by_name(type);
+
     for (wl = mc->allowed_dynamic_sysbus_devices;
          !allowed && wl;
          wl = wl->next) {
-        allowed |= !!object_dynamic_cast(obj, wl->value);
+        allowed |= !!object_class_dynamic_cast(klass, wl->value);
     }
 
     return allowed;
-- 
2.33.0


