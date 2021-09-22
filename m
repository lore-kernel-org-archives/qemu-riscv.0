Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4v9-0003TZ-00
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4v4-0003M6-8P; Wed, 22 Sep 2021 12:16:27 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4v1-0005S5-AB; Wed, 22 Sep 2021 12:16:26 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 879E321ED3;
 Wed, 22 Sep 2021 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lg6JGGOuMKgOK9bkuvAzYukD8OqEWtmOgbk2hQPItz8=;
 b=ND0iqKFzTzDcZ27ooxhDOEEEV8AccARG7AJHhC9a02u1e9KnwGeBRww88INrFwYdnUiGLU
 iWgot6Scekg2EdCjx5zulK0cCIpl/uZhww0kpehf4I9kg6qVmrIhlxI6IZCWAofixBVreB
 IFn8x3hm1X67NsswL2KN8XfRLNp4fgc=
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
Subject: [RFC PATCH v2 14/16] docs/system: add doc about the initialized
 machine phase and an example
Date: Wed, 22 Sep 2021 18:14:03 +0200
Message-Id: <20210922161405.140018-15-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 22 Sep 2021 16:16:27 -0000

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 docs/system/managed-startup.rst | 77 +++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/docs/system/managed-startup.rst b/docs/system/managed-startup.rst
index 9bcf98ea79..af12a10d27 100644
--- a/docs/system/managed-startup.rst
+++ b/docs/system/managed-startup.rst
@@ -32,4 +32,81 @@ machine, including but not limited to:
 - ``query-qmp-schema``
 - ``query-commands``
 - ``query-status``
+- ``x-machine-init``
 - ``x-exit-preconfig``
+
+In particular these commands allow to advance and stop qemu at different
+phases of the VM creation and finally to leave the "preconfig" state. The
+accessible phases are:
+
+- ``accel-created``
+- ``initialized``
+- ``ready``
+
+The order of the phases is enforced. It is not possible to go backwards.
+Note that other early phases exist, but they are not attainable with
+``--preconfig``. Depending on the phase, QMP commands can be issued to modify
+some part of the VM creation.
+
+accel-created phase
+-------------------
+
+Initial phase entered with ``--preconfig``.
+
+initialized phase
+-----------------
+
+``x-machine-init`` advances to ``initialized`` phase. During this phase, the
+machine is initialized and populated with buses and devices. The following QMP
+commands are available to manually populate or modify the machine:
+
+- ``device_add``
+- ``x-sysbus-mmio-map``
+- ``qom-set``
+
+ready phase
+-----------
+
+``x-exit-preconfig`` advances to the final phase. When entering this phase,
+the VM creation finishes. "preconfig" state is then done and QEMU goes to
+normal execution.
+
+Machine creation example
+------------------------
+
+The following is an example that shows how to add some devices with qmp
+commands, memory map them, and add interrupts::
+
+  x-machine-init
+
+  device_add        driver=sysbus-memory id=rom size=0x4000 readonly=true
+  x-sysbus-mmio-map device=rom addr=32768
+
+  device_add        driver=sysbus-memory id=flash size=0x80000 readonly=true
+  x-sysbus-mmio-map device=flash addr=536870912
+
+  device_add        driver=sysbus-memory id=ram size=0x10000
+  x-sysbus-mmio-map device=ram addr=268435456
+
+  device_add        driver=ibex-plic id=plic
+  x-sysbus-mmio-map device=plic addr=1090584576
+
+  device_add        driver=ibex-uart id=uart chardev=serial0
+  x-sysbus-mmio-map device=uart addr=1073741824
+  qom-set path=uart property=sysbus-irq[0] value=plic/unnamed-gpio-in[1]
+  qom-set path=uart property=sysbus-irq[1] value=plic/unnamed-gpio-in[2]
+  qom-set path=uart property=sysbus-irq[2] value=plic/unnamed-gpio-in[3]
+  qom-set path=uart property=sysbus-irq[3] value=plic/unnamed-gpio-in[4]
+
+  x-exit-preconfig
+
+These commands reproduce a subset of the riscv32 opentitan (hw/riscv/opentitan)
+machine. We can start qemu using::
+
+  qemu-sytem-riscv32 -preconfig -qmp unix:./qmp-sock,server \
+  -machine none -cpu lowriscv-ibex -serial mon:stdio ...
+
+Then we just have to issue the commands, for example using `qmp-shell`. If the
+previous commands were in a file named `machine.qmp`, we could do::
+
+  qmp-shell ./qmp-sock < machine.qmp
-- 
2.33.0


