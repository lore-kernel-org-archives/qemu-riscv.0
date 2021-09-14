Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Pv-0001Gl-3t
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Pt-0001Bz-CP
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:28:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Pm-0008Aa-Kx
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKozBoKyAUU0vbnpIl9GkAhnB7lfTQjmZkYHvWnT9rU=;
 b=OTi5p22WF3jsDW6221OMquRBmgVRngjTQDiJh20ggg3RpFnR4/qLP7KN88SY/X6U4UV81l
 smAjYH7OuiVD5j/l0qMmg5KkMuSQ48cOhiiwivtYiYEiu8HJ7ulHIspLfQ2GVsjwSQzNjq
 A4683uvA+GnsLUTXsP9r77o0pz7kbuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-i_sCcCilOp6A9yK0ziaS-Q-1; Tue, 14 Sep 2021 10:28:00 -0400
X-MC-Unique: i_sCcCilOp6A9yK0ziaS-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8D17802923;
 Tue, 14 Sep 2021 14:27:56 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 389C65D9CA;
 Tue, 14 Sep 2021 14:27:33 +0000 (UTC)
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
Subject: [PATCH v2 21/53] target/riscv: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:10 +0100
Message-Id: <20210914142042.1655100-22-berrange@redhat.com>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 14 Sep 2021 14:28:09 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/riscv/cpu.c | 105 ++++++++++++++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 39 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a2b03d579..7a9e013e32 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -242,7 +242,7 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+static void riscv_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -250,71 +250,98 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 #if !defined(CONFIG_USER_ONLY)
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s %d\n", "V      =  ", riscv_cpu_virt_enabled(env));
+        g_string_append_printf(buf, " %s %d\n", "V      =  ",
+                               riscv_cpu_virt_enabled(env));
     }
 #endif
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "pc      ", env->pc);
 #ifndef CONFIG_USER_ONLY
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "mhartid ", env->mhartid);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "mstatus ", (target_ulong)env->mstatus);
     if (riscv_cpu_is_32bit(env)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
-                     (target_ulong)(env->mstatus >> 32));
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n", "mstatush ",
+                               (target_ulong)(env->mstatus >> 32));
     }
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
-                     (target_ulong)env->vsstatus);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                               "hstatus ", env->hstatus);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                               "vsstatus ", (target_ulong)env->vsstatus);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "mip     ", env->mip);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "mie     ", env->mie);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "mideleg ", env->mideleg);
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                               "hideleg ", env->hideleg);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "medeleg ", env->medeleg);
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hedeleg ", env->hedeleg);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                               "hedeleg ", env->hedeleg);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtvec   ", env->mtvec);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stvec   ", env->stvec);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "mtvec   ", env->mtvec);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "stvec   ", env->stvec);
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vstvec  ", env->vstvec);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                               "vstvec  ", env->vstvec);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mepc    ", env->mepc);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sepc    ", env->sepc);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "mepc    ", env->mepc);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "sepc    ", env->sepc);
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsepc   ", env->vsepc);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                               "vsepc   ", env->vsepc);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mcause  ", env->mcause);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "scause  ", env->scause);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "mcause  ", env->mcause);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "scause  ", env->scause);
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                               "vscause ", env->vscause);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "mtval   ", env->mtval);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "stval   ", env->stval);
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                               "htval ", env->htval);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                               "mtval2 ", env->mtval2);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "mscratch", env->mscratch);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "sscratch", env->sscratch);
+    g_string_append_printf(buf, " %s " TARGET_FMT_lx "\n",
+                           "satp    ", env->satp);
 #endif
 
     for (i = 0; i < 32; i++) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx,
-                     riscv_int_regnames[i], env->gpr[i]);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx,
+                               riscv_int_regnames[i], env->gpr[i]);
         if ((i & 3) == 3) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         }
     }
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 32; i++) {
-            qemu_fprintf(f, " %s %016" PRIx64,
-                         riscv_fpr_regnames[i], env->fpr[i]);
+            g_string_append_printf(buf, " %s %016" PRIx64,
+                                   riscv_fpr_regnames[i], env->fpr[i]);
             if ((i & 3) == 3) {
-                qemu_fprintf(f, "\n");
+                g_string_append_printf(buf, "\n");
             }
         }
     }
@@ -667,7 +694,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
-    cc->dump_state = riscv_cpu_dump_state;
+    cc->format_state = riscv_cpu_format_state;
     cc->set_pc = riscv_cpu_set_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
-- 
2.31.1


