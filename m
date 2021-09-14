Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9XP-0006R6-26
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9XH-0006Md-5y
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9XC-0004zE-JT
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNQqtlu9cXciZ4eC5qFV8TN1URWtj6rpxIYVyS3g23o=;
 b=TqOqhtfbbcPYGDHo8IcAohf+ca1nxFsetxIGIKVK2tDos/CGSALwBCRR3+fjbQBQJFC8vm
 Pgqk/udsGC26bcl2VQW4dQK3u5MhKWah3TE1liKS7qmWaAKxOdlVEZ05wGqlhTTboGarZZ
 8JEck+9PeSuelZQhgQoTX9CtHsDe/y4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-fIpnYYj7NZ-ipA9555vE7g-1; Tue, 14 Sep 2021 10:35:40 -0400
X-MC-Unique: fIpnYYj7NZ-ipA9555vE7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EC2B800FF4;
 Tue, 14 Sep 2021 14:35:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6E105D9CA;
 Tue, 14 Sep 2021 14:35:14 +0000 (UTC)
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
Subject: [PATCH v2 49/53] target/xtensa: convert to use format_tlb callback
Date: Tue, 14 Sep 2021 15:20:38 +0100
Message-Id: <20210914142042.1655100-50-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:35:49 -0000

Change the "info tlb" implementation to use the format_tlb callback.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/xtensa/cpu.h        |   2 +-
 target/xtensa/mmu_helper.c | 126 +++++++++++++++++++++----------------
 target/xtensa/monitor.c    |  10 ++-
 3 files changed, 79 insertions(+), 59 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 97cd6892df..8c82994826 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -573,6 +573,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
 void xtensa_cpu_format_state(CPUState *cpu, GString *buf, int flags);
+void xtensa_cpu_format_tlb(CPUState *cpu, GString *buf);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
                        unsigned *n_regs, unsigned *n_core_regs);
@@ -678,7 +679,6 @@ int xtensa_get_physical_addr(CPUXtensaState *env, bool update_tlb,
         uint32_t vaddr, int is_write, int mmu_idx,
         uint32_t *paddr, uint32_t *page_size, unsigned *access);
 void reset_mmu(CPUXtensaState *env);
-void dump_mmu(CPUXtensaState *env);
 
 static inline MemoryRegion *xtensa_get_er_region(CPUXtensaState *env)
 {
diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
index b01ff9399a..d499255984 100644
--- a/target/xtensa/mmu_helper.c
+++ b/target/xtensa/mmu_helper.c
@@ -1055,7 +1055,7 @@ int xtensa_get_physical_addr(CPUXtensaState *env, bool update_tlb,
     }
 }
 
-static void dump_tlb(CPUXtensaState *env, bool dtlb)
+static void dump_tlb(CPUXtensaState *env, bool dtlb, GString *buf)
 {
     unsigned wi, ei;
     const xtensa_tlb *conf =
@@ -1094,34 +1094,40 @@ static void dump_tlb(CPUXtensaState *env, bool dtlb)
 
                 if (print_header) {
                     print_header = false;
-                    qemu_printf("Way %u (%d %s)\n", wi, sz, sz_text);
-                    qemu_printf("\tVaddr       Paddr       ASID  Attr RWX Cache\n"
-                                "\t----------  ----------  ----  ---- --- -------\n");
+                    g_string_append_printf(buf, "Way %u (%d %s)\n",
+                                           wi, sz, sz_text);
+                    g_string_append_printf(buf, "\tVaddr       Paddr       "
+                                           "ASID  Attr RWX Cache\n"
+                                           "\t----------  ----------  ----  "
+                                           "---- --- -------\n");
                 }
-                qemu_printf("\t0x%08x  0x%08x  0x%02x  0x%02x %c%c%c %-7s\n",
-                            entry->vaddr,
-                            entry->paddr,
-                            entry->asid,
-                            entry->attr,
-                            (access & PAGE_READ) ? 'R' : '-',
-                            (access & PAGE_WRITE) ? 'W' : '-',
-                            (access & PAGE_EXEC) ? 'X' : '-',
-                            cache_text[cache_idx] ?
-                            cache_text[cache_idx] : "Invalid");
+                g_string_append_printf(buf, "\t0x%08x  0x%08x  0x%02x  "
+                                       "0x%02x %c%c%c %-7s\n",
+                                       entry->vaddr,
+                                       entry->paddr,
+                                       entry->asid,
+                                       entry->attr,
+                                       (access & PAGE_READ) ? 'R' : '-',
+                                       (access & PAGE_WRITE) ? 'W' : '-',
+                                       (access & PAGE_EXEC) ? 'X' : '-',
+                                       cache_text[cache_idx] ?
+                                       cache_text[cache_idx] : "Invalid");
             }
         }
     }
 }
 
 static void dump_mpu(CPUXtensaState *env,
-                     const xtensa_mpu_entry *entry, unsigned n)
+                     const xtensa_mpu_entry *entry, unsigned n, GString *buf)
 {
     unsigned i;
 
-    qemu_printf("\t%s  Vaddr       Attr        Ring0  Ring1  System Type    CPU cache\n"
-                "\t%s  ----------  ----------  -----  -----  -------------  ---------\n",
-                env ? "En" : "  ",
-                env ? "--" : "  ");
+    g_string_append_printf(buf, "\t%s  Vaddr       Attr        "
+                           "Ring0  Ring1  System Type    CPU cache\n"
+                           "\t%s  ----------  ----------  -----  -----  "
+                           "-------------  ---------\n",
+                           env ? "En" : "  ",
+                           env ? "--" : "  ");
 
     for (i = 0; i < n; ++i) {
         uint32_t attr = entry[i].attr;
@@ -1130,63 +1136,73 @@ static void dump_mpu(CPUXtensaState *env,
         unsigned type = mpu_attr_to_type(attr);
         char cpu_cache = (type & XTENSA_MPU_TYPE_CPU_CACHE) ? '-' : ' ';
 
-        qemu_printf("\t %c  0x%08x  0x%08x   %c%c%c    %c%c%c   ",
-                    env ?
-                    ((env->sregs[MPUENB] & (1u << i)) ? '+' : '-') : ' ',
-                    entry[i].vaddr, attr,
-                    (access0 & PAGE_READ) ? 'R' : '-',
-                    (access0 & PAGE_WRITE) ? 'W' : '-',
-                    (access0 & PAGE_EXEC) ? 'X' : '-',
-                    (access1 & PAGE_READ) ? 'R' : '-',
-                    (access1 & PAGE_WRITE) ? 'W' : '-',
-                    (access1 & PAGE_EXEC) ? 'X' : '-');
+        g_string_append_printf(buf, "\t %c  0x%08x  0x%08x   "
+                               "%c%c%c    %c%c%c   ",
+                               env ? ((env->sregs[MPUENB] & (1u << i)) ?
+                                      '+' : '-') : ' ',
+                               entry[i].vaddr, attr,
+                               (access0 & PAGE_READ) ? 'R' : '-',
+                               (access0 & PAGE_WRITE) ? 'W' : '-',
+                               (access0 & PAGE_EXEC) ? 'X' : '-',
+                               (access1 & PAGE_READ) ? 'R' : '-',
+                               (access1 & PAGE_WRITE) ? 'W' : '-',
+                               (access1 & PAGE_EXEC) ? 'X' : '-');
 
         switch (type & XTENSA_MPU_SYSTEM_TYPE_MASK) {
         case XTENSA_MPU_SYSTEM_TYPE_DEVICE:
-            qemu_printf("Device %cB %3s\n",
-                        (type & XTENSA_MPU_TYPE_B) ? ' ' : 'n',
-                        (type & XTENSA_MPU_TYPE_INT) ? "int" : "");
+            g_string_append_printf(buf, "Device %cB %3s\n",
+                                   (type & XTENSA_MPU_TYPE_B) ? ' ' : 'n',
+                                   (type & XTENSA_MPU_TYPE_INT) ? "int" : "");
             break;
         case XTENSA_MPU_SYSTEM_TYPE_NC:
-            qemu_printf("Sys NC %cB      %c%c%c\n",
-                        (type & XTENSA_MPU_TYPE_B) ? ' ' : 'n',
-                        (type & XTENSA_MPU_TYPE_CPU_R) ? 'r' : cpu_cache,
-                        (type & XTENSA_MPU_TYPE_CPU_W) ? 'w' : cpu_cache,
-                        (type & XTENSA_MPU_TYPE_CPU_C) ? 'c' : cpu_cache);
+            g_string_append_printf(buf, "Sys NC %cB      %c%c%c\n",
+                                   (type & XTENSA_MPU_TYPE_B) ? ' ' : 'n',
+                                   (type & XTENSA_MPU_TYPE_CPU_R) ?
+                                   'r' : cpu_cache,
+                                   (type & XTENSA_MPU_TYPE_CPU_W) ?
+                                   'w' : cpu_cache,
+                                   (type & XTENSA_MPU_TYPE_CPU_C) ?
+                                   'c' : cpu_cache);
             break;
         case XTENSA_MPU_SYSTEM_TYPE_C:
-            qemu_printf("Sys  C %c%c%c     %c%c%c\n",
-                        (type & XTENSA_MPU_TYPE_SYS_R) ? 'R' : '-',
-                        (type & XTENSA_MPU_TYPE_SYS_W) ? 'W' : '-',
-                        (type & XTENSA_MPU_TYPE_SYS_C) ? 'C' : '-',
-                        (type & XTENSA_MPU_TYPE_CPU_R) ? 'r' : cpu_cache,
-                        (type & XTENSA_MPU_TYPE_CPU_W) ? 'w' : cpu_cache,
-                        (type & XTENSA_MPU_TYPE_CPU_C) ? 'c' : cpu_cache);
+            g_string_append_printf(buf, "Sys  C %c%c%c     %c%c%c\n",
+                                   (type & XTENSA_MPU_TYPE_SYS_R) ? 'R' : '-',
+                                   (type & XTENSA_MPU_TYPE_SYS_W) ? 'W' : '-',
+                                   (type & XTENSA_MPU_TYPE_SYS_C) ? 'C' : '-',
+                                   (type & XTENSA_MPU_TYPE_CPU_R) ?
+                                   'r' : cpu_cache,
+                                   (type & XTENSA_MPU_TYPE_CPU_W) ?
+                                   'w' : cpu_cache,
+                                   (type & XTENSA_MPU_TYPE_CPU_C) ?
+                                   'c' : cpu_cache);
             break;
         default:
-            qemu_printf("Unknown\n");
+            g_string_append_printf(buf, "Unknown\n");
             break;
         }
     }
 }
 
-void dump_mmu(CPUXtensaState *env)
+void xtensa_cpu_format_tlb(CPUState *cpu, GString *buf)
 {
+    CPUXtensaState *env = cpu->env_ptr;
+
     if (xtensa_option_bits_enabled(env->config,
                 XTENSA_OPTION_BIT(XTENSA_OPTION_REGION_PROTECTION) |
                 XTENSA_OPTION_BIT(XTENSA_OPTION_REGION_TRANSLATION) |
                 XTENSA_OPTION_BIT(XTENSA_OPTION_MMU))) {
 
-        qemu_printf("ITLB:\n");
-        dump_tlb(env, false);
-        qemu_printf("\nDTLB:\n");
-        dump_tlb(env, true);
+        g_string_append_printf(buf, "ITLB:\n");
+        dump_tlb(env, false, buf);
+        g_string_append_printf(buf, "\nDTLB:\n");
+        dump_tlb(env, true, buf);
     } else if (xtensa_option_enabled(env->config, XTENSA_OPTION_MPU)) {
-        qemu_printf("Foreground map:\n");
-        dump_mpu(env, env->mpu_fg, env->config->n_mpu_fg_segments);
-        qemu_printf("\nBackground map:\n");
-        dump_mpu(NULL, env->config->mpu_bg, env->config->n_mpu_bg_segments);
+        g_string_append_printf(buf, "Foreground map:\n");
+        dump_mpu(env, env->mpu_fg, env->config->n_mpu_fg_segments, buf);
+        g_string_append_printf(buf, "\nBackground map:\n");
+        dump_mpu(NULL, env->config->mpu_bg,
+                 env->config->n_mpu_bg_segments, buf);
     } else {
-        qemu_printf("No TLB for this CPU core\n");
+        g_string_append_printf(buf, "No TLB for this CPU core\n");
     }
 }
diff --git a/target/xtensa/monitor.c b/target/xtensa/monitor.c
index fbf60d5553..99d35e8ef1 100644
--- a/target/xtensa/monitor.c
+++ b/target/xtensa/monitor.c
@@ -29,11 +29,15 @@
 
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
+
+    cpu_format_tlb(cpu, buf);
+
+    monitor_printf(mon, "%s", buf->str);
 }
-- 
2.31.1


