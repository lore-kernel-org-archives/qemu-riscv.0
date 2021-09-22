Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4uj-00039E-KT
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4ua-0002hi-TS; Wed, 22 Sep 2021 12:15:56 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4uY-0005Ld-C6; Wed, 22 Sep 2021 12:15:56 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4B88C21EC3;
 Wed, 22 Sep 2021 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOou7ntZwf6jxxWFcKHppVKqRu0dT3fZc00S/uH+MyA=;
 b=5bk6PS2OqJmvZzhaI9CocH6KgDJLjQ0sST8dAep+XnkbKqazJzdfin3fRbNcoCFIIJ4LDG
 GoegIeSg8nXubLp4NmRiWtEy9I5diF4x3MSZmpTdsP6bl5Lp7T8uGdnf7mcsqHi+kAZIk3
 qGWjcdZLReG9SyIDa9sXiR3hURGJtcE=
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
Subject: [RFC PATCH v2 06/16] qapi: Allow device_add to execute in machine
 initialized phase
Date: Wed, 22 Sep 2021 18:13:55 +0200
Message-Id: <20210922161405.140018-7-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 22 Sep 2021 16:15:57 -0000

From: Mirela Grujic <mirela.grujic@greensocs.com>

To configure a machine using QMP we need the device_add command to
execute at machine initialized phase.

Note: for device_add command in qdev.json adding the 'allow-init-config'
option has no effect because the command appears to bypass QAPI (see
TODO at qapi/qdev.json:61). The option is added there solely to document
the intent.
For the same reason, the flags have to be explicitly set in
monitor_init_qmp_commands() when the device_add command is registered.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---

The commit is fine, but we may add intermediate commits before this one
in order to add or change the condition for a device type to be accepted
in the 'initialized' state (see the cover-letter of the series).
---
 qapi/qdev.json         | 3 ++-
 monitor/misc.c         | 2 +-
 softmmu/qdev-monitor.c | 6 ++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..ad669ae175 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -67,7 +67,8 @@
 ##
 { 'command': 'device_add',
   'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
-  'gen': false } # so we can get the additional arguments
+  'gen': false, # so we can get the additional arguments
+  'allow-preconfig': true }
 
 ##
 # @device_del:
diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966870..2c476de316 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -231,7 +231,7 @@ static void monitor_init_qmp_commands(void)
     qmp_init_marshal(&qmp_commands);
 
     qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
-                         QCO_NO_OPTIONS);
+                         QCO_ALLOW_PRECONFIG);
 
     QTAILQ_INIT(&qmp_cap_negotiation_commands);
     qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 834f2b56b5..47ccd90be8 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -824,6 +824,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
     QemuOpts *opts;
     DeviceState *dev;
 
+    if (!phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
+        error_setg(errp, "The command is permitted only after "
+                         "the machine is initialized");
+        return;
+    }
+
     opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, errp);
     if (!opts) {
         return;
-- 
2.33.0


