Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GLj-00038G-Qa
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLH-0002wf-3D; Sat, 23 Jan 2021 05:40:31 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLC-0002tN-Vz; Sat, 23 Jan 2021 05:40:30 -0500
Received: by mail-pg1-x536.google.com with SMTP id 15so5585352pgx.7;
 Sat, 23 Jan 2021 02:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RcRjG+X0Xo4vscFYCx1I07zrRV2KAeR4O+Ike8XQTNI=;
 b=lSrrdd48XftYHDn7IMwLNVn0AbH0yIJTWlswEasz8d38Z/Qb1/qGSlkYxVYJ0GyeGc
 EIq3G8LKwiHPiKYXNOMi3fIFHaO36ZOqeo5gbx4I0WcRBgmfydkzYjPo3h+Gb9xafeHA
 uEDiLoD8NFWXwzR0uOgghyHer1VwR5eGA+mKYiJPFY6t9lZuIR4t5I0kekYdQbnyc7we
 0mhtKFLY/sOuDKtGbAO1s43xFhEXZ0lCW9FtYQPWvicYIAIR27n7o2ZxLgyms+0sYhFa
 5kBJzgxIV6xE3nosStA6ruBLNnshOg9MVi0005g7pEEpMNk0mCRDY/PE9JMOpQ1hWNl/
 UyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RcRjG+X0Xo4vscFYCx1I07zrRV2KAeR4O+Ike8XQTNI=;
 b=M4kFl6GaimMojmzKSlxjtizRBrrXcfpmBYPb5L25NTt1VB20KBOjJNcKd9OZ4+VwFU
 4QYShrZbkxZCPESkwWTy6K40M7I9ntsnelR7CSGDwkH22KAVbCTN03tmI8E3i3M8w/wL
 ublV9zg7GTP+Tg7eMxdhhQKys5M9aNtoQTOEPbC2XcN81eb4thDeqmwxEI9dAGKQXEP2
 p4ovrtiioBn0uZcazv7kfyBUXCa98AMdYfy2/1TQjX9l3v5tApN6/swbv7/pdoAZiRSH
 hx7Byx3s9k7VTvGYmSoD9SlJggAxtuwphhvcXiUyfxqMuMQkKPbIBYmHJKjOgW62COpH
 BAyQ==
X-Gm-Message-State: AOAM531IL9X54p/jQAI8vyjmBR4Z+P+UrhPT303MBkiMHX1GbZS42kYi
 sB4qBo/sv816DhntfuhWakk=
X-Google-Smtp-Source: ABdhPJzoonL59IEW4nEEONysdhoVBcSLNWfKjYt/ZyyiM+tNxCx9nTIXflLuuQ+P0w+LyMDF11NW9g==
X-Received: by 2002:a63:fc42:: with SMTP id r2mr9158369pgk.234.1611398424985; 
 Sat, 23 Jan 2021 02:40:24 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:24 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 00/25] hw/riscv: sifive_u: Add missing SPI support
Date: Sat, 23 Jan 2021 18:39:51 +0800
Message-Id: <20210123104016.17485-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Jan 2021 10:40:39 -0000
X-List-Received-Date: Sat, 23 Jan 2021 10:40:39 -0000

From: Bin Meng <bin.meng@windriver.com>

This adds the missing SPI support to the `sifive_u` machine in the QEMU
mainline. With this series, upstream U-Boot for the SiFive HiFive Unleashed
board can boot on QEMU `sifive_u` out of the box. This allows users to
develop and test the recommended RISC-V boot flow with a real world use
case: ZSBL (in QEMU) loads U-Boot SPL from SD card or SPI flash to L2LIM,
then U-Boot SPL loads the payload from SD card or SPI flash that is a
combination of OpenSBI fw_dynamic firmware and U-Boot proper.

The m25p80 model is updated to support ISSI flash series. A bunch of
ssi-sd issues are fixed, and writing to SD card in SPI mode is supported.

reST documentation for RISC-V is added. Currently only `sifive_u`
machine is documented, but more to come.

Changes in v2:
- Mention QPI (Quad Peripheral Interface) mode is not supported
- Add a debug printf in the state handling codes
- Fix several typos in the commit message
- new patch: add a state representing Nac
- Make this fix a separate patch from the CMD18 support
- Fix 2 typos in the commit message
- Add a comment block to explain the CMD12 timing
- Catch CMD12 in all of the data read states per the timing requirement
- Move multiple write token definitions out of this patch
- Correct the "coding" typo in the commit message
- Correct the "token" typo in the commit message
- Add 'write_bytes' in vmstate_ssi_sd
- Correct the "token" typo in the commit message
- Introduce multiple write token definitions in this patch
- new patch: bump up version ids of VMStateDescription
- Log guest error when trying to write reserved registers
- Log guest error when trying to access out-of-bounds registers
- log guest error when writing to reserved bits for chip select
  registers and watermark registers
- Log unimplemented warning when trying to write direct-map flash
  interface registers
- Add test tx fifo full logic in sifive_spi_read(), hence remove
  setting the tx fifo full flag in sifive_spi_write().
- Populate register with their default value
- Correct the "connects" typo in the commit message
- Mention in the commit message that <reg> property does not populate
  the second group which represents the memory mapped address of the
  SPI flash
- Correct the "connects" typo in the commit message
- Correct several typos in sifive_u.rst
- Update doc to mention U-Boot v2021.01

Bin Meng (25):
  hw/block: m25p80: Add ISSI SPI flash support
  hw/block: m25p80: Add various ISSI flash information
  hw/sd: ssi-sd: Fix incorrect card response sequence
  hw/sd: sd: Support CMD59 for SPI mode
  hw/sd: sd: Drop sd_crc16()
  util: Add CRC16 (CCITT) calculation routines
  hw/sd: ssi-sd: Suffix a data block with CRC16
  hw/sd: ssi-sd: Add a state representing Nac
  hw/sd: ssi-sd: Fix the wrong command index for STOP_TRANSMISSION
  hw/sd: ssi-sd: Support multiple block read
  hw/sd: ssi-sd: Use macros for the dummy value and tokens in the
    transfer
  hw/sd: sd: Remove duplicated codes in single/multiple block read/write
  hw/sd: sd: Allow single/multiple block write for SPI mode
  hw/sd: sd.h: Cosmetic change of using spaces
  hw/sd: Introduce receive_ready() callback
  hw/sd: ssi-sd: Support single block write
  hw/sd: ssi-sd: Support multiple block write
  hw/sd: ssi-sd: Bump up version ids of VMStateDescription
  hw/ssi: Add SiFive SPI controller support
  hw/riscv: sifive_u: Add QSPI0 controller and connect a flash
  hw/riscv: sifive_u: Add QSPI2 controller and connect an SD card
  hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to decimal value
  docs/system: Sort targets in alphabetical order
  docs/system: Add RISC-V documentation
  docs/system: riscv: Add documentation for sifive_u machine

 docs/system/riscv/sifive_u.rst | 336 ++++++++++++++++++++++++++++++
 docs/system/target-riscv.rst   |  72 +++++++
 docs/system/targets.rst        |  20 +-
 include/hw/riscv/sifive_u.h    |   9 +-
 include/hw/sd/sd.h             |  44 ++--
 include/hw/ssi/sifive_spi.h    |  47 +++++
 include/qemu/crc-ccitt.h       |  33 +++
 hw/block/m25p80.c              |  57 ++++-
 hw/riscv/sifive_u.c            |  91 ++++++++
 hw/sd/core.c                   |  13 ++
 hw/sd/sd.c                     |  82 +-------
 hw/sd/ssi-sd.c                 | 166 +++++++++++++--
 hw/ssi/sifive_spi.c            | 367 +++++++++++++++++++++++++++++++++
 util/crc-ccitt.c               | 127 ++++++++++++
 hw/riscv/Kconfig               |   3 +
 hw/ssi/Kconfig                 |   4 +
 hw/ssi/meson.build             |   1 +
 util/meson.build               |   1 +
 18 files changed, 1347 insertions(+), 126 deletions(-)
 create mode 100644 docs/system/riscv/sifive_u.rst
 create mode 100644 docs/system/target-riscv.rst
 create mode 100644 include/hw/ssi/sifive_spi.h
 create mode 100644 include/qemu/crc-ccitt.h
 create mode 100644 hw/ssi/sifive_spi.c
 create mode 100644 util/crc-ccitt.c

-- 
2.25.1


