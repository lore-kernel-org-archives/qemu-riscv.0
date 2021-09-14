Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9R7-0003uY-Bi
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9R3-0003hO-MQ
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9R0-0000Z0-KV
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3WVzLsV8w9sLuJjLsdwBP1aEjXJoaulIiYN1Q8Dh6w=;
 b=hqWMkNuEIegC4HJ0FEYLNhhcNHUeauIIKU7fVdWHzvnnnokBZTyDWHK96lgFNC5kTq4JN5
 iPpoOSGo831JB8YNzB1inXYkKWTZt9fZq6oqa8+hZlIaeqTvCsOfjc9Nag9srbb8/aHenW
 z/8kp6xuv5Na5gd4Bm3/8/HqMsIaYbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-cz3Eq-PQOrqyuHhZrqUQVQ-1; Tue, 14 Sep 2021 10:29:16 -0400
X-MC-Unique: cz3Eq-PQOrqyuHhZrqUQVQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC8B9802B9E;
 Tue, 14 Sep 2021 14:29:12 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E5AB5D9CA;
 Tue, 14 Sep 2021 14:29:01 +0000 (UTC)
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
Subject: [PATCH v2 24/53] target/sh: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:13 +0100
Message-Id: <20210914142042.1655100-25-berrange@redhat.com>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 14 Sep 2021 14:29:22 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/sh4/cpu.c       |  2 +-
 target/sh4/cpu.h       |  2 +-
 target/sh4/translate.c | 36 ++++++++++++++++++++----------------
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 8326922942..0ac881d6af 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -259,7 +259,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
-    cc->dump_state = superh_cpu_dump_state;
+    cc->format_state = superh_cpu_format_state;
     cc->set_pc = superh_cpu_set_pc;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 01c4344082..6940ca417a 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -206,7 +206,7 @@ struct SuperHCPU {
 
 void superh_cpu_do_interrupt(CPUState *cpu);
 bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void superh_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 8704fea1ca..f6fd8939b0 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -156,32 +156,36 @@ void sh4_translate_init(void)
                                               fregnames[i]);
 }
 
-void superh_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void superh_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
     CPUSH4State *env = &cpu->env;
     int i;
 
-    qemu_fprintf(f, "pc=0x%08x sr=0x%08x pr=0x%08x fpscr=0x%08x\n",
-                 env->pc, cpu_read_sr(env), env->pr, env->fpscr);
-    qemu_fprintf(f, "spc=0x%08x ssr=0x%08x gbr=0x%08x vbr=0x%08x\n",
-                 env->spc, env->ssr, env->gbr, env->vbr);
-    qemu_fprintf(f, "sgr=0x%08x dbr=0x%08x delayed_pc=0x%08x fpul=0x%08x\n",
-                 env->sgr, env->dbr, env->delayed_pc, env->fpul);
+    g_string_append_printf(buf, "pc=0x%08x sr=0x%08x pr=0x%08x fpscr=0x%08x\n",
+                           env->pc, cpu_read_sr(env), env->pr, env->fpscr);
+    g_string_append_printf(buf, "spc=0x%08x ssr=0x%08x gbr=0x%08x vbr=0x%08x\n",
+                           env->spc, env->ssr, env->gbr, env->vbr);
+    g_string_append_printf(buf, "sgr=0x%08x dbr=0x%08x delayed_pc=0x%08x "
+                           "fpul=0x%08x\n",
+                           env->sgr, env->dbr, env->delayed_pc, env->fpul);
     for (i = 0; i < 24; i += 4) {
-        qemu_printf("r%d=0x%08x r%d=0x%08x r%d=0x%08x r%d=0x%08x\n",
-		    i, env->gregs[i], i + 1, env->gregs[i + 1],
-		    i + 2, env->gregs[i + 2], i + 3, env->gregs[i + 3]);
+        g_string_append_printf(buf, "r%d=0x%08x r%d=0x%08x r%d=0x%08x "
+                               "r%d=0x%08x\n",
+                               i, env->gregs[i], i + 1, env->gregs[i + 1],
+                               i + 2, env->gregs[i + 2], i + 3,
+                               env->gregs[i + 3]);
     }
     if (env->flags & DELAY_SLOT) {
-        qemu_printf("in delay slot (delayed_pc=0x%08x)\n",
-		    env->delayed_pc);
+        g_string_append_printf(buf, "in delay slot (delayed_pc=0x%08x)\n",
+                               env->delayed_pc);
     } else if (env->flags & DELAY_SLOT_CONDITIONAL) {
-        qemu_printf("in conditional delay slot (delayed_pc=0x%08x)\n",
-		    env->delayed_pc);
+        g_string_append_printf(buf, "in conditional delay slot "
+                               "(delayed_pc=0x%08x)\n",
+                               env->delayed_pc);
     } else if (env->flags & DELAY_SLOT_RTE) {
-        qemu_fprintf(f, "in rte delay slot (delayed_pc=0x%08x)\n",
-                     env->delayed_pc);
+        g_string_append_printf(buf, "in rte delay slot (delayed_pc=0x%08x)\n",
+                               env->delayed_pc);
     }
 }
 
-- 
2.31.1


