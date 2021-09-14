Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9RK-0004eW-Od
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9RJ-0004ZX-Iv
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:29:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9RF-0000jh-Jn
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0urF3G3hzjGuk0ruI9Eocq4/BIpoxZRk4EZLPdXK6JQ=;
 b=HASDb3AjPXIzB+XWBMPD4srXUHHhEjBujh5047bO6oU7cAiP4hP/OOPfeFGLk07MR6+8LC
 BtBkyDw6eVIy3HaxqOi55JYlUtlKBwBluIZg357RUIeyWVDzReP3hQvYW8F5dNGP3el0Jw
 slFZUY5ZNhGsy8ehoddeb5pWeezPF/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-Dc0RwMveOwC2SXjY5oyj2w-1; Tue, 14 Sep 2021 10:29:31 -0400
X-MC-Unique: Dc0RwMveOwC2SXjY5oyj2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15B8810151E0;
 Tue, 14 Sep 2021 14:29:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 218D65D9CA;
 Tue, 14 Sep 2021 14:29:12 +0000 (UTC)
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
Subject: [PATCH v2 25/53] target/sparc: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:14 +0100
Message-Id: <20210914142042.1655100-26-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:29:37 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/sparc/cpu.c | 85 +++++++++++++++++++++++++---------------------
 target/sparc/cpu.h |  2 +-
 2 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index da6b30ec74..9346a79239 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -597,11 +597,11 @@ void sparc_cpu_list(void)
                 "fpu_version mmu_version nwindows\n");
 }
 
-static void cpu_print_cc(FILE *f, uint32_t cc)
+static void cpu_print_cc(GString *buf, uint32_t cc)
 {
-    qemu_fprintf(f, "%c%c%c%c", cc & PSR_NEG ? 'N' : '-',
-                 cc & PSR_ZERO ? 'Z' : '-', cc & PSR_OVF ? 'V' : '-',
-                 cc & PSR_CARRY ? 'C' : '-');
+    g_string_append_printf(buf, "%c%c%c%c", cc & PSR_NEG ? 'N' : '-',
+                           cc & PSR_ZERO ? 'Z' : '-', cc & PSR_OVF ? 'V' : '-',
+                           cc & PSR_CARRY ? 'C' : '-');
 }
 
 #ifdef TARGET_SPARC64
@@ -610,34 +610,36 @@ static void cpu_print_cc(FILE *f, uint32_t cc)
 #define REGS_PER_LINE 8
 #endif
 
-void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void sparc_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
     int i, x;
 
-    qemu_fprintf(f, "pc: " TARGET_FMT_lx "  npc: " TARGET_FMT_lx "\n", env->pc,
-                 env->npc);
+    g_string_append_printf(buf,
+                           "pc: " TARGET_FMT_lx "  npc: " TARGET_FMT_lx "\n",
+                           env->pc, env->npc);
 
     for (i = 0; i < 8; i++) {
         if (i % REGS_PER_LINE == 0) {
-            qemu_fprintf(f, "%%g%d-%d:", i, i + REGS_PER_LINE - 1);
+            g_string_append_printf(buf, "%%g%d-%d:", i, i + REGS_PER_LINE - 1);
         }
-        qemu_fprintf(f, " " TARGET_FMT_lx, env->gregs[i]);
+        g_string_append_printf(buf, " " TARGET_FMT_lx, env->gregs[i]);
         if (i % REGS_PER_LINE == REGS_PER_LINE - 1) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         }
     }
     for (x = 0; x < 3; x++) {
         for (i = 0; i < 8; i++) {
             if (i % REGS_PER_LINE == 0) {
-                qemu_fprintf(f, "%%%c%d-%d: ",
+                g_string_append_printf(buf, "%%%c%d-%d: ",
                              x == 0 ? 'o' : (x == 1 ? 'l' : 'i'),
                              i, i + REGS_PER_LINE - 1);
             }
-            qemu_fprintf(f, TARGET_FMT_lx " ", env->regwptr[i + x * 8]);
+            g_string_append_printf(buf, TARGET_FMT_lx " ",
+                                   env->regwptr[i + x * 8]);
             if (i % REGS_PER_LINE == REGS_PER_LINE - 1) {
-                qemu_fprintf(f, "\n");
+                g_string_append_printf(buf, "\n");
             }
         }
     }
@@ -645,42 +647,47 @@ void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < TARGET_DPREGS; i++) {
             if ((i & 3) == 0) {
-                qemu_fprintf(f, "%%f%02d: ", i * 2);
+                g_string_append_printf(buf, "%%f%02d: ", i * 2);
             }
-            qemu_fprintf(f, " %016" PRIx64, env->fpr[i].ll);
+            g_string_append_printf(buf, " %016" PRIx64, env->fpr[i].ll);
             if ((i & 3) == 3) {
-                qemu_fprintf(f, "\n");
+                g_string_append_printf(buf, "\n");
             }
         }
     }
 
 #ifdef TARGET_SPARC64
-    qemu_fprintf(f, "pstate: %08x ccr: %02x (icc: ", env->pstate,
+    g_string_append_printf(buf, "pstate: %08x ccr: %02x (icc: ", env->pstate,
                  (unsigned)cpu_get_ccr(env));
-    cpu_print_cc(f, cpu_get_ccr(env) << PSR_CARRY_SHIFT);
-    qemu_fprintf(f, " xcc: ");
-    cpu_print_cc(f, cpu_get_ccr(env) << (PSR_CARRY_SHIFT - 4));
-    qemu_fprintf(f, ") asi: %02x tl: %d pil: %x gl: %d\n", env->asi, env->tl,
-                 env->psrpil, env->gl);
-    qemu_fprintf(f, "tbr: " TARGET_FMT_lx " hpstate: " TARGET_FMT_lx " htba: "
-                 TARGET_FMT_lx "\n", env->tbr, env->hpstate, env->htba);
-    qemu_fprintf(f, "cansave: %d canrestore: %d otherwin: %d wstate: %d "
-                 "cleanwin: %d cwp: %d\n",
-                 env->cansave, env->canrestore, env->otherwin, env->wstate,
-                 env->cleanwin, env->nwindows - 1 - env->cwp);
-    qemu_fprintf(f, "fsr: " TARGET_FMT_lx " y: " TARGET_FMT_lx " fprs: "
-                 TARGET_FMT_lx "\n", env->fsr, env->y, env->fprs);
+    cpu_print_cc(buf, cpu_get_ccr(env) << PSR_CARRY_SHIFT);
+    g_string_append_printf(buf, " xcc: ");
+    cpu_print_cc(buf, cpu_get_ccr(env) << (PSR_CARRY_SHIFT - 4));
+    g_string_append_printf(buf, ") asi: %02x tl: %d pil: %x gl: %d\n",
+                           env->asi, env->tl, env->psrpil, env->gl);
+    g_string_append_printf(buf, "tbr: " TARGET_FMT_lx " hpstate: "
+                           TARGET_FMT_lx " htba: " TARGET_FMT_lx "\n",
+                           env->tbr, env->hpstate, env->htba);
+    g_string_append_printf(buf, "cansave: %d canrestore: %d "
+                           "otherwin: %d wstate: %d "
+                           "cleanwin: %d cwp: %d\n",
+                           env->cansave, env->canrestore,
+                           env->otherwin, env->wstate,
+                           env->cleanwin, env->nwindows - 1 - env->cwp);
+    g_string_append_printf(buf, "fsr: " TARGET_FMT_lx " y: "
+                           TARGET_FMT_lx " fprs: " TARGET_FMT_lx "\n",
+                           env->fsr, env->y, env->fprs);
 
 #else
-    qemu_fprintf(f, "psr: %08x (icc: ", cpu_get_psr(env));
-    cpu_print_cc(f, cpu_get_psr(env));
-    qemu_fprintf(f, " SPE: %c%c%c) wim: %08x\n", env->psrs ? 'S' : '-',
-                 env->psrps ? 'P' : '-', env->psret ? 'E' : '-',
-                 env->wim);
-    qemu_fprintf(f, "fsr: " TARGET_FMT_lx " y: " TARGET_FMT_lx "\n",
-                 env->fsr, env->y);
+    g_string_append_printf(buf, "psr: %08x (icc: ", cpu_get_psr(env));
+    cpu_print_cc(buf, cpu_get_psr(env));
+    g_string_append_printf(buf, " SPE: %c%c%c) wim: %08x\n",
+                           env->psrs ? 'S' : '-',
+                           env->psrps ? 'P' : '-', env->psret ? 'E' : '-',
+                           env->wim);
+    g_string_append_printf(buf, "fsr: " TARGET_FMT_lx " y: " TARGET_FMT_lx "\n",
+                           env->fsr, env->y);
 #endif
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
 }
 
 static void sparc_cpu_set_pc(CPUState *cs, vaddr value)
@@ -889,7 +896,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
     cc->has_work = sparc_cpu_has_work;
-    cc->dump_state = sparc_cpu_dump_state;
+    cc->format_state = sparc_cpu_format_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
 #endif
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index ff8ae73002..65a01a7884 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -571,7 +571,7 @@ extern const VMStateDescription vmstate_sparc_cpu;
 #endif
 
 void sparc_cpu_do_interrupt(CPUState *cpu);
-void sparc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void sparc_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-- 
2.31.1


