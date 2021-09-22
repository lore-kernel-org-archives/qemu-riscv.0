Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4vE-0003bk-UB
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4v2-0003If-93; Wed, 22 Sep 2021 12:16:24 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4v0-0005Ro-C6; Wed, 22 Sep 2021 12:16:24 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id B455E21ED2;
 Wed, 22 Sep 2021 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfebBfH6GVdfSl+a3M3Z0yLytuwrCU0s61tJ+ZXVGyA=;
 b=4+57fmZZrqqfiMZEPQV/HtYezQjVslO9aiAmXDY9Q9U4w+pBohuF9d/PLrpAJIwjoBNO49
 4DN2/DjmOHhL4T4VsHSwLEPNnD/2srj0nVTR7h5YqWSOh3iImVQU3JbPlA8mSUE2Ei2E1r
 K/SqfsawzVu+ASUu//lxvgY7OHHBmXc=
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
Subject: [RFC PATCH v2 13/16] hw/mem/system-memory: add a memory sysbus device
Date: Wed, 22 Sep 2021 18:14:02 +0200
Message-Id: <20210922161405.140018-14-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 22 Sep 2021 16:16:25 -0000

This device can be used to create some memories using standard
device_add qmp command.

This device has one property 'readonly' which allows
to choose between a ram or a rom.
The device holds the adequate memory region and can be put on
the sysbus.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Should we add a related CONFIG_ variable in the build system ?

Depending on the chosen condition to add a device, the commit may
change.
---
 include/hw/mem/sysbus-memory.h | 32 +++++++++++++
 hw/mem/sysbus-memory.c         | 83 ++++++++++++++++++++++++++++++++++
 hw/mem/meson.build             |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 include/hw/mem/sysbus-memory.h
 create mode 100644 hw/mem/sysbus-memory.c

diff --git a/include/hw/mem/sysbus-memory.h b/include/hw/mem/sysbus-memory.h
new file mode 100644
index 0000000000..3e1271dbfd
--- /dev/null
+++ b/include/hw/mem/sysbus-memory.h
@@ -0,0 +1,32 @@
+/*
+ * QEMU memory SysBusDevice
+ *
+ * Copyright (c) 2021 Greensocs
+ *
+ * Author:
+ * + Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_SYSBUS_MEMORY_H
+#define HW_SYSBUS_MEMORY_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_SYSBUS_MEMORY "sysbus-memory"
+OBJECT_DECLARE_SIMPLE_TYPE(SysBusMemoryState, SYSBUS_MEMORY)
+
+struct SysBusMemoryState {
+    /* <private> */
+    SysBusDevice parent_obj;
+    uint64_t size;
+    bool readonly;
+
+    /* <public> */
+    MemoryRegion mem;
+};
+
+#endif /* HW_SYSBUS_MEMORY_H */
diff --git a/hw/mem/sysbus-memory.c b/hw/mem/sysbus-memory.c
new file mode 100644
index 0000000000..897fa154f0
--- /dev/null
+++ b/hw/mem/sysbus-memory.c
@@ -0,0 +1,83 @@
+/*
+ * QEMU memory SysBusDevice
+ *
+ * Copyright (c) 2021 Greensocs
+ *
+ * Author:
+ * + Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/mem/sysbus-memory.h"
+#include "hw/qdev-properties.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+
+static Property sysbus_memory_properties[] = {
+    DEFINE_PROP_UINT64("size", SysBusMemoryState, size, 0),
+    DEFINE_PROP_BOOL("readonly", SysBusMemoryState, readonly, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sysbus_memory_realize(DeviceState *dev, Error **errp)
+{
+    SysBusMemoryState *s = SYSBUS_MEMORY(dev);
+    gchar *name;
+
+    if (!s->size) {
+        error_setg(errp, "'size' must be non-zero.");
+        return;
+    }
+
+    /*
+     * We impose having an id (which is unique) because we need to generate
+     * a unique name for the memory region.
+     * memory_region_init_ram/rom() will abort() (in qemu_ram_set_idstr()
+     * function if 2 system-memory devices are created with the same name
+     * for the memory region).
+     */
+    if (!dev->id) {
+        error_setg(errp, "system-memory device must have an id.");
+        return;
+    }
+    name = g_strdup_printf("%s.region", dev->id);
+
+    if (s->readonly) {
+        memory_region_init_rom(&s->mem, OBJECT(dev), name, s->size, errp);
+    } else {
+        memory_region_init_ram(&s->mem, OBJECT(dev), name, s->size, errp);
+    }
+
+    g_free(name);
+
+    if (!*errp) {
+        sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mem);
+    }
+}
+
+static void sysbus_memory_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->user_creatable = true;
+    dc->realize = sysbus_memory_realize;
+    device_class_set_props(dc, sysbus_memory_properties);
+}
+
+static const TypeInfo sysbus_memory_info = {
+    .name          = TYPE_SYSBUS_MEMORY,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SysBusMemoryState),
+    .class_init    = sysbus_memory_class_init,
+};
+
+static void sysbus_memory_register_types(void)
+{
+    type_register_static(&sysbus_memory_info);
+}
+
+type_init(sysbus_memory_register_types)
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 3c8fdef9f9..81e2de1d34 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -7,3 +7,5 @@ mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
 softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
 
 softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
+
+softmmu_ss.add(files('sysbus-memory.c'))
-- 
2.33.0


