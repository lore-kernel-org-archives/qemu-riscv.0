Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9YO-00088b-5U
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9YG-00080c-BR
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:36:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9YB-0005rl-DX
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wy8/gdFSFPTFVlYcj3RIlvpLCGStwBxaoNCHEzByEaY=;
 b=OYIU7dCgoJA/dv4sm8cgD0BOw0eNusfaujGT1jKrWxQyRQU3kDTBUFSqBVkW89vZmGHVWc
 Fu8RowHo/3bVkAvoH9spfjaDuk+IflGZYO8BJr94C8vPU4/LvT60apsc0oRJE9GgA0HRn0
 pXtuapX8kzNrhLIxmJSgKA7vr3QM85o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-M1GuuhZyOE-W4SQzAKMs_Q-1; Tue, 14 Sep 2021 10:36:41 -0400
X-MC-Unique: M1GuuhZyOE-W4SQzAKMs_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C89610144E2;
 Tue, 14 Sep 2021 14:36:37 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39FD75D9DC;
 Tue, 14 Sep 2021 14:36:18 +0000 (UTC)
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
Subject: [PATCH v2 52/53] qapi: introduce x-query-jit QMP command
Date: Tue, 14 Sep 2021 15:20:41 +0100
Message-Id: <20210914142042.1655100-53-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:36:50 -0000

This is a counterpart to the HMP "info jit" command. It is being
added with an "x-" prefix because this QMP command is intended as an
ad hoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 accel/tcg/cpu-exec.c       | 39 +++++++++++++----
 accel/tcg/hmp.c            | 13 ++++--
 accel/tcg/translate-all.c  | 80 ++++++++++++++++++----------------
 include/exec/cpu-all.h     |  4 +-
 include/tcg/tcg.h          |  2 +-
 qapi/machine.json          | 13 ++++++
 tcg/tcg.c                  | 88 ++++++++++++++++++++------------------
 tests/qtest/qmp-cmd-test.c |  2 +
 8 files changed, 148 insertions(+), 93 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e5c0ccd1a2..6d27fb62f9 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -20,6 +20,8 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/qemu-print.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "trace.h"
 #include "disas/disas.h"
@@ -38,6 +40,7 @@
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
+#include "sysemu/tcg.h"
 #include "exec/helper-proto.h"
 #include "tb-hash.h"
 #include "tb-context.h"
@@ -1011,23 +1014,41 @@ void tcg_exec_unrealizefn(CPUState *cpu)
 
 #ifndef CONFIG_USER_ONLY
 
-void dump_drift_info(void)
+void dump_drift_info(GString *buf)
 {
     if (!icount_enabled()) {
         return;
     }
 
-    qemu_printf("Host - Guest clock  %"PRIi64" ms\n",
-                (cpu_get_clock() - icount_get()) / SCALE_MS);
+    g_string_append_printf(buf, "Host - Guest clock  %"PRIi64" ms\n",
+                           (cpu_get_clock() - icount_get()) / SCALE_MS);
     if (icount_align_option) {
-        qemu_printf("Max guest delay     %"PRIi64" ms\n",
-                    -max_delay / SCALE_MS);
-        qemu_printf("Max guest advance   %"PRIi64" ms\n",
-                    max_advance / SCALE_MS);
+        g_string_append_printf(buf, "Max guest delay     %"PRIi64" ms\n",
+                               -max_delay / SCALE_MS);
+        g_string_append_printf(buf, "Max guest advance   %"PRIi64" ms\n",
+                               max_advance / SCALE_MS);
     } else {
-        qemu_printf("Max guest delay     NA\n");
-        qemu_printf("Max guest advance   NA\n");
+        g_string_append_printf(buf, "Max guest delay     NA\n");
+        g_string_append_printf(buf, "Max guest advance   NA\n");
     }
 }
 
+HumanReadableText *qmp_x_query_jit(Error **errp)
+{
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
+
+    if (!tcg_enabled()) {
+        error_setg(errp, "JIT information is only available with accel=tcg");
+        return NULL;
+    }
+
+    dump_exec_info(buf);
+    dump_drift_info(buf);
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
+
 #endif /* !CONFIG_USER_ONLY */
diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
index a6e72fdb3e..9d7bcd9185 100644
--- a/accel/tcg/hmp.c
+++ b/accel/tcg/hmp.c
@@ -1,18 +1,23 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-machine.h"
 #include "exec/exec-all.h"
 #include "monitor/monitor.h"
 #include "sysemu/tcg.h"
 
 static void hmp_info_jit(Monitor *mon, const QDict *qdict)
 {
-    if (!tcg_enabled()) {
-        error_report("JIT information is only available with accel=tcg");
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
+
+    info = qmp_x_query_jit(&err);
+    if (err) {
+        error_report_err(err);
         return;
     }
 
-    dump_exec_info();
-    dump_drift_info();
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bbfcfb698c..9c3dbe4409 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2014,7 +2014,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     cpu_loop_exit_noexc(cpu);
 }
 
-static void print_qht_statistics(struct qht_stats hst)
+static void print_qht_statistics(struct qht_stats hst, GString *buf)
 {
     uint32_t hgram_opts;
     size_t hgram_bins;
@@ -2023,9 +2023,11 @@ static void print_qht_statistics(struct qht_stats hst)
     if (!hst.head_buckets) {
         return;
     }
-    qemu_printf("TB hash buckets     %zu/%zu (%0.2f%% head buckets used)\n",
-                hst.used_head_buckets, hst.head_buckets,
-                (double)hst.used_head_buckets / hst.head_buckets * 100);
+    g_string_append_printf(buf, "TB hash buckets     %zu/%zu "
+                           "(%0.2f%% head buckets used)\n",
+                           hst.used_head_buckets, hst.head_buckets,
+                           (double)hst.used_head_buckets /
+                           hst.head_buckets * 100);
 
     hgram_opts =  QDIST_PR_BORDER | QDIST_PR_LABELS;
     hgram_opts |= QDIST_PR_100X   | QDIST_PR_PERCENT;
@@ -2033,8 +2035,9 @@ static void print_qht_statistics(struct qht_stats hst)
         hgram_opts |= QDIST_PR_NODECIMAL;
     }
     hgram = qdist_pr(&hst.occupancy, 10, hgram_opts);
-    qemu_printf("TB hash occupancy   %0.2f%% avg chain occ. Histogram: %s\n",
-                qdist_avg(&hst.occupancy) * 100, hgram);
+    g_string_append_printf(buf, "TB hash occupancy   %0.2f%% avg chain occ. "
+                           "Histogram: %s\n",
+                           qdist_avg(&hst.occupancy) * 100, hgram);
     g_free(hgram);
 
     hgram_opts = QDIST_PR_BORDER | QDIST_PR_LABELS;
@@ -2046,8 +2049,9 @@ static void print_qht_statistics(struct qht_stats hst)
         hgram_opts |= QDIST_PR_NODECIMAL | QDIST_PR_NOBINRANGE;
     }
     hgram = qdist_pr(&hst.chain, hgram_bins, hgram_opts);
-    qemu_printf("TB hash avg chain   %0.3f buckets. Histogram: %s\n",
-                qdist_avg(&hst.chain), hgram);
+    g_string_append_printf(buf, "TB hash avg chain   %0.3f buckets. "
+                           "Histogram: %s\n",
+                           qdist_avg(&hst.chain), hgram);
     g_free(hgram);
 }
 
@@ -2084,7 +2088,7 @@ static gboolean tb_tree_stats_iter(gpointer key, gpointer value, gpointer data)
     return false;
 }
 
-void dump_exec_info(void)
+void dump_exec_info(GString *buf)
 {
     struct tb_tree_stats tst = {};
     struct qht_stats hst;
@@ -2093,44 +2097,48 @@ void dump_exec_info(void)
     tcg_tb_foreach(tb_tree_stats_iter, &tst);
     nb_tbs = tst.nb_tbs;
     /* XXX: avoid using doubles ? */
-    qemu_printf("Translation buffer state:\n");
+    g_string_append_printf(buf, "Translation buffer state:\n");
     /*
      * Report total code size including the padding and TB structs;
      * otherwise users might think "-accel tcg,tb-size" is not honoured.
      * For avg host size we use the precise numbers from tb_tree_stats though.
      */
-    qemu_printf("gen code size       %zu/%zu\n",
-                tcg_code_size(), tcg_code_capacity());
-    qemu_printf("TB count            %zu\n", nb_tbs);
-    qemu_printf("TB avg target size  %zu max=%zu bytes\n",
-                nb_tbs ? tst.target_size / nb_tbs : 0,
-                tst.max_target_size);
-    qemu_printf("TB avg host size    %zu bytes (expansion ratio: %0.1f)\n",
-                nb_tbs ? tst.host_size / nb_tbs : 0,
-                tst.target_size ? (double)tst.host_size / tst.target_size : 0);
-    qemu_printf("cross page TB count %zu (%zu%%)\n", tst.cross_page,
-                nb_tbs ? (tst.cross_page * 100) / nb_tbs : 0);
-    qemu_printf("direct jump count   %zu (%zu%%) (2 jumps=%zu %zu%%)\n",
-                tst.direct_jmp_count,
-                nb_tbs ? (tst.direct_jmp_count * 100) / nb_tbs : 0,
-                tst.direct_jmp2_count,
-                nb_tbs ? (tst.direct_jmp2_count * 100) / nb_tbs : 0);
+    g_string_append_printf(buf, "gen code size       %zu/%zu\n",
+                           tcg_code_size(), tcg_code_capacity());
+    g_string_append_printf(buf, "TB count            %zu\n", nb_tbs);
+    g_string_append_printf(buf, "TB avg target size  %zu max=%zu bytes\n",
+                           nb_tbs ? tst.target_size / nb_tbs : 0,
+                           tst.max_target_size);
+    g_string_append_printf(buf, "TB avg host size    %zu bytes "
+                           "(expansion ratio: %0.1f)\n",
+                           nb_tbs ? tst.host_size / nb_tbs : 0,
+                           tst.target_size ?
+                           (double)tst.host_size / tst.target_size : 0);
+    g_string_append_printf(buf, "cross page TB count %zu (%zu%%)\n",
+                           tst.cross_page,
+                           nb_tbs ? (tst.cross_page * 100) / nb_tbs : 0);
+    g_string_append_printf(buf, "direct jump count   %zu (%zu%%) "
+                           "(2 jumps=%zu %zu%%)\n",
+                           tst.direct_jmp_count,
+                           nb_tbs ? (tst.direct_jmp_count * 100) / nb_tbs : 0,
+                           tst.direct_jmp2_count,
+                           nb_tbs ? (tst.direct_jmp2_count * 100) / nb_tbs : 0);
 
     qht_statistics_init(&tb_ctx.htable, &hst);
-    print_qht_statistics(hst);
+    print_qht_statistics(hst, buf);
     qht_statistics_destroy(&hst);
 
-    qemu_printf("\nStatistics:\n");
-    qemu_printf("TB flush count      %u\n",
-                qatomic_read(&tb_ctx.tb_flush_count));
-    qemu_printf("TB invalidate count %u\n",
-                qatomic_read(&tb_ctx.tb_phys_invalidate_count));
+    g_string_append_printf(buf, "\nStatistics:\n");
+    g_string_append_printf(buf, "TB flush count      %u\n",
+                           qatomic_read(&tb_ctx.tb_flush_count));
+    g_string_append_printf(buf, "TB invalidate count %u\n",
+                           qatomic_read(&tb_ctx.tb_phys_invalidate_count));
 
     tlb_flush_counts(&flush_full, &flush_part, &flush_elide);
-    qemu_printf("TLB full flushes    %zu\n", flush_full);
-    qemu_printf("TLB partial flushes %zu\n", flush_part);
-    qemu_printf("TLB elided flushes  %zu\n", flush_elide);
-    tcg_dump_info();
+    g_string_append_printf(buf, "TLB full flushes    %zu\n", flush_full);
+    g_string_append_printf(buf, "TLB partial flushes %zu\n", flush_part);
+    g_string_append_printf(buf, "TLB elided flushes  %zu\n", flush_elide);
+    tcg_dump_info(buf);
 }
 
 void dump_opcount_info(void)
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 32cfb634c6..d92f6fa7a9 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -429,9 +429,9 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 
 #ifdef CONFIG_TCG
 /* accel/tcg/cpu-exec.c */
-void dump_drift_info(void);
+void dump_drift_info(GString *buf);
 /* accel/tcg/translate-all.c */
-void dump_exec_info(void);
+void dump_exec_info(GString *buf);
 void dump_opcount_info(void);
 #endif /* CONFIG_TCG */
 
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 44ccd86f3e..1b56e382b7 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -943,7 +943,7 @@ int tcg_check_temp_count(void);
 #endif
 
 int64_t tcg_cpu_exec_time(void);
-void tcg_dump_info(void);
+void tcg_dump_info(GString *buf);
 void tcg_dump_op_count(void);
 
 #define TCG_CT_CONST  1 /* any constant of register size */
diff --git a/qapi/machine.json b/qapi/machine.json
index 0f537a58e0..e88aba1199 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1325,6 +1325,19 @@
 { 'command': 'x-query-irq',
   'returns': 'HumanReadableText' }
 
+##
+# @x-query-jit:
+#
+# Query TCG compiler statistics
+#
+# Returns: TCG compiler statistics
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-jit',
+  'returns': 'HumanReadableText',
+  'if': 'CONFIG_TCG' }
+
 ##
 # @x-query-numa:
 #
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4142d42d77..7fcdfd9c0f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4382,7 +4382,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 }
 
 #ifdef CONFIG_PROFILER
-void tcg_dump_info(void)
+void tcg_dump_info(GString *buf)
 {
     TCGProfile prof = {};
     const TCGProfile *s;
@@ -4396,53 +4396,59 @@ void tcg_dump_info(void)
     tb_div_count = tb_count ? tb_count : 1;
     tot = s->interm_time + s->code_time;
 
-    qemu_printf("JIT cycles          %" PRId64 " (%0.3f s at 2.4 GHz)\n",
-                tot, tot / 2.4e9);
-    qemu_printf("translated TBs      %" PRId64 " (aborted=%" PRId64
-                " %0.1f%%)\n",
-                tb_count, s->tb_count1 - tb_count,
-                (double)(s->tb_count1 - s->tb_count)
-                / (s->tb_count1 ? s->tb_count1 : 1) * 100.0);
-    qemu_printf("avg ops/TB          %0.1f max=%d\n",
-                (double)s->op_count / tb_div_count, s->op_count_max);
-    qemu_printf("deleted ops/TB      %0.2f\n",
-                (double)s->del_op_count / tb_div_count);
-    qemu_printf("avg temps/TB        %0.2f max=%d\n",
-                (double)s->temp_count / tb_div_count, s->temp_count_max);
-    qemu_printf("avg host code/TB    %0.1f\n",
-                (double)s->code_out_len / tb_div_count);
-    qemu_printf("avg search data/TB  %0.1f\n",
-                (double)s->search_out_len / tb_div_count);
+    g_string_append_printf(buf, "JIT cycles          %" PRId64
+                           " (%0.3f s at 2.4 GHz)\n",
+                           tot, tot / 2.4e9);
+    g_string_append_printf(buf, "translated TBs      %" PRId64
+                           " (aborted=%" PRId64 " %0.1f%%)\n",
+                           tb_count, s->tb_count1 - tb_count,
+                           (double)(s->tb_count1 - s->tb_count)
+                           / (s->tb_count1 ? s->tb_count1 : 1) * 100.0);
+    g_string_append_printf(buf, "avg ops/TB          %0.1f max=%d\n",
+                           (double)s->op_count / tb_div_count, s->op_count_max);
+    g_string_append_printf(buf, "deleted ops/TB      %0.2f\n",
+                           (double)s->del_op_count / tb_div_count);
+    g_string_append_printf(buf, "avg temps/TB        %0.2f max=%d\n",
+                           (double)s->temp_count / tb_div_count,
+                           s->temp_count_max);
+    g_string_append_printf(buf, "avg host code/TB    %0.1f\n",
+                           (double)s->code_out_len / tb_div_count);
+    g_string_append_printf(buf, "avg search data/TB  %0.1f\n",
+                           (double)s->search_out_len / tb_div_count);
     
-    qemu_printf("cycles/op           %0.1f\n",
-                s->op_count ? (double)tot / s->op_count : 0);
-    qemu_printf("cycles/in byte      %0.1f\n",
-                s->code_in_len ? (double)tot / s->code_in_len : 0);
-    qemu_printf("cycles/out byte     %0.1f\n",
-                s->code_out_len ? (double)tot / s->code_out_len : 0);
-    qemu_printf("cycles/search byte     %0.1f\n",
-                s->search_out_len ? (double)tot / s->search_out_len : 0);
+    g_string_append_printf(buf, "cycles/op           %0.1f\n",
+                           s->op_count ? (double)tot / s->op_count : 0);
+    g_string_append_printf(buf, "cycles/in byte      %0.1f\n",
+                           s->code_in_len ? (double)tot / s->code_in_len : 0);
+    g_string_append_printf(buf, "cycles/out byte     %0.1f\n",
+                           s->code_out_len ? (double)tot / s->code_out_len : 0);
+    g_string_append_printf(buf, "cycles/search byte     %0.1f\n",
+                           s->search_out_len ?
+                           (double)tot / s->search_out_len : 0);
     if (tot == 0) {
         tot = 1;
     }
-    qemu_printf("  gen_interm time   %0.1f%%\n",
-                (double)s->interm_time / tot * 100.0);
-    qemu_printf("  gen_code time     %0.1f%%\n",
-                (double)s->code_time / tot * 100.0);
-    qemu_printf("optim./code time    %0.1f%%\n",
-                (double)s->opt_time / (s->code_time ? s->code_time : 1)
-                * 100.0);
-    qemu_printf("liveness/code time  %0.1f%%\n",
-                (double)s->la_time / (s->code_time ? s->code_time : 1) * 100.0);
-    qemu_printf("cpu_restore count   %" PRId64 "\n",
-                s->restore_count);
-    qemu_printf("  avg cycles        %0.1f\n",
-                s->restore_count ? (double)s->restore_time / s->restore_count : 0);
+    g_string_append_printf(buf, "  gen_interm time   %0.1f%%\n",
+                           (double)s->interm_time / tot * 100.0);
+    g_string_append_printf(buf, "  gen_code time     %0.1f%%\n",
+                           (double)s->code_time / tot * 100.0);
+    g_string_append_printf(buf, "optim./code time    %0.1f%%\n",
+                           (double)s->opt_time / (s->code_time ?
+                                                  s->code_time : 1)
+                           * 100.0);
+    g_string_append_printf(buf, "liveness/code time  %0.1f%%\n",
+                           (double)s->la_time / (s->code_time ?
+                                                 s->code_time : 1) * 100.0);
+    g_string_append_printf(buf, "cpu_restore count   %" PRId64 "\n",
+                           s->restore_count);
+    g_string_append_printf(buf, "  avg cycles        %0.1f\n",
+                           s->restore_count ?
+                           (double)s->restore_time / s->restore_count : 0);
 }
 #else
-void tcg_dump_info(void)
+void tcg_dump_info(GString *buf)
 {
-    qemu_printf("[TCG profiler not compiled]\n");
+    g_string_append_printf(buf, "[TCG profiler not compiled]\n");
 }
 #endif
 
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 15875a14c6..6aa628691a 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -51,6 +51,8 @@ static int query_error_class(const char *cmd)
 #endif
         /* Only valid with a USB bus added */
         { "x-query-usb", ERROR_CLASS_GENERIC_ERROR },
+        /* Only valid with accel=tcg */
+        { "x-query-jit", ERROR_CLASS_GENERIC_ERROR },
         { NULL, -1 }
     };
     int i;
-- 
2.31.1


