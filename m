Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Ue-0001DR-FD
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Uc-00018B-Tj
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9UX-00036b-K9
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/jRtbUcY39Rqu7qghyi/HTcBufJo3NLVVwGNaTJ569Y=;
 b=Tdfg8feHbrF36ZV4DMdRsm1MLbV/I//vwDm80BHoSLWggUGRek1G/AB1Xneca0oJouNhdd
 ERCZ770fqntN5A0RWykYrMeseKwCu/KgnPSJlWezzJw95/QbGrPo5gifeIVSJ38IYsXIu5
 nhufeOWdQUKaCAWJvhNMOt4h2WJ/wH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-ebDlKE6IOSW5obJSs9l0CQ-1; Tue, 14 Sep 2021 10:32:50 -0400
X-MC-Unique: ebDlKE6IOSW5obJSs9l0CQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E9DF800FF4;
 Tue, 14 Sep 2021 14:32:47 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E75B85D9DC;
 Tue, 14 Sep 2021 14:32:31 +0000 (UTC)
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
Subject: [PATCH v2 39/53] qapi: introduce x-query-irq QMP command
Date: Tue, 14 Sep 2021 15:20:28 +0100
Message-Id: <20210914142042.1655100-40-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 14 Sep 2021 14:33:03 -0000

This is a counterpart to the HMP "info irq" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

This command is unable to use the pre-existing HumanReadableText,
because if 'common.json' is included into 'machine-target.json'
the static marshalling method for HumanReadableText will be reported
as unused by the compiler on all architectures except s390x.

Possible options were

 1 Support 'if' conditionals on 'include' statements in QAPI
 2 Add further commands to 'machine-target.json' that use
   HumanReadableText, such that it has at least one usage
   on all architecture targets.
 3 Duplicate HumanReadableText as TargetHumanReadableText
   adding conditions

This patch takes option (3) in the belief that we will eventually
get to a point where option (2) happens, and TargetHumanReadableText
can be removed again.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 monitor/hmp-cmds.c | 40 ++++++++-------------------------------
 monitor/qmp-cmds.c | 47 ++++++++++++++++++++++++++++++++++++++++++++++
 qapi/machine.json  | 12 ++++++++++++
 3 files changed, 67 insertions(+), 32 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 77533b2d8a..eb2202329d 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -784,42 +784,18 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
     }
 }
 
-static int hmp_info_irq_foreach(Object *obj, void *opaque)
+void hmp_info_irq(Monitor *mon, const QDict *qdict)
 {
-    InterruptStatsProvider *intc;
-    InterruptStatsProviderClass *k;
-    Monitor *mon = opaque;
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
 
-    if (object_dynamic_cast(obj, TYPE_INTERRUPT_STATS_PROVIDER)) {
-        intc = INTERRUPT_STATS_PROVIDER(obj);
-        k = INTERRUPT_STATS_PROVIDER_GET_CLASS(obj);
-        uint64_t *irq_counts;
-        unsigned int nb_irqs, i;
-        if (k->get_statistics &&
-            k->get_statistics(intc, &irq_counts, &nb_irqs)) {
-            if (nb_irqs > 0) {
-                monitor_printf(mon, "IRQ statistics for %s:\n",
-                               object_get_typename(obj));
-                for (i = 0; i < nb_irqs; i++) {
-                    if (irq_counts[i] > 0) {
-                        monitor_printf(mon, "%2d: %" PRId64 "\n", i,
-                                       irq_counts[i]);
-                    }
-                }
-            }
-        } else {
-            monitor_printf(mon, "IRQ statistics not available for %s.\n",
-                           object_get_typename(obj));
-        }
+    info = qmp_x_query_irq(&err);
+    if (err) {
+        error_report_err(err);
+        return;
     }
 
-    return 0;
-}
-
-void hmp_info_irq(Monitor *mon, const QDict *qdict)
-{
-    object_child_foreach_recursive(object_get_root(),
-                                   hmp_info_irq_foreach, mon);
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 static int hmp_info_pic_foreach(Object *obj, void *opaque)
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index b86fff823e..cfb98658e4 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -40,6 +40,7 @@
 #include "exec/ramlist.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
 
 NameInfo *qmp_query_name(Error **errp)
@@ -430,3 +431,49 @@ HumanReadableText *qmp_x_query_ramblock(Error **errp)
     ret->human_readable_text = g_steal_pointer(&buf->str);
     return ret;
 }
+
+static int qmp_x_query_irq_foreach(Object *obj, void *opaque)
+{
+    InterruptStatsProvider *intc;
+    InterruptStatsProviderClass *k;
+    GString *buf = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_INTERRUPT_STATS_PROVIDER)) {
+        intc = INTERRUPT_STATS_PROVIDER(obj);
+        k = INTERRUPT_STATS_PROVIDER_GET_CLASS(obj);
+        uint64_t *irq_counts;
+        unsigned int nb_irqs, i;
+        if (k->get_statistics &&
+            k->get_statistics(intc, &irq_counts, &nb_irqs)) {
+            if (nb_irqs > 0) {
+                g_string_append_printf(buf, "IRQ statistics for %s:\n",
+                                       object_get_typename(obj));
+                for (i = 0; i < nb_irqs; i++) {
+                    if (irq_counts[i] > 0) {
+                        g_string_append_printf(buf, "%2d: %" PRId64 "\n", i,
+                                               irq_counts[i]);
+                    }
+                }
+            }
+        } else {
+            g_string_append_printf(buf,
+                                   "IRQ statistics not available for %s.\n",
+                                   object_get_typename(obj));
+        }
+    }
+
+    return 0;
+}
+
+HumanReadableText *qmp_x_query_irq(Error **errp)
+{
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
+
+    object_child_foreach_recursive(object_get_root(),
+                                   qmp_x_query_irq_foreach, buf);
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
diff --git a/qapi/machine.json b/qapi/machine.json
index 3ae7beb7cf..e72b47ea7d 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1313,6 +1313,18 @@
      '*threads': 'int',
      '*maxcpus': 'int' } }
 
+##
+# @x-query-irq:
+#
+# Query interrupt statistics
+#
+# Returns: interrupt statistics
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-irq',
+  'returns': 'HumanReadableText' }
+
 ##
 # @x-query-numa:
 #
-- 
2.31.1


