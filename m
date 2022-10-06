Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogSv0-0004G1-Dx
	for mharc-qemu-riscv@gnu.org; Thu, 06 Oct 2022 11:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSuN-0003pJ-5f
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSuJ-0000V8-0i
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4h7vyx8d98MGbRX6SH6EZkNtqsv47ZRB8QWMoS6Bts=;
 b=aVztQq6gxGalwxGtt/qYZTBv8yl8HdC1tFfRvaOvZ557bUOJgvDZAP0e2l23ZxE6FXFNjA
 9MgAMynjnlul/dFxuJZxqf4vugiRBvrJgIOjiUnyDZqNOJ7Dg6Iag/4yponm4tHt2YIhxY
 iERtqzC8ZP7sJm5wteUprR5LRYZDlhE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-hAGTyLvDOj-3i5KL5O_Swg-1; Thu, 06 Oct 2022 11:35:26 -0400
X-MC-Unique: hAGTyLvDOj-3i5KL5O_Swg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1529A101E14E;
 Thu,  6 Oct 2022 15:35:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE6462166B2E;
 Thu,  6 Oct 2022 15:35:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 viktor.prutyanov@redhat.com, Greg Kurz <groug@kaod.org>,
 frankja@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 10/10] dump: fix kdump to work over non-aligned blocks
Date: Thu,  6 Oct 2022 19:34:29 +0400
Message-Id: <20221006153430.2775580-11-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Oct 2022 15:35:35 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Rewrite get_next_page() to work over non-aligned blocks. When it
encounters non aligned addresses, it will try to fill a page provided by
the caller.

This solves a kdump crash with "tpm-crb-cmd" RAM memory region,
qemu-kvm: ../dump/dump.c:1162: _Bool get_next_page(GuestPhysBlock **,
uint64_t *, uint8_t **, DumpState *): Assertion `(block->target_start &
~target_page_mask) == 0' failed.

because:
guest_phys_block_add_section: target_start=00000000fed40080 target_end=00000000fed41000: added (count: 4)

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=2120480

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 dump/dump.c | 79 +++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 56 insertions(+), 23 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index b55a497c42..236559b03a 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1116,50 +1116,81 @@ static uint64_t dump_pfn_to_paddr(DumpState *s, uint64_t pfn)
 }
 
 /*
- * exam every page and return the page frame number and the address of the page.
- * bufptr can be NULL. note: the blocks here is supposed to reflect guest-phys
- * blocks, so block->target_start and block->target_end should be interal
- * multiples of the target page size.
+ * Return the page frame number and the page content in *bufptr. bufptr can be
+ * NULL. If not NULL, *bufptr must contains a target page size of pre-allocated
+ * memory. This is not necessarily the memory returned.
  */
 static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
                           uint8_t **bufptr, DumpState *s)
 {
     GuestPhysBlock *block = *blockptr;
-    hwaddr addr, target_page_mask = ~((hwaddr)s->dump_info.page_size - 1);
-    uint8_t *buf;
+    uint32_t page_size = s->dump_info.page_size;
+    uint8_t *buf = NULL, *hbuf;
+    hwaddr addr;
 
     /* block == NULL means the start of the iteration */
     if (!block) {
         block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
         *blockptr = block;
         addr = block->target_start;
+        *pfnptr = dump_paddr_to_pfn(s, addr);
     } else {
-        addr = dump_pfn_to_paddr(s, *pfnptr + 1);
+        *pfnptr += 1;
+        addr = dump_pfn_to_paddr(s, *pfnptr);
     }
     assert(block != NULL);
 
-    if ((addr >= block->target_start) &&
-        (addr + s->dump_info.page_size <= block->target_end)) {
-        buf = block->host_addr + (addr - block->target_start);
-    } else {
-        /* the next page is in the next block */
-        block = QTAILQ_NEXT(block, next);
-        *blockptr = block;
-        if (!block) {
-            return false;
+    while (1) {
+        if (addr >= block->target_start && addr < block->target_end) {
+            size_t n = MIN(block->target_end - addr, page_size - addr % page_size);
+            hbuf = block->host_addr + (addr - block->target_start);
+            if (!buf) {
+                if (n == page_size) {
+                    /* this is a whole target page, go for it */
+                    assert(addr % page_size == 0);
+                    buf = hbuf;
+                    break;
+                } else if (bufptr) {
+                    assert(*bufptr);
+                    buf = *bufptr;
+                    memset(buf, 0, page_size);
+                } else {
+                    return true;
+                }
+            }
+
+            memcpy(buf + addr % page_size, hbuf, n);
+            addr += n;
+            if (addr % page_size == 0) {
+                /* we filled up the page */
+                break;
+            }
+        } else {
+            /* the next page is in the next block */
+            *blockptr = block = QTAILQ_NEXT(block, next);
+            if (!block) {
+                break;
+            }
+
+            addr = block->target_start;
+            /* are we still in the same page? */
+            if (dump_paddr_to_pfn(s, addr) != *pfnptr) {
+                if (buf) {
+                    /* no, but we already filled something earlier, return it */
+                    break;
+                } else {
+                    /* else continue from there */
+                    *pfnptr = dump_paddr_to_pfn(s, addr);
+                }
+            }
         }
-        addr = block->target_start;
-        buf = block->host_addr;
     }
 
-    assert((block->target_start & ~target_page_mask) == 0);
-    assert((block->target_end & ~target_page_mask) == 0);
-    *pfnptr = dump_paddr_to_pfn(s, addr);
     if (bufptr) {
         *bufptr = buf;
     }
 
-    return true;
+    return buf != NULL;
 }
 
 static void write_dump_bitmap(DumpState *s, Error **errp)
@@ -1297,6 +1328,7 @@ static void write_dump_pages(DumpState *s, Error **errp)
     uint8_t *buf;
     GuestPhysBlock *block_iter = NULL;
     uint64_t pfn_iter;
+    g_autofree uint8_t *page = NULL;
 
     /* get offset of page_desc and page_data in dump file */
     offset_desc = s->offset_page;
@@ -1332,12 +1364,13 @@ static void write_dump_pages(DumpState *s, Error **errp)
     }
 
     offset_data += s->dump_info.page_size;
+    page = g_malloc(s->dump_info.page_size);
 
     /*
      * dump memory to vmcore page by page. zero page will all be resided in the
      * first page of page section
      */
-    while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
+    for (buf = page; get_next_page(&block_iter, &pfn_iter, &buf, s); buf = page) {
         /* check zero page */
         if (buffer_is_zero(buf, s->dump_info.page_size)) {
             ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
-- 
2.37.3


