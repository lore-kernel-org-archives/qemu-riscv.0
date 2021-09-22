Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4ug-000332-AE
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4ue-0002xf-Tq; Wed, 22 Sep 2021 12:16:00 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4uc-0005O0-1i; Wed, 22 Sep 2021 12:16:00 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 615DE21EC9;
 Wed, 22 Sep 2021 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDCjVxFBi4vz75aeR9pd9AbmoW6STuPuMbNBE/FSM7I=;
 b=ICuAAVCXm0R5uk9SjJ8PoZaJwYoy4CElxlYLonWdbRGOal6uenKQyWFhRGYtaMcpNGrB6U
 a6eNGZVWTngTm/nJTjQ651qUUGJcEfSF62QKzWyQ8J+LWw+rY7XTtY9hl/Kg9JWezPiQT2
 mj0ltS02PcDOghYVnG1qEo0ZJHBn8H4=
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
Subject: [RFC PATCH v2 09/16] hw/core/machine: Remove the dynamic sysbus
 devices type check
Date: Wed, 22 Sep 2021 18:13:58 +0200
Message-Id: <20210922161405.140018-10-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 22 Sep 2021 16:16:01 -0000

Now that we check sysbus device types during device creation, we
can remove the check done in the machine init done notifier.
This was the only thing done by this notifier, so we remove the
whole sysbus_notifier structure of the MachineState.

Note: This notifier was checking all /peripheral and /peripheral-anon
sysbus devices. Now we only check those added by -device cli option or
device_add qmp command when handling the command/option. So if there
are some devices added in one of these containers manually (eg in
machine C code), these will not be checked anymore.
This use case does not seem to appear apart from
hw/xen/xen-legacy-backend.c (it uses qdev_set_id() and in this case,
not for a sysbus device, so it's ok).

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/boards.h |  1 -
 hw/core/machine.c   | 27 ---------------------------
 2 files changed, 28 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 934443c1cd..ccbc40355a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -311,7 +311,6 @@ typedef struct CpuTopology {
 struct MachineState {
     /*< private >*/
     Object parent_obj;
-    Notifier sysbus_notifier;
 
     /*< public >*/
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1a18912dc8..521438e90a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -571,18 +571,6 @@ bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
     return allowed;
 }
 
-static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
-{
-    MachineState *machine = opaque;
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-
-    if (!device_is_dynamic_sysbus(mc, DEVICE(sbdev))) {
-        error_report("Option '-device %s' cannot be handled by this machine",
-                     object_class_get_name(object_get_class(OBJECT(sbdev))));
-        exit(1);
-    }
-}
-
 static char *machine_get_memdev(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -598,17 +586,6 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
     ms->ram_memdev_id = g_strdup(value);
 }
 
-static void machine_init_notify(Notifier *notifier, void *data)
-{
-    MachineState *machine = MACHINE(qdev_get_machine());
-
-    /*
-     * Loop through all dynamically created sysbus devices and check if they are
-     * all allowed.  If a device is not allowed, error out.
-     */
-    foreach_dynamic_sysbus_device(validate_sysbus_device, machine);
-}
-
 HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 {
     int i;
@@ -1030,10 +1007,6 @@ static void machine_initfn(Object *obj)
                                         "Table (HMAT)");
     }
 
-    /* Register notifier when init is done for sysbus sanity checks */
-    ms->sysbus_notifier.notify = machine_init_notify;
-    qemu_add_machine_init_done_notifier(&ms->sysbus_notifier);
-
     /* default to mc->default_cpus */
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
-- 
2.33.0


