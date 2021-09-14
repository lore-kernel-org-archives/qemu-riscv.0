Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Ow-0000k1-Ht
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Or-0000cg-1S
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9OZ-00077o-2F
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zc4GAGNd7U60rlRgQ3mzXw+JBUbl9ED6Yoj+89RgeRw=;
 b=KttHpxUWDTLzKzHVBFPcZXfifryqBZC58BjaE3ukxpMapRDrZ0kECKn4wXxkjHLTKjaf37
 7XnWoa6kyWs046h/gDRRffWV2DhA6Vtc0jbVIuY6RyBtwhoW2y9skgrQMqnVYxpZcijNlw
 tkdiQLzJtiRKJy8XwaKcqU/sKS8lSnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-626DxAEzNgqnxv_q-JvIMg-1; Tue, 14 Sep 2021 10:26:42 -0400
X-MC-Unique: 626DxAEzNgqnxv_q-JvIMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F350B835BFE;
 Tue, 14 Sep 2021 14:26:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36DE15D9CA;
 Tue, 14 Sep 2021 14:25:08 +0000 (UTC)
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
Subject: [PATCH v2 16/53] target/microblaze: convert to use format_state
 instead of dump_state
Date: Tue, 14 Sep 2021 15:20:05 +0100
Message-Id: <20210914142042.1655100-17-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:27:09 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/microblaze/cpu.c       |  2 +-
 target/microblaze/cpu.h       |  2 +-
 target/microblaze/translate.c | 45 ++++++++++++++++++-----------------
 3 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 72d8f2a0da..539b8964bd 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -388,7 +388,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
 
-    cc->dump_state = mb_cpu_dump_state;
+    cc->format_state = mb_cpu_format_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
     cc->gdb_write_register = mb_cpu_gdb_write_register;
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e4bba8a755..3e90970068 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -360,7 +360,7 @@ bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
 void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
-void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void mb_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
 int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a14ffed784..c229ba8789 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1848,54 +1848,55 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
     translator_loop(&mb_tr_ops, &dc.base, cpu, tb, max_insns);
 }
 
-void mb_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void mb_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
     CPUMBState *env = &cpu->env;
     uint32_t iflags;
     int i;
 
-    qemu_fprintf(f, "pc=0x%08x msr=0x%05x mode=%s(saved=%s) eip=%d ie=%d\n",
-                 env->pc, env->msr,
-                 (env->msr & MSR_UM) ? "user" : "kernel",
-                 (env->msr & MSR_UMS) ? "user" : "kernel",
-                 (bool)(env->msr & MSR_EIP),
-                 (bool)(env->msr & MSR_IE));
+    g_string_append_printf(buf, "pc=0x%08x msr=0x%05x mode=%s(saved=%s) "
+                           "eip=%d ie=%d\n",
+                           env->pc, env->msr,
+                           (env->msr & MSR_UM) ? "user" : "kernel",
+                           (env->msr & MSR_UMS) ? "user" : "kernel",
+                           (bool)(env->msr & MSR_EIP),
+                           (bool)(env->msr & MSR_IE));
 
     iflags = env->iflags;
-    qemu_fprintf(f, "iflags: 0x%08x", iflags);
+    g_string_append_printf(buf, "iflags: 0x%08x", iflags);
     if (iflags & IMM_FLAG) {
-        qemu_fprintf(f, " IMM(0x%08x)", env->imm);
+        g_string_append_printf(buf, " IMM(0x%08x)", env->imm);
     }
     if (iflags & BIMM_FLAG) {
-        qemu_fprintf(f, " BIMM");
+        g_string_append_printf(buf, " BIMM");
     }
     if (iflags & D_FLAG) {
-        qemu_fprintf(f, " D(btarget=0x%08x)", env->btarget);
+        g_string_append_printf(buf, " D(btarget=0x%08x)", env->btarget);
     }
     if (iflags & DRTI_FLAG) {
-        qemu_fprintf(f, " DRTI");
+        g_string_append_printf(buf, " DRTI");
     }
     if (iflags & DRTE_FLAG) {
-        qemu_fprintf(f, " DRTE");
+        g_string_append_printf(buf, " DRTE");
     }
     if (iflags & DRTB_FLAG) {
-        qemu_fprintf(f, " DRTB");
+        g_string_append_printf(buf, " DRTB");
     }
     if (iflags & ESR_ESS_FLAG) {
-        qemu_fprintf(f, " ESR_ESS(0x%04x)", iflags & ESR_ESS_MASK);
+        g_string_append_printf(buf, " ESR_ESS(0x%04x)", iflags & ESR_ESS_MASK);
     }
 
-    qemu_fprintf(f, "\nesr=0x%04x fsr=0x%02x btr=0x%08x edr=0x%x\n"
-                 "ear=0x" TARGET_FMT_lx " slr=0x%x shr=0x%x\n",
-                 env->esr, env->fsr, env->btr, env->edr,
-                 env->ear, env->slr, env->shr);
+    g_string_append_printf(buf, "\nesr=0x%04x fsr=0x%02x btr=0x%08x edr=0x%x\n"
+                           "ear=0x" TARGET_FMT_lx " slr=0x%x shr=0x%x\n",
+                           env->esr, env->fsr, env->btr, env->edr,
+                           env->ear, env->slr, env->shr);
 
     for (i = 0; i < 32; i++) {
-        qemu_fprintf(f, "r%2.2d=%08x%c",
-                     i, env->regs[i], i % 4 == 3 ? '\n' : ' ');
+        g_string_append_printf(buf, "r%2.2d=%08x%c",
+                               i, env->regs[i], i % 4 == 3 ? '\n' : ' ');
     }
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
 }
 
 void mb_tcg_init(void)
-- 
2.31.1


