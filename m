Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lF9-0005tO-Id
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lF8-0005pO-FQ
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:17:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lF5-0006Ac-BF
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4pmwaK897CSBSRMhYrXVgOK3RSUvfGxoprWR4T0e2c=;
 b=P9/mS1mmTtI31cab+XMshDAKRyz7eHOdeqhuTzifrRJVH77t1Uq9YhMnjW7Fs5OnuYHiy0
 7Y8POcmeXnzfOf4RH6AE2nM3Q9p+wPA+NyFFtL45wV8MIG7Du5HXPIG5oFL+rxbkJOy8te
 pf7VALaiQF1J4FSgvF0q3OMqpZdUJxM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-yibafJr-MvSBuQCFsQnOXw-1; Tue, 05 Jul 2022 12:17:35 -0400
X-MC-Unique: yibafJr-MvSBuQCFsQnOXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BA521D33888;
 Tue,  5 Jul 2022 16:17:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBBFB140EBE4;
 Tue,  5 Jul 2022 16:17:18 +0000 (UTC)
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
Subject: [PATCH v2 17/18] block: Reorganize some declarations in
 block-backend-io.h
Date: Tue,  5 Jul 2022 17:15:25 +0100
Message-Id: <20220705161527.1054072-18-afaria@redhat.com>
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
X-List-Received-Date: Tue, 05 Jul 2022 16:17:42 -0000

Keep generated_co_wrapper and coroutine_fn pairs together. This should
make it clear that each I/O function has these two versions.

Also move blk_co_{pread,pwrite}()'s implementations out of the header
file for consistency.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c             | 22 +++++++++
 include/sysemu/block-backend-io.h | 77 +++++++++++++------------------
 2 files changed, 54 insertions(+), 45 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 52be1d9116..920ba0dd1f 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1318,6 +1318,17 @@ blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
     return ret;
 }
 
+int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset, int64_t bytes,
+                              void *buf, BdrvRequestFlags flags)
+{
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_OR_GS_CODE();
+
+    assert(bytes <= SIZE_MAX);
+
+    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
+}
+
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags)
@@ -1399,6 +1410,17 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
     return ret;
 }
 
+int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
+                               const void *buf, BdrvRequestFlags flags)
+{
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_OR_GS_CODE();
+
+    assert(bytes <= SIZE_MAX);
+
+    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
+}
+
 int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
                                 int64_t bytes, QEMUIOVector *qiov,
                                 BdrvRequestFlags flags)
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 004493ec36..5616338ee1 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -105,9 +105,16 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
 int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
                                    int64_t bytes, void *buf,
                                    BdrvRequestFlags flags);
-int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
-                                    int64_t bytes, const void *buf,
+int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset, int64_t bytes,
+                              void *buf, BdrvRequestFlags flags);
+
+int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, QEMUIOVector *qiov,
                                     BdrvRequestFlags flags);
+int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
+                               int64_t bytes, QEMUIOVector *qiov,
+                               BdrvRequestFlags flags);
+
 int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
                                          int64_t bytes, QEMUIOVector *qiov,
                                          size_t qiov_offset,
@@ -115,12 +122,20 @@ int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
 int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, QEMUIOVector *qiov,
                                     size_t qiov_offset, BdrvRequestFlags flags);
-int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
-                                    int64_t bytes, QEMUIOVector *qiov,
+
+int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, const void *buf,
                                     BdrvRequestFlags flags);
-int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
-                               int64_t bytes, QEMUIOVector *qiov,
-                               BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
+                               const void *buf, BdrvRequestFlags flags);
+
+int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
+                                     int64_t bytes, QEMUIOVector *qiov,
+                                     BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
+                                int64_t bytes, QEMUIOVector *qiov,
+                                BdrvRequestFlags flags);
+
 int generated_co_wrapper blk_pwritev_part(BlockBackend *blk, int64_t offset,
                                           int64_t bytes, QEMUIOVector *qiov,
                                           size_t qiov_offset,
@@ -129,36 +144,18 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
                                      BdrvRequestFlags flags);
-int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
-                                     int64_t bytes, QEMUIOVector *qiov,
-                                     BdrvRequestFlags flags);
-int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
-                                int64_t bytes, QEMUIOVector *qiov,
-                                BdrvRequestFlags flags);
-
-static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
-                                            int64_t bytes, void *buf,
-                                            BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
-
-    assert(bytes <= SIZE_MAX);
-
-    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
-}
-
-static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
-                                             int64_t bytes, const void *buf,
-                                             BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
 
-    assert(bytes <= SIZE_MAX);
+int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
+                                               int64_t offset, int64_t bytes,
+                                               const void *buf);
+int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
+                                          int64_t bytes, const void *buf);
 
-    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
-}
+int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                           int64_t bytes,
+                                           BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                      int64_t bytes, BdrvRequestFlags flags);
 
 int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
                                       int64_t bytes);
@@ -173,16 +170,6 @@ int generated_co_wrapper blk_ioctl(BlockBackend *blk, unsigned long int req,
 int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
                               void *buf);
 
-int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
-                                               int64_t offset, int64_t bytes,
-                                               const void *buf);
-int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
-                                          int64_t bytes, const void *buf);
-int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                           int64_t bytes,
-                                           BdrvRequestFlags flags);
-int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                      int64_t bytes, BdrvRequestFlags flags);
 int generated_co_wrapper blk_truncate(BlockBackend *blk, int64_t offset,
                                       bool exact, PreallocMode prealloc,
                                       BdrvRequestFlags flags, Error **errp);
-- 
2.36.1


