Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lFV-0006FO-0f
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lFJ-0006Al-Oe
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:17:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lFH-0006Ec-Os
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6frTgrdzk9n4SJYadeqbPUcUusGpMFsVosyyUO2YQA=;
 b=A3Y54mejQ71l25jkBiI6+xrn4oay4adlxqBdqQZecPU4+zbCXMZrbrFzNcLrWmi+L1+gi6
 orEg0Bjqhz/QYH213l8zYWrs02Rd3UOxyPQktxKDJU8WNc4Labm0B2nrX6pt4+36aTUaxf
 cmWVL4crGPgmIIiojuPWJu6+qM9KV5M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-r84Ew47JM32GuF_7w5bUKg-1; Tue, 05 Jul 2022 12:17:35 -0400
X-MC-Unique: r84Ew47JM32GuF_7w5bUKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1693E805AF5;
 Tue,  5 Jul 2022 16:17:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94FC7140EBE4;
 Tue,  5 Jul 2022 16:17:24 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bin Meng <bin.meng@windriver.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-riscv@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 qemu-arm@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 18/18] block: Remove remaining unused symbols in
 coroutines.h
Date: Tue,  5 Jul 2022 17:15:26 +0100
Message-Id: <20220705161527.1054072-19-afaria@redhat.com>
In-Reply-To: <20220705161527.1054072-1-afaria@redhat.com>
References: <20220705161527.1054072-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 05 Jul 2022 16:18:00 -0000

Some can be made static, others are unused generated_co_wrappers.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c |  6 +++---
 block/coroutines.h    | 19 -------------------
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 920ba0dd1f..bf63f187ef 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1358,7 +1358,7 @@ int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
+static int coroutine_fn
 blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
                        BdrvRequestFlags flags)
@@ -1691,7 +1691,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
+static int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
@@ -1739,7 +1739,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn blk_co_do_flush(BlockBackend *blk)
+static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
     blk_wait_while_drained(blk);
     IO_CODE();
diff --git a/block/coroutines.h b/block/coroutines.h
index d66551a277..3a2bad564f 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -63,17 +63,6 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
                                Error **errp);
 
 
-int coroutine_fn
-blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
-                       QEMUIOVector *qiov, size_t qiov_offset,
-                       BdrvRequestFlags flags);
-
-int coroutine_fn
-blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-
-int coroutine_fn blk_co_do_flush(BlockBackend *blk);
-
-
 /*
  * "I/O or GS" API functions. These functions can run without
  * the BQL, but only in one specific iothread/main loop.
@@ -82,14 +71,6 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk);
  * the "I/O or GS" API.
  */
 
-int generated_co_wrapper
-bdrv_preadv(BdrvChild *child, int64_t offset, int64_t bytes,
-            QEMUIOVector *qiov, BdrvRequestFlags flags);
-
-int generated_co_wrapper
-bdrv_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
-             QEMUIOVector *qiov, BdrvRequestFlags flags);
-
 int generated_co_wrapper
 bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState *base,
-- 
2.36.1


