Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2hs-0005Pr-H3
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2hq-0005Ka-1Z
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2hl-0005tF-97
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8gQuk7Fsh4A8/jNqxyM7TcDlDRogwWS1f9ob5Kg95g=;
 b=OX7llnh4P5jZj2omtybcH8fde6qsRwPFO3/Ip00ZatKfQ43at1OrAZK0evJtnUmrqAnJna
 tl/Cm8NUDRqDhQh8Ub2hjkwOboAWxgHYDhlDIFibSJ67djFq03UAkYKegwZmJnCuVkv5x9
 rG2r6G4FZxet8ElEK5wegc+FbHIXSEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-DI9j00UwNqaHj1X1ViOXig-1; Tue, 31 Aug 2021 08:17:27 -0400
X-MC-Unique: DI9j00UwNqaHj1X1ViOXig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82DEB8799F6;
 Tue, 31 Aug 2021 12:17:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C66B6E0B0;
 Tue, 31 Aug 2021 12:17:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BFDB91800996; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 11/29] tcg_funcs: Add tlb_flush_page to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:27 +0200
Message-Id: <20210831121545.2874233-12-kraxel@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
X-List-Received-Date: Tue, 31 Aug 2021 12:17:34 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h  | 3 ---
 include/tcg/tcg-module.h | 3 +++
 accel/tcg/cputlb.c       | 1 +
 accel/tcg/tcg-module.c   | 5 +++++
 softmmu/physmem.c        | 4 ++--
 target/arm/helper.c      | 4 ++--
 6 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index ddb1ab797978..43d89699e989 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -328,9 +328,6 @@ static inline void tlb_init(CPUState *cpu)
 static inline void tlb_destroy(CPUState *cpu)
 {
 }
-static inline void tlb_flush_page(CPUState *cpu, target_ulong addr)
-{
-}
 static inline void tlb_flush_page_all_cpus(CPUState *src, target_ulong addr)
 {
 }
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index b94bfdd362ed..a903e3ee62c0 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -1,8 +1,11 @@
 #ifndef TCG_MODULE_H
 #define TCG_MODULE_H
 
+#include "exec/exec-all.h"
+
 struct TCGModuleOps {
     void (*tlb_flush)(CPUState *cpu);
+    void (*tlb_flush_page)(CPUState *cpu, target_ulong addr);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 40c3d1b65ac5..1fcdb71a10a0 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2771,6 +2771,7 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
 static void tcg_module_ops_tlb(void)
 {
     tcg.tlb_flush = tlb_flush;
+    tcg.tlb_flush_page = tlb_flush_page;
 }
 
 type_init(tcg_module_ops_tlb);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index a1e5728c8c1b..4d62160628bd 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -5,6 +5,11 @@ static void update_cpu_stub(CPUState *cpu)
 {
 }
 
+static void tlb_flush_page_stub(CPUState *cpu, target_ulong addr)
+{
+}
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
+    .tlb_flush_page = tlb_flush_page_stub,
 };
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dd17f80120dc..8fa5376de1c9 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -794,7 +794,7 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
 
     in_page = -(addr | TARGET_PAGE_MASK);
     if (len <= in_page) {
-        tlb_flush_page(cpu, addr);
+        tcg.tlb_flush_page(cpu, addr);
     } else {
         tcg.tlb_flush(cpu);
     }
@@ -825,7 +825,7 @@ void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint)
 {
     QTAILQ_REMOVE(&cpu->watchpoints, watchpoint, entry);
 
-    tlb_flush_page(cpu, watchpoint->vaddr);
+    tcg.tlb_flush_page(cpu, watchpoint->vaddr);
 
     g_free(watchpoint);
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0da65edd78cd..6aa38cde15fe 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -772,7 +772,7 @@ static void tlbimva_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (tlb_force_broadcast(env)) {
         tlb_flush_page_all_cpus_synced(cs, value);
     } else {
-        tlb_flush_page(cs, value);
+        tcg.tlb_flush_page(cs, value);
     }
 }
 
@@ -799,7 +799,7 @@ static void tlbimvaa_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (tlb_force_broadcast(env)) {
         tlb_flush_page_all_cpus_synced(cs, value);
     } else {
-        tlb_flush_page(cs, value);
+        tcg.tlb_flush_page(cs, value);
     }
 }
 
-- 
2.31.1


