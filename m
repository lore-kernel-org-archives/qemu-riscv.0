Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D810EB64D0
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:34:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q94A4-0006Ch-D8; Tue, 13 Jun 2023 09:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94A3-0006CS-0A
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:34:15 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94A0-00021J-TH
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:34:14 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so811070166b.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 06:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686663251; x=1689255251;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gBFSVqesPLYVNvOpKpmvg4XLW+9gcOy7P9MjR5bQqc0=;
 b=eBMpvCWDRgAGb497ldgG467Ib67WHof5rqsmbhIbDLRcBMQE4SdLHgNOWTEB4f7M7D
 fYFoRAVipghhQYnXwzkgLc+pPD9p+3rJLQcfy9qT83OdTdnbXm1cXZk1Rwo9d9yXt44Y
 0OCHWoIe21LiOJielueRrko0zVuNRQqm7yXlNGRr7ubtVwocJABygl0K+oZcRImsnpgg
 fB23W2EpL79f1wO4kD+sc+pUKwqRO+oWUdNWGCWPVCnSlnOMZArgDaZfzoL0rzXgBIbq
 kYSC+/QKbstZ9h9FW8gcNMr5BUALQtSitWWtbR9rA8O3kK6E8CXyPXNqrLq4vjC2Xe/y
 RolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663251; x=1689255251;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gBFSVqesPLYVNvOpKpmvg4XLW+9gcOy7P9MjR5bQqc0=;
 b=g+2c+FnQjd/ZwOfyt23CJiGiXPpX5fwOszs4cYDsyqH5nNjUlwxI7qNYtkcmTa+hmr
 SwEq0Cp8/p0S09Wvfl9tcjPA9LPPhQs7tzNMRzOKNIMHh82Pb2krMCfM5HBj4UmPvGzP
 S4r85O5Mv+mW+R8B+l7j21ah9z1w3SWcqJC4RuschMTTRA2CAuELpFraqT4OKl4Y/K7j
 s7TyEMQvBrlInuwXug8WBAS1RfMurNxgxhniyfejc4MvnfmjQ6A4/o7RPWMDup7GjHSs
 AP/P5Vtq/c9qDtmz93M/zt1MfEH5Ia1S++70xfJZUKsYL3DhimYkMtw6vUpVjv2ZtdEB
 p7mA==
X-Gm-Message-State: AC+VfDzC9jdDrKOTuQ5eHBnkK3oNEkQYKHdQX2+6Azv/l8AMEmk/y8Iv
 Z78SBWWojC6tnlQoFQjG3z6Y5A==
X-Google-Smtp-Source: ACHHUZ7lh9dBl+2LMdPbHrPbllwHDqN1ewTuK5TK7Ifc2VHlM3n94wfGxH89IaIEnLFth0NCqRp+Ag==
X-Received: by 2002:a17:907:948e:b0:982:416f:1963 with SMTP id
 dm14-20020a170907948e00b00982416f1963mr1063297ejc.39.1686663251226; 
 Tue, 13 Jun 2023 06:34:11 -0700 (PDT)
Received: from localhost.localdomain ([213.235.133.109])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a17090635ca00b00961277a426dsm6608330ejb.205.2023.06.13.06.34.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Jun 2023 06:34:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/9] bulk: Replace CONFIG_SOFTMMU by
 !CONFIG_USER_ONLY/CONFIG_SYSTEM_ONLY
Date: Tue, 13 Jun 2023 15:33:38 +0200
Message-Id: <20230613133347.82210-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Missing review: 1, 7, 8

Since v2:
- Rebased
- Added R-b tags
- Rework i386_tr_init_disas_context() patch (Richard)
- Dropped RFC prefix

This series aims to clarify the CONFIG_[USER|SYSTEM] vs CONFIG_SOFTMMU
confusion [*] by using explicit definitions, removing mentions of
CONFIG_SOFTMMU in non-TCG code.

We replace CONFIG_SOFTMMU by !CONFIG_USER_ONLY in C code and
by CONFIG_SYSTEM_ONLY in meson config files.

[*] Richard clarified my confusion with CONFIG_SOFTMMU on v1:
https://lore.kernel.org/qemu-devel/7913570a-8bf6-2ac9-6869-fab87273742c@linaro.org/

Philippe Mathieu-Daudé (9):
  target/i386: Simplify i386_tr_init_disas_context()
  target/tricore: Remove pointless CONFIG_SOFTMMU guard
  target/m68k: Check for USER_ONLY definition instead of SOFTMMU one
  target/ppc: Check for USER_ONLY definition instead of SOFTMMU one
  hw/core/cpu: Check for USER_ONLY definition instead of SOFTMMU one
  accel/tcg: Check for USER_ONLY definition instead of SOFTMMU one
  meson: Alias CONFIG_SOFTMMU -> CONFIG_SYSTEM_ONLY
  meson: Replace CONFIG_SOFTMMU -> CONFIG_SYSTEM_ONLY
  meson: Replace softmmu_ss -> system_ss

 docs/devel/build-system.rst        |  14 +--
 meson.build                        |  15 +--
 accel/tcg/internal.h               |   6 +-
 include/hw/core/cpu.h              |   4 +-
 include/hw/core/tcg-cpu-ops.h      | 102 ++++++++++----------
 target/m68k/helper.h               |   2 +-
 accel/tcg/cpu-exec.c               |   4 +-
 target/i386/tcg/translate.c        |   3 -
 target/m68k/cpu.c                  |  14 ++-
 target/m68k/helper.c               |   4 +-
 target/m68k/translate.c            |  28 +++---
 target/ppc/cpu_init.c              |  20 ++--
 target/ppc/helper_regs.c           |   6 +-
 target/tricore/helper.c            |   2 -
 accel/meson.build                  |   4 +-
 accel/qtest/meson.build            |   2 +-
 accel/stubs/meson.build            |   2 +-
 accel/tcg/meson.build              |   6 +-
 audio/meson.build                  |   8 +-
 backends/meson.build               |  20 ++--
 backends/tpm/meson.build           |   8 +-
 block/meson.build                  |   6 +-
 block/monitor/meson.build          |   2 +-
 chardev/meson.build                |   2 +-
 disas/meson.build                  |   2 +-
 dump/meson.build                   |   4 +-
 ebpf/meson.build                   |   2 +-
 fsdev/meson.build                  |   4 +-
 gdbstub/meson.build                |  10 +-
 hw/9pfs/meson.build                |   2 +-
 hw/acpi/meson.build                |  10 +-
 hw/adc/meson.build                 |  10 +-
 hw/arm/meson.build                 |   8 +-
 hw/audio/meson.build               |  28 +++---
 hw/block/meson.build               |  28 +++---
 hw/char/meson.build                |  70 +++++++-------
 hw/core/meson.build                |  22 ++---
 hw/cpu/meson.build                 |   6 +-
 hw/cxl/meson.build                 |   4 +-
 hw/display/meson.build             |  76 +++++++--------
 hw/dma/meson.build                 |  32 +++----
 hw/gpio/meson.build                |  26 ++---
 hw/i2c/meson.build                 |   2 +-
 hw/i386/kvm/meson.build            |   2 +-
 hw/ide/meson.build                 |  28 +++---
 hw/input/meson.build               |  32 +++----
 hw/intc/meson.build                |  44 ++++-----
 hw/ipack/meson.build               |   2 +-
 hw/ipmi/meson.build                |   2 +-
 hw/isa/meson.build                 |  18 ++--
 hw/mem/meson.build                 |   8 +-
 hw/misc/macio/meson.build          |   2 +-
 hw/misc/meson.build                | 148 ++++++++++++++---------------
 hw/net/can/meson.build             |  16 ++--
 hw/net/meson.build                 |  96 +++++++++----------
 hw/nubus/meson.build               |   2 +-
 hw/nvme/meson.build                |   2 +-
 hw/nvram/meson.build               |  26 ++---
 hw/pci-bridge/meson.build          |   4 +-
 hw/pci-host/meson.build            |   2 +-
 hw/pci/meson.build                 |   8 +-
 hw/pcmcia/meson.build              |   4 +-
 hw/rdma/meson.build                |   2 +-
 hw/remote/meson.build              |   2 +-
 hw/rtc/meson.build                 |  28 +++---
 hw/scsi/meson.build                |   2 +-
 hw/sd/meson.build                  |  24 ++---
 hw/sensor/meson.build              |  18 ++--
 hw/smbios/meson.build              |   6 +-
 hw/ssi/meson.build                 |  26 ++---
 hw/timer/meson.build               |  74 +++++++--------
 hw/tpm/meson.build                 |  14 +--
 hw/usb/meson.build                 |  74 +++++++--------
 hw/virtio/meson.build              |  12 +--
 hw/watchdog/meson.build            |  18 ++--
 hw/xen/meson.build                 |   4 +-
 migration/meson.build              |  12 +--
 monitor/meson.build                |   6 +-
 net/can/meson.build                |   2 +-
 net/meson.build                    |  38 ++++----
 qapi/meson.build                   |   2 +-
 qom/meson.build                    |   2 +-
 replay/meson.build                 |   2 +-
 semihosting/meson.build            |   2 +-
 softmmu/meson.build                |  12 +--
 stats/meson.build                  |   2 +-
 target/alpha/meson.build           |   6 +-
 target/arm/hvf/meson.build         |   2 +-
 target/arm/meson.build             |   6 +-
 target/arm/tcg/meson.build         |   2 +-
 target/avr/meson.build             |   6 +-
 target/cris/meson.build            |   6 +-
 target/hppa/meson.build            |   6 +-
 target/i386/hax/meson.build        |   6 +-
 target/i386/hvf/meson.build        |   2 +-
 target/i386/kvm/meson.build        |   4 +-
 target/i386/meson.build            |   8 +-
 target/i386/nvmm/meson.build       |   4 +-
 target/i386/tcg/sysemu/meson.build |   2 +-
 target/i386/whpx/meson.build       |   2 +-
 target/loongarch/meson.build       |   6 +-
 target/m68k/meson.build            |   6 +-
 target/microblaze/meson.build      |   6 +-
 target/mips/meson.build            |   4 +-
 target/mips/sysemu/meson.build     |   2 +-
 target/mips/tcg/sysemu/meson.build |   2 +-
 target/nios2/meson.build           |   6 +-
 target/openrisc/meson.build        |   6 +-
 target/ppc/meson.build             |  10 +-
 target/riscv/meson.build           |   6 +-
 target/s390x/kvm/meson.build       |   2 +-
 target/s390x/meson.build           |   6 +-
 target/sh4/meson.build             |   6 +-
 target/sparc/meson.build           |   6 +-
 target/tricore/meson.build         |   4 +-
 target/xtensa/meson.build          |   6 +-
 tcg/meson.build                    |   2 +-
 trace/meson.build                  |   2 +-
 ui/meson.build                     |  30 +++---
 119 files changed, 816 insertions(+), 824 deletions(-)

-- 
2.38.1


