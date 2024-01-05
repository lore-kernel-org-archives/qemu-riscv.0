Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F95C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:43:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmLw-0004EP-6g; Fri, 05 Jan 2024 10:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmLs-0004Cy-3i
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmLo-0002us-9H
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:14 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-337520892f7so388506f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469390; x=1705074190; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GSOT+lEi5AuW4r0IW5SvW5ThfdMzHSU7KJgpnCVspg4=;
 b=N8XkDgsTwRilNf01QxGynJFUxeEX3VOqa0Wth0N8td/shoxYqokGGX8vGb4VPuWLm6
 yP4lGUcJ5YOvsjsYhXC3Dx21cHa7mhPuo8oGZowsbJ4fQtrcmHC37yhZ2XTHJxhMo4UV
 P/wbr8jbomFN+YJq0KmWgvQRgkFR2p8MFfz0Dpl9y3GGQzrVfHGkBcZRj20O0u11JJYw
 XgzJeAeM63ai5yTrL3SyLVBHvQ16/KT9qfIgfYqrgWS15BJ+AvmYrBqKvoFzQRsCBHaS
 qjDH8S4JG1iJT3thKEdozoXAh1eSOU2C5Xw8ztEVmyus3Js5PMEbyuyskPzMRVcQH1vv
 7jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469390; x=1705074190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GSOT+lEi5AuW4r0IW5SvW5ThfdMzHSU7KJgpnCVspg4=;
 b=Xdxy5kIr6zdU7SAITFEpSDiNpO7vmqelM9OVLSK8OrKPoDREdMIqDn7h0GivvBOSjc
 zsjEGLv0lxklU+WQ/+8bqflz97Ak+f3dSfW3DSYg2Af3fxqqE1JJ55UHT5/VUBRB5WqV
 kd0tEdgUg6kboPdEQ42ICSPfrs90OqJCeDqHw1Z+XvxmRPg4J1XvA6RepclBmwDiEePr
 1XLEu8NAdFjm+3KCkWpFs91N4sRJfTYjgRmi1shnx2RWODcULvkq0OEg9nszJK3jo+zK
 0CRGaY6Dkz1yH5XAmN4VyNUrSIxQMBcbS51XqZWaLrvBMG7xaIj+yHdjJzobRDYweyYl
 bALg==
X-Gm-Message-State: AOJu0YzwxHnFYhxR5frlFMYMzDAxnofT7pnG1g6BO7KInCSohvYICr6z
 fSj2ZEFAL/dMorWLZJRL9+RrDM0k7VSubg==
X-Google-Smtp-Source: AGHT+IEq4WdRaLTqw6idNBC9mfLpIsGWsArF6GCLhU4oDm8dAapoF7oZ8e8om+DVim5nL/ERmxNDAQ==
X-Received: by 2002:a05:600c:4e86:b0:40c:7120:2fac with SMTP id
 f6-20020a05600c4e8600b0040c71202facmr1248444wmq.126.1704469390489; 
 Fri, 05 Jan 2024 07:43:10 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0040d772030c2sm1873937wmp.44.2024.01.05.07.43.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:43:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/71] HW core patches for 2024-01-05
Date: Fri,  5 Jan 2024 16:41:53 +0100
Message-ID: <20240105154307.21385-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

The following changes since commit 05470c3979d5485003e129ff4b0c2ef98af91d86:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2024-01-04 19:55:20 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/hw-cpus-20240105

for you to fetch changes up to a318da6b3f6a88e6cfd6953c519def9457e8962f:

  target/sparc: Simplify qemu_irq_ack (2024-01-05 16:20:15 +0100)

----------------------------------------------------------------
HW core patch queue

- Unify CPU QOM type checks (Gavin)
- Simplify uses of some CPU related property (Philippe)
  (start-powered-off, ARM reset-cbar and mp-affinity)
- Header and documentation cleanups (Zhao, Philippe)
- Have Memory API return boolean indicating possible error
- Fix frame filter mask in CAN sja1000 model (Pavel)
- QOM embed MCF5206 timer into SoC (Thomas)
- Simplify LEON3 qemu_irq_ack handler (Clément)

----------------------------------------------------------------

Clément Chigot (1):
  target/sparc: Simplify qemu_irq_ack

Gavin Shan (29):
  target/alpha: Remove fallback to ev67 cpu class
  target/hppa: Remove object_class_is_abstract()
  cpu: Add helper cpu_model_from_type()
  cpu: Add generic cpu_list()
  target/alpha: Use generic cpu_list()
  target/arm: Use generic cpu_list()
  target/avr: Use generic cpu_list()
  target/cris: Use generic cpu_list()
  target/hexagon: Use generic cpu_list()
  target/hppa: Use generic cpu_list()
  target/loongarch: Use generic cpu_list()
  target/m68k: Use generic cpu_list()
  target/mips: Use generic cpu_list()
  target/openrisc: Use generic cpu_list()
  target/riscv: Use generic cpu_list()
  target/rx: Use generic cpu_list()
  target/sh4: Use generic cpu_list()
  target/tricore: Use generic cpu_list()
  target/xtensa: Use generic cpu_list()
  target: Use generic cpu_model_from_type()
  machine: Use error handling when CPU type is checked
  machine: Introduce helper is_cpu_type_supported()
  machine: Improve is_cpu_type_supported()
  machine: Print CPU model name instead of CPU type
  hw/arm/virt: Hide host CPU model for tcg
  hw/arm/virt: Check CPU type in machine_run_board_init()
  hw/arm/sbsa-ref: Check CPU type in machine_run_board_init()
  hw/arm: Check CPU type in machine_run_board_init()
  hw/riscv/shakti_c: Check CPU type in machine_run_board_init()

Pavel Pisa (1):
  hw/net/can/sja1000: fix bug for single acceptance filter and standard
    frame

Philippe Mathieu-Daudé (37):
  meson: Allow building binary with no target-specific files in hw/
  cpu: Call object_class_dynamic_cast() once in cpu_class_by_name()
  hw/core: Add machine_class_default_cpu_type()
  hw/core/cpu: Remove final vestiges of dynamic state tracing
  hw/core/cpu: Update description of CPUState::node
  hw/audio/sb16: Do not migrate qdev properties
  hw/arm/bcm2836: Simplify use of 'reset-cbar' property
  hw/arm/bcm2836: Use ARM_CPU 'mp-affinity' property
  hw/ppc/spapr_cpu_core: Access QDev properties with proper API
  hw: Simplify accesses to the CPUState::'start-powered-off' property
  hw/ppc/xive2_regs: Remove unnecessary 'cpu.h' inclusion
  hw/mips: Inline 'bios.h' definitions
  memory: Have memory_region_init_ram_flags_nomigrate() return a boolean
  memory: Have memory_region_init_ram_nomigrate() handler return a
    boolean
  memory: Have memory_region_init_rom_nomigrate() handler return a
    boolean
  memory: Simplify memory_region_init_rom_nomigrate() calls
  memory: Simplify memory_region_init_ram_from_fd() calls
  memory: Have memory_region_init_ram() handler return a boolean
  memory: Have memory_region_init_rom() handler return a boolean
  memory: Have memory_region_init_rom_device_nomigrate() return a
    boolean
  memory: Simplify memory_region_init_rom_device_nomigrate() calls
  memory: Have memory_region_init_rom_device() handler return a boolean
  memory: Have memory_region_init_resizeable_ram() return a boolean
  memory: Have memory_region_init_ram_from_file() handler return a
    boolean
  memory: Have memory_region_init_ram_from_fd() handler return a boolean
  backends: Use g_autofree in HostMemoryBackendClass::alloc() handlers
  backends: Simplify host_memory_backend_memory_complete()
  backends: Have HostMemoryBackendClass::alloc() handler return a
    boolean
  backends: Reduce variable scope in host_memory_backend_memory_complete
  util/oslib: Have qemu_prealloc_mem() handler return a boolean
  misc: Simplify qemu_prealloc_mem() calls
  hw: Simplify memory_region_init_ram() calls
  hw/arm: Simplify memory_region_init_rom() calls
  hw/sparc: Simplify memory_region_init_ram_nomigrate() calls
  hw/misc: Simplify memory_region_init_ram_from_fd() calls
  hw/nvram: Simplify memory_region_init_rom_device() calls
  hw/pci-host/raven: Propagate error in raven_realize()

Thomas Huth (1):
  hw/m68k/mcf5206: Embed m5206_timer_state in m5206_mbar_state

Zhao Liu (2):
  hw/cpu/core: Cleanup unused included header in core.c
  hw/cpu/cluster: Cleanup unused included header in cluster.c

 meson.build                           |   8 +-
 include/exec/memory.h                 |  40 +++++--
 include/hw/boards.h                   |   6 ++
 include/hw/core/cpu.h                 |  18 +++-
 include/hw/mips/bios.h                |  14 ---
 include/hw/ppc/xive2_regs.h           |   2 +-
 include/qemu/osdep.h                  |   4 +-
 include/sysemu/hostmem.h              |  10 +-
 linux-user/alpha/target_elf.h         |   2 +-
 target/alpha/cpu.h                    |   3 -
 target/arm/cpu.h                      |   3 -
 target/avr/cpu.h                      |   2 -
 target/cris/cpu.h                     |   3 -
 target/hexagon/cpu.h                  |   3 -
 target/hppa/cpu.h                     |   3 -
 target/loongarch/cpu.h                |   4 -
 target/m68k/cpu.h                     |   4 -
 target/mips/cpu.h                     |   4 -
 target/openrisc/cpu.h                 |   3 -
 target/riscv/cpu.h                    |   2 -
 target/rx/cpu.h                       |   3 -
 target/sh4/cpu.h                      |   3 -
 target/sparc/cpu.h                    |   2 +-
 target/tricore/cpu.h                  |   4 -
 target/xtensa/cpu.h                   |   3 -
 backends/hostmem-epc.c                |  14 ++-
 backends/hostmem-file.c               |  22 ++--
 backends/hostmem-memfd.c              |  13 ++-
 backends/hostmem-ram.c                |  12 +--
 backends/hostmem.c                    | 144 ++++++++++++--------------
 bsd-user/main.c                       |   5 +-
 cpu-target.c                          |  44 +++++++-
 hw/arm/armsse.c                       |   6 +-
 hw/arm/armv7m.c                       |   8 +-
 hw/arm/aspeed_ast2400.c               |   6 +-
 hw/arm/aspeed_ast2600.c               |   6 +-
 hw/arm/bananapi_m2u.c                 |  12 +--
 hw/arm/bcm2836.c                      |  18 ++--
 hw/arm/cubieboard.c                   |  12 +--
 hw/arm/fsl-imx25.c                    |  19 ++--
 hw/arm/fsl-imx31.c                    |  19 ++--
 hw/arm/fsl-imx6.c                     |  19 ++--
 hw/arm/integratorcp.c                 |   7 +-
 hw/arm/mps2-tz.c                      |  26 +++--
 hw/arm/mps2.c                         |  26 +++--
 hw/arm/msf2-som.c                     |  12 +--
 hw/arm/musca.c                        |  12 +--
 hw/arm/npcm7xx_boards.c               |  12 +--
 hw/arm/nrf51_soc.c                    |   7 +-
 hw/arm/orangepi.c                     |  12 +--
 hw/arm/sbsa-ref.c                     |  36 ++-----
 hw/arm/virt.c                         |  60 ++++-------
 hw/audio/sb16.c                       |  10 +-
 hw/core/cpu-common.c                  |   8 +-
 hw/core/machine.c                     | 103 +++++++++++-------
 hw/cpu/cluster.c                      |   5 +-
 hw/cpu/core.c                         |   9 +-
 hw/m68k/mcf5206.c                     |  20 ++--
 hw/mips/cps.c                         |   7 +-
 hw/mips/jazz.c                        |  10 +-
 hw/mips/malta.c                       |   9 +-
 hw/mips/mipssim.c                     |  10 +-
 hw/misc/ivshmem.c                     |   8 +-
 hw/net/can/can_sja1000.c              |   2 +-
 hw/nvram/nrf51_nvm.c                  |   7 +-
 hw/pci-host/raven.c                   |   6 +-
 hw/ppc/e500.c                         |   2 +-
 hw/ppc/rs6000_mc.c                    |   7 +-
 hw/ppc/spapr_cpu_core.c               |   2 +-
 hw/riscv/shakti_c.c                   |  13 ++-
 hw/sparc/leon3.c                      |   8 +-
 hw/sparc/sun4m.c                      |  23 ++--
 hw/sparc64/sun4u.c                    |   7 +-
 hw/virtio/virtio-mem.c                |   6 +-
 system/memory.c                       |  69 +++++++-----
 system/vl.c                           |   2 +-
 target/alpha/cpu.c                    |  23 ----
 target/arm/arm-qmp-cmds.c             |   3 +-
 target/arm/cpu.c                      |   4 +-
 target/arm/helper.c                   |  46 --------
 target/avr/cpu.c                      |  23 +---
 target/cris/cpu.c                     |  42 +-------
 target/hexagon/cpu.c                  |  24 +----
 target/hppa/cpu.c                     |  32 +-----
 target/i386/cpu.c                     |   3 +-
 target/loongarch/cpu.c                |  23 +---
 target/loongarch/loongarch-qmp-cmds.c |   3 +-
 target/m68k/cpu.c                     |   4 +-
 target/m68k/helper.c                  |  40 -------
 target/mips/sysemu/mips-qmp-cmds.c    |   3 +-
 target/openrisc/cpu.c                 |  46 +-------
 target/ppc/cpu_init.c                 |   3 +-
 target/ppc/ppc-qmp-cmds.c             |   3 +-
 target/riscv/cpu.c                    |  36 +------
 target/riscv/riscv-qmp-cmds.c         |   3 +-
 target/rx/cpu.c                       |  16 ---
 target/sh4/cpu.c                      |  17 ---
 target/sparc/int32_helper.c           |   2 +-
 target/tricore/cpu.c                  |   4 +-
 target/tricore/helper.c               |  22 ----
 target/xtensa/cpu.c                   |   4 +-
 target/xtensa/helper.c                |   9 --
 util/oslib-posix.c                    |   7 +-
 util/oslib-win32.c                    |   4 +-
 target/mips/cpu-defs.c.inc            |   9 --
 105 files changed, 576 insertions(+), 977 deletions(-)
 delete mode 100644 include/hw/mips/bios.h

-- 
2.41.0


