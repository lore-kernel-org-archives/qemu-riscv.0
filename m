Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4uz-0003Fw-V2
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4ub-0002iM-39; Wed, 22 Sep 2021 12:15:57 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4uY-0005Le-Cy; Wed, 22 Sep 2021 12:15:56 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id F1D0E21EC1;
 Wed, 22 Sep 2021 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jPWHcx8frG0Bxx16IuAMBta1shU2F7IxandpxY+0m3o=;
 b=R2JacUH5kcSgL3a0GBx59skiUZLwlJrwuwsPCJPKp/jfsGnSFIs+eudHgACISfwNN8yzup
 PCA4EJ5Gc/WoYe//HHjbUL42WxmqWvbtS6uTYjxX75b2H+nsza1Ny7Oyp1hqgAG32pAcXI
 W+J++3yJDsAwelYtREZpkVK9EkRGLEc=
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
Subject: [RFC PATCH v2 05/16] qdev-monitor: prevent conflicts between
 qmp/device_add and cli/-device
Date: Wed, 22 Sep 2021 18:13:54 +0200
Message-Id: <20210922161405.140018-6-damien.hedde@greensocs.com>
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

This commit prepares to extend device_add qmp command when using
-preconfig option.

In order to avoid conflicts with the cli -device option handling, we
need to handle some special case with the QemuOpts.
The qemu_device_opts is traversed when switching from
MACHINE_INIT_PHASE_INITIALIZED to MACHINE_INIT_PHASE_READY in order
to create any device specified by cli -device. Until now any
device_add qmp command was issued after that point so there was no
problem.

If we execute the qmp command before the MACHINE_INIT_PHASE_READY
phase we need to discard the QemuOpts from the qemu_device_opts in
order to avoid the cli -device code to try to create the device
again.

This commit preserves the opts behavior regarding the devices added
in 'ready' phase by the QMP command device_add.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Although we keep the original behavior for QMP commands issued when
the machine is ready (only authorized case so far), we are not sure
it is necessary: keeping the opts in the list is not needed anymore
to ensure the id uniqueness of devices but it has the 2 following
consequences:

1. the device opts stay in the QemuOptsList. Is this list needed
   after traversing the device cli options?

2. the DeviceState "opts" field is set. Do we need to keep it after
   the device is realized ?

Any information on this will be appreciated.
---
 softmmu/qdev-monitor.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0007698ff3..834f2b56b5 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -848,6 +848,23 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
     if (!dev) {
         qemu_opts_del(opts);
         return;
+    } else if (!phase_check(MACHINE_INIT_PHASE_READY)) {
+        /*
+         * Always delete the related opts in case the device was created
+         * before handling of cli -device arguments:
+         * We do not want a device added by the qmp command to be handled
+         * again by the cli -device creation code. This does not break
+         * the ID uniqueness because it is checked in qdev_device_add().
+         *
+         * Note: We check the phase in order to keep the legacy behavior:
+         * in the machine ready phase case, the QemuOpts remains in the list
+         * (and the dev->opts field is kept).
+         * If it happens it was done only to ensure the ID uniqueness and
+         * the QemuOpts is never used after this point: then we could
+         * remove QemuOpts in any phase.
+         */
+        dev->opts = NULL;
+        qemu_opts_del(opts);
     }
     object_unref(OBJECT(dev));
 }
-- 
2.33.0


