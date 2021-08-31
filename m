Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2iP-0006Ny-VP
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2iO-0006Iu-HC
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:18:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2iL-0006H4-R9
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Df/cS+Kk2RDhFNkjyLEWK9DtQT8M40JsvdVaLc7r9J8=;
 b=GChTyPXR8eRh340cc+ET0uFsKeLOaYfIAIoPpU8jlm93aILx5+Dxv9ImqJNasduhHIDYlW
 wYdkXGkZJtkFGRJojcuAass+x9Hq75vZn9UeC3FhjG0vY1JgJ7YJ74OCOBbvyTKSZqElZq
 gBnTP3PBnr3C8CuEFVccuZ3e4HhOPP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-cYZepCxIMVyGkTckoaK2fw-1; Tue, 31 Aug 2021 08:18:03 -0400
X-MC-Unique: cYZepCxIMVyGkTckoaK2fw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F1A392509;
 Tue, 31 Aug 2021 12:18:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08C61104B4C2;
 Tue, 31 Aug 2021 12:17:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4AE3718009D9; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
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
Subject: [PATCH 17/29] tcg: drop tb_invalidate_phys_page_range()
Date: Tue, 31 Aug 2021 14:15:33 +0200
Message-Id: <20210831121545.2874233-18-kraxel@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
X-List-Received-Date: Tue, 31 Aug 2021 12:18:08 -0000

tb_invalidate_phys_range() can be used instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/translate-all.h |  1 -
 accel/tcg/translate-all.c    | 25 -------------------------
 cpu.c                        |  4 ++--
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/include/exec/translate-all.h b/include/exec/translate-all.h
index a557b4e2bb9e..f313542cdae1 100644
--- a/include/exec/translate-all.h
+++ b/include/exec/translate-all.h
@@ -29,7 +29,6 @@ void page_collection_unlock(struct page_collection *set);
 void tb_invalidate_phys_page_fast(struct page_collection *pages,
                                   tb_page_addr_t start, int len,
                                   uintptr_t retaddr);
-void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr);
 
 #ifdef CONFIG_USER_ONLY
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 57bb921bd3ba..3a3a60575141 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1768,31 +1768,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 #endif
 }
 
-/*
- * Invalidate all TBs which intersect with the target physical address range
- * [start;end[. NOTE: start and end must refer to the *same* physical page.
- * 'is_cpu_write_access' should be true if called from a real cpu write
- * access: the virtual CPU will exit the current TB if code is modified inside
- * this TB.
- *
- * Called with mmap_lock held for user-mode emulation
- */
-void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end)
-{
-    struct page_collection *pages;
-    PageDesc *p;
-
-    assert_memory_lock();
-
-    p = page_find(start >> TARGET_PAGE_BITS);
-    if (p == NULL) {
-        return;
-    }
-    pages = page_collection_lock(start, end);
-    tb_invalidate_phys_page_range__locked(pages, p, start, end, 0);
-    page_collection_unlock(pages);
-}
-
 /*
  * Invalidate all TBs which intersect with the target physical address range
  * [start;end[. NOTE: start and end may refer to *different* physical pages.
diff --git a/cpu.c b/cpu.c
index e8baec294b06..b8ac817cb3fd 100644
--- a/cpu.c
+++ b/cpu.c
@@ -222,7 +222,7 @@ const char *parse_cpu_option(const char *cpu_option)
 void tb_invalidate_phys_addr(tb_page_addr_t addr)
 {
     mmap_lock();
-    tb_invalidate_phys_page_range(addr, addr + 1);
+    tb_invalidate_phys_range(addr, addr + 1);
     mmap_unlock();
 }
 #else
@@ -243,7 +243,7 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
         return;
     }
     ram_addr = memory_region_get_ram_addr(mr) + addr;
-    tb_invalidate_phys_page_range(ram_addr, ram_addr + 1);
+    tb_invalidate_phys_range(ram_addr, ram_addr + 1);
 }
 #endif
 
-- 
2.31.1


