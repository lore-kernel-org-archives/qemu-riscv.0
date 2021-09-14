Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Mt-0006sT-2l
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Mr-0006oJ-8J
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:25:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Mn-0005k8-J6
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6tT/Mro5QGD8I47bCN3lXcYKjcM82mfNp3b6QdQPGv4=;
 b=QfAak+L3wEczMjZyZ3Go7c/VaKhhk15FkxbhcailNl6ENY1WD8Q+/QEHy+WZeDZSCX/WfS
 y+pwWuVIB8g9375NnzJfAMlLc5uKUSKr9Yy4K7kRRL9N58YFEmPwiTH+nMaFn3LdQwnlmB
 4l4HCefueO8lYK9wKJhtPAAVkJrbunk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-MrNtF9xJPK-y6cwJVlSduA-1; Tue, 14 Sep 2021 10:24:52 -0400
X-MC-Unique: MrNtF9xJPK-y6cwJVlSduA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3496618414A0;
 Tue, 14 Sep 2021 14:24:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B13C5D9DC;
 Tue, 14 Sep 2021 14:24:41 +0000 (UTC)
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
Subject: [PATCH v2 14/53] target/i386: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:03 +0100
Message-Id: <20210914142042.1655100-15-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:25:01 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/cpu-dump.c | 328 ++++++++++++++++++++++-------------------
 target/i386/cpu.c      |   2 +-
 target/i386/cpu.h      |   2 +-
 3 files changed, 177 insertions(+), 155 deletions(-)

diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index 02b635a52c..f30fbcb76e 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -94,41 +94,46 @@ static const char *cc_op_str[CC_OP_NB] = {
 };
 
 static void
-cpu_x86_dump_seg_cache(CPUX86State *env, FILE *f,
+cpu_x86_dump_seg_cache(CPUX86State *env, GString *buf,
                        const char *name, struct SegmentCache *sc)
 {
 #ifdef TARGET_X86_64
     if (env->hflags & HF_CS64_MASK) {
-        qemu_fprintf(f, "%-3s=%04x %016" PRIx64 " %08x %08x", name,
-                     sc->selector, sc->base, sc->limit,
-                     sc->flags & 0x00ffff00);
+        g_string_append_printf(buf, "%-3s=%04x %016" PRIx64 " %08x %08x", name,
+                               sc->selector, sc->base, sc->limit,
+                               sc->flags & 0x00ffff00);
     } else
 #endif
     {
-        qemu_fprintf(f, "%-3s=%04x %08x %08x %08x", name, sc->selector,
-                     (uint32_t)sc->base, sc->limit,
-                     sc->flags & 0x00ffff00);
+        g_string_append_printf(buf, "%-3s=%04x %08x %08x %08x",
+                               name, sc->selector,
+                               (uint32_t)sc->base, sc->limit,
+                               sc->flags & 0x00ffff00);
     }
 
     if (!(env->hflags & HF_PE_MASK) || !(sc->flags & DESC_P_MASK))
         goto done;
 
-    qemu_fprintf(f, " DPL=%d ",
+    g_string_append_printf(buf, " DPL=%d ",
                  (sc->flags & DESC_DPL_MASK) >> DESC_DPL_SHIFT);
     if (sc->flags & DESC_S_MASK) {
         if (sc->flags & DESC_CS_MASK) {
-            qemu_fprintf(f, (sc->flags & DESC_L_MASK) ? "CS64" :
-                         ((sc->flags & DESC_B_MASK) ? "CS32" : "CS16"));
-            qemu_fprintf(f, " [%c%c", (sc->flags & DESC_C_MASK) ? 'C' : '-',
-                         (sc->flags & DESC_R_MASK) ? 'R' : '-');
+            g_string_append_printf(buf, (sc->flags & DESC_L_MASK) ? "CS64" :
+                                   ((sc->flags & DESC_B_MASK) ?
+                                    "CS32" : "CS16"));
+            g_string_append_printf(buf, " [%c%c",
+                                   (sc->flags & DESC_C_MASK) ? 'C' : '-',
+                                   (sc->flags & DESC_R_MASK) ? 'R' : '-');
         } else {
-            qemu_fprintf(f, (sc->flags & DESC_B_MASK
+            g_string_append_printf(buf, (sc->flags & DESC_B_MASK
                              || env->hflags & HF_LMA_MASK)
                          ? "DS  " : "DS16");
-            qemu_fprintf(f, " [%c%c", (sc->flags & DESC_E_MASK) ? 'E' : '-',
-                         (sc->flags & DESC_W_MASK) ? 'W' : '-');
+            g_string_append_printf(buf, " [%c%c",
+                                   (sc->flags & DESC_E_MASK) ? 'E' : '-',
+                                   (sc->flags & DESC_W_MASK) ? 'W' : '-');
         }
-        qemu_fprintf(f, "%c]", (sc->flags & DESC_A_MASK) ? 'A' : '-');
+        g_string_append_printf(buf, "%c]",
+                               (sc->flags & DESC_A_MASK) ? 'A' : '-');
     } else {
         static const char *sys_type_name[2][16] = {
             { /* 32 bit mode */
@@ -144,12 +149,14 @@ cpu_x86_dump_seg_cache(CPUX86State *env, FILE *f,
                 "Reserved", "IntGate64", "TrapGate64"
             }
         };
-        qemu_fprintf(f, "%s",
-                     sys_type_name[(env->hflags & HF_LMA_MASK) ? 1 : 0]
-                     [(sc->flags & DESC_TYPE_MASK) >> DESC_TYPE_SHIFT]);
+        g_string_append_printf(buf, "%s",
+                               sys_type_name[(env->hflags & HF_LMA_MASK)
+                                             ? 1 : 0]
+                               [(sc->flags & DESC_TYPE_MASK) >>
+                                DESC_TYPE_SHIFT]);
     }
 done:
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -344,7 +351,7 @@ void x86_cpu_dump_local_apic_state(CPUState *cs, int flags)
 #define DUMP_CODE_BYTES_TOTAL    50
 #define DUMP_CODE_BYTES_BACKWARD 20
 
-void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void x86_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -355,107 +362,116 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     eflags = cpu_compute_eflags(env);
 #ifdef TARGET_X86_64
     if (env->hflags & HF_CS64_MASK) {
-        qemu_fprintf(f, "RAX=%016" PRIx64 " RBX=%016" PRIx64 " RCX=%016" PRIx64 " RDX=%016" PRIx64 "\n"
-                     "RSI=%016" PRIx64 " RDI=%016" PRIx64 " RBP=%016" PRIx64 " RSP=%016" PRIx64 "\n"
-                     "R8 =%016" PRIx64 " R9 =%016" PRIx64 " R10=%016" PRIx64 " R11=%016" PRIx64 "\n"
-                     "R12=%016" PRIx64 " R13=%016" PRIx64 " R14=%016" PRIx64 " R15=%016" PRIx64 "\n"
-                     "RIP=%016" PRIx64 " RFL=%08x [%c%c%c%c%c%c%c] CPL=%d II=%d A20=%d SMM=%d HLT=%d\n",
-                     env->regs[R_EAX],
-                     env->regs[R_EBX],
-                     env->regs[R_ECX],
-                     env->regs[R_EDX],
-                     env->regs[R_ESI],
-                     env->regs[R_EDI],
-                     env->regs[R_EBP],
-                     env->regs[R_ESP],
-                     env->regs[8],
-                     env->regs[9],
-                     env->regs[10],
-                     env->regs[11],
-                     env->regs[12],
-                     env->regs[13],
-                     env->regs[14],
-                     env->regs[15],
-                     env->eip, eflags,
-                     eflags & DF_MASK ? 'D' : '-',
-                     eflags & CC_O ? 'O' : '-',
-                     eflags & CC_S ? 'S' : '-',
-                     eflags & CC_Z ? 'Z' : '-',
-                     eflags & CC_A ? 'A' : '-',
-                     eflags & CC_P ? 'P' : '-',
-                     eflags & CC_C ? 'C' : '-',
-                     env->hflags & HF_CPL_MASK,
-                     (env->hflags >> HF_INHIBIT_IRQ_SHIFT) & 1,
-                     (env->a20_mask >> 20) & 1,
-                     (env->hflags >> HF_SMM_SHIFT) & 1,
-                     cs->halted);
+        g_string_append_printf(buf, "RAX=%016" PRIx64 " RBX=%016" PRIx64
+                               " RCX=%016" PRIx64 " RDX=%016" PRIx64 "\n"
+                               "RSI=%016" PRIx64 " RDI=%016" PRIx64
+                               " RBP=%016" PRIx64 " RSP=%016" PRIx64 "\n"
+                               "R8 =%016" PRIx64 " R9 =%016" PRIx64
+                               " R10=%016" PRIx64 " R11=%016" PRIx64 "\n"
+                               "R12=%016" PRIx64 " R13=%016" PRIx64
+                               " R14=%016" PRIx64 " R15=%016" PRIx64 "\n"
+                               "RIP=%016" PRIx64 " RFL=%08x [%c%c%c%c%c%c%c] "
+                               "CPL=%d II=%d A20=%d SMM=%d HLT=%d\n",
+                               env->regs[R_EAX],
+                               env->regs[R_EBX],
+                               env->regs[R_ECX],
+                               env->regs[R_EDX],
+                               env->regs[R_ESI],
+                               env->regs[R_EDI],
+                               env->regs[R_EBP],
+                               env->regs[R_ESP],
+                               env->regs[8],
+                               env->regs[9],
+                               env->regs[10],
+                               env->regs[11],
+                               env->regs[12],
+                               env->regs[13],
+                               env->regs[14],
+                               env->regs[15],
+                               env->eip, eflags,
+                               eflags & DF_MASK ? 'D' : '-',
+                               eflags & CC_O ? 'O' : '-',
+                               eflags & CC_S ? 'S' : '-',
+                               eflags & CC_Z ? 'Z' : '-',
+                               eflags & CC_A ? 'A' : '-',
+                               eflags & CC_P ? 'P' : '-',
+                               eflags & CC_C ? 'C' : '-',
+                               env->hflags & HF_CPL_MASK,
+                               (env->hflags >> HF_INHIBIT_IRQ_SHIFT) & 1,
+                               (env->a20_mask >> 20) & 1,
+                               (env->hflags >> HF_SMM_SHIFT) & 1,
+                               cs->halted);
     } else
 #endif
     {
-        qemu_fprintf(f, "EAX=%08x EBX=%08x ECX=%08x EDX=%08x\n"
-                     "ESI=%08x EDI=%08x EBP=%08x ESP=%08x\n"
-                     "EIP=%08x EFL=%08x [%c%c%c%c%c%c%c] CPL=%d II=%d A20=%d SMM=%d HLT=%d\n",
-                     (uint32_t)env->regs[R_EAX],
-                     (uint32_t)env->regs[R_EBX],
-                     (uint32_t)env->regs[R_ECX],
-                     (uint32_t)env->regs[R_EDX],
-                     (uint32_t)env->regs[R_ESI],
-                     (uint32_t)env->regs[R_EDI],
-                     (uint32_t)env->regs[R_EBP],
-                     (uint32_t)env->regs[R_ESP],
-                     (uint32_t)env->eip, eflags,
-                     eflags & DF_MASK ? 'D' : '-',
-                     eflags & CC_O ? 'O' : '-',
-                     eflags & CC_S ? 'S' : '-',
-                     eflags & CC_Z ? 'Z' : '-',
-                     eflags & CC_A ? 'A' : '-',
-                     eflags & CC_P ? 'P' : '-',
-                     eflags & CC_C ? 'C' : '-',
-                     env->hflags & HF_CPL_MASK,
-                     (env->hflags >> HF_INHIBIT_IRQ_SHIFT) & 1,
-                     (env->a20_mask >> 20) & 1,
-                     (env->hflags >> HF_SMM_SHIFT) & 1,
-                     cs->halted);
+        g_string_append_printf(buf, "EAX=%08x EBX=%08x ECX=%08x EDX=%08x\n"
+                               "ESI=%08x EDI=%08x EBP=%08x ESP=%08x\n"
+                               "EIP=%08x EFL=%08x [%c%c%c%c%c%c%c] "
+                               "CPL=%d II=%d A20=%d SMM=%d HLT=%d\n",
+                               (uint32_t)env->regs[R_EAX],
+                               (uint32_t)env->regs[R_EBX],
+                               (uint32_t)env->regs[R_ECX],
+                               (uint32_t)env->regs[R_EDX],
+                               (uint32_t)env->regs[R_ESI],
+                               (uint32_t)env->regs[R_EDI],
+                               (uint32_t)env->regs[R_EBP],
+                               (uint32_t)env->regs[R_ESP],
+                               (uint32_t)env->eip, eflags,
+                               eflags & DF_MASK ? 'D' : '-',
+                               eflags & CC_O ? 'O' : '-',
+                               eflags & CC_S ? 'S' : '-',
+                               eflags & CC_Z ? 'Z' : '-',
+                               eflags & CC_A ? 'A' : '-',
+                               eflags & CC_P ? 'P' : '-',
+                               eflags & CC_C ? 'C' : '-',
+                               env->hflags & HF_CPL_MASK,
+                               (env->hflags >> HF_INHIBIT_IRQ_SHIFT) & 1,
+                               (env->a20_mask >> 20) & 1,
+                               (env->hflags >> HF_SMM_SHIFT) & 1,
+                               cs->halted);
     }
 
     for(i = 0; i < 6; i++) {
-        cpu_x86_dump_seg_cache(env, f, seg_name[i], &env->segs[i]);
+        cpu_x86_dump_seg_cache(env, buf, seg_name[i], &env->segs[i]);
     }
-    cpu_x86_dump_seg_cache(env, f, "LDT", &env->ldt);
-    cpu_x86_dump_seg_cache(env, f, "TR", &env->tr);
+    cpu_x86_dump_seg_cache(env, buf, "LDT", &env->ldt);
+    cpu_x86_dump_seg_cache(env, buf, "TR", &env->tr);
 
 #ifdef TARGET_X86_64
     if (env->hflags & HF_LMA_MASK) {
-        qemu_fprintf(f, "GDT=     %016" PRIx64 " %08x\n",
-                     env->gdt.base, env->gdt.limit);
-        qemu_fprintf(f, "IDT=     %016" PRIx64 " %08x\n",
-                     env->idt.base, env->idt.limit);
-        qemu_fprintf(f, "CR0=%08x CR2=%016" PRIx64 " CR3=%016" PRIx64 " CR4=%08x\n",
-                     (uint32_t)env->cr[0],
-                     env->cr[2],
-                     env->cr[3],
-                     (uint32_t)env->cr[4]);
+        g_string_append_printf(buf, "GDT=     %016" PRIx64 " %08x\n",
+                               env->gdt.base, env->gdt.limit);
+        g_string_append_printf(buf, "IDT=     %016" PRIx64 " %08x\n",
+                               env->idt.base, env->idt.limit);
+        g_string_append_printf(buf, "CR0=%08x CR2=%016" PRIx64
+                               " CR3=%016" PRIx64 " CR4=%08x\n",
+                               (uint32_t)env->cr[0],
+                               env->cr[2],
+                               env->cr[3],
+                               (uint32_t)env->cr[4]);
         for(i = 0; i < 4; i++)
-            qemu_fprintf(f, "DR%d=%016" PRIx64 " ", i, env->dr[i]);
-        qemu_fprintf(f, "\nDR6=%016" PRIx64 " DR7=%016" PRIx64 "\n",
-                     env->dr[6], env->dr[7]);
+            g_string_append_printf(buf, "DR%d=%016" PRIx64 " ", i, env->dr[i]);
+        g_string_append_printf(buf, "\nDR6=%016" PRIx64 " DR7=%016" PRIx64 "\n",
+                               env->dr[6], env->dr[7]);
     } else
 #endif
     {
-        qemu_fprintf(f, "GDT=     %08x %08x\n",
-                     (uint32_t)env->gdt.base, env->gdt.limit);
-        qemu_fprintf(f, "IDT=     %08x %08x\n",
-                     (uint32_t)env->idt.base, env->idt.limit);
-        qemu_fprintf(f, "CR0=%08x CR2=%08x CR3=%08x CR4=%08x\n",
-                     (uint32_t)env->cr[0],
-                     (uint32_t)env->cr[2],
-                     (uint32_t)env->cr[3],
-                     (uint32_t)env->cr[4]);
+        g_string_append_printf(buf, "GDT=     %08x %08x\n",
+                               (uint32_t)env->gdt.base, env->gdt.limit);
+        g_string_append_printf(buf, "IDT=     %08x %08x\n",
+                               (uint32_t)env->idt.base, env->idt.limit);
+        g_string_append_printf(buf, "CR0=%08x CR2=%08x CR3=%08x CR4=%08x\n",
+                               (uint32_t)env->cr[0],
+                               (uint32_t)env->cr[2],
+                               (uint32_t)env->cr[3],
+                               (uint32_t)env->cr[4]);
         for(i = 0; i < 4; i++) {
-            qemu_fprintf(f, "DR%d=" TARGET_FMT_lx " ", i, env->dr[i]);
+            g_string_append_printf(buf, "DR%d=" TARGET_FMT_lx
+                                   " ", i, env->dr[i]);
         }
-        qemu_fprintf(f, "\nDR6=" TARGET_FMT_lx " DR7=" TARGET_FMT_lx "\n",
-                     env->dr[6], env->dr[7]);
+        g_string_append_printf(buf, "\nDR6=" TARGET_FMT_lx
+                               " DR7=" TARGET_FMT_lx "\n",
+                               env->dr[6], env->dr[7]);
     }
     if (flags & CPU_DUMP_CCOP) {
         if ((unsigned)env->cc_op < CC_OP_NB)
@@ -464,18 +480,19 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             snprintf(cc_op_name, sizeof(cc_op_name), "[%d]", env->cc_op);
 #ifdef TARGET_X86_64
         if (env->hflags & HF_CS64_MASK) {
-            qemu_fprintf(f, "CCS=%016" PRIx64 " CCD=%016" PRIx64 " CCO=%-8s\n",
-                         env->cc_src, env->cc_dst,
-                         cc_op_name);
+            g_string_append_printf(buf, "CCS=%016" PRIx64
+                                   " CCD=%016" PRIx64 " CCO=%-8s\n",
+                                   env->cc_src, env->cc_dst,
+                                   cc_op_name);
         } else
 #endif
         {
-            qemu_fprintf(f, "CCS=%08x CCD=%08x CCO=%-8s\n",
-                         (uint32_t)env->cc_src, (uint32_t)env->cc_dst,
-                         cc_op_name);
+            g_string_append_printf(buf, "CCS=%08x CCD=%08x CCO=%-8s\n",
+                                   (uint32_t)env->cc_src, (uint32_t)env->cc_dst,
+                                   cc_op_name);
         }
     }
-    qemu_fprintf(f, "EFER=%016" PRIx64 "\n", env->efer);
+    g_string_append_printf(buf, "EFER=%016" PRIx64 "\n", env->efer);
     if (flags & CPU_DUMP_FPU) {
         int fptag;
         const uint64_t avx512_mask = XSTATE_OPMASK_MASK | \
@@ -488,64 +505,68 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             fptag |= ((!env->fptags[i]) << i);
         }
         update_mxcsr_from_sse_status(env);
-        qemu_fprintf(f, "FCW=%04x FSW=%04x [ST=%d] FTW=%02x MXCSR=%08x\n",
-                     env->fpuc,
-                     (env->fpus & ~0x3800) | (env->fpstt & 0x7) << 11,
-                     env->fpstt,
-                     fptag,
-                     env->mxcsr);
+        g_string_append_printf(
+            buf, "FCW=%04x FSW=%04x [ST=%d] FTW=%02x MXCSR=%08x\n",
+            env->fpuc,
+            (env->fpus & ~0x3800) | (env->fpstt & 0x7) << 11,
+            env->fpstt,
+            fptag,
+            env->mxcsr);
         for(i=0;i<8;i++) {
             CPU_LDoubleU u;
             u.d = env->fpregs[i].d;
-            qemu_fprintf(f, "FPR%d=%016" PRIx64 " %04x",
-                         i, u.l.lower, u.l.upper);
+            g_string_append_printf(buf, "FPR%d=%016" PRIx64 " %04x",
+                                   i, u.l.lower, u.l.upper);
             if ((i & 1) == 1)
-                qemu_fprintf(f, "\n");
+                g_string_append_printf(buf, "\n");
             else
-                qemu_fprintf(f, " ");
+                g_string_append_printf(buf, " ");
         }
-
         if ((env->xcr0 & avx512_mask) == avx512_mask) {
             /* XSAVE enabled AVX512 */
             for (i = 0; i < NB_OPMASK_REGS; i++) {
-                qemu_fprintf(f, "Opmask%02d=%016"PRIx64"%s", i,
-                             env->opmask_regs[i], ((i & 3) == 3) ? "\n" : " ");
+                g_string_append_printf(buf, "Opmask%02d=%016"PRIx64"%s", i,
+                                       env->opmask_regs[i],
+                                       ((i & 3) == 3) ? "\n" : " ");
             }
 
             nb = (env->hflags & HF_CS64_MASK) ? 32 : 8;
             for (i = 0; i < nb; i++) {
-                qemu_fprintf(f, "ZMM%02d=%016"PRIx64" %016"PRIx64" %016"PRIx64
-                             " %016"PRIx64" %016"PRIx64" %016"PRIx64
-                             " %016"PRIx64" %016"PRIx64"\n",
-                             i,
-                             env->xmm_regs[i].ZMM_Q(7),
-                             env->xmm_regs[i].ZMM_Q(6),
-                             env->xmm_regs[i].ZMM_Q(5),
-                             env->xmm_regs[i].ZMM_Q(4),
-                             env->xmm_regs[i].ZMM_Q(3),
-                             env->xmm_regs[i].ZMM_Q(2),
-                             env->xmm_regs[i].ZMM_Q(1),
-                             env->xmm_regs[i].ZMM_Q(0));
+                g_string_append_printf(buf, "ZMM%02d=%016"PRIx64
+                                       " %016"PRIx64" %016"PRIx64
+                                       " %016"PRIx64" %016"PRIx64" %016"PRIx64
+                                       " %016"PRIx64" %016"PRIx64"\n",
+                                       i,
+                                       env->xmm_regs[i].ZMM_Q(7),
+                                       env->xmm_regs[i].ZMM_Q(6),
+                                       env->xmm_regs[i].ZMM_Q(5),
+                                       env->xmm_regs[i].ZMM_Q(4),
+                                       env->xmm_regs[i].ZMM_Q(3),
+                                       env->xmm_regs[i].ZMM_Q(2),
+                                       env->xmm_regs[i].ZMM_Q(1),
+                                       env->xmm_regs[i].ZMM_Q(0));
             }
         } else if ((env->xcr0 & avx_mask)  == avx_mask) {
             /* XSAVE enabled AVX */
             nb = env->hflags & HF_CS64_MASK ? 16 : 8;
             for (i = 0; i < nb; i++) {
-                qemu_fprintf(f, "YMM%02d=%016"PRIx64" %016"PRIx64" %016"PRIx64
-                             " %016"PRIx64"\n", i,
-                             env->xmm_regs[i].ZMM_Q(3),
-                             env->xmm_regs[i].ZMM_Q(2),
-                             env->xmm_regs[i].ZMM_Q(1),
-                             env->xmm_regs[i].ZMM_Q(0));
+                g_string_append_printf(buf, "YMM%02d=%016"PRIx64
+                                       " %016"PRIx64" %016"PRIx64
+                                       " %016"PRIx64"\n", i,
+                                       env->xmm_regs[i].ZMM_Q(3),
+                                       env->xmm_regs[i].ZMM_Q(2),
+                                       env->xmm_regs[i].ZMM_Q(1),
+                                       env->xmm_regs[i].ZMM_Q(0));
             }
         } else { /* SSE and below cases */
             nb = env->hflags & HF_CS64_MASK ? 16 : 8;
             for (i = 0; i < nb; i++) {
-                qemu_fprintf(f, "XMM%02d=%016"PRIx64" %016"PRIx64"%s",
-                             i,
-                             env->xmm_regs[i].ZMM_Q(1),
-                             env->xmm_regs[i].ZMM_Q(0),
-                             (i & 1) ? "\n" : " ");
+                g_string_append_printf(buf,
+                                       "XMM%02d=%016"PRIx64" %016"PRIx64"%s",
+                                       i,
+                                       env->xmm_regs[i].ZMM_Q(1),
+                                       env->xmm_regs[i].ZMM_Q(0),
+                                       (i & 1) ? "\n" : " ");
             }
         }
     }
@@ -555,16 +576,17 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         uint8_t code;
         char codestr[3];
 
-        qemu_fprintf(f, "Code=");
+        g_string_append_printf(buf, "Code=");
         for (i = 0; i < DUMP_CODE_BYTES_TOTAL; i++) {
             if (cpu_memory_rw_debug(cs, base - offs + i, &code, 1, 0) == 0) {
                 snprintf(codestr, sizeof(codestr), "%02x", code);
             } else {
                 snprintf(codestr, sizeof(codestr), "??");
             }
-            qemu_fprintf(f, "%s%s%s%s", i > 0 ? " " : "",
-                         i == offs ? "<" : "", codestr, i == offs ? ">" : "");
+            g_string_append_printf(buf, "%s%s%s%s", i > 0 ? " " : "",
+                                   i == offs ? "<" : "", codestr,
+                                   i == offs ? ">" : "");
         }
-        qemu_fprintf(f, "\n");
+        g_string_append_printf(buf, "\n");
     }
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b029f1bdf..0a5c6a6d19 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6764,7 +6764,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
     cc->has_work = x86_cpu_has_work;
-    cc->dump_state = x86_cpu_dump_state;
+    cc->format_state = x86_cpu_format_state;
     cc->set_pc = x86_cpu_set_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 71ae3141c3..d87c8808f6 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1825,7 +1825,7 @@ int x86_cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 void x86_cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                                 Error **errp);
 
-void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags);
+void x86_cpu_format_state(CPUState *cs, GString *buf, int flags);
 
 hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
-- 
2.31.1


