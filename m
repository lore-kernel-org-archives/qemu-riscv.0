Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2jd-0000FU-GH
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2jY-0008TG-Uk
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:19:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2jU-0006yn-4a
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TfHHzUf/ne1SzGHt9JtdfF6smhUP6CvP/geWH7Zk86k=;
 b=gIc4o1ZqUZxF3E3YDg0MZRuDEPFDdOAKosYMEzWcmyM845WmSkESDbLqGO2ZjQbmDDwCvo
 6z19L0WAEWFIeL3ChjG1pBDZOvpZOy05Yz2bUDExnoV55Kbm310Zk6FJBEiCJExRYaC4Wq
 hSDqER1IGrIXn0HWx6yINakfuj6Q+K0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-UlBueg-JPtqnKN6hmEjUIg-1; Tue, 31 Aug 2021 08:19:14 -0400
X-MC-Unique: UlBueg-JPtqnKN6hmEjUIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E3C71009600;
 Tue, 31 Aug 2021 12:19:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FAEB1001281;
 Tue, 31 Aug 2021 12:19:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5C26218009F1; Tue, 31 Aug 2021 14:15:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 28/29] tcg_i386_funcs: Add cpu_cc_compute_all to
 TCGI386ModuleOps
Date: Tue, 31 Aug 2021 14:15:44 +0200
Message-Id: <20210831121545.2874233-29-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
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
X-List-Received-Date: Tue, 31 Aug 2021 12:19:22 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module-i386.h | 1 +
 target/i386/cpu.h             | 4 +---
 accel/tcg/tcg-module-i386.c   | 6 ++++++
 target/i386/tcg/cc_helper.c   | 9 ++++++++-
 target/i386/tcg/fpu_helper.c  | 4 ++--
 target/i386/tcg/int_helper.c  | 8 ++++----
 target/i386/tcg/mem_helper.c  | 8 ++++----
 target/i386/tcg/misc_helper.c | 2 +-
 target/i386/tcg/seg_helper.c  | 8 ++++----
 9 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/include/tcg/tcg-module-i386.h b/include/tcg/tcg-module-i386.h
index 02a9716e2e66..f6cd2bc075c7 100644
--- a/include/tcg/tcg-module-i386.h
+++ b/include/tcg/tcg-module-i386.h
@@ -8,6 +8,7 @@ struct TCGI386ModuleOps {
     void (*x86_register_ferr_irq)(qemu_irq irq);
     void (*cpu_set_ignne)(void);
     void (*cpu_x86_update_dr7)(CPUX86State *env, uint32_t new_dr7);
+    uint32_t (*cpu_cc_compute_all)(CPUX86State *env1, int op);
 };
 extern struct TCGI386ModuleOps tcg_i386;
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0f3922939eb6..43f97fe5686d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2064,13 +2064,11 @@ void cpu_x86_inject_mce(Monitor *mon, X86CPU *cpu, int bank,
                         uint64_t status, uint64_t mcg_status, uint64_t addr,
                         uint64_t misc, int flags);
 
-uint32_t cpu_cc_compute_all(CPUX86State *env1, int op);
-
 static inline uint32_t cpu_compute_eflags(CPUX86State *env)
 {
     uint32_t eflags = env->eflags;
     if (tcg_enabled()) {
-        eflags |= cpu_cc_compute_all(env, CC_OP) | (env->df & DF_MASK);
+        eflags |= tcg_i386.cpu_cc_compute_all(env, CC_OP) | (env->df & DF_MASK);
     }
     return eflags;
 }
diff --git a/accel/tcg/tcg-module-i386.c b/accel/tcg/tcg-module-i386.c
index 1025943c8b21..0954fbbc2db5 100644
--- a/accel/tcg/tcg-module-i386.c
+++ b/accel/tcg/tcg-module-i386.c
@@ -17,6 +17,11 @@ static void cpu_x86_update_dr7_stub(CPUX86State *env, uint32_t new_dr7)
 {
 }
 
+static uint32_t cpu_cc_compute_all_stub(CPUX86State *env1, int op)
+{
+    return 0;
+}
+
 struct TCGI386ModuleOps tcg_i386 = {
     .update_fp_status = i386_update_cpu_stub,
     .update_mxcsr_status = i386_update_cpu_stub,
@@ -24,4 +29,5 @@ struct TCGI386ModuleOps tcg_i386 = {
     .x86_register_ferr_irq = x86_register_ferr_irq_stub,
     .cpu_set_ignne = i386_update_stub,
     .cpu_x86_update_dr7 = cpu_x86_update_dr7_stub,
+    .cpu_cc_compute_all = cpu_cc_compute_all_stub,
 };
diff --git a/target/i386/tcg/cc_helper.c b/target/i386/tcg/cc_helper.c
index cc7ea9e8b9d9..d61f5c5131aa 100644
--- a/target/i386/tcg/cc_helper.c
+++ b/target/i386/tcg/cc_helper.c
@@ -220,7 +220,7 @@ target_ulong helper_cc_compute_all(target_ulong dst, target_ulong src1,
     }
 }
 
-uint32_t cpu_cc_compute_all(CPUX86State *env, int op)
+static uint32_t cpu_cc_compute_all(CPUX86State *env, int op)
 {
     return helper_cc_compute_all(CC_DST, CC_SRC, CC_SRC2, op);
 }
@@ -387,3 +387,10 @@ void helper_sti_vm(CPUX86State *env)
     }
 }
 #endif
+
+static void tcgi386_module_ops_cc(void)
+{
+    tcg_i386.cpu_cc_compute_all = cpu_cc_compute_all;
+}
+
+type_init(tcgi386_module_ops_cc);
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 9a0d1798985b..12d4988713b8 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -469,7 +469,7 @@ void helper_fcomi_ST0_FT0(CPUX86State *env)
     FloatRelation ret;
 
     ret = floatx80_compare(ST0, FT0, &env->fp_status);
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     eflags = (eflags & ~(CC_Z | CC_P | CC_C)) | fcomi_ccval[ret + 1];
     CC_SRC = eflags;
     merge_exception_flags(env, old_flags);
@@ -482,7 +482,7 @@ void helper_fucomi_ST0_FT0(CPUX86State *env)
     FloatRelation ret;
 
     ret = floatx80_compare_quiet(ST0, FT0, &env->fp_status);
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     eflags = (eflags & ~(CC_Z | CC_P | CC_C)) | fcomi_ccval[ret + 1];
     CC_SRC = eflags;
     merge_exception_flags(env, old_flags);
diff --git a/target/i386/tcg/int_helper.c b/target/i386/tcg/int_helper.c
index 87fa7280eec7..658989ebd464 100644
--- a/target/i386/tcg/int_helper.c
+++ b/target/i386/tcg/int_helper.c
@@ -189,7 +189,7 @@ void helper_aaa(CPUX86State *env)
     int al, ah, af;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     af = eflags & CC_A;
     al = env->regs[R_EAX] & 0xff;
     ah = (env->regs[R_EAX] >> 8) & 0xff;
@@ -213,7 +213,7 @@ void helper_aas(CPUX86State *env)
     int al, ah, af;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     af = eflags & CC_A;
     al = env->regs[R_EAX] & 0xff;
     ah = (env->regs[R_EAX] >> 8) & 0xff;
@@ -236,7 +236,7 @@ void helper_daa(CPUX86State *env)
     int old_al, al, af, cf;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     cf = eflags & CC_C;
     af = eflags & CC_A;
     old_al = al = env->regs[R_EAX] & 0xff;
@@ -263,7 +263,7 @@ void helper_das(CPUX86State *env)
     int al, al1, af, cf;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     cf = eflags & CC_C;
     af = eflags & CC_A;
     al = env->regs[R_EAX] & 0xff;
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 2da3cd14b66d..5338b26be7f7 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -33,7 +33,7 @@ void helper_cmpxchg8b_unlocked(CPUX86State *env, target_ulong a0)
     uint64_t oldv, cmpv, newv;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
 
     cmpv = deposit64(env->regs[R_EAX], 32, 32, env->regs[R_EDX]);
     newv = deposit64(env->regs[R_EBX], 32, 32, env->regs[R_ECX]);
@@ -59,7 +59,7 @@ void helper_cmpxchg8b(CPUX86State *env, target_ulong a0)
     uint64_t oldv, cmpv, newv;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
 
     cmpv = deposit64(env->regs[R_EAX], 32, 32, env->regs[R_EDX]);
     newv = deposit64(env->regs[R_EBX], 32, 32, env->regs[R_ECX]);
@@ -96,7 +96,7 @@ void helper_cmpxchg16b_unlocked(CPUX86State *env, target_ulong a0)
     if ((a0 & 0xf) != 0) {
         raise_exception_ra(env, EXCP0D_GPF, GETPC());
     }
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
 
     cmpv = int128_make128(env->regs[R_EAX], env->regs[R_EDX]);
     newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
@@ -130,7 +130,7 @@ void helper_cmpxchg16b(CPUX86State *env, target_ulong a0)
     if ((a0 & 0xf) != 0) {
         raise_exception_ra(env, EXCP0D_GPF, ra);
     } else if (HAVE_CMPXCHG128) {
-        int eflags = cpu_cc_compute_all(env, CC_OP);
+        int eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
 
         Int128 cmpv = int128_make128(env->regs[R_EAX], env->regs[R_EDX]);
         Int128 newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index dc974dad6acc..15c549277ebc 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -40,7 +40,7 @@ void helper_into(CPUX86State *env, int next_eip_addend)
 {
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     if (eflags & CC_O) {
         raise_interrupt(env, EXCP04_INTO, 1, 0, next_eip_addend);
     }
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index f39d5be97b94..cae88059689f 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -2252,7 +2252,7 @@ target_ulong helper_lsl(CPUX86State *env, target_ulong selector1)
     int rpl, dpl, cpl, type;
 
     selector = selector1 & 0xffff;
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     if ((selector & 0xfffc) == 0) {
         goto fail;
     }
@@ -2299,7 +2299,7 @@ target_ulong helper_lar(CPUX86State *env, target_ulong selector1)
     int rpl, dpl, cpl, type;
 
     selector = selector1 & 0xffff;
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     if ((selector & 0xfffc) == 0) {
         goto fail;
     }
@@ -2348,7 +2348,7 @@ void helper_verr(CPUX86State *env, target_ulong selector1)
     int rpl, dpl, cpl;
 
     selector = selector1 & 0xffff;
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     if ((selector & 0xfffc) == 0) {
         goto fail;
     }
@@ -2386,7 +2386,7 @@ void helper_verw(CPUX86State *env, target_ulong selector1)
     int rpl, dpl, cpl;
 
     selector = selector1 & 0xffff;
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     if ((selector & 0xfffc) == 0) {
         goto fail;
     }
-- 
2.31.1


