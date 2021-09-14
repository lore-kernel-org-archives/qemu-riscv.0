Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9W9-0003NC-Dc
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9W7-0003Du-1g
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Vs-00043r-SP
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OfuNrJauBgm0uBcnOxhBp2EuyAUbXL9W+QCHdXBJ5JE=;
 b=JMsr0fK4gEbOj/BO9MBxtuDpLIJWGsWitgSz6wEzQl05ZoC74p6+ymYZET/nFgrt43AsUq
 7Krip6Pdnc9sfVSKVcG4V7iHhYP9/SiyfR6VlHoIipGpVFBE1IvGwkbvwPPukHhubcDlTM
 Et/E/M6L6ICn4jr6cbiM0E5FWF9ZkCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-H1_BhtnRMo6S6GpsQfTXTQ-1; Tue, 14 Sep 2021 10:34:16 -0400
X-MC-Unique: H1_BhtnRMo6S6GpsQfTXTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D1461808306;
 Tue, 14 Sep 2021 14:34:12 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFA4B5D9CA;
 Tue, 14 Sep 2021 14:33:52 +0000 (UTC)
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
Subject: [PATCH v2 45/53] target/nios2: convert to use format_tlb callback
Date: Tue, 14 Sep 2021 15:20:34 +0100
Message-Id: <20210914142042.1655100-46-berrange@redhat.com>
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
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 14 Sep 2021 14:34:35 -0000

Change the "info tlb" implementation to use the format_tlb callback.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/nios2/cpu.c     |  3 +++
 target/nios2/cpu.h     |  2 +-
 target/nios2/mmu.c     | 37 +++++++++++++++++++------------------
 target/nios2/monitor.c | 12 ++++++++++--
 4 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index cbf15fb1c9..60162ee692 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -242,6 +242,9 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
     cc->format_state = nios2_cpu_format_state;
+#ifndef CONFIG_USER_ONLY
+    cc->format_tlb = nios2_cpu_format_tlb;
+#endif
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 3b16cd1f3c..1167872bd9 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -194,8 +194,8 @@ struct Nios2CPU {
 void nios2_tcg_init(void);
 void nios2_cpu_do_interrupt(CPUState *cs);
 int cpu_nios2_signal_handler(int host_signum, void *pinfo, void *puc);
-void dump_mmu(CPUNios2State *env);
 void nios2_cpu_format_state(CPUState *cpu, GString *buf, int flags);
+void nios2_cpu_format_tlb(CPUState *cpu, GString *buf);
 hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                    MMUAccessType access_type,
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 2545c06761..1c7d3b34c3 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -252,29 +252,30 @@ void mmu_init(CPUNios2State *env)
     mmu->tlb = g_new0(Nios2TLBEntry, cpu->tlb_num_entries);
 }
 
-void dump_mmu(CPUNios2State *env)
+void nios2_cpu_format_tlb(CPUState *cpu, GString *buf)
 {
-    Nios2CPU *cpu = env_archcpu(env);
+    CPUNios2State *env = cpu->env_ptr;
+    Nios2CPU *ncpu = env_archcpu(env);
     int i;
 
-    qemu_printf("MMU: ways %d, entries %d, pid bits %d\n",
-                cpu->tlb_num_ways, cpu->tlb_num_entries,
-                cpu->pid_num_bits);
+    g_string_append_printf(buf, "MMU: ways %d, entries %d, pid bits %d\n",
+                           ncpu->tlb_num_ways, ncpu->tlb_num_entries,
+                           ncpu->pid_num_bits);
 
-    for (i = 0; i < cpu->tlb_num_entries; i++) {
+    for (i = 0; i < ncpu->tlb_num_entries; i++) {
         Nios2TLBEntry *entry = &env->mmu.tlb[i];
-        qemu_printf("TLB[%d] = %08X %08X %c VPN %05X "
-                    "PID %02X %c PFN %05X %c%c%c%c\n",
-                    i, entry->tag, entry->data,
-                    (entry->tag & (1 << 10)) ? 'V' : '-',
-                    entry->tag >> 12,
-                    entry->tag & ((1 << cpu->pid_num_bits) - 1),
-                    (entry->tag & (1 << 11)) ? 'G' : '-',
-                    entry->data & CR_TLBACC_PFN_MASK,
-                    (entry->data & CR_TLBACC_C) ? 'C' : '-',
-                    (entry->data & CR_TLBACC_R) ? 'R' : '-',
-                    (entry->data & CR_TLBACC_W) ? 'W' : '-',
-                    (entry->data & CR_TLBACC_X) ? 'X' : '-');
+        g_string_append_printf(buf, "TLB[%d] = %08X %08X %c VPN %05X "
+                               "PID %02X %c PFN %05X %c%c%c%c\n",
+                               i, entry->tag, entry->data,
+                               (entry->tag & (1 << 10)) ? 'V' : '-',
+                               entry->tag >> 12,
+                               entry->tag & ((1 << ncpu->pid_num_bits) - 1),
+                               (entry->tag & (1 << 11)) ? 'G' : '-',
+                               entry->data & CR_TLBACC_PFN_MASK,
+                               (entry->data & CR_TLBACC_C) ? 'C' : '-',
+                               (entry->data & CR_TLBACC_R) ? 'R' : '-',
+                               (entry->data & CR_TLBACC_W) ? 'W' : '-',
+                               (entry->data & CR_TLBACC_X) ? 'X' : '-');
     }
 }
 
diff --git a/target/nios2/monitor.c b/target/nios2/monitor.c
index 0152dec3fa..99d35e8ef1 100644
--- a/target/nios2/monitor.c
+++ b/target/nios2/monitor.c
@@ -29,7 +29,15 @@
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env1 = mon_get_cpu_env(mon);
+    g_autoptr(GString) buf = g_string_new("");
+    CPUState *cpu = mon_get_cpu(mon);
 
-    dump_mmu(env1);
+    if (!cpu) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+
+    cpu_format_tlb(cpu, buf);
+
+    monitor_printf(mon, "%s", buf->str);
 }
-- 
2.31.1


