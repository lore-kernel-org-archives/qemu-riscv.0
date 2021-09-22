Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4v3-0003Jz-Fm
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4ud-0002rn-Hx; Wed, 22 Sep 2021 12:15:59 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4ub-0005Mq-0J; Wed, 22 Sep 2021 12:15:59 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 73F7B21EC7;
 Wed, 22 Sep 2021 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PKL+1gA6erzUqEOhaWDpJ5h6F3B//VEnmj0ACbfqSX0=;
 b=GLtOAaaPxTWsl4cHZ/jIm6GfdPz+u/QkndP3ql38H10VNAIkQ1EwIQigKoDRTjU3Cd27wF
 Z6jKSrHDiHVqytohW3K+04Wi7HCpPSBqociS+H/TTxSa5+XQbb0tINq8trisTlGjDgV8bz
 b/1Ub1hjekRXgH5VyDRqY1f0lN6lPzM=
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
Subject: [RFC PATCH v2 08/16] qdev-monitor: Check sysbus device type before
 creating it
Date: Wed, 22 Sep 2021 18:13:57 +0200
Message-Id: <20210922161405.140018-9-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 22 Sep 2021 16:16:00 -0000

Add an early check to test if the requested sysbus device type
is allowed by the current machine before creating the device. This
impacts both -device cli option and device_add qmp command.

Before this patch, the check was done well after the device has
been created (in a machine init done notifier). We can now report
the error right away.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 softmmu/qdev-monitor.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 47ccd90be8..f1c9242855 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -40,6 +40,7 @@
 #include "qemu/cutils.h"
 #include "hw/qdev-properties.h"
 #include "hw/clock.h"
+#include "hw/boards.h"
 
 /*
  * Aliases were a bad idea from the start.  Let's keep them
@@ -268,6 +269,16 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
         return NULL;
     }
 
+    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
+        /* sysbus devices need to be allowed by the machine */
+        MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
+        if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
+            error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
+                             " type for the machine", *driver);
+            return NULL;
+        }
+    }
+
     return dc;
 }
 
-- 
2.33.0


