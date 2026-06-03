Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A505CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:03:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUfZV-0003w3-1H; Wed, 03 Jun 2026 02:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUfZR-0003ub-Vp
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 02:59:22 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUfZP-00061j-6P
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 02:59:20 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c8584e80bd3so1686557a12.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 23:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780469957; x=1781074757; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=pAqk3sM0BRgKX69IUJfdfzuzywFvW6ueCG/rW3TXr80=;
 b=mwBmojcVtJTqN0UXWSpaxhx6vWZlyNEPjyDalY1vAIGMZwXOU4ihDzH1WExswHIp4z
 fRPrTcAS62gtXfX8rGrBxBORA6yuASq3NHmyiPFioNl0AmyllxT9R2nBaITRtHSW/54k
 BD4i8sLF+aPa1kNreVzkyR12WTUvPjbtoL4tyDyHXuosGDF1KuceyP+m5nuvmMJmOpDF
 ru7g3KLrQYYIUnLO2p6sYlUsghs0aaelYGK4SS6Lb8Ct8esA4T/nwzDwrXHh5vO/PWLo
 qcifvA5BuWegrutwM+DdLh6osDLa+DDVS43TzdPK9QEn71Jb4ZRRflBg5KrupLS3hADI
 BW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780469957; x=1781074757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pAqk3sM0BRgKX69IUJfdfzuzywFvW6ueCG/rW3TXr80=;
 b=oXqHZ0SDfTktDf+XLEGoMsnOhppNcMs1j3tdJasoweh51v2nCc0AyMolUandbWd3/D
 +PFv2MuAqNjMclhSiZ736BSd3l7rocmwnmG+X3Trfu/EcJEIIOL5YB14jRJZwHJ8FG65
 tsgA4JCNssxw3KWQ/dxp+g4G5MU+6TJpki01FWgis0P9YnT1oaBSXBIpQ+IQUgJlVRzG
 FFeT8+1HYRnuRtmcSuM9wVeRvKEmz7NwEjotbvBeqzEY/bkRZ/P3i/NJvVhlNkUdcl/I
 IYYGXoBZZ8nttRVpv4NraWL1wi9xi6+bUQLlntpZFdCelM561KPM1gUBmH6izmMKB+C2
 6iYw==
X-Forwarded-Encrypted: i=1;
 AFNElJ80BJqoY98VpgMcJ5uj4Kf7WbV7zxcva298OuIZ7mZ5BRZLswkH7YB6FzJsFokHB7SHgl6oe/e7zHOE@nongnu.org
X-Gm-Message-State: AOJu0YzdjJ2qj/w3BSC8RTbpCFuPvkgd10SvhNQGiX8bgiTrPKC0IZnL
 rq08osLM9dokruCrIa0wNJShYZjE2aNbQbfeerILR5MDQbUu6PTHstLD
X-Gm-Gg: Acq92OFpXVrD9QhLZsger/eia9shiSYlXOIDUX3C3CyaLu6WY1ZvxXOJUIkme+EvuGh
 gIWuZY76R0o7nHp+j03/aw4NIfQQGljNJGg+1jGayVsx0dffXtXc5Ea4J5pqbmatGdNjgEH47tc
 v4q7oU7DupiOMmxh0MmAee0DXkRAf6sUcp7l6j1TNiA4u7dHuSg/69go50OuT4IcapyxAlDgFL0
 TWMbSiHZaQ4Yg84ks2AS4EIyMgU/mUwbtoJ7QLmVTpPkrnN6R+JFlPPWXpJTXNFrwv43jzhZPEq
 m60f2tmyzHkHdcRQRE136HrF/kjRdGCP2pIKYmoFhSH71LWf4XoCKsdbNsPX08evrmmKku7yrEg
 57itp5NkiyYjsdrMD1BRnQbE4SgSZD+mKzJUNvUiXfE2E9D+oZRaBk2y8f08uFV3O110G/LM53z
 /CH+nlSC96H3GIoeM4m28oBCJo0OxuVpPAY9xU3ykTj60XI9yGXCJhoFBa3zmI3o6X4b06XG3yB
 c/vi4KNEPK5jk5CAWN4QygJ9zEt8Q2qlVMqpAHazCtwVCC9Y80PPegBmI3tDn39
X-Received: by 2002:a05:6a21:6e03:b0:3b4:913c:296a with SMTP id
 adf61e73a8af0-3b49758695fmr2599462637.21.1780469957365; 
 Tue, 02 Jun 2026 23:59:17 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85df033887sm1283261a12.2.2026.06.02.23.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 23:59:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v8 00/12] hw/riscv: Add the Tenstorrent Atlantis machine
Date: Wed,  3 Jun 2026 16:28:44 +0930
Message-ID: <20260603065859.592063-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Introducing Tenstorrent Atlantis!

 The Tenstorrent Atlantis platform is a collaboration between Tenstorrent
 and CoreLab Technology. It is based on the Atlantis SoC, which includes
 the Ascalon-X CPU and other IP from Tenstorrent and CoreLab Technology.

 The Tenstorrent Ascalon-X is a high performance 64-bit RVA23 compliant
 RISC-V CPU.

Thanks to Nick for sending the past few revs while I was on leave.

v7:
https://lore.kernel.org/qemu-riscv/20260529125036.728206-1-npiggin@gmail.com/

Changes since v7:

Fixes for booting an external device tree. Will add a test for this once
the device tree is reviewed.

- Correct IMSIC memory layout to match hardware. Uses new patch 5. 
- Bring Zkr patch back in, required for opensbi to not trap on csr
  access
- Address map corrections and ensure m-mode addresses are used for
  Linux devices
- Use UART1 as the console to match hardware
- Update /chosen so -append works
- Update /memory node to match -m

Others:

- Fix duplicate .unimp setting in designware i2c
- Avoid guest error warning at device reset time

Chris Rauer (1):
  hw/i2c: Add DesignWare I2C Controller

Joel Stanley (6):
  hw/riscv/virt: Move AIA initialisation to helper file
  hw/riscv/aia: Provide number of irq sources
  hw/riscv/aia: Configure stride for the M-mode IMSIC
  hw/riscv: Add Tenstorrent Atlantis machine
  hw/riscv/atlantis: Integrate i2c controllers
  hw/riscv/atlantis: Add some i2c peripherals

Nicholas Piggin (5):
  hw/riscv/boot: Describe discontiguous memory in boot_info
  hw/riscv/boot: Account for discontiguous memory when loading firmware
  target/riscv: tt-ascalon: Enable Zkr extension
  hw/riscv/atlantis: Provide a simple halting payload
  tests/functional/riscv64: Add tt-atlantis tests

 MAINTAINERS                                  |  19 +
 docs/system/riscv/tt_atlantis.rst            |  41 +
 docs/system/target-riscv.rst                 |   1 +
 hw/riscv/aia.h                               |  26 +
 include/hw/i2c/designware_i2c.h              |  56 ++
 include/hw/riscv/boot.h                      |  12 +-
 include/hw/riscv/tt_atlantis.h               |  64 ++
 include/hw/riscv/virt.h                      |   2 +-
 hw/i2c/designware_i2c.c                      | 745 +++++++++++++++++++
 hw/riscv/aia.c                               |  94 +++
 hw/riscv/boot.c                              |  34 +-
 hw/riscv/microchip_pfsoc.c                   |   8 +-
 hw/riscv/opentitan.c                         |   6 +-
 hw/riscv/shakti_c.c                          |   6 +-
 hw/riscv/sifive_u.c                          |   6 +-
 hw/riscv/spike.c                             |   6 +-
 hw/riscv/tt_atlantis.c                       | 706 ++++++++++++++++++
 hw/riscv/virt-acpi-build.c                   |  27 +-
 hw/riscv/virt.c                              |  97 +--
 hw/riscv/xiangshan_kmh.c                     |   6 +-
 target/riscv/cpu.c                           |   1 +
 hw/i2c/Kconfig                               |   5 +
 hw/i2c/meson.build                           |   1 +
 hw/riscv/Kconfig                             |  13 +
 hw/riscv/meson.build                         |   3 +-
 tests/functional/riscv64/meson.build         |   1 +
 tests/functional/riscv64/test_opensbi.py     |   4 +
 tests/functional/riscv64/test_tt_atlantis.py |  57 ++
 28 files changed, 1940 insertions(+), 107 deletions(-)
 create mode 100644 docs/system/riscv/tt_atlantis.rst
 create mode 100644 hw/riscv/aia.h
 create mode 100644 include/hw/i2c/designware_i2c.h
 create mode 100644 include/hw/riscv/tt_atlantis.h
 create mode 100644 hw/i2c/designware_i2c.c
 create mode 100644 hw/riscv/aia.c
 create mode 100644 hw/riscv/tt_atlantis.c
 create mode 100755 tests/functional/riscv64/test_tt_atlantis.py

-- 
2.47.3


