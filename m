Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4ud-0002qJ-AX
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4uX-0002Ze-0i; Wed, 22 Sep 2021 12:15:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4uU-0005Gn-MX; Wed, 22 Sep 2021 12:15:52 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 6B2F521EB7;
 Wed, 22 Sep 2021 16:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uO+rxeU8HZHEUI7sNPCnX4N20yxgThgHilFwN01tQgY=;
 b=4nwd0mKYOh88Bq4/k8c2ah+UaLuLdmXU2GInH88kJxYAg7EbL+YtSjZJK2c1dGQBJKmftg
 4vAVxgxK4VmkfrqkOGJ0zDbZ2nOewcMfN23UNSDTJ+uvKx1YBbYpqTbVYD/e/IUguDE62+
 uTYcsOtlMDJL+LNvRXe+uEKGS6FD+Ew=
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
Subject: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP command
Date: Wed, 22 Sep 2021 18:13:51 +0200
Message-Id: <20210922161405.140018-3-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 22 Sep 2021 16:15:54 -0000

From: Mirela Grujic <mirela.grujic@greensocs.com>

The command returns current machine initialization phase.
From now on, the MachineInitPhase enum is generated from the
QAPI schema.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++++
 include/hw/qdev-core.h     | 30 ++------------------
 hw/core/machine-qmp-cmds.c |  9 ++++++
 hw/core/qdev.c             |  5 ++++
 4 files changed, 72 insertions(+), 28 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..969d37fb03 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1312,3 +1312,59 @@
      '*cores': 'int',
      '*threads': 'int',
      '*maxcpus': 'int' } }
+
+##
+# @MachineInitPhase:
+#
+# Enumeration of machine initialization phases.
+#
+# @no-machine: machine does not exist
+#
+# @machine-created: machine is created, but its accelerator is not
+#
+# @accel-created: accelerator is created, but the machine properties have not
+#                 been validated and machine initialization is not done yet
+#
+# @initialized: machine is initialized, thus creating any embedded devices and
+#               validating machine properties. Devices created at this time are
+#               considered to be cold-plugged.
+#
+# @ready: QEMU is ready to start CPUs and devices created at this time are
+#         considered to be hot-plugged. The monitor is not restricted to
+#         "preconfig" commands.
+#
+# Since: 6.2
+##
+{ 'enum': 'MachineInitPhase',
+  'data': [ 'no-machine', 'machine-created', 'accel-created', 'initialized',
+            'ready' ] }
+
+##
+# @MachineInitPhaseStatus:
+#
+# Information about machine initialization phase
+#
+# @phase: the machine initialization phase
+#
+# Since: 6.2
+##
+{ 'struct': 'MachineInitPhaseStatus',
+  'data': { 'phase': 'MachineInitPhase' } }
+
+##
+# @query-machine-phase:
+#
+# Return machine initialization phase
+#
+# Since: 6.2
+#
+# Returns: MachineInitPhaseStatus
+#
+# Example:
+#
+# -> { "execute": "query-machine-phase" }
+# <- { "return": { "phase": "initialized" } }
+#
+##
+{ 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
+             'allow-preconfig': true }
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 859fd913bb..800eda8f54 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -1,6 +1,7 @@
 #ifndef QDEV_CORE_H
 #define QDEV_CORE_H
 
+#include "qapi/qapi-types-machine.h"
 #include "qemu/queue.h"
 #include "qemu/bitmap.h"
 #include "qemu/rcu.h"
@@ -839,35 +840,8 @@ void device_listener_unregister(DeviceListener *listener);
  */
 bool qdev_should_hide_device(QemuOpts *opts);
 
-typedef enum MachineInitPhase {
-    /* current_machine is NULL.  */
-    MACHINE_INIT_PHASE_NO_MACHINE,
-
-    /* current_machine is not NULL, but current_machine->accel is NULL.  */
-    MACHINE_INIT_PHASE_MACHINE_CREATED,
-
-    /*
-     * current_machine->accel is not NULL, but the machine properties have
-     * not been validated and machine_class->init has not yet been called.
-     */
-    MACHINE_INIT_PHASE_ACCEL_CREATED,
-
-    /*
-     * machine_class->init has been called, thus creating any embedded
-     * devices and validating machine properties.  Devices created at
-     * this time are considered to be cold-plugged.
-     */
-    MACHINE_INIT_PHASE_INITIALIZED,
-
-    /*
-     * QEMU is ready to start CPUs and devices created at this time
-     * are considered to be hot-plugged.  The monitor is not restricted
-     * to "preconfig" commands.
-     */
-    MACHINE_INIT_PHASE_READY,
-} MachineInitPhase;
-
 extern bool phase_check(MachineInitPhase phase);
 extern void phase_advance(MachineInitPhase phase);
+extern MachineInitPhase phase_get(void);
 
 #endif
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 52168a3771..d3b9a04855 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -204,3 +204,12 @@ MemdevList *qmp_query_memdev(Error **errp)
     object_child_foreach(obj, query_memdev, &list);
     return list;
 }
+
+MachineInitPhaseStatus *qmp_query_machine_phase(Error **errp)
+{
+    MachineInitPhaseStatus *status = g_malloc0(sizeof(*status));
+
+    status->phase = phase_get();
+
+    return status;
+}
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index c5fc704f55..d83f1c029a 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1150,6 +1150,11 @@ void phase_advance(MachineInitPhase phase)
     machine_phase = phase;
 }
 
+MachineInitPhase phase_get(void)
+{
+    return machine_phase;
+}
+
 static const TypeInfo device_type_info = {
     .name = TYPE_DEVICE,
     .parent = TYPE_OBJECT,
-- 
2.33.0


