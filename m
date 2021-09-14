Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Vc-0002eT-6B
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Va-0002ZC-Ad
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:34:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9VX-0003rW-TO
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bh9ijrtRHqw1dGWJj6Rxy56++d9ni6EtfBBE4iZ7xmU=;
 b=fFrS4A98Ex3C5KqRvMJ+iTlXBuupmQaWFnWkXTo6q59knLixjuMelyQhho85Ut4HZ0ztf/
 CsHB+Zhp3F58rNfCY3R3NgV5OX1HxoGjvI+hcMq9wmE01CC3Sxi/Ior7hfH1CrbEiOw2bS
 poTxR20A1Et53JmNOQsU8IG/5zke2tM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-qAFyWR9zMeGO5aywzna6tA-1; Tue, 14 Sep 2021 10:33:56 -0400
X-MC-Unique: qAFyWR9zMeGO5aywzna6tA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7A56BAF80;
 Tue, 14 Sep 2021 14:33:52 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 864FC5D9CA;
 Tue, 14 Sep 2021 14:33:41 +0000 (UTC)
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
Subject: [PATCH v2 44/53] target/m68k: convert to use format_tlb callback
Date: Tue, 14 Sep 2021 15:20:33 +0100
Message-Id: <20210914142042.1655100-45-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:34:02 -0000

Change the "info tlb" implementation to use the format_tlb callback.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/m68k/cpu.c     |   3 +
 target/m68k/cpu.h     |   3 +-
 target/m68k/helper.c  | 132 ++++++++++++++++++++++--------------------
 target/m68k/monitor.c |  11 +++-
 4 files changed, 82 insertions(+), 67 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 4ccf572a68..8f143eb540 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -537,6 +537,9 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
     cc->format_state = m68k_cpu_format_state;
+#ifndef CONFIG_USER_ONLY
+    cc->format_tlb = m68k_cpu_format_tlb;
+#endif
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index b0641f6d0d..f2d777a1ba 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -169,6 +169,7 @@ struct M68kCPU {
 void m68k_cpu_do_interrupt(CPUState *cpu);
 bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void m68k_cpu_format_state(CPUState *cpu, GString *buf, int flags);
+void m68k_cpu_format_tlb(CPUState *cpu, GString *buf);
 hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
@@ -612,6 +613,4 @@ static inline void cpu_get_tb_cpu_state(CPUM68KState *env, target_ulong *pc,
     }
 }
 
-void dump_mmu(CPUM68KState *env);
-
 #endif
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 137a3e1a3d..050a27d21c 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -25,6 +25,7 @@
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "qemu/qemu-print.h"
+#include "qapi/error.h"
 
 #define SIGNBIT (1u << 31)
 
@@ -483,27 +484,28 @@ void m68k_switch_sp(CPUM68KState *env)
 /* MMU: 68040 only */
 
 static void print_address_zone(uint32_t logical, uint32_t physical,
-                               uint32_t size, int attr)
+                               uint32_t size, int attr, GString *buf)
 {
-    qemu_printf("%08x - %08x -> %08x - %08x %c ",
-                logical, logical + size - 1,
-                physical, physical + size - 1,
-                attr & 4 ? 'W' : '-');
+    g_string_append_printf(buf, "%08x - %08x -> %08x - %08x %c ",
+                           logical, logical + size - 1,
+                           physical, physical + size - 1,
+                           attr & 4 ? 'W' : '-');
     size >>= 10;
     if (size < 1024) {
-        qemu_printf("(%d KiB)\n", size);
+        g_string_append_printf(buf, "(%d KiB)\n", size);
     } else {
         size >>= 10;
         if (size < 1024) {
-            qemu_printf("(%d MiB)\n", size);
+            g_string_append_printf(buf, "(%d MiB)\n", size);
         } else {
             size >>= 10;
-            qemu_printf("(%d GiB)\n", size);
+            g_string_append_printf(buf, "(%d GiB)\n", size);
         }
     }
 }
 
-static void dump_address_map(CPUM68KState *env, uint32_t root_pointer)
+static void dump_address_map(CPUM68KState *env, uint32_t root_pointer,
+                             GString *buf)
 {
     int i, j, k;
     int tic_size, tic_shift;
@@ -573,7 +575,8 @@ static void dump_address_map(CPUM68KState *env, uint32_t root_pointer)
                         size = last_logical + (1 << tic_shift) -
                                first_logical;
                         print_address_zone(first_logical,
-                                           first_physical, size, last_attr);
+                                           first_physical, size, last_attr,
+                                           buf);
                     }
                     first_logical = logical;
                     first_physical = physical;
@@ -583,125 +586,130 @@ static void dump_address_map(CPUM68KState *env, uint32_t root_pointer)
     }
     if (first_logical != logical || (attr & 4) != (last_attr & 4)) {
         size = logical + (1 << tic_shift) - first_logical;
-        print_address_zone(first_logical, first_physical, size, last_attr);
+        print_address_zone(first_logical, first_physical, size, last_attr, buf);
     }
 }
 
 #define DUMP_CACHEFLAGS(a) \
     switch (a & M68K_DESC_CACHEMODE) { \
     case M68K_DESC_CM_WRTHRU: /* cachable, write-through */ \
-        qemu_printf("T"); \
+        g_string_append_printf(buf, "T"); \
         break; \
     case M68K_DESC_CM_COPYBK: /* cachable, copyback */ \
-        qemu_printf("C"); \
+        g_string_append_printf(buf, "C"); \
         break; \
     case M68K_DESC_CM_SERIAL: /* noncachable, serialized */ \
-        qemu_printf("S"); \
+        g_string_append_printf(buf, "S"); \
         break; \
     case M68K_DESC_CM_NCACHE: /* noncachable */ \
-        qemu_printf("N"); \
+        g_string_append_printf(buf, "N"); \
         break; \
     }
 
-static void dump_ttr(uint32_t ttr)
+static void dump_ttr(uint32_t ttr, GString *buf)
 {
     if ((ttr & M68K_TTR_ENABLED) == 0) {
-        qemu_printf("disabled\n");
+        g_string_append_printf(buf, "disabled\n");
         return;
     }
-    qemu_printf("Base: 0x%08x Mask: 0x%08x Control: ",
-                ttr & M68K_TTR_ADDR_BASE,
-                (ttr & M68K_TTR_ADDR_MASK) << M68K_TTR_ADDR_MASK_SHIFT);
+    g_string_append_printf(buf, "Base: 0x%08x Mask: 0x%08x Control: ",
+                           ttr & M68K_TTR_ADDR_BASE,
+                           (ttr & M68K_TTR_ADDR_MASK) <<
+                           M68K_TTR_ADDR_MASK_SHIFT);
     switch (ttr & M68K_TTR_SFIELD) {
     case M68K_TTR_SFIELD_USER:
-        qemu_printf("U");
+        g_string_append_printf(buf, "U");
         break;
     case M68K_TTR_SFIELD_SUPER:
-        qemu_printf("S");
+        g_string_append_printf(buf, "S");
         break;
     default:
-        qemu_printf("*");
+        g_string_append_printf(buf, "*");
         break;
     }
     DUMP_CACHEFLAGS(ttr);
     if (ttr & M68K_DESC_WRITEPROT) {
-        qemu_printf("R");
+        g_string_append_printf(buf, "R");
     } else {
-        qemu_printf("W");
+        g_string_append_printf(buf, "W");
     }
-    qemu_printf(" U: %d\n", (ttr & M68K_DESC_USERATTR) >>
-                               M68K_DESC_USERATTR_SHIFT);
+    g_string_append_printf(buf, " U: %d\n", (ttr & M68K_DESC_USERATTR) >>
+                           M68K_DESC_USERATTR_SHIFT);
 }
 
-void dump_mmu(CPUM68KState *env)
+
+void m68k_cpu_format_tlb(CPUState *cpu, GString *buf)
 {
+    CPUM68KState *env = cpu->env_ptr;
+
     if ((env->mmu.tcr & M68K_TCR_ENABLED) == 0) {
-        qemu_printf("Translation disabled\n");
+        g_string_append_printf(buf, "Translation disabled\n");
         return;
     }
-    qemu_printf("Page Size: ");
+    g_string_append_printf(buf, "Page Size: ");
     if (env->mmu.tcr & M68K_TCR_PAGE_8K) {
-        qemu_printf("8kB\n");
+        g_string_append_printf(buf, "8kB\n");
     } else {
-        qemu_printf("4kB\n");
+        g_string_append_printf(buf, "4kB\n");
     }
 
-    qemu_printf("MMUSR: ");
+    g_string_append_printf(buf, "MMUSR: ");
     if (env->mmu.mmusr & M68K_MMU_B_040) {
-        qemu_printf("BUS ERROR\n");
+        g_string_append_printf(buf, "BUS ERROR\n");
     } else {
-        qemu_printf("Phy=%08x Flags: ", env->mmu.mmusr & 0xfffff000);
+        g_string_append_printf(buf, "Phy=%08x Flags: ",
+                               env->mmu.mmusr & 0xfffff000);
         /* flags found on the page descriptor */
         if (env->mmu.mmusr & M68K_MMU_G_040) {
-            qemu_printf("G"); /* Global */
+            g_string_append_printf(buf, "G"); /* Global */
         } else {
-            qemu_printf(".");
+            g_string_append_printf(buf, ".");
         }
         if (env->mmu.mmusr & M68K_MMU_S_040) {
-            qemu_printf("S"); /* Supervisor */
+            g_string_append_printf(buf, "S"); /* Supervisor */
         } else {
-            qemu_printf(".");
+            g_string_append_printf(buf, ".");
         }
         if (env->mmu.mmusr & M68K_MMU_M_040) {
-            qemu_printf("M"); /* Modified */
+            g_string_append_printf(buf, "M"); /* Modified */
         } else {
-            qemu_printf(".");
+            g_string_append_printf(buf, ".");
         }
         if (env->mmu.mmusr & M68K_MMU_WP_040) {
-            qemu_printf("W"); /* Write protect */
+            g_string_append_printf(buf, "W"); /* Write protect */
         } else {
-            qemu_printf(".");
+            g_string_append_printf(buf, ".");
         }
         if (env->mmu.mmusr & M68K_MMU_T_040) {
-            qemu_printf("T"); /* Transparent */
+            g_string_append_printf(buf, "T"); /* Transparent */
         } else {
-            qemu_printf(".");
+            g_string_append_printf(buf, ".");
         }
         if (env->mmu.mmusr & M68K_MMU_R_040) {
-            qemu_printf("R"); /* Resident */
+            g_string_append_printf(buf, "R"); /* Resident */
         } else {
-            qemu_printf(".");
+            g_string_append_printf(buf, ".");
         }
-        qemu_printf(" Cache: ");
+        g_string_append_printf(buf, " Cache: ");
         DUMP_CACHEFLAGS(env->mmu.mmusr);
-        qemu_printf(" U: %d\n", (env->mmu.mmusr >> 8) & 3);
-        qemu_printf("\n");
+        g_string_append_printf(buf, " U: %d\n", (env->mmu.mmusr >> 8) & 3);
+        g_string_append_printf(buf, "\n");
     }
 
-    qemu_printf("ITTR0: ");
-    dump_ttr(env->mmu.ttr[M68K_ITTR0]);
-    qemu_printf("ITTR1: ");
-    dump_ttr(env->mmu.ttr[M68K_ITTR1]);
-    qemu_printf("DTTR0: ");
-    dump_ttr(env->mmu.ttr[M68K_DTTR0]);
-    qemu_printf("DTTR1: ");
-    dump_ttr(env->mmu.ttr[M68K_DTTR1]);
+    g_string_append_printf(buf, "ITTR0: ");
+    dump_ttr(env->mmu.ttr[M68K_ITTR0], buf);
+    g_string_append_printf(buf, "ITTR1: ");
+    dump_ttr(env->mmu.ttr[M68K_ITTR1], buf);
+    g_string_append_printf(buf, "DTTR0: ");
+    dump_ttr(env->mmu.ttr[M68K_DTTR0], buf);
+    g_string_append_printf(buf, "DTTR1: ");
+    dump_ttr(env->mmu.ttr[M68K_DTTR1], buf);
 
-    qemu_printf("SRP: 0x%08x\n", env->mmu.srp);
-    dump_address_map(env, env->mmu.srp);
+    g_string_append_printf(buf, "SRP: 0x%08x\n", env->mmu.srp);
+    dump_address_map(env, env->mmu.srp, buf);
 
-    qemu_printf("URP: 0x%08x\n", env->mmu.urp);
-    dump_address_map(env, env->mmu.urp);
+    g_string_append_printf(buf, "URP: 0x%08x\n", env->mmu.urp);
+    dump_address_map(env, env->mmu.urp, buf);
 }
 
 static int check_TTR(uint32_t ttr, int *prot, target_ulong addr,
diff --git a/target/m68k/monitor.c b/target/m68k/monitor.c
index 2bdf6acae0..003a665246 100644
--- a/target/m68k/monitor.c
+++ b/target/m68k/monitor.c
@@ -9,17 +9,22 @@
 #include "cpu.h"
 #include "monitor/hmp-target.h"
 #include "monitor/monitor.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-machine-target.h"
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env1 = mon_get_cpu_env(mon);
+    g_autoptr(GString) buf = g_string_new("");
+    CPUState *cpu = mon_get_cpu(mon);
 
-    if (!env1) {
+    if (!cpu) {
         monitor_printf(mon, "No CPU available\n");
         return;
     }
 
-    dump_mmu(env1);
+    cpu_format_tlb(cpu, buf);
+
+    monitor_printf(mon, "%s", buf->str);
 }
 
 static const MonitorDef monitor_defs[] = {
-- 
2.31.1


