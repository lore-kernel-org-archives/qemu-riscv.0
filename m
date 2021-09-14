Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9NU-0007c9-5s
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9NS-0007Wk-Ak
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9NC-00061P-JC
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ww655eJbEg/cuPv+OHOIWZs3b/eFx6RhHXXaU4f3zoo=;
 b=aTXS9Pxv8KjSvcHRa1nAEiet+rdn0UOlKhSWPgABksuaIKjsAO1Tcxb9eLMUymaodHC/Ih
 IQRF5fl/vLPtmAZW/15AV0mmyFJT4QDz5pWcZ/MATAKrOXg1Jy3X1/qsu9qlRjxyzdaKrP
 wFtrCRAXmL00dByxtTX6dPSJ4+vUnVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-ydjNEARUNZyS4vhl78Z43A-1; Tue, 14 Sep 2021 10:25:14 -0400
X-MC-Unique: ydjNEARUNZyS4vhl78Z43A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1AED1084683;
 Tue, 14 Sep 2021 14:25:08 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 847075D9CA;
 Tue, 14 Sep 2021 14:24:49 +0000 (UTC)
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
Subject: [PATCH v2 15/53] target/m68k: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:04 +0100
Message-Id: <20210914142042.1655100-16-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:25:38 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/m68k/cpu.c       |  2 +-
 target/m68k/cpu.h       |  2 +-
 target/m68k/translate.c | 92 ++++++++++++++++++++++-------------------
 3 files changed, 51 insertions(+), 45 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 72de6e9726..4ccf572a68 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -536,7 +536,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
-    cc->dump_state = m68k_cpu_dump_state;
+    cc->format_state = m68k_cpu_format_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 997d588911..b0641f6d0d 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -168,7 +168,7 @@ struct M68kCPU {
 
 void m68k_cpu_do_interrupt(CPUState *cpu);
 bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void m68k_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index c34d9aed61..951bbed6bf 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6316,75 +6316,81 @@ static double floatx80_to_double(CPUM68KState *env, uint16_t high, uint64_t low)
     return u.d;
 }
 
-void m68k_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void m68k_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     M68kCPU *cpu = M68K_CPU(cs);
     CPUM68KState *env = &cpu->env;
     int i;
     uint16_t sr;
     for (i = 0; i < 8; i++) {
-        qemu_fprintf(f, "D%d = %08x   A%d = %08x   "
-                     "F%d = %04x %016"PRIx64"  (%12g)\n",
-                     i, env->dregs[i], i, env->aregs[i],
-                     i, env->fregs[i].l.upper, env->fregs[i].l.lower,
-                     floatx80_to_double(env, env->fregs[i].l.upper,
-                                        env->fregs[i].l.lower));
-    }
-    qemu_fprintf(f, "PC = %08x   ", env->pc);
+        g_string_append_printf(buf, "D%d = %08x   A%d = %08x   "
+                               "F%d = %04x %016"PRIx64"  (%12g)\n",
+                               i, env->dregs[i], i, env->aregs[i],
+                               i, env->fregs[i].l.upper, env->fregs[i].l.lower,
+                               floatx80_to_double(env, env->fregs[i].l.upper,
+                                                  env->fregs[i].l.lower));
+    }
+    g_string_append_printf(buf, "PC = %08x   ", env->pc);
     sr = env->sr | cpu_m68k_get_ccr(env);
-    qemu_fprintf(f, "SR = %04x T:%x I:%x %c%c %c%c%c%c%c\n",
-                 sr, (sr & SR_T) >> SR_T_SHIFT, (sr & SR_I) >> SR_I_SHIFT,
-                 (sr & SR_S) ? 'S' : 'U', (sr & SR_M) ? '%' : 'I',
-                 (sr & CCF_X) ? 'X' : '-', (sr & CCF_N) ? 'N' : '-',
-                 (sr & CCF_Z) ? 'Z' : '-', (sr & CCF_V) ? 'V' : '-',
-                 (sr & CCF_C) ? 'C' : '-');
-    qemu_fprintf(f, "FPSR = %08x %c%c%c%c ", env->fpsr,
-                 (env->fpsr & FPSR_CC_A) ? 'A' : '-',
-                 (env->fpsr & FPSR_CC_I) ? 'I' : '-',
-                 (env->fpsr & FPSR_CC_Z) ? 'Z' : '-',
-                 (env->fpsr & FPSR_CC_N) ? 'N' : '-');
-    qemu_fprintf(f, "\n                                "
-                 "FPCR =     %04x ", env->fpcr);
+    g_string_append_printf(buf, "SR = %04x T:%x I:%x %c%c %c%c%c%c%c\n",
+                           sr, (sr & SR_T) >> SR_T_SHIFT,
+                           (sr & SR_I) >> SR_I_SHIFT,
+                           (sr & SR_S) ? 'S' : 'U', (sr & SR_M) ? '%' : 'I',
+                           (sr & CCF_X) ? 'X' : '-', (sr & CCF_N) ? 'N' : '-',
+                           (sr & CCF_Z) ? 'Z' : '-', (sr & CCF_V) ? 'V' : '-',
+                           (sr & CCF_C) ? 'C' : '-');
+    g_string_append_printf(buf, "FPSR = %08x %c%c%c%c ", env->fpsr,
+                           (env->fpsr & FPSR_CC_A) ? 'A' : '-',
+                           (env->fpsr & FPSR_CC_I) ? 'I' : '-',
+                           (env->fpsr & FPSR_CC_Z) ? 'Z' : '-',
+                           (env->fpsr & FPSR_CC_N) ? 'N' : '-');
+    g_string_append_printf(buf, "\n                                "
+                           "FPCR =     %04x ", env->fpcr);
     switch (env->fpcr & FPCR_PREC_MASK) {
     case FPCR_PREC_X:
-        qemu_fprintf(f, "X ");
+        g_string_append_printf(buf, "X ");
         break;
     case FPCR_PREC_S:
-        qemu_fprintf(f, "S ");
+        g_string_append_printf(buf, "S ");
         break;
     case FPCR_PREC_D:
-        qemu_fprintf(f, "D ");
+        g_string_append_printf(buf, "D ");
         break;
     }
     switch (env->fpcr & FPCR_RND_MASK) {
     case FPCR_RND_N:
-        qemu_fprintf(f, "RN ");
+        g_string_append_printf(buf, "RN ");
         break;
     case FPCR_RND_Z:
-        qemu_fprintf(f, "RZ ");
+        g_string_append_printf(buf, "RZ ");
         break;
     case FPCR_RND_M:
-        qemu_fprintf(f, "RM ");
+        g_string_append_printf(buf, "RM ");
         break;
     case FPCR_RND_P:
-        qemu_fprintf(f, "RP ");
+        g_string_append_printf(buf, "RP ");
         break;
     }
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
 #ifdef CONFIG_SOFTMMU
-    qemu_fprintf(f, "%sA7(MSP) = %08x %sA7(USP) = %08x %sA7(ISP) = %08x\n",
-                 env->current_sp == M68K_SSP ? "->" : "  ", env->sp[M68K_SSP],
-                 env->current_sp == M68K_USP ? "->" : "  ", env->sp[M68K_USP],
-                 env->current_sp == M68K_ISP ? "->" : "  ", env->sp[M68K_ISP]);
-    qemu_fprintf(f, "VBR = 0x%08x\n", env->vbr);
-    qemu_fprintf(f, "SFC = %x DFC %x\n", env->sfc, env->dfc);
-    qemu_fprintf(f, "SSW %08x TCR %08x URP %08x SRP %08x\n",
-                 env->mmu.ssw, env->mmu.tcr, env->mmu.urp, env->mmu.srp);
-    qemu_fprintf(f, "DTTR0/1: %08x/%08x ITTR0/1: %08x/%08x\n",
-                 env->mmu.ttr[M68K_DTTR0], env->mmu.ttr[M68K_DTTR1],
-                 env->mmu.ttr[M68K_ITTR0], env->mmu.ttr[M68K_ITTR1]);
-    qemu_fprintf(f, "MMUSR %08x, fault at %08x\n",
-                 env->mmu.mmusr, env->mmu.ar);
+    g_string_append_printf(buf, "%sA7(MSP) = %08x %sA7(USP) = %08x "
+                           "%sA7(ISP) = %08x\n",
+                           env->current_sp == M68K_SSP ?
+                           "->" : "  ", env->sp[M68K_SSP],
+                           env->current_sp == M68K_USP ?
+                           "->" : "  ", env->sp[M68K_USP],
+                           env->current_sp == M68K_ISP ?
+                           "->" : "  ", env->sp[M68K_ISP]);
+    g_string_append_printf(buf, "VBR = 0x%08x\n", env->vbr);
+    g_string_append_printf(buf, "SFC = %x DFC %x\n", env->sfc, env->dfc);
+    g_string_append_printf(buf, "SSW %08x TCR %08x URP %08x SRP %08x\n",
+                           env->mmu.ssw, env->mmu.tcr,
+                           env->mmu.urp, env->mmu.srp);
+    g_string_append_printf(buf, "DTTR0/1: %08x/%08x ITTR0/1: %08x/%08x\n",
+                           env->mmu.ttr[M68K_DTTR0], env->mmu.ttr[M68K_DTTR1],
+                           env->mmu.ttr[M68K_ITTR0], env->mmu.ttr[M68K_ITTR1]);
+    g_string_append_printf(buf, "MMUSR %08x, fault at %08x\n",
+                           env->mmu.mmusr, env->mmu.ar);
 #endif
 }
 
-- 
2.31.1


