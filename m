Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9PM-0000uH-Bt
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9P2-0000oD-24
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Ov-0007RS-Ea
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzpbfU4A9btQY9RS5Bo61BZfvRRoLXi0U6P5LuLSTCs=;
 b=dJe14Dnkzfp/wvMo7YNfg/Vpoz9ldXtr1VIs5amJ7XlYkvH8imBs0DtyuBRM9Gr+coi2JE
 dEdLEjmFSOqn8JGjVmz1iUgSDNCnh5QM6TgSJPD8QEiknYeUHqzPEioY8ca6+SlzvO5gZP
 8Ue0IAELuKV0ELgaG5EcbN2+Cf8nNhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-4cFRpq3QPRWx92hlR6xsbw-1; Tue, 14 Sep 2021 10:27:07 -0400
X-MC-Unique: 4cFRpq3QPRWx92hlR6xsbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5F2F36418;
 Tue, 14 Sep 2021 14:27:01 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 314435D9CA;
 Tue, 14 Sep 2021 14:26:47 +0000 (UTC)
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
Subject: [PATCH v2 18/53] target/nios2: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:07 +0100
Message-Id: <20210914142042.1655100-19-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:27:25 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/nios2/cpu.c       |  2 +-
 target/nios2/cpu.h       |  2 +-
 target/nios2/translate.c | 20 ++++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 5e37defef8..cbf15fb1c9 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -241,7 +241,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
-    cc->dump_state = nios2_cpu_dump_state;
+    cc->format_state = nios2_cpu_format_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 2ab82fdc71..3b16cd1f3c 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -195,7 +195,7 @@ void nios2_tcg_init(void);
 void nios2_cpu_do_interrupt(CPUState *cs);
 int cpu_nios2_signal_handler(int host_signum, void *pinfo, void *puc);
 void dump_mmu(CPUNios2State *env);
-void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void nios2_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                    MMUAccessType access_type,
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 08d7ac5398..a5f0f56e1a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -855,7 +855,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     translator_loop(&nios2_tr_ops, &dc.base, cs, tb, max_insns);
 }
 
-void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void nios2_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
@@ -865,22 +865,22 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         return;
     }
 
-    qemu_fprintf(f, "IN: PC=%x %s\n",
-                 env->regs[R_PC], lookup_symbol(env->regs[R_PC]));
+    g_string_append_printf(buf, "IN: PC=%x %s\n",
+                           env->regs[R_PC], lookup_symbol(env->regs[R_PC]));
 
     for (i = 0; i < NUM_CORE_REGS; i++) {
-        qemu_fprintf(f, "%9s=%8.8x ", regnames[i], env->regs[i]);
+        g_string_append_printf(buf, "%9s=%8.8x ", regnames[i], env->regs[i]);
         if ((i + 1) % 4 == 0) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         }
     }
 #if !defined(CONFIG_USER_ONLY)
-    qemu_fprintf(f, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
-                 env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK,
-                 (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4,
-                 env->mmu.tlbacc_wr);
+    g_string_append_printf(buf, " mmu write: VPN=%05X PID %02X TLBACC %08X\n",
+                           env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK,
+                           (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4,
+                           env->mmu.tlbacc_wr);
 #endif
-    qemu_fprintf(f, "\n\n");
+    g_string_append_printf(buf, "\n\n");
 }
 
 void nios2_tcg_init(void)
-- 
2.31.1


