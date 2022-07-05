Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lDs-00045j-SU
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDr-00041k-Bv
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDp-0005s1-NM
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvTeS9qfyADGoBU9bM9GJBaeSu4vGZX6iRwEsCNqzq4=;
 b=DuLxGgi2J4+ZY0UQu1Rjp/WnvKq8J8HhXL2Wqs7FzCs5yJT2lqvLCAzh5YUKlNeNGr9Qbg
 ywtgxgHvyC7KRWu/asmy1v/AGLHcjCCujbseCYVMtepcVABdho0PREjV6qBGCgY0EZNQBg
 5dTHEYGu5HMRy3V/gfu2mlwjvhLumw8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-Melyja-bMz2cP7FTapaegQ-1; Tue, 05 Jul 2022 12:16:19 -0400
X-MC-Unique: Melyja-bMz2cP7FTapaegQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8312185A7BA;
 Tue,  5 Jul 2022 16:16:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 854CA140EBE4;
 Tue,  5 Jul 2022 16:16:12 +0000 (UTC)
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
 qemu-arm@nongnu.org, Alberto Faria <afaria@redhat.com>
Subject: [PATCH v2 06/18] block: Implement blk_{pread,
 pwrite}() using generated_co_wrapper
Date: Tue,  5 Jul 2022 17:15:14 +0100
Message-Id: <20220705161527.1054072-7-afaria@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 05 Jul 2022 16:16:23 -0000

We need to add include/sysemu/block-backend-io.h to the inputs of the
block-gen.c target defined in block/meson.build.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             | 23 -----------------------
 block/coroutines.h                |  4 ----
 block/meson.build                 |  1 +
 include/sysemu/block-backend-io.h | 10 ++++++----
 4 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 5b9706c443..c2a4c44a99 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1567,29 +1567,6 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
-              BdrvRequestFlags flags)
-{
-    int ret;
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_preadv(blk, offset, bytes, &qiov, flags);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
-int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
-               const void *buf, BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_OR_GS_CODE();
-
-    return blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);
-}
-
 int64_t blk_getlength(BlockBackend *blk)
 {
     IO_CODE();
diff --git a/block/coroutines.h b/block/coroutines.h
index 3f41238b33..443ef2f2e6 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -112,10 +112,6 @@ bdrv_common_block_status_above(BlockDriverState *bs,
 int generated_co_wrapper
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
-int generated_co_wrapper
-blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-              QEMUIOVector *qiov, BdrvRequestFlags flags);
-
 int generated_co_wrapper
 blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                     QEMUIOVector *qiov, size_t qiov_offset,
diff --git a/block/meson.build b/block/meson.build
index 0b2a60c99b..60bc305597 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -136,6 +136,7 @@ block_gen_c = custom_target('block-gen.c',
                             input: files(
                                       '../include/block/block-io.h',
                                       '../include/block/block-global-state.h',
+                                      '../include/sysemu/block-backend-io.h',
                                       'coroutines.h'
                                       ),
                             command: [wrapper_py, '@OUTPUT@', '@INPUT@'])
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6440e92028..0804ce1c1d 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -102,10 +102,12 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
  * the "I/O or GS" API.
  */
 
-int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
-              BdrvRequestFlags flags);
-int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
-               const void *buf, BdrvRequestFlags flags);
+int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
+                                   int64_t bytes, void *buf,
+                                   BdrvRequestFlags flags);
+int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
+                                    int64_t bytes, const void *buf,
+                                    BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
-- 
2.36.1


