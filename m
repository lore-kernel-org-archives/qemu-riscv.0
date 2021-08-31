Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2jQ-0008Kc-GJ
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2jF-0008B0-2m
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2jB-0006mD-G9
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qiRX0Suz4eEcLoNuIeaDXeDr5OG1xIEgcGYjIBCDH+4=;
 b=BcopqL7sPc8RTWxkXoL24OSRGX8fLALxZ4NLUWctph1/WtpbYT8yK2MtVPF2+KqKk+QGc7
 4qdLfrKE0JR/uF+YRUDRh4ERm8uZUFpH2H9ycoBwWKmzRMTE8oPgkVVcSaa8BNqGD3TXas
 WV+WyDHvPxkT+4z98rKgsN4B9loj81I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-2FKuroJ9OJi4TR3ILFhEjw-1; Tue, 31 Aug 2021 08:18:54 -0400
X-MC-Unique: 2FKuroJ9OJi4TR3ILFhEjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 821DD9392B;
 Tue, 31 Aug 2021 12:18:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAECD27CA6;
 Tue, 31 Aug 2021 12:18:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0305118009EA; Tue, 31 Aug 2021 14:15:47 +0200 (CEST)
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
Subject: [PATCH 24/29] tcg_i386_funcs: Add update_mxcsr_from_sse_status to
 TCGI386ModuleOps
Date: Tue, 31 Aug 2021 14:15:40 +0200
Message-Id: <20210831121545.2874233-25-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-List-Received-Date: Tue, 31 Aug 2021 12:19:01 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module-i386.h |  2 ++
 target/i386/cpu.h             |  3 ---
 accel/tcg/tcg-module-i386.c   |  1 +
 target/i386/cpu-dump.c        |  2 +-
 target/i386/gdbstub.c         |  2 +-
 target/i386/tcg/fpu_helper.c  |  5 +++--
 target/i386/tcg/tcg-stub.c    | 25 -------------------------
 target/i386/tcg/meson.build   |  2 --
 8 files changed, 8 insertions(+), 34 deletions(-)
 delete mode 100644 target/i386/tcg/tcg-stub.c

diff --git a/include/tcg/tcg-module-i386.h b/include/tcg/tcg-module-i386.h
index 5d8f6434e32d..576e0a63f01f 100644
--- a/include/tcg/tcg-module-i386.h
+++ b/include/tcg/tcg-module-i386.h
@@ -4,6 +4,8 @@
 struct TCGI386ModuleOps {
     void (*update_fp_status)(CPUX86State *env);
     void (*update_mxcsr_status)(CPUX86State *env);
+    void (*update_mxcsr_from_sse_status)(CPUX86State *env);
+
 };
 extern struct TCGI386ModuleOps tcg_i386;
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index bdfdbdb0d8a8..deba8eb04d1f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2127,9 +2127,6 @@ static inline bool cpu_vmx_maybe_enabled(CPUX86State *env)
 /* excp_helper.c */
 int get_pg_mode(CPUX86State *env);
 
-/* fpu_helper.c */
-void update_mxcsr_from_sse_status(CPUX86State *env);
-
 static inline void cpu_set_mxcsr(CPUX86State *env, uint32_t mxcsr)
 {
     env->mxcsr = mxcsr;
diff --git a/accel/tcg/tcg-module-i386.c b/accel/tcg/tcg-module-i386.c
index fa455a2e02cb..6908fe34cef6 100644
--- a/accel/tcg/tcg-module-i386.c
+++ b/accel/tcg/tcg-module-i386.c
@@ -8,4 +8,5 @@ static void i386_update_cpu_stub(CPUX86State *cpu)
 struct TCGI386ModuleOps tcg_i386 = {
     .update_fp_status = i386_update_cpu_stub,
     .update_mxcsr_status = i386_update_cpu_stub,
+    .update_mxcsr_from_sse_status = i386_update_cpu_stub,
 };
diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index 02b635a52cff..cce9110705c7 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -487,7 +487,7 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         for(i = 0; i < 8; i++) {
             fptag |= ((!env->fptags[i]) << i);
         }
-        update_mxcsr_from_sse_status(env);
+        tcg_i386.update_mxcsr_from_sse_status(env);
         qemu_fprintf(f, "FCW=%04x FSW=%04x [ST=%d] FTW=%02x MXCSR=%08x\n",
                      env->fpuc,
                      (env->fpus & ~0x3800) | (env->fpstt & 0x7) << 11,
diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 098a2ad15a9c..e73125dbe9e2 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -190,7 +190,7 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
             return gdb_get_reg32(mem_buf, 0); /* fop */
 
         case IDX_MXCSR_REG:
-            update_mxcsr_from_sse_status(env);
+            tcg_i386.update_mxcsr_from_sse_status(env);
             return gdb_get_reg32(mem_buf, env->mxcsr);
 
         case IDX_CTL_CR0_REG:
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 12dd6c9a65df..9a0d1798985b 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2534,7 +2534,7 @@ static void do_xsave_fpu(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 
 static void do_xsave_mxcsr(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 {
-    update_mxcsr_from_sse_status(env);
+    tcg_i386.update_mxcsr_from_sse_status(env);
     cpu_stl_data_ra(env, ptr + XO(legacy.mxcsr), env->mxcsr, ra);
     cpu_stl_data_ra(env, ptr + XO(legacy.mxcsr_mask), 0x0000ffff, ra);
 }
@@ -2985,7 +2985,7 @@ static void update_mxcsr_status(CPUX86State *env)
     set_flush_to_zero((mxcsr & SSE_FZ) ? 1 : 0, &env->sse_status);
 }
 
-void update_mxcsr_from_sse_status(CPUX86State *env)
+static void update_mxcsr_from_sse_status(CPUX86State *env)
 {
     uint8_t flags = get_float_exception_flags(&env->sse_status);
     /*
@@ -3044,6 +3044,7 @@ static void tcgi386_module_ops_fpu(void)
 {
     tcg_i386.update_fp_status = update_fp_status;
     tcg_i386.update_mxcsr_status = update_mxcsr_status;
+    tcg_i386.update_mxcsr_from_sse_status = update_mxcsr_from_sse_status;
 }
 
 type_init(tcgi386_module_ops_fpu);
diff --git a/target/i386/tcg/tcg-stub.c b/target/i386/tcg/tcg-stub.c
deleted file mode 100644
index 8d45579ada25..000000000000
--- a/target/i386/tcg/tcg-stub.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- *  x86 FPU, MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4/PNI helpers
- *
- *  Copyright (c) 2003 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-
-void update_mxcsr_from_sse_status(CPUX86State *env)
-{
-}
diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
index 7bbe3d926975..8162511e6dac 100644
--- a/target/i386/tcg/meson.build
+++ b/target/i386/tcg/meson.build
@@ -1,5 +1,3 @@
-i386_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
-
 files_ss = ss.source_set()
 files_ss.add(when: 'CONFIG_TCG', if_true: files(
   'bpt_helper.c',
-- 
2.31.1


