Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9LV-0003A3-4x
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9LT-00033X-DZ
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9LR-0004m0-3v
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KGkGVwRmSHO8zOwMvdSsq1teOA4ZO2QBEQn2l0HSxc0=;
 b=Zr06pwlMxRFC+vbq1H7ZZWZdBJ7gq6CkORquG+Wb2oTi5NV404WncvU6Klp+21tV9LhTBy
 RVCxAStqbH8uTyfb7nc6ckGssa6NBum3Lfg5VSrja1CHFKIsK0U1RREpQdOoE4TbSXUcf2
 ACmzvp0vCOQl8OLpBmb3jl68ouhSN8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-4gJOaScQPj2SUv-rd9PB3Q-1; Tue, 14 Sep 2021 10:23:30 -0400
X-MC-Unique: 4gJOaScQPj2SUv-rd9PB3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D70318414A5;
 Tue, 14 Sep 2021 14:23:27 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90E945D9CA;
 Tue, 14 Sep 2021 14:23:08 +0000 (UTC)
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
Subject: [PATCH v2 08/53] target/arm: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:19:57 +0100
Message-Id: <20210914142042.1655100-9-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:23:35 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/arm/cpu.c | 152 +++++++++++++++++++++++++----------------------
 1 file changed, 81 insertions(+), 71 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d631c4683c..5999277e67 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -798,7 +798,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 
 #ifdef TARGET_AARCH64
 
-static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+static void aarch64_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -807,13 +807,14 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     int el = arm_current_el(env);
     const char *ns_status;
 
-    qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
+    g_string_append_printf(buf, " PC=%016" PRIx64 " ", env->pc);
     for (i = 0; i < 32; i++) {
         if (i == 31) {
-            qemu_fprintf(f, " SP=%016" PRIx64 "\n", env->xregs[i]);
+            g_string_append_printf(buf, " SP=%016" PRIx64 "\n", env->xregs[i]);
         } else {
-            qemu_fprintf(f, "X%02d=%016" PRIx64 "%s", i, env->xregs[i],
-                         (i + 2) % 3 ? " " : "\n");
+            g_string_append_printf(buf, "X%02d=%016" PRIx64 "%s",
+                                   i, env->xregs[i],
+                                   (i + 2) % 3 ? " " : "\n");
         }
     }
 
@@ -822,29 +823,29 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     } else {
         ns_status = "";
     }
-    qemu_fprintf(f, "PSTATE=%08x %c%c%c%c %sEL%d%c",
-                 psr,
-                 psr & PSTATE_N ? 'N' : '-',
-                 psr & PSTATE_Z ? 'Z' : '-',
-                 psr & PSTATE_C ? 'C' : '-',
-                 psr & PSTATE_V ? 'V' : '-',
-                 ns_status,
-                 el,
-                 psr & PSTATE_SP ? 'h' : 't');
+    g_string_append_printf(buf, "PSTATE=%08x %c%c%c%c %sEL%d%c",
+                           psr,
+                           psr & PSTATE_N ? 'N' : '-',
+                           psr & PSTATE_Z ? 'Z' : '-',
+                           psr & PSTATE_C ? 'C' : '-',
+                           psr & PSTATE_V ? 'V' : '-',
+                           ns_status,
+                           el,
+                           psr & PSTATE_SP ? 'h' : 't');
 
     if (cpu_isar_feature(aa64_bti, cpu)) {
-        qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
+        g_string_append_printf(buf, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
     }
     if (!(flags & CPU_DUMP_FPU)) {
-        qemu_fprintf(f, "\n");
+        g_string_append_printf(buf, "\n");
         return;
     }
     if (fp_exception_el(env, el) != 0) {
-        qemu_fprintf(f, "    FPU disabled\n");
+        g_string_append_printf(buf, "    FPU disabled\n");
         return;
     }
-    qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
-                 vfp_get_fpcr(env), vfp_get_fpsr(env));
+    g_string_append_printf(buf, "     FPCR=%08x FPSR=%08x\n",
+                           vfp_get_fpcr(env), vfp_get_fpsr(env));
 
     if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
         int j, zcr_len = sve_zcr_len_for_el(env, el);
@@ -852,11 +853,11 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         for (i = 0; i <= FFR_PRED_NUM; i++) {
             bool eol;
             if (i == FFR_PRED_NUM) {
-                qemu_fprintf(f, "FFR=");
+                g_string_append_printf(buf, "FFR=");
                 /* It's last, so end the line.  */
                 eol = true;
             } else {
-                qemu_fprintf(f, "P%02d=", i);
+                g_string_append_printf(buf, "P%02d=", i);
                 switch (zcr_len) {
                 case 0:
                     eol = i % 8 == 7;
@@ -881,76 +882,84 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                 } else {
                     digits = (zcr_len % 4 + 1) * 4;
                 }
-                qemu_fprintf(f, "%0*" PRIx64 "%s", digits,
-                             env->vfp.pregs[i].p[j],
-                             j ? ":" : eol ? "\n" : " ");
+                g_string_append_printf(buf, "%0*" PRIx64 "%s", digits,
+                                       env->vfp.pregs[i].p[j],
+                                       j ? ":" : eol ? "\n" : " ");
             }
         }
 
         for (i = 0; i < 32; i++) {
             if (zcr_len == 0) {
-                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64 "%s",
-                             i, env->vfp.zregs[i].d[1],
-                             env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
+                g_string_append_printf(buf, "Z%02d=%016" PRIx64
+                                       ":%016" PRIx64 "%s",
+                                       i, env->vfp.zregs[i].d[1],
+                                       env->vfp.zregs[i].d[0],
+                                       i & 1 ? "\n" : " ");
             } else if (zcr_len == 1) {
-                qemu_fprintf(f, "Z%02d=%016" PRIx64 ":%016" PRIx64
-                             ":%016" PRIx64 ":%016" PRIx64 "\n",
-                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i].d[2],
-                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d[0]);
+                g_string_append_printf(buf, "Z%02d=%016" PRIx64 ":%016" PRIx64
+                                       ":%016" PRIx64 ":%016" PRIx64 "\n",
+                                       i, env->vfp.zregs[i].d[3],
+                                       env->vfp.zregs[i].d[2],
+                                       env->vfp.zregs[i].d[1],
+                                       env->vfp.zregs[i].d[0]);
             } else {
                 for (j = zcr_len; j >= 0; j--) {
                     bool odd = (zcr_len - j) % 2 != 0;
                     if (j == zcr_len) {
-                        qemu_fprintf(f, "Z%02d[%x-%x]=", i, j, j - 1);
+                        g_string_append_printf(buf, "Z%02d[%x-%x]=",
+                                               i, j, j - 1);
                     } else if (!odd) {
                         if (j > 0) {
-                            qemu_fprintf(f, "   [%x-%x]=", j, j - 1);
+                            g_string_append_printf(buf, "   [%x-%x]=",
+                                                   j, j - 1);
                         } else {
-                            qemu_fprintf(f, "     [%x]=", j);
+                            g_string_append_printf(buf, "     [%x]=", j);
                         }
                     }
-                    qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
-                                 env->vfp.zregs[i].d[j * 2 + 1],
-                                 env->vfp.zregs[i].d[j * 2],
-                                 odd || j == 0 ? "\n" : ":");
+                    g_string_append_printf(buf,
+                                           "%016" PRIx64 ":%016" PRIx64 "%s",
+                                           env->vfp.zregs[i].d[j * 2 + 1],
+                                           env->vfp.zregs[i].d[j * 2],
+                                           odd || j == 0 ? "\n" : ":");
                 }
             }
         }
     } else {
         for (i = 0; i < 32; i++) {
             uint64_t *q = aa64_vfp_qreg(env, i);
-            qemu_fprintf(f, "Q%02d=%016" PRIx64 ":%016" PRIx64 "%s",
-                         i, q[1], q[0], (i & 1 ? "\n" : " "));
+            g_string_append_printf(buf, "Q%02d=%016" PRIx64 ":%016" PRIx64 "%s",
+                                   i, q[1], q[0], (i & 1 ? "\n" : " "));
         }
     }
 }
 
 #else
 
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+static inline void
+aarch64_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     g_assert_not_reached();
 }
 
 #endif
 
-static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+static void arm_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     int i;
 
     if (is_a64(env)) {
-        aarch64_cpu_dump_state(cs, f, flags);
+        aarch64_cpu_format_state(cs, buf, flags);
         return;
     }
 
     for (i = 0; i < 16; i++) {
-        qemu_fprintf(f, "R%02d=%08x", i, env->regs[i]);
+        g_string_append_printf(buf, "R%02d=%08x", i, env->regs[i]);
         if ((i % 4) == 3) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         } else {
-            qemu_fprintf(f, " ");
+            g_string_append_printf(buf, " ");
         }
     }
 
@@ -973,15 +982,15 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             }
         }
 
-        qemu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s%s\n",
-                     xpsr,
-                     xpsr & XPSR_N ? 'N' : '-',
-                     xpsr & XPSR_Z ? 'Z' : '-',
-                     xpsr & XPSR_C ? 'C' : '-',
-                     xpsr & XPSR_V ? 'V' : '-',
-                     xpsr & XPSR_T ? 'T' : 'A',
-                     ns_status,
-                     mode);
+        g_string_append_printf(buf, "XPSR=%08x %c%c%c%c %c %s%s\n",
+                               xpsr,
+                               xpsr & XPSR_N ? 'N' : '-',
+                               xpsr & XPSR_Z ? 'Z' : '-',
+                               xpsr & XPSR_C ? 'C' : '-',
+                               xpsr & XPSR_V ? 'V' : '-',
+                               xpsr & XPSR_T ? 'T' : 'A',
+                               ns_status,
+                               mode);
     } else {
         uint32_t psr = cpsr_read(env);
         const char *ns_status = "";
@@ -991,15 +1000,15 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
         }
 
-        qemu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
-                     psr,
-                     psr & CPSR_N ? 'N' : '-',
-                     psr & CPSR_Z ? 'Z' : '-',
-                     psr & CPSR_C ? 'C' : '-',
-                     psr & CPSR_V ? 'V' : '-',
-                     psr & CPSR_T ? 'T' : 'A',
-                     ns_status,
-                     aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
+        g_string_append_printf(buf, "PSR=%08x %c%c%c%c %c %s%s%d\n",
+                               psr,
+                               psr & CPSR_N ? 'N' : '-',
+                               psr & CPSR_Z ? 'Z' : '-',
+                               psr & CPSR_C ? 'C' : '-',
+                               psr & CPSR_V ? 'V' : '-',
+                               psr & CPSR_T ? 'T' : 'A',
+                               ns_status,
+                               aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
     }
 
     if (flags & CPU_DUMP_FPU) {
@@ -1011,14 +1020,15 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         }
         for (i = 0; i < numvfpregs; i++) {
             uint64_t v = *aa32_vfp_dreg(env, i);
-            qemu_fprintf(f, "s%02d=%08x s%02d=%08x d%02d=%016" PRIx64 "\n",
-                         i * 2, (uint32_t)v,
-                         i * 2 + 1, (uint32_t)(v >> 32),
-                         i, v);
+            g_string_append_printf(buf, "s%02d=%08x s%02d=%08x d%02d=%016"
+                                   PRIx64 "\n",
+                                   i * 2, (uint32_t)v,
+                                   i * 2 + 1, (uint32_t)(v >> 32),
+                                   i, v);
         }
-        qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
+        g_string_append_printf(buf, "FPSCR: %08x\n", vfp_get_fpscr(env));
         if (cpu_isar_feature(aa32_mve, cpu)) {
-            qemu_fprintf(f, "VPR: %08x\n", env->v7m.vpr);
+            g_string_append_printf(buf, "VPR: %08x\n", env->v7m.vpr);
         }
     }
 }
@@ -2039,7 +2049,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
-    cc->dump_state = arm_cpu_dump_state;
+    cc->format_state = arm_cpu_format_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
-- 
2.31.1


