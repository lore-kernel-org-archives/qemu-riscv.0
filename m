Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18968C53200
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jul 2026 12:30:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnxyX-0000sh-Ok; Sun, 26 Jul 2026 08:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wnxyL-0000lD-8G
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 08:28:49 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wnxyJ-0002uZ-Cv
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 08:28:48 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-8485b358552so1932872b3a.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Jul 2026 05:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785068926; x=1785673726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=g/XAcSm17QqKQ9ETpqNQkH3Hsms2HSSgWJglT/dAeR0=;
 b=ZxHFhf0+gZe1bag8nmIA97wknhcefYqB3L65fBZyJuZdV1QgTfQGcDomlBC+g7upqu
 ikogm1u2YvmqfGWG8YEcWdpMXnOFz0xNgCN52AiaRSL/h3NRVHUZn7ofMPJuEWaNTHOe
 xKPH+kxqQbNkw5DDhnhg3FzXoZ43b4cjbH+IAfeUe1iCBGTsxFCf0kKLdSOENcSl7phm
 idfcCQFxNnwpYny1UKYJjm6V7HoEF+FIZOxjSlKv06MKZwt2Azw2213dqnuY1U9lHSzb
 zb1Uy4p5G/KLHk3KzmkSy9ZLxR6kaLR1eSorJJgBzxb+qDRpRzvpXtXECnXOcm3p0bsW
 mDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785068926; x=1785673726;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g/XAcSm17QqKQ9ETpqNQkH3Hsms2HSSgWJglT/dAeR0=;
 b=Go6ybmQ6o2h6CqygrnCS0mjHM/E9QcfyyMCBQftjUPwopcG5Zzqv5UHClx/ENC+Wcm
 hRlTwcv64WvVNNK7XifNCOl96siHXNkeWismxnjXmkZq3K6Tas3RLnb+8aok01yDs2hd
 6yemVU07t02xq8ghQiPszcN9yhi+dkuhJ7Plya1FF0qato34tLT3+B8r8LO8TAfuU9yu
 bSCNlY0iGzVVvss38BsxqHJPwdUNeoMgTD728GXiOMdW792aFI//fq13GPgKcYdDKIxc
 XZ3uyZufeYfJVR778tbAkqmVMKYTKj1O/aAie4w11xFDQwUTiwy8WeWdePzFX9bLMhXA
 n34w==
X-Forwarded-Encrypted: i=1;
 AHgh+RoZ4C03fyr95+ZOGp0/OWqPGZwfvM3S/SWt0IXgjYgjl3AQByQKPcKnIMfLciqB8ue1OBQj8Hx9FcBm@nongnu.org
X-Gm-Message-State: AOJu0YwaEebZS/JnWtVpRtwb4d32HlJtEoXr7Upzxlt/LzmpeGFKVKpz
 EivxrWPIbfyLXBlnYwfnv2p1VSdfTdodYtq9TdO9vOwGP8bGR3FgKFcs
X-Gm-Gg: AR+sD12iO25YJaPxipRBGWDM7HuMEomvEQnF0slcuwMSY6m/y+GNG21D1h2X98PVzpW
 h7nF/TNA2jDRjGMj3eg5sCWte8qcPFRsIIGAk8LYEQ7xEoWUs41YK0z190fEZ6w43FYZNWXOceg
 OUXIrEILa+4PTTjnQlU/wwnJGOzqMmAQepRlDqIUJgdx4gJHa18/0az4/5EHqrXzlC9D+8ape1N
 8ScvFMd2a6udUGQD1tQ27nqF7QbjRTRapSRSJxBwDxNEshOdtroL55M1uacPDf3zsasoD/22cCa
 e48YNclj5/wGGaEx8RgU8ZfRRz5tCJAV3ExNn2jPDTo+lLznxQ18TmwTkYDF2XBIJOA9oKiyyFb
 kZlsYOnP15Wo4v85G7FMdem+p+raEHx1Q6Q7Iu4yW8uqrc5yeP6Jbsb7t5VtoBF1rhb9LUGDRfu
 VQutQSvCjZOMyL5oWEFyoC
X-Received: by 2002:a05:6a00:3687:b0:848:4b49:27fb with SMTP id
 d2e1a72fcca58-84e595a45aamr3681036b3a.78.1785068925835; 
 Sun, 26 Jul 2026 05:28:45 -0700 (PDT)
Received: from localhost.localdomain ([111.201.4.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e53426628sm1861647b3a.49.2026.07.26.05.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 05:28:45 -0700 (PDT)
From: Kangjie Huang <flamboyant.h.01@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kangjie Huang <flamboyant.h.01@gmail.com>, qemu-riscv@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 00/11] hw/riscv: Add K230 SPI, QSPI, IDMA and XIP support
Date: Sun, 26 Jul 2026 20:28:18 +0800
Message-ID: <cover.1785064312.git.flamboyant.h.01@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Message-ID: <20260726122818.FPPhfGLusCVQ4rUo__kx4COWlEzqkGhS9SuZOqeBU5E@z>

Hi,

The k230 machine currently models the C908 core, CLINT, PLIC, watchdogs
and UARTs, but cannot yet model the real boot path. This series adds the
Kendryte K230 DesignWare SSI controllers and their machine integration
as groundwork for full boot support, enabling U-Boot to boot from SPI
NOR through standard PIO, QSPI IDMA, and the XIP read window.

K230 contains three SSI instances with different capabilities. The SDK
numbers them according to the address map: spi0 is the SPI-OPI instance,
while spi1 and spi2 are QSPI0 and QSPI1. The series models the register
contract documented in the K230 Technical Reference Manual V0.3.1
(2024-11-18), standard FIFO-backed SPI transfers, interrupt routing,
Dual/Quad SDR transfers, SPI NOR attachment, synchronous internal DMA,
the HI_SYS SSI_CTRL wrapper, and the spi0 XIP read window.

The implementation is split so that the register model and machine
integration come first, followed by the PIO data path, interrupt support,
enhanced transfers, flash integration, IDMA, HI_SYS, and XIP. A single
K230 SSI qtest binary grows with the series and exercises each layer when
it becomes available.

The final patch adds trace events covering register accesses (excluding
DR, whose per-frame traffic would drown out everything else during U-Boot
and Linux SPI NOR transfers), transaction boundaries, interrupt levels,
IDMA start/completion/error, and XIP reads. The trace points are placed
in a dedicated patch at the end of the series so that the functional
patches stay focused on behaviour and the trace surface can be reviewed
in one place. The events only observe model behaviour and do not change
it.

Testing:

* Built qemu-system-riscv64 at every commit with the riscv64-softmmu
  configuration.
* Ran the cumulative K230 SSI qtest after every commit that provides the
  test target. The final revision passes all ten scenarios:
  register-contract, pio-data-path, interrupt-controller, plic-routing,
  qspi-config, spi-nor, qspi-sdr, idma, hi-sys, and xip-read-window.
* Standard SPI: U-Boot detected W25Q256, loaded OpenSBI, Linux, initrd,
  and DTB with sf read, and reached the Linux initramfs shell.
* Quad SPI: with spi0 configured for 4-bit transfers, U-Boot erased a
  64 KiB sector, wrote and read back 256 bytes successfully, loaded all
  boot payloads from QSPI flash, and reached the Linux initramfs shell.
* XIP: U-Boot read the OpenSBI uImage header from 0xc0000000, verified
  its checksum, and reached the Linux initramfs shell through bootm.
* git diff --check reports no whitespace errors.
* checkpatch reports no errors.

Kangjie Huang (11):
  hw/ssi: Add K230 DesignWare SSI register model
  hw/riscv/k230: Instantiate K230 SSI controllers
  hw/ssi: Implement K230 SSI FIFO and standard PIO transfers
  hw/ssi: Add K230 SSI interrupt controller
  hw/riscv: Route K230 SSI IRQs to the PLIC
  hw/ssi: Implement K230 enhanced QSPI transfers
  hw/riscv/k230: Attach SPI NOR flash to spi0
  hw/ssi: Implement K230 SSI internal DMA transfers
  hw/misc: Add K230 HI_SYS SSI control
  hw/ssi: Add K230 SSI XIP read window
  hw/ssi: Add trace events for K230 DesignWare SSI

 docs/system/riscv/k230.rst     |    4 +
 hw/misc/k230_hi_sys.c          |  169 +++
 hw/misc/meson.build            |    1 +
 hw/riscv/Kconfig               |    2 +
 hw/riscv/k230.c                |  165 ++-
 hw/ssi/Kconfig                 |    4 +
 hw/ssi/k230_dw_ssi.c           | 1754 ++++++++++++++++++++++++++++++++
 hw/ssi/meson.build             |    1 +
 hw/ssi/trace-events            |   11 +
 include/hw/misc/k230_hi_sys.h  |   55 +
 include/hw/riscv/k230.h        |    9 +
 include/hw/ssi/k230_dw_ssi.h   |  111 ++
 tests/qtest/k230-dw-ssi-test.c |  917 +++++++++++++++++
 tests/qtest/meson.build        |    4 +-
 14 files changed, 3191 insertions(+), 16 deletions(-)
 create mode 100644 hw/misc/k230_hi_sys.c
 create mode 100644 hw/ssi/k230_dw_ssi.c
 create mode 100644 include/hw/misc/k230_hi_sys.h
 create mode 100644 include/hw/ssi/k230_dw_ssi.h
 create mode 100644 tests/qtest/k230-dw-ssi-test.c


base-commit: f893c46c3931b3684d235d221bf8b7844ddbf1d7
-- 
2.43.0

