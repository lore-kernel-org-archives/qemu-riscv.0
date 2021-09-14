Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9Mo-0006jz-ML
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9MU-0006F2-6W
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:24:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9ML-0005Qq-2S
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3YLRVW0oFoZglAlAy4KiGneoC45YXK+pcucpdSfC/k8=;
 b=PklRqdncCwLD4PMp13tUP1SLtoCG0zzmDQQYWXtAo7T4OGS1tapuGH1/7Cl+STMEAgxFyw
 LM0b/whF0rhTk+u657RzusUF42biDytTOEy7LTBI7z5A3hF8pSsfcp7OyR3hD5dEXLmG+j
 3xYidYy3rjciN2jur/LIUiVbYtjF6+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-ovBrFADYMLKm8tduxgsr8g-1; Tue, 14 Sep 2021 10:24:26 -0400
X-MC-Unique: ovBrFADYMLKm8tduxgsr8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9365D1084684;
 Tue, 14 Sep 2021 14:24:22 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B4F25D9CA;
 Tue, 14 Sep 2021 14:24:14 +0000 (UTC)
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
Subject: [PATCH v2 12/53] target/hexagon: convert to use format_state instead
 of dump_state
Date: Tue, 14 Sep 2021 15:20:01 +0100
Message-Id: <20210914142042.1655100-13-berrange@redhat.com>
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
X-List-Received-Date: Tue, 14 Sep 2021 14:24:46 -0000

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/hexagon/cpu.c | 65 ++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 14c628db7a..7802186ad7 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -98,7 +98,7 @@ static target_ulong read_p3_0(CPUHexagonState *env)
     return control_reg;
 }
 
-static void print_reg(FILE *f, CPUHexagonState *env, int regnum)
+static void format_reg(GString *buf, CPUHexagonState *env, int regnum)
 {
     target_ulong value;
 
@@ -109,13 +109,14 @@ static void print_reg(FILE *f, CPUHexagonState *env, int regnum)
                             : env->gpr[regnum];
     }
 
-    qemu_fprintf(f, "  %s = 0x" TARGET_FMT_lx "\n",
-                 hexagon_regnames[regnum], value);
+    g_string_append_printf(buf, "  %s = 0x" TARGET_FMT_lx "\n",
+                           hexagon_regnames[regnum], value);
 }
 
-static void hexagon_dump(CPUHexagonState *env, FILE *f)
+static void hexagon_format_state(CPUState *cs, GString *buf, int flags)
 {
-    HexagonCPU *cpu = env_archcpu(env);
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
 
     if (cpu->lldb_compat) {
         /*
@@ -128,45 +129,37 @@ static void hexagon_dump(CPUHexagonState *env, FILE *f)
         env->last_pc_dumped = env->gpr[HEX_REG_PC];
     }
 
-    qemu_fprintf(f, "General Purpose Registers = {\n");
+    g_string_append_printf(buf, "General Purpose Registers = {\n");
     for (int i = 0; i < 32; i++) {
-        print_reg(f, env, i);
+        format_reg(buf, env, i);
     }
-    print_reg(f, env, HEX_REG_SA0);
-    print_reg(f, env, HEX_REG_LC0);
-    print_reg(f, env, HEX_REG_SA1);
-    print_reg(f, env, HEX_REG_LC1);
-    print_reg(f, env, HEX_REG_M0);
-    print_reg(f, env, HEX_REG_M1);
-    print_reg(f, env, HEX_REG_USR);
-    print_reg(f, env, HEX_REG_P3_0);
-    print_reg(f, env, HEX_REG_GP);
-    print_reg(f, env, HEX_REG_UGP);
-    print_reg(f, env, HEX_REG_PC);
+    format_reg(buf, env, HEX_REG_SA0);
+    format_reg(buf, env, HEX_REG_LC0);
+    format_reg(buf, env, HEX_REG_SA1);
+    format_reg(buf, env, HEX_REG_LC1);
+    format_reg(buf, env, HEX_REG_M0);
+    format_reg(buf, env, HEX_REG_M1);
+    format_reg(buf, env, HEX_REG_USR);
+    format_reg(buf, env, HEX_REG_P3_0);
+    format_reg(buf, env, HEX_REG_GP);
+    format_reg(buf, env, HEX_REG_UGP);
+    format_reg(buf, env, HEX_REG_PC);
 #ifdef CONFIG_USER_ONLY
     /*
      * Not modelled in user mode, print junk to minimize the diff's
      * with LLDB output
      */
-    qemu_fprintf(f, "  cause = 0x000000db\n");
-    qemu_fprintf(f, "  badva = 0x00000000\n");
-    qemu_fprintf(f, "  cs0 = 0x00000000\n");
-    qemu_fprintf(f, "  cs1 = 0x00000000\n");
+    g_string_append_printf(buf, "  cause = 0x000000db\n");
+    g_string_append_printf(buf, "  badva = 0x00000000\n");
+    g_string_append_printf(buf, "  cs0 = 0x00000000\n");
+    g_string_append_printf(buf, "  cs1 = 0x00000000\n");
 #else
-    print_reg(f, env, HEX_REG_CAUSE);
-    print_reg(f, env, HEX_REG_BADVA);
-    print_reg(f, env, HEX_REG_CS0);
-    print_reg(f, env, HEX_REG_CS1);
+    format_reg(buf, env, HEX_REG_CAUSE);
+    format_reg(buf, env, HEX_REG_BADVA);
+    format_reg(buf, env, HEX_REG_CS0);
+    format_reg(buf, env, HEX_REG_CS1);
 #endif
-    qemu_fprintf(f, "}\n");
-}
-
-static void hexagon_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    HexagonCPU *cpu = HEXAGON_CPU(cs);
-    CPUHexagonState *env = &cpu->env;
-
-    hexagon_dump(env, f);
+    g_string_append_printf(buf, "}\n");
 }
 
 static void hexagon_cpu_set_pc(CPUState *cs, vaddr value)
@@ -283,7 +276,7 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = hexagon_cpu_class_by_name;
     cc->has_work = hexagon_cpu_has_work;
-    cc->dump_state = hexagon_dump_state;
+    cc->format_state = hexagon_format_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
     cc->gdb_write_register = hexagon_gdb_write_register;
-- 
2.31.1


