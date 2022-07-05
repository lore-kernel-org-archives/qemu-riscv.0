Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lEk-0005P3-HA
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEc-0005Io-Pb
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:17:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lET-0005zC-8G
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqsFDGNvRFyyJz5IfEkH7E1QHQ9OXTkcwokq/IofF1U=;
 b=BitWlRJwp5HyuSujWhJwqSYOj9DzXUmrE2RMZRl5TH5Vl6XUbiXGrfKJVERSIcVbkyyu0F
 F8KRekp3n+nsbgG48lEgxtL6G3oGJqhSb+gDIr6GNipSpztS1v1XRkdRfUEPlTtaT9PJx2
 LQZ3eEs5oxlBHt62u4v3mZJbDOMcMOY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-DqH036NLMFugs6LJV7BAnw-1; Tue, 05 Jul 2022 12:16:55 -0400
X-MC-Unique: DqH036NLMFugs6LJV7BAnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED81D384F803;
 Tue,  5 Jul 2022 16:16:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79D1C140EBE4;
 Tue,  5 Jul 2022 16:16:47 +0000 (UTC)
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
Subject: [PATCH v2 12/18] block: Implement blk_pwrite_zeroes() using
 generated_co_wrapper
Date: Tue,  5 Jul 2022 17:15:20 +0100
Message-Id: <20220705161527.1054072-13-afaria@redhat.com>
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
X-List-Received-Date: Tue, 05 Jul 2022 16:17:11 -0000

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             |  8 --------
 include/sysemu/block-backend-io.h |  5 +++--
 tests/unit/test-block-iothread.c  | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index cc85558813..8129259e50 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1415,14 +1415,6 @@ typedef struct BlkRwCo {
     BdrvRequestFlags flags;
 } BlkRwCo;
 
-int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int64_t bytes, BdrvRequestFlags flags)
-{
-    IO_OR_GS_CODE();
-    return blk_pwritev_part(blk, offset, bytes, NULL, 0,
-                            flags | BDRV_REQ_ZERO_WRITE);
-}
-
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
 {
     GLOBAL_STATE_CODE();
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index d129e2bed3..5ce9b80023 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -174,8 +174,9 @@ int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
 int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                           int64_t bytes, const void *buf);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int64_t bytes, BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                           int64_t bytes,
+                                           BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 3a46886784..bb9230a4b4 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -212,6 +212,19 @@ static void test_sync_op_blk_pwrite_compressed(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EIO);
 }
 
+static void test_sync_op_blk_pwrite_zeroes(BlockBackend *blk)
+{
+    int ret;
+
+    /* Success */
+    ret = blk_pwrite_zeroes(blk, 0, 512, 0);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_pwrite_zeroes(blk, -2, 512, 0);
+    g_assert_cmpint(ret, ==, -EIO);
+}
+
 static void test_sync_op_load_vmstate(BdrvChild *c)
 {
     uint8_t buf[512];
@@ -395,6 +408,10 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/pwrite_compressed",
         .fn     = NULL,
         .blkfn  = test_sync_op_blk_pwrite_compressed,
+    }, {
+        .name   = "/sync-op/pwrite_zeroes",
+        .fn     = NULL,
+        .blkfn  = test_sync_op_blk_pwrite_zeroes,
     }, {
         .name   = "/sync-op/load_vmstate",
         .fn     = test_sync_op_load_vmstate,
-- 
2.36.1


