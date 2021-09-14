Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9WZ-0004hG-Lh
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9WX-0004dI-CJ
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:35:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9WV-0004VQ-A6
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eytxsOj3cJWedkTLYFQf30aw8CYCDUwdC6UE6kvmYNI=;
 b=Wn5iBHqOeCLNfcvWB0+hc9Nil4Z+TCBQYw1Hkav3y1BNelx0eSq6Tp+6oMGJMQNVFUXJL0
 nKjQvLaAXZpSvguRSN4ANLeL4fGO/otsyQJ3kaoa+dP2DL0jJm1q6U7PLQ9dsjzRpYzrXh
 N4PYF3SIDftfY/wGH/3WrUytDP1+lqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-WrwCVSFUMpKehRjjLzk-bQ-1; Tue, 14 Sep 2021 10:34:57 -0400
X-MC-Unique: WrwCVSFUMpKehRjjLzk-bQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 862DE8145EF;
 Tue, 14 Sep 2021 14:34:53 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 327825D9CA;
 Tue, 14 Sep 2021 14:34:33 +0000 (UTC)
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
Subject: [PATCH v2 47/53] target/sh4: convert to use format_tlb callback
Date: Tue, 14 Sep 2021 15:20:36 +0100
Message-Id: <20210914142042.1655100-48-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:35:01 -0000

Change the "info tlb" implementation to use the format_tlb callback.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/sh4/cpu.c     |  3 +++
 target/sh4/cpu.h     |  1 +
 target/sh4/monitor.c | 48 +++++++++++++++++++++++++++-----------------
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 0ac881d6af..0e49755b2a 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -260,6 +260,9 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
     cc->format_state = superh_cpu_format_state;
+#ifndef CONFIG_USER_ONLY
+    cc->format_tlb = superh_cpu_format_tlb;
+#endif
     cc->set_pc = superh_cpu_set_pc;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 6940ca417a..7c139f561c 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -207,6 +207,7 @@ struct SuperHCPU {
 void superh_cpu_do_interrupt(CPUState *cpu);
 bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void superh_cpu_format_state(CPUState *cpu, GString *buf, int flags);
+void superh_cpu_format_tlb(CPUState *cpu, GString *buf);
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/sh4/monitor.c b/target/sh4/monitor.c
index 2da6a5426e..5ccb95af93 100644
--- a/target/sh4/monitor.c
+++ b/target/sh4/monitor.c
@@ -27,32 +27,44 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 
-static void print_tlb(Monitor *mon, int idx, tlb_t *tlb)
+static void print_tlb(GString *buf, int idx, tlb_t *tlb)
 {
-    monitor_printf(mon, " tlb%i:\t"
-                   "asid=%hhu vpn=%x\tppn=%x\tsz=%hhu size=%u\t"
-                   "v=%hhu shared=%hhu cached=%hhu prot=%hhu "
-                   "dirty=%hhu writethrough=%hhu\n",
-                   idx,
-                   tlb->asid, tlb->vpn, tlb->ppn, tlb->sz, tlb->size,
-                   tlb->v, tlb->sh, tlb->c, tlb->pr,
-                   tlb->d, tlb->wt);
+    g_string_append_printf(buf,  " tlb%i:\t"
+                           "asid=%hhu vpn=%x\tppn=%x\tsz=%hhu size=%u\t"
+                           "v=%hhu shared=%hhu cached=%hhu prot=%hhu "
+                           "dirty=%hhu writethrough=%hhu\n",
+                           idx,
+                           tlb->asid, tlb->vpn, tlb->ppn, tlb->sz, tlb->size,
+                           tlb->v, tlb->sh, tlb->c, tlb->pr,
+                           tlb->d, tlb->wt);
+}
+
+void superh_cpu_format_tlb(CPUState *cpu, GString *buf)
+{
+    CPUArchState *env = cpu->env_ptr;
+    size_t i;
+
+    g_string_append_printf(buf,  "ITLB:\n");
+    for (i = 0 ; i < ITLB_SIZE ; i++) {
+        print_tlb(buf, i, &env->itlb[i]);
+    }
+    g_string_append_printf(buf,  "UTLB:\n");
+    for (i = 0 ; i < UTLB_SIZE ; i++) {
+        print_tlb(buf, i, &env->utlb[i]);
+    }
 }
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env = mon_get_cpu_env(mon);
-    int i;
+    g_autoptr(GString) buf = g_string_new("");
+    CPUState *cpu = mon_get_cpu(mon);
 
-    if (!env) {
+    if (!cpu) {
         monitor_printf(mon, "No CPU available\n");
         return;
     }
 
-    monitor_printf (mon, "ITLB:\n");
-    for (i = 0 ; i < ITLB_SIZE ; i++)
-        print_tlb (mon, i, &env->itlb[i]);
-    monitor_printf (mon, "UTLB:\n");
-    for (i = 0 ; i < UTLB_SIZE ; i++)
-        print_tlb (mon, i, &env->utlb[i]);
+    cpu_format_tlb(cpu, buf);
+
+    monitor_printf(mon, "%s", buf->str);
 }
-- 
2.31.1


