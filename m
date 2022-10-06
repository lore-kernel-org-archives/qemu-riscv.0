Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogSuN-0003ol-2i
	for mharc-qemu-riscv@gnu.org; Thu, 06 Oct 2022 11:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSts-0003Zf-8q
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSto-0000Bc-6c
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hOe6/bXHtInA3YwKjW6+QwwmoXeYh/XCY11FblVu8TQ=;
 b=eHJAd3fbGAeeuKnBWpEq4gNW8YKsDrOHuz7cT0kST/p5MYy881nGTWWSDIMCec4KgNk/ae
 ERfETCCS/oYWnaJRrMYoSa0NWY9EycO7n5JXPYScfsizGsgWqJMdKGQ8MjJI69gaDIhF4y
 HBbtjG/WsiTM/HFUvXUZnaVZ37ZUJMI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-5ZQCxANkNLennBI02oULMQ-1; Thu, 06 Oct 2022 11:34:53 -0400
X-MC-Unique: 5ZQCxANkNLennBI02oULMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95C1C185A7AA;
 Thu,  6 Oct 2022 15:34:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FA22202323C;
 Thu,  6 Oct 2022 15:34:51 +0000 (UTC)
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
Subject: [PULL 04/10] dump: Rework get_start_block
Date: Thu,  6 Oct 2022 19:34:23 +0400
Message-Id: <20221006153430.2775580-5-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-List-Received-Date: Thu, 06 Oct 2022 15:35:12 -0000

From: Janosch Frank <frankja@linux.ibm.com>

get_start_block() returns the start address of the first memory block
or -1.

With the GuestPhysBlock iterator conversion we don't need to set the
start address and can therefore remove that code and the "start"
DumpState struct member. The only functionality left is the validation
of the start block so it only makes sense to re-name the function to
validate_start_block()

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Message-Id: <20220811121111.9878-5-frankja@linux.ibm.com>
---
 include/sysemu/dump.h |  2 --
 dump/dump.c           | 20 ++++++--------------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index ffc2ea1072..7fce1d4af6 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -166,8 +166,6 @@ typedef struct DumpState {
     hwaddr memory_offset;
     int fd;
 
-    GuestPhysBlock *next_block;
-    ram_addr_t start;
     bool has_filter;
     int64_t begin;
     int64_t length;
diff --git a/dump/dump.c b/dump/dump.c
index 340de5a1e7..e204912a89 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1500,30 +1500,22 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
     }
 }
 
-static ram_addr_t get_start_block(DumpState *s)
+static int validate_start_block(DumpState *s)
 {
     GuestPhysBlock *block;
 
     if (!s->has_filter) {
-        s->next_block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
         return 0;
     }
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
+        /* This block is out of the range */
         if (block->target_start >= s->begin + s->length ||
             block->target_end <= s->begin) {
-            /* This block is out of the range */
             continue;
         }
-
-        s->next_block = block;
-        if (s->begin > block->target_start) {
-            s->start = s->begin - block->target_start;
-        } else {
-            s->start = 0;
-        }
-        return s->start;
-    }
+        return 0;
+   }
 
     return -1;
 }
@@ -1670,8 +1662,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         goto cleanup;
     }
 
-    s->start = get_start_block(s);
-    if (s->start == -1) {
+    /* Is the filter filtering everything? */
+    if (validate_start_block(s) == -1) {
         error_setg(errp, QERR_INVALID_PARAMETER, "begin");
         goto cleanup;
     }
-- 
2.37.3


