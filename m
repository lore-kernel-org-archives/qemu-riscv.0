Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVTjA-0005iP-Vb
	for mharc-qemu-riscv@gnu.org; Wed, 29 Sep 2021 03:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVTj3-0005cl-8J
 for qemu-riscv@nongnu.org; Wed, 29 Sep 2021 03:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVTiz-0006Ki-8N
 for qemu-riscv@nongnu.org; Wed, 29 Sep 2021 03:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632899392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e4LTv5c9o02J0AF9acSdDwFlmBoJ1VBhmXikRUTwhPQ=;
 b=Cy9CxMrshXKh6hPuSy0T/s3sSVbPE3gguFfO7SSCkXUwb4+b+TLGCt2BUHAF2TkWu+LZcW
 LxwZSiXOyJadBbAL3qZWaxfd4ZIqQ/cvLPUcE06N5UQf+UJAujxp22V1YSWUrhegu+Ge6E
 KXcffCVzZjujJguhbAsVuUEfl5IJNnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-MGC1GKpJO56snEeZpILdXw-1; Wed, 29 Sep 2021 03:09:50 -0400
X-MC-Unique: MGC1GKpJO56snEeZpILdXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B329B824FAB;
 Wed, 29 Sep 2021 07:09:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7838219C79;
 Wed, 29 Sep 2021 07:09:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B4CC61800386; Wed, 29 Sep 2021 09:09:44 +0200 (CEST)
Date: Wed, 29 Sep 2021 09:09:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-riscv@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Greg Kurz <groug@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 10/29] tcg_funcs: Add tlb_flush to TCGModuleOps
Message-ID: <20210929070944.in75jgdfwv2rd4tz@sirius.home.kraxel.org>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-11-kraxel@redhat.com>
 <fdfd7f35-fbec-84f7-ebbd-7790df20b1bd@linaro.org>
 <20210928113204.ic2syx4w2cjsqr7h@sirius.home.kraxel.org>
 <9d3cceef-f385-5d0b-6b0d-2b7be17ce187@linaro.org>
MIME-Version: 1.0
In-Reply-To: <9d3cceef-f385-5d0b-6b0d-2b7be17ce187@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Wed, 29 Sep 2021 07:09:59 -0000

> > +#ifdef TCG_DIRECT_CALL
> >   void tlb_flush(CPUState *cpu);
> > +#endif
> 
> I'm pretty sure you can drop these ifdefs.  Just because there's a regular
> declaration for a function doesn't mean a subsequent inline definition does
> not apply.

Couldn't get this work.  With "static inline" I get declaration
mismatch, with only "inline" I get duplicate symbols.

> And even if that didn't work, I'd be willing to trade inline expansion for
> not adding lots of ifdefs...

That works.  Patch below (replacement for this patch).

TODO: Not sure whenever "check function pointer before call" or
"function pointers to stubs" is better.  Right now the patch has both
which clearly doesn't make sense.  Comments on that are welcome.

take care,
  Gerd

From fb1d9521fba11cf51f2719b587deeab79b7110ac Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 27 Jul 2021 12:01:24 +0200
Subject: [PATCH] tcg_funcs: Add tlb_flush to TCGModuleOps

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h     | 25 ++++++++++++-------------
 include/tcg/tcg-module.h    |  1 +
 accel/tcg/cpu-exec-common.c |  8 ++++++++
 accel/tcg/cputlb.c          |  7 +++++++
 accel/tcg/tcg-module.c      | 21 +++++++++++++++++++++
 accel/tcg/translate-all.c   |  8 --------
 6 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9d5987ba047d..f846ab0c929d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #endif
 #include "sysemu/cpu-timers.h"
+#include "tcg/tcg-module.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
 #define DEBUG_DISAS
@@ -108,6 +109,17 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr);
 #endif
 
+/**
+ * tlb_flush:
+ * @cpu: CPU whose TLB should be flushed
+ *
+ * Flush the entire TLB for the specified CPU. Most CPU architectures
+ * allow the implementation to drop entries from the TLB at any time
+ * so this is generally safe. If more selective flushing is required
+ * use one of the other functions for efficiency.
+ */
+void tlb_flush(CPUState *cpu);
+
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /* cputlb.c */
 /**
@@ -150,16 +162,6 @@ void tlb_flush_page_all_cpus(CPUState *src, target_ulong addr);
  * the guests translation ends the TB.
  */
 void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr);
-/**
- * tlb_flush:
- * @cpu: CPU whose TLB should be flushed
- *
- * Flush the entire TLB for the specified CPU. Most CPU architectures
- * allow the implementation to drop entries from the TLB at any time
- * so this is generally safe. If more selective flushing is required
- * use one of the other functions for efficiency.
- */
-void tlb_flush(CPUState *cpu);
 /**
  * tlb_flush_all_cpus:
  * @cpu: src CPU of the flush
@@ -337,9 +339,6 @@ static inline void tlb_flush_page_all_cpus_synced(CPUState *src,
                                                   target_ulong addr)
 {
 }
-static inline void tlb_flush(CPUState *cpu)
-{
-}
 static inline void tlb_flush_all_cpus(CPUState *src_cpu)
 {
 }
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 7e87aecb2357..b94bfdd362ed 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -2,6 +2,7 @@
 #define TCG_MODULE_H
 
 struct TCGModuleOps {
+    void (*tlb_flush)(CPUState *cpu);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index be6fe45aa5a8..43aae0b102c1 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -81,3 +81,11 @@ void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
     cpu->exception_index = EXCP_ATOMIC;
     cpu_loop_exit_restore(cpu, pc);
 }
+
+/* This is a wrapper for common code that can not use CONFIG_SOFTMMU */
+void tcg_flush_softmmu_tlb(CPUState *cs)
+{
+#ifdef CONFIG_SOFTMMU
+    tlb_flush(cs);
+#endif
+}
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b1e5471f949f..40c3d1b65ac5 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2767,3 +2767,10 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
     TCGMemOpIdx oi = make_memop_idx(MO_TEQ, cpu_mmu_index(env, true));
     return full_ldq_code(env, addr, oi, 0);
 }
+
+static void tcg_module_ops_tlb(void)
+{
+    tcg.tlb_flush = tlb_flush;
+}
+
+type_init(tcg_module_ops_tlb);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index e864fb20c141..4d045b91647c 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -1,5 +1,26 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg-module.h"
 
+static void update_cpu_stub(CPUState *cpu)
+{
+}
+
 struct TCGModuleOps tcg = {
+    .tlb_flush = update_cpu_stub,
 };
+
+/*
+ * CONFIG_TCG_MODULAR: jump through TCGModuleOps to tcg module
+ * !CONFIG_TCG or CONFIG_USER_ONLY: using the wrappers as stubs
+ * otherwise: using direct calls into tcg -> no wrappers
+ */
+#if defined(CONFIG_TCG_MODULAR) || !defined(CONFIG_TCG) || defined(CONFIG_USER_ONLY)
+
+void tlb_flush(CPUState *cpu)
+{
+    if (tcg.tlb_flush) {
+        tcg.tlb_flush(cpu);
+    }
+}
+
+#endif
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index fb9ebfad9e4a..9dba585ad413 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2472,11 +2472,3 @@ int page_unprotect(target_ulong address, uintptr_t pc)
     return 0;
 }
 #endif /* CONFIG_USER_ONLY */
-
-/* This is a wrapper for common code that can not use CONFIG_SOFTMMU */
-void tcg_flush_softmmu_tlb(CPUState *cs)
-{
-#ifdef CONFIG_SOFTMMU
-    tlb_flush(cs);
-#endif
-}
-- 
2.31.1


