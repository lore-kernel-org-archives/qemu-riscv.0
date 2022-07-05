Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lDa-0003Mk-SW
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDV-0003GO-CR
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDS-0005gu-3a
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/cK9LaepXf4Wv9zVWJDPVMrPykUnL0yrIT6FPPRyIAs=;
 b=Etk9AnO2+7QFFSOVlfLupDsx3t6AmaW5fnE9KuDT0vq1b2XczI68Vt5gbH8evMSlsczvzU
 bSgrwiGfcOanmzNLI+FDnBOjNOYOWC24JzAVH2vF3BYTNRwMZOcT0PL1ZeCADkpb7iLOBl
 5wqJhbVzXC+sGIUQ92EHFhcVyz0vrNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-XZtWUhf3O220c2766e7PUA-1; Tue, 05 Jul 2022 12:15:56 -0400
X-MC-Unique: XZtWUhf3O220c2766e7PUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B686318F0242;
 Tue,  5 Jul 2022 16:15:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EB9C1415115;
 Tue,  5 Jul 2022 16:15:47 +0000 (UTC)
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
Subject: [PATCH v2 02/18] block: Add a 'flags' param to blk_pread()
Date: Tue,  5 Jul 2022 17:15:10 +0100
Message-Id: <20220705161527.1054072-3-afaria@redhat.com>
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
X-List-Received-Date: Tue, 05 Jul 2022 16:16:05 -0000

For consistency with other I/O functions, and in preparation to
implement it using generated_co_wrapper.

Callers were updated using this Coccinelle script:

    @@ expression blk, offset, buf, bytes; @@
    - blk_pread(blk, offset, buf, bytes)
    + blk_pread(blk, offset, buf, bytes, 0)

It had no effect on hw/block/nand.c, presumably due to the #if, so that
file was updated manually.

Overly-long lines were then fixed by hand.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c                           |  2 +-
 block/block-backend.c             |  5 +++--
 block/commit.c                    |  2 +-
 block/export/fuse.c               |  2 +-
 hw/arm/allwinner-h3.c             |  2 +-
 hw/arm/aspeed.c                   |  2 +-
 hw/block/block.c                  |  2 +-
 hw/block/fdc.c                    |  6 +++---
 hw/block/hd-geometry.c            |  2 +-
 hw/block/m25p80.c                 |  2 +-
 hw/block/nand.c                   | 12 ++++++------
 hw/block/onenand.c                | 12 ++++++------
 hw/ide/atapi.c                    |  4 ++--
 hw/misc/mac_via.c                 |  2 +-
 hw/misc/sifive_u_otp.c            |  4 ++--
 hw/nvram/eeprom_at24c.c           |  2 +-
 hw/nvram/spapr_nvram.c            |  2 +-
 hw/nvram/xlnx-bbram.c             |  2 +-
 hw/nvram/xlnx-efuse.c             |  2 +-
 hw/ppc/pnv_pnor.c                 |  2 +-
 hw/sd/sd.c                        |  2 +-
 include/sysemu/block-backend-io.h |  3 ++-
 migration/block.c                 |  4 ++--
 nbd/server.c                      |  4 ++--
 qemu-img.c                        | 12 ++++++------
 qemu-io-cmds.c                    |  2 +-
 tests/unit/test-block-iothread.c  |  4 ++--
 27 files changed, 52 insertions(+), 50 deletions(-)

diff --git a/block.c b/block.c
index 0fd830e2e2..ed701b4889 100644
--- a/block.c
+++ b/block.c
@@ -1037,7 +1037,7 @@ static int find_image_format(BlockBackend *file, const char *filename,
         return ret;
     }
 
-    ret = blk_pread(file, 0, buf, sizeof(buf));
+    ret = blk_pread(file, 0, buf, sizeof(buf), 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not read image for determining its "
                          "format");
diff --git a/block/block-backend.c b/block/block-backend.c
index c1c367bf9e..da89450861 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1567,14 +1567,15 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes)
+int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes,
+              BdrvRequestFlags flags)
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
 
     blk_inc_in_flight(blk);
-    ret = blk_do_preadv(blk, offset, bytes, &qiov, 0);
+    ret = blk_do_preadv(blk, offset, bytes, &qiov, flags);
     blk_dec_in_flight(blk);
 
     return ret;
diff --git a/block/commit.c b/block/commit.c
index 851d1c557a..e5b3ad08da 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -527,7 +527,7 @@ int bdrv_commit(BlockDriverState *bs)
             goto ro_cleanup;
         }
         if (ret) {
-            ret = blk_pread(src, offset, buf, n);
+            ret = blk_pread(src, offset, buf, n, 0);
             if (ret < 0) {
                 goto ro_cleanup;
             }
diff --git a/block/export/fuse.c b/block/export/fuse.c
index e80b24a867..dcf8f225f3 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -554,7 +554,7 @@ static void fuse_read(fuse_req_t req, fuse_ino_t inode,
         return;
     }
 
-    ret = blk_pread(exp->common.blk, offset, buf, size);
+    ret = blk_pread(exp->common.blk, offset, buf, size, 0);
     if (ret >= 0) {
         fuse_reply_buf(req, buf, size);
     } else {
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 318ed4348c..788083b6fa 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -174,7 +174,7 @@ void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk)
     const int64_t rom_size = 32 * KiB;
     g_autofree uint8_t *buffer = g_new0(uint8_t, rom_size);
 
-    if (blk_pread(blk, 8 * KiB, buffer, rom_size) < 0) {
+    if (blk_pread(blk, 8 * KiB, buffer, rom_size, 0) < 0) {
         error_setg(&error_fatal, "%s: failed to read BlockBackend data",
                    __func__);
         return;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 98dc185acd..c11ede6c4d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -270,7 +270,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     }
 
     storage = g_malloc0(rom_size);
-    if (blk_pread(blk, 0, storage, rom_size) < 0) {
+    if (blk_pread(blk, 0, storage, rom_size, 0) < 0) {
         error_setg(errp, "failed to read the initial flash content");
         return;
     }
diff --git a/hw/block/block.c b/hw/block/block.c
index 25f45df723..effb89910c 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -53,7 +53,7 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
      * block device and read only on demand.
      */
     assert(size <= BDRV_REQUEST_MAX_BYTES);
-    ret = blk_pread(blk, 0, buf, size);
+    ret = blk_pread(blk, 0, buf, size, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "can't read block backend");
         return false;
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 57bb355794..52f278ed82 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1628,8 +1628,8 @@ int fdctrl_transfer_handler(void *opaque, int nchan, int dma_pos, int dma_len)
         if (fdctrl->data_dir != FD_DIR_WRITE ||
             len < FD_SECTOR_LEN || rel_pos != 0) {
             /* READ & SCAN commands and realign to a sector for WRITE */
-            if (blk_pread(cur_drv->blk, fd_offset(cur_drv),
-                          fdctrl->fifo, BDRV_SECTOR_SIZE) < 0) {
+            if (blk_pread(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
+                          BDRV_SECTOR_SIZE, 0) < 0) {
                 FLOPPY_DPRINTF("Floppy: error getting sector %d\n",
                                fd_sector(cur_drv));
                 /* Sure, image size is too small... */
@@ -1741,7 +1741,7 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
                     return 0;
                 }
             if (blk_pread(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
-                          BDRV_SECTOR_SIZE)
+                          BDRV_SECTOR_SIZE, 0)
                 < 0) {
                 FLOPPY_DPRINTF("error getting sector %d\n",
                                fd_sector(cur_drv));
diff --git a/hw/block/hd-geometry.c b/hw/block/hd-geometry.c
index dcbccee294..24933eae82 100644
--- a/hw/block/hd-geometry.c
+++ b/hw/block/hd-geometry.c
@@ -63,7 +63,7 @@ static int guess_disk_lchs(BlockBackend *blk,
 
     blk_get_geometry(blk, &nb_sectors);
 
-    if (blk_pread(blk, 0, buf, BDRV_SECTOR_SIZE) < 0) {
+    if (blk_pread(blk, 0, buf, BDRV_SECTOR_SIZE, 0) < 0) {
         return -1;
     }
     /* test msdos magic */
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index db081d9912..b71f8fb156 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1506,7 +1506,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         trace_m25p80_binding(s);
         s->storage = blk_blockalign(s->blk, s->size);
 
-        if (blk_pread(s->blk, 0, s->storage, s->size) < 0) {
+        if (blk_pread(s->blk, 0, s->storage, s->size, 0) < 0) {
             error_setg(errp, "failed to read the initial flash content");
             return;
         }
diff --git a/hw/block/nand.c b/hw/block/nand.c
index 8bc80e3514..ea3d33adf4 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -667,7 +667,7 @@ static void glue(nand_blk_write_, NAND_PAGE_SIZE)(NANDFlashState *s)
         off = (s->addr & PAGE_MASK) + s->offset;
         soff = SECTOR_OFFSET(s->addr);
         if (blk_pread(s->blk, sector << BDRV_SECTOR_BITS, iobuf,
-                      PAGE_SECTORS << BDRV_SECTOR_BITS) < 0) {
+                      PAGE_SECTORS << BDRV_SECTOR_BITS, 0) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, sector);
             return;
         }
@@ -688,7 +688,7 @@ static void glue(nand_blk_write_, NAND_PAGE_SIZE)(NANDFlashState *s)
         sector = off >> 9;
         soff = off & 0x1ff;
         if (blk_pread(s->blk, sector << BDRV_SECTOR_BITS, iobuf,
-                      (PAGE_SECTORS + 2) << BDRV_SECTOR_BITS) < 0) {
+                      (PAGE_SECTORS + 2) << BDRV_SECTOR_BITS, 0) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, sector);
             return;
         }
@@ -731,7 +731,7 @@ static void glue(nand_blk_erase_, NAND_PAGE_SIZE)(NANDFlashState *s)
         addr = PAGE_START(addr);
         page = addr >> 9;
         if (blk_pread(s->blk, page << BDRV_SECTOR_BITS, iobuf,
-                      BDRV_SECTOR_SIZE) < 0) {
+                      BDRV_SECTOR_SIZE, 0) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, page);
         }
         memset(iobuf + (addr & 0x1ff), 0xff, (~addr & 0x1ff) + 1);
@@ -752,7 +752,7 @@ static void glue(nand_blk_erase_, NAND_PAGE_SIZE)(NANDFlashState *s)
 
         page = i >> 9;
         if (blk_pread(s->blk, page << BDRV_SECTOR_BITS, iobuf,
-                      BDRV_SECTOR_SIZE) < 0) {
+                      BDRV_SECTOR_SIZE, 0) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, page);
         }
         memset(iobuf, 0xff, ((addr - 1) & 0x1ff) + 1);
@@ -773,7 +773,7 @@ static void glue(nand_blk_load_, NAND_PAGE_SIZE)(NANDFlashState *s,
     if (s->blk) {
         if (s->mem_oob) {
             if (blk_pread(s->blk, SECTOR(addr) << BDRV_SECTOR_BITS, s->io,
-                          PAGE_SECTORS << BDRV_SECTOR_BITS) < 0) {
+                          PAGE_SECTORS << BDRV_SECTOR_BITS, 0) < 0) {
                 printf("%s: read error in sector %" PRIu64 "\n",
                                 __func__, SECTOR(addr));
             }
@@ -783,7 +783,7 @@ static void glue(nand_blk_load_, NAND_PAGE_SIZE)(NANDFlashState *s,
             s->ioaddr = s->io + SECTOR_OFFSET(s->addr) + offset;
         } else {
             if (blk_pread(s->blk, PAGE_START(addr), s->io,
-                          (PAGE_SECTORS + 2) << BDRV_SECTOR_BITS) < 0) {
+                          (PAGE_SECTORS + 2) << BDRV_SECTOR_BITS, 0) < 0) {
                 printf("%s: read error in sector %" PRIu64 "\n",
                                 __func__, PAGE_START(addr) >> 9);
             }
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index afc0cd3a0f..1225ec8076 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -230,7 +230,7 @@ static void onenand_reset(OneNANDState *s, int cold)
         memset(s->blockwp, ONEN_LOCK_LOCKED, s->blocks);
 
         if (s->blk_cur && blk_pread(s->blk_cur, 0, s->boot[0],
-                                    8 << BDRV_SECTOR_BITS) < 0) {
+                                    8 << BDRV_SECTOR_BITS, 0) < 0) {
             hw_error("%s: Loading the BootRAM failed.\n", __func__);
         }
     }
@@ -250,7 +250,7 @@ static inline int onenand_load_main(OneNANDState *s, int sec, int secn,
     assert(UINT32_MAX >> BDRV_SECTOR_BITS > secn);
     if (s->blk_cur) {
         return blk_pread(s->blk_cur, sec << BDRV_SECTOR_BITS, dest,
-                         secn << BDRV_SECTOR_BITS) < 0;
+                         secn << BDRV_SECTOR_BITS, 0) < 0;
     } else if (sec + secn > s->secs_cur) {
         return 1;
     }
@@ -274,7 +274,7 @@ static inline int onenand_prog_main(OneNANDState *s, int sec, int secn,
         uint8_t *dp = 0;
         if (s->blk_cur) {
             dp = g_malloc(size);
-            if (!dp || blk_pread(s->blk_cur, offset, dp, size) < 0) {
+            if (!dp || blk_pread(s->blk_cur, offset, dp, size, 0) < 0) {
                 result = 1;
             }
         } else {
@@ -308,7 +308,7 @@ static inline int onenand_load_spare(OneNANDState *s, int sec, int secn,
 
     if (s->blk_cur) {
         uint32_t offset = (s->secs_cur + (sec >> 5)) << BDRV_SECTOR_BITS;
-        if (blk_pread(s->blk_cur, offset, buf, BDRV_SECTOR_SIZE) < 0) {
+        if (blk_pread(s->blk_cur, offset, buf, BDRV_SECTOR_SIZE, 0) < 0) {
             return 1;
         }
         memcpy(dest, buf + ((sec & 31) << 4), secn << 4);
@@ -333,7 +333,7 @@ static inline int onenand_prog_spare(OneNANDState *s, int sec, int secn,
         if (s->blk_cur) {
             dp = g_malloc(512);
             if (!dp
-                || blk_pread(s->blk_cur, offset, dp, BDRV_SECTOR_SIZE) < 0) {
+                || blk_pread(s->blk_cur, offset, dp, BDRV_SECTOR_SIZE, 0) < 0) {
                 result = 1;
             } else {
                 dpp = dp + ((sec & 31) << 4);
@@ -375,7 +375,7 @@ static inline int onenand_erase(OneNANDState *s, int sec, int num)
                 goto fail;
             }
             if (blk_pread(s->blk_cur, erasesec << BDRV_SECTOR_BITS, tmpbuf,
-                          BDRV_SECTOR_SIZE) < 0) {
+                          BDRV_SECTOR_SIZE, 0) < 0) {
                 goto fail;
             }
             memcpy(tmpbuf + ((sec & 31) << 4), blankbuf, 1 << 4);
diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index b626199e3d..7e405657df 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -98,11 +98,11 @@ cd_read_sector_sync(IDEState *s)
     switch (s->cd_sector_size) {
     case 2048:
         ret = blk_pread(s->blk, (int64_t)s->lba << ATAPI_SECTOR_BITS,
-                        s->io_buffer, ATAPI_SECTOR_SIZE);
+                        s->io_buffer, ATAPI_SECTOR_SIZE, 0);
         break;
     case 2352:
         ret = blk_pread(s->blk, (int64_t)s->lba << ATAPI_SECTOR_BITS,
-                        s->io_buffer + 16, ATAPI_SECTOR_SIZE);
+                        s->io_buffer + 16, ATAPI_SECTOR_SIZE, 0);
         if (ret >= 0) {
             cd_data_to_raw(s->io_buffer, s->lba);
         }
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index c32325dcaf..252b171e44 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1029,7 +1029,7 @@ static void mos6522_q800_via1_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        ret = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM));
+        ret = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM), 0);
         if (ret < 0) {
             error_setg(errp, "can't read PRAM contents");
             return;
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 535acde08b..c730bb1ae0 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -65,7 +65,7 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
                 int32_t buf;
 
                 if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
-                              SIFIVE_U_OTP_FUSE_WORD) < 0) {
+                              SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
                     error_report("read error index<%d>", s->pa);
                     return 0xff;
                 }
@@ -240,7 +240,7 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
                 return;
             }
 
-            if (blk_pread(s->blk, 0, s->fuse, filesize) < 0) {
+            if (blk_pread(s->blk, 0, s->fuse, filesize, 0) < 0) {
                 error_setg(errp, "failed to read the initial flash content");
                 return;
             }
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index c434eea1e7..8c9546ab16 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -163,7 +163,7 @@ void at24c_eeprom_reset(DeviceState *state)
     memset(ee->mem, 0, ee->rsize);
 
     if (ee->blk) {
-        int ret = blk_pread(ee->blk, 0, ee->mem, ee->rsize);
+        int ret = blk_pread(ee->blk, 0, ee->mem, ee->rsize, 0);
 
         if (ret < 0) {
             ERR(TYPE_AT24C_EE
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index 59d2e7b705..d035067e9b 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -179,7 +179,7 @@ static void spapr_nvram_realize(SpaprVioDevice *dev, Error **errp)
     }
 
     if (nvram->blk) {
-        ret = blk_pread(nvram->blk, 0, nvram->buf, nvram->size);
+        ret = blk_pread(nvram->blk, 0, nvram->buf, nvram->size, 0);
 
         if (ret < 0) {
             error_setg(errp, "can't read spapr-nvram contents");
diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
index 6ed32adad9..cb245b864c 100644
--- a/hw/nvram/xlnx-bbram.c
+++ b/hw/nvram/xlnx-bbram.c
@@ -124,7 +124,7 @@ static void bbram_bdrv_read(XlnxBBRam *s, Error **errp)
                     blk_name(s->blk));
     }
 
-    if (blk_pread(s->blk, 0, ram, nr) < 0) {
+    if (blk_pread(s->blk, 0, ram, nr, 0) < 0) {
         error_setg(errp,
                    "%s: Failed to read %u bytes from BBRAM backstore.",
                    blk_name(s->blk), nr);
diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
index a0fd77b586..edaac9cf7c 100644
--- a/hw/nvram/xlnx-efuse.c
+++ b/hw/nvram/xlnx-efuse.c
@@ -77,7 +77,7 @@ static int efuse_bdrv_read(XlnxEFuse *s, Error **errp)
                     blk_name(s->blk));
     }
 
-    if (blk_pread(s->blk, 0, ram, nr) < 0) {
+    if (blk_pread(s->blk, 0, ram, nr, 0) < 0) {
         error_setg(errp, "%s: Failed to read %u bytes from eFUSE backstore.",
                    blk_name(s->blk), nr);
         return -1;
diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
index 1fb748afef..f341f5a9c9 100644
--- a/hw/ppc/pnv_pnor.c
+++ b/hw/ppc/pnv_pnor.c
@@ -99,7 +99,7 @@ static void pnv_pnor_realize(DeviceState *dev, Error **errp)
 
         s->storage = blk_blockalign(s->blk, s->size);
 
-        if (blk_pread(s->blk, 0, s->storage, s->size) < 0) {
+        if (blk_pread(s->blk, 0, s->storage, s->size, 0) < 0) {
             error_setg(errp, "failed to read the initial flash content");
             return;
         }
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8e6fa09151..701170bf37 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -752,7 +752,7 @@ void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
 static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_read_block(addr, len);
-    if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len) < 0) {
+    if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len, 0) < 0) {
         fprintf(stderr, "sd_blk_read: read error on host side\n");
     }
 }
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6517c39295..288bf39be1 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -102,7 +102,8 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
  * the "I/O or GS" API.
  */
 
-int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes);
+int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes,
+              BdrvRequestFlags flags);
 int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
                BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
diff --git a/migration/block.c b/migration/block.c
index 077a413325..fa216af025 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -568,8 +568,8 @@ static int mig_save_device_dirty(QEMUFile *f, BlkMigDevState *bmds,
                 bmds_set_aio_inflight(bmds, sector, nr_sectors, 1);
                 blk_mig_unlock();
             } else {
-                ret = blk_pread(bmds->blk, sector * BDRV_SECTOR_SIZE, blk->buf,
-                                nr_sectors * BDRV_SECTOR_SIZE);
+                ret = blk_pread(bmds->blk, sector * BDRV_SECTOR_SIZE,
+                                blk->buf, nr_sectors * BDRV_SECTOR_SIZE, 0);
                 if (ret < 0) {
                     goto error;
                 }
diff --git a/nbd/server.c b/nbd/server.c
index 213e00e761..849433aa3a 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2040,7 +2040,7 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
             ret = nbd_co_send_iov(client, iov, 1, errp);
         } else {
             ret = blk_pread(exp->common.blk, offset + progress,
-                            data + progress, pnum);
+                            data + progress, pnum, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret, "reading from file failed");
                 break;
@@ -2444,7 +2444,7 @@ static coroutine_fn int nbd_do_cmd_read(NBDClient *client, NBDRequest *request,
                                        data, request->len, errp);
     }
 
-    ret = blk_pread(exp->common.blk, request->from, data, request->len);
+    ret = blk_pread(exp->common.blk, request->from, data, request->len, 0);
     if (ret < 0) {
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "reading from file failed", errp);
diff --git a/qemu-img.c b/qemu-img.c
index 2dc07e5ac3..a0c0e8914e 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1309,7 +1309,7 @@ static int check_empty_sectors(BlockBackend *blk, int64_t offset,
     int ret = 0;
     int64_t idx;
 
-    ret = blk_pread(blk, offset, buffer, bytes);
+    ret = blk_pread(blk, offset, buffer, bytes, 0);
     if (ret < 0) {
         error_report("Error while reading offset %" PRId64 " of %s: %s",
                      offset, filename, strerror(-ret));
@@ -1526,7 +1526,7 @@ static int img_compare(int argc, char **argv)
                 int64_t pnum;
 
                 chunk = MIN(chunk, IO_BUF_SIZE);
-                ret = blk_pread(blk1, offset, buf1, chunk);
+                ret = blk_pread(blk1, offset, buf1, chunk, 0);
                 if (ret < 0) {
                     error_report("Error while reading offset %" PRId64
                                  " of %s: %s",
@@ -1534,7 +1534,7 @@ static int img_compare(int argc, char **argv)
                     ret = 4;
                     goto out;
                 }
-                ret = blk_pread(blk2, offset, buf2, chunk);
+                ret = blk_pread(blk2, offset, buf2, chunk, 0);
                 if (ret < 0) {
                     error_report("Error while reading offset %" PRId64
                                  " of %s: %s",
@@ -3779,7 +3779,7 @@ static int img_rebase(int argc, char **argv)
                     n = old_backing_size - offset;
                 }
 
-                ret = blk_pread(blk_old_backing, offset, buf_old, n);
+                ret = blk_pread(blk_old_backing, offset, buf_old, n, 0);
                 if (ret < 0) {
                     error_report("error while reading from old backing file");
                     goto out;
@@ -3793,7 +3793,7 @@ static int img_rebase(int argc, char **argv)
                     n = new_backing_size - offset;
                 }
 
-                ret = blk_pread(blk_new_backing, offset, buf_new, n);
+                ret = blk_pread(blk_new_backing, offset, buf_new, n, 0);
                 if (ret < 0) {
                     error_report("error while reading from new backing file");
                     goto out;
@@ -5122,7 +5122,7 @@ static int img_dd(int argc, char **argv)
     for (out_pos = 0; in_pos < size; block_count++) {
         int bytes = (in_pos + in.bsz > size) ? size - in_pos : in.bsz;
 
-        ret = blk_pread(blk1, in_pos, in.buf, bytes);
+        ret = blk_pread(blk1, in_pos, in.buf, bytes, 0);
         if (ret < 0) {
             error_report("error while reading from input image file: %s",
                          strerror(-ret));
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 443f22c732..582e1a7090 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -547,7 +547,7 @@ static int do_pread(BlockBackend *blk, char *buf, int64_t offset,
         return -ERANGE;
     }
 
-    ret = blk_pread(blk, offset, (uint8_t *)buf, bytes);
+    ret = blk_pread(blk, offset, (uint8_t *)buf, bytes, 0);
     if (ret < 0) {
         return ret;
     }
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 3c1a3f64a2..bfd12c9c15 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -116,11 +116,11 @@ static void test_sync_op_blk_pread(BlockBackend *blk)
     int ret;
 
     /* Success */
-    ret = blk_pread(blk, 0, buf, sizeof(buf));
+    ret = blk_pread(blk, 0, buf, sizeof(buf), 0);
     g_assert_cmpint(ret, ==, 0);
 
     /* Early error: Negative offset */
-    ret = blk_pread(blk, -2, buf, sizeof(buf));
+    ret = blk_pread(blk, -2, buf, sizeof(buf), 0);
     g_assert_cmpint(ret, ==, -EIO);
 }
 
-- 
2.36.1


