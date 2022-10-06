Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogSuE-0003iJ-Mg
	for mharc-qemu-riscv@gnu.org; Thu, 06 Oct 2022 11:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStm-0003Xe-RG
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStj-0000AF-Jx
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAq2xlqRdVIbUoDtOLarQdrR1IEKv+tZdV05JKo94l4=;
 b=B9h3xuCany0gX+GWUPz9VadGYHFka9JmHHp6ICvY/HZC33IKT8gAs1JZq24IKzB7d2eDMt
 RmByhfXyTTTTjSjjUlKt6BIVYjooV4nJMRRVcwgmXijHhdI1TdDjAJPHAdkXWIboR03dOB
 0BdJ/2QsNhC2s10Ib/1wzKSlwU9/0pc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-0Qayu6ugPd-eEXtvMmJMFA-1; Thu, 06 Oct 2022 11:34:49 -0400
X-MC-Unique: 0Qayu6ugPd-eEXtvMmJMFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6F66185A7AA;
 Thu,  6 Oct 2022 15:34:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F7C32166B2E;
 Thu,  6 Oct 2022 15:34:46 +0000 (UTC)
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
Subject: [PULL 03/10] dump: Refactor dump_iterate and introduce
 dump_filter_memblock_*()
Date: Thu,  6 Oct 2022 19:34:22 +0400
Message-Id: <20221006153430.2775580-4-marcandre.lureau@redhat.com>
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
X-List-Received-Date: Thu, 06 Oct 2022 15:35:02 -0000

From: Janosch Frank <frankja@linux.ibm.com>

The iteration over the memblocks in dump_iterate() is hard to
understand so it's about time to clean it up. Instead of manually
grabbing the next memblock we can use QTAILQ_FOREACH to iterate over
all memblocks.

Additionally we move the calculation of the offset and length out by
introducing and using the dump_filter_memblock_*() functions. These
functions will later be used to cleanup other parts of dump.c.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220811121111.9878-4-frankja@linux.ibm.com>
---
 dump/dump.c | 74 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 42 insertions(+), 32 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 0ed7cf9c7b..340de5a1e7 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -591,31 +591,43 @@ static void dump_begin(DumpState *s, Error **errp)
     write_elf_notes(s, errp);
 }
 
-static int get_next_block(DumpState *s, GuestPhysBlock *block)
+static int64_t dump_filtered_memblock_size(GuestPhysBlock *block,
+                                           int64_t filter_area_start,
+                                           int64_t filter_area_length)
 {
-    while (1) {
-        block = QTAILQ_NEXT(block, next);
-        if (!block) {
-            /* no more block */
-            return 1;
-        }
+    int64_t size, left, right;
 
-        s->start = 0;
-        s->next_block = block;
-        if (s->has_filter) {
-            if (block->target_start >= s->begin + s->length ||
-                block->target_end <= s->begin) {
-                /* This block is out of the range */
-                continue;
-            }
+    /* No filter, return full size */
+    if (!filter_area_length) {
+        return block->target_end - block->target_start;
+    }
 
-            if (s->begin > block->target_start) {
-                s->start = s->begin - block->target_start;
-            }
+    /* calculate the overlapped region. */
+    left = MAX(filter_area_start, block->target_start);
+    right = MIN(filter_area_start + filter_area_length, block->target_end);
+    size = right - left;
+    size = size > 0 ? size : 0;
+
+    return size;
+}
+
+static int64_t dump_filtered_memblock_start(GuestPhysBlock *block,
+                                            int64_t filter_area_start,
+                                            int64_t filter_area_length)
+{
+    if (filter_area_length) {
+        /* return -1 if the block is not within filter area */
+        if (block->target_start >= filter_area_start + filter_area_length ||
+            block->target_end <= filter_area_start) {
+            return -1;
         }
 
-        return 0;
+        if (filter_area_start > block->target_start) {
+            return filter_area_start - block->target_start;
+        }
     }
+
+    return 0;
 }
 
 /* write all memory to vmcore */
@@ -623,24 +635,22 @@ static void dump_iterate(DumpState *s, Error **errp)
 {
     ERRP_GUARD();
     GuestPhysBlock *block;
-    int64_t size;
-
-    do {
-        block = s->next_block;
+    int64_t memblock_size, memblock_start;
 
-        size = block->target_end - block->target_start;
-        if (s->has_filter) {
-            size -= s->start;
-            if (s->begin + s->length < block->target_end) {
-                size -= block->target_end - (s->begin + s->length);
-            }
+    QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
+        memblock_start = dump_filtered_memblock_start(block, s->begin, s->length);
+        if (memblock_start == -1) {
+            continue;
         }
-        write_memory(s, block, s->start, size, errp);
+
+        memblock_size = dump_filtered_memblock_size(block, s->begin, s->length);
+
+        /* Write the memory to file */
+        write_memory(s, block, memblock_start, memblock_size, errp);
         if (*errp) {
             return;
         }
-
-    } while (!get_next_block(s, block));
+    }
 }
 
 static void create_vmcore(DumpState *s, Error **errp)
-- 
2.37.3


