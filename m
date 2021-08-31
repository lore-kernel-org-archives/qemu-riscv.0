Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2i2-0005lI-8m
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2i0-0005gi-Bq
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2hw-00060w-HO
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LErq3Y4Hjmoq8Xi3S1zeN4MywBbURDL36GQs5umBzmQ=;
 b=QqQjQ0dOeuwdWEcEmPLIb5itvSGRGU+P0Mli+6czEafDQsHnRM1w5rRJrZ8YmKLCXoW6K4
 8Kw5RrI0QjIs217biwKemw/v5JVN9KXJdxhGdCBP955LPT8FYX9yHJoQBELusIBPNq0GZp
 yK9FzN4haX10Vj/1XllKUIS/Ui8mzSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-_EFdG9kxMsWr87DesJQqTQ-1; Tue, 31 Aug 2021 08:17:38 -0400
X-MC-Unique: _EFdG9kxMsWr87DesJQqTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B564192502;
 Tue, 31 Aug 2021 12:17:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EEC8104B4C2;
 Tue, 31 Aug 2021 12:17:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D296A1800998; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 12/29] tcg_funcs: Add tlb_reset_dirty to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:28 +0200
Message-Id: <20210831121545.2874233-13-kraxel@redhat.com>
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
X-List-Received-Date: Tue, 31 Aug 2021 12:17:44 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h  | 1 -
 include/tcg/tcg-module.h | 3 +++
 accel/tcg/cputlb.c       | 3 ++-
 accel/tcg/tcg-module.c   | 9 +++++++++
 softmmu/physmem.c        | 2 +-
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 43d89699e989..27fc489c57b5 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -691,7 +691,6 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr);
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
                                         void **hostp);
 
-void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 
 MemoryRegionSection *
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index a903e3ee62c0..a14dcdb002db 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -6,6 +6,9 @@
 struct TCGModuleOps {
     void (*tlb_flush)(CPUState *cpu);
     void (*tlb_flush_page)(CPUState *cpu, target_ulong addr);
+#if defined(CONFIG_SOFTMMU)
+    void (*tlb_reset_dirty)(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
+#endif
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 1fcdb71a10a0..fa9c9064848c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1004,7 +1004,7 @@ static inline void copy_tlb_helper_locked(CPUTLBEntry *d, const CPUTLBEntry *s)
  * We must take tlb_c.lock to avoid racing with another vCPU update. The only
  * thing actually updated is the target TLB entry ->addr_write flags.
  */
-void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
+static void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
 {
     CPUArchState *env;
 
@@ -2772,6 +2772,7 @@ static void tcg_module_ops_tlb(void)
 {
     tcg.tlb_flush = tlb_flush;
     tcg.tlb_flush_page = tlb_flush_page;
+    tcg.tlb_reset_dirty = tlb_reset_dirty;
 }
 
 type_init(tcg_module_ops_tlb);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index 4d62160628bd..febf4e49981c 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -9,7 +9,16 @@ static void tlb_flush_page_stub(CPUState *cpu, target_ulong addr)
 {
 }
 
+#if defined(CONFIG_SOFTMMU)
+static void tlb_reset_dirty_stub(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
+{
+}
+#endif
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
+#if defined(CONFIG_SOFTMMU)
+    .tlb_reset_dirty = tlb_reset_dirty_stub,
+#endif
 };
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 8fa5376de1c9..8b27827c533d 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1015,7 +1015,7 @@ static void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
     assert(block == qemu_get_ram_block(end - 1));
     start1 = (uintptr_t)ramblock_ptr(block, start - block->offset);
     CPU_FOREACH(cpu) {
-        tlb_reset_dirty(cpu, start1, length);
+        tcg.tlb_reset_dirty(cpu, start1, length);
     }
 }
 
-- 
2.31.1


