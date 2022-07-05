Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lDi-0003mT-NN
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDg-0003fH-ID
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDb-0005nT-OL
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2ijcRpP/ivnyKQlKvRD0tS19mPh4FlvIve45CUEWBA=;
 b=JvU2SMHT2IWgok9zbj4NzCGWPg0QOyuc/Ch5EL/vk7tFaEV8SGkt68vauHwo3EmlMwoEsv
 i/5oqxGGtD4cPhKGcGqJZusciaWeWBCvFYT7YuVfGWiuApqXRESJga2Tv9bOQpEvMC4MSU
 Oxyq/KncmvFosvG8YcnVthauZsVKTG0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-wdCR2bYOO5aSG0S2VuKWgA-1; Tue, 05 Jul 2022 12:16:01 -0400
X-MC-Unique: wdCR2bYOO5aSG0S2VuKWgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C887294EDCC;
 Tue,  5 Jul 2022 16:16:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C910140EBE4;
 Tue,  5 Jul 2022 16:15:54 +0000 (UTC)
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
Subject: [PATCH v2 03/18] block: Change blk_{pread,pwrite}() param order
Date: Tue,  5 Jul 2022 17:15:11 +0100
Message-Id: <20220705161527.1054072-4-afaria@redhat.com>
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
X-List-Received-Date: Tue, 05 Jul 2022 16:16:12 -0000

Swap 'buf' and 'bytes' around for consistency with
blk_co_{pread,pwrite}(), and in preparation to implement these functions
using generated_co_wrapper.

Callers were updated using this Coccinelle script:

    @@ expression blk, offset, buf, bytes, flags; @@
    - blk_pread(blk, offset, buf, bytes, flags)
    + blk_pread(blk, offset, bytes, buf, flags)

    @@ expression blk, offset, buf, bytes, flags; @@
    - blk_pwrite(blk, offset, buf, bytes, flags)
    + blk_pwrite(blk, offset, bytes, buf, flags)

It had no effect on hw/block/nand.c, presumably due to the #if, so that
file was updated manually.

Overly-long lines were then fixed by hand.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c                           |  2 +-
 block/block-backend.c             |  4 +--
 block/commit.c                    |  4 +--
 block/crypto.c                    |  2 +-
 block/export/fuse.c               |  4 +--
 block/parallels.c                 |  2 +-
 block/qcow.c                      |  8 +++---
 block/qcow2.c                     |  4 +--
 block/qed.c                       |  8 +++---
 block/vdi.c                       |  4 +--
 block/vhdx.c                      | 20 ++++++-------
 block/vmdk.c                      | 10 +++----
 block/vpc.c                       | 12 ++++----
 hw/arm/allwinner-h3.c             |  2 +-
 hw/arm/aspeed.c                   |  2 +-
 hw/block/block.c                  |  2 +-
 hw/block/fdc.c                    | 20 ++++++-------
 hw/block/hd-geometry.c            |  2 +-
 hw/block/m25p80.c                 |  2 +-
 hw/block/nand.c                   | 47 ++++++++++++++++---------------
 hw/block/onenand.c                | 32 ++++++++++-----------
 hw/block/pflash_cfi01.c           |  4 +--
 hw/block/pflash_cfi02.c           |  4 +--
 hw/ide/atapi.c                    |  4 +--
 hw/misc/mac_via.c                 |  4 +--
 hw/misc/sifive_u_otp.c            | 14 ++++-----
 hw/nvram/eeprom_at24c.c           |  4 +--
 hw/nvram/spapr_nvram.c            |  6 ++--
 hw/nvram/xlnx-bbram.c             |  4 +--
 hw/nvram/xlnx-efuse.c             |  4 +--
 hw/ppc/pnv_pnor.c                 |  6 ++--
 hw/sd/sd.c                        |  4 +--
 include/sysemu/block-backend-io.h |  4 +--
 migration/block.c                 |  6 ++--
 nbd/server.c                      |  8 +++---
 qemu-img.c                        | 18 ++++++------
 qemu-io-cmds.c                    |  4 +--
 tests/unit/test-block-iothread.c  |  8 +++---
 38 files changed, 150 insertions(+), 149 deletions(-)

diff --git a/block.c b/block.c
index ed701b4889..bc85f46eed 100644
--- a/block.c
+++ b/block.c
@@ -1037,7 +1037,7 @@ static int find_image_format(BlockBackend *file, const char *filename,
         return ret;
     }
 
-    ret = blk_pread(file, 0, buf, sizeof(buf), 0);
+    ret = blk_pread(file, 0, sizeof(buf), buf, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not read image for determining its "
                          "format");
diff --git a/block/block-backend.c b/block/block-backend.c
index da89450861..16a0093c52 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1567,7 +1567,7 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes,
+int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
               BdrvRequestFlags flags)
 {
     int ret;
@@ -1581,7 +1581,7 @@ int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes,
     return ret;
 }
 
-int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
+int blk_pwrite(BlockBackend *blk, int64_t offset, int bytes, const void *buf,
                BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
diff --git a/block/commit.c b/block/commit.c
index e5b3ad08da..38571510cb 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -527,12 +527,12 @@ int bdrv_commit(BlockDriverState *bs)
             goto ro_cleanup;
         }
         if (ret) {
-            ret = blk_pread(src, offset, buf, n, 0);
+            ret = blk_pread(src, offset, n, buf, 0);
             if (ret < 0) {
                 goto ro_cleanup;
             }
 
-            ret = blk_pwrite(backing, offset, buf, n, 0);
+            ret = blk_pwrite(backing, offset, n, buf, 0);
             if (ret < 0) {
                 goto ro_cleanup;
             }
diff --git a/block/crypto.c b/block/crypto.c
index 11c3ddbc73..7a57774b76 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -109,7 +109,7 @@ static int block_crypto_create_write_func(QCryptoBlock *block,
     struct BlockCryptoCreateData *data = opaque;
     ssize_t ret;
 
-    ret = blk_pwrite(data->blk, offset, buf, buflen, 0);
+    ret = blk_pwrite(data->blk, offset, buflen, buf, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not write encryption header");
         return ret;
diff --git a/block/export/fuse.c b/block/export/fuse.c
index dcf8f225f3..1b26ddfcf3 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -554,7 +554,7 @@ static void fuse_read(fuse_req_t req, fuse_ino_t inode,
         return;
     }
 
-    ret = blk_pread(exp->common.blk, offset, buf, size, 0);
+    ret = blk_pread(exp->common.blk, offset, size, buf, 0);
     if (ret >= 0) {
         fuse_reply_buf(req, buf, size);
     } else {
@@ -607,7 +607,7 @@ static void fuse_write(fuse_req_t req, fuse_ino_t inode, const char *buf,
         }
     }
 
-    ret = blk_pwrite(exp->common.blk, offset, buf, size, 0);
+    ret = blk_pwrite(exp->common.blk, offset, size, buf, 0);
     if (ret >= 0) {
         fuse_reply_write(req, size);
     } else {
diff --git a/block/parallels.c b/block/parallels.c
index 8b23b9580d..8b235b9505 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -599,7 +599,7 @@ static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
     memset(tmp, 0, sizeof(tmp));
     memcpy(tmp, &header, sizeof(header));
 
-    ret = blk_pwrite(blk, 0, tmp, BDRV_SECTOR_SIZE, 0);
+    ret = blk_pwrite(blk, 0, BDRV_SECTOR_SIZE, tmp, 0);
     if (ret < 0) {
         goto exit;
     }
diff --git a/block/qcow.c b/block/qcow.c
index 25a43353c1..311aaa8705 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -890,14 +890,14 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
     }
 
     /* write all the data */
-    ret = blk_pwrite(qcow_blk, 0, &header, sizeof(header), 0);
+    ret = blk_pwrite(qcow_blk, 0, sizeof(header), &header, 0);
     if (ret < 0) {
         goto exit;
     }
 
     if (qcow_opts->has_backing_file) {
-        ret = blk_pwrite(qcow_blk, sizeof(header),
-                         qcow_opts->backing_file, backing_filename_len, 0);
+        ret = blk_pwrite(qcow_blk, sizeof(header), backing_filename_len,
+                         qcow_opts->backing_file, 0);
         if (ret < 0) {
             goto exit;
         }
@@ -907,7 +907,7 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
     for (i = 0; i < DIV_ROUND_UP(sizeof(uint64_t) * l1_size, BDRV_SECTOR_SIZE);
          i++) {
         ret = blk_pwrite(qcow_blk, header_size + BDRV_SECTOR_SIZE * i,
-                         tmp, BDRV_SECTOR_SIZE, 0);
+                         BDRV_SECTOR_SIZE, tmp, 0);
         if (ret < 0) {
             g_free(tmp);
             goto exit;
diff --git a/block/qcow2.c b/block/qcow2.c
index 90a2dd406b..c6c6692fb7 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3666,7 +3666,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
             cpu_to_be64(QCOW2_INCOMPAT_EXTL2);
     }
 
-    ret = blk_pwrite(blk, 0, header, cluster_size, 0);
+    ret = blk_pwrite(blk, 0, cluster_size, header, 0);
     g_free(header);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not write qcow2 header");
@@ -3676,7 +3676,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     /* Write a refcount table with one refcount block */
     refcount_table = g_malloc0(2 * cluster_size);
     refcount_table[0] = cpu_to_be64(2 * cluster_size);
-    ret = blk_pwrite(blk, cluster_size, refcount_table, 2 * cluster_size, 0);
+    ret = blk_pwrite(blk, cluster_size, 2 * cluster_size, refcount_table, 0);
     g_free(refcount_table);
 
     if (ret < 0) {
diff --git a/block/qed.c b/block/qed.c
index 55da91eb72..40943e679b 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -705,18 +705,18 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCreateOptions *opts,
     }
 
     qed_header_cpu_to_le(&header, &le_header);
-    ret = blk_pwrite(blk, 0, &le_header, sizeof(le_header), 0);
+    ret = blk_pwrite(blk, 0, sizeof(le_header), &le_header, 0);
     if (ret < 0) {
         goto out;
     }
-    ret = blk_pwrite(blk, sizeof(le_header), qed_opts->backing_file,
-                     header.backing_filename_size, 0);
+    ret = blk_pwrite(blk, sizeof(le_header), header.backing_filename_size,
+                     qed_opts->backing_file, 0);
     if (ret < 0) {
         goto out;
     }
 
     l1_table = g_malloc0(l1_size);
-    ret = blk_pwrite(blk, header.l1_table_offset, l1_table, l1_size, 0);
+    ret = blk_pwrite(blk, header.l1_table_offset, l1_size, l1_table, 0);
     if (ret < 0) {
         goto out;
     }
diff --git a/block/vdi.c b/block/vdi.c
index a0be2a23b9..e942325455 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -845,7 +845,7 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
         vdi_header_print(&header);
     }
     vdi_header_to_le(&header);
-    ret = blk_pwrite(blk, offset, &header, sizeof(header), 0);
+    ret = blk_pwrite(blk, offset, sizeof(header), &header, 0);
     if (ret < 0) {
         error_setg(errp, "Error writing header");
         goto exit;
@@ -866,7 +866,7 @@ static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
                 bmap[i] = VDI_UNALLOCATED;
             }
         }
-        ret = blk_pwrite(blk, offset, bmap, bmap_size, 0);
+        ret = blk_pwrite(blk, offset, bmap_size, bmap, 0);
         if (ret < 0) {
             error_setg(errp, "Error writing bmap");
             goto exit;
diff --git a/block/vhdx.c b/block/vhdx.c
index 12f5261f80..e10e78ebfd 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1665,13 +1665,13 @@ static int vhdx_create_new_metadata(BlockBackend *blk,
                                    VHDX_META_FLAGS_IS_VIRTUAL_DISK;
     vhdx_metadata_entry_le_export(&md_table_entry[4]);
 
-    ret = blk_pwrite(blk, metadata_offset, buffer, VHDX_HEADER_BLOCK_SIZE, 0);
+    ret = blk_pwrite(blk, metadata_offset, VHDX_HEADER_BLOCK_SIZE, buffer, 0);
     if (ret < 0) {
         goto exit;
     }
 
-    ret = blk_pwrite(blk, metadata_offset + (64 * KiB), entry_buffer,
-                     VHDX_METADATA_ENTRY_BUFFER_SIZE, 0);
+    ret = blk_pwrite(blk, metadata_offset + (64 * KiB),
+                     VHDX_METADATA_ENTRY_BUFFER_SIZE, entry_buffer, 0);
     if (ret < 0) {
         goto exit;
     }
@@ -1756,7 +1756,7 @@ static int vhdx_create_bat(BlockBackend *blk, BDRVVHDXState *s,
             s->bat[sinfo.bat_idx] = cpu_to_le64(s->bat[sinfo.bat_idx]);
             sector_num += s->sectors_per_block;
         }
-        ret = blk_pwrite(blk, file_offset, s->bat, length, 0);
+        ret = blk_pwrite(blk, file_offset, length, s->bat, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to write the BAT");
             goto exit;
@@ -1860,15 +1860,15 @@ static int vhdx_create_new_region_table(BlockBackend *blk,
     }
 
     /* Now write out the region headers to disk */
-    ret = blk_pwrite(blk, VHDX_REGION_TABLE_OFFSET, buffer,
-                     VHDX_HEADER_BLOCK_SIZE, 0);
+    ret = blk_pwrite(blk, VHDX_REGION_TABLE_OFFSET, VHDX_HEADER_BLOCK_SIZE,
+                     buffer, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to write first region table");
         goto exit;
     }
 
-    ret = blk_pwrite(blk, VHDX_REGION_TABLE2_OFFSET, buffer,
-                     VHDX_HEADER_BLOCK_SIZE, 0);
+    ret = blk_pwrite(blk, VHDX_REGION_TABLE2_OFFSET, VHDX_HEADER_BLOCK_SIZE,
+                     buffer, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to write second region table");
         goto exit;
@@ -2012,7 +2012,7 @@ static int coroutine_fn vhdx_co_create(BlockdevCreateOptions *opts,
     creator = g_utf8_to_utf16("QEMU v" QEMU_VERSION, -1, NULL,
                               &creator_items, NULL);
     signature = cpu_to_le64(VHDX_FILE_SIGNATURE);
-    ret = blk_pwrite(blk, VHDX_FILE_ID_OFFSET, &signature, sizeof(signature),
+    ret = blk_pwrite(blk, VHDX_FILE_ID_OFFSET, sizeof(signature), &signature,
                      0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to write file signature");
@@ -2020,7 +2020,7 @@ static int coroutine_fn vhdx_co_create(BlockdevCreateOptions *opts,
     }
     if (creator) {
         ret = blk_pwrite(blk, VHDX_FILE_ID_OFFSET + sizeof(signature),
-                         creator, creator_items * sizeof(gunichar2), 0);
+                         creator_items * sizeof(gunichar2), creator, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to write creator field");
             goto delete_and_exit;
diff --git a/block/vmdk.c b/block/vmdk.c
index 332565c80f..fe07a54866 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2236,12 +2236,12 @@ static int vmdk_init_extent(BlockBackend *blk,
     header.check_bytes[3] = 0xa;
 
     /* write all the data */
-    ret = blk_pwrite(blk, 0, &magic, sizeof(magic), 0);
+    ret = blk_pwrite(blk, 0, sizeof(magic), &magic, 0);
     if (ret < 0) {
         error_setg(errp, QERR_IO_ERROR);
         goto exit;
     }
-    ret = blk_pwrite(blk, sizeof(magic), &header, sizeof(header), 0);
+    ret = blk_pwrite(blk, sizeof(magic), sizeof(header), &header, 0);
     if (ret < 0) {
         error_setg(errp, QERR_IO_ERROR);
         goto exit;
@@ -2261,7 +2261,7 @@ static int vmdk_init_extent(BlockBackend *blk,
         gd_buf[i] = cpu_to_le32(tmp);
     }
     ret = blk_pwrite(blk, le64_to_cpu(header.rgd_offset) * BDRV_SECTOR_SIZE,
-                     gd_buf, gd_buf_size, 0);
+                     gd_buf_size, gd_buf, 0);
     if (ret < 0) {
         error_setg(errp, QERR_IO_ERROR);
         goto exit;
@@ -2273,7 +2273,7 @@ static int vmdk_init_extent(BlockBackend *blk,
         gd_buf[i] = cpu_to_le32(tmp);
     }
     ret = blk_pwrite(blk, le64_to_cpu(header.gd_offset) * BDRV_SECTOR_SIZE,
-                     gd_buf, gd_buf_size, 0);
+                     gd_buf_size, gd_buf, 0);
     if (ret < 0) {
         error_setg(errp, QERR_IO_ERROR);
     }
@@ -2584,7 +2584,7 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
         desc_offset = 0x200;
     }
 
-    ret = blk_pwrite(blk, desc_offset, desc, desc_len, 0);
+    ret = blk_pwrite(blk, desc_offset, desc_len, desc, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not write description");
         goto exit;
diff --git a/block/vpc.c b/block/vpc.c
index 7f20820193..4f49ef207f 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -834,13 +834,13 @@ static int create_dynamic_disk(BlockBackend *blk, VHDFooter *footer,
     block_size = 0x200000;
     num_bat_entries = DIV_ROUND_UP(total_sectors, block_size / 512);
 
-    ret = blk_pwrite(blk, offset, footer, sizeof(*footer), 0);
+    ret = blk_pwrite(blk, offset, sizeof(*footer), footer, 0);
     if (ret < 0) {
         goto fail;
     }
 
     offset = 1536 + ((num_bat_entries * 4 + 511) & ~511);
-    ret = blk_pwrite(blk, offset, footer, sizeof(*footer), 0);
+    ret = blk_pwrite(blk, offset, sizeof(*footer), footer, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -850,7 +850,7 @@ static int create_dynamic_disk(BlockBackend *blk, VHDFooter *footer,
 
     memset(bat_sector, 0xFF, 512);
     for (i = 0; i < DIV_ROUND_UP(num_bat_entries * 4, 512); i++) {
-        ret = blk_pwrite(blk, offset, bat_sector, 512, 0);
+        ret = blk_pwrite(blk, offset, 512, bat_sector, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -878,7 +878,7 @@ static int create_dynamic_disk(BlockBackend *blk, VHDFooter *footer,
     /* Write the header */
     offset = 512;
 
-    ret = blk_pwrite(blk, offset, &dyndisk_header, sizeof(dyndisk_header), 0);
+    ret = blk_pwrite(blk, offset, sizeof(dyndisk_header), &dyndisk_header, 0);
     if (ret < 0) {
         goto fail;
     }
@@ -901,8 +901,8 @@ static int create_fixed_disk(BlockBackend *blk, VHDFooter *footer,
         return ret;
     }
 
-    ret = blk_pwrite(blk, total_size - sizeof(*footer),
-                     footer, sizeof(*footer), 0);
+    ret = blk_pwrite(blk, total_size - sizeof(*footer), sizeof(*footer),
+                     footer, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Unable to write VHD header");
         return ret;
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 788083b6fa..308ed15552 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -174,7 +174,7 @@ void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk)
     const int64_t rom_size = 32 * KiB;
     g_autofree uint8_t *buffer = g_new0(uint8_t, rom_size);
 
-    if (blk_pread(blk, 8 * KiB, buffer, rom_size, 0) < 0) {
+    if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) < 0) {
         error_setg(&error_fatal, "%s: failed to read BlockBackend data",
                    __func__);
         return;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c11ede6c4d..9d2a4a7bdf 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -270,7 +270,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     }
 
     storage = g_malloc0(rom_size);
-    if (blk_pread(blk, 0, storage, rom_size, 0) < 0) {
+    if (blk_pread(blk, 0, rom_size, storage, 0) < 0) {
         error_setg(errp, "failed to read the initial flash content");
         return;
     }
diff --git a/hw/block/block.c b/hw/block/block.c
index effb89910c..04279166ee 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -53,7 +53,7 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
      * block device and read only on demand.
      */
     assert(size <= BDRV_REQUEST_MAX_BYTES);
-    ret = blk_pread(blk, 0, buf, size, 0);
+    ret = blk_pread(blk, 0, size, buf, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "can't read block backend");
         return false;
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 52f278ed82..64ae4a6899 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1628,8 +1628,8 @@ int fdctrl_transfer_handler(void *opaque, int nchan, int dma_pos, int dma_len)
         if (fdctrl->data_dir != FD_DIR_WRITE ||
             len < FD_SECTOR_LEN || rel_pos != 0) {
             /* READ & SCAN commands and realign to a sector for WRITE */
-            if (blk_pread(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
-                          BDRV_SECTOR_SIZE, 0) < 0) {
+            if (blk_pread(cur_drv->blk, fd_offset(cur_drv), BDRV_SECTOR_SIZE,
+                          fdctrl->fifo, 0) < 0) {
                 FLOPPY_DPRINTF("Floppy: error getting sector %d\n",
                                fd_sector(cur_drv));
                 /* Sure, image size is too small... */
@@ -1656,8 +1656,8 @@ int fdctrl_transfer_handler(void *opaque, int nchan, int dma_pos, int dma_len)
 
             k->read_memory(fdctrl->dma, nchan, fdctrl->fifo + rel_pos,
                            fdctrl->data_pos, len);
-            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv),
-                           fdctrl->fifo, BDRV_SECTOR_SIZE, 0) < 0) {
+            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), BDRV_SECTOR_SIZE,
+                           fdctrl->fifo, 0) < 0) {
                 FLOPPY_DPRINTF("error writing sector %d\n",
                                fd_sector(cur_drv));
                 fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM | FD_SR0_SEEK, 0x00, 0x00);
@@ -1740,8 +1740,8 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
                                    fd_sector(cur_drv));
                     return 0;
                 }
-            if (blk_pread(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
-                          BDRV_SECTOR_SIZE, 0)
+            if (blk_pread(cur_drv->blk, fd_offset(cur_drv), BDRV_SECTOR_SIZE,
+                          fdctrl->fifo, 0)
                 < 0) {
                 FLOPPY_DPRINTF("error getting sector %d\n",
                                fd_sector(cur_drv));
@@ -1820,8 +1820,8 @@ static void fdctrl_format_sector(FDCtrl *fdctrl)
     }
     memset(fdctrl->fifo, 0, FD_SECTOR_LEN);
     if (cur_drv->blk == NULL ||
-        blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
-                   BDRV_SECTOR_SIZE, 0) < 0) {
+        blk_pwrite(cur_drv->blk, fd_offset(cur_drv), BDRV_SECTOR_SIZE,
+                   fdctrl->fifo, 0) < 0) {
         FLOPPY_DPRINTF("error formatting sector %d\n", fd_sector(cur_drv));
         fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM | FD_SR0_SEEK, 0x00, 0x00);
     } else {
@@ -2244,8 +2244,8 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
         if (pos == FD_SECTOR_LEN - 1 ||
             fdctrl->data_pos == fdctrl->data_len) {
             cur_drv = get_cur_drv(fdctrl);
-            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
-                           BDRV_SECTOR_SIZE, 0) < 0) {
+            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), BDRV_SECTOR_SIZE,
+                           fdctrl->fifo, 0) < 0) {
                 FLOPPY_DPRINTF("error writing sector %d\n",
                                fd_sector(cur_drv));
                 break;
diff --git a/hw/block/hd-geometry.c b/hw/block/hd-geometry.c
index 24933eae82..112094358e 100644
--- a/hw/block/hd-geometry.c
+++ b/hw/block/hd-geometry.c
@@ -63,7 +63,7 @@ static int guess_disk_lchs(BlockBackend *blk,
 
     blk_get_geometry(blk, &nb_sectors);
 
-    if (blk_pread(blk, 0, buf, BDRV_SECTOR_SIZE, 0) < 0) {
+    if (blk_pread(blk, 0, BDRV_SECTOR_SIZE, buf, 0) < 0) {
         return -1;
     }
     /* test msdos magic */
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b71f8fb156..6ffef14ab8 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1506,7 +1506,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         trace_m25p80_binding(s);
         s->storage = blk_blockalign(s->blk, s->size);
 
-        if (blk_pread(s->blk, 0, s->storage, s->size, 0) < 0) {
+        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
             error_setg(errp, "failed to read the initial flash content");
             return;
         }
diff --git a/hw/block/nand.c b/hw/block/nand.c
index ea3d33adf4..1aee1cb2b1 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -666,8 +666,8 @@ static void glue(nand_blk_write_, NAND_PAGE_SIZE)(NANDFlashState *s)
         sector = SECTOR(s->addr);
         off = (s->addr & PAGE_MASK) + s->offset;
         soff = SECTOR_OFFSET(s->addr);
-        if (blk_pread(s->blk, sector << BDRV_SECTOR_BITS, iobuf,
-                      PAGE_SECTORS << BDRV_SECTOR_BITS, 0) < 0) {
+        if (blk_pread(s->blk, sector << BDRV_SECTOR_BITS,
+                      PAGE_SECTORS << BDRV_SECTOR_BITS, iobuf, 0) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, sector);
             return;
         }
@@ -679,24 +679,24 @@ static void glue(nand_blk_write_, NAND_PAGE_SIZE)(NANDFlashState *s)
                             MIN(OOB_SIZE, off + s->iolen - NAND_PAGE_SIZE));
         }
 
-        if (blk_pwrite(s->blk, sector << BDRV_SECTOR_BITS, iobuf,
-                       PAGE_SECTORS << BDRV_SECTOR_BITS, 0) < 0) {
+        if (blk_pwrite(s->blk, sector << BDRV_SECTOR_BITS,
+                       PAGE_SECTORS << BDRV_SECTOR_BITS, iobuf, 0) < 0) {
             printf("%s: write error in sector %" PRIu64 "\n", __func__, sector);
         }
     } else {
         off = PAGE_START(s->addr) + (s->addr & PAGE_MASK) + s->offset;
         sector = off >> 9;
         soff = off & 0x1ff;
-        if (blk_pread(s->blk, sector << BDRV_SECTOR_BITS, iobuf,
-                      (PAGE_SECTORS + 2) << BDRV_SECTOR_BITS, 0) < 0) {
+        if (blk_pread(s->blk, sector << BDRV_SECTOR_BITS,
+                      (PAGE_SECTORS + 2) << BDRV_SECTOR_BITS, iobuf, 0) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, sector);
             return;
         }
 
         mem_and(iobuf + soff, s->io, s->iolen);
 
-        if (blk_pwrite(s->blk, sector << BDRV_SECTOR_BITS, iobuf,
-                       (PAGE_SECTORS + 2) << BDRV_SECTOR_BITS, 0) < 0) {
+        if (blk_pwrite(s->blk, sector << BDRV_SECTOR_BITS,
+                       (PAGE_SECTORS + 2) << BDRV_SECTOR_BITS, iobuf, 0) < 0) {
             printf("%s: write error in sector %" PRIu64 "\n", __func__, sector);
         }
     }
@@ -723,20 +723,20 @@ static void glue(nand_blk_erase_, NAND_PAGE_SIZE)(NANDFlashState *s)
         i = SECTOR(addr);
         page = SECTOR(addr + (1 << (ADDR_SHIFT + s->erase_shift)));
         for (; i < page; i ++)
-            if (blk_pwrite(s->blk, i << BDRV_SECTOR_BITS, iobuf,
-                           BDRV_SECTOR_SIZE, 0) < 0) {
+            if (blk_pwrite(s->blk, i << BDRV_SECTOR_BITS,
+                           BDRV_SECTOR_SIZE, iobuf, 0) < 0) {
                 printf("%s: write error in sector %" PRIu64 "\n", __func__, i);
             }
     } else {
         addr = PAGE_START(addr);
         page = addr >> 9;
-        if (blk_pread(s->blk, page << BDRV_SECTOR_BITS, iobuf,
-                      BDRV_SECTOR_SIZE, 0) < 0) {
+        if (blk_pread(s->blk, page << BDRV_SECTOR_BITS,
+                      BDRV_SECTOR_SIZE, iobuf, 0) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, page);
         }
         memset(iobuf + (addr & 0x1ff), 0xff, (~addr & 0x1ff) + 1);
-        if (blk_pwrite(s->blk, page << BDRV_SECTOR_BITS, iobuf,
-                       BDRV_SECTOR_SIZE, 0) < 0) {
+        if (blk_pwrite(s->blk, page << BDRV_SECTOR_BITS,
+                       BDRV_SECTOR_SIZE, iobuf, 0) < 0) {
             printf("%s: write error in sector %" PRIu64 "\n", __func__, page);
         }
 
@@ -744,20 +744,20 @@ static void glue(nand_blk_erase_, NAND_PAGE_SIZE)(NANDFlashState *s)
         i = (addr & ~0x1ff) + 0x200;
         for (addr += ((NAND_PAGE_SIZE + OOB_SIZE) << s->erase_shift) - 0x200;
                         i < addr; i += 0x200) {
-            if (blk_pwrite(s->blk, i, iobuf, BDRV_SECTOR_SIZE, 0) < 0) {
+            if (blk_pwrite(s->blk, i, BDRV_SECTOR_SIZE, iobuf, 0) < 0) {
                 printf("%s: write error in sector %" PRIu64 "\n",
                        __func__, i >> 9);
             }
         }
 
         page = i >> 9;
-        if (blk_pread(s->blk, page << BDRV_SECTOR_BITS, iobuf,
-                      BDRV_SECTOR_SIZE, 0) < 0) {
+        if (blk_pread(s->blk, page << BDRV_SECTOR_BITS,
+                      BDRV_SECTOR_SIZE, iobuf, 0) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, page);
         }
         memset(iobuf, 0xff, ((addr - 1) & 0x1ff) + 1);
-        if (blk_pwrite(s->blk, page << BDRV_SECTOR_BITS, iobuf,
-                       BDRV_SECTOR_SIZE, 0) < 0) {
+        if (blk_pwrite(s->blk, page << BDRV_SECTOR_BITS,
+                       BDRV_SECTOR_SIZE, iobuf, 0) < 0) {
             printf("%s: write error in sector %" PRIu64 "\n", __func__, page);
         }
     }
@@ -772,8 +772,8 @@ static void glue(nand_blk_load_, NAND_PAGE_SIZE)(NANDFlashState *s,
 
     if (s->blk) {
         if (s->mem_oob) {
-            if (blk_pread(s->blk, SECTOR(addr) << BDRV_SECTOR_BITS, s->io,
-                          PAGE_SECTORS << BDRV_SECTOR_BITS, 0) < 0) {
+            if (blk_pread(s->blk, SECTOR(addr) << BDRV_SECTOR_BITS,
+                          PAGE_SECTORS << BDRV_SECTOR_BITS, s->io, 0) < 0) {
                 printf("%s: read error in sector %" PRIu64 "\n",
                                 __func__, SECTOR(addr));
             }
@@ -782,8 +782,9 @@ static void glue(nand_blk_load_, NAND_PAGE_SIZE)(NANDFlashState *s,
                             OOB_SIZE);
             s->ioaddr = s->io + SECTOR_OFFSET(s->addr) + offset;
         } else {
-            if (blk_pread(s->blk, PAGE_START(addr), s->io,
-                          (PAGE_SECTORS + 2) << BDRV_SECTOR_BITS, 0) < 0) {
+            if (blk_pread(s->blk, PAGE_START(addr),
+                          (PAGE_SECTORS + 2) << BDRV_SECTOR_BITS, s->io, 0)
+                < 0) {
                 printf("%s: read error in sector %" PRIu64 "\n",
                                 __func__, PAGE_START(addr) >> 9);
             }
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 1225ec8076..1fde975024 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -229,8 +229,8 @@ static void onenand_reset(OneNANDState *s, int cold)
         /* Lock the whole flash */
         memset(s->blockwp, ONEN_LOCK_LOCKED, s->blocks);
 
-        if (s->blk_cur && blk_pread(s->blk_cur, 0, s->boot[0],
-                                    8 << BDRV_SECTOR_BITS, 0) < 0) {
+        if (s->blk_cur && blk_pread(s->blk_cur, 0, 8 << BDRV_SECTOR_BITS,
+                                    s->boot[0], 0) < 0) {
             hw_error("%s: Loading the BootRAM failed.\n", __func__);
         }
     }
@@ -249,8 +249,8 @@ static inline int onenand_load_main(OneNANDState *s, int sec, int secn,
     assert(UINT32_MAX >> BDRV_SECTOR_BITS > sec);
     assert(UINT32_MAX >> BDRV_SECTOR_BITS > secn);
     if (s->blk_cur) {
-        return blk_pread(s->blk_cur, sec << BDRV_SECTOR_BITS, dest,
-                         secn << BDRV_SECTOR_BITS, 0) < 0;
+        return blk_pread(s->blk_cur, sec << BDRV_SECTOR_BITS,
+                         secn << BDRV_SECTOR_BITS, dest, 0) < 0;
     } else if (sec + secn > s->secs_cur) {
         return 1;
     }
@@ -274,7 +274,7 @@ static inline int onenand_prog_main(OneNANDState *s, int sec, int secn,
         uint8_t *dp = 0;
         if (s->blk_cur) {
             dp = g_malloc(size);
-            if (!dp || blk_pread(s->blk_cur, offset, dp, size, 0) < 0) {
+            if (!dp || blk_pread(s->blk_cur, offset, size, dp, 0) < 0) {
                 result = 1;
             }
         } else {
@@ -290,7 +290,7 @@ static inline int onenand_prog_main(OneNANDState *s, int sec, int secn,
                 dp[i] &= sp[i];
             }
             if (s->blk_cur) {
-                result = blk_pwrite(s->blk_cur, offset, dp, size, 0) < 0;
+                result = blk_pwrite(s->blk_cur, offset, size, dp, 0) < 0;
             }
         }
         if (dp && s->blk_cur) {
@@ -308,7 +308,7 @@ static inline int onenand_load_spare(OneNANDState *s, int sec, int secn,
 
     if (s->blk_cur) {
         uint32_t offset = (s->secs_cur + (sec >> 5)) << BDRV_SECTOR_BITS;
-        if (blk_pread(s->blk_cur, offset, buf, BDRV_SECTOR_SIZE, 0) < 0) {
+        if (blk_pread(s->blk_cur, offset, BDRV_SECTOR_SIZE, buf, 0) < 0) {
             return 1;
         }
         memcpy(dest, buf + ((sec & 31) << 4), secn << 4);
@@ -333,7 +333,7 @@ static inline int onenand_prog_spare(OneNANDState *s, int sec, int secn,
         if (s->blk_cur) {
             dp = g_malloc(512);
             if (!dp
-                || blk_pread(s->blk_cur, offset, dp, BDRV_SECTOR_SIZE, 0) < 0) {
+                || blk_pread(s->blk_cur, offset, BDRV_SECTOR_SIZE, dp, 0) < 0) {
                 result = 1;
             } else {
                 dpp = dp + ((sec & 31) << 4);
@@ -351,8 +351,8 @@ static inline int onenand_prog_spare(OneNANDState *s, int sec, int secn,
                 dpp[i] &= sp[i];
             }
             if (s->blk_cur) {
-                result = blk_pwrite(s->blk_cur, offset, dp,
-                                    BDRV_SECTOR_SIZE, 0) < 0;
+                result = blk_pwrite(s->blk_cur, offset, BDRV_SECTOR_SIZE, dp,
+                                    0) < 0;
             }
         }
         g_free(dp);
@@ -370,17 +370,17 @@ static inline int onenand_erase(OneNANDState *s, int sec, int num)
     for (; num > 0; num--, sec++) {
         if (s->blk_cur) {
             int erasesec = s->secs_cur + (sec >> 5);
-            if (blk_pwrite(s->blk_cur, sec << BDRV_SECTOR_BITS, blankbuf,
-                           BDRV_SECTOR_SIZE, 0) < 0) {
+            if (blk_pwrite(s->blk_cur, sec << BDRV_SECTOR_BITS,
+                           BDRV_SECTOR_SIZE, blankbuf, 0) < 0) {
                 goto fail;
             }
-            if (blk_pread(s->blk_cur, erasesec << BDRV_SECTOR_BITS, tmpbuf,
-                          BDRV_SECTOR_SIZE, 0) < 0) {
+            if (blk_pread(s->blk_cur, erasesec << BDRV_SECTOR_BITS,
+                          BDRV_SECTOR_SIZE, tmpbuf, 0) < 0) {
                 goto fail;
             }
             memcpy(tmpbuf + ((sec & 31) << 4), blankbuf, 1 << 4);
-            if (blk_pwrite(s->blk_cur, erasesec << BDRV_SECTOR_BITS, tmpbuf,
-                           BDRV_SECTOR_SIZE, 0) < 0) {
+            if (blk_pwrite(s->blk_cur, erasesec << BDRV_SECTOR_BITS,
+                           BDRV_SECTOR_SIZE, tmpbuf, 0) < 0) {
                 goto fail;
             }
         } else {
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 74c7190302..0cbc2fb4cb 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -392,8 +392,8 @@ static void pflash_update(PFlashCFI01 *pfl, int offset,
         /* widen to sector boundaries */
         offset = QEMU_ALIGN_DOWN(offset, BDRV_SECTOR_SIZE);
         offset_end = QEMU_ALIGN_UP(offset_end, BDRV_SECTOR_SIZE);
-        ret = blk_pwrite(pfl->blk, offset, pfl->storage + offset,
-                   offset_end - offset, 0);
+        ret = blk_pwrite(pfl->blk, offset, offset_end - offset,
+                         pfl->storage + offset, 0);
         if (ret < 0) {
             /* TODO set error bit in status */
             error_report("Could not update PFLASH: %s", strerror(-ret));
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 02c514fb6e..2a99b286b0 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -400,8 +400,8 @@ static void pflash_update(PFlashCFI02 *pfl, int offset, int size)
         /* widen to sector boundaries */
         offset = QEMU_ALIGN_DOWN(offset, BDRV_SECTOR_SIZE);
         offset_end = QEMU_ALIGN_UP(offset_end, BDRV_SECTOR_SIZE);
-        ret = blk_pwrite(pfl->blk, offset, pfl->storage + offset,
-                   offset_end - offset, 0);
+        ret = blk_pwrite(pfl->blk, offset, offset_end - offset,
+                         pfl->storage + offset, 0);
         if (ret < 0) {
             /* TODO set error bit in status */
             error_report("Could not update PFLASH: %s", strerror(-ret));
diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 7e405657df..49b648f980 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -98,11 +98,11 @@ cd_read_sector_sync(IDEState *s)
     switch (s->cd_sector_size) {
     case 2048:
         ret = blk_pread(s->blk, (int64_t)s->lba << ATAPI_SECTOR_BITS,
-                        s->io_buffer, ATAPI_SECTOR_SIZE, 0);
+                        ATAPI_SECTOR_SIZE, s->io_buffer, 0);
         break;
     case 2352:
         ret = blk_pread(s->blk, (int64_t)s->lba << ATAPI_SECTOR_BITS,
-                        s->io_buffer + 16, ATAPI_SECTOR_SIZE, 0);
+                        ATAPI_SECTOR_SIZE, s->io_buffer + 16, 0);
         if (ret >= 0) {
             cd_data_to_raw(s->io_buffer, s->lba);
         }
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 252b171e44..fba85a53d7 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -351,7 +351,7 @@ static void via1_one_second(void *opaque)
 static void pram_update(MOS6522Q800VIA1State *v1s)
 {
     if (v1s->blk) {
-        if (blk_pwrite(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM), 0) < 0) {
+        if (blk_pwrite(v1s->blk, 0, sizeof(v1s->PRAM), v1s->PRAM, 0) < 0) {
             qemu_log("pram_update: cannot write to file\n");
         }
     }
@@ -1029,7 +1029,7 @@ static void mos6522_q800_via1_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        ret = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM), 0);
+        ret = blk_pread(v1s->blk, 0, sizeof(v1s->PRAM), v1s->PRAM, 0);
         if (ret < 0) {
             error_setg(errp, "can't read PRAM contents");
             return;
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index c730bb1ae0..6d7fdb040a 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -64,8 +64,8 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
             if (s->blk) {
                 int32_t buf;
 
-                if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
-                              SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
+                if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
+                              SIFIVE_U_OTP_FUSE_WORD, &buf, 0) < 0) {
                     error_report("read error index<%d>", s->pa);
                     return 0xff;
                 }
@@ -167,8 +167,8 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
             /* write to backend */
             if (s->blk) {
                 if (blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
-                               &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD,
-                               0) < 0) {
+                               SIFIVE_U_OTP_FUSE_WORD, &s->fuse[s->pa], 0)
+                    < 0) {
                     error_report("write error index<%d>", s->pa);
                 }
             }
@@ -240,7 +240,7 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
                 return;
             }
 
-            if (blk_pread(s->blk, 0, s->fuse, filesize, 0) < 0) {
+            if (blk_pread(s->blk, 0, filesize, s->fuse, 0) < 0) {
                 error_setg(errp, "failed to read the initial flash content");
                 return;
             }
@@ -261,14 +261,14 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
 
         serial_data = s->serial;
         if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
-                       &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
+                       SIFIVE_U_OTP_FUSE_WORD, &serial_data, 0) < 0) {
             error_setg(errp, "failed to write index<%d>", index);
             return;
         }
 
         serial_data = ~(s->serial);
         if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
-                       &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
+                       SIFIVE_U_OTP_FUSE_WORD, &serial_data, 0) < 0) {
             error_setg(errp, "failed to write index<%d>", index + 1);
             return;
         }
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 8c9546ab16..bb7507060b 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -64,7 +64,7 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
     case I2C_START_RECV:
         DPRINTK("clear\n");
         if (ee->blk && ee->changed) {
-            int ret = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
+            int ret = blk_pwrite(ee->blk, 0, ee->rsize, ee->mem, 0);
             if (ret < 0) {
                 ERR(TYPE_AT24C_EE
                         " : failed to write backing file\n");
@@ -163,7 +163,7 @@ void at24c_eeprom_reset(DeviceState *state)
     memset(ee->mem, 0, ee->rsize);
 
     if (ee->blk) {
-        int ret = blk_pread(ee->blk, 0, ee->mem, ee->rsize, 0);
+        int ret = blk_pread(ee->blk, 0, ee->rsize, ee->mem, 0);
 
         if (ret < 0) {
             ERR(TYPE_AT24C_EE
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index d035067e9b..2d72f30442 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -130,7 +130,7 @@ static void rtas_nvram_store(PowerPCCPU *cpu, SpaprMachineState *spapr,
 
     ret = 0;
     if (nvram->blk) {
-        ret = blk_pwrite(nvram->blk, offset, membuf, len, 0);
+        ret = blk_pwrite(nvram->blk, offset, len, membuf, 0);
     }
 
     assert(nvram->buf);
@@ -179,7 +179,7 @@ static void spapr_nvram_realize(SpaprVioDevice *dev, Error **errp)
     }
 
     if (nvram->blk) {
-        ret = blk_pread(nvram->blk, 0, nvram->buf, nvram->size, 0);
+        ret = blk_pread(nvram->blk, 0, nvram->size, nvram->buf, 0);
 
         if (ret < 0) {
             error_setg(errp, "can't read spapr-nvram contents");
@@ -224,7 +224,7 @@ static void postload_update_cb(void *opaque, bool running, RunState state)
     qemu_del_vm_change_state_handler(nvram->vmstate);
     nvram->vmstate = NULL;
 
-    blk_pwrite(nvram->blk, 0, nvram->buf, nvram->size, 0);
+    blk_pwrite(nvram->blk, 0, nvram->size, nvram->buf, 0);
 }
 
 static int spapr_nvram_post_load(void *opaque, int version_id)
diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
index cb245b864c..c6b484cc85 100644
--- a/hw/nvram/xlnx-bbram.c
+++ b/hw/nvram/xlnx-bbram.c
@@ -124,7 +124,7 @@ static void bbram_bdrv_read(XlnxBBRam *s, Error **errp)
                     blk_name(s->blk));
     }
 
-    if (blk_pread(s->blk, 0, ram, nr, 0) < 0) {
+    if (blk_pread(s->blk, 0, nr, ram, 0) < 0) {
         error_setg(errp,
                    "%s: Failed to read %u bytes from BBRAM backstore.",
                    blk_name(s->blk), nr);
@@ -159,7 +159,7 @@ static void bbram_bdrv_sync(XlnxBBRam *s, uint64_t hwaddr)
     }
 
     offset = hwaddr - A_BBRAM_0;
-    rc = blk_pwrite(s->blk, offset, &le32, 4, 0);
+    rc = blk_pwrite(s->blk, offset, 4, &le32, 0);
     if (rc < 0) {
         bbram_bdrv_error(s, rc, g_strdup_printf("write to offset %u", offset));
     }
diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
index edaac9cf7c..fdfffaab99 100644
--- a/hw/nvram/xlnx-efuse.c
+++ b/hw/nvram/xlnx-efuse.c
@@ -77,7 +77,7 @@ static int efuse_bdrv_read(XlnxEFuse *s, Error **errp)
                     blk_name(s->blk));
     }
 
-    if (blk_pread(s->blk, 0, ram, nr, 0) < 0) {
+    if (blk_pread(s->blk, 0, nr, ram, 0) < 0) {
         error_setg(errp, "%s: Failed to read %u bytes from eFUSE backstore.",
                    blk_name(s->blk), nr);
         return -1;
@@ -105,7 +105,7 @@ static void efuse_bdrv_sync(XlnxEFuse *s, unsigned int bit)
     le32 = cpu_to_le32(xlnx_efuse_get_row(s, bit));
 
     row_offset = (bit / 32) * 4;
-    if (blk_pwrite(s->blk, row_offset, &le32, 4, 0) < 0) {
+    if (blk_pwrite(s->blk, row_offset, 4, &le32, 0) < 0) {
         error_report("%s: Failed to write offset %u of eFUSE backstore.",
                      blk_name(s->blk), row_offset);
     }
diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
index f341f5a9c9..6280408299 100644
--- a/hw/ppc/pnv_pnor.c
+++ b/hw/ppc/pnv_pnor.c
@@ -44,8 +44,8 @@ static void pnv_pnor_update(PnvPnor *s, int offset, int size)
     offset = QEMU_ALIGN_DOWN(offset, BDRV_SECTOR_SIZE);
     offset_end = QEMU_ALIGN_UP(offset_end, BDRV_SECTOR_SIZE);
 
-    ret = blk_pwrite(s->blk, offset, s->storage + offset,
-                     offset_end - offset, 0);
+    ret = blk_pwrite(s->blk, offset, offset_end - offset, s->storage + offset,
+                     0);
     if (ret < 0) {
         error_report("Could not update PNOR offset=0x%" PRIx32" : %s", offset,
                      strerror(-ret));
@@ -99,7 +99,7 @@ static void pnv_pnor_realize(DeviceState *dev, Error **errp)
 
         s->storage = blk_blockalign(s->blk, s->size);
 
-        if (blk_pread(s->blk, 0, s->storage, s->size, 0) < 0) {
+        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
             error_setg(errp, "failed to read the initial flash content");
             return;
         }
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 701170bf37..da5bdd134a 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -752,7 +752,7 @@ void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
 static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_read_block(addr, len);
-    if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len, 0) < 0) {
+    if (!sd->blk || blk_pread(sd->blk, addr, len, sd->data, 0) < 0) {
         fprintf(stderr, "sd_blk_read: read error on host side\n");
     }
 }
@@ -760,7 +760,7 @@ static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_write_block(addr, len);
-    if (!sd->blk || blk_pwrite(sd->blk, addr, sd->data, len, 0) < 0) {
+    if (!sd->blk || blk_pwrite(sd->blk, addr, len, sd->data, 0) < 0) {
         fprintf(stderr, "sd_blk_write: write error on host side\n");
     }
 }
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 288bf39be1..357534e3de 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -102,9 +102,9 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
  * the "I/O or GS" API.
  */
 
-int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes,
+int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
               BdrvRequestFlags flags);
-int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
+int blk_pwrite(BlockBackend *blk, int64_t offset, int bytes, const void *buf,
                BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
diff --git a/migration/block.c b/migration/block.c
index fa216af025..9de7d4d20b 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -569,7 +569,7 @@ static int mig_save_device_dirty(QEMUFile *f, BlkMigDevState *bmds,
                 blk_mig_unlock();
             } else {
                 ret = blk_pread(bmds->blk, sector * BDRV_SECTOR_SIZE,
-                                blk->buf, nr_sectors * BDRV_SECTOR_SIZE, 0);
+                                nr_sectors * BDRV_SECTOR_SIZE, blk->buf, 0);
                 if (ret < 0) {
                     goto error;
                 }
@@ -976,8 +976,8 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
                                                 cluster_size,
                                                 BDRV_REQ_MAY_UNMAP);
                     } else {
-                        ret = blk_pwrite(blk, cur_addr, cur_buf,
-                                         cluster_size, 0);
+                        ret = blk_pwrite(blk, cur_addr, cluster_size, cur_buf,
+                                         0);
                     }
                     if (ret < 0) {
                         break;
diff --git a/nbd/server.c b/nbd/server.c
index 849433aa3a..ada16089f3 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2039,8 +2039,8 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
             stl_be_p(&chunk.length, pnum);
             ret = nbd_co_send_iov(client, iov, 1, errp);
         } else {
-            ret = blk_pread(exp->common.blk, offset + progress,
-                            data + progress, pnum, 0);
+            ret = blk_pread(exp->common.blk, offset + progress, pnum,
+                            data + progress, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret, "reading from file failed");
                 break;
@@ -2444,7 +2444,7 @@ static coroutine_fn int nbd_do_cmd_read(NBDClient *client, NBDRequest *request,
                                        data, request->len, errp);
     }
 
-    ret = blk_pread(exp->common.blk, request->from, data, request->len, 0);
+    ret = blk_pread(exp->common.blk, request->from, request->len, data, 0);
     if (ret < 0) {
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "reading from file failed", errp);
@@ -2511,7 +2511,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         if (request->flags & NBD_CMD_FLAG_FUA) {
             flags |= BDRV_REQ_FUA;
         }
-        ret = blk_pwrite(exp->common.blk, request->from, data, request->len,
+        ret = blk_pwrite(exp->common.blk, request->from, request->len, data,
                          flags);
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "writing to file failed", errp);
diff --git a/qemu-img.c b/qemu-img.c
index a0c0e8914e..df607a2a2e 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1309,7 +1309,7 @@ static int check_empty_sectors(BlockBackend *blk, int64_t offset,
     int ret = 0;
     int64_t idx;
 
-    ret = blk_pread(blk, offset, buffer, bytes, 0);
+    ret = blk_pread(blk, offset, bytes, buffer, 0);
     if (ret < 0) {
         error_report("Error while reading offset %" PRId64 " of %s: %s",
                      offset, filename, strerror(-ret));
@@ -1526,7 +1526,7 @@ static int img_compare(int argc, char **argv)
                 int64_t pnum;
 
                 chunk = MIN(chunk, IO_BUF_SIZE);
-                ret = blk_pread(blk1, offset, buf1, chunk, 0);
+                ret = blk_pread(blk1, offset, chunk, buf1, 0);
                 if (ret < 0) {
                     error_report("Error while reading offset %" PRId64
                                  " of %s: %s",
@@ -1534,7 +1534,7 @@ static int img_compare(int argc, char **argv)
                     ret = 4;
                     goto out;
                 }
-                ret = blk_pread(blk2, offset, buf2, chunk, 0);
+                ret = blk_pread(blk2, offset, chunk, buf2, 0);
                 if (ret < 0) {
                     error_report("Error while reading offset %" PRId64
                                  " of %s: %s",
@@ -3779,7 +3779,7 @@ static int img_rebase(int argc, char **argv)
                     n = old_backing_size - offset;
                 }
 
-                ret = blk_pread(blk_old_backing, offset, buf_old, n, 0);
+                ret = blk_pread(blk_old_backing, offset, n, buf_old, 0);
                 if (ret < 0) {
                     error_report("error while reading from old backing file");
                     goto out;
@@ -3793,7 +3793,7 @@ static int img_rebase(int argc, char **argv)
                     n = new_backing_size - offset;
                 }
 
-                ret = blk_pread(blk_new_backing, offset, buf_new, n, 0);
+                ret = blk_pread(blk_new_backing, offset, n, buf_new, 0);
                 if (ret < 0) {
                     error_report("error while reading from new backing file");
                     goto out;
@@ -3812,8 +3812,8 @@ static int img_rebase(int argc, char **argv)
                     if (buf_old_is_zero) {
                         ret = blk_pwrite_zeroes(blk, offset + written, pnum, 0);
                     } else {
-                        ret = blk_pwrite(blk, offset + written,
-                                         buf_old + written, pnum, 0);
+                        ret = blk_pwrite(blk, offset + written, pnum,
+                                         buf_old + written, 0);
                     }
                     if (ret < 0) {
                         error_report("Error while writing to COW image: %s",
@@ -5122,7 +5122,7 @@ static int img_dd(int argc, char **argv)
     for (out_pos = 0; in_pos < size; block_count++) {
         int bytes = (in_pos + in.bsz > size) ? size - in_pos : in.bsz;
 
-        ret = blk_pread(blk1, in_pos, in.buf, bytes, 0);
+        ret = blk_pread(blk1, in_pos, bytes, in.buf, 0);
         if (ret < 0) {
             error_report("error while reading from input image file: %s",
                          strerror(-ret));
@@ -5130,7 +5130,7 @@ static int img_dd(int argc, char **argv)
         }
         in_pos += bytes;
 
-        ret = blk_pwrite(blk2, out_pos, in.buf, bytes, 0);
+        ret = blk_pwrite(blk2, out_pos, bytes, in.buf, 0);
         if (ret < 0) {
             error_report("error while writing to output image file: %s",
                          strerror(-ret));
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 582e1a7090..c8cbaed0cd 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -547,7 +547,7 @@ static int do_pread(BlockBackend *blk, char *buf, int64_t offset,
         return -ERANGE;
     }
 
-    ret = blk_pread(blk, offset, (uint8_t *)buf, bytes, 0);
+    ret = blk_pread(blk, offset, bytes, (uint8_t *)buf, 0);
     if (ret < 0) {
         return ret;
     }
@@ -564,7 +564,7 @@ static int do_pwrite(BlockBackend *blk, char *buf, int64_t offset,
         return -ERANGE;
     }
 
-    ret = blk_pwrite(blk, offset, (uint8_t *)buf, bytes, flags);
+    ret = blk_pwrite(blk, offset, bytes, (uint8_t *)buf, flags);
     if (ret < 0) {
         return ret;
     }
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index bfd12c9c15..0ced5333ff 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -116,11 +116,11 @@ static void test_sync_op_blk_pread(BlockBackend *blk)
     int ret;
 
     /* Success */
-    ret = blk_pread(blk, 0, buf, sizeof(buf), 0);
+    ret = blk_pread(blk, 0, sizeof(buf), buf, 0);
     g_assert_cmpint(ret, ==, 0);
 
     /* Early error: Negative offset */
-    ret = blk_pread(blk, -2, buf, sizeof(buf), 0);
+    ret = blk_pread(blk, -2, sizeof(buf), buf, 0);
     g_assert_cmpint(ret, ==, -EIO);
 }
 
@@ -130,11 +130,11 @@ static void test_sync_op_blk_pwrite(BlockBackend *blk)
     int ret;
 
     /* Success */
-    ret = blk_pwrite(blk, 0, buf, sizeof(buf), 0);
+    ret = blk_pwrite(blk, 0, sizeof(buf), buf, 0);
     g_assert_cmpint(ret, ==, 0);
 
     /* Early error: Negative offset */
-    ret = blk_pwrite(blk, -2, buf, sizeof(buf), 0);
+    ret = blk_pwrite(blk, -2, sizeof(buf), buf, 0);
     g_assert_cmpint(ret, ==, -EIO);
 }
 
-- 
2.36.1


