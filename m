Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2ih-0007PD-R4
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2ig-0007Io-3O
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2ie-0006R1-3l
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:18:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pe1VnmXeX4WMdsVT7ST1+j8I7UtCzPwZFsJViammQWw=;
 b=d8ZNwiqyTZKvBY47PUnHGcdWvXdUJpiKJx09mJJCsiANa3F91IySYH9s9I9L5r9U5CphOk
 ImmebX9OBpXG9HZxLJGdpvDB0wXXw4BgMJVD+b+1hsHin3V7SbKe3vnsJuwpg1ksxBZyRR
 FlqSgu1ejTlE7T6vObqCl2X6ZZSKkA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-msmcjnuyPZiwNAIB0-x4dA-1; Tue, 31 Aug 2021 08:18:22 -0400
X-MC-Unique: msmcjnuyPZiwNAIB0-x4dA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDECD87D572;
 Tue, 31 Aug 2021 12:18:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A26660FB8;
 Tue, 31 Aug 2021 12:18:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 615E818009DA; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
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
Subject: [PATCH 18/29] tcg_funcs: Add tb_invalidate_phys_range to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:34 +0200
Message-Id: <20210831121545.2874233-19-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
X-List-Received-Date: Tue, 31 Aug 2021 12:18:26 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h   | 3 +--
 include/tcg/tcg-module.h  | 2 ++
 accel/tcg/tcg-module.c    | 5 +++++
 accel/tcg/translate-all.c | 3 ++-
 cpu.c                     | 4 ++--
 linux-user/mmap.c         | 6 +++---
 softmmu/physmem.c         | 2 +-
 7 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9cb8337acee1..c27e911b65f9 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -25,7 +25,6 @@
 #include "exec/cpu_ldst.h"
 #endif
 #include "sysemu/cpu-timers.h"
-#include "tcg/tcg-module.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
 #define DEBUG_DISAS
@@ -42,6 +41,7 @@ typedef ram_addr_t tb_page_addr_t;
 #endif
 
 #include "qemu/log.h"
+#include "tcg/tcg-module.h"
 
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns);
 void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
@@ -571,7 +571,6 @@ void tb_invalidate_phys_addr(tb_page_addr_t addr);
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
-void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
                                    target_ulong cs_base, uint32_t flags,
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 003581b0718c..6069b056f91f 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -14,6 +14,8 @@ struct TCGModuleOps {
     void (*tcg_exec_unrealizefn)(CPUState *cpu);
     void (*tcg_exec_realizefn)(CPUState *cpu, Error **errp);
     void (*tb_flush)(CPUState *cpu);
+    void (*tb_invalidate_phys_range)(tb_page_addr_t start, tb_page_addr_t end);
+
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index 7600951fd20b..dfd7d3bbc2e0 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -25,6 +25,10 @@ static void tcg_exec_realizefn_stub(CPUState *cpu, Error **errp)
 {
 }
 
+static void tb_invalidate_phys_range_stub(tb_page_addr_t start, tb_page_addr_t end)
+{
+}
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
@@ -35,4 +39,5 @@ struct TCGModuleOps tcg = {
     .tcg_exec_realizefn = tcg_exec_realizefn_stub,
     .tcg_exec_unrealizefn = update_cpu_stub,
     .tb_flush = update_cpu_stub,
+    .tb_invalidate_phys_range = tb_invalidate_phys_range_stub,
 };
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 3a3a60575141..e71e58aff9e7 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1777,7 +1777,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
  *
  * Called with mmap_lock held for user-mode emulation.
  */
-void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
+static void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 {
     struct page_collection *pages;
     tb_page_addr_t next;
@@ -2438,6 +2438,7 @@ int page_unprotect(target_ulong address, uintptr_t pc)
 static void tcg_module_ops_tb(void)
 {
     tcg.tb_flush = tb_flush;
+    tcg.tb_invalidate_phys_range = tb_invalidate_phys_range;
 }
 
 type_init(tcg_module_ops_tb);
diff --git a/cpu.c b/cpu.c
index b8ac817cb3fd..536bb6911a58 100644
--- a/cpu.c
+++ b/cpu.c
@@ -222,7 +222,7 @@ const char *parse_cpu_option(const char *cpu_option)
 void tb_invalidate_phys_addr(tb_page_addr_t addr)
 {
     mmap_lock();
-    tb_invalidate_phys_range(addr, addr + 1);
+    tcg.tb_invalidate_phys_range(addr, addr + 1);
     mmap_unlock();
 }
 #else
@@ -243,7 +243,7 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
         return;
     }
     ram_addr = memory_region_get_ram_addr(mr) + addr;
-    tb_invalidate_phys_range(ram_addr, ram_addr + 1);
+    tcg.tb_invalidate_phys_range(ram_addr, ram_addr + 1);
 }
 #endif
 
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 85cb03e176c1..0f4cfefe01cb 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -630,7 +630,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
         log_page_dump(__func__);
     }
-    tb_invalidate_phys_range(start, start + len);
+    tcg.tb_invalidate_phys_range(start, start + len);
     mmap_unlock();
     return start;
 fail:
@@ -734,7 +734,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
 
     if (ret == 0) {
         page_set_flags(start, start + len, 0);
-        tb_invalidate_phys_range(start, start + len);
+        tcg.tb_invalidate_phys_range(start, start + len);
     }
     mmap_unlock();
     return ret;
@@ -824,7 +824,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         page_set_flags(new_addr, new_addr + new_size,
                        prot | PAGE_VALID | PAGE_RESET);
     }
-    tb_invalidate_phys_range(new_addr, new_addr + new_size);
+    tcg.tb_invalidate_phys_range(new_addr, new_addr + new_size);
     mmap_unlock();
     return new_addr;
 }
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 8b27827c533d..f2301f4445cc 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2696,7 +2696,7 @@ static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
     }
     if (dirty_log_mask & (1 << DIRTY_MEMORY_CODE)) {
         assert(tcg_enabled());
-        tb_invalidate_phys_range(addr, addr + length);
+        tcg.tb_invalidate_phys_range(addr, addr + length);
         dirty_log_mask &= ~(1 << DIRTY_MEMORY_CODE);
     }
     cpu_physical_memory_set_dirty_range(addr, length, dirty_log_mask);
-- 
2.31.1


