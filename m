Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogSuN-0003rU-NP
	for mharc-qemu-riscv@gnu.org; Thu, 06 Oct 2022 11:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStu-0003a1-ML
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStq-0000Bw-4t
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vxoyBgRg/QRR8DJrKFWrMB45SvFGdxqWA6B8F05damA=;
 b=NPtYMX+JsZX+rT7h4aPR3HHhXQ9X0ejkIe0+cA4quYqdoRoYHbKg6pzqsOQ7n2CPbsWi/J
 2OqW2si2zxKMycvy3SOULzcO72/A51fhxMgs9gffas7FUAnHTaFS5fQuNycfqlsBMYLrHo
 sSm1m4+WsE+gpj/i4Kbyxra6OTEGBmI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-6E1M_XQ4PXOLEn_sLAaeBQ-1; Thu, 06 Oct 2022 11:34:57 -0400
X-MC-Unique: 6E1M_XQ4PXOLEn_sLAaeBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2B11185A79C;
 Thu,  6 Oct 2022 15:34:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A811B2166B2E;
 Thu,  6 Oct 2022 15:34:55 +0000 (UTC)
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
Subject: [PULL 05/10] dump: Rework filter area variables
Date: Thu,  6 Oct 2022 19:34:24 +0400
Message-Id: <20221006153430.2775580-6-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Oct 2022 15:35:13 -0000

From: Janosch Frank <frankja@linux.ibm.com>

While the DumpState begin and length variables directly mirror the API
variable names they are not very descriptive. So let's add a
"filter_area_" prefix and make has_filter a function checking length > 0.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220811121111.9878-6-frankja@linux.ibm.com>
---
 include/sysemu/dump.h | 13 ++++++++---
 dump/dump.c           | 53 +++++++++++++++++++++++++------------------
 2 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 7fce1d4af6..b62513d87d 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -166,9 +166,16 @@ typedef struct DumpState {
     hwaddr memory_offset;
     int fd;
 
-    bool has_filter;
-    int64_t begin;
-    int64_t length;
+    /*
+     * Dump filter area variables
+     *
+     * A filtered dump only contains the guest memory designated by
+     * the start address and length variables defined below.
+     *
+     * If length is 0, no filtering is applied.
+     */
+    int64_t filter_area_begin;  /* Start address of partial guest memory area */
+    int64_t filter_area_length; /* Length of partial guest memory area */
 
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
diff --git a/dump/dump.c b/dump/dump.c
index e204912a89..b043337bc7 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -59,6 +59,11 @@ static inline bool dump_is_64bit(DumpState *s)
     return s->dump_info.d_class == ELFCLASS64;
 }
 
+static inline bool dump_has_filter(DumpState *s)
+{
+    return s->filter_area_length > 0;
+}
+
 uint16_t cpu_to_dump16(DumpState *s, uint16_t val)
 {
     if (s->dump_info.d_endian == ELFDATA2LSB) {
@@ -443,29 +448,30 @@ static void get_offset_range(hwaddr phys_addr,
     *p_offset = -1;
     *p_filesz = 0;
 
-    if (s->has_filter) {
-        if (phys_addr < s->begin || phys_addr >= s->begin + s->length) {
+    if (dump_has_filter(s)) {
+        if (phys_addr < s->filter_area_begin ||
+            phys_addr >= s->filter_area_begin + s->filter_area_length) {
             return;
         }
     }
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
-        if (s->has_filter) {
-            if (block->target_start >= s->begin + s->length ||
-                block->target_end <= s->begin) {
+        if (dump_has_filter(s)) {
+            if (block->target_start >= s->filter_area_begin + s->filter_area_length ||
+                block->target_end <= s->filter_area_begin) {
                 /* This block is out of the range */
                 continue;
             }
 
-            if (s->begin <= block->target_start) {
+            if (s->filter_area_begin <= block->target_start) {
                 start = block->target_start;
             } else {
-                start = s->begin;
+                start = s->filter_area_begin;
             }
 
             size_in_block = block->target_end - start;
-            if (s->begin + s->length < block->target_end) {
-                size_in_block -= block->target_end - (s->begin + s->length);
+            if (s->filter_area_begin + s->filter_area_length < block->target_end) {
+                size_in_block -= block->target_end - (s->filter_area_begin + s->filter_area_length);
             }
         } else {
             start = block->target_start;
@@ -638,12 +644,12 @@ static void dump_iterate(DumpState *s, Error **errp)
     int64_t memblock_size, memblock_start;
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
-        memblock_start = dump_filtered_memblock_start(block, s->begin, s->length);
+        memblock_start = dump_filtered_memblock_start(block, s->filter_area_begin, s->filter_area_length);
         if (memblock_start == -1) {
             continue;
         }
 
-        memblock_size = dump_filtered_memblock_size(block, s->begin, s->length);
+        memblock_size = dump_filtered_memblock_size(block, s->filter_area_begin, s->filter_area_length);
 
         /* Write the memory to file */
         write_memory(s, block, memblock_start, memblock_size, errp);
@@ -1504,14 +1510,14 @@ static int validate_start_block(DumpState *s)
 {
     GuestPhysBlock *block;
 
-    if (!s->has_filter) {
+    if (!dump_has_filter(s)) {
         return 0;
     }
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
         /* This block is out of the range */
-        if (block->target_start >= s->begin + s->length ||
-            block->target_end <= s->begin) {
+        if (block->target_start >= s->filter_area_begin + s->filter_area_length ||
+            block->target_end <= s->filter_area_begin) {
             continue;
         }
         return 0;
@@ -1550,10 +1556,10 @@ static int64_t dump_calculate_size(DumpState *s)
     int64_t size = 0, total = 0, left = 0, right = 0;
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
-        if (s->has_filter) {
+        if (dump_has_filter(s)) {
             /* calculate the overlapped region. */
-            left = MAX(s->begin, block->target_start);
-            right = MIN(s->begin + s->length, block->target_end);
+            left = MAX(s->filter_area_begin, block->target_start);
+            right = MIN(s->filter_area_begin + s->filter_area_length, block->target_end);
             size = right - left;
             size = size > 0 ? size : 0;
         } else {
@@ -1643,9 +1649,12 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     s->fd = fd;
-    s->has_filter = has_filter;
-    s->begin = begin;
-    s->length = length;
+    if (has_filter && !length) {
+        error_setg(errp, QERR_INVALID_PARAMETER, "length");
+        goto cleanup;
+    }
+    s->filter_area_begin = begin;
+    s->filter_area_length = length;
 
     memory_mapping_list_init(&s->list);
 
@@ -1778,8 +1787,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         return;
     }
 
-    if (s->has_filter) {
-        memory_mapping_filter(&s->list, s->begin, s->length);
+    if (dump_has_filter(s)) {
+        memory_mapping_filter(&s->list, s->filter_area_begin, s->filter_area_length);
     }
 
     /*
-- 
2.37.3


