Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Qk-0002nt-Gp
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Qc-0002ik-V1
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9QZ-0000GJ-KU
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qmRjzYwG+Lqfcps3G17xaNhRzRStWHGYP7XEVvjTzcM=;
 b=aD9lNuCXnA3NfKFIRR7jpQfJanT4MLYd52X5tmfN59NqekPvFJGrj3uBEj73nJlcm9S7VZ
 vbqi9y9jLQ/3pjveqLT0tHTYqUARl1HJCjg8pBHaaM81j6wCKYSNpAlXrqwsWYXsANt67z
 OcugroLO2b4DnGnAtJ+v5mX07IQQAG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-yKE_4DFNPHKCIDnj822tIg-1; Tue, 14 Sep 2021 10:28:49 -0400
X-MC-Unique: yKE_4DFNPHKCIDnj822tIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B2DFA0CCD;
 Tue, 14 Sep 2021 14:28:45 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AE295D9CA;
 Tue, 14 Sep 2021 14:27:57 +0000 (UTC)
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
Subject: [PATCH v2 22/53] target/rx: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:11 +0100
Message-Id: <20210914142042.1655100-23-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:28:55 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/rx/cpu.c       |  2 +-
 target/rx/cpu.h       |  2 +-
 target/rx/translate.c | 14 ++++++++------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 96cc96e514..f7f158cfa5 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -207,7 +207,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
 
     cc->class_by_name = rx_cpu_class_by_name;
     cc->has_work = rx_cpu_has_work;
-    cc->dump_state = rx_cpu_dump_state;
+    cc->format_state = rx_cpu_format_state;
     cc->set_pc = rx_cpu_set_pc;
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0b4b998c7b..97fc1b9ed6 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -126,7 +126,7 @@ typedef RXCPU ArchCPU;
 const char *rx_crname(uint8_t cr);
 void rx_cpu_do_interrupt(CPUState *cpu);
 bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void rx_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
diff --git a/target/rx/translate.c b/target/rx/translate.c
index a3cf720455..2d3bdabce4 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -125,7 +125,7 @@ static int bdsp_s(DisasContext *ctx, int d)
 /* Include the auto-generated decoder. */
 #include "decode-insns.c.inc"
 
-void rx_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void rx_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     RXCPU *cpu = RX_CPU(cs);
     CPURXState *env = &cpu->env;
@@ -133,12 +133,14 @@ void rx_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     uint32_t psw;
 
     psw = rx_cpu_pack_psw(env);
-    qemu_fprintf(f, "pc=0x%08x psw=0x%08x\n",
-                 env->pc, psw);
+    g_string_append_printf(buf, "pc=0x%08x psw=0x%08x\n",
+                           env->pc, psw);
     for (i = 0; i < 16; i += 4) {
-        qemu_fprintf(f, "r%d=0x%08x r%d=0x%08x r%d=0x%08x r%d=0x%08x\n",
-                     i, env->regs[i], i + 1, env->regs[i + 1],
-                     i + 2, env->regs[i + 2], i + 3, env->regs[i + 3]);
+        g_string_append_printf(buf,
+                               "r%d=0x%08x r%d=0x%08x r%d=0x%08x r%d=0x%08x\n",
+                               i, env->regs[i], i + 1, env->regs[i + 1],
+                               i + 2, env->regs[i + 2], i + 3,
+                               env->regs[i + 3]);
     }
 }
 
-- 
2.31.1


