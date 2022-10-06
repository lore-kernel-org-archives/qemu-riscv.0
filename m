Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogSuh-00041O-Of
	for mharc-qemu-riscv@gnu.org; Thu, 06 Oct 2022 11:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStw-0003aH-SQ
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStt-0000OR-1i
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvTigsGHy4bOPpaKG5ayhy8aiJm7kwertg4WzQRnVDU=;
 b=A6cCMhoVVslMMfrBMO7bjjjFErmTMx002ZLff5rHHg16+O2Z7oSeFA3f/3A+Pca7+BKOne
 gormofZ6BcLqHOqyHyZSicLwCk3iTOViyjBdyEj7zBAZNjVnmqS97LEvm+dtETsklwg2tK
 ozZkpII8o6ZjL2MbdRJWuLK8Q6CkNnk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-4k0NM966PZuQ9TagpyIlLQ-1; Thu, 06 Oct 2022 11:35:01 -0400
X-MC-Unique: 4k0NM966PZuQ9TagpyIlLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3163185A7AB;
 Thu,  6 Oct 2022 15:35:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE8DB2166B2E;
 Thu,  6 Oct 2022 15:34:59 +0000 (UTC)
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
Subject: [PULL 06/10] dump: Rework dump_calculate_size function
Date: Thu,  6 Oct 2022 19:34:25 +0400
Message-Id: <20221006153430.2775580-7-marcandre.lureau@redhat.com>
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
X-List-Received-Date: Thu, 06 Oct 2022 15:35:23 -0000

From: Janosch Frank <frankja@linux.ibm.com>

dump_calculate_size() sums up all the sizes of the guest memory
blocks. Since we already have a function that calculates the size of a
single memory block (dump_get_memblock_size()) we can simply iterate
over the blocks and use the function instead of calculating the size
ourselves.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Message-Id: <20220811121111.9878-7-frankja@linux.ibm.com>
---
 dump/dump.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index b043337bc7..d82cc46d7d 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1548,25 +1548,19 @@ bool qemu_system_dump_in_progress(void)
     return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
 }
 
-/* calculate total size of memory to be dumped (taking filter into
- * acoount.) */
+/*
+ * calculate total size of memory to be dumped (taking filter into
+ * account.)
+ */
 static int64_t dump_calculate_size(DumpState *s)
 {
     GuestPhysBlock *block;
-    int64_t size = 0, total = 0, left = 0, right = 0;
+    int64_t total = 0;
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
-        if (dump_has_filter(s)) {
-            /* calculate the overlapped region. */
-            left = MAX(s->filter_area_begin, block->target_start);
-            right = MIN(s->filter_area_begin + s->filter_area_length, block->target_end);
-            size = right - left;
-            size = size > 0 ? size : 0;
-        } else {
-            /* count the whole region in */
-            size = (block->target_end - block->target_start);
-        }
-        total += size;
+        total += dump_filtered_memblock_size(block,
+                                             s->filter_area_begin,
+                                             s->filter_area_length);
     }
 
     return total;
-- 
2.37.3


