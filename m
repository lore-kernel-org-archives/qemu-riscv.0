Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Wu-0005kN-Sz
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Ws-0005dX-PQ
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Wq-0004ix-1Y
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rB6piZ9LgrjrkZJSg8goTT4uIcuL7G9qxeyUG5U6r7c=;
 b=P0/FXrdWBtzqDfPF9mwULR+oeEbtcv8caATnFzPYzQ1xs8uQM3A1AWvT4sjuxdDguAddHk
 spYY2vR3tWOqS8mkKkqLqf6dXZIT1zNnuQA0esC602/7OdQ1rZ4oLgB0jfEs0TF901hB/H
 oGowWx77UsEJEwb4y2JqmGHCBv+O3z4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-g2SglZttN3mZfmf5T0k0wg-1; Tue, 14 Sep 2021 10:35:18 -0400
X-MC-Unique: g2SglZttN3mZfmf5T0k0wg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 695FA824FA7;
 Tue, 14 Sep 2021 14:35:14 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB3CA5D9CA;
 Tue, 14 Sep 2021 14:34:53 +0000 (UTC)
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
Subject: [PATCH v2 48/53] target/sparc: convert to use format_tlb callback
Date: Tue, 14 Sep 2021 15:20:37 +0100
Message-Id: <20210914142042.1655100-49-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:35:23 -0000

Change the "info tlb" implementation to use the format_tlb callback.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/sparc/cpu.c        |  1 +
 target/sparc/cpu.h        |  1 +
 target/sparc/mmu_helper.c | 43 ++++++++++++++++++++++++---------------
 target/sparc/monitor.c    | 10 ++++++---
 4 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 9346a79239..f78ddc72b5 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -898,6 +898,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = sparc_cpu_has_work;
     cc->format_state = sparc_cpu_format_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
+    cc->format_tlb = sparc_cpu_format_tlb;
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
 #endif
     cc->set_pc = sparc_cpu_set_pc;
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 65a01a7884..233f0b3eb7 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -572,6 +572,7 @@ extern const VMStateDescription vmstate_sparc_cpu;
 
 void sparc_cpu_do_interrupt(CPUState *cpu);
 void sparc_cpu_format_state(CPUState *cpu, GString *buf, int flags);
+void sparc_cpu_format_tlb(CPUState *cpu, GString *buf);
 hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index a44473a1c7..06b16aca6a 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -371,37 +371,39 @@ target_ulong mmu_probe(CPUSPARCState *env, target_ulong address, int mmulev)
     return 0;
 }
 
-void dump_mmu(CPUSPARCState *env)
+void sparc_cpu_format_tlb(CPUState *cpu, GString *buf)
 {
-    CPUState *cs = env_cpu(env);
+    CPUSPARCState *env = cpu->env_ptr;
     target_ulong va, va1, va2;
     unsigned int n, m, o;
     hwaddr pa;
     uint32_t pde;
 
-    qemu_printf("Root ptr: " TARGET_FMT_plx ", ctx: %d\n",
-                (hwaddr)env->mmuregs[1] << 4, env->mmuregs[2]);
+    g_string_append_printf(buf, "Root ptr: " TARGET_FMT_plx ", ctx: %d\n",
+                           (hwaddr)env->mmuregs[1] << 4, env->mmuregs[2]);
     for (n = 0, va = 0; n < 256; n++, va += 16 * 1024 * 1024) {
         pde = mmu_probe(env, va, 2);
         if (pde) {
-            pa = cpu_get_phys_page_debug(cs, va);
-            qemu_printf("VA: " TARGET_FMT_lx ", PA: " TARGET_FMT_plx
-                        " PDE: " TARGET_FMT_lx "\n", va, pa, pde);
+            pa = cpu_get_phys_page_debug(cpu, va);
+            g_string_append_printf(buf, "VA: " TARGET_FMT_lx
+                                   ", PA: " TARGET_FMT_plx
+                                   " PDE: " TARGET_FMT_lx "\n", va, pa, pde);
             for (m = 0, va1 = va; m < 64; m++, va1 += 256 * 1024) {
                 pde = mmu_probe(env, va1, 1);
                 if (pde) {
-                    pa = cpu_get_phys_page_debug(cs, va1);
-                    qemu_printf(" VA: " TARGET_FMT_lx ", PA: "
-                                TARGET_FMT_plx " PDE: " TARGET_FMT_lx "\n",
-                                va1, pa, pde);
+                    pa = cpu_get_phys_page_debug(cpu, va1);
+                    g_string_append_printf(buf, " VA: " TARGET_FMT_lx
+                                           ", PA: " TARGET_FMT_plx
+                                           " PDE: " TARGET_FMT_lx "\n",
+                                           va1, pa, pde);
                     for (o = 0, va2 = va1; o < 64; o++, va2 += 4 * 1024) {
                         pde = mmu_probe(env, va2, 0);
                         if (pde) {
-                            pa = cpu_get_phys_page_debug(cs, va2);
-                            qemu_printf("  VA: " TARGET_FMT_lx ", PA: "
-                                        TARGET_FMT_plx " PTE: "
-                                        TARGET_FMT_lx "\n",
-                                        va2, pa, pde);
+                            pa = cpu_get_phys_page_debug(cpu, va2);
+                            g_string_append_printf(buf, "  VA: " TARGET_FMT_lx
+                                                   ", PA: " TARGET_FMT_plx
+                                                   " PTE: " TARGET_FMT_lx "\n",
+                                                   va2, pa, pde);
                         }
                     }
                 }
@@ -410,6 +412,15 @@ void dump_mmu(CPUSPARCState *env)
     }
 }
 
+void dump_mmu(CPUSPARCState *env)
+{
+    CPUState *cs = env_cpu(env);
+    g_autoptr(GString) buf = g_string_new("");
+
+    sparc_cpu_format_tlb(cs, buf);
+    qemu_printf("%s", buf->str);
+}
+
 /* Gdb expects all registers windows to be flushed in ram. This function handles
  * reads (and only reads) in stack frames as if windows were flushed. We assume
  * that the sparc ABI is followed.
diff --git a/target/sparc/monitor.c b/target/sparc/monitor.c
index 318413686a..cc7fe74e3e 100644
--- a/target/sparc/monitor.c
+++ b/target/sparc/monitor.c
@@ -30,13 +30,17 @@
 
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
 
 #ifndef TARGET_SPARC64
-- 
2.31.1


