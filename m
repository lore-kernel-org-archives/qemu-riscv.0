Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9T9-0007iE-AH
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9T4-0007ZF-OQ
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:31:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9T0-00025Q-3H
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKPtyLPMWCX3yKuA9WhedPW4MlFG6fQaHVMY3/9/jrY=;
 b=FyNknozxhYfs6SiuwQ94qmWxcJqH/5nxwOHTgMUlNyWVL26QXxSTNkJyAfa8DWyNwelDUM
 RIihVb8Pd9SRVz7LDIAxX13R16acE2EOwh/AYTZHgqRvWX5IzfIAx7CL0a3zQ9l9xybigD
 fv6DOKwoqSWm5aRrvByLtOtq+93MXOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-DzwM4sEqPIKIg6xNgKRU2A-1; Tue, 14 Sep 2021 10:31:16 -0400
X-MC-Unique: DzwM4sEqPIKIg6xNgKRU2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C533FBAF85;
 Tue, 14 Sep 2021 14:31:12 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D34355D9CA;
 Tue, 14 Sep 2021 14:31:04 +0000 (UTC)
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
Subject: [PATCH v2 31/53] qapi: introduce x-query-profile QMP command
Date: Tue, 14 Sep 2021 15:20:20 +0100
Message-Id: <20210914142042.1655100-32-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:31:29 -0000

This is a counterpart to the HMP "info profile" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 monitor/misc.c             | 29 +++++++----------------------
 monitor/qmp-cmds.c         | 34 ++++++++++++++++++++++++++++++++++
 qapi/machine.json          | 12 ++++++++++++
 tests/qtest/qmp-cmd-test.c |  3 +++
 4 files changed, 56 insertions(+), 22 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index f25801a1a3..6b07efdddd 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -936,32 +936,17 @@ static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
     mtree_info(flatview, dispatch_tree, owner, disabled);
 }
 
-#ifdef CONFIG_PROFILER
-
-int64_t dev_time;
-
 static void hmp_info_profile(Monitor *mon, const QDict *qdict)
 {
-    static int64_t last_cpu_exec_time;
-    int64_t cpu_exec_time;
-    int64_t delta;
-
-    cpu_exec_time = tcg_cpu_exec_time();
-    delta = cpu_exec_time - last_cpu_exec_time;
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = qmp_x_query_profile(&err);
 
-    monitor_printf(mon, "async time  %" PRId64 " (%0.3f)\n",
-                   dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
-    monitor_printf(mon, "qemu time   %" PRId64 " (%0.3f)\n",
-                   delta, delta / (double)NANOSECONDS_PER_SECOND);
-    last_cpu_exec_time = cpu_exec_time;
-    dev_time = 0;
-}
-#else
-static void hmp_info_profile(Monitor *mon, const QDict *qdict)
-{
-    monitor_printf(mon, "Internal profiler not compiled\n");
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
-#endif
 
 /* Capture support */
 static QLIST_HEAD (capture_list_head, CaptureState) capture_head;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 5c0d5e116b..7bae0770a9 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -350,3 +350,37 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
         abort();
     }
 }
+
+#ifdef CONFIG_PROFILER
+
+int64_t dev_time;
+
+HumanReadableText *qmp_x_query_profile(Error **errp)
+{
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
+    static int64_t last_cpu_exec_time;
+    int64_t cpu_exec_time;
+    int64_t delta;
+
+    cpu_exec_time = tcg_cpu_exec_time();
+    delta = cpu_exec_time - last_cpu_exec_time;
+
+    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
+                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
+    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
+                           delta, delta / (double)NANOSECONDS_PER_SECOND);
+    last_cpu_exec_time = cpu_exec_time;
+    dev_time = 0;
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
+#else
+HumanReadableText *qmp_x_query_profile(Error **errp)
+{
+    error_setg(errp, "Internal profiler not compiled");
+    return NULL;
+}
+#endif
diff --git a/qapi/machine.json b/qapi/machine.json
index a4a1727589..d74c3f3fef 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1313,6 +1313,18 @@
      '*threads': 'int',
      '*maxcpus': 'int' } }
 
+##
+# @x-query-profile:
+#
+# Query TCG profiling information
+#
+# Returns: profile information
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-profile',
+  'returns': 'HumanReadableText' }
+
 ##
 # @x-query-registers:
 #
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index c98b78d033..fbd7ac10fb 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -46,6 +46,9 @@ static int query_error_class(const char *cmd)
         { "query-balloon", ERROR_CLASS_DEVICE_NOT_ACTIVE },
         { "query-hotpluggable-cpus", ERROR_CLASS_GENERIC_ERROR },
         { "query-vm-generation-id", ERROR_CLASS_GENERIC_ERROR },
+#ifndef CONFIG_PROFILER
+        { "x-query-profile", ERROR_CLASS_GENERIC_ERROR },
+#endif
         { NULL, -1 }
     };
     int i;
-- 
2.31.1


