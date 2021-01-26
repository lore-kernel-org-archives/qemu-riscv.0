Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4HOv-0000Gw-IO
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jan 2021 01:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HOt-0000EN-VY; Tue, 26 Jan 2021 01:00:27 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HOr-0001Lq-Ib; Tue, 26 Jan 2021 01:00:27 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 11so9882352pfu.4;
 Mon, 25 Jan 2021 22:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PoNn/bFoDnh5efZd0mYKkDFkOeN43DFe/uwJ8wWwY4U=;
 b=pz3PAiqtr2IUdXQiUKcIYJ+Tb6G0CPqtyAGrODeSltj9iqvtb9eGPMIX9jJgKI+Y96
 Mw+f2mUcwHKyT1QM/S41B3wukXZ+s4dg4xo1XyL4Ac82s97ZIfs/1zX1RWvWh3yRe4i+
 n5Bx7Lr3xk62pTNvdbL/w58HLjhhZW7k8pLEYH9JcE26vRCfHoXTZygrAUIzqZGi/R0Q
 sKJq1rpzW9/WiaSuOQSCl+VxhDtTzAtC3p30LvEEnQ30kpBfcZl/mpVePCgFAU37Sa71
 mHC9s1dq21A9+Mh4sYde/bspbgzwlOTT9zYHJcOHHzAgB5S2AoPq16zsYLejHv30PdN/
 otZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PoNn/bFoDnh5efZd0mYKkDFkOeN43DFe/uwJ8wWwY4U=;
 b=MMVKdVvmodsPsSB2hMfToA5wWV/rfnfEBScY/wpP8PcW8x/FlSIhhx6an3yMLcqwy4
 5iM1UUOKlrVuqey15MufqFuW/WR3ckTKH/dRp4bHgy3nM0DfLPBNMqMF9XOkVcy2wqHq
 fUkWJlYNU3ac+IyYwedRpUIjEdX1hrSDxWB5WaQTSM6mk7k86IhSSZ8UMjD7PixYE0Oq
 RTaXIv4wBQXxzFh1xqtJdUcs+OZR+LDBZWNm0n68DKXrluWD8zh8wrpAAAQwajKL+2/a
 drCnyDPe8qWoNNr1i9RRL2RwF0a+xEF3dhVzAyoeL7BtsT62XWR5AAzEB7oUzix6tJ9D
 Z7+g==
X-Gm-Message-State: AOAM533bUcifR2T0OHGdw0QNp9tQwDEHPKe/Wd/7ldYpv2DJ6O5DtQa3
 w55DwvEfZQJ64jB0Zj7KZTU=
X-Google-Smtp-Source: ABdhPJw1kiVFWXpAPGD9yLYIUuhAXJ9mPMRhmpE5p9/nm++6/QbqmDzk3XovCCZrj5/4oQRTRg4Ixg==
X-Received: by 2002:a63:1047:: with SMTP id 7mr4251302pgq.292.1611640823426;
 Mon, 25 Jan 2021 22:00:23 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id k10sm12471076pfk.0.2021.01.25.22.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 22:00:22 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 0/9] hw/riscv: sifive_u: Add missing SPI support
Date: Tue, 26 Jan 2021 13:59:58 +0800
Message-Id: <20210126060007.12904-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Tue, 26 Jan 2021 06:00:28 -0000

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

Note the ssi-sd changes are split out of this series in v3, so that all
patches in v3 can go via Alistair's riscv tree.

Part of the ssi-sd changes are now in qemu/master. The remaining patches
are http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226136
that will go via Philippe's sd tree.

reST documentation for RISC-V is added. Currently only `sifive_u`
machine is documented, but more to come.

Changes in v3:
- Simplify flush txfifo logic
- Convert sifive_u.rst from UTF-8 to ASCII

Changes in v2:
- Mention QPI (Quad Peripheral Interface) mode is not supported
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

Bin Meng (9):
  hw/block: m25p80: Add ISSI SPI flash support
  hw/block: m25p80: Add various ISSI flash information
  hw/ssi: Add SiFive SPI controller support
  hw/riscv: sifive_u: Add QSPI0 controller and connect a flash
  hw/riscv: sifive_u: Add QSPI2 controller and connect an SD card
  hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to decimal value
  docs/system: Sort targets in alphabetical order
  docs/system: Add RISC-V documentation
  docs/system: riscv: Add documentation for sifive_u machine

 docs/system/riscv/sifive_u.rst | 336 +++++++++++++++++++++++++++++++
 docs/system/target-riscv.rst   |  72 +++++++
 docs/system/targets.rst        |  20 +-
 include/hw/riscv/sifive_u.h    |   9 +-
 include/hw/ssi/sifive_spi.h    |  47 +++++
 hw/block/m25p80.c              |  57 +++++-
 hw/riscv/sifive_u.c            |  91 +++++++++
 hw/ssi/sifive_spi.c            | 358 +++++++++++++++++++++++++++++++++
 hw/riscv/Kconfig               |   3 +
 hw/ssi/Kconfig                 |   4 +
 hw/ssi/meson.build             |   1 +
 11 files changed, 989 insertions(+), 9 deletions(-)
 create mode 100644 docs/system/riscv/sifive_u.rst
 create mode 100644 docs/system/target-riscv.rst
 create mode 100644 include/hw/ssi/sifive_spi.h
 create mode 100644 hw/ssi/sifive_spi.c

-- 
2.25.1


