Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lEU-0004zx-Ms
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEN-0004nG-46
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:16:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEK-0005xO-SQ
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMBX2D3AxzNFZPdHEsTMziSicAD/tBubwQAQs9ceL5Y=;
 b=YqKkw0Vuz09M3NxjyNUiRmmDgT6OILkcyXStzo2DB8DPDyL6ZPzz0qPJYA7DyOc+rFXA1V
 M8jgWV5A9vEBtaZD/teHjSEg2913m+dcrQK7s+m9gusiLE4KgztqwGtGWlajHWXxrbXcc7
 EWsDlZNiqBncYqg/fZApwx+Pe+Vh7tA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-YIX-Sc01NgCjvRywCLwsaA-1; Tue, 05 Jul 2022 12:16:48 -0400
X-MC-Unique: YIX-Sc01NgCjvRywCLwsaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22B84805AF5;
 Tue,  5 Jul 2022 16:16:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2147140EBE4;
 Tue,  5 Jul 2022 16:16:41 +0000 (UTC)
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
Subject: [PATCH v2 11/18] block: Add blk_co_pwrite_compressed()
Date: Tue,  5 Jul 2022 17:15:19 +0100
Message-Id: <20220705161527.1054072-12-afaria@redhat.com>
In-Reply-To: <20220705161527.1054072-1-afaria@redhat.com>
References: <20220705161527.1054072-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 05 Jul 2022 16:16:55 -0000

Also convert blk_pwrite_compressed() into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             |  8 ++++----
 include/sysemu/block-backend-io.h |  7 +++++--
 tests/unit/test-block-iothread.c  | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index ddb1d4e179..cc85558813 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2324,13 +2324,13 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                           flags | BDRV_REQ_ZERO_WRITE);
 }
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
-                          const void *buf)
+int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, const void *buf)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
-    return blk_pwritev_part(blk, offset, bytes, &qiov, 0,
-                            BDRV_REQ_WRITE_COMPRESSED);
+    return blk_co_pwritev_part(blk, offset, bytes, &qiov, 0,
+                               BDRV_REQ_WRITE_COMPRESSED);
 }
 
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index c64207cdcb..d129e2bed3 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -168,8 +168,11 @@ int blk_flush(BlockBackend *blk);
 
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
-                          const void *buf);
+int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
+                                               int64_t offset, int64_t bytes,
+                                               const void *buf);
+int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, const void *buf);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int64_t bytes, BdrvRequestFlags flags);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 274e9e3653..3a46886784 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -198,6 +198,20 @@ static void test_sync_op_blk_pwritev_part(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_pwrite_compressed(BlockBackend *blk)
+{
+    uint8_t buf[512] = { 0 };
+    int ret;
+
+    /* Late error: Not supported */
+    ret = blk_pwrite_compressed(blk, 0, sizeof(buf), buf);
+    g_assert_cmpint(ret, ==, -ENOTSUP);
+
+    /* Early error: Negative offset */
+    ret = blk_pwrite_compressed(blk, -2, sizeof(buf), buf);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -377,6 +391,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwritev_part",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_pwritev_part,
+    }, {
+        .name   = "/sync-op/pwrite_compressed",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwrite_compressed,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.36.1


