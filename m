Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lDN-00030e-KJ
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDK-0002xx-RK
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lDH-0005en-IC
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3iiwX4Zb2vPEjyqXjWU9F/LncU1CSVkWi4099Dtqlpg=;
 b=ZeogUmLqX1qORZKDJc1nqjTs4g+tts7a6pkzjo8cIblv3SpMioN2Cv/WBPhNJXKIXQlpIB
 W3PSaJW2B36WZeTTKqy/mNJfpVx4WeBSS7rBTqmzqNG7W6h5x2BkRAQoeSYu6f/7cnR1ea
 hcd8Dmdh5xlzZVLksJHxo5u81WCdCGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-dwMQ7LhXN2aPKo70CQIF7A-1; Tue, 05 Jul 2022 12:15:43 -0400
X-MC-Unique: dwMQ7LhXN2aPKo70CQIF7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6C65811E9B;
 Tue,  5 Jul 2022 16:15:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2CB4140EBE4;
 Tue,  5 Jul 2022 16:15:35 +0000 (UTC)
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
Subject: [PATCH v2 00/18] Make block-backend-io.h API more consistent
Date: Tue,  5 Jul 2022 17:15:08 +0100
Message-Id: <20220705161527.1054072-1-afaria@redhat.com>
Content-Type: text/plain; charset="utf-8"
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
X-List-Received-Date: Tue, 05 Jul 2022 16:15:52 -0000

Adjust existing pairs of non-coroutine and coroutine functions to share
the same calling convention, and add non-coroutine/coroutine
counterparts where they don't exist.

Also make the non-coroutine versions generated_co_wrappers.

This series sits on top of "[PATCH v5 00/10] Implement
bdrv_{pread,pwrite,pwrite_sync,pwrite_zeroes}() using
generated_co_wrapper":

    https://lore.kernel.org/qemu-devel/20220609152744.3891847-1-afaria@redhat.com/

Based-on: <20220609152744.3891847-1-afaria@redhat.com>

v2:
  - Avoid using variables named 'len' or similar to hold return values
    from blk_{pread,pwrite}(), as they don't return a length anymore.
  - Drop variables in_ret and out_ret in qemu-img.c:img_dd().
  - Initialize buf in test_sync_op_blk_pwritev_part().
  - Keep blk_co_copy_range() in the "I/O API functions" section of
    include/sysemu/block-backend-io.h.

Alberto Faria (18):
  block: Make blk_{pread,pwrite}() return 0 on success
  block: Add a 'flags' param to blk_pread()
  block: Change blk_{pread,pwrite}() param order
  block: Make 'bytes' param of blk_{pread,pwrite}() an int64_t
  block: Make blk_co_pwrite() take a const buffer
  block: Implement blk_{pread,pwrite}() using generated_co_wrapper
  block: Add blk_{preadv,pwritev}()
  block: Add blk_[co_]preadv_part()
  block: Export blk_pwritev_part() in block-backend-io.h
  block: Change blk_pwrite_compressed() param order
  block: Add blk_co_pwrite_compressed()
  block: Implement blk_pwrite_zeroes() using generated_co_wrapper
  block: Implement blk_pdiscard() using generated_co_wrapper
  block: Implement blk_flush() using generated_co_wrapper
  block: Add blk_co_ioctl()
  block: Add blk_co_truncate()
  block: Reorganize some declarations in block-backend-io.h
  block: Remove remaining unused symbols in coroutines.h

 block.c                           |  10 +-
 block/block-backend.c             | 150 ++++++++++++------------------
 block/commit.c                    |   4 +-
 block/coroutines.h                |  44 ---------
 block/crypto.c                    |   2 +-
 block/export/fuse.c               |   4 +-
 block/meson.build                 |   1 +
 block/parallels.c                 |   2 +-
 block/qcow.c                      |  14 +--
 block/qcow2.c                     |   4 +-
 block/qed.c                       |   8 +-
 block/vdi.c                       |   4 +-
 block/vhdx.c                      |  20 ++--
 block/vmdk.c                      |  10 +-
 block/vpc.c                       |  12 +--
 hw/arm/allwinner-h3.c             |   2 +-
 hw/arm/aspeed.c                   |   2 +-
 hw/block/block.c                  |   2 +-
 hw/block/fdc.c                    |  20 ++--
 hw/block/hd-geometry.c            |   2 +-
 hw/block/m25p80.c                 |   2 +-
 hw/block/nand.c                   |  47 +++++-----
 hw/block/onenand.c                |  32 +++----
 hw/block/pflash_cfi01.c           |   4 +-
 hw/block/pflash_cfi02.c           |   4 +-
 hw/ide/atapi.c                    |   4 +-
 hw/misc/mac_via.c                 |   6 +-
 hw/misc/sifive_u_otp.c            |  14 +--
 hw/nvram/eeprom_at24c.c           |   8 +-
 hw/nvram/spapr_nvram.c            |  16 ++--
 hw/nvram/xlnx-bbram.c             |   4 +-
 hw/nvram/xlnx-efuse.c             |   4 +-
 hw/ppc/pnv_pnor.c                 |   6 +-
 hw/sd/sd.c                        |   4 +-
 include/sysemu/block-backend-io.h |  97 +++++++++++--------
 migration/block.c                 |   8 +-
 nbd/server.c                      |   8 +-
 qemu-img.c                        |  41 ++++----
 qemu-io-cmds.c                    |  20 ++--
 tests/unit/test-block-iothread.c  | 141 ++++++++++++++++++++++++++--
 40 files changed, 431 insertions(+), 356 deletions(-)

-- 
2.36.1


