Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Tv-0000Ww-MR
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Tt-0000SB-LP
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Tl-0002bg-UK
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbnSHNQ2kA4GdquvgqY/LA7KZ7zRfnEAlFQJqJTL2Zg=;
 b=Wpvtr4zbCY6xHLkfk6K+JvKju3jxf85f++t8StPkxtfQI46pXuMPrHeORnGy0YjbeBV7L5
 PZ8sAOcgDkUUrtdvE/Du+8Pcn/4Fqb6P3XZ4lFU1u9ihdzXQuRGIHYb6WNIjMm484Cud23
 jGaFvC4vgEBWrAQ8SnQbhoIYjrLAjFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-ctGCrj0kMDOYr0bE3E5bpg-1; Tue, 14 Sep 2021 10:32:07 -0400
X-MC-Unique: ctGCrj0kMDOYr0bE3E5bpg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23DAB10144E0;
 Tue, 14 Sep 2021 14:32:04 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F1B15D9CA;
 Tue, 14 Sep 2021 14:31:44 +0000 (UTC)
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
Subject: [PATCH v2 36/53] qapi: introduce x-query-skeys QMP command
Date: Tue, 14 Sep 2021 15:20:25 +0100
Message-Id: <20210914142042.1655100-37-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:32:18 -0000

This is a counterpart to the HMP "info skeys" command. It is being
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
 hw/s390x/s390-skeys.c    | 37 +++++++++++++++++++++++++++++--------
 qapi/machine-target.json | 27 +++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 5024faf411..3a404d0574 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -15,6 +15,7 @@
 #include "hw/s390x/storage-keys.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/error-report.h"
 #include "sysemu/memory_mapping.h"
@@ -73,34 +74,54 @@ static void write_keys(FILE *f, uint8_t *keys, uint64_t startgfn,
     }
 }
 
-void hmp_info_skeys(Monitor *mon, const QDict *qdict)
+TargetHumanReadableText *qmp_x_query_skeys(int64_t addr, Error **errp)
 {
+    TargetHumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
     S390SKeysState *ss = s390_get_skeys_device();
     S390SKeysClass *skeyclass = S390_SKEYS_GET_CLASS(ss);
-    uint64_t addr = qdict_get_int(qdict, "addr");
     uint8_t key;
     int r;
 
     /* Quick check to see if guest is using storage keys*/
     if (!skeyclass->skeys_are_enabled(ss)) {
-        monitor_printf(mon, "Error: This guest is not using storage keys\n");
-        return;
+        error_setg(errp, "this guest is not using storage keys");
+        return NULL;
     }
 
     if (!address_space_access_valid(&address_space_memory,
                                     addr & TARGET_PAGE_MASK, TARGET_PAGE_SIZE,
                                     false, MEMTXATTRS_UNSPECIFIED)) {
-        monitor_printf(mon, "Error: The given address is not valid\n");
-        return;
+        error_setg(errp, "the given address is not valid");
+        return NULL;
     }
 
     r = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
     if (r < 0) {
-        monitor_printf(mon, "Error: %s\n", strerror(-r));
+        error_setg_errno(errp, r, "unable to query storage keys");
+        return NULL;
+    }
+
+    g_string_append_printf(buf, "  key: 0x%X\n", key);
+
+    ret = g_new0(TargetHumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
+
+void hmp_info_skeys(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    g_autoptr(TargetHumanReadableText) info = NULL;
+    uint64_t addr = qdict_get_int(qdict, "addr");
+
+    info = qmp_x_query_skeys(addr, &err);
+    if (err) {
+        error_report_err(err);
         return;
     }
 
-    monitor_printf(mon, "  key: 0x%X\n", key);
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 void hmp_dump_skeys(Monitor *mon, const QDict *qdict)
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index f5ec4bc172..00476bcdd4 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -341,3 +341,30 @@
                    'TARGET_I386',
                    'TARGET_S390X',
                    'TARGET_MIPS' ] } }
+
+
+##
+# @TargetHumanReadableText:
+#
+# @human-readable-text: Formatted output intended for humans.
+#
+# Since: 6.2.0
+#
+##
+{ 'struct': 'TargetHumanReadableText',
+  'data': { 'human-readable-text': 'str' },
+  'if': 'TARGET_S390X' }
+
+##
+# @x-query-skeys:
+#
+# Query the value of a storage key
+#
+# Returns: storage key value
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-skeys',
+  'data': { 'addr': 'int' },
+  'returns': 'TargetHumanReadableText',
+  'if': 'TARGET_S390X' }
-- 
2.31.1


