Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9UD-0000hs-FT
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9U6-0000cP-FM
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:32:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Ty-0002ja-Oc
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QtTGVKGmQfXBG/fdEBpdb2kRl84DA2SQ+OZkRmTDyU=;
 b=KYWzS9pGoMmZvyh80gi0GuiIEEdaIVmQHGEMT6lk3lRlxoBKGCwLYbahV626hDI+CbTooT
 QTrY4LpQKKScFDrINcL3ANiGnkUy2UhLcv6zoRFMf34gRH4sulGM0sdttSTcWkv8M2Sjwb
 dR0VUOHbIo7WjHnsEv1GlH26Co1wClA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-33S6BeYEP5iyfar776unSg-1; Tue, 14 Sep 2021 10:32:19 -0400
X-MC-Unique: 33S6BeYEP5iyfar776unSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF0B0BAF80;
 Tue, 14 Sep 2021 14:32:15 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F8CA5D9CA;
 Tue, 14 Sep 2021 14:32:04 +0000 (UTC)
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
Subject: [PATCH v2 37/53] qapi: introduce x-query-cmma QMP command
Date: Tue, 14 Sep 2021 15:20:26 +0100
Message-Id: <20210914142042.1655100-38-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:32:31 -0000

This is a counterpart to the HMP "info cmma" command. It is being
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
 hw/s390x/s390-stattrib.c | 58 +++++++++++++++++++++++++++-------------
 qapi/machine-target.json | 14 ++++++++++
 2 files changed, 54 insertions(+), 18 deletions(-)

diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 9eda1c3b2a..1ff0142b10 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -17,6 +17,7 @@
 #include "qemu/error-report.h"
 #include "exec/ram_addr.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/qmp/qdict.h"
 
 /* 512KiB cover 2GB of guest memory */
@@ -67,41 +68,62 @@ void hmp_migrationmode(Monitor *mon, const QDict *qdict)
     }
 }
 
-void hmp_info_cmma(Monitor *mon, const QDict *qdict)
+TargetHumanReadableText *qmp_x_query_cmma(int64_t addr,
+                                          bool has_count,
+                                          int64_t count,
+                                          Error **errp)
 {
+    TargetHumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
     S390StAttribState *sas = s390_get_stattrib_device();
     S390StAttribClass *sac = S390_STATTRIB_GET_CLASS(sas);
-    uint64_t addr = qdict_get_int(qdict, "addr");
-    uint64_t buflen = qdict_get_try_int(qdict, "count", 8);
-    uint8_t *vals;
+    g_autofree uint8_t *vals = NULL;
     int cx, len;
 
-    vals = g_try_malloc(buflen);
+    vals = g_try_malloc(count);
     if (!vals) {
-        monitor_printf(mon, "Error: %s\n", strerror(errno));
-        return;
+        error_setg_errno(errp, errno, "cannot allocate CMMA attribute values");
+        return NULL;
     }
 
-    len = sac->peek_stattr(sas, addr / TARGET_PAGE_SIZE, buflen, vals);
+    len = sac->peek_stattr(sas, addr / TARGET_PAGE_SIZE, count, vals);
     if (len < 0) {
-        monitor_printf(mon, "Error: %s", strerror(-len));
-        goto out;
+        error_setg_errno(errp, -len, "cannot peek at CMMA attribute values");
+        return NULL;
     }
 
-    monitor_printf(mon, "  CMMA attributes, "
-                   "pages %" PRIu64 "+%d (0x%" PRIx64 "):\n",
-                   addr / TARGET_PAGE_SIZE, len, addr & ~TARGET_PAGE_MASK);
+    g_string_append_printf(buf, "  CMMA attributes, "
+                           "pages %" PRIu64 "+%d (0x%" PRIx64 "):\n",
+                           addr / TARGET_PAGE_SIZE, len,
+                           addr & ~TARGET_PAGE_MASK);
     for (cx = 0; cx < len; cx++) {
         if (cx % 8 == 7) {
-            monitor_printf(mon, "%02x\n", vals[cx]);
+            g_string_append_printf(buf, "%02x\n", vals[cx]);
         } else {
-            monitor_printf(mon, "%02x", vals[cx]);
+            g_string_append_printf(buf, "%02x", vals[cx]);
         }
     }
-    monitor_printf(mon, "\n");
+    g_string_append_printf(buf, "\n");
+
+    ret = g_new0(TargetHumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
+
+void hmp_info_cmma(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    g_autoptr(TargetHumanReadableText) info = NULL;
+    uint64_t addr = qdict_get_int(qdict, "addr");
+    uint64_t count = qdict_get_try_int(qdict, "count", 8);
+
+    info = qmp_x_query_cmma(addr, true, count, &err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
 
-out:
-    g_free(vals);
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 /* Migration support: */
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 00476bcdd4..9040aff863 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -355,6 +355,20 @@
   'data': { 'human-readable-text': 'str' },
   'if': 'TARGET_S390X' }
 
+##
+# @x-query-cmma:
+#
+# Query the values of the CMMA storage attributes for a range of pages
+#
+# Returns: CMMA storage attribute values
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-cmma',
+  'data': { 'addr': 'int', '*count': 'int' },
+  'returns': 'TargetHumanReadableText',
+  'if': 'TARGET_S390X' }
+
 ##
 # @x-query-skeys:
 #
-- 
2.31.1


