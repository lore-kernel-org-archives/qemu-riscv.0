Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqxL7-0007c3-WA
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 09:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvUE-0007F6-8p
 for qemu-riscv@nongnu.org; Tue, 17 May 2022 07:35:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvUB-0002bv-Rc
 for qemu-riscv@nongnu.org; Tue, 17 May 2022 07:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U2sNmW1WDrxCrFdt15EmP2SLORxZfqnaK84wuaXPg8g=;
 b=by8IUAFoyX9sndv02XSHO1B3y1L9suAWz9Nsx32BNEd6mXNf/LneAav0p3BpXSXDf6ltPi
 lgBqZqF7aBlb4ZJfy9Ne819kzeY9tXtCf430dgp9vCrHJICY7jtV+4YtwryGYe38DBiJup
 /sRRxHdvQA9jpfda/0dvTOQE9Y2yfJk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-u0v3dNF8OXCj01sP4WDPkw-1; Tue, 17 May 2022 07:35:29 -0400
X-MC-Unique: u0v3dNF8OXCj01sP4WDPkw-1
Received: by mail-wr1-f70.google.com with SMTP id
 s16-20020adfeb10000000b0020cc4e5e683so4595020wrn.6
 for <qemu-riscv@nongnu.org>; Tue, 17 May 2022 04:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U2sNmW1WDrxCrFdt15EmP2SLORxZfqnaK84wuaXPg8g=;
 b=nNWLGAYbN1zwxoNRo7ExyMDoTkImAW2frZoiuy6Df8RLhsBXI27aIpFQ0Rr9NQaNEi
 fm7Sa98vrBzb9kO4PfDDOSNAVxVwT/daBq2Ij/RHNZqwjkzrbqVXBlGdY9r8y7Y4iuwi
 uo3JN0+PYMnCYJbQd4Lwh9KHWe31J+LSfTRXTK5Ino0Ci19oqIAXj+1gq6ApUhaLbrkT
 OyWSVBNAL31ncoIOIIvzyLppp2GD0xi8He5v9Ew0AdeQqHhv+kv4MntI+MFauJeBx9Om
 l3/FfVsK/tpXCUSyapUdvsBa0LJS0YSZc3t0G3TGiSllMTJZQssht1m9MhPZK5aMJTMb
 4phw==
X-Gm-Message-State: AOAM530gLe8SJTfM82DlF32EPJXhgV7Y3VrayyFDI5ycHefaUC1BAPSo
 RcPnLpGuUBmX+1+eMU6vLTMXvo3+hMt3+tl9IUyVDF6uynAAESq3BEtH6BMD3HsbxaWs1sjqLxJ
 5sl5p7UtfC7qArV8=
X-Received: by 2002:a5d:4948:0:b0:20e:58f8:f4ce with SMTP id
 r8-20020a5d4948000000b0020e58f8f4cemr2203831wrs.229.1652787328036; 
 Tue, 17 May 2022 04:35:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzov3l5thqbX4p/2Jte29EPejPe9dYXkyXXVBITCoDrG0xBTUpYmFScaQ3anVw70pJXdL5XpA==
X-Received: by 2002:a5d:4948:0:b0:20e:58f8:f4ce with SMTP id
 r8-20020a5d4948000000b0020e58f8f4cemr2203780wrs.229.1652787327684; 
 Tue, 17 May 2022 04:35:27 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d64ae000000b0020d0fbf578esm4570177wrp.7.2022.05.17.04.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:35:27 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, "Denis V. Lunev" <den@openvz.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH 00/18] Make block-backend-io.h API more consistent
Date: Tue, 17 May 2022 12:35:06 +0100
Message-Id: <20220517113524.197910-1-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=afaria@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 17 May 2022 09:34:11 -0400
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
X-List-Received-Date: Tue, 17 May 2022 11:35:40 -0000

Adjust existing pairs of non-coroutine and coroutine functions to share
the same calling convention, and add non-coroutine/coroutine
counterparts where they don't exist.

Also make the non-coroutine versions generated_co_wrappers.

This series sits on top of "[PATCH v2 00/10] Implement bdrv_{pread,
pwrite, pwrite_sync, pwrite_zeroes}() using generated_co_wrapper":

    https://lore.kernel.org/qemu-devel/20220513155418.2486450-1-afaria@redhat.com/

Based-on: <20220513155418.2486450-1-afaria@redhat.com>

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
 include/sysemu/block-backend-io.h | 105 ++++++++++++---------
 migration/block.c                 |   8 +-
 nbd/server.c                      |   8 +-
 qemu-img.c                        |  33 +++----
 qemu-io-cmds.c                    |  20 ++--
 tests/unit/test-block-iothread.c  | 141 ++++++++++++++++++++++++++--
 40 files changed, 433 insertions(+), 354 deletions(-)

-- 
2.35.3


