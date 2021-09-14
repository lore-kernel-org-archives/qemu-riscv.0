Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9MB-0005al-M9
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9M9-0005U3-Ld
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9M7-0005Fn-Ve
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tog67gS4drGXdUxWrkIWCLaJgHomsSxvNugMDYrI6tI=;
 b=ehV8l/levd2Xht8eQkMyKYC4L9NhjzFLARMQItsv16jb+NWYOWZ9gdbrp8g50XVVUMY4Uy
 LpT0VWYgeY9vflRchWk5IEy85gei+2WFwqXDhIpiZACHnn3TlD6RS6yGJ3ZMJmcfK0c2TX
 09CKzJ1xzvhUYRx5ovYOsfXmOmvF2vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-A9bwwun7PU-maqSTdeQ_xw-1; Tue, 14 Sep 2021 10:23:12 -0400
X-MC-Unique: A9bwwun7PU-maqSTdeQ_xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4729784A5E0;
 Tue, 14 Sep 2021 14:23:08 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F14E5D9CA;
 Tue, 14 Sep 2021 14:23:00 +0000 (UTC)
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
Subject: [PATCH v2 07/53] target/alpha: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:19:56 +0100
Message-Id: <20210914142042.1655100-8-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:24:18 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/alpha/cpu.c    |  2 +-
 target/alpha/cpu.h    |  2 +-
 target/alpha/helper.c | 28 ++++++++++++++++------------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 4871ad0c0a..d0cdda9554 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -239,7 +239,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = alpha_cpu_class_by_name;
     cc->has_work = alpha_cpu_has_work;
-    cc->dump_state = alpha_cpu_dump_state;
+    cc->format_state = alpha_cpu_format_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967..9e3c80ebcc 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -278,7 +278,7 @@ extern const VMStateDescription vmstate_alpha_cpu;
 
 void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
+void alpha_cpu_format_state(CPUState *cs, GString *buf, int flags);
 hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 4f56fe4d23..6ed80e8a27 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -451,7 +451,7 @@ bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
-void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void alpha_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     static const char linux_reg_names[31][4] = {
         "v0",  "t0",  "t1", "t2",  "t3", "t4", "t5", "t6",
@@ -463,25 +463,29 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     CPUAlphaState *env = &cpu->env;
     int i;
 
-    qemu_fprintf(f, "PC      " TARGET_FMT_lx " PS      %02x\n",
-                 env->pc, extract32(env->flags, ENV_FLAG_PS_SHIFT, 8));
+    g_string_append_printf(buf,
+                           "PC      " TARGET_FMT_lx " PS      %02x\n",
+                           env->pc,
+                           extract32(env->flags, ENV_FLAG_PS_SHIFT, 8));
     for (i = 0; i < 31; i++) {
-        qemu_fprintf(f, "%-8s" TARGET_FMT_lx "%c",
-                     linux_reg_names[i], cpu_alpha_load_gr(env, i),
-                     (i % 3) == 2 ? '\n' : ' ');
+        g_string_append_printf(buf, "%-8s" TARGET_FMT_lx "%c",
+                               linux_reg_names[i], cpu_alpha_load_gr(env, i),
+                               (i % 3) == 2 ? '\n' : ' ');
     }
 
-    qemu_fprintf(f, "lock_a  " TARGET_FMT_lx " lock_v  " TARGET_FMT_lx "\n",
-                 env->lock_addr, env->lock_value);
+    g_string_append_printf(buf, "lock_a  " TARGET_FMT_lx
+                           " lock_v  " TARGET_FMT_lx "\n",
+                           env->lock_addr, env->lock_value);
 
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 31; i++) {
-            qemu_fprintf(f, "f%-7d%016" PRIx64 "%c", i, env->fir[i],
-                         (i % 3) == 2 ? '\n' : ' ');
+            g_string_append_printf(buf, "f%-7d%016" PRIx64 "%c", i, env->fir[i],
+                                   (i % 3) == 2 ? '\n' : ' ');
         }
-        qemu_fprintf(f, "fpcr    %016" PRIx64 "\n", cpu_alpha_load_fpcr(env));
+        g_string_append_printf(buf, "fpcr    %016" PRIx64 "\n",
+                               cpu_alpha_load_fpcr(env));
     }
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
 }
 
 /* This should only be called from translate, via gen_excp.
-- 
2.31.1


