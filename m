Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109BEC83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 12:58:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhEL-0002Dv-R4; Thu, 31 Aug 2023 08:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEJ-0002DH-RB
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:56:59 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhED-000527-AW
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:56:59 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401da71b85eso7269955e9.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486608; x=1694091408; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+jnFtIYkbkrfE0MLO5x3DuHTjGy4+uBY4BoKz1fGHss=;
 b=YeelZHF5na2KPnISP0Q/GYuza52rq0HA3Jsyi1VyJ9lJhnmq7ebNewSvywlCs5tZKD
 Ko/Y0UcSEjuUhsbgcDFTqBVTTQjg/l6YR1+quxH4XQ2pWrNoUiUb/vPblxU4Eb0YMTaO
 WEXtKuC45kC5HMd9tuYNMNJvwXp1SKKsdcHmMGfBvOyhYblFKpMZcTS56/sNPz9As6mS
 8MK0iNZmGZZRf409roaRYNYnXgqyP1xkciC9Av+fcGwjy1rHxrPAGKaNKBDB9F9K73Ja
 A4IXeSmzlL9zXwImlgQsFLDhLvtxrFhesvFtZ4pqItnpLsCY1qRZ6OJP3UfUGsynSG0y
 C56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486608; x=1694091408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+jnFtIYkbkrfE0MLO5x3DuHTjGy4+uBY4BoKz1fGHss=;
 b=KOXiQhlNqJ8Z4Zg9xh2/s5CHfgmU+GkIwLz+ZCJa3oRBjT1WwYMS51d5xctDYMpnNh
 i8/91PWI+kTh66bKcfk7qunlimrbHj38UzqBSVZVvxjHWSIC9iT9Jm0+zZTuHPeNuVJn
 a70gUrFbLPtl+XaWn2KKx122NuJBdq58Rcm9Lk+Bel4AUgNhx9xVEum9kPahoqJ4g35G
 v13joI/3z/D46DF2AVrsfeRk2sifzMU4abvVqnrbkE4fFfPLwVa8QnnqQtnVcLadsaDS
 xpleSYDPsc92Uw1k+A1B2uy9BjAs6wmF0Ae7xyoxz18XrjW7jGqTjAOYdxXWIZ1BkyWK
 avow==
X-Gm-Message-State: AOJu0YzL94S96yZR2TJZGcu9zR0P67nOG9RizzTgGmemUtis5aSlw4nm
 sgGlIGjtmbmuohrR+lDjUXKsXQ==
X-Google-Smtp-Source: AGHT+IHBgoyRiwSsl2JJV395CKgxT45LmNBHDy8wqpv5iuGh4e46CEazMQWG2yHyKGOmonvAaRh1Lw==
X-Received: by 2002:a7b:c394:0:b0:401:b307:7ba5 with SMTP id
 s20-20020a7bc394000000b00401b3077ba5mr4237124wmj.6.1693486608364; 
 Thu, 31 Aug 2023 05:56:48 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c20cb00b003fc02e8ea68sm5032034wmm.13.2023.08.31.05.56.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:56:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/41] Misc patches for 2023-08-31
Date: Thu, 31 Aug 2023 14:56:02 +0200
Message-ID: <20230831125646.67855-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

The following changes since commit 156618d9ea67f2f2e31d9dedd97f2dcccbe6808c:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-08-30 09:20:27 -0400)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/misc-20230831

for you to fetch changes up to b4283914d64b2486c1fc1938280ee7041a569159:

  tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc (2023-08-31 14:51:12 +0200)

----------------------------------------------------------------
Misc patches queue

Overall cleanups:
- Do not declare function prototypes using 'extern' keyword
- Remove unmaintained HAX accelerator
- Have FEWatchFunc handlers return G_SOURCE_CONTINUE/REMOVE instead of boolean
- Avoid modifying QOM class internals from instance in pmbus_device
- Avoid variable-length array in xhci_get_port_bandwidth
- Remove unuseful kvmclock_create() stub
- Style: permit inline loop variables
- Various header cleanups
- Various spelling fixes

Build fixes:
- Fix MESONINTROSPECT parsing
- Only define OS_OBJECT_USE_OBJC with gcc

----------------------------------------------------------------

Akihiko Odaki (1):
  meson: Fix MESONINTROSPECT parsing

Alex Bennée (1):
  docs/style: permit inline loop variables

Alexander Graf (1):
  build: Only define OS_OBJECT_USE_OBJC with gcc

Michael Tokarev (9):
  accel/tcg: spelling fixes
  hw/i2c: spelling fixes
  hw/ide: spelling fixes
  hw/display: spelling fixes
  hw/mips: spelling fixes
  hw/sd: spelling fixes
  hw/usb: spelling fixes
  util: spelling fixes
  ui: spelling fixes

Peter Maydell (1):
  hw/usb/hcd-xhci: Avoid variable-length array in
    xhci_get_port_bandwidth()

Philippe Mathieu-Daudé (28):
  accel: Remove HAX accelerator
  qemu/uri: Use QueryParams type definition
  bulk: Do not declare function prototypes using 'extern' keyword
  hw/net/i82596: Include missing 'exec/address-spaces.h' header
  hw/dma/etraxfs: Include missing 'exec/memory.h' header
  exec/address-spaces.h: Remove unuseful 'exec/memory.h' include
  target/ppc/pmu: Include missing 'qemu/timer.h' header
  target/riscv/pmu: Restrict 'qemu/log.h' include to source
  target/translate: Include missing 'exec/cpu_ldst.h' header
  target/translate: Remove unnecessary 'exec/cpu_ldst.h' header
  target/translate: Restrict 'exec/cpu_ldst.h' to user emulation
  target/helpers: Remove unnecessary 'exec/cpu_ldst.h' header
  target/helpers: Remove unnecessary 'qemu/main-loop.h' header
  target/mips: Remove unused headers in lcsr_helper.c
  target/xtensa: Include missing 'qemu/atomic.h' header
  qemu/processor: Remove unused 'qemu/atomic.h' header
  exec/translation-block: Clean up includes
  chardev/char-fe: Document FEWatchFunc typedef
  hw/char: Have FEWatchFunc handlers return G_SOURCE_CONTINUE/REMOVE
  hw/char/pl011: Restrict MemoryRegionOps implementation access sizes
  hw/char/pl011: Display register name in trace events
  hw/char/pl011: Remove duplicated PL011_INT_[RT]X definitions
  hw/char/pl011: Replace magic values by register field definitions
  hw/i2c/pmbus_device: Fix modifying QOM class internals from instance
  hw/i386: Remove unuseful kvmclock_create() stub
  hw/i386: Rename 'hw/kvm/clock.h' -> 'hw/i386/kvm/clock.h'
  util/fifo8: Fix typo in fifo8_push_all() description
  tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc

 MAINTAINERS                                   |    8 -
 docs/about/build-platforms.rst                |    2 +-
 docs/about/deprecated.rst                     |    6 -
 docs/about/index.rst                          |    2 +-
 docs/about/removed-features.rst               |   11 +-
 docs/devel/style.rst                          |    9 +-
 docs/system/index.rst                         |    2 +-
 docs/system/introduction.rst                  |    3 -
 meson.build                                   |   11 +-
 bsd-user/bsd-file.h                           |    6 +-
 crypto/hmacpriv.h                             |   13 +-
 {include/hw => hw/i386}/kvm/clock.h           |   14 +-
 hw/ide/ahci_internal.h                        |    4 +-
 hw/usb/quirks.h                               |    2 +-
 hw/xen/xen_pt.h                               |    8 +-
 include/chardev/char-fe.h                     |   14 +
 include/crypto/secret_common.h                |   14 +-
 include/elf.h                                 |    4 +-
 include/exec/address-spaces.h                 |    2 -
 include/exec/exec-all.h                       |    2 +-
 include/exec/page-vary.h                      |    4 +-
 include/exec/poison.h                         |    1 -
 include/exec/translation-block.h              |    6 +-
 include/hw/core/cpu.h                         |    2 +-
 include/hw/core/tcg-cpu-ops.h                 |    2 +-
 include/hw/i2c/npcm7xx_smbus.h                |    2 +-
 include/hw/misc/aspeed_scu.h                  |    2 +-
 include/hw/misc/auxbus.h                      |    2 +-
 include/hw/nvram/npcm7xx_otp.h                |    4 +-
 include/hw/qdev-core.h                        |    4 +-
 include/io/channel-socket.h                   |    4 +-
 include/io/task.h                             |    2 +-
 include/qemu/crc-ccitt.h                      |    4 +-
 include/qemu/fifo8.h                          |    2 +-
 include/qemu/iova-tree.h                      |    4 +-
 include/qemu/osdep.h                          |    4 +-
 include/qemu/processor.h                      |    2 -
 include/qemu/rcu.h                            |   14 +-
 include/qemu/sys_membarrier.h                 |    4 +-
 include/qemu/uri.h                            |    6 +-
 include/qemu/yank.h                           |    2 +-
 include/sysemu/accel-blocker.h                |   14 +-
 include/sysemu/hax.h                          |   49 -
 include/sysemu/hw_accel.h                     |    1 -
 include/sysemu/os-win32.h                     |    4 +-
 include/tcg/helper-info.h                     |    2 +-
 include/tcg/tcg.h                             |    4 +-
 include/ui/kbd-state.h                        |    2 +-
 include/ui/spice-display.h                    |    2 +-
 include/user/safe-syscall.h                   |    6 +-
 target/i386/hax/hax-accel-ops.h               |   31 -
 target/i386/hax/hax-i386.h                    |   98 --
 target/i386/hax/hax-interface.h               |  369 ------
 target/i386/hax/hax-posix.h                   |   61 -
 target/i386/hax/hax-windows.h                 |   88 --
 target/i386/sev.h                             |    6 +-
 target/mips/cpu.h                             |    4 +-
 target/riscv/pmu.h                            |    3 -
 tcg/tcg-internal.h                            |    4 +-
 ui/keymaps.h                                  |    2 +-
 ui/vnc-enc-zywrle.h                           |    4 +-
 include/exec/memory_ldst.h.inc                |   42 +-
 accel/stubs/hax-stub.c                        |   24 -
 accel/tcg/tb-maint.c                          |    2 +-
 contrib/plugins/cache.c                       |    2 +-
 contrib/plugins/lockstep.c                    |    2 +-
 hw/char/cadence_uart.c                        |    8 +-
 hw/char/cmsdk-apb-uart.c                      |    6 +-
 hw/char/ibex_uart.c                           |    8 +-
 hw/char/nrf51_uart.c                          |    4 +-
 hw/char/pl011.c                               |   58 +-
 hw/char/serial.c                              |    2 +-
 hw/char/virtio-console.c                      |    2 +-
 hw/display/bochs-display.c                    |    2 +-
 hw/display/qxl.c                              |    2 +-
 hw/display/ssd0303.c                          |    2 +-
 hw/display/ssd0323.c                          |    2 +-
 hw/display/xlnx_dp.c                          |    2 +-
 hw/dma/etraxfs_dma.c                          |    1 +
 hw/i2c/pm_smbus.c                             |    2 +-
 hw/i2c/pmbus_device.c                         |   19 +-
 hw/i2c/smbus_slave.c                          |    2 +-
 hw/i386/kvm/clock.c                           |    6 +-
 hw/i386/microvm.c                             |    6 +-
 hw/i386/pc_piix.c                             |    4 +-
 hw/i386/pc_q35.c                              |    6 +-
 hw/ide/cmd646.c                               |    2 +-
 hw/ide/core.c                                 |    2 +-
 hw/intc/apic_common.c                         |    3 +-
 hw/mips/malta.c                               |    2 +-
 hw/net/i82596.c                               |    1 +
 hw/sd/sd.c                                    |    2 +-
 hw/sd/sdhci.c                                 |    2 +-
 hw/sensor/isl_pmbus_vr.c                      |    2 +-
 hw/sensor/max34451.c                          |    2 +-
 hw/usb/ccid-card-emulated.c                   |    2 +-
 hw/usb/hcd-ehci.c                             |    6 +-
 hw/usb/hcd-ohci.c                             |    2 +-
 hw/usb/hcd-xhci.c                             |   10 +-
 hw/usb/redirect.c                             |    4 +-
 hw/usb/xen-usb.c                              |    2 +-
 hw/xtensa/pic_cpu.c                           |    1 +
 linux-user/flatload.c                         |    2 +-
 linux-user/syscall.c                          |    4 +-
 monitor/monitor.c                             |    2 +-
 net/vhost-user.c                              |    2 +-
 semihosting/config.c                          |    2 +-
 semihosting/syscalls.c                        |    4 +-
 softmmu/cpus.c                                |    6 -
 softmmu/icount.c                              |    2 +-
 softmmu/ioport.c                              |    2 +-
 softmmu/vl.c                                  |    6 -
 target/alpha/translate.c                      |    1 -
 target/avr/helper.c                           |    1 +
 target/cris/op_helper.c                       |    1 -
 target/hexagon/translate.c                    |    1 -
 target/hppa/translate.c                       |    1 -
 target/i386/hax/hax-accel-ops.c               |  105 --
 target/i386/hax/hax-all.c                     | 1141 -----------------
 target/i386/hax/hax-mem.c                     |  323 -----
 target/i386/hax/hax-posix.c                   |  305 -----
 target/i386/hax/hax-windows.c                 |  485 -------
 target/i386/tcg/fpu_helper.c                  |    1 +
 target/i386/tcg/sysemu/excp_helper.c          |    1 +
 target/loongarch/cpu.c                        |    1 +
 target/loongarch/iocsr_helper.c               |    1 -
 target/loongarch/op_helper.c                  |    1 -
 target/m68k/translate.c                       |    1 -
 target/microblaze/translate.c                 |    1 -
 target/mips/tcg/fpu_helper.c                  |    1 -
 target/mips/tcg/ldst_helper.c                 |    1 +
 target/mips/tcg/msa_helper.c                  |   13 +-
 target/mips/tcg/mxu_translate.c               |    6 +-
 target/mips/tcg/sysemu/lcsr_helper.c          |    5 -
 target/nios2/op_helper.c                      |    1 -
 target/nios2/translate.c                      |    1 -
 target/openrisc/translate.c                   |    1 -
 target/ppc/int_helper.c                       |    1 -
 target/ppc/machine.c                          |    1 -
 target/ppc/mem_helper.c                       |    1 -
 target/ppc/mmu_common.c                       |    1 -
 target/ppc/mmu_helper.c                       |    1 -
 target/ppc/power8-pmu.c                       |    2 +-
 target/ppc/translate.c                        |    2 -
 target/riscv/csr.c                            |    1 -
 target/riscv/m128_helper.c                    |    1 -
 target/riscv/op_helper.c                      |    2 +-
 target/riscv/pmu.c                            |    1 +
 target/riscv/vector_helper.c                  |    1 +
 target/s390x/tcg/crypto_helper.c              |    1 -
 target/s390x/tcg/excp_helper.c                |    1 -
 target/s390x/tcg/fpu_helper.c                 |    1 -
 target/s390x/tcg/misc_helper.c                |    1 -
 target/sh4/translate.c                        |    1 -
 target/sparc/translate.c                      |    1 -
 target/xtensa/dbg_helper.c                    |    1 -
 target/xtensa/exc_helper.c                    |    1 +
 target/xtensa/fpu_helper.c                    |    1 -
 target/xtensa/mmu_helper.c                    |    2 -
 target/xtensa/op_helper.c                     |    3 +-
 target/xtensa/win_helper.c                    |    1 -
 tests/tcg/aarch64/bti-1.c                     |    2 +-
 tests/tcg/aarch64/bti-3.c                     |    2 +-
 ui/sdl2-2d.c                                  |    2 +-
 ui/sdl2.c                                     |    2 +-
 util/cpuinfo-aarch64.c                        |    4 +-
 util/cpuinfo-i386.c                           |    4 +-
 util/cpuinfo-ppc.c                            |    2 +-
 util/main-loop.c                              |    2 +-
 util/oslib-posix.c                            |    2 +-
 util/qdist.c                                  |    2 +-
 util/qemu-sockets.c                           |    2 +-
 util/rcu.c                                    |    2 +-
 target/mips/cpu-defs.c.inc                    |    2 +-
 .../aarch64/{bti-crt.inc.c => bti-crt.c.inc}  |    0
 ui/vnc-enc-zrle.c.inc                         |    2 +-
 accel/Kconfig                                 |    3 -
 accel/stubs/meson.build                       |    1 -
 hw/char/trace-events                          |    4 +-
 hw/usb/trace-events                           |    2 +-
 meson_options.txt                             |    2 -
 qemu-options.hx                               |    8 +-
 .../ci/org.centos/stream/8/x86_64/configure   |    1 -
 scripts/meson-buildoptions.sh                 |    3 -
 scripts/symlink-install-tree.py               |    3 +-
 target/i386/hax/meson.build                   |    7 -
 target/i386/meson.build                       |    1 -
 ui/cocoa.m                                    |    2 +-
 188 files changed, 317 insertions(+), 3443 deletions(-)
 rename {include/hw => hw/i386}/kvm/clock.h (65%)
 delete mode 100644 include/sysemu/hax.h
 delete mode 100644 target/i386/hax/hax-accel-ops.h
 delete mode 100644 target/i386/hax/hax-i386.h
 delete mode 100644 target/i386/hax/hax-interface.h
 delete mode 100644 target/i386/hax/hax-posix.h
 delete mode 100644 target/i386/hax/hax-windows.h
 delete mode 100644 accel/stubs/hax-stub.c
 delete mode 100644 target/i386/hax/hax-accel-ops.c
 delete mode 100644 target/i386/hax/hax-all.c
 delete mode 100644 target/i386/hax/hax-mem.c
 delete mode 100644 target/i386/hax/hax-posix.c
 delete mode 100644 target/i386/hax/hax-windows.c
 rename tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} (100%)
 delete mode 100644 target/i386/hax/meson.build

-- 
2.41.0


