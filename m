Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9T7-0007bM-En
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9So-0007WO-7J
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Sm-0001tk-1l
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGP7dXbjGWq7ILIEw/l3CktBYMqdeJCapqhh4XsPuqw=;
 b=TN27mgPkj9GIfHd+Y5eSSl1AbjcLhj2rIuT0qR6IQMcjdTH9USLQDN9I/6MoDBYqREanZg
 EEuZQC+Ij8cLNgt2GQI9yGeoabGgMtYK1rUXOQcJLgroxMMB1yWVjeEysuZMN9o7yZiNM+
 eT8xAqycQWNv86s7R7+jIqZUkAFabNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-A6dIhPXlOQuOSDTffEcoBQ-1; Tue, 14 Sep 2021 10:30:59 -0400
X-MC-Unique: A6dIhPXlOQuOSDTffEcoBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D409610144E2;
 Tue, 14 Sep 2021 14:30:55 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9CF65D9DC;
 Tue, 14 Sep 2021 14:30:09 +0000 (UTC)
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
Subject: [PATCH v2 29/53] qapi: introduce x-query-registers QMP command
Date: Tue, 14 Sep 2021 15:20:18 +0100
Message-Id: <20210914142042.1655100-30-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 14 Sep 2021 14:31:21 -0000

This is a counterpart to the HMP "info registers" command. It is being
added with an "x-" prefix because this QMP command is intended as an
ad hoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
 monitor/misc.c             | 25 ++++++++++++++++---------
 qapi/common.json           | 11 +++++++++++
 qapi/machine.json          | 15 +++++++++++++++
 4 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 216fdfaf3a..c4e384f7d5 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -204,3 +204,33 @@ MemdevList *qmp_query_memdev(Error **errp)
     object_child_foreach(obj, query_memdev, &list);
     return list;
 }
+
+HumanReadableText *qmp_x_query_registers(bool has_cpu, int64_t cpu,
+                                         Error **errp)
+{
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
+    CPUState *cs = NULL, *tmp;
+
+    if (has_cpu) {
+        CPU_FOREACH(tmp) {
+            if (cpu == tmp->cpu_index) {
+                cs = tmp;
+            }
+        }
+        if (!cs) {
+            error_setg(errp, "CPU %"PRId64" not available", cpu);
+            return NULL;
+        }
+        cpu_format_state(cs, buf, CPU_DUMP_FPU);
+    } else {
+        CPU_FOREACH(cs) {
+            g_string_append_printf(buf, "\nCPU#%d\n", cs->cpu_index);
+            cpu_format_state(cs, buf, CPU_DUMP_FPU);
+        }
+    }
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966870..f25801a1a3 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -67,6 +67,7 @@
 #include "block/block-hmp-cmds.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-qom.h"
@@ -301,23 +302,29 @@ int monitor_get_cpu_index(Monitor *mon)
 static void hmp_info_registers(Monitor *mon, const QDict *qdict)
 {
     bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
-    CPUState *cs;
+    bool has_cpu = !all_cpus;
+    int64_t cpu = 0;
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
 
-    if (all_cpus) {
-        CPU_FOREACH(cs) {
-            monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
-            cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
-        }
-    } else {
-        cs = mon_get_cpu(mon);
+    if (has_cpu) {
+        CPUState *cs = mon_get_cpu(mon);
 
         if (!cs) {
             monitor_printf(mon, "No CPU available\n");
             return;
         }
 
-        cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
+        cpu = cs->cpu_index;
     }
+
+    info = qmp_x_query_registers(has_cpu, cpu, &err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 static void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
diff --git a/qapi/common.json b/qapi/common.json
index 7c976296f0..de7614ca99 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -197,3 +197,14 @@
 { 'enum': 'GrabToggleKeys',
   'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllock',
             'ctrl-scrolllock' ] }
+
+##
+# @HumanReadableText:
+#
+# @human-readable-text: Formatted output intended for humans.
+#
+# Since: 6.2.0
+#
+##
+{ 'struct': 'HumanReadableText',
+  'data': { 'human-readable-text': 'str' } }
diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..8737efa865 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1312,3 +1312,18 @@
      '*cores': 'int',
      '*threads': 'int',
      '*maxcpus': 'int' } }
+
+##
+# @x-query-registers:
+#
+# @cpu: the CPU number to query. If omitted, queries all CPUs
+#
+# Query information on the CPU registers
+#
+# Returns: CPU state in an architecture-specific format
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-registers',
+  'data': {'*cpu': 'int' },
+  'returns': 'HumanReadableText' }
-- 
2.31.1


