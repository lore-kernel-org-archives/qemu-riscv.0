Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9S0-0006XA-IR
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Rw-0006Q5-Cz
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Rs-0001BR-Fy
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KXlBSxjSPGX8vdep8ZUyktA0Aba3nVeAQEL1Cpyva4=;
 b=SzVSKb+pRrRb7O5F4dihAupJwj8zfqIH84drrhwoswW57dD5FleF7Byusxk84gBOZMEdx5
 Ng1/vPOtTrzcqywufN1maLVqWsPQEPA9nDLLI2RqxlkFT/mgEbjaqDNZ2yQ93l1t9prA8Q
 pQnUdIqurX1cMsnChg1hSk4dBWfmnQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-S4FmMyaQPYemK64UexRJLA-1; Tue, 14 Sep 2021 10:30:05 -0400
X-MC-Unique: S4FmMyaQPYemK64UexRJLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75238800FF4;
 Tue, 14 Sep 2021 14:29:59 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B4F85D9DC;
 Tue, 14 Sep 2021 14:29:40 +0000 (UTC)
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
Subject: [PATCH v2 27/53] target/xtensa: convert to use format_state instead
 of dump_state
Date: Tue, 14 Sep 2021 15:20:16 +0100
Message-Id: <20210914142042.1655100-28-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:30:17 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/xtensa/cpu.c       |  2 +-
 target/xtensa/cpu.h       |  2 +-
 target/xtensa/translate.c | 45 ++++++++++++++++++++-------------------
 3 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 58ec3a0862..a5a416e0b3 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -216,7 +216,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = xtensa_cpu_class_by_name;
     cc->has_work = xtensa_cpu_has_work;
-    cc->dump_state = xtensa_cpu_dump_state;
+    cc->format_state = xtensa_cpu_format_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
     cc->gdb_write_register = xtensa_cpu_gdb_write_register;
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 2345cb59c7..97cd6892df 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -572,7 +572,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
-void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void xtensa_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
                        unsigned *n_regs, unsigned *n_core_regs);
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 20399d6a04..0f57d2abaf 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1325,14 +1325,14 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
     translator_loop(&xtensa_translator_ops, &dc.base, cpu, tb, max_insns);
 }
 
-void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void xtensa_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
     xtensa_isa isa = env->config->isa;
     int i, j;
 
-    qemu_fprintf(f, "PC=%08x\n\n", env->pc);
+    g_string_append_printf(buf, "PC=%08x\n\n", env->pc);
 
     for (i = j = 0; i < xtensa_isa_num_sysregs(isa); ++i) {
         const uint32_t *reg =
@@ -1340,55 +1340,56 @@ void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         int regno = xtensa_sysreg_number(isa, i);
 
         if (regno >= 0) {
-            qemu_fprintf(f, "%12s=%08x%c",
-                         xtensa_sysreg_name(isa, i),
-                         reg[regno],
-                         (j++ % 4) == 3 ? '\n' : ' ');
+            g_string_append_printf(buf, "%12s=%08x%c",
+                                   xtensa_sysreg_name(isa, i),
+                                   reg[regno],
+                                   (j++ % 4) == 3 ? '\n' : ' ');
         }
     }
 
-    qemu_fprintf(f, (j % 4) == 0 ? "\n" : "\n\n");
+    g_string_append_printf(buf, (j % 4) == 0 ? "\n" : "\n\n");
 
     for (i = 0; i < 16; ++i) {
-        qemu_fprintf(f, " A%02d=%08x%c",
-                     i, env->regs[i], (i % 4) == 3 ? '\n' : ' ');
+        g_string_append_printf(buf, " A%02d=%08x%c",
+                               i, env->regs[i], (i % 4) == 3 ? '\n' : ' ');
     }
 
     xtensa_sync_phys_from_window(env);
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
 
     for (i = 0; i < env->config->nareg; ++i) {
-        qemu_fprintf(f, "AR%02d=%08x ", i, env->phys_regs[i]);
+        g_string_append_printf(buf, "AR%02d=%08x ", i, env->phys_regs[i]);
         if (i % 4 == 3) {
             bool ws = (env->sregs[WINDOW_START] & (1 << (i / 4))) != 0;
             bool cw = env->sregs[WINDOW_BASE] == i / 4;
 
-            qemu_fprintf(f, "%c%c\n", ws ? '<' : ' ', cw ? '=' : ' ');
+            g_string_append_printf(buf, "%c%c\n",
+                                   ws ? '<' : ' ', cw ? '=' : ' ');
         }
     }
 
     if ((flags & CPU_DUMP_FPU) &&
         xtensa_option_enabled(env->config, XTENSA_OPTION_FP_COPROCESSOR)) {
-        qemu_fprintf(f, "\n");
+        g_string_append_printf(buf, "\n");
 
         for (i = 0; i < 16; ++i) {
-            qemu_fprintf(f, "F%02d=%08x (%-+15.8e)%c", i,
-                         float32_val(env->fregs[i].f32[FP_F32_LOW]),
-                         *(float *)(env->fregs[i].f32 + FP_F32_LOW),
-                         (i % 2) == 1 ? '\n' : ' ');
+            g_string_append_printf(buf, "F%02d=%08x (%-+15.8e)%c", i,
+                                   float32_val(env->fregs[i].f32[FP_F32_LOW]),
+                                   *(float *)(env->fregs[i].f32 + FP_F32_LOW),
+                                   (i % 2) == 1 ? '\n' : ' ');
         }
     }
 
     if ((flags & CPU_DUMP_FPU) &&
         xtensa_option_enabled(env->config, XTENSA_OPTION_DFP_COPROCESSOR) &&
         !xtensa_option_enabled(env->config, XTENSA_OPTION_DFPU_SINGLE_ONLY)) {
-        qemu_fprintf(f, "\n");
+        g_string_append_printf(buf, "\n");
 
         for (i = 0; i < 16; ++i) {
-            qemu_fprintf(f, "F%02d=%016"PRIx64" (%-+24.16le)%c", i,
-                         float64_val(env->fregs[i].f64),
-                         *(double *)(&env->fregs[i].f64),
-                         (i % 2) == 1 ? '\n' : ' ');
+            g_string_append_printf(buf, "F%02d=%016"PRIx64" (%-+24.16le)%c", i,
+                                   float64_val(env->fregs[i].f64),
+                                   *(double *)(&env->fregs[i].f64),
+                                   (i % 2) == 1 ? '\n' : ' ');
         }
     }
 }
-- 
2.31.1


