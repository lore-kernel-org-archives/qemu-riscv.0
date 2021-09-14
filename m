Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Yq-0000Cr-Gn
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Yk-00008u-LT
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:37:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Yc-0006Dx-2Z
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVKry3AGQ0J47lN7ksTFJCPydgWIThxCI8/FSxTWsjQ=;
 b=X9A1V56F6xxmCLKEbTtoO5gArqgAr+pvwoGCPKDyO77LjwhoyPW8KQzfH2M5DlzlxttlTq
 /n4rMTGZ2+ZuX4pF3QR7029kOtgxlL0vVxJCEQWqrBmD/E1olso/ShbrOw4o51u8EUz+U1
 rmqsxHbMszrl+MntWO4Xklk52hChEBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-Nf-CDhdOPX61ObTmtVUhrw-1; Tue, 14 Sep 2021 10:37:05 -0400
X-MC-Unique: Nf-CDhdOPX61ObTmtVUhrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDE91835DE1;
 Tue, 14 Sep 2021 14:36:59 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BADA55D9CA;
 Tue, 14 Sep 2021 14:36:37 +0000 (UTC)
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
Subject: [PATCH v2 53/53] qapi: introduce x-query-opcount QMP command
Date: Tue, 14 Sep 2021 15:20:42 +0100
Message-Id: <20210914142042.1655100-54-berrange@redhat.com>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 14 Sep 2021 14:37:18 -0000

This is a counterpart to the HMP "info opcount" command. It is being
added with an "x-" prefix because this QMP command is intended as an
ad hoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 accel/tcg/cpu-exec.c       | 17 +++++++++++++++++
 accel/tcg/hmp.c            | 11 ++++++++++-
 accel/tcg/translate-all.c  |  4 ++--
 include/exec/cpu-all.h     |  2 +-
 include/tcg/tcg.h          |  2 +-
 qapi/machine.json          | 13 +++++++++++++
 tcg/tcg.c                  | 10 +++++-----
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 6d27fb62f9..613f6fa5be 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1051,4 +1051,21 @@ HumanReadableText *qmp_x_query_jit(Error **errp)
     return ret;
 }
 
+HumanReadableText *qmp_x_query_opcount(Error **errp)
+{
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
+
+    if (!tcg_enabled()) {
+        error_setg(errp, "JIT information is only available with accel=tcg");
+        return NULL;
+    }
+
+    dump_opcount_info(buf);
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
+
 #endif /* !CONFIG_USER_ONLY */
diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
index 9d7bcd9185..9b049d1e76 100644
--- a/accel/tcg/hmp.c
+++ b/accel/tcg/hmp.c
@@ -22,7 +22,16 @@ static void hmp_info_jit(Monitor *mon, const QDict *qdict)
 
 static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
 {
-    dump_opcount_info();
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
+
+    info = qmp_x_query_opcount(&err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 static void hmp_tcg_register(void)
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9c3dbe4409..7a8121e70a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2141,9 +2141,9 @@ void dump_exec_info(GString *buf)
     tcg_dump_info(buf);
 }
 
-void dump_opcount_info(void)
+void dump_opcount_info(GString *buf)
 {
-    tcg_dump_op_count();
+    tcg_dump_op_count(buf);
 }
 
 #else /* CONFIG_USER_ONLY */
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d92f6fa7a9..3c8e24292b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -432,7 +432,7 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 void dump_drift_info(GString *buf);
 /* accel/tcg/translate-all.c */
 void dump_exec_info(GString *buf);
-void dump_opcount_info(void);
+void dump_opcount_info(GString *buf);
 #endif /* CONFIG_TCG */
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 1b56e382b7..cc7f59070b 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -944,7 +944,7 @@ int tcg_check_temp_count(void);
 
 int64_t tcg_cpu_exec_time(void);
 void tcg_dump_info(GString *buf);
-void tcg_dump_op_count(void);
+void tcg_dump_op_count(GString *buf);
 
 #define TCG_CT_CONST  1 /* any constant of register size */
 
diff --git a/qapi/machine.json b/qapi/machine.json
index e88aba1199..bb24146a40 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1350,6 +1350,19 @@
 { 'command': 'x-query-numa',
   'returns': 'HumanReadableText' }
 
+##
+# @x-query-opcount:
+#
+# Query TCG opcode counters
+#
+# Returns: TCG opcode counters
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-opcount',
+  'returns': 'HumanReadableText',
+  'if': 'CONFIG_TCG' }
+
 ##
 # @x-query-profile:
 #
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 7fcdfd9c0f..d9653990af 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4115,15 +4115,15 @@ static void tcg_profile_snapshot_table(TCGProfile *prof)
     tcg_profile_snapshot(prof, false, true);
 }
 
-void tcg_dump_op_count(void)
+void tcg_dump_op_count(GString *buf)
 {
     TCGProfile prof = {};
     int i;
 
     tcg_profile_snapshot_table(&prof);
     for (i = 0; i < NB_OPS; i++) {
-        qemu_printf("%s %" PRId64 "\n", tcg_op_defs[i].name,
-                    prof.table_op_count[i]);
+        g_string_append_printf(buf, "%s %" PRId64 "\n", tcg_op_defs[i].name,
+                               prof.table_op_count[i]);
     }
 }
 
@@ -4142,9 +4142,9 @@ int64_t tcg_cpu_exec_time(void)
     return ret;
 }
 #else
-void tcg_dump_op_count(void)
+void tcg_dump_op_count(GString *buf)
 {
-    qemu_printf("[TCG profiler not compiled]\n");
+    g_string_append_printf(buf, "[TCG profiler not compiled]\n");
 }
 
 int64_t tcg_cpu_exec_time(void)
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 6aa628691a..251a14ddf7 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -53,6 +53,7 @@ static int query_error_class(const char *cmd)
         { "x-query-usb", ERROR_CLASS_GENERIC_ERROR },
         /* Only valid with accel=tcg */
         { "x-query-jit", ERROR_CLASS_GENERIC_ERROR },
+        { "x-query-opcount", ERROR_CLASS_GENERIC_ERROR },
         { NULL, -1 }
     };
     int i;
-- 
2.31.1


