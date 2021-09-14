Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Ox-0000mu-RL
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Om-0000bx-UT
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Ok-0007Iu-OO
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRCBRjWGqeIljdUzcqW2nBCNswQEV4Di7Dt1tu1kl6Q=;
 b=RH2fOunDZquTNF0yJyqMRssW5rCfQshmisJTkTqDQMNuChwuN3wpd6UFlsvnPTu5+vVdqR
 GYIBjmQkqWSAcQXwsCFCgc3GJdWaL0Xwq65Yo/ByST0mwAKlGWT8LJgYYw/jaSkezEIpuU
 BrDhvu0w8k3aTVLEXku3PKv42DXdVR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-KwcF5jD4PpSZf-WEfz9AZg-1; Tue, 14 Sep 2021 10:26:55 -0400
X-MC-Unique: KwcF5jD4PpSZf-WEfz9AZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9ADB802E64;
 Tue, 14 Sep 2021 14:26:46 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 464045D9CA;
 Tue, 14 Sep 2021 14:26:22 +0000 (UTC)
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
Subject: [PATCH v2 17/53] target/mips: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:06 +0100
Message-Id: <20210914142042.1655100-18-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:27:05 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/mips/cpu.c | 85 +++++++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 40 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d426918291..9ced90d810 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -42,76 +42,81 @@ const char regnames[32][3] = {
     "t8", "t9", "k0", "k1", "gp", "sp", "s8", "ra",
 };
 
-static void fpu_dump_fpr(fpr_t *fpr, FILE *f, bool is_fpu64)
+static void fpu_dump_fpr(fpr_t *fpr, GString *buf, bool is_fpu64)
 {
     if (is_fpu64) {
-        qemu_fprintf(f, "w:%08x d:%016" PRIx64 " fd:%13g fs:%13g psu: %13g\n",
-                     fpr->w[FP_ENDIAN_IDX], fpr->d,
-                     (double)fpr->fd,
-                     (double)fpr->fs[FP_ENDIAN_IDX],
-                     (double)fpr->fs[!FP_ENDIAN_IDX]);
+        g_string_append_printf(buf, "w:%08x d:%016" PRIx64
+                               " fd:%13g fs:%13g psu: %13g\n",
+                               fpr->w[FP_ENDIAN_IDX], fpr->d,
+                               (double)fpr->fd,
+                               (double)fpr->fs[FP_ENDIAN_IDX],
+                               (double)fpr->fs[!FP_ENDIAN_IDX]);
     } else {
         fpr_t tmp;
 
         tmp.w[FP_ENDIAN_IDX] = fpr->w[FP_ENDIAN_IDX];
         tmp.w[!FP_ENDIAN_IDX] = (fpr + 1)->w[FP_ENDIAN_IDX];
-        qemu_fprintf(f, "w:%08x d:%016" PRIx64 " fd:%13g fs:%13g psu:%13g\n",
-                     tmp.w[FP_ENDIAN_IDX], tmp.d,
-                     (double)tmp.fd,
-                     (double)tmp.fs[FP_ENDIAN_IDX],
-                     (double)tmp.fs[!FP_ENDIAN_IDX]);
+        g_string_append_printf(buf, "w:%08x d:%016" PRIx64
+                               " fd:%13g fs:%13g psu:%13g\n",
+                               tmp.w[FP_ENDIAN_IDX], tmp.d,
+                               (double)tmp.fd,
+                               (double)tmp.fs[FP_ENDIAN_IDX],
+                               (double)tmp.fs[!FP_ENDIAN_IDX]);
     }
 }
 
-static void fpu_dump_state(CPUMIPSState *env, FILE *f, int flags)
+static void fpu_format_state(CPUMIPSState *env, GString *buf, int flags)
 {
     int i;
     bool is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
 
-    qemu_fprintf(f,
-                 "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d  fp_status 0x%02x\n",
-                 env->active_fpu.fcr0, env->active_fpu.fcr31, is_fpu64,
-                 get_float_exception_flags(&env->active_fpu.fp_status));
+    g_string_append_printf(buf,
+                           "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d "
+                           " fp_status 0x%02x\n",
+                           env->active_fpu.fcr0, env->active_fpu.fcr31,
+                           is_fpu64, get_float_exception_flags(
+                               &env->active_fpu.fp_status));
     for (i = 0; i < 32; (is_fpu64) ? i++ : (i += 2)) {
-        qemu_fprintf(f, "%3s: ", fregnames[i]);
-        fpu_dump_fpr(&env->active_fpu.fpr[i], f, is_fpu64);
+        g_string_append_printf(buf, "%3s: ", fregnames[i]);
+        fpu_dump_fpr(&env->active_fpu.fpr[i], buf, is_fpu64);
     }
 }
 
-static void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+static void mips_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
     int i;
 
-    qemu_fprintf(f, "pc=0x" TARGET_FMT_lx " HI=0x" TARGET_FMT_lx
-                 " LO=0x" TARGET_FMT_lx " ds %04x "
-                 TARGET_FMT_lx " " TARGET_FMT_ld "\n",
-                 env->active_tc.PC, env->active_tc.HI[0], env->active_tc.LO[0],
-                 env->hflags, env->btarget, env->bcond);
+    g_string_append_printf(buf, "pc=0x" TARGET_FMT_lx " HI=0x" TARGET_FMT_lx
+                           " LO=0x" TARGET_FMT_lx " ds %04x "
+                           TARGET_FMT_lx " " TARGET_FMT_ld "\n",
+                           env->active_tc.PC, env->active_tc.HI[0],
+                           env->active_tc.LO[0],
+                           env->hflags, env->btarget, env->bcond);
     for (i = 0; i < 32; i++) {
         if ((i & 3) == 0) {
-            qemu_fprintf(f, "GPR%02d:", i);
+            g_string_append_printf(buf, "GPR%02d:", i);
         }
-        qemu_fprintf(f, " %s " TARGET_FMT_lx,
-                     regnames[i], env->active_tc.gpr[i]);
+        g_string_append_printf(buf, " %s " TARGET_FMT_lx,
+                               regnames[i], env->active_tc.gpr[i]);
         if ((i & 3) == 3) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         }
     }
 
-    qemu_fprintf(f, "CP0 Status  0x%08x Cause   0x%08x EPC    0x"
-                 TARGET_FMT_lx "\n",
-                 env->CP0_Status, env->CP0_Cause, env->CP0_EPC);
-    qemu_fprintf(f, "    Config0 0x%08x Config1 0x%08x LLAddr 0x%016"
-                 PRIx64 "\n",
-                 env->CP0_Config0, env->CP0_Config1, env->CP0_LLAddr);
-    qemu_fprintf(f, "    Config2 0x%08x Config3 0x%08x\n",
-                 env->CP0_Config2, env->CP0_Config3);
-    qemu_fprintf(f, "    Config4 0x%08x Config5 0x%08x\n",
-                 env->CP0_Config4, env->CP0_Config5);
+    g_string_append_printf(buf, "CP0 Status  0x%08x Cause   0x%08x EPC    0x"
+                           TARGET_FMT_lx "\n",
+                           env->CP0_Status, env->CP0_Cause, env->CP0_EPC);
+    g_string_append_printf(buf, "    Config0 0x%08x Config1 0x%08x LLAddr "
+                           "0x%016" PRIx64 "\n",
+                           env->CP0_Config0, env->CP0_Config1, env->CP0_LLAddr);
+    g_string_append_printf(buf, "    Config2 0x%08x Config3 0x%08x\n",
+                           env->CP0_Config2, env->CP0_Config3);
+    g_string_append_printf(buf, "    Config4 0x%08x Config5 0x%08x\n",
+                           env->CP0_Config4, env->CP0_Config5);
     if ((flags & CPU_DUMP_FPU) && (env->hflags & MIPS_HFLAG_FPU)) {
-        fpu_dump_state(env, f, flags);
+        fpu_format_state(env, buf, flags);
     }
 }
 
@@ -564,7 +569,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
-    cc->dump_state = mips_cpu_dump_state;
+    cc->format_state = mips_cpu_format_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
     cc->gdb_write_register = mips_cpu_gdb_write_register;
-- 
2.31.1


