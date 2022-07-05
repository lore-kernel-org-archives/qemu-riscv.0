Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lEN-0004pL-CX
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEC-0004iM-Ca
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEA-0005vW-OJ
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEmnjlWvBG2GGomgOw+9Dya2tJ8zl8rGHIuhVDQwvUI=;
 b=fUnwmufN2mUsByDB+JtMc0wj7UZev0efOAVq5rryX4geStrN/6VqIW5vrhAZMmYeXeRn6Q
 2963niknKwE/aAobNMt0wHx8ewq/g5+Y3UC/WpD+QihI76rwbgimpcR4FDKpwOUbayeKgn
 BS9dlqNrKOO/s9Op/nVH6ocbfs29FA4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-3-f8WSPuMnG9DE50s3mFiQ-1; Tue, 05 Jul 2022 12:16:30 -0400
X-MC-Unique: 3-f8WSPuMnG9DE50s3mFiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B307101A589;
 Tue,  5 Jul 2022 16:16:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17E7C14152E1;
 Tue,  5 Jul 2022 16:16:23 +0000 (UTC)
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
Subject: [PATCH v2 08/18] block: Add blk_[co_]preadv_part()
Date: Tue,  5 Jul 2022 17:15:16 +0100
Message-Id: <20220705161527.1054072-9-afaria@redhat.com>
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
X-List-Received-Date: Tue, 05 Jul 2022 16:16:45 -0000

Implement blk_preadv_part() using generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             | 30 +++++++++++++++++++++++-------
 block/coroutines.h                |  5 -----
 include/sysemu/block-backend-io.h |  7 +++++++
 tests/unit/test-block-iothread.c  | 19 +++++++++++++++++++
 4 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index c2a4c44a99..3920e1f45e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1284,9 +1284,10 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
-blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-                 QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn
+blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
+                      QEMUIOVector *qiov, size_t qiov_offset,
+                      BdrvRequestFlags flags)
 {
     int ret;
     BlockDriverState *bs;
@@ -1311,7 +1312,8 @@ blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
                 bytes, false);
     }
 
-    ret = bdrv_co_preadv(blk->root, offset, bytes, qiov, flags);
+    ret = bdrv_co_preadv_part(blk->root, offset, bytes, qiov, qiov_offset,
+                              flags);
     bdrv_dec_in_flight(bs);
     return ret;
 }
@@ -1324,7 +1326,21 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    ret = blk_co_do_preadv(blk, offset, bytes, qiov, flags);
+    ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, 0, flags);
+    blk_dec_in_flight(blk);
+
+    return ret;
+}
+
+int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
+                                    size_t qiov_offset, BdrvRequestFlags flags)
+{
+    int ret;
+    IO_OR_GS_CODE();
+
+    blk_inc_in_flight(blk);
+    ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, qiov_offset, flags);
     blk_dec_in_flight(blk);
 
     return ret;
@@ -1541,8 +1557,8 @@ static void blk_aio_read_entry(void *opaque)
     QEMUIOVector *qiov = rwco->iobuf;
 
     assert(qiov->size == acb->bytes);
-    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, acb->bytes,
-                                 qiov, rwco->flags);
+    rwco->ret = blk_co_do_preadv_part(rwco->blk, rwco->offset, acb->bytes, qiov,
+                                      0, rwco->flags);
     blk_aio_complete(acb);
 }
 
diff --git a/block/coroutines.h b/block/coroutines.h
index 443ef2f2e6..85423f8db6 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -63,11 +63,6 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
                                Error **errp);
 
 
-int coroutine_fn
-blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-                 QEMUIOVector *qiov, BdrvRequestFlags flags);
-
-
 int coroutine_fn
 blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 3b548a8ae1..29954a466c 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -108,6 +108,13 @@ int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
 int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, const void *buf,
                                     BdrvRequestFlags flags);
+int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
+                                         int64_t bytes, QEMUIOVector *qiov,
+                                         size_t qiov_offset,
+                                         BdrvRequestFlags flags);
+int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
+                                    size_t qiov_offset, BdrvRequestFlags flags);
 int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, QEMUIOVector *qiov,
                                     BdrvRequestFlags flags);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index b9c5da3a87..2fa1248445 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -168,6 +168,21 @@ static void test_sync_op_blk_pwritev(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_preadv_part(BlockBackend *blk)
+{
+    uint8_t buf[512];
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
+    int ret;
+
+    /* Success */
+    ret = blk_preadv_part(blk, 0, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_preadv_part(blk, -2, sizeof(buf), &qiov, 0, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -339,6 +354,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwritev",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_pwritev,
+    }, {
+        .name   = "/sync-op/preadv_part",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_preadv_part,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.36.1


