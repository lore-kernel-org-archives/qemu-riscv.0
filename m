Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2iR-0006T3-68
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2iP-0006Ku-8o
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:18:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2iM-0006HI-05
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUHp1O8zge7EEgmI1RbTuLgi2O/FujTQAqW5ywVE9jo=;
 b=L9ZV/8lMSp6p4SLet3kc7Ned2DBi34BlxFRkxTliv25DVv4stn47eaJrpxrxPI7jRTp2LF
 QNbIscrrEhIbXDE6sLI78XqK0IW+6SxTM3KKZxsCEh+x05QFTUHU4Io043+A5mZEIFq6LK
 VbOZ+wiC1EWSExoiJECrlSI2HS164Ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-QBhQlV_lNJKLWdZ5fb88KA-1; Tue, 31 Aug 2021 08:18:04 -0400
X-MC-Unique: QBhQlV_lNJKLWdZ5fb88KA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57011100806C;
 Tue, 31 Aug 2021 12:18:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79BA71007611;
 Tue, 31 Aug 2021 12:17:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3BCC018009D7; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
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
Subject: [PATCH 16/29] tcg: use tb_page_addr_t for tb_invalidate_phys_range()
Date: Tue, 31 Aug 2021 14:15:32 +0200
Message-Id: <20210831121545.2874233-17-kraxel@redhat.com>
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
X-List-Received-Date: Tue, 31 Aug 2021 12:18:09 -0000

The tb_page_addr_t type was added to avoid #ifdefs for SOFTMMU (uses
ram_addr_t) vs. USER_ONLY (uses target_ulong), and
tb_invalidate_phys_range() never was updated for some reason.
So do that now.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h   | 4 ++--
 include/exec/ram_addr.h   | 2 --
 accel/tcg/translate-all.c | 6 +-----
 cpu.c                     | 2 +-
 4 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 7dc6f498a7e4..9cb8337acee1 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -567,11 +567,11 @@ uint32_t curr_cflags(CPUState *cpu);
 
 /* TranslationBlock invalidate API */
 #if defined(CONFIG_USER_ONLY)
-void tb_invalidate_phys_addr(target_ulong addr);
-void tb_invalidate_phys_range(target_ulong start, target_ulong end);
+void tb_invalidate_phys_addr(tb_page_addr_t addr);
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
+void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
                                    target_ulong cs_base, uint32_t flags,
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 551876bed041..ae34f63b8f7e 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -145,8 +145,6 @@ static inline void qemu_ram_block_writeback(RAMBlock *block)
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
-void tb_invalidate_phys_range(ram_addr_t start, ram_addr_t end);
-
 static inline bool cpu_physical_memory_get_dirty(ram_addr_t start,
                                                  ram_addr_t length,
                                                  unsigned client)
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 1d258e89fc81..57bb921bd3ba 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1802,11 +1802,7 @@ void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end)
  *
  * Called with mmap_lock held for user-mode emulation.
  */
-#ifdef CONFIG_SOFTMMU
-void tb_invalidate_phys_range(ram_addr_t start, ram_addr_t end)
-#else
-void tb_invalidate_phys_range(target_ulong start, target_ulong end)
-#endif
+void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 {
     struct page_collection *pages;
     tb_page_addr_t next;
diff --git a/cpu.c b/cpu.c
index ce96b3591a9c..e8baec294b06 100644
--- a/cpu.c
+++ b/cpu.c
@@ -219,7 +219,7 @@ const char *parse_cpu_option(const char *cpu_option)
 }
 
 #if defined(CONFIG_USER_ONLY)
-void tb_invalidate_phys_addr(target_ulong addr)
+void tb_invalidate_phys_addr(tb_page_addr_t addr)
 {
     mmap_lock();
     tb_invalidate_phys_page_range(addr, addr + 1);
-- 
2.31.1


