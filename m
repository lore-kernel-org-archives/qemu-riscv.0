Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9VS-0002LN-6I
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9VP-0002Fi-5O
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:33:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9VL-0003jY-3U
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/Q+2lydTjqVkGI5GLlhCmIjg5hJJ1z7UABw+pOKrT4=;
 b=YHAlNcwJVDVZDgn4VnBffEMWIB3EidlC0T9ZrxpPk3syJgdDI8+E9oIckaHM4e5A4Cj5zA
 V+Rot/YN6VdjiYHTHMMqV9/Zp+lvj0Gwrlx45wL/oNVkPd5UoMHxxgSD5pQ3YagzFaGhXB
 nHy5/GVQ2lNBC9UooYBjgjH9yNqUv/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-0fHfBnnePW2Lz4Wnvbn9wg-1; Tue, 14 Sep 2021 10:33:44 -0400
X-MC-Unique: 0fHfBnnePW2Lz4Wnvbn9wg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 375C51808304;
 Tue, 14 Sep 2021 14:33:41 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41C175D9CA;
 Tue, 14 Sep 2021 14:33:26 +0000 (UTC)
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
Subject: [PATCH v2 43/53] target/i386: convert to use format_tlb callback
Date: Tue, 14 Sep 2021 15:20:32 +0100
Message-Id: <20210914142042.1655100-44-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:33:51 -0000

Change the "info tlb" implementation to use the format_tlb callback.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/cpu.c     |   3 ++
 target/i386/cpu.h     |   1 +
 target/i386/monitor.c | 107 +++++++++++++++++++++++-------------------
 3 files changed, 63 insertions(+), 48 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0a5c6a6d19..ab86224ee2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6765,6 +6765,9 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->parse_features = x86_cpu_parse_featurestr;
     cc->has_work = x86_cpu_has_work;
     cc->format_state = x86_cpu_format_state;
+#ifndef CONFIG_USER_ONLY
+    cc->format_tlb = x86_cpu_format_tlb;
+#endif
     cc->set_pc = x86_cpu_set_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 2bcb175da8..d61eeef617 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1826,6 +1826,7 @@ void x86_cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                                 Error **errp);
 
 void x86_cpu_format_state(CPUState *cs, GString *buf, int flags);
+void x86_cpu_format_tlb(CPUState *cpu, GString *buf);
 
 hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index fc09f90059..698fbbc80b 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -54,27 +54,27 @@ static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
     return addr;
 }
 
-static void print_pte(Monitor *mon, CPUArchState *env, hwaddr addr,
-                      hwaddr pte, hwaddr mask)
+static void format_pte(GString *buf, CPUArchState *env, hwaddr addr,
+                       hwaddr pte, hwaddr mask)
 {
     addr = addr_canonical(env, addr);
 
-    monitor_printf(mon, TARGET_FMT_plx ": " TARGET_FMT_plx
-                   " %c%c%c%c%c%c%c%c%c\n",
-                   addr,
-                   pte & mask,
-                   pte & PG_NX_MASK ? 'X' : '-',
-                   pte & PG_GLOBAL_MASK ? 'G' : '-',
-                   pte & PG_PSE_MASK ? 'P' : '-',
-                   pte & PG_DIRTY_MASK ? 'D' : '-',
-                   pte & PG_ACCESSED_MASK ? 'A' : '-',
-                   pte & PG_PCD_MASK ? 'C' : '-',
-                   pte & PG_PWT_MASK ? 'T' : '-',
-                   pte & PG_USER_MASK ? 'U' : '-',
-                   pte & PG_RW_MASK ? 'W' : '-');
+    g_string_append_printf(buf, TARGET_FMT_plx ": " TARGET_FMT_plx
+                           " %c%c%c%c%c%c%c%c%c\n",
+                           addr,
+                           pte & mask,
+                           pte & PG_NX_MASK ? 'X' : '-',
+                           pte & PG_GLOBAL_MASK ? 'G' : '-',
+                           pte & PG_PSE_MASK ? 'P' : '-',
+                           pte & PG_DIRTY_MASK ? 'D' : '-',
+                           pte & PG_ACCESSED_MASK ? 'A' : '-',
+                           pte & PG_PCD_MASK ? 'C' : '-',
+                           pte & PG_PWT_MASK ? 'T' : '-',
+                           pte & PG_USER_MASK ? 'U' : '-',
+                           pte & PG_RW_MASK ? 'W' : '-');
 }
 
-static void tlb_info_32(Monitor *mon, CPUArchState *env)
+static void tlb_info_32(GString *buf, CPUArchState *env)
 {
     unsigned int l1, l2;
     uint32_t pgd, pde, pte;
@@ -86,15 +86,15 @@ static void tlb_info_32(Monitor *mon, CPUArchState *env)
         if (pde & PG_PRESENT_MASK) {
             if ((pde & PG_PSE_MASK) && (env->cr[4] & CR4_PSE_MASK)) {
                 /* 4M pages */
-                print_pte(mon, env, (l1 << 22), pde, ~((1 << 21) - 1));
+                format_pte(buf, env, (l1 << 22), pde, ~((1 << 21) - 1));
             } else {
                 for(l2 = 0; l2 < 1024; l2++) {
                     cpu_physical_memory_read((pde & ~0xfff) + l2 * 4, &pte, 4);
                     pte = le32_to_cpu(pte);
                     if (pte & PG_PRESENT_MASK) {
-                        print_pte(mon, env, (l1 << 22) + (l2 << 12),
-                                  pte & ~PG_PSE_MASK,
-                                  ~0xfff);
+                        format_pte(buf, env, (l1 << 22) + (l2 << 12),
+                                   pte & ~PG_PSE_MASK,
+                                   ~0xfff);
                     }
                 }
             }
@@ -102,7 +102,7 @@ static void tlb_info_32(Monitor *mon, CPUArchState *env)
     }
 }
 
-static void tlb_info_pae32(Monitor *mon, CPUArchState *env)
+static void tlb_info_pae32(GString *buf, CPUArchState *env)
 {
     unsigned int l1, l2, l3;
     uint64_t pdpe, pde, pte;
@@ -120,18 +120,18 @@ static void tlb_info_pae32(Monitor *mon, CPUArchState *env)
                 if (pde & PG_PRESENT_MASK) {
                     if (pde & PG_PSE_MASK) {
                         /* 2M pages with PAE, CR4.PSE is ignored */
-                        print_pte(mon, env, (l1 << 30) + (l2 << 21), pde,
-                                  ~((hwaddr)(1 << 20) - 1));
+                        format_pte(buf, env, (l1 << 30) + (l2 << 21), pde,
+                                   ~((hwaddr)(1 << 20) - 1));
                     } else {
                         pt_addr = pde & 0x3fffffffff000ULL;
                         for (l3 = 0; l3 < 512; l3++) {
                             cpu_physical_memory_read(pt_addr + l3 * 8, &pte, 8);
                             pte = le64_to_cpu(pte);
                             if (pte & PG_PRESENT_MASK) {
-                                print_pte(mon, env, (l1 << 30) + (l2 << 21)
-                                          + (l3 << 12),
-                                          pte & ~PG_PSE_MASK,
-                                          ~(hwaddr)0xfff);
+                                format_pte(buf, env, (l1 << 30) + (l2 << 21)
+                                           + (l3 << 12),
+                                           pte & ~PG_PSE_MASK,
+                                           ~(hwaddr)0xfff);
                             }
                         }
                     }
@@ -142,7 +142,7 @@ static void tlb_info_pae32(Monitor *mon, CPUArchState *env)
 }
 
 #ifdef TARGET_X86_64
-static void tlb_info_la48(Monitor *mon, CPUArchState *env,
+static void tlb_info_la48(GString *buf, CPUArchState *env,
         uint64_t l0, uint64_t pml4_addr)
 {
     uint64_t l1, l2, l3, l4;
@@ -166,8 +166,8 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env,
 
             if (pdpe & PG_PSE_MASK) {
                 /* 1G pages, CR4.PSE is ignored */
-                print_pte(mon, env, (l0 << 48) + (l1 << 39) + (l2 << 30),
-                        pdpe, 0x3ffffc0000000ULL);
+                format_pte(buf, env, (l0 << 48) + (l1 << 39) + (l2 << 30),
+                           pdpe, 0x3ffffc0000000ULL);
                 continue;
             }
 
@@ -181,8 +181,8 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env,
 
                 if (pde & PG_PSE_MASK) {
                     /* 2M pages, CR4.PSE is ignored */
-                    print_pte(mon, env, (l0 << 48) + (l1 << 39) + (l2 << 30) +
-                            (l3 << 21), pde, 0x3ffffffe00000ULL);
+                    format_pte(buf, env, (l0 << 48) + (l1 << 39) + (l2 << 30) +
+                               (l3 << 21), pde, 0x3ffffffe00000ULL);
                     continue;
                 }
 
@@ -193,9 +193,9 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env,
                             &pte, 8);
                     pte = le64_to_cpu(pte);
                     if (pte & PG_PRESENT_MASK) {
-                        print_pte(mon, env, (l0 << 48) + (l1 << 39) +
-                                (l2 << 30) + (l3 << 21) + (l4 << 12),
-                                pte & ~PG_PSE_MASK, 0x3fffffffff000ULL);
+                        format_pte(buf, env, (l0 << 48) + (l1 << 39) +
+                                   (l2 << 30) + (l3 << 21) + (l4 << 12),
+                                   pte & ~PG_PSE_MASK, 0x3fffffffff000ULL);
                     }
                 }
             }
@@ -203,7 +203,7 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env,
     }
 }
 
-static void tlb_info_la57(Monitor *mon, CPUArchState *env)
+static void tlb_info_la57(GString *buf, CPUArchState *env)
 {
     uint64_t l0;
     uint64_t pml5e;
@@ -214,44 +214,55 @@ static void tlb_info_la57(Monitor *mon, CPUArchState *env)
         cpu_physical_memory_read(pml5_addr + l0 * 8, &pml5e, 8);
         pml5e = le64_to_cpu(pml5e);
         if (pml5e & PG_PRESENT_MASK) {
-            tlb_info_la48(mon, env, l0, pml5e & 0x3fffffffff000ULL);
+            tlb_info_la48(buf, env, l0, pml5e & 0x3fffffffff000ULL);
         }
     }
 }
 #endif /* TARGET_X86_64 */
 
-void hmp_info_tlb(Monitor *mon, const QDict *qdict)
+void x86_cpu_format_tlb(CPUState *cpu, GString *buf)
 {
     CPUArchState *env;
 
-    env = mon_get_cpu_env(mon);
-    if (!env) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
+    env = cpu->env_ptr;
 
     if (!(env->cr[0] & CR0_PG_MASK)) {
-        monitor_printf(mon, "PG disabled\n");
+        g_string_append_printf(buf, "PG disabled\n");
         return;
     }
     if (env->cr[4] & CR4_PAE_MASK) {
 #ifdef TARGET_X86_64
         if (env->hflags & HF_LMA_MASK) {
             if (env->cr[4] & CR4_LA57_MASK) {
-                tlb_info_la57(mon, env);
+                tlb_info_la57(buf, env);
             } else {
-                tlb_info_la48(mon, env, 0, env->cr[3] & 0x3fffffffff000ULL);
+                tlb_info_la48(buf, env, 0, env->cr[3] & 0x3fffffffff000ULL);
             }
         } else
 #endif
         {
-            tlb_info_pae32(mon, env);
+            tlb_info_pae32(buf, env);
         }
     } else {
-        tlb_info_32(mon, env);
+        tlb_info_32(buf, env);
     }
 }
 
+void hmp_info_tlb(Monitor *mon, const QDict *qdict)
+{
+    g_autoptr(GString) buf = g_string_new("");
+    CPUState *cpu = mon_get_cpu(mon);
+
+    if (!cpu) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+
+    cpu_format_tlb(cpu, buf);
+
+    monitor_printf(mon, "%s", buf->str);
+}
+
 static void mem_print(Monitor *mon, CPUArchState *env,
                       hwaddr *pstart, int *plast_prot,
                       hwaddr end, int prot)
-- 
2.31.1


