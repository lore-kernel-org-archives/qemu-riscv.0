Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9TC-0007sZ-RF
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9TB-0007oh-A4
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:31:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9T8-0002Bb-Cl
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2ItSwilEkeD7dA4djStHQP7kqiJtaHr3ZbwT8gFz/w=;
 b=cXFA74yAOE6HcErDXxfe/1nqAgJw/ut994Cox68Uo3exTDY6Zl0z62ebpxv/3qETkm2Mj2
 j+fm/OptAECW+oa2cVu3/3fQ7USp/vJiIMHJggnSQ+VuFCP0sjUD9bNXWTQhX8ztIBG4m7
 FyAbtA3FblUNQnL9HNp92TAinpAwcKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-9W2v34IWNiqKtR_BwCE15w-1; Tue, 14 Sep 2021 10:31:28 -0400
X-MC-Unique: 9W2v34IWNiqKtR_BwCE15w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AC6B1054F90;
 Tue, 14 Sep 2021 14:31:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3565D9DD;
 Tue, 14 Sep 2021 14:31:12 +0000 (UTC)
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
Subject: [PATCH v2 32/53] qapi: introduce x-query-numa QMP command
Date: Tue, 14 Sep 2021 15:20:21 +0100
Message-Id: <20210914142042.1655100-33-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:31:33 -0000

This is a counterpart to the HMP "info numa" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine-hmp-cmds.c | 33 +++++-------------------------
 hw/core/machine-qmp-cmds.c | 42 ++++++++++++++++++++++++++++++++++++++
 qapi/machine.json          | 12 +++++++++++
 3 files changed, 59 insertions(+), 28 deletions(-)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 76b22b00d6..cfa01c6933 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -134,35 +134,12 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
 
 void hmp_info_numa(Monitor *mon, const QDict *qdict)
 {
-    int i, nb_numa_nodes;
-    NumaNodeMem *node_mem;
-    CpuInfoFastList *cpu_list, *cpu;
-    MachineState *ms = MACHINE(qdev_get_machine());
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = qmp_x_query_numa(&err);
 
-    nb_numa_nodes = ms->numa_state ? ms->numa_state->num_nodes : 0;
-    monitor_printf(mon, "%d nodes\n", nb_numa_nodes);
-    if (!nb_numa_nodes) {
+    if (err) {
+        error_report_err(err);
         return;
     }
-
-    cpu_list = qmp_query_cpus_fast(&error_abort);
-    node_mem = g_new0(NumaNodeMem, nb_numa_nodes);
-
-    query_numa_node_mem(node_mem, ms);
-    for (i = 0; i < nb_numa_nodes; i++) {
-        monitor_printf(mon, "node %d cpus:", i);
-        for (cpu = cpu_list; cpu; cpu = cpu->next) {
-            if (cpu->value->has_props && cpu->value->props->has_node_id &&
-                cpu->value->props->node_id == i) {
-                monitor_printf(mon, " %" PRIi64, cpu->value->cpu_index);
-            }
-        }
-        monitor_printf(mon, "\n");
-        monitor_printf(mon, "node %d size: %" PRId64 " MB\n", i,
-                       node_mem[i].node_mem >> 20);
-        monitor_printf(mon, "node %d plugged: %" PRId64 " MB\n", i,
-                       node_mem[i].node_plugged_mem >> 20);
-    }
-    qapi_free_CpuInfoFastList(cpu_list);
-    g_free(node_mem);
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index c4e384f7d5..4407e967da 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -234,3 +234,45 @@ HumanReadableText *qmp_x_query_registers(bool has_cpu, int64_t cpu,
     ret->human_readable_text = g_steal_pointer(&buf->str);
     return ret;
 }
+
+HumanReadableText *qmp_x_query_numa(Error **errp)
+{
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
+    int i, nb_numa_nodes;
+    NumaNodeMem *node_mem;
+    CpuInfoFastList *cpu_list, *cpu;
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    nb_numa_nodes = ms->numa_state ? ms->numa_state->num_nodes : 0;
+    g_string_append_printf(buf, "%d nodes\n", nb_numa_nodes);
+    if (!nb_numa_nodes) {
+        goto done;
+    }
+
+    cpu_list = qmp_query_cpus_fast(&error_abort);
+    node_mem = g_new0(NumaNodeMem, nb_numa_nodes);
+
+    query_numa_node_mem(node_mem, ms);
+    for (i = 0; i < nb_numa_nodes; i++) {
+        g_string_append_printf(buf, "node %d cpus:", i);
+        for (cpu = cpu_list; cpu; cpu = cpu->next) {
+            if (cpu->value->has_props && cpu->value->props->has_node_id &&
+                cpu->value->props->node_id == i) {
+                g_string_append_printf(buf, " %" PRIi64, cpu->value->cpu_index);
+            }
+        }
+        g_string_append_printf(buf, "\n");
+        g_string_append_printf(buf, "node %d size: %" PRId64 " MB\n", i,
+                               node_mem[i].node_mem >> 20);
+        g_string_append_printf(buf, "node %d plugged: %" PRId64 " MB\n", i,
+                               node_mem[i].node_plugged_mem >> 20);
+    }
+    qapi_free_CpuInfoFastList(cpu_list);
+    g_free(node_mem);
+
+ done:
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
diff --git a/qapi/machine.json b/qapi/machine.json
index d74c3f3fef..916f855e9b 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1313,6 +1313,18 @@
      '*threads': 'int',
      '*maxcpus': 'int' } }
 
+##
+# @x-query-numa:
+#
+# Query NUMA topology information
+#
+# Returns: topology information
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-numa',
+  'returns': 'HumanReadableText' }
+
 ##
 # @x-query-profile:
 #
-- 
2.31.1


