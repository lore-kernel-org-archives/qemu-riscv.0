Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9UQ-0000q8-GC
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9UM-0000mL-NR
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:32:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9UD-0002vs-VY
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLy6EwxITacEuC/jBCLIRMB/Ak0L1zfodmwGOnq/cfw=;
 b=fl1f2nAWxNFDaQfMaauXy+9HXu1cKCxo5nDuP5lk+JqMq9Y/qTaKOSqya87gJY0B/lHD1x
 MqiCjhkVwhaS0WXSoBliQzD20yn9lxB0XKY17VjQjhfIH9+nEQYMXqyIpqukY5xBdPorYT
 Qihe4XjWQ7v/rwfoGpBZU54ckYuQtMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-ss83hsYsPamdDB3infvU8A-1; Tue, 14 Sep 2021 10:32:36 -0400
X-MC-Unique: ss83hsYsPamdDB3infvU8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE801054FA5;
 Tue, 14 Sep 2021 14:32:31 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45B6A5D9DC;
 Tue, 14 Sep 2021 14:32:16 +0000 (UTC)
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
Subject: [PATCH v2 38/53] qapi: introduce x-query-lapic QMP command
Date: Tue, 14 Sep 2021 15:20:27 +0100
Message-Id: <20210914142042.1655100-39-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:32:48 -0000

This is a counterpart to the HMP "info lapic" command. It is being
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
 hw/core/cpu-common.c     |   7 ++
 include/hw/core/cpu.h    |  10 +++
 qapi/machine-target.json |  19 ++++-
 target/i386/cpu-dump.c   | 161 ++++++++++++++++++++-------------------
 target/i386/cpu.h        |   4 +-
 target/i386/monitor.c    |  46 +++++++++--
 6 files changed, 160 insertions(+), 87 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index c2cd33a817..d1ebc77d1b 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -49,6 +49,13 @@ CPUState *cpu_by_arch_id(int64_t id)
     return NULL;
 }
 
+int64_t cpu_get_arch_id(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    return cc->get_arch_id(cpu);
+}
+
 bool cpu_exists(int64_t id)
 {
     return !!cpu_by_arch_id(id);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1599ef9df3..a0913eedaa 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -780,6 +780,16 @@ bool cpu_exists(int64_t id);
  */
 CPUState *cpu_by_arch_id(int64_t id);
 
+/**
+ * cpu_get_arch_id:
+ * @cpu: the CPU to query
+ *
+ * Get the guest exposed CPU ID for @cpu
+ *
+ * Returns: The guest exposed CPU ID
+ */
+int64_t cpu_get_arch_id(CPUState *cpu);
+
 /**
  * cpu_interrupt:
  * @cpu: The CPU to set an interrupt on.
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 9040aff863..62220d1f08 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -353,7 +353,8 @@
 ##
 { 'struct': 'TargetHumanReadableText',
   'data': { 'human-readable-text': 'str' },
-  'if': 'TARGET_S390X' }
+  'if': { 'any': ['TARGET_S390X',
+                  'TARGET_I386' ] } }
 
 ##
 # @x-query-cmma:
@@ -369,6 +370,22 @@
   'returns': 'TargetHumanReadableText',
   'if': 'TARGET_S390X' }
 
+##
+# @x-query-lapic:
+#
+# @apic-id: the local APIC ID to report
+#
+# Query local APIC state.
+#
+# Returns: local APIC state
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-lapic',
+  'data': { 'apic-id': 'int' },
+  'returns': 'TargetHumanReadableText',
+  'if': 'TARGET_I386' }
+
 ##
 # @x-query-skeys:
 #
diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index f30fbcb76e..41a1f64138 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/qemu-print.h"
+#include "qapi/error.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/i386/apic_internal.h"
 #endif
@@ -179,24 +180,26 @@ static inline const char *dm2str(uint32_t dm)
     return str[dm];
 }
 
-static void dump_apic_lvt(const char *name, uint32_t lvt, bool is_timer)
+static void format_apic_lvt(const char *name, uint32_t lvt, bool is_timer,
+                            GString *buf)
 {
     uint32_t dm = (lvt & APIC_LVT_DELIV_MOD) >> APIC_LVT_DELIV_MOD_SHIFT;
-    qemu_printf("%s\t 0x%08x %s %-5s %-6s %-7s %-12s %-6s",
-                name, lvt,
-                lvt & APIC_LVT_INT_POLARITY ? "active-lo" : "active-hi",
-                lvt & APIC_LVT_LEVEL_TRIGGER ? "level" : "edge",
-                lvt & APIC_LVT_MASKED ? "masked" : "",
-                lvt & APIC_LVT_DELIV_STS ? "pending" : "",
-                !is_timer ?
-                    "" : lvt & APIC_LVT_TIMER_PERIODIC ?
-                            "periodic" : lvt & APIC_LVT_TIMER_TSCDEADLINE ?
-                                            "tsc-deadline" : "one-shot",
+    g_string_append_printf(buf, "%s\t 0x%08x %s %-5s %-6s %-7s %-12s %-6s",
+                           name, lvt,
+                           lvt & APIC_LVT_INT_POLARITY ?
+                           "active-lo" : "active-hi",
+                           lvt & APIC_LVT_LEVEL_TRIGGER ? "level" : "edge",
+                           lvt & APIC_LVT_MASKED ? "masked" : "",
+                           lvt & APIC_LVT_DELIV_STS ? "pending" : "",
+                           !is_timer ?
+                           "" : lvt & APIC_LVT_TIMER_PERIODIC ?
+                           "periodic" : lvt & APIC_LVT_TIMER_TSCDEADLINE ?
+                           "tsc-deadline" : "one-shot",
                 dm2str(dm));
     if (dm != APIC_DM_NMI) {
-        qemu_printf(" (vec %u)\n", lvt & APIC_VECTOR_MASK);
+        g_string_append_printf(buf, " (vec %u)\n", lvt & APIC_VECTOR_MASK);
     } else {
-        qemu_printf("\n");
+        g_string_append_printf(buf, "\n");
     }
 }
 
@@ -228,7 +231,7 @@ static inline void mask2str(char *str, uint32_t val, uint8_t size)
 
 #define MAX_LOGICAL_APIC_ID_MASK_SIZE 16
 
-static void dump_apic_icr(APICCommonState *s, CPUX86State *env)
+static void format_apic_icr(APICCommonState *s, CPUX86State *env, GString *buf)
 {
     uint32_t icr = s->icr[0], icr2 = s->icr[1];
     uint8_t dest_shorthand = \
@@ -238,16 +241,16 @@ static void dump_apic_icr(APICCommonState *s, CPUX86State *env)
     uint32_t dest_field;
     bool x2apic;
 
-    qemu_printf("ICR\t 0x%08x %s %s %s %s\n",
-                icr,
-                logical_mod ? "logical" : "physical",
-                icr & APIC_ICR_TRIGGER_MOD ? "level" : "edge",
-                icr & APIC_ICR_LEVEL ? "assert" : "de-assert",
-                shorthand2str(dest_shorthand));
+    g_string_append_printf(buf, "ICR\t 0x%08x %s %s %s %s\n",
+                           icr,
+                           logical_mod ? "logical" : "physical",
+                           icr & APIC_ICR_TRIGGER_MOD ? "level" : "edge",
+                           icr & APIC_ICR_LEVEL ? "assert" : "de-assert",
+                           shorthand2str(dest_shorthand));
 
-    qemu_printf("ICR2\t 0x%08x", icr2);
+    g_string_append_printf(buf, "ICR2\t 0x%08x", icr2);
     if (dest_shorthand != 0) {
-        qemu_printf("\n");
+        g_string_append_printf(buf, "\n");
         return;
     }
     x2apic = env->features[FEAT_1_ECX] & CPUID_EXT_X2APIC;
@@ -255,96 +258,100 @@ static void dump_apic_icr(APICCommonState *s, CPUX86State *env)
 
     if (!logical_mod) {
         if (x2apic) {
-            qemu_printf(" cpu %u (X2APIC ID)\n", dest_field);
+            g_string_append_printf(buf, " cpu %u (X2APIC ID)\n", dest_field);
         } else {
-            qemu_printf(" cpu %u (APIC ID)\n",
-                        dest_field & APIC_LOGDEST_XAPIC_ID);
+            g_string_append_printf(buf, " cpu %u (APIC ID)\n",
+                                   dest_field & APIC_LOGDEST_XAPIC_ID);
         }
         return;
     }
 
     if (s->dest_mode == 0xf) { /* flat mode */
         mask2str(apic_id_str, icr2 >> APIC_ICR_DEST_SHIFT, 8);
-        qemu_printf(" mask %s (APIC ID)\n", apic_id_str);
+        g_string_append_printf(buf, " mask %s (APIC ID)\n", apic_id_str);
     } else if (s->dest_mode == 0) { /* cluster mode */
         if (x2apic) {
             mask2str(apic_id_str, dest_field & APIC_LOGDEST_X2APIC_ID, 16);
-            qemu_printf(" cluster %u mask %s (X2APIC ID)\n",
-                        dest_field >> APIC_LOGDEST_X2APIC_SHIFT, apic_id_str);
+            g_string_append_printf(buf, " cluster %u mask %s (X2APIC ID)\n",
+                                   dest_field >> APIC_LOGDEST_X2APIC_SHIFT,
+                                   apic_id_str);
         } else {
             mask2str(apic_id_str, dest_field & APIC_LOGDEST_XAPIC_ID, 4);
-            qemu_printf(" cluster %u mask %s (APIC ID)\n",
-                        dest_field >> APIC_LOGDEST_XAPIC_SHIFT, apic_id_str);
+            g_string_append_printf(buf, " cluster %u mask %s (APIC ID)\n",
+                                   dest_field >> APIC_LOGDEST_XAPIC_SHIFT,
+                                   apic_id_str);
         }
     }
 }
 
-static void dump_apic_interrupt(const char *name, uint32_t *ireg_tab,
-                                uint32_t *tmr_tab)
+static void format_apic_interrupt(const char *name, uint32_t *ireg_tab,
+                                  uint32_t *tmr_tab, GString *buf)
 {
     int i, empty = true;
 
-    qemu_printf("%s\t ", name);
+    g_string_append_printf(buf, "%s\t ", name);
     for (i = 0; i < 256; i++) {
         if (apic_get_bit(ireg_tab, i)) {
-            qemu_printf("%u%s ", i,
-                        apic_get_bit(tmr_tab, i) ? "(level)" : "");
+            g_string_append_printf(buf, "%u%s ", i,
+                                   apic_get_bit(tmr_tab, i) ? "(level)" : "");
             empty = false;
         }
     }
-    qemu_printf("%s\n", empty ? "(none)" : "");
+    g_string_append_printf(buf, "%s\n", empty ? "(none)" : "");
 }
 
-void x86_cpu_dump_local_apic_state(CPUState *cs, int flags)
+GString *x86_cpu_format_local_apic_state(CPUState *cs, int flags, Error **errp)
 {
+    g_autoptr(GString) buf = g_string_new("");
     X86CPU *cpu = X86_CPU(cs);
     APICCommonState *s = APIC_COMMON(cpu->apic_state);
     if (!s) {
-        qemu_printf("local apic state not available\n");
-        return;
+        error_setg(errp, "local apic state not available");
+        return NULL;
     }
     uint32_t *lvt = s->lvt;
 
-    qemu_printf("dumping local APIC state for CPU %-2u\n\n",
-                CPU(cpu)->cpu_index);
-    dump_apic_lvt("LVT0", lvt[APIC_LVT_LINT0], false);
-    dump_apic_lvt("LVT1", lvt[APIC_LVT_LINT1], false);
-    dump_apic_lvt("LVTPC", lvt[APIC_LVT_PERFORM], false);
-    dump_apic_lvt("LVTERR", lvt[APIC_LVT_ERROR], false);
-    dump_apic_lvt("LVTTHMR", lvt[APIC_LVT_THERMAL], false);
-    dump_apic_lvt("LVTT", lvt[APIC_LVT_TIMER], true);
-
-    qemu_printf("Timer\t DCR=0x%x (divide by %u) initial_count = %u"
-                " current_count = %u\n",
-                s->divide_conf & APIC_DCR_MASK,
-                divider_conf(s->divide_conf),
-                s->initial_count, apic_get_current_count(s));
-
-    qemu_printf("SPIV\t 0x%08x APIC %s, focus=%s, spurious vec %u\n",
-                s->spurious_vec,
-                s->spurious_vec & APIC_SPURIO_ENABLED ? "enabled" : "disabled",
-                s->spurious_vec & APIC_SPURIO_FOCUS ? "on" : "off",
-                s->spurious_vec & APIC_VECTOR_MASK);
-
-    dump_apic_icr(s, &cpu->env);
-
-    qemu_printf("ESR\t 0x%08x\n", s->esr);
-
-    dump_apic_interrupt("ISR", s->isr, s->tmr);
-    dump_apic_interrupt("IRR", s->irr, s->tmr);
-
-    qemu_printf("\nAPR 0x%02x TPR 0x%02x DFR 0x%02x LDR 0x%02x",
-                s->arb_id, s->tpr, s->dest_mode, s->log_dest);
+    g_string_append_printf(buf, "dumping local APIC state for CPU %-2u\n\n",
+                           CPU(cpu)->cpu_index);
+    format_apic_lvt("LVT0", lvt[APIC_LVT_LINT0], false, buf);
+    format_apic_lvt("LVT1", lvt[APIC_LVT_LINT1], false, buf);
+    format_apic_lvt("LVTPC", lvt[APIC_LVT_PERFORM], false, buf);
+    format_apic_lvt("LVTERR", lvt[APIC_LVT_ERROR], false, buf);
+    format_apic_lvt("LVTTHMR", lvt[APIC_LVT_THERMAL], false, buf);
+    format_apic_lvt("LVTT", lvt[APIC_LVT_TIMER], true, buf);
+
+    g_string_append_printf(buf,
+                           "Timer\t DCR=0x%x (divide by %u) initial_count = %u"
+                           " current_count = %u\n",
+                           s->divide_conf & APIC_DCR_MASK,
+                           divider_conf(s->divide_conf),
+                           s->initial_count, apic_get_current_count(s));
+
+    g_string_append_printf(buf,
+                           "SPIV\t 0x%08x APIC %s, focus=%s, spurious vec %u\n",
+                           s->spurious_vec,
+                           s->spurious_vec & APIC_SPURIO_ENABLED ?
+                           "enabled" : "disabled",
+                           s->spurious_vec & APIC_SPURIO_FOCUS ? "on" : "off",
+                           s->spurious_vec & APIC_VECTOR_MASK);
+
+    format_apic_icr(s, &cpu->env, buf);
+
+    g_string_append_printf(buf, "ESR\t 0x%08x\n", s->esr);
+
+    format_apic_interrupt("ISR", s->isr, s->tmr, buf);
+    format_apic_interrupt("IRR", s->irr, s->tmr, buf);
+
+    g_string_append_printf(buf, "\nAPR 0x%02x TPR 0x%02x DFR 0x%02x LDR 0x%02x",
+                           s->arb_id, s->tpr, s->dest_mode, s->log_dest);
     if (s->dest_mode == 0) {
-        qemu_printf("(cluster %u: id %u)",
-                    s->log_dest >> APIC_LOGDEST_XAPIC_SHIFT,
-                    s->log_dest & APIC_LOGDEST_XAPIC_ID);
+        g_string_append_printf(buf, "(cluster %u: id %u)",
+                               s->log_dest >> APIC_LOGDEST_XAPIC_SHIFT,
+                               s->log_dest & APIC_LOGDEST_XAPIC_ID);
     }
-    qemu_printf(" PPR 0x%02x\n", apic_get_ppr(s));
-}
-#else
-void x86_cpu_dump_local_apic_state(CPUState *cs, int flags)
-{
+    g_string_append_printf(buf, " PPR 0x%02x\n", apic_get_ppr(s));
+
+    return g_steal_pointer(&buf);
 }
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d87c8808f6..2bcb175da8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2201,8 +2201,10 @@ void x86_cpu_set_default_version(X86CPUVersion version);
 #define APIC_DEFAULT_ADDRESS 0xfee00000
 #define APIC_SPACE_SIZE      0x100000
 
+#ifndef CONFIG_USER_ONLY
 /* cpu-dump.c */
-void x86_cpu_dump_local_apic_state(CPUState *cs, int flags);
+GString *x86_cpu_format_local_apic_state(CPUState *cs, int flags, Error **errp);
+#endif /* !CONFIG_USER_ONLY */
 
 /* cpu.c */
 bool cpu_is_bsp(X86CPU *cpu);
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 19468c4e85..fc09f90059 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -33,6 +33,7 @@
 #include "qapi/error.h"
 #include "sev_i386.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/qapi-commands-misc.h"
 #include "hw/i386/pc.h"
 
@@ -650,23 +651,52 @@ const MonitorDef *target_monitor_defs(void)
     return monitor_defs;
 }
 
+TargetHumanReadableText *qmp_x_query_lapic(int64_t apicid,
+                                           Error **errp)
+{
+    TargetHumanReadableText *ret;
+    g_autoptr(GString) buf = NULL;
+    CPUState *cs = cpu_by_arch_id(apicid);
+
+    if (!cs) {
+        error_setg(errp, "No CPU with APIC ID %" PRId64 " available", apicid);
+        return NULL;
+    }
+
+    buf = x86_cpu_format_local_apic_state(cs, CPU_DUMP_FPU, errp);
+    if (!buf) {
+        return NULL;
+    }
+
+    ret = g_new0(TargetHumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
+
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
 {
-    CPUState *cs;
+    Error *err = NULL;
+    g_autoptr(TargetHumanReadableText) info = NULL;
+    int64_t apicid;
 
     if (qdict_haskey(qdict, "apic-id")) {
-        int id = qdict_get_try_int(qdict, "apic-id", 0);
-        cs = cpu_by_arch_id(id);
+        apicid = qdict_get_try_int(qdict, "apic-id", 0);
     } else {
-        cs = mon_get_cpu(mon);
+        CPUState *cs = mon_get_cpu(mon);
+        if (!cs) {
+            monitor_printf(mon, "No CPU available\n");
+            return;
+        }
+        apicid = cpu_get_arch_id(cs);
     }
 
-
-    if (!cs) {
-        monitor_printf(mon, "No CPU available\n");
+    info = qmp_x_query_lapic(apicid, &err);
+    if (err) {
+        error_report_err(err);
         return;
     }
-    x86_cpu_dump_local_apic_state(cs, CPU_DUMP_FPU);
+
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 SevInfo *qmp_query_sev(Error **errp)
-- 
2.31.1


