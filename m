Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2jO-0008Im-09
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2jC-00088X-8t
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:18:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2j8-0006kH-OE
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7/kp6ZcRFvxoK6BJgtBhQaabSWzcO2N+/IvjX3LuSo=;
 b=hTXf3cKGbJHUsY0gJfIixYMO1yK/AsKfhw9PfDjMgJZCpU/6OaCEyfh2DQXcYnzIl236Oq
 4BA8KIAqhJPO7ySAFoXYPlmg//tlTH7RYRAs8xbshGiVCyLG2QbqgiUT0/JLUO0qbrTuub
 iHyWSGE12DwIs8Ionuqw72wQUDi6OoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-wzZQLAZwOJq8XmMfOrETSg-1; Tue, 31 Aug 2021 08:18:52 -0400
X-MC-Unique: wzZQLAZwOJq8XmMfOrETSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72819875118;
 Tue, 31 Aug 2021 12:18:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D522060BD8;
 Tue, 31 Aug 2021 12:18:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DF22F18009E9; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
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
Subject: [PATCH 23/29] tcg_i386_funcs: Add update_mxcsr_status to
 TCGI386ModuleOps
Date: Tue, 31 Aug 2021 14:15:39 +0200
Message-Id: <20210831121545.2874233-24-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-List-Received-Date: Tue, 31 Aug 2021 12:18:59 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module-i386.h | 1 +
 target/i386/cpu.h             | 3 +--
 accel/tcg/tcg-module-i386.c   | 1 +
 target/i386/machine.c         | 2 +-
 target/i386/tcg/fpu_helper.c  | 3 ++-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg-module-i386.h b/include/tcg/tcg-module-i386.h
index 3854b506d5dc..5d8f6434e32d 100644
--- a/include/tcg/tcg-module-i386.h
+++ b/include/tcg/tcg-module-i386.h
@@ -3,6 +3,7 @@
 
 struct TCGI386ModuleOps {
     void (*update_fp_status)(CPUX86State *env);
+    void (*update_mxcsr_status)(CPUX86State *env);
 };
 extern struct TCGI386ModuleOps tcg_i386;
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5769c1292683..bdfdbdb0d8a8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2128,14 +2128,13 @@ static inline bool cpu_vmx_maybe_enabled(CPUX86State *env)
 int get_pg_mode(CPUX86State *env);
 
 /* fpu_helper.c */
-void update_mxcsr_status(CPUX86State *env);
 void update_mxcsr_from_sse_status(CPUX86State *env);
 
 static inline void cpu_set_mxcsr(CPUX86State *env, uint32_t mxcsr)
 {
     env->mxcsr = mxcsr;
     if (tcg_enabled()) {
-        update_mxcsr_status(env);
+        tcg_i386.update_mxcsr_status(env);
     }
 }
 
diff --git a/accel/tcg/tcg-module-i386.c b/accel/tcg/tcg-module-i386.c
index 41ce2ba4eb76..fa455a2e02cb 100644
--- a/accel/tcg/tcg-module-i386.c
+++ b/accel/tcg/tcg-module-i386.c
@@ -7,4 +7,5 @@ static void i386_update_cpu_stub(CPUX86State *cpu)
 
 struct TCGI386ModuleOps tcg_i386 = {
     .update_fp_status = i386_update_cpu_stub,
+    .update_mxcsr_status = i386_update_cpu_stub,
 };
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 7f5d80766f28..dc63de37dd6f 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -372,7 +372,7 @@ static int cpu_post_load(void *opaque, int version_id)
     if (tcg_enabled()) {
         target_ulong dr7;
         tcg_i386.update_fp_status(env);
-        update_mxcsr_status(env);
+        tcg_i386.update_mxcsr_status(env);
 
         cpu_breakpoint_remove_all(cs, BP_CPU);
         cpu_watchpoint_remove_all(cs, BP_CPU);
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 0f7206e834fd..12dd6c9a65df 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2947,7 +2947,7 @@ void helper_xsetbv(CPUX86State *env, uint32_t ecx, uint64_t mask)
 #define SSE_RC_CHOP         0x6000
 #define SSE_FZ              0x8000
 
-void update_mxcsr_status(CPUX86State *env)
+static void update_mxcsr_status(CPUX86State *env)
 {
     uint32_t mxcsr = env->mxcsr;
     int rnd_type;
@@ -3043,6 +3043,7 @@ void helper_movq(CPUX86State *env, void *d, void *s)
 static void tcgi386_module_ops_fpu(void)
 {
     tcg_i386.update_fp_status = update_fp_status;
+    tcg_i386.update_mxcsr_status = update_mxcsr_status;
 }
 
 type_init(tcgi386_module_ops_fpu);
-- 
2.31.1


