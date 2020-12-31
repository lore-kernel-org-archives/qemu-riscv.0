Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAB-0007LG-2P
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwA9-0007IP-Bi; Thu, 31 Dec 2020 06:30:37 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwA4-00075A-V2; Thu, 31 Dec 2020 06:30:37 -0500
Received: by mail-pl1-x62a.google.com with SMTP id q4so9925935plr.7;
 Thu, 31 Dec 2020 03:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8DEv8DwXupmb8HnEx8CFmydHKhBrRkmD+oQGpzXBwfQ=;
 b=jXFhtBmnXjgGH2w6cEh/Jav2QRcvXWnndvw4laa6sB9feldEb6ku9ChfXUIBxeX4FK
 YRpKjUS7yfIEw6tQVEAYvsacnfevIJemW1CYvMnYaLEtozAGadBdcELdMRwr3UhrUlKH
 Sgz68oirgq5yRC26918KMT8maJ5wExcIbgbDbF5QQiez7q95vxhi13He+itXP4sE/R59
 kdBt2OUrPi60Yc11nxW73/MPBAIlYpoaLm54fdRSda1KX/GHSTZAykQCPsgi/3yGOGZM
 PhgdhaBTcNTQqWfhlBqBfJ8exBBj+Zk16fbpeNHADtL0jqPSxNxvswsHR3GO3/0APe4s
 H6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8DEv8DwXupmb8HnEx8CFmydHKhBrRkmD+oQGpzXBwfQ=;
 b=KAZ/A18YgBsXc63hpCLQnVzDl242s+/0zhyfpQaai26cLdDFjnJHGhXTDHFvgTL6co
 l2J98373kla9MlnjbpuufIdIak01BEUhMODuJejzzcmIY+pr/v0rz5ht6KbMulsUVZDY
 gXp54ItL7y8/ievn3SOnmXY2jYt+yIu83wAv6RyE7GMRAf5qoPOtBG/m3gCDlDPhr27A
 HGORt1iPlH193iBPeJGeDGncxh3BDxcFKTQAi/cUCrrZdzVB9mUE7r5pcfIqptJf8cnl
 6WHy/4ajNf+7FxmYCjsOOyvmVC3gklkLDiWJc/Lab1l/ueNhncthSh1C0pADTFW5Oqke
 YMag==
X-Gm-Message-State: AOAM531fdU/5r/6JezAi9GJ6V38i3BdQQOPzmoJIULXw3hW0GMeAYeU0
 eRlUb+fxEb8Wpfx/ry3HH9E=
X-Google-Smtp-Source: ABdhPJwy/7LkS4e8xODnE9UnRKEOFJfUYNDs8Dkg/5Rtrpygksr8mfrlHA60W5YqigA2GnboVp8xaA==
X-Received: by 2002:a17:902:c401:b029:da:6fa4:d208 with SMTP id
 k1-20020a170902c401b02900da6fa4d208mr32689620plk.33.1609414226907; 
 Thu, 31 Dec 2020 03:30:26 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:30:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 00/22] hw/riscv: sifive_u: Add missing SPI support
Date: Thu, 31 Dec 2020 19:29:48 +0800
Message-Id: <20201231113010.27108-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Thu, 31 Dec 2020 11:30:37 -0000

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


Bin Meng (22):
  hw/block: m25p80: Add ISSI SPI flash support
  hw/block: m25p80: Add various ISSI flash information
  hw/sd: ssi-sd: Fix incorrect card response sequence
  hw/sd: sd: Support CMD59 for SPI mode
  hw/sd: sd: Drop sd_crc16()
  util: Add CRC16 (CCITT) calculation routines
  hw/sd: ssi-sd: Suffix a data block with CRC16
  hw/sd: ssi-sd: Support multiple block read (CMD18)
  hw/sd: ssi-sd: Use macros for the dummy value and tokens in the
    transfer
  hw/sd: sd: Remove duplicated codes in single/multiple block read/write
  hw/sd: sd: Allow single/multiple block write for SPI mode
  hw/sd: sd.h: Cosmetic change of using spaces
  hw/sd: Introduce receive_ready() callback
  hw/sd: ssi-sd: Support single block write
  hw/sd: ssi-sd: Support multiple block write
  hw/ssi: Add SiFive SPI controller support
  hw/riscv: sifive_u: Add QSPI0 controller and connect a flash
  hw/riscv: sifive_u: Add QSPI2 controller and connect an SD card
  hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to decimal value
  docs/system: Sort targets in alphabetical order
  docs/system: Add RISC-V documentation
  docs/system: riscv: Add documentation for sifive_u machine

 docs/system/riscv/sifive_u.rst | 336 +++++++++++++++++++++++++++++++++
 docs/system/target-riscv.rst   |  72 +++++++
 docs/system/targets.rst        |  20 +-
 include/hw/riscv/sifive_u.h    |   9 +-
 include/hw/sd/sd.h             |  44 ++---
 include/hw/ssi/sifive_spi.h    |  47 +++++
 include/qemu/crc-ccitt.h       |  33 ++++
 hw/block/m25p80.c              |  51 ++++-
 hw/riscv/sifive_u.c            |  91 +++++++++
 hw/sd/core.c                   |  13 ++
 hw/sd/sd.c                     |  82 +-------
 hw/sd/ssi-sd.c                 | 127 +++++++++++--
 hw/ssi/sifive_spi.c            | 290 ++++++++++++++++++++++++++++
 util/crc-ccitt.c               | 127 +++++++++++++
 hw/riscv/Kconfig               |   3 +
 hw/ssi/Kconfig                 |   4 +
 hw/ssi/meson.build             |   1 +
 util/meson.build               |   1 +
 18 files changed, 1232 insertions(+), 119 deletions(-)
 create mode 100644 docs/system/riscv/sifive_u.rst
 create mode 100644 docs/system/target-riscv.rst
 create mode 100644 include/hw/ssi/sifive_spi.h
 create mode 100644 include/qemu/crc-ccitt.h
 create mode 100644 hw/ssi/sifive_spi.c
 create mode 100644 util/crc-ccitt.c

-- 
2.25.1


