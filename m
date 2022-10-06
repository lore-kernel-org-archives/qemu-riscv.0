Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogSuy-0004DL-1N
	for mharc-qemu-riscv@gnu.org; Thu, 06 Oct 2022 11:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSuL-0003oS-M7
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSuF-0000Tu-P2
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsCG6Vbibx8F7grXqAa/TVuItjcWBuxcPHcrTOOH5pA=;
 b=TzTeBt4pBEsMeyIbRVpFTItkTbvBawMtxlAImenBI6yiPfA/5qe5/byBJ1WvxIWUXIp00/
 2km4SGhnl5XPGF91+at5hje6QYd1nBOFeT3u+L9zGMr/XpzD7tjltjF70mkNddp2/68w9G
 DvJKt0o2k/yLayP8VnV2glQTbA5SqSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-wPXw8IouNR-5rudImpeRFw-1; Thu, 06 Oct 2022 11:35:21 -0400
X-MC-Unique: wPXw8IouNR-5rudImpeRFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD00A85A59D;
 Thu,  6 Oct 2022 15:35:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E7DA40EFB2B;
 Thu,  6 Oct 2022 15:35:19 +0000 (UTC)
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
Subject: [PULL 09/10] dump: simplify a bit kdump get_next_page()
Date: Thu,  6 Oct 2022 19:34:28 +0400
Message-Id: <20221006153430.2775580-10-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This should be functionally equivalent, but slightly easier to read,
with simplified paths and checks at the end of the function.

The following patch is a major rewrite to get rid of the assert().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 dump/dump.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index a905316fe5..b55a497c42 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1132,17 +1132,11 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
     if (!block) {
         block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
         *blockptr = block;
-        assert((block->target_start & ~target_page_mask) == 0);
-        assert((block->target_end & ~target_page_mask) == 0);
-        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
-        if (bufptr) {
-            *bufptr = block->host_addr;
-        }
-        return true;
+        addr = block->target_start;
+    } else {
+        addr = dump_pfn_to_paddr(s, *pfnptr + 1);
     }
-
-    *pfnptr = *pfnptr + 1;
-    addr = dump_pfn_to_paddr(s, *pfnptr);
+    assert(block != NULL);
 
     if ((addr >= block->target_start) &&
         (addr + s->dump_info.page_size <= block->target_end)) {
@@ -1154,12 +1148,13 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
         if (!block) {
             return false;
         }
-        assert((block->target_start & ~target_page_mask) == 0);
-        assert((block->target_end & ~target_page_mask) == 0);
-        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
+        addr = block->target_start;
         buf = block->host_addr;
     }
 
+    assert((block->target_start & ~target_page_mask) == 0);
+    assert((block->target_end & ~target_page_mask) == 0);
+    *pfnptr = dump_paddr_to_pfn(s, addr);
     if (bufptr) {
         *bufptr = buf;
     }
-- 
2.37.3


