Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A78C43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 02:51:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weOYB-0004B9-PV; Mon, 29 Jun 2026 22:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1weOY4-00044R-E4
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 22:50:08 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1weOY0-0001mx-RT
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 22:50:07 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-37fc02e660bso1706000a91.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 19:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782787803; x=1783392603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=tsA7u0gy2zQ85DB4mmeBFkLon/HsDvZV1Oc9o3XQPGE=;
 b=qgPeVUAE0IdbHtey3tfbQOU4BwMWkS/k9zIND/KFr0V/AjZpPnNo/d3GRARHS6Hw5J
 JLMx0ilT7wNYk3vrEGNR52wLEUACfnPzOrZBXauoHsz5ul5hH/cLOS5N4U+0gQjy2RRu
 S9dfGirDgfXmvniR+W1Xs8Dju+SxsqgTaQ6PGmHmcH+yv9eXQd0ukHyEkpgCxBqbgyzj
 JiLhu3poT3Xe+6PoLJVDaa6AL1+K+KPrIHkx8oexRFZdMj9U9GJXdXtkZV/P7KrYB2Ny
 9AoaR8pSPwz+g186M23+/HO1PbRPATckAhhrA1EWWCqZfDwN+3JEtUemXtUZvlOVtLWV
 Dq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782787803; x=1783392603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tsA7u0gy2zQ85DB4mmeBFkLon/HsDvZV1Oc9o3XQPGE=;
 b=erhfSjsvfj5uulJ+j8Xypp1lJ+HpK70ddSFcuzbv1CkXDhqrey+Fzx+LtFu68+3sIb
 DsdDj0lhpYPpayj0bxAnTyMxIjcQD0xxLLBe7nu3ODVTC4ohu9p/KXMOkCDy27xdHON3
 tUvMtzor48jdatd74lrHWZO/g4KlZFdGedHOFpGxgtP6uO59WX4tqudS+6NAiwpjCBca
 C4luyblqtX2u7Bu6xPwUhZ59CCqFEX7LDo/c3QmzPiCFUeNA+Sx/fplOWjbNbZnK+9Rf
 EdZ5hDz10Y0XKwjENXkZ5f/PFO7uoiPg7/wW34NOkohX8wcAb5htQ+YSD6nJpU2/HFAh
 DpKg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoH9F+/IgQYjtSU6rr3KJw1cIIKw7BAAqzLmQ0+Z8zLdclipTzshEUmjA2qEJHPe1Zj9fsQJUecEn5o@nongnu.org
X-Gm-Message-State: AOJu0YxJJ/TdMyzEBA0vyeNpCykY8myLybhJWtY3L/XkTn1GJYs0NZBL
 Yovs0XIrWYUKCmX5M5ZqymBTO1X8S1tLWUqQm98eGoHJWE5FrNWLN/sR
X-Gm-Gg: AfdE7clsfhJrcBeb9SICjDN5wYe10tNoBV1cRPRIGnDhmakshuRGkjPnaEZAwiDjXN2
 E/V8NGhlNH+Qw3z4g63tWiqOJeH7GZj1gPvuWZf0qxvVNPPzK2dWSChbl44GQhk8Yqnza4Tq0iB
 WjoovYBJKez3AvM8n6RanmR/tN0VXyck5bxWlSc/wclpogbz5GaTLS4T21FKEIJTNXMeWpLBq/B
 fS4MxVR4fa3++wfaDcJiXODZzMx11n5I+oo65cYZZcbKenXuwDGbZXTNkPQebl7jidzLcRCZuyt
 wH2Vato9G2vLEoaNOXWwthuHbKzHNpLm8ZR4wmNj/Yz3hTUtft33/lpc4hGOy7H1nY+9okub9+G
 x/nEc2fGQu6TOoq9Xem88YwF5LR5O5BfOu0huxK2GGRIFS7sP47rPvVWM4cjgoWIEHxfdX0rZRF
 sOcPCKYoPmuWgNIWAIeHickAK6VN+WUK93YsDFhDQ+yukbmkgptxe9fJ+b2evQXuoIw5L9ZBV98
 wxDVnAAXZcSKTHNQn+AQ19EmIc0c3PAW5drV1kP9Do=
X-Received: by 2002:a17:90b:4a0b:b0:37f:d70a:9610 with SMTP id
 98e67ed59e1d1-38052758e97mr1282132a91.24.1782787802633; 
 Mon, 29 Jun 2026 19:50:02 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38052f32661sm704545a91.9.2026.06.29.19.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 19:50:01 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v10 00/12] hw/riscv: Add the Tenstorrent Atlantis machine
Date: Tue, 30 Jun 2026 12:19:38 +0930
Message-ID: <20260630024952.1520546-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1029.google.com
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

v10 replaces patch 8 ("Provide a simple halting payload") with the
version suggested by Alistair.

v9: https://lore.kernel.org/qemu-riscv/20260619044838.1054677-1-joel@jms.id.au/

Alistair Francis (1):
  hw/riscv/atlantis: Ensure OpenSBI has a non-zero next_addr

Chris Rauer (1):
  hw/i2c: Add DesignWare I2C Controller

Joel Stanley (6):
  hw/riscv/virt: Move AIA initialisation to helper file
  hw/riscv/aia: Provide number of irq sources
  hw/riscv/aia: Configure stride for the M-mode IMSIC
  hw/riscv: Add Tenstorrent Atlantis machine
  hw/riscv/atlantis: Integrate i2c controllers
  hw/riscv/atlantis: Add some i2c peripherals

Nicholas Piggin (4):
  hw/riscv/boot: Describe discontiguous memory in boot_info
  hw/riscv/boot: Account for discontiguous memory when loading firmware
  target/riscv: tt-ascalon: Enable Zkr extension
  tests/functional/riscv64: Add tt-atlantis tests

 MAINTAINERS                                  |  21 +
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
 hw/riscv/k230.c                              |   8 +-
 hw/riscv/microchip_pfsoc.c                   |   8 +-
 hw/riscv/opentitan.c                         |   6 +-
 hw/riscv/shakti_c.c                          |   6 +-
 hw/riscv/sifive_u.c                          |   6 +-
 hw/riscv/spike.c                             |   6 +-
 hw/riscv/tt_atlantis.c                       | 617 +++++++++++++++
 hw/riscv/virt-acpi-build.c                   |  27 +-
 hw/riscv/virt.c                              |  97 +--
 hw/riscv/xiangshan_kmh.c                     |   6 +-
 target/riscv/cpu.c                           |   1 +
 hw/i2c/Kconfig                               |   5 +
 hw/i2c/meson.build                           |   1 +
 hw/riscv/Kconfig                             |  13 +
 hw/riscv/meson.build                         |   2 +
 tests/functional/riscv64/meson.build         |   1 +
 tests/functional/riscv64/test_opensbi.py     |   4 +
 tests/functional/riscv64/test_tt_atlantis.py |  57 ++
 29 files changed, 1859 insertions(+), 108 deletions(-)
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


