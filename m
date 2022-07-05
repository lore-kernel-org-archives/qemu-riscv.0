Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lFC-00063M-9f
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lFB-0005yV-2e
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lF9-0006CR-8O
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Twz4nzLQnbnRXreOmXwcxicSwzHNJ/knpihci4IQwCo=;
 b=a4Lgj4WIup4NzaxozHVdS9ZPb5z8CylMQQuFDx25En5mI4eQEMUmpDM5DYpWDQ1a+ho5PX
 MT1m/43JiPxeK9j7rMl2ssowbZikzA00s4kqiZw9SK/+B/DaL5LMADkyaY6e1l030UJBaB
 Ke8P5iKYZ5z32h70C2xpC83x5tiFYVM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-94SEwmbZNracr3EaDDy8RA-1; Tue, 05 Jul 2022 12:17:35 -0400
X-MC-Unique: 94SEwmbZNracr3EaDDy8RA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 660FB38149B2;
 Tue,  5 Jul 2022 16:17:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E02F6140EBE4;
 Tue,  5 Jul 2022 16:17:12 +0000 (UTC)
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
Subject: [PATCH v2 16/18] block: Add blk_co_truncate()
Date: Tue,  5 Jul 2022 17:15:24 +0100
Message-Id: <20220705161527.1054072-17-afaria@redhat.com>
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
X-List-Received-Date: Tue, 05 Jul 2022 16:17:45 -0000

Also convert blk_truncate() into a generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             |  7 ++++---
 include/sysemu/block-backend-io.h |  8 ++++++--
 tests/unit/test-block-iothread.c  | 14 ++++++++++++++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 7bad42259e..52be1d9116 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2303,8 +2303,9 @@ int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                BDRV_REQ_WRITE_COMPRESSED);
 }
 
-int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
-                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp)
+int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
+                                 PreallocMode prealloc, BdrvRequestFlags flags,
+                                 Error **errp)
 {
     IO_OR_GS_CODE();
     if (!blk_is_available(blk)) {
@@ -2312,7 +2313,7 @@ int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
         return -ENOMEDIUM;
     }
 
-    return bdrv_truncate(blk->root, offset, exact, prealloc, flags, errp);
+    return bdrv_co_truncate(blk->root, offset, exact, prealloc, flags, errp);
 }
 
 int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index bb1ae25863..004493ec36 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -183,7 +183,11 @@ int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                            BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
-int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
-                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
+int generated_co_wrapper blk_truncate(BlockBackend *blk, int64_t offset,
+                                      bool exact, PreallocMode prealloc,
+                                      BdrvRequestFlags flags, Error **errp);
+int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
+                                 PreallocMode prealloc, BdrvRequestFlags flags,
+                                 Error **errp);
 
 #endif /* BLOCK_BACKEND_IO_H */
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index bb9230a4b4..8b55eccc89 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -298,6 +298,19 @@ static void test_sync_op_truncate(BdrvChild *c)
     c->bs->open_flags |= BDRV_O_RDWR;
 }
 
+static void test_sync_op_blk_truncate(BlockBackend *blk)
+{
+    int ret;
+
+    /* Normal success path */
+    ret = blk_truncate(blk, 65536, false, PREALLOC_MODE_OFF, 0, NULL);
+    g_assert_cmpint(ret, ==, 0);
+
+    /* Early error: Negative offset */
+    ret = blk_truncate(blk, -2, false, PREALLOC_MODE_OFF, 0, NULL);
+    g_assert_cmpint(ret, ==, -EINVAL);
+}
+
 static void test_sync_op_block_status(BdrvChild *c)
 {
     int ret;
@@ -425,6 +438,7 @@ const SyncOpTest sync_op_tests[] = {
     }, {
         .name   = "/sync-op/truncate",
         .fn     = test_sync_op_truncate,
+        .blkfn  = test_sync_op_blk_truncate,
     }, {
         .name   = "/sync-op/block_status",
         .fn     = test_sync_op_block_status,
-- 
2.36.1


