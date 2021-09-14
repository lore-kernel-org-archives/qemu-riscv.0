Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9TX-00089w-12
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9TU-00083p-5Q
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9TD-0002Eb-VO
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L95vl1UuVwpTJtxDmY7MB+2pUWJRC8Yr3yhD63QKkCg=;
 b=D9tF5eG22qV6CbCtxWe5lYZGtnL+clY5Db1s0D9ftXwKoXVCCBg291H17RhH3jL60j5v/G
 zXMWbDYoCCxpw3JTxS7ISxTlqWgNiKZ0G3xvrO9jwRenN4ebJ6jwPhSnIIWibilK481jyO
 VJXxj4AxOyrT5krP2N3+W6ulTt6i4Tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-tjhAf0BdMkOY_rTzK4JcoQ-1; Tue, 14 Sep 2021 10:31:32 -0400
X-MC-Unique: tjhAf0BdMkOY_rTzK4JcoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB966BAF85;
 Tue, 14 Sep 2021 14:31:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 680185D9CA;
 Tue, 14 Sep 2021 14:31:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Xu <peterx@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Halil Pasic <pasic@linux.ibm.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 33/53] qapi: introduce x-query-usb QMP command
Date: Tue, 14 Sep 2021 15:20:22 +0100
Message-Id: <20210914142042.1655100-34-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
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
X-List-Received-Date: Tue, 14 Sep 2021 14:31:53 -0000

This is a counterpart to the HMP "info usb" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/usb/bus.c               | 38 +++++++++++++++++++++++++++++---------
 qapi/machine.json          | 12 ++++++++++++
 stubs/usb-dev-stub.c       |  8 ++++++++
 tests/qtest/qmp-cmd-test.c |  2 ++
 4 files changed, 51 insertions(+), 9 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 07083349f5..f94d872429 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -2,6 +2,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/sysemu.h"
@@ -631,15 +632,17 @@ static char *usb_get_fw_dev_path(DeviceState *qdev)
     return fw_path;
 }
 
-void hmp_info_usb(Monitor *mon, const QDict *qdict)
+HumanReadableText *qmp_x_query_usb(Error **errp)
 {
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
     USBBus *bus;
     USBDevice *dev;
     USBPort *port;
 
     if (QTAILQ_EMPTY(&busses)) {
-        monitor_printf(mon, "USB support not enabled\n");
-        return;
+        error_setg(errp, "USB support not enabled");
+        return NULL;
     }
 
     QTAILQ_FOREACH(bus, &busses, next) {
@@ -647,14 +650,31 @@ void hmp_info_usb(Monitor *mon, const QDict *qdict)
             dev = port->dev;
             if (!dev)
                 continue;
-            monitor_printf(mon, "  Device %d.%d, Port %s, Speed %s Mb/s, "
-                           "Product %s%s%s\n",
-                           bus->busnr, dev->addr, port->path,
-                           usb_speed(dev->speed), dev->product_desc,
-                           dev->qdev.id ? ", ID: " : "",
-                           dev->qdev.id ?: "");
+            g_string_append_printf(buf,
+                                   "  Device %d.%d, Port %s, Speed %s Mb/s, "
+                                   "Product %s%s%s\n",
+                                   bus->busnr, dev->addr, port->path,
+                                   usb_speed(dev->speed), dev->product_desc,
+                                   dev->qdev.id ? ", ID: " : "",
+                                   dev->qdev.id ?: "");
         }
     }
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
+
+void hmp_info_usb(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = qmp_x_query_usb(&err);
+
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 /* handle legacy -usbdevice cmd line option */
diff --git a/qapi/machine.json b/qapi/machine.json
index 916f855e9b..39d800c2c1 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1363,3 +1363,15 @@
 ##
 { 'command': 'x-query-roms',
   'returns': 'HumanReadableText' }
+
+##
+# @x-query-usb:
+#
+# Query information on the USB devices
+#
+# Returns: USB device information
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-usb',
+  'returns': 'HumanReadableText' }
diff --git a/stubs/usb-dev-stub.c b/stubs/usb-dev-stub.c
index b1adeeb454..aa557692b7 100644
--- a/stubs/usb-dev-stub.c
+++ b/stubs/usb-dev-stub.c
@@ -8,6 +8,8 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
 #include "sysemu/sysemu.h"
 #include "monitor/monitor.h"
 #include "hw/usb.h"
@@ -19,6 +21,12 @@ USBDevice *usbdevice_create(const char *driver)
     return NULL;
 }
 
+HumanReadableText *qmp_x_query_usb(Error **errp)
+{
+    error_setg(errp, "Support for USB devices not built-in");
+    return NULL;
+}
+
 void hmp_info_usb(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "Support for USB devices not built-in\n");
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index fbd7ac10fb..15875a14c6 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -49,6 +49,8 @@ static int query_error_class(const char *cmd)
 #ifndef CONFIG_PROFILER
         { "x-query-profile", ERROR_CLASS_GENERIC_ERROR },
 #endif
+        /* Only valid with a USB bus added */
+        { "x-query-usb", ERROR_CLASS_GENERIC_ERROR },
         { NULL, -1 }
     };
     int i;
-- 
2.31.1


