Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA033CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 12:51:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSwfs-0004lB-IU; Fri, 29 May 2026 08:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>) id 1wSwfq-0004kS-Hv
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 08:50:50 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>) id 1wSwfn-0006Dn-Lp
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 08:50:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-36ab8816a35so3450378a91.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780059044; x=1780663844; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+v3hn23aGCqf38u+fhe0n5H6bmFG1okERegZ50wxRI4=;
 b=ViXVesqWTUd/C7WY87GatveguTGDxIePHM6Q2y+bw7+DhBuxse1Z4iVat+MAjampMp
 Rj4ZDMqpOn3nbDu7pJRurJLKv/NdPMlT7g9f+2efDP0FJjt7roQykC1PQGDj7sUG3U3R
 Pu+C5YSDmOQ+UKD31clWxdW4E2Ke3nqZ3MnpUO5oQNryeyXydI2dwLOe92aV5OmhZBnd
 TzaKNjYxKgagPG5KyOy0Hmoya1qPAvitoL2YDhyc+trBRxNdq5R5GP0fHsj2/a44oZQD
 cbjUwvIAtiYsQ7EedcI/JnEdPSojEVmjHm2OftZjaQpjGiEgv/G5eP5EEb4iKa53ztxY
 7voA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780059044; x=1780663844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+v3hn23aGCqf38u+fhe0n5H6bmFG1okERegZ50wxRI4=;
 b=AOUnSnTv9X/tpxuEer4AXJQIwJAX/NDfLLVW1MqsSbD2Dh8oXoVYgmwB76OUBp/itD
 6TI7wZkps39ASgjGyrY6Lmoo0t88Q+GyutzuK/W7wfShPoS24hY/WnotArDALctMeEV7
 o9SI5l+xZXUjq14DyDmUMkSQN1jtltvLuszx3XuOTB3Zzv+pg5ix4UJyWwLgMZoXRlvl
 TkqYZNznzCP+B+gv2cNVO0dxqDmzjdlrz1rM/8PCovQTM2Dn42HIj2ywxS1EvXwaxRBo
 oOKVwVLRjqWD/3ijPqtiNNfhHGeejIyA153bg2E6txgMVxXOW0jkDb2qrOrImfHa2Qfz
 rQuQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ888IG4V4oS/XJJFSkuTuXQ02IXEJZtT/q+DfTd8wAQPs1npO9+wSO+mRkFlEnbrxC59+Ucx4wz+GWJ@nongnu.org
X-Gm-Message-State: AOJu0YxbVqQaMD15eaXSiQfNxf1Ye8eF+kdEtp+2GktMut+dybF2BF9h
 /xy1TkQ0mdoVMsyNrfpnqt6vi+2IaaqNinA1Vp4nSAeDvYJ9E+XvwlXg
X-Gm-Gg: Acq92OEcMw9yucSU/7cz3v0vRiyLmOlW3vn3hX7/lJoW50vtXSsgm7dlNY9eYsZR1ar
 8IFAfVu2jXNGd1czN7PPVvmo4mc3clerbmEOu/2WR7fRWWjt4tbStO+YQ0m8D1EdLMYxC1xCMoI
 g9dVlsftzQNHDGr/Oo4lMvckeechY2nfQUeHZI1N2U3mWQGSaLYvRcCasgGNkvRpgkNNm3cZfAl
 rQ+ROll3RgGOIBZtyN+ncWh5Na7pkaKonAiRwMOdWuJIoxHpgfkzyLLcFLyZMD3DIuI0Od2RBE0
 RhSWStSd/SA6h9GZ4ly+VZWrup4FdRQNNuVbh2Blygz2pUpPLaKb8j4g8vquoFKKIOW4O+8aCWD
 azZFx/4KQoDkWRJM01znfvoX00zMcur74fM0c7YVsphXk2CF3ue8YG9wXK5cb03Q/6ygsEPmy7K
 pSsFyDAOQOBrxW0IFMEDgIa29aIXMTpHpFP34qaXiiZoro8aHG7XUp72Xo1/kReqQB/SZjlq3jr
 D+383LPMKuoQ4iOtvE=
X-Received: by 2002:a17:90b:5291:b0:36b:b3f4:d57b with SMTP id
 98e67ed59e1d1-36bbcad5744mr3765548a91.4.1780059044447; 
 Fri, 29 May 2026 05:50:44 -0700 (PDT)
Received: from localhost (124.158.97.178.qld.leaptel.network. [124.158.97.178])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bbe1a403esm1196951a91.5.2026.05.29.05.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 05:50:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Subject: [PATCH v7 00/10] hw/riscv: Add the Tenstorrent Atlantis machine
Date: Fri, 29 May 2026 05:50:25 -0700
Message-ID: <20260529125036.728206-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Thanks to reviewers and testers of v6 patches.

v6:
https://lore.kernel.org/qemu-devel/20260516004206.169035-1-npiggin@gmail.com/

Changes since v6:
- Remove stray unrelated submodule change (sorry!)
- Add Alano's tested-by on the I2C controller
- Fix double memory_region_init in DW I2C init
- Rebase, added riscv64_machine_interfaces

Chris Rauer (1):
  hw/i2c: Add DesignWare I2C Controller

Joel Stanley (5):
  hw/riscv/virt: Move AIA initialisation to helper file
  hw/riscv/aia: Provide number of irq sources
  hw/riscv: Add Tenstorrent Atlantis machine
  hw/riscv/atlantis: Integrate i2c controllers
  hw/riscv/atlantis: Add some i2c peripherals

Nicholas Piggin (4):
  hw/riscv/boot: Describe discontiguous memory in boot_info
  hw/riscv/boot: Account for discontiguous memory when loading firmware
  hw/riscv/atlantis: Provide a simple halting payload
  tests/functional/riscv64: Add tt-atlantis tests

 MAINTAINERS                                  |  19 +
 docs/system/riscv/tt_atlantis.rst            |  32 +
 docs/system/target-riscv.rst                 |   1 +
 hw/i2c/Kconfig                               |   5 +
 hw/i2c/designware_i2c.c                      | 739 +++++++++++++++++++
 hw/i2c/meson.build                           |   1 +
 hw/i2c/trace-events                          |   4 +
 hw/riscv/Kconfig                             |  13 +
 hw/riscv/aia.c                               |  93 +++
 hw/riscv/aia.h                               |  25 +
 hw/riscv/boot.c                              |  34 +-
 hw/riscv/meson.build                         |   3 +-
 hw/riscv/microchip_pfsoc.c                   |   8 +-
 hw/riscv/opentitan.c                         |   6 +-
 hw/riscv/shakti_c.c                          |   6 +-
 hw/riscv/sifive_u.c                          |   6 +-
 hw/riscv/spike.c                             |   6 +-
 hw/riscv/tt_atlantis.c                       | 665 +++++++++++++++++
 hw/riscv/virt-acpi-build.c                   |  27 +-
 hw/riscv/virt.c                              |  96 +--
 hw/riscv/xiangshan_kmh.c                     |   6 +-
 include/hw/i2c/designware_i2c.h              |  56 ++
 include/hw/riscv/boot.h                      |  12 +-
 include/hw/riscv/tt_atlantis.h               |  65 ++
 include/hw/riscv/virt.h                      |   2 +-
 tests/functional/riscv64/meson.build         |   1 +
 tests/functional/riscv64/test_opensbi.py     |   4 +
 tests/functional/riscv64/test_tt_atlantis.py |  57 ++
 28 files changed, 1885 insertions(+), 107 deletions(-)
 create mode 100644 docs/system/riscv/tt_atlantis.rst
 create mode 100644 hw/i2c/designware_i2c.c
 create mode 100644 hw/riscv/aia.c
 create mode 100644 hw/riscv/aia.h
 create mode 100644 hw/riscv/tt_atlantis.c
 create mode 100644 include/hw/i2c/designware_i2c.h
 create mode 100644 include/hw/riscv/tt_atlantis.h
 create mode 100755 tests/functional/riscv64/test_tt_atlantis.py

-- 
2.53.0


