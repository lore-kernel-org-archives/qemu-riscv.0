Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Xx-0007kK-NO
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Xv-0007cb-N6
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Xs-0005Xf-Ac
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjXz354OerT/IdyTAoj8iLAD8TsJq7H30dJHW+kTcBo=;
 b=erE1Wwjl1hup4T/3lNXtnI2aXq5KnSVk8u/bHN28YuCIhFPgzuyUMxcPQXfSY4TPgUiCdu
 c+nbXgQwMED3m/tbC7EDaEqe2Gqlp2OEf0ueeOoPpuh77y2+iYVhY2AIKOdCtJIC70mn0+
 nrmX0iEr6gjrf3UwA7x/L7YDark3iS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-VHsRiiH_O1K_BujAIMDWSA-1; Tue, 14 Sep 2021 10:36:22 -0400
X-MC-Unique: VHsRiiH_O1K_BujAIMDWSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E17C51808304;
 Tue, 14 Sep 2021 14:36:17 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 680F15D9CA;
 Tue, 14 Sep 2021 14:35:57 +0000 (UTC)
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
Subject: [PATCH v2 51/53] qapi: introduce x-query-tlb QMP command
Date: Tue, 14 Sep 2021 15:20:40 +0100
Message-Id: <20210914142042.1655100-52-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:36:28 -0000

This is a counterpart to the HMP "info tlb" command. It is being
added with an "x-" prefix because this QMP command is intended as an
ad hoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 22 ++++++++++++++++++++++
 monitor/misc.c             | 15 ++++++++++-----
 qapi/machine.json          | 15 +++++++++++++++
 3 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 4407e967da..c84cef8667 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -235,6 +235,28 @@ HumanReadableText *qmp_x_query_registers(bool has_cpu, int64_t cpu,
     return ret;
 }
 
+HumanReadableText *qmp_x_query_tlb(int64_t cpu, Error **errp)
+{
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
+    CPUState *cs = NULL, *tmp;
+
+    CPU_FOREACH(tmp) {
+        if (cpu == tmp->cpu_index) {
+            cs = tmp;
+        }
+    }
+    if (!cs) {
+        error_setg(errp, "CPU %"PRId64" not available", cpu);
+        return NULL;
+    }
+    cpu_format_tlb(cs, buf);
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
+
 HumanReadableText *qmp_x_query_numa(Error **errp)
 {
     HumanReadableText *ret;
diff --git a/monitor/misc.c b/monitor/misc.c
index c7d138914d..7ca529002d 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -938,17 +938,22 @@ static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
 
 static void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    g_autoptr(GString) buf = g_string_new("");
-    CPUState *cpu = mon_get_cpu(mon);
+    CPUState *cs = mon_get_cpu(mon);
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
 
-    if (!cpu) {
+    if (!cs) {
         monitor_printf(mon, "No CPU available\n");
         return;
     }
 
-    cpu_format_tlb(cpu, buf);
+    info = qmp_x_query_tlb(cs->cpu_index, &err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
 
-    monitor_printf(mon, "%s", buf->str);
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 static void hmp_info_profile(Monitor *mon, const QDict *qdict)
diff --git a/qapi/machine.json b/qapi/machine.json
index e72b47ea7d..0f537a58e0 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1400,6 +1400,21 @@
 { 'command': 'x-query-roms',
   'returns': 'HumanReadableText' }
 
+##
+# @x-query-tlb:
+#
+# @cpu: the CPU number to query
+#
+# Return information on the CPU memory mappings
+#
+# Returns: memory mappings in an architecture-specific format
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-tlb',
+  'data': {'cpu': 'int' },
+  'returns': 'HumanReadableText' }
+
 ##
 # @x-query-usb:
 #
-- 
2.31.1


