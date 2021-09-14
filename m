Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9PM-0000v6-Nd
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9P9-0000oY-Kz
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:27:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9P6-0007XA-MK
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wDxv/ynJAT6bxB9NSeiHYS4UowdIUh6a7fG4sUwkpU=;
 b=H/W2ihAB9RFkqY/xLjWQLYnCeRmPPURRaWGmJ6IYo6L+d4lV8meKjeCWvd4A2New+xCf7/
 J8sK7/fVc7HtPXfqYa03Mp0JV2ZOWrwiMLqn1uI+1A3Jx9a6T0pSre2VMqHIK6PvkCNvHs
 us4x60+y8TJkz+4Gee0lfmHd4bCx/zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-T2ixmEeIOZmDohW-2iSoeA-1; Tue, 14 Sep 2021 10:27:18 -0400
X-MC-Unique: T2ixmEeIOZmDohW-2iSoeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 120531084681;
 Tue, 14 Sep 2021 14:27:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28BDB5D9CA;
 Tue, 14 Sep 2021 14:27:02 +0000 (UTC)
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
Subject: [PATCH v2 19/53] target/openrisc: convert to use format_state instead
 of dump_state
Date: Tue, 14 Sep 2021 15:20:08 +0100
Message-Id: <20210914142042.1655100-20-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:27:25 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/openrisc/cpu.c       | 2 +-
 target/openrisc/cpu.h       | 2 +-
 target/openrisc/translate.c | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index bd34e429ec..d60d248958 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -206,7 +206,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
-    cc->dump_state = openrisc_cpu_dump_state;
+    cc->format_state = openrisc_cpu_format_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 82cbaeb4f8..112b845b10 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -314,7 +314,7 @@ struct OpenRISCCPU {
 void cpu_openrisc_list(void);
 void openrisc_cpu_do_interrupt(CPUState *cpu);
 bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void openrisc_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index d6ea536744..0155f2b160 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1723,16 +1723,16 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     translator_loop(&openrisc_tr_ops, &ctx.base, cs, tb, max_insns);
 }
 
-void openrisc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void openrisc_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     CPUOpenRISCState *env = &cpu->env;
     int i;
 
-    qemu_fprintf(f, "PC=%08x\n", env->pc);
+    g_string_append_printf(buf, "PC=%08x\n", env->pc);
     for (i = 0; i < 32; ++i) {
-        qemu_fprintf(f, "R%02d=%08x%c", i, cpu_get_gpr(env, i),
-                     (i % 4) == 3 ? '\n' : ' ');
+        g_string_append_printf(buf, "R%02d=%08x%c", i, cpu_get_gpr(env, i),
+                               (i % 4) == 3 ? '\n' : ' ');
     }
 }
 
-- 
2.31.1


